Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4020E892
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 00:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E413889FEC;
	Mon, 29 Jun 2020 22:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4089F77
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593470221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9m6zuAeqT4SD33nA6uDyI5NcN7BCoefMwz83aNaP6HY=;
 b=B3DNl7BbSPQX6+uXIAV+l3iWcJhr7JhJsvyvKhJ9XOxytQnFQcsSrx1NQXVC31VNq7jXWy
 fWH9HadFKURdAFZxGdWzY0M3yMDspmqzkrTmfE27jmiFt3yE0oFTnW/MYNIC0XwLfb/U+l
 7ahdcb/8x4acbOmFdysjxM8gS5jxeMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-b5_L5QDSPFqC7ZLuTssy6A-1; Mon, 29 Jun 2020 18:36:57 -0400
X-MC-Unique: b5_L5QDSPFqC7ZLuTssy6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BFD6800D5C;
 Mon, 29 Jun 2020 22:36:55 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-84.rdu2.redhat.com
 [10.10.119.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E12F5D9D7;
 Mon, 29 Jun 2020 22:36:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/kms/nvd9-: Fix disabling CRCs alongside OR
 reprogramming
Date: Mon, 29 Jun 2020 18:36:25 -0400
Message-Id: <20200629223635.103804-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While I had thought I'd tested this before, it looks like this one issue
slipped by my original CRC patches. Basically, there seem to be a few
rules we need to follow when sending CRC commands to the display
controller:

* CRCs cannot be both disabled and enabled for a single head in the same
  flush
* If a head with CRC reporting enabled switches from one OR to another,
  there must be a flush before the OR is re-enabled regardless of the
  final state of CRC reporting.

So, split nv50_crc_atomic_prepare_notifier_contexts() into two
functions:
* nv_crc_atomic_release_notifier_contexts() - checks whether the CRC
  notifier contexts were released successfully after the first flush
* nv_crc_atomic_init_notifier_contexts() - prepares any CRC notifier
  contexts for use before enabling reporting

Additionally, in order to force a flush when we re-assign ORs with heads
that have CRCs enabled we split our atomic check function into two:

* nv50_crc_atomic_check_head() - called from our heads' atomic checks,
  determines whether a state needs to set or clear CRC reporting
* nv50_crc_atomic_check_outp() - called at the end of the atomic check
  after all ORs have been added to the atomic state, and sets
  nv50_atom->flush_disable if needed

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c  | 107 ++++++++++++++++--------
 drivers/gpu/drm/nouveau/dispnv50/crc.h  |  18 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.c |  13 ++-
 drivers/gpu/drm/nouveau/dispnv50/head.c |   2 +-
 4 files changed, 97 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 0b18d9e3a2b96..f17fb6d56757a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -261,7 +261,29 @@ void nv50_crc_atomic_stop_reporting(struct drm_atomic_state *state)
 	}
 }
 
-void nv50_crc_atomic_prepare_notifier_contexts(struct drm_atomic_state *state)
+void nv50_crc_atomic_init_notifier_contexts(struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		struct nv50_head *head = nv50_head(crtc);
+		struct nv50_head_atom *asyh = nv50_head_atom(new_crtc_state);
+		struct nv50_crc *crc = &head->crc;
+		int i;
+
+		if (!asyh->set.crc)
+			continue;
+
+		crc->entry_idx = 0;
+		crc->ctx_changed = false;
+		for (i = 0; i < ARRAY_SIZE(crc->ctx); i++)
+			nv50_crc_reset_ctx(&crc->ctx[i]);
+	}
+}
+
+void nv50_crc_atomic_release_notifier_contexts(struct drm_atomic_state *state)
 {
 	const struct nv50_crc_func *func =
 		nv50_disp(state->dev)->core->func->crc;
@@ -274,22 +296,15 @@ void nv50_crc_atomic_prepare_notifier_contexts(struct drm_atomic_state *state)
 		struct nv50_head_atom *asyh = nv50_head_atom(new_crtc_state);
 		struct nv50_crc *crc = &head->crc;
 		struct nv50_crc_notifier_ctx *ctx = &crc->ctx[crc->ctx_idx];
-		int i;
 
-		if (asyh->clr.crc && asyh->crc.src) {
-			if (crc->ctx_changed) {
-				nv50_crc_wait_ctx_finished(head, func, ctx);
-				ctx = &crc->ctx[crc->ctx_idx ^ 1];
-			}
-			nv50_crc_wait_ctx_finished(head, func, ctx);
-		}
+		if (!asyh->clr.crc)
+			continue;
 
-		if (asyh->set.crc) {
-			crc->entry_idx = 0;
-			crc->ctx_changed = false;
-			for (i = 0; i < ARRAY_SIZE(crc->ctx); i++)
-				nv50_crc_reset_ctx(&crc->ctx[i]);
+		if (crc->ctx_changed) {
+			nv50_crc_wait_ctx_finished(head, func, ctx);
+			ctx = &crc->ctx[crc->ctx_idx ^ 1];
 		}
+		nv50_crc_wait_ctx_finished(head, func, ctx);
 	}
 }
 
