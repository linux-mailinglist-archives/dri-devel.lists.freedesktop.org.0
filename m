Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ECF2FAE70
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 02:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68236E7E2;
	Tue, 19 Jan 2021 01:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8B46E7E5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 01:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611021054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cjfJOWJhFX6trANVsjiZmWN/TFf+8jFOlFGgqzhQ6s=;
 b=Lf8Yqde35jJQNDIb6OSU4//NzzdEpdG0Lb6ipiZGa9MipsrptgB5q94vcGRPwti6xZwJHZ
 TmCf2rLSThclMFbk++uuav8fv+3wZzJDVzmckW32e5t4uTroY+g/s4uJRNA8Zr7Lsl7yYg
 xqKZE2RzwJQDOBln15D8hReprY2tNhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-rbXNFyMFMTGRs7fVyKod0A-1; Mon, 18 Jan 2021 20:50:50 -0500
X-MC-Unique: rbXNFyMFMTGRs7fVyKod0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1CB58066E6;
 Tue, 19 Jan 2021 01:50:48 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-206.rdu2.redhat.com
 [10.10.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE0211F471;
 Tue, 19 Jan 2021 01:50:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 3/5] drm/nouveau/kms/nv140-: Use hard-coded wndws or core
 channel for CRC channel
Date: Mon, 18 Jan 2021 20:48:47 -0500
Message-Id: <20210119014849.2509965-4-lyude@redhat.com>
In-Reply-To: <20210119014849.2509965-1-lyude@redhat.com>
References: <20210119014849.2509965-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally it was assumed based on Nvidia's open-gpu-docs and testing that
NVDisplay required that at least one wndw which belongs to a given head to be
used as the controlling channel
(NVC37D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL) in order for CRC capture to
function. While this is the case on Volta, Turing actually adds the ability to
instead use the core channel as the controlling channel. For Turing this is
quite useful, as it means that we can always default to the core channel as the
controlling channel and we don't need to be concerned about ensuring we have at
least one wndw channel owned by a head with CRC output enabled. While Volta
lacks this ability, Volta conveniently also lacks flexible wndw mapping -
meaning that we can always rely on each head having four wndw channels mapped to
it regardless of the atomic state.

So, simply use the hard-coded wndw mappings we're guaranteed to have on Volta as
the controlling channel, and use the core channel as the controlling channel for
Turing+. As a result this also renders the plane ownership logic in
nv50_crc_atomic_check() unnessecary, which gives us one less thing to implement
when we get support for flexible wndw mapping. We also can entirely drop the
wndw parameter from our set_src callbacks, and the atomic state.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/Kbuild       |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        | 34 ++-------
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |  7 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    | 45 +++---------
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h    | 40 +++++++++++
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    | 58 ++++++++++++++++
 .../drm/nouveau/include/nvhw/class/clc57d.h   | 69 +++++++++++++++++++
 9 files changed, 187 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c

diff --git a/drivers/gpu/drm/nouveau/dispnv50/Kbuild b/drivers/gpu/drm/nouveau/dispnv50/Kbuild
index 4488e1c061b3..28be2912ff74 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/Kbuild
+++ b/drivers/gpu/drm/nouveau/dispnv50/Kbuild
@@ -13,6 +13,7 @@ nouveau-y += dispnv50/corec57d.o
 nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crc.o
 nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crc907d.o
 nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crcc37d.o
+nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crcc57d.o
 
 nouveau-y += dispnv50/dac507d.o
 nouveau-y += dispnv50/dac907d.o
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
index 75876546eac1..53b1e2a569c1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -69,7 +69,7 @@ corec57d = {
 	.head = &headc57d,
 	.sor = &sorc37d,
 #if IS_ENABLED(CONFIG_DEBUG_FS)
-	.crc = &crcc37d,
+	.crc = &crcc57d,
 #endif
 };
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index ef942248345c..49eb8e9fef22 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -351,8 +351,6 @@ int nv50_crc_atomic_check_head(struct nv50_head *head,
 			       struct nv50_head_atom *armh)
 {
 	struct nv50_atom *atom = nv50_atom(asyh->state.state);
-	struct drm_device *dev = head->base.base.dev;
-	struct nv50_disp *disp = nv50_disp(dev);
 	bool changed = armh->crc.src != asyh->crc.src;
 
 	if (!armh->crc.src && !asyh->crc.src) {
@@ -361,30 +359,7 @@ int nv50_crc_atomic_check_head(struct nv50_head *head,
 		return 0;
 	}
 
-	/* While we don't care about entry tags, Volta+ hw always needs the
-	 * controlling wndw channel programmed to a wndw that's owned by our
-	 * head
-	 */
-	if (asyh->crc.src && disp->disp->object.oclass >= GV100_DISP &&
-	    !(BIT(asyh->crc.wndw) & asyh->wndw.owned)) {
-		if (!asyh->wndw.owned) {
-			/* TODO: once we support flexible channel ownership,
-			 * we should write some code here to handle attempting
-			 * to "steal" a plane: e.g. take a plane that is
-			 * currently not-visible and owned by another head,
-			 * and reassign it to this head. If we fail to do so,
-			 * we shuld reject the mode outright as CRC capture
-			 * then becomes impossible.
-			 */
-			NV_ATOMIC(nouveau_drm(dev),
-				  "No available wndws for CRC readback\n");
-			return -EINVAL;
-		}
-		asyh->crc.wndw = ffs(asyh->wndw.owned) - 1;
-	}
-
-	if (drm_atomic_crtc_needs_modeset(&asyh->state) || changed ||
-	    armh->crc.wndw != asyh->crc.wndw) {
+	if (drm_atomic_crtc_needs_modeset(&asyh->state) || changed) {
 		asyh->clr.crc = armh->crc.src && armh->state.active;
 		asyh->set.crc = asyh->crc.src && asyh->state.active;
 		if (changed)
@@ -471,9 +446,8 @@ void nv50_crc_atomic_set(struct nv50_head *head,
 	struct nouveau_encoder *outp =
 		nv50_real_outp(nv50_head_atom_get_encoder(asyh));
 
-	func->set_src(head, outp->or,
-		      nv50_crc_source_type(outp, asyh->crc.src),
-		      &crc->ctx[crc->ctx_idx], asyh->crc.wndw);
+	func->set_src(head, outp->or, nv50_crc_source_type(outp, asyh->crc.src),
+		      &crc->ctx[crc->ctx_idx]);
 }
 
 void nv50_crc_atomic_clr(struct nv50_head *head)
@@ -481,7 +455,7 @@ void nv50_crc_atomic_clr(struct nv50_head *head)
 	const struct nv50_crc_func *func =
 		nv50_disp(head->base.base.dev)->core->func->crc;
 
-	func->set_src(head, 0, NV50_CRC_SOURCE_TYPE_NONE, NULL, 0);
+	func->set_src(head, 0, NV50_CRC_SOURCE_TYPE_NONE, NULL);
 }
 
 static inline int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
index 4fce871b04c8..4823f1fde2dd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -45,13 +45,11 @@ struct nv50_crc_notifier_ctx {
 
 struct nv50_crc_atom {
 	enum nv50_crc_source src;
-	/* Only used for gv100+ */
-	u8 wndw : 4;
 };
 
 struct nv50_crc_func {
-	int (*set_src)(struct nv50_head *, int or, enum nv50_crc_source_type,
-		       struct nv50_crc_notifier_ctx *, u32 wndw);
+	int (*set_src)(struct nv50_head *, int or, enum nv50_crc_source_type type,
+		       struct nv50_crc_notifier_ctx *ctx);
 	int (*set_ctx)(struct nv50_head *, struct nv50_crc_notifier_ctx *);
 	u32 (*get_entry)(struct nv50_head *, struct nv50_crc_notifier_ctx *,
 			 enum nv50_crc_source, int idx);
@@ -95,6 +93,7 @@ void nv50_crc_atomic_clr(struct nv50_head *);
 
 extern const struct nv50_crc_func crc907d;
 extern const struct nv50_crc_func crcc37d;
+extern const struct nv50_crc_func crcc57d;
 
 #else /* IS_ENABLED(CONFIG_DEBUG_FS) */
 struct nv50_crc {};
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
index 0fb0fdb9f119..0a89ae9523d4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -23,9 +23,8 @@ struct crc907d_notifier {
 } __packed;
 
 static int
-crc907d_set_src(struct nv50_head *head, int or,
-		enum nv50_crc_source_type source,
-		struct nv50_crc_notifier_ctx *ctx, u32 wndw)
+crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
+		struct nv50_crc_notifier_ctx *ctx)
 {
 	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index 814e5bd97446..f10f6c484408 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -2,6 +2,7 @@
 #include <drm/drm_crtc.h>
 
 #include "crc.h"
+#include "crcc37d.h"
 #include "core.h"
 #include "disp.h"
 #include "head.h"
@@ -10,38 +11,13 @@
 
 #include <nvhw/class/clc37d.h>
 
-#define CRCC37D_MAX_ENTRIES 2047
-
-struct crcc37d_notifier {
-	u32 status;
-
-	/* reserved */
-	u32 :32;
-	u32 :32;
-	u32 :32;
-	u32 :32;
-	u32 :32;
-	u32 :32;
-	u32 :32;
-
-	struct crcc37d_entry {
-		u32 status[2];
-		u32 :32; /* reserved */
-		u32 compositor_crc;
-		u32 rg_crc;
-		u32 output_crc[2];
-		u32 :32; /* reserved */
-	} entries[CRCC37D_MAX_ENTRIES];
-} __packed;
-
 static int
-crcc37d_set_src(struct nv50_head *head, int or,
-		enum nv50_crc_source_type source,
-		struct nv50_crc_notifier_ctx *ctx, u32 wndw)
+crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
+		struct nv50_crc_notifier_ctx *ctx)
 {
 	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
-	u32 crc_args = NVVAL(NVC37D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, wndw) |
+	u32 crc_args = NVVAL(NVC37D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, i * 4) |
 		       NVDEF(NVC37D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
 		       NVDEF(NVC37D, HEAD_SET_CRC_CONTROL, SECONDARY_CRC, NONE) |
 		       NVDEF(NVC37D, HEAD_SET_CRC_CONTROL, CRC_DURING_SNOOZE, DISABLE);
@@ -75,8 +51,7 @@ crcc37d_set_src(struct nv50_head *head, int or,
 	return 0;
 }
 
-static int
-crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
+int crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
 	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
@@ -89,9 +64,8 @@ crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 	return 0;
 }
 
-static u32 crcc37d_get_entry(struct nv50_head *head,
-			     struct nv50_crc_notifier_ctx *ctx,
-			     enum nv50_crc_source source, int idx)
+u32 crcc37d_get_entry(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx,
+		      enum nv50_crc_source source, int idx)
 {
 	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
 	struct crcc37d_entry __iomem *entry = &notifier->entries[idx];
@@ -105,8 +79,7 @@ static u32 crcc37d_get_entry(struct nv50_head *head,
 	return ioread32_native(crc_addr);
 }
 
-static bool crcc37d_ctx_finished(struct nv50_head *head,
-				 struct nv50_crc_notifier_ctx *ctx)
+bool crcc37d_ctx_finished(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
 	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
 	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
@@ -148,7 +121,7 @@ const struct nv50_crc_func crcc37d = {
 	.set_ctx = crcc37d_set_ctx,
 	.get_entry = crcc37d_get_entry,
 	.ctx_finished = crcc37d_ctx_finished,
-	.flip_threshold = CRCC37D_MAX_ENTRIES - 30,
+	.flip_threshold = CRCC37D_FLIP_THRESHOLD,
 	.num_entries = CRCC37D_MAX_ENTRIES,
 	.notifier_len = sizeof(struct crcc37d_notifier),
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.h b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
new file mode 100644
index 000000000000..f54425530ce0
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: MIT
+
+#ifndef __CRCC37D_H__
+#define __CRCC37D_H__
+
+#include <linux/types.h>
+
+#include "crc.h"
+
+#define CRCC37D_MAX_ENTRIES 2047
+#define CRCC37D_FLIP_THRESHOLD CRCC37D_MAX_ENTRIES - 30
+
+struct crcc37d_notifier {
+	u32 status;
+
+	/* reserved */
+	u32 :32;
+	u32 :32;
+	u32 :32;
+	u32 :32;
+	u32 :32;
+	u32 :32;
+	u32 :32;
+
+	struct crcc37d_entry {
+		u32 status[2];
+		u32 :32; /* reserved */
+		u32 compositor_crc;
+		u32 rg_crc;
+		u32 output_crc[2];
+		u32 :32; /* reserved */
+	} entries[CRCC37D_MAX_ENTRIES];
+} __packed;
+
+int crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx);
+u32 crcc37d_get_entry(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx,
+		      enum nv50_crc_source source, int idx);
+bool crcc37d_ctx_finished(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx);
+
+#endif /* !__CRCC37D_H__ */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
new file mode 100644
index 000000000000..cc0130e3d496
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: MIT
+
+#include "crc.h"
+#include "crcc37d.h"
+#include "core.h"
+#include "disp.h"
+#include "head.h"
+
+#include <nvif/pushc37b.h>
+
+#include <nvhw/class/clc57d.h>
+
+static int crcc57d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
+			   struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	const int i = head->base.index;
+	u32 crc_args = NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
+		       NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
+		       NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, SECONDARY_CRC, NONE) |
+		       NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, CRC_DURING_SNOOZE, DISABLE);
+	int ret;
+
+	switch (source) {
+	case NV50_CRC_SOURCE_TYPE_SOR:
+		crc_args |= NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, PRIMARY_CRC, SOR(or));
+		break;
+	case NV50_CRC_SOURCE_TYPE_SF:
+		crc_args |= NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, PRIMARY_CRC, SF);
+		break;
+	default:
+		break;
+	}
+
+	ret = PUSH_WAIT(push, 4);
+	if (ret)
+		return ret;
+
+	if (source) {
+		PUSH_MTHD(push, NVC57D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx->ntfy.handle);
+		PUSH_MTHD(push, NVC57D, HEAD_SET_CRC_CONTROL(i), crc_args);
+	} else {
+		PUSH_MTHD(push, NVC57D, HEAD_SET_CRC_CONTROL(i), 0);
+		PUSH_MTHD(push, NVC57D, HEAD_SET_CONTEXT_DMA_CRC(i), 0);
+	}
+
+	return 0;
+}
+
+const struct nv50_crc_func crcc57d = {
+	.set_src = crcc57d_set_src,
+	.set_ctx = crcc37d_set_ctx,
+	.get_entry = crcc37d_get_entry,
+	.ctx_finished = crcc37d_ctx_finished,
+	.flip_threshold = CRCC37D_FLIP_THRESHOLD,
+	.num_entries = CRCC37D_MAX_ENTRIES,
+	.notifier_len = sizeof(struct crcc37d_notifier),
+};
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clc57d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clc57d.h
index d83ac815e06c..d4bad2da3e56 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/class/clc57d.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clc57d.h
@@ -265,6 +265,75 @@
 #define NVC57D_HEAD_SET_RASTER_BLANK_START(a)                                   (0x00002070 + (a)*0x00000400)
 #define NVC57D_HEAD_SET_RASTER_BLANK_START_X                                    14:0
 #define NVC57D_HEAD_SET_RASTER_BLANK_START_Y                                    30:16
+#define NVC57D_HEAD_SET_CONTEXT_DMA_CRC(a)                                      (0x00002180 + (a)*0x00000400)
+#define NVC57D_HEAD_SET_CONTEXT_DMA_CRC_HANDLE                                  31:0
+#define NVC57D_HEAD_SET_CRC_CONTROL(a)                                          (0x00002184 + (a)*0x00000400)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL                         5:0
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_0                   (0x00000000)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_1                   (0x00000001)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_2                   (0x00000002)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_3                   (0x00000003)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_4                   (0x00000004)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_5                   (0x00000005)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_6                   (0x00000006)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_7                   (0x00000007)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_8                   (0x00000008)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_9                   (0x00000009)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_10                  (0x0000000A)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_11                  (0x0000000B)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_12                  (0x0000000C)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_13                  (0x0000000D)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_14                  (0x0000000E)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_15                  (0x0000000F)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_16                  (0x00000010)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_17                  (0x00000011)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_18                  (0x00000012)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_19                  (0x00000013)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_20                  (0x00000014)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_21                  (0x00000015)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_22                  (0x00000016)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_23                  (0x00000017)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_24                  (0x00000018)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_25                  (0x00000019)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_26                  (0x0000001A)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_27                  (0x0000001B)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_28                  (0x0000001C)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_29                  (0x0000001D)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_30                  (0x0000001E)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_31                  (0x0000001F)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_CORE                    (0x00000020)
+#define NVC57D_HEAD_SET_CRC_CONTROL_EXPECT_BUFFER_COLLAPSE                      8:8
+#define NVC57D_HEAD_SET_CRC_CONTROL_EXPECT_BUFFER_COLLAPSE_FALSE                (0x00000000)
+#define NVC57D_HEAD_SET_CRC_CONTROL_EXPECT_BUFFER_COLLAPSE_TRUE                 (0x00000001)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC                                 19:12
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE                            (0x00000000)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SF                              (0x00000030)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR(i)                          (0x00000050 +(i))
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR__SIZE_1                     8
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR0                            (0x00000050)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR1                            (0x00000051)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR2                            (0x00000052)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR3                            (0x00000053)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR4                            (0x00000054)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR5                            (0x00000055)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR6                            (0x00000056)
+#define NVC57D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR7                            (0x00000057)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC                               27:20
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_NONE                          (0x00000000)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SF                            (0x00000030)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR(i)                        (0x00000050 +(i))
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR__SIZE_1                   8
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR0                          (0x00000050)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR1                          (0x00000051)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR2                          (0x00000052)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR3                          (0x00000053)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR4                          (0x00000054)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR5                          (0x00000055)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR6                          (0x00000056)
+#define NVC57D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR7                          (0x00000057)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CRC_DURING_SNOOZE                           9:9
+#define NVC57D_HEAD_SET_CRC_CONTROL_CRC_DURING_SNOOZE_DISABLE                   (0x00000000)
+#define NVC57D_HEAD_SET_CRC_CONTROL_CRC_DURING_SNOOZE_ENABLE                    (0x00000001)
 #define NVC57D_HEAD_SET_OLUT_CONTROL(a)                                         (0x00002280 + (a)*0x00000400)
 #define NVC57D_HEAD_SET_OLUT_CONTROL_INTERPOLATE                                0:0
 #define NVC57D_HEAD_SET_OLUT_CONTROL_INTERPOLATE_DISABLE                        (0x00000000)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