@@ -325,16 +340,13 @@ void nv50_crc_atomic_start_reporting(struct drm_atomic_state *state)
 	}
 }
 
-int nv50_crc_atomic_check(struct nv50_head *head,
-			  struct nv50_head_atom *asyh,
-			  struct nv50_head_atom *armh)
+int nv50_crc_atomic_check_head(struct nv50_head *head,
+			       struct nv50_head_atom *asyh,
+			       struct nv50_head_atom *armh)
 {
-	struct drm_atomic_state *state = asyh->state.state;
+	struct nv50_atom *atom = nv50_atom(asyh->state.state);
 	struct drm_device *dev = head->base.base.dev;
-	struct nv50_atom *atom = nv50_atom(state);
 	struct nv50_disp *disp = nv50_disp(dev);
-	struct drm_encoder *encoder;
-	struct nv50_outp_atom *outp_atom;
 	bool changed = armh->crc.src != asyh->crc.src;
 
 	if (!armh->crc.src && !asyh->crc.src) {
@@ -373,27 +385,52 @@ int nv50_crc_atomic_check(struct nv50_head *head,
 			asyh->set.or |= armh->or.crc_raster !=
 					asyh->or.crc_raster;
 
+		if (asyh->clr.crc && asyh->set.crc)
+			atom->flush_disable = true;
+	} else {
+		asyh->set.crc = false;
+		asyh->clr.crc = false;
+	}
+
+	return 0;
+}
+
+void nv50_crc_atomic_check_outp(struct nv50_atom *atom)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
+
+	if (atom->flush_disable)
+		return;
+
+	for_each_oldnew_crtc_in_state(&atom->state, crtc, old_crtc_state,
+				      new_crtc_state, i) {
+		struct nv50_head_atom *armh = nv50_head_atom(old_crtc_state);
+		struct nv50_head_atom *asyh = nv50_head_atom(new_crtc_state);
+		struct nv50_outp_atom *outp_atom;
+		struct nouveau_encoder *outp =
+			nv50_real_outp(nv50_head_atom_get_encoder(armh));
+		struct drm_encoder *encoder = &outp->base.base;
+
+		if (!asyh->clr.crc)
+			continue;
+
 		/*
-		 * If we're reprogramming our OR, we need to flush the CRC
-		 * disable first
+		 * Re-programming ORs can't be done in the same flush as
+		 * disabling CRCs
 		 */
-		if (asyh->clr.crc) {
-			encoder = nv50_head_atom_get_encoder(armh);
-
-			list_for_each_entry(outp_atom, &atom->outp, head) {
-				if (outp_atom->encoder == encoder) {
-					if (outp_atom->set.mask)
-						atom->flush_disable = true;
+		list_for_each_entry(outp_atom, &atom->outp, head) {
+			if (outp_atom->encoder == encoder) {
+				if (outp_atom->set.mask) {
+					atom->flush_disable = true;
+					return;
+				} else {
 					break;
 				}
 			}
 		}
-	} else {
-		asyh->set.crc = false;
-		asyh->clr.crc = false;
 	}
-
-	return 0;
 }
 
 static enum nv50_crc_source_type
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
index 2d588bb7f65a6..6b5a478f113c4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -10,6 +10,7 @@
 #include <nvkm/subdev/bios.h>
 #include "nouveau_encoder.h"
 
+struct nv50_atom;
 struct nv50_disp;
 struct nv50_head;
 
@@ -82,10 +83,12 @@ int nv50_crc_verify_source(struct drm_crtc *, const char *, size_t *);
 const char *const *nv50_crc_get_sources(struct drm_crtc *, size_t *);
 int nv50_crc_set_source(struct drm_crtc *, const char *);
 
-int nv50_crc_atomic_check(struct nv50_head *, struct nv50_head_atom *,
-			  struct nv50_head_atom *);
+int nv50_crc_atomic_check_head(struct nv50_head *, struct nv50_head_atom *,
+			       struct nv50_head_atom *);
+void nv50_crc_atomic_check_outp(struct nv50_atom *atom);
 void nv50_crc_atomic_stop_reporting(struct drm_atomic_state *);
-void nv50_crc_atomic_prepare_notifier_contexts(struct drm_atomic_state *);
+void nv50_crc_atomic_init_notifier_contexts(struct drm_atomic_state *);
+void nv50_crc_atomic_release_notifier_contexts(struct drm_atomic_state *);
 void nv50_crc_atomic_start_reporting(struct drm_atomic_state *);
 void nv50_crc_atomic_set(struct nv50_head *, struct nv50_head_atom *);
 void nv50_crc_atomic_clr(struct nv50_head *);
@@ -108,12 +111,15 @@ static inline void
 nv50_crc_handle_vblank(struct nv50_head *head) { return 0; }
 
 static inline int
-nv50_crc_atomic_check(struct nv50_head *, struct nv50_head_atom *,
-		      struct nv50_head_atom *) {}
+nv50_crc_atomic_check_head(struct nv50_head *, struct nv50_head_atom *,
+			   struct nv50_head_atom *) {}
+static inline void nv50_crc_atomic_check_outp(struct nv50_atom *atom) {}
 static inline void
 nv50_crc_atomic_stop_reporting(struct drm_atomic_state *) {}
 static inline void
-nv50_crc_atomic_prepare_notifier_contexts(struct drm_atomic_state *) {}
+nv50_crc_atomic_init_notifier_contexts(struct drm_atomic_state *) {}
+static inline void
+nv50_crc_atomic_release_notifier_contexts(struct drm_atomic_state *) {}
 static inline void
 nv50_crc_atomic_start_reporting(struct drm_atomic_state *) {}
 static inline void
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9cb06d6d6c3fb..cd71b9876c8ae 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1943,6 +1943,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	struct nv50_outp_atom *outp, *outt;
 	u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {};
 	int i;
+	bool flushed = false;
 
 	NV_ATOMIC(drm, "commit %d %d\n", atom->lock_core, atom->flush_disable);
 	nv50_crc_atomic_stop_reporting(state);
@@ -2003,6 +2004,8 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 				nv50_disp_atomic_commit_wndw(state, interlock);
 				nv50_disp_atomic_commit_core(state, interlock);
 				memset(interlock, 0x00, sizeof(interlock));
+
+				flushed = true;
 			}
 		}
 	}
@@ -2013,10 +2016,14 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			nv50_disp_atomic_commit_wndw(state, interlock);
 			nv50_disp_atomic_commit_core(state, interlock);
 			memset(interlock, 0x00, sizeof(interlock));
+
+			flushed = true;
 		}
 	}
 
-	nv50_crc_atomic_prepare_notifier_contexts(state);
+	if (flushed)
+		nv50_crc_atomic_release_notifier_contexts(state);
+	nv50_crc_atomic_init_notifier_contexts(state);
 
 	/* Update output path(s). */
 	list_for_each_entry_safe(outp, outt, &atom->outp, head) {
@@ -2132,6 +2139,8 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	nv50_crc_atomic_start_reporting(state);
+	if (!flushed)
+		nv50_crc_atomic_release_notifier_contexts(state);
 	drm_atomic_helper_commit_hw_done(state);
 	drm_atomic_helper_cleanup_planes(dev, state);
 	drm_atomic_helper_commit_cleanup_done(state);
@@ -2338,6 +2347,8 @@ nv50_disp_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
+	nv50_crc_atomic_check_outp(atom);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index ea3088a47065e..9a10ec267d1fa 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -414,7 +414,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
 		asyh->set.curs = asyh->curs.visible;
 	}
 
-	ret = nv50_crc_atomic_check(head, asyh, armh);
+	ret = nv50_crc_atomic_check_head(head, asyh, armh);
 	if (ret)
 		return ret;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
