Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A47189345
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 01:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3066E846;
	Wed, 18 Mar 2020 00:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E476E832
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzLNtcPlIRayy4zGnQcyKmO6TKUuvBItmg659qkeiY8=;
 b=eeIW4CvYrr4tryQ2hzbYEgcshOxsakuTZGXoZkqp28Jmt6fIebIV4HduE+fWrNEEO1ysJ8
 uH3GTppdDBqIFN1pWB/Cz1H1BHNcKgLRjgr2y2GkPk/uBNC0J4UnhYyXSdt43cJxw+SxAS
 EBJFWo6hw2+53HypG7R4GDMPEy13nuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-EaRDwibZM02nN0JSDNYkkQ-1; Tue, 17 Mar 2020 20:43:40 -0400
X-MC-Unique: EaRDwibZM02nN0JSDNYkkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00AD100550D;
 Wed, 18 Mar 2020 00:43:37 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A950460BE0;
 Wed, 18 Mar 2020 00:43:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/nouveau/kms/nvd9-: Add CRC support
Date: Tue, 17 Mar 2020 20:41:06 -0400
Message-Id: <20200318004159.235623-10-lyude@redhat.com>
In-Reply-To: <20200318004159.235623-1-lyude@redhat.com>
References: <20200318004159.235623-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This introduces support for CRC readback on gf119+, using the
documentation generously provided to us by Nvidia:

https://github.com/NVIDIA/open-gpu-doc/blob/master/Display-CRC/display-crc.txt

We expose all available CRC sources. SF, SOR, PIOR, and DAC are exposed
through a single set of "outp" sources: outp-active/auto for a CRC of
the scanout region, outp-complete for a CRC of both the scanout and
blanking/sync region combined, and outp-inactive for a CRC of only the
blanking/sync region. For each source, nouveau selects the appropriate
tap point based on the output path in use. We also expose an "rg"
source, which allows for capturing CRCs of the scanout raster before
it's encoded into a video signal in the output path. This tap point is
referred to as the raster generator.

Note that while there's some other neat features that can be used with
CRC capture on nvidia hardware, like capturing from two CRC sources
simultaneously, I couldn't see any usecase for them and did not
implement them.

Nvidia only allows for accessing CRCs through a shared DMA region that
we program through the core EVO/NvDisplay channel which is referred to
as the notifier context. The notifier context is limited to either 255
(for Fermi-Pascal) or 2047 (Volta+) entries to store CRCs in, and
unfortunately the hardware simply drops CRCs and reports an overflow
once all available entries in the notifier context are filled.

Since the DRM CRC API and igt-gpu-tools don't expect there to be a limit
on how many CRCs can be captured, we work around this in nouveau by
allocating two separate notifier contexts for each head instead of one.
We schedule a vblank worker ahead of time so that once we start getting
close to filling up all of the available entries in the notifier
context, we can swap the currently used notifier context out with
another pre-prepared notifier context in a manner similar to page
flipping.

Unfortunately, the hardware only allows us to this by flushing two
separate updates on the core channel: one to release the current
notifier context handle, and one to program the next notifier context's
handle. When the hardware processes the first update, the CRC for the
current frame is lost. However, the second update can be flushed
immediately without waiting for the first to complete so that CRC
generation resumes on the next frame. According to Nvidia's hardware
engineers, there isn't any cleaner way of flipping notifier contexts
that would avoid this.

Since using vblank workers to swap out the notifier context will ensure
we can usually flush both updates to hardware within the timespan of a
single frame, we can also ensure that there will only be exactly one
frame lost between the first and second update being executed by the
hardware. This gives us the guarantee that we're always correctly
matching each CRC entry with it's respective frame even after a context
flip. And since IGT will retrieve the CRC entry for a frame by waiting
until it receives a CRC for any subsequent frames, this doesn't cause an
issue with any tests and is much simpler than trying to change the
current DRM API to accommodate.

In order to facilitate testing of correct handling of this limitation,
we also expose a debugfs interface to manually control the threshold for
when we start trying to flip the notifier context. We will use this in
igt to trigger a context flip for testing purposes without needing to
wait for the notifier to completely fill up. This threshold is reset
to the default value set by nouveau after each capture, and is exposed
in a separate folder within each CRTC's debugfs directory labelled
"nv_crc".

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  25 +-
 drivers/gpu/drm/nouveau/dispnv50/Kbuild     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/atom.h     |  20 +
 drivers/gpu/drm/nouveau/dispnv50/core.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/crc.c      | 716 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/crc.h      | 125 ++++
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c  | 139 ++++
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  | 153 +++++
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  24 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  10 +
 drivers/gpu/drm/nouveau/dispnv50/handles.h  |   1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c     |  85 ++-
 drivers/gpu/drm/nouveau/dispnv50/head.h     |  11 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c |  14 +-
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |   7 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |  60 +-
 21 files changed, 1342 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc.h
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc907d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 1f08de4241e0..fc178ffce8cd 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -44,6 +44,9 @@
 #include <subdev/bios/pll.h>
 #include <subdev/clk.h>
 
+#include <nvif/event.h>
+#include <nvif/cl0046.h>
+
 static int
 nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 			struct drm_framebuffer *old_fb);
@@ -755,6 +758,7 @@ static void nv_crtc_destroy(struct drm_crtc *crtc)
 	nouveau_bo_unmap(nv_crtc->cursor.nvbo);
 	nouveau_bo_unpin(nv_crtc->cursor.nvbo);
 	nouveau_bo_ref(NULL, &nv_crtc->cursor.nvbo);
+	nvif_notify_fini(&nv_crtc->vblank);
 	kfree(nv_crtc);
 }
 
@@ -1296,9 +1300,19 @@ create_primary_plane(struct drm_device *dev)
         return primary;
 }
 
+static int nv04_crtc_vblank_handler(struct nvif_notify *notify)
+{
+	struct nouveau_crtc *nv_crtc =
+		container_of(notify, struct nouveau_crtc, vblank);
+
+	drm_crtc_handle_vblank(&nv_crtc->base);
+	return NVIF_NOTIFY_KEEP;
+}
+
 int
 nv04_crtc_create(struct drm_device *dev, int crtc_num)
 {
+	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_crtc *nv_crtc;
 	int ret;
 
@@ -1336,5 +1350,14 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 
 	nv04_cursor_init(nv_crtc);
 
-	return 0;
+	ret = nvif_notify_init(&disp->disp.object, nv04_crtc_vblank_handler,
+			       false, NV04_DISP_NTFY_VBLANK,
+			       &(struct nvif_notify_head_req_v0) {
+				    .head = nv_crtc->index,
+			       },
+			       sizeof(struct nvif_notify_head_req_v0),
+			       sizeof(struct nvif_notify_head_rep_v0),
+			       &nv_crtc->vblank);
+
+	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/Kbuild b/drivers/gpu/drm/nouveau/dispnv50/Kbuild
index e0c435eae664..6fdddb266fb1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/Kbuild
+++ b/drivers/gpu/drm/nouveau/dispnv50/Kbuild
@@ -10,6 +10,10 @@ nouveau-y += dispnv50/core917d.o
 nouveau-y += dispnv50/corec37d.o
 nouveau-y += dispnv50/corec57d.o
 
+nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crc.o
+nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crc907d.o
+nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crcc37d.o
+
 nouveau-y += dispnv50/dac507d.o
 nouveau-y += dispnv50/dac907d.o
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 62faaf60f47a..3d82b3c67dec 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -2,6 +2,9 @@
 #define __NV50_KMS_ATOM_H__
 #define nv50_atom(p) container_of((p), struct nv50_atom, state)
 #include <drm/drm_atomic.h>
+#include "crc.h"
+
+struct nouveau_encoder;
 
 struct nv50_atom {
 	struct drm_atomic_state state;
@@ -115,9 +118,12 @@ struct nv50_head_atom {
 		u8 nhsync:1;
 		u8 nvsync:1;
 		u8 depth:4;
+		u8 crc_raster:2;
 		u8 bpc;
 	} or;
 
+	struct nv50_crc_atom crc;
+
 	/* Currently only used for MST */
 	struct {
 		int pbn;
@@ -135,6 +141,7 @@ struct nv50_head_atom {
 			bool ovly:1;
 			bool dither:1;
 			bool procamp:1;
+			bool crc:1;
 			bool or:1;
 		};
 		u16 mask;
@@ -150,6 +157,19 @@ nv50_head_atom_get(struct drm_atomic_state *state, struct drm_crtc *crtc)
 	return nv50_head_atom(statec);
 }
 
+static inline struct drm_encoder *
+nv50_head_atom_get_encoder(struct nv50_head_atom *atom)
+{
+	struct drm_encoder *encoder = NULL;
+
+	/* We only ever have a single encoder */
+	drm_for_each_encoder_mask(encoder, atom->state.crtc->dev,
+				  atom->state.encoder_mask)
+		break;
+
+	return encoder;
+}
+
 #define nv50_wndw_atom(p) container_of((p), struct nv50_wndw_atom, state)
 
 struct nv50_wndw_atom {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
index ff94f3f6f264..47470db0f154 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -2,6 +2,7 @@
 #define __NV50_KMS_CORE_H__
 #include "disp.h"
 #include "atom.h"
+#include "crc.h"
 
 struct nv50_core {
 	const struct nv50_core_func *func;
@@ -24,6 +25,9 @@ struct nv50_core_func {
 	} wndw;
 
 	const struct nv50_head_func *head;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	const struct nv50_crc_func *crc;
+#endif
 	const struct nv50_outp_func {
 		void (*ctrl)(struct nv50_core *, int or, u32 ctrl,
 			     struct nv50_head_atom *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core907d.c b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
index ef822f813435..fd6aaf629d02 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
@@ -29,6 +29,9 @@ core907d = {
 	.ntfy_wait_done = core507d_ntfy_wait_done,
 	.update = core507d_update,
 	.head = &head907d,
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	.crc = &crc907d,
+#endif
 	.dac = &dac907d,
 	.sor = &sor907d,
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core917d.c b/drivers/gpu/drm/nouveau/dispnv50/core917d.c
index 392338df5bfd..46debdce87ff 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core917d.c
@@ -29,6 +29,9 @@ core917d = {
 	.ntfy_wait_done = core507d_ntfy_wait_done,
 	.update = core507d_update,
 	.head = &head917d,
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	.crc = &crc907d,
+#endif
 	.dac = &dac907d,
 	.sor = &sor907d,
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
index 3b36dc8d36b2..19761bfdac31 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -114,6 +114,9 @@ corec37d = {
 	.wndw.owner = corec37d_wndw_owner,
 	.head = &headc37d,
 	.sor = &sorc37d,
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	.crc = &crcc37d,
+#endif
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
index 147adcd60937..0ffd6286985c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -51,6 +51,9 @@ corec57d = {
 	.wndw.owner = corec37d_wndw_owner,
 	.head = &headc57d,
 	.sor = &sorc37d,
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	.crc = &crcc37d,
+#endif
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
new file mode 100644
index 000000000000..b3a21e8256d5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -0,0 +1,716 @@
+/* SPDX-License-Identifier: MIT */
+#include <linux/string.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_vblank.h>
+
+#include <nvif/class.h>
+#include <nvif/cl0002.h>
+
+#include "nouveau_drv.h"
+#include "core.h"
+#include "head.h"
+#include "wndw.h"
+#include "handles.h"
+#include "crc.h"
+
+static const char * const nv50_crc_sources[] = {
+	[NV50_CRC_SOURCE_NONE] = "none",
+	[NV50_CRC_SOURCE_AUTO] = "auto",
+	[NV50_CRC_SOURCE_RG] = "rg",
+	[NV50_CRC_SOURCE_OUTP_ACTIVE] = "outp-active",
+	[NV50_CRC_SOURCE_OUTP_COMPLETE] = "outp-complete",
+	[NV50_CRC_SOURCE_OUTP_INACTIVE] = "outp-inactive",
+};
+
+static int nv50_crc_parse_source(const char *buf, enum nv50_crc_source *s)
+{
+	int i;
+
+	if (!buf) {
+		*s = NV50_CRC_SOURCE_NONE;
+		return 0;
+	}
+
+	i = match_string(nv50_crc_sources, ARRAY_SIZE(nv50_crc_sources), buf);
+	if (i < 0)
+		return i;
+
+	*s = i;
+	return 0;
+}
+
+int
+nv50_crc_verify_source(struct drm_crtc *crtc, const char *source_name,
+		       size_t *values_cnt)
+{
+	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	enum nv50_crc_source source;
+
+	if (nv50_crc_parse_source(source_name, &source) < 0) {
+		NV_DEBUG(drm, "unknown source %s\n", source_name);
+		return -EINVAL;
+	}
+
+	*values_cnt = 1;
+	return 0;
+}
+
+const char *const *nv50_crc_get_sources(struct drm_crtc *crtc, size_t *count)
+{
+	*count = ARRAY_SIZE(nv50_crc_sources);
+	return nv50_crc_sources;
+}
+
+static void
+nv50_crc_program_ctx(struct nv50_head *head,
+		     struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nv50_disp *disp = nv50_disp(head->base.base.dev);
+	struct nv50_core *core = disp->core;
+	u32 interlock[NV50_DISP_INTERLOCK__SIZE] = { 0 };
+
+	core->func->crc->set_ctx(head, ctx);
+	core->func->update(core, interlock, false);
+}
+
+static void nv50_crc_ctx_flip_work(struct drm_vblank_work *work, u64 count)
+{
+	struct nv50_crc *crc = container_of(work, struct nv50_crc, flip_work);
+	struct nv50_head *head = container_of(crc, struct nv50_head, crc);
+	struct drm_crtc *crtc = &head->base.base;
+	struct nv50_disp *disp = nv50_disp(crtc->dev);
+	u8 new_idx = crc->ctx_idx ^ 1;
+
+	/*
+	 * We don't want to accidentally wait for longer then the vblank, so
+	 * try again for the next vblank if we don't grab the lock
+	 */
+	if (!mutex_trylock(&disp->mutex)) {
+		DRM_DEV_DEBUG_KMS(crtc->dev->dev,
+				  "Lock contended, delaying CRC ctx flip for head-%d\n",
+				  head->base.index);
+		drm_vblank_work_schedule(work, count + 1, true);
+		return;
+	}
+
+	DRM_DEV_DEBUG_KMS(crtc->dev->dev,
+			  "Flipping notifier ctx for head %d (%d -> %d)\n",
+			  drm_crtc_index(crtc), crc->ctx_idx, new_idx);
+
+	nv50_crc_program_ctx(head, NULL);
+	nv50_crc_program_ctx(head, &crc->ctx[new_idx]);
+	mutex_unlock(&disp->mutex);
+
+	spin_lock_irq(&crc->lock);
+	crc->ctx_changed = true;
+	spin_unlock_irq(&crc->lock);
+}
+
+static inline void nv50_crc_reset_ctx(struct nv50_crc_notifier_ctx *ctx)
+{
+	memset_io(ctx->mem.object.map.ptr, 0, ctx->mem.object.map.size);
+}
+
+static void
+nv50_crc_get_entries(struct nv50_head *head,
+		     const struct nv50_crc_func *func,
+		     enum nv50_crc_source source)
+{
+	struct drm_crtc *crtc = &head->base.base;
+	struct nv50_crc *crc = &head->crc;
+	u32 output_crc;
+
+	while (crc->entry_idx < func->num_entries) {
+		/*
+		 * While Nvidia's documentation says CRCs are written on each
+		 * subsequent vblank after being enabled, in practice they
+		 * aren't written immediately.
+		 */
+		output_crc = func->get_entry(head, &crc->ctx[crc->ctx_idx],
+					     source, crc->entry_idx);
+		if (!output_crc)
+			return;
+
+		drm_crtc_add_crc_entry(crtc, true, crc->frame, &output_crc);
+		crc->frame++;
+		crc->entry_idx++;
+	}
+}
+
+void nv50_crc_handle_vblank(struct nv50_head *head)
+{
+	struct drm_crtc *crtc = &head->base.base;
+	struct nv50_crc *crc = &head->crc;
+	const struct nv50_crc_func *func =
+		nv50_disp(head->base.base.dev)->core->func->crc;
+	struct nv50_crc_notifier_ctx *ctx;
+	bool need_reschedule = false;
+
+	if (!func)
+		return;
+
+	/*
+	 * We don't lose events if we aren't able to report CRCs until the
+	 * next vblank, so only report CRCs if the locks we need aren't
+	 * contended to prevent missing an actual vblank event
+	 */
+	if (!spin_trylock(&crc->lock))
+		return;
+
+	if (!crc->src)
+		goto out;
+
+	ctx = &crc->ctx[crc->ctx_idx];
+	if (crc->ctx_changed && func->ctx_finished(head, ctx)) {
+		nv50_crc_get_entries(head, func, crc->src);
+
+		crc->ctx_idx ^= 1;
+		crc->entry_idx = 0;
+		crc->ctx_changed = false;
+
+		/*
+		 * Unfortunately when notifier contexts are changed during CRC
+		 * capture, we will inevitably lose the CRC entry for the
+		 * frame where the hardware actually latched onto the first
+		 * UPDATE. According to Nvidia's hardware engineers, there's
+		 * no workaround for this.
+		 *
+		 * Now, we could try to be smart here and calculate the number
+		 * of missed CRCs based on audit timestamps, but those were
+		 * removed starting with volta. Since we always flush our
+		 * updates back-to-back without waiting, we'll just be
+		 * optimistic and assume we always miss exactly one frame.
+		 */
+		DRM_DEV_DEBUG_KMS(head->base.base.dev->dev,
+				  "Notifier ctx flip for head-%d finished, lost CRC for frame %llu\n",
+				  head->base.index, crc->frame);
+		crc->frame++;
+
+		nv50_crc_reset_ctx(ctx);
+		need_reschedule = true;
+	}
+
+	nv50_crc_get_entries(head, func, crc->src);
+
+	if (need_reschedule)
+		drm_vblank_work_schedule(&crc->flip_work,
+					 drm_crtc_vblank_count(crtc)
+					 + crc->flip_threshold
+					 - crc->entry_idx,
+					 true);
+
+out:
+	spin_unlock(&crc->lock);
+}
+
+static void nv50_crc_wait_ctx_finished(struct nv50_head *head,
+				       const struct nv50_crc_func *func,
+				       struct nv50_crc_notifier_ctx *ctx)
+{
+	struct drm_device *dev = head->base.base.dev;
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	s64 ret;
+
+	ret = nvif_msec(&drm->client.device, 50,
+			if (func->ctx_finished(head, ctx)) break;);
+	if (ret == -ETIMEDOUT)
+		NV_ERROR(drm,
+			 "CRC notifier ctx for head %d not finished after 50ms\n",
+			 head->base.index);
+	else if (ret)
+		NV_ATOMIC(drm,
+			  "CRC notifier ctx for head-%d finished after %lldns\n",
+			  head->base.index, ret);
+}
+
+void nv50_crc_atomic_stop_reporting(struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct nv50_head *head = nv50_head(crtc);
+		struct nv50_head_atom *asyh = nv50_head_atom(crtc_state);
+		struct nv50_crc *crc = &head->crc;
+
+		if (!asyh->clr.crc)
+			continue;
+
+		spin_lock_irq(&crc->lock);
+		crc->src = NV50_CRC_SOURCE_NONE;
+		spin_unlock_irq(&crc->lock);
+
+		drm_crtc_vblank_put(crtc);
+		drm_vblank_work_cancel_sync(&crc->flip_work);
+
+		NV_ATOMIC(nouveau_drm(crtc->dev),
+			  "CRC reporting on vblank for head-%d disabled\n",
+			  head->base.index);
+
+		/* CRC generation is still enabled in hw, we'll just report
+		 * any remaining CRC entries ourselves after it gets disabled
+		 * in hardware
+		 */
+	}
+}
+
+void nv50_crc_atomic_prepare_notifier_contexts(struct drm_atomic_state *state)
+{
+	const struct nv50_crc_func *func =
+		nv50_disp(state->dev)->core->func->crc;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		struct nv50_head *head = nv50_head(crtc);
+		struct nv50_head_atom *asyh = nv50_head_atom(new_crtc_state);
+		struct nv50_crc *crc = &head->crc;
+		struct nv50_crc_notifier_ctx *ctx = &crc->ctx[crc->ctx_idx];
+		int i;
+
+		if (asyh->clr.crc && asyh->crc.src) {
+			if (crc->ctx_changed) {
+				nv50_crc_wait_ctx_finished(head, func, ctx);
+				ctx = &crc->ctx[crc->ctx_idx ^ 1];
+			}
+			nv50_crc_wait_ctx_finished(head, func, ctx);
+		}
+
+		if (asyh->set.crc) {
+			crc->entry_idx = 0;
+			crc->ctx_changed = false;
+			for (i = 0; i < ARRAY_SIZE(crc->ctx); i++)
+				nv50_crc_reset_ctx(&crc->ctx[i]);
+		}
+	}
+}
+
+void nv50_crc_atomic_start_reporting(struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct nv50_head *head = nv50_head(crtc);
+		struct nv50_head_atom *asyh = nv50_head_atom(crtc_state);
+		struct nv50_crc *crc = &head->crc;
+		u64 vbl_count;
+
+		if (!asyh->set.crc)
+			continue;
+
+		drm_crtc_vblank_get(crtc);
+
+		spin_lock_irq(&crc->lock);
+		vbl_count = drm_crtc_vblank_count(crtc);
+		crc->frame = vbl_count;
+		crc->src = asyh->crc.src;
+		drm_vblank_work_schedule(&crc->flip_work,
+					 vbl_count + crc->flip_threshold,
+					 true);
+		spin_unlock_irq(&crc->lock);
+
+		NV_ATOMIC(nouveau_drm(crtc->dev),
+			  "CRC reporting on vblank for head-%d enabled\n",
+			  head->base.index);
+	}
+}
+
+int nv50_crc_atomic_check(struct nv50_head *head,
+			  struct nv50_head_atom *asyh,
+			  struct nv50_head_atom *armh)
+{
+	struct drm_atomic_state *state = asyh->state.state;
+	struct drm_device *dev = head->base.base.dev;
+	struct nv50_atom *atom = nv50_atom(state);
+	struct nv50_disp *disp = nv50_disp(dev);
+	struct drm_encoder *encoder;
+	struct nouveau_encoder *outp;
+	struct nv50_outp_atom *outp_atom;
+	bool changed = armh->crc.src != asyh->crc.src;
+
+	if (!armh->crc.src && !asyh->crc.src) {
+		asyh->set.crc = false;
+		asyh->clr.crc = false;
+		return 0;
+	}
+
+	/* While we don't care about entry tags, Volta+ hw always needs the
+	 * controlling wndw channel programmed to a wndw that's owned by our
+	 * head
+	 */
+	if (asyh->crc.src && disp->disp->object.oclass >= GV100_DISP &&
+	    !(BIT(asyh->crc.wndw) & asyh->wndw.owned)) {
+		if (!asyh->wndw.owned) {
+			/* TODO: once we support flexible channel ownership,
+			 * we should write some code here to handle attempting
+			 * to "steal" a plane: e.g. take a plane that is
+			 * currently not-visible and owned by another head,
+			 * and reassign it to this head. If we fail to do so,
+			 * we shuld reject the mode outright as CRC capture
+			 * then becomes impossible.
+			 */
+			NV_ATOMIC(nouveau_drm(dev),
+				  "No available wndws for CRC readback\n");
+			return -EINVAL;
+		}
+		asyh->crc.wndw = ffs(asyh->wndw.owned) - 1;
+	}
+
+	if (drm_atomic_crtc_needs_modeset(&asyh->state) || changed ||
+	    armh->crc.wndw != asyh->crc.wndw) {
+		asyh->clr.crc = armh->crc.src && armh->state.active;
+		asyh->set.crc = asyh->crc.src && asyh->state.active;
+		if (changed)
+			asyh->set.or |= armh->or.crc_raster !=
+					asyh->or.crc_raster;
+
+		/*
+		 * If we're reprogramming our OR, we need to flush the CRC
+		 * disable first
+		 */
+		if (asyh->clr.crc) {
+			encoder = nv50_head_atom_get_encoder(armh);
+			outp = nv50_real_outp(encoder);
+
+			list_for_each_entry(outp_atom, &atom->outp, head) {
+				if (outp_atom->encoder == encoder) {
+					if (outp_atom->set.mask)
+						atom->flush_disable = true;
+					break;
+				}
+			}
+		}
+	} else {
+		asyh->set.crc = false;
+		asyh->clr.crc = false;
+	}
+
+	return 0;
+}
+
+static enum nv50_crc_source_type
+nv50_crc_source_type(struct nouveau_encoder *outp,
+		     enum nv50_crc_source source)
+{
+	struct dcb_output *dcbe = outp->dcb;
+
+	switch (source) {
+	case NV50_CRC_SOURCE_NONE: return NV50_CRC_SOURCE_TYPE_NONE;
+	case NV50_CRC_SOURCE_RG:   return NV50_CRC_SOURCE_TYPE_RG;
+	default:		   break;
+	}
+
+	if (dcbe->location != DCB_LOC_ON_CHIP)
+		return NV50_CRC_SOURCE_TYPE_PIOR;
+
+	switch (dcbe->type) {
+	case DCB_OUTPUT_DP:	return NV50_CRC_SOURCE_TYPE_SF;
+	case DCB_OUTPUT_ANALOG:	return NV50_CRC_SOURCE_TYPE_DAC;
+	default:		return NV50_CRC_SOURCE_TYPE_SOR;
+	}
+}
+
+void nv50_crc_atomic_set(struct nv50_head *head,
+			 struct nv50_head_atom *asyh)
+{
+	struct drm_crtc *crtc = &head->base.base;
+	struct drm_device *dev = crtc->dev;
+	struct nv50_crc *crc = &head->crc;
+	const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
+	struct nouveau_encoder *outp =
+		nv50_real_outp(nv50_head_atom_get_encoder(asyh));
+
+	func->set_src(head, outp->or,
+		      nv50_crc_source_type(outp, asyh->crc.src),
+		      &crc->ctx[crc->ctx_idx], asyh->crc.wndw);
+}
+
+void nv50_crc_atomic_clr(struct nv50_head *head)
+{
+	const struct nv50_crc_func *func =
+		nv50_disp(head->base.base.dev)->core->func->crc;
+
+	func->set_src(head, 0, NV50_CRC_SOURCE_TYPE_NONE, NULL, 0);
+}
+
+#define NV50_CRC_RASTER_ACTIVE   0
+#define NV50_CRC_RASTER_COMPLETE 1
+#define NV50_CRC_RASTER_INACTIVE 2
+
+static inline int
+nv50_crc_raster_type(enum nv50_crc_source source)
+{
+	switch (source) {
+	case NV50_CRC_SOURCE_NONE:
+	case NV50_CRC_SOURCE_AUTO:
+	case NV50_CRC_SOURCE_RG:
+	case NV50_CRC_SOURCE_OUTP_ACTIVE:
+		return NV50_CRC_RASTER_ACTIVE;
+	case NV50_CRC_SOURCE_OUTP_COMPLETE:
+		return NV50_CRC_RASTER_COMPLETE;
+	case NV50_CRC_SOURCE_OUTP_INACTIVE:
+		return NV50_CRC_RASTER_INACTIVE;
+	}
+
+	return 0;
+}
+
+/* We handle mapping the memory for CRC notifiers ourselves, since each
+ * notifier needs it's own handle
+ */
+static inline int
+nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
+		  struct nv50_crc_notifier_ctx *ctx, size_t len, int idx)
+{
+	struct nv50_core *core = nv50_disp(head->base.base.dev)->core;
+	int ret;
+
+	ret = nvif_mem_init_map(mmu, NVIF_MEM_VRAM, len, &ctx->mem);
+	if (ret)
+		return ret;
+
+	ret = nvif_object_init(&core->chan.base.user,
+			       NV50_DISP_HANDLE_CRC_CTX(head, idx),
+			       NV_DMA_IN_MEMORY,
+			       &(struct nv_dma_v0) {
+					.target = NV_DMA_V0_TARGET_VRAM,
+					.access = NV_DMA_V0_ACCESS_RDWR,
+					.start = ctx->mem.addr,
+					.limit =  ctx->mem.addr
+						+ ctx->mem.size - 1,
+			       }, sizeof(struct nv_dma_v0),
+			       &ctx->ntfy);
+	if (ret)
+		goto fail_fini;
+
+	return 0;
+
+fail_fini:
+	nvif_mem_fini(&ctx->mem);
+	return ret;
+}
+
+static inline void
+nv50_crc_ctx_fini(struct nv50_crc_notifier_ctx *ctx)
+{
+	nvif_object_fini(&ctx->ntfy);
+	nvif_mem_fini(&ctx->mem);
+}
+
+int nv50_crc_set_source(struct drm_crtc *crtc, const char *source_str)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_atomic_state *state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct nv50_head *head = nv50_head(crtc);
+	struct nv50_crc *crc = &head->crc;
+	const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
+	struct nvif_mmu *mmu = &nouveau_drm(dev)->client.mmu;
+	struct nv50_head_atom *asyh;
+	struct drm_crtc_state *crtc_state;
+	enum nv50_crc_source source;
+	int ret = 0, ctx_flags = 0, i;
+
+	ret = nv50_crc_parse_source(source_str, &source);
+	if (ret)
+		return ret;
+
+	/*
+	 * Since we don't want the user to accidentally interrupt us as we're
+	 * disabling CRCs
+	 */
+	if (source)
+		ctx_flags |= DRM_MODESET_ACQUIRE_INTERRUPTIBLE;
+	drm_modeset_acquire_init(&ctx, ctx_flags);
+
+	state = drm_atomic_state_alloc(dev);
+	if (!state) {
+		ret = -ENOMEM;
+		goto out_acquire_fini;
+	}
+	state->acquire_ctx = &ctx;
+
+	if (source) {
+		for (i = 0; i < ARRAY_SIZE(head->crc.ctx); i++) {
+			ret = nv50_crc_ctx_init(head, mmu, &crc->ctx[i],
+						func->notifier_len, i);
+			if (ret)
+				goto out_ctx_fini;
+		}
+	}
+
+retry:
+	crtc_state = drm_atomic_get_crtc_state(state, &head->base.base);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		if (ret == -EDEADLK)
+			goto deadlock;
+		else if (ret)
+			goto out_drop_locks;
+	}
+	asyh = nv50_head_atom(crtc_state);
+	asyh->crc.src = source;
+	asyh->or.crc_raster = nv50_crc_raster_type(source);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK)
+		goto deadlock;
+	else if (ret)
+		goto out_drop_locks;
+
+	if (!source) {
+		/*
+		 * If the user specified a custom flip threshold through
+		 * debugfs, reset it
+		 */
+		crc->flip_threshold = func->flip_threshold;
+	}
+
+out_drop_locks:
+	drm_modeset_drop_locks(&ctx);
+out_ctx_fini:
+	if (!source || ret) {
+		for (i = 0; i < ARRAY_SIZE(crc->ctx); i++)
+			nv50_crc_ctx_fini(&crc->ctx[i]);
+	}
+	drm_atomic_state_put(state);
+out_acquire_fini:
+	drm_modeset_acquire_fini(&ctx);
+	return ret;
+
+deadlock:
+	drm_atomic_state_clear(state);
+	drm_modeset_backoff(&ctx);
+	goto retry;
+}
+
+static int
+nv50_crc_debugfs_flip_threshold_get(struct seq_file *m, void *data)
+{
+	struct nv50_head *head = m->private;
+	struct drm_crtc *crtc = &head->base.base;
+	struct nv50_crc *crc = &head->crc;
+	int ret;
+
+	ret = drm_modeset_lock_single_interruptible(&crtc->mutex);
+	if (ret)
+		return ret;
+
+	seq_printf(m, "%d\n", crc->flip_threshold);
+
+	drm_modeset_unlock(&crtc->mutex);
+	return ret;
+}
+
+static int
+nv50_crc_debugfs_flip_threshold_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, nv50_crc_debugfs_flip_threshold_get,
+			   inode->i_private);
+}
+
+static ssize_t
+nv50_crc_debugfs_flip_threshold_set(struct file *file,
+				    const char __user *ubuf, size_t len,
+				    loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct nv50_head *head = m->private;
+	struct nv50_head_atom *armh;
+	struct drm_crtc *crtc = &head->base.base;
+	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nv50_crc *crc = &head->crc;
+	const struct nv50_crc_func *func =
+		nv50_disp(crtc->dev)->core->func->crc;
+	int value, ret;
+
+	ret = kstrtoint_from_user(ubuf, len, 10, &value);
+	if (ret)
+		return ret;
+
+	if (value > func->flip_threshold)
+		return -EINVAL;
+	else if (value == -1)
+		value = func->flip_threshold;
+	else if (value < -1)
+		return -EINVAL;
+
+	ret = drm_modeset_lock_single_interruptible(&crtc->mutex);
+	if (ret)
+		return ret;
+
+	armh = nv50_head_atom(crtc->state);
+	if (armh->crc.src) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	NV_DEBUG(drm,
+		 "Changing CRC flip threshold for next capture on head-%d to %d\n",
+		 head->base.index, value);
+	crc->flip_threshold = value;
+	ret = len;
+
+out:
+	drm_modeset_unlock(&crtc->mutex);
+	return ret;
+}
+
+static const struct file_operations nv50_crc_flip_threshold_fops = {
+	.owner = THIS_MODULE,
+	.open = nv50_crc_debugfs_flip_threshold_open,
+	.read = seq_read,
+	.write = nv50_crc_debugfs_flip_threshold_set,
+};
+
+int nv50_head_crc_late_register(struct nv50_head *head)
+{
+	struct drm_crtc *crtc = &head->base.base;
+	const struct nv50_crc_func *func =
+		nv50_disp(crtc->dev)->core->func->crc;
+	struct dentry *root, *dent;
+
+	if (!func || !crtc->debugfs_entry)
+		return 0;
+
+	root = debugfs_create_dir("nv_crc", crtc->debugfs_entry);
+	if (IS_ERR(root))
+		return PTR_ERR(root);
+
+	dent = debugfs_create_file("flip_threshold", 0644, root, head,
+				   &nv50_crc_flip_threshold_fops);
+	if (IS_ERR(dent))
+		return PTR_ERR(dent);
+
+	return 0;
+}
+
+static inline void
+nv50_crc_init_head(struct nv50_disp *disp, const struct nv50_crc_func *func,
+		   struct nv50_head *head)
+{
+	struct nv50_crc *crc = &head->crc;
+
+	crc->flip_threshold = func->flip_threshold;
+	spin_lock_init(&crc->lock);
+	drm_vblank_work_init(&crc->flip_work, &head->base.base,
+			     nv50_crc_ctx_flip_work);
+}
+
+void nv50_crc_init(struct drm_device *dev)
+{
+	struct nv50_disp *disp = nv50_disp(dev);
+	struct drm_crtc *crtc;
+	const struct nv50_crc_func *func = disp->core->func->crc;
+
+	if (!func)
+		return;
+
+	drm_for_each_crtc(crtc, dev)
+		nv50_crc_init_head(disp, func, nv50_head(crtc));
+}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
new file mode 100644
index 000000000000..11ec20b06534
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NV50_CRC_H__
+#define __NV50_CRC_H__
+
+#include <linux/mutex.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_vblank.h>
+
+#include <nvif/mem.h>
+#include <nvkm/subdev/bios.h>
+#include "nouveau_encoder.h"
+
+struct nv50_disp;
+struct nv50_head;
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+enum nv50_crc_source {
+	NV50_CRC_SOURCE_NONE = 0,
+	NV50_CRC_SOURCE_AUTO,
+	NV50_CRC_SOURCE_RG,
+	NV50_CRC_SOURCE_OUTP_ACTIVE,
+	NV50_CRC_SOURCE_OUTP_COMPLETE,
+	NV50_CRC_SOURCE_OUTP_INACTIVE,
+};
+
+/* RG -> SF (DP only)
+ *    -> SOR
+ *    -> PIOR
+ *    -> DAC
+ */
+enum nv50_crc_source_type {
+	NV50_CRC_SOURCE_TYPE_NONE = 0,
+	NV50_CRC_SOURCE_TYPE_SOR,
+	NV50_CRC_SOURCE_TYPE_PIOR,
+	NV50_CRC_SOURCE_TYPE_DAC,
+	NV50_CRC_SOURCE_TYPE_RG,
+	NV50_CRC_SOURCE_TYPE_SF,
+};
+
+struct nv50_crc_notifier_ctx {
+	struct nvif_mem mem;
+	struct nvif_object ntfy;
+};
+
+struct nv50_crc_atom {
+	enum nv50_crc_source src;
+	/* Only used for gv100+ */
+	u8 wndw : 4;
+};
+
+struct nv50_crc_func {
+	void (*set_src)(struct nv50_head *, int or, enum nv50_crc_source_type,
+			struct nv50_crc_notifier_ctx *, u32 wndw);
+	void (*set_ctx)(struct nv50_head *, struct nv50_crc_notifier_ctx *);
+	u32 (*get_entry)(struct nv50_head *, struct nv50_crc_notifier_ctx *,
+			 enum nv50_crc_source, int idx);
+	bool (*ctx_finished)(struct nv50_head *,
+			     struct nv50_crc_notifier_ctx *);
+	short flip_threshold;
+	short num_entries;
+	size_t notifier_len;
+};
+
+struct nv50_crc {
+	spinlock_t lock;
+	struct nv50_crc_notifier_ctx ctx[2];
+	struct drm_vblank_work flip_work;
+	enum nv50_crc_source src;
+
+	u64 frame;
+	short entry_idx;
+	short flip_threshold;
+	u8 ctx_idx : 1;
+	bool ctx_changed : 1;
+};
+
+void nv50_crc_init(struct drm_device *dev);
+int nv50_head_crc_late_register(struct nv50_head *);
+void nv50_crc_handle_vblank(struct nv50_head *head);
+
+int nv50_crc_verify_source(struct drm_crtc *, const char *, size_t *);
+const char *const *nv50_crc_get_sources(struct drm_crtc *, size_t *);
+int nv50_crc_set_source(struct drm_crtc *, const char *);
+
+int nv50_crc_atomic_check(struct nv50_head *, struct nv50_head_atom *,
+			  struct nv50_head_atom *);
+void nv50_crc_atomic_stop_reporting(struct drm_atomic_state *);
+void nv50_crc_atomic_prepare_notifier_contexts(struct drm_atomic_state *);
+void nv50_crc_atomic_start_reporting(struct drm_atomic_state *);
+void nv50_crc_atomic_set(struct nv50_head *, struct nv50_head_atom *);
+void nv50_crc_atomic_clr(struct nv50_head *);
+
+extern const struct nv50_crc_func crc907d;
+extern const struct nv50_crc_func crcc37d;
+
+#else /* IS_ENABLED(CONFIG_DEBUG_FS) */
+struct nv50_crc {};
+struct nv50_crc_func {};
+struct nv50_crc_atom {};
+
+#define nv50_crc_verify_source NULL
+#define nv50_crc_get_sources NULL
+#define nv50_crc_set_source NULL
+
+static inline void nv50_crc_init(struct nv50_crc *) {}
+static inline void nv50_crc_fini(struct nv50_crc *) {}
+static inline void nv50_crc_get_entries(struct nv50_head *) {}
+static inline int nv50_crc_late_register(nv50_head *) { return 0; }
+
+static inline int
+nv50_crc_atomic_check(struct nv50_head *, struct nv50_head_atom *,
+		      struct nv50_head_atom *) {}
+static inline void
+nv50_crc_atomic_stop_reporting(struct drm_atomic_state *) {}
+static inline void
+nv50_crc_atomic_prepare_notifier_contexts(struct drm_atomic_state *) {}
+static inline void
+nv50_crc_atomic_start_reporting(struct drm_atomic_state *) {}
+static inline void
+nv50_crc_atomic_set(struct nv50_head *, struct nv50_head_atom *) {}
+static inline void
+nv50_crc_atomic_clr(struct nv50_head *) {}
+
+#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
+#endif /* !__NV50_CRC_H__ */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
new file mode 100644
index 000000000000..d2e5f4b8c49f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: MIT */
+#include <drm/drm_crtc.h>
+
+#include "crc.h"
+#include "core.h"
+#include "disp.h"
+#include "head.h"
+
+#define CRC907D_MAX_ENTRIES 255
+
+struct crc907d_notifier {
+	uint32_t status;
+	uint32_t :32; /* reserved */
+	struct crc907d_entry {
+		uint32_t status;
+		uint32_t compositor_crc;
+		u32 output_crc[2];
+	} entries[CRC907D_MAX_ENTRIES];
+} __packed;
+
+static void
+crc907d_set_src(struct nv50_head *head, int or,
+		enum nv50_crc_source_type source,
+		struct nv50_crc_notifier_ctx *ctx, u32 wndw)
+{
+	struct drm_crtc *crtc = &head->base.base;
+	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
+	const u32 hoff = head->base.index * 0x300;
+	u32 *push;
+	u32 crc_args = 0xfff00000;
+
+	switch (source) {
+	case NV50_CRC_SOURCE_TYPE_SOR:
+		crc_args |= (0x00000f0f + or * 16) << 8;
+		break;
+	case NV50_CRC_SOURCE_TYPE_PIOR:
+		crc_args |= (0x000000ff + or * 256) << 8;
+		break;
+	case NV50_CRC_SOURCE_TYPE_DAC:
+		crc_args |= (0x00000ff0 + or) << 8;
+		break;
+	case NV50_CRC_SOURCE_TYPE_RG:
+		crc_args |= (0x00000ff8 + drm_crtc_index(crtc)) << 8;
+		break;
+	case NV50_CRC_SOURCE_TYPE_SF:
+		crc_args |= (0x00000f8f + drm_crtc_index(crtc) * 16) << 8;
+		break;
+	case NV50_CRC_SOURCE_NONE:
+		crc_args |= 0x000fff00;
+		break;
+	}
+
+	push = evo_wait(core, 4);
+	if (!push)
+		return;
+
+	if (source) {
+		evo_mthd(push, 0x0438 + hoff, 1);
+		evo_data(push, ctx->ntfy.handle);
+		evo_mthd(push, 0x0430 + hoff, 1);
+		evo_data(push, crc_args);
+	} else {
+		evo_mthd(push, 0x0430 + hoff, 1);
+		evo_data(push, crc_args);
+		evo_mthd(push, 0x0438 + hoff, 1);
+		evo_data(push, 0);
+	}
+	evo_kick(push, core);
+}
+
+static void crc907d_set_ctx(struct nv50_head *head,
+			    struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
+	u32 *push = evo_wait(core, 2);
+
+	if (!push)
+		return;
+
+	evo_mthd(push, 0x0438 + (head->base.index * 0x300), 1);
+	evo_data(push, ctx ? ctx->ntfy.handle : 0);
+	evo_kick(push, core);
+}
+
+static u32 crc907d_get_entry(struct nv50_head *head,
+			     struct nv50_crc_notifier_ctx *ctx,
+			     enum nv50_crc_source source, int idx)
+{
+	struct crc907d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+
+	return ioread32_native(&notifier->entries[idx].output_crc[0]);
+}
+
+static bool crc907d_ctx_finished(struct nv50_head *head,
+				 struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
+	struct crc907d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+	const u32 status = ioread32_native(&notifier->status);
+	const u32 overflow = status & 0x0000003e;
+
+	if (!(status & 0x00000001))
+		return false;
+
+	if (overflow) {
+		const char *engine = NULL;
+
+		switch (overflow) {
+			case 0x00000004: engine = "DSI"; break;
+			case 0x00000008: engine = "Compositor"; break;
+			case 0x00000010: engine = "CRC output 1"; break;
+			case 0x00000020: engine = "CRC output 2"; break;
+		}
+
+		if (engine)
+			NV_ERROR(drm,
+				 "CRC notifier context for head %d overflowed on %s: %x\n",
+				 head->base.index, engine, status);
+		else
+			NV_ERROR(drm,
+				 "CRC notifier context for head %d overflowed: %x\n",
+				 head->base.index, status);
+	}
+
+	NV_DEBUG(drm, "Head %d CRC context status: %x\n",
+		 head->base.index, status);
+
+	return true;
+}
+
+const struct nv50_crc_func crc907d = {
+	.set_src = crc907d_set_src,
+	.set_ctx = crc907d_set_ctx,
+	.get_entry = crc907d_get_entry,
+	.ctx_finished = crc907d_ctx_finished,
+	.flip_threshold = CRC907D_MAX_ENTRIES - 10,
+	.num_entries = CRC907D_MAX_ENTRIES,
+	.notifier_len = sizeof(struct crc907d_notifier),
+};
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
new file mode 100644
index 000000000000..19b50948f486
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -0,0 +1,153 @@
+/* SPDX-License-Identifier: MIT */
+#include <drm/drm_crtc.h>
+
+#include "crc.h"
+#include "core.h"
+#include "disp.h"
+#include "head.h"
+
+#define CRCC37D_MAX_ENTRIES 2047
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
+static void
+crcc37d_set_src(struct nv50_head *head, int or,
+		enum nv50_crc_source_type source,
+		struct nv50_crc_notifier_ctx *ctx, u32 wndw)
+{
+	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
+	const u32 hoff = head->base.index * 0x400;
+	u32 *push;
+	u32 crc_args;
+
+	switch (source) {
+	case NV50_CRC_SOURCE_TYPE_SOR:
+		crc_args = (0x00000050 + or) << 12;
+		break;
+	case NV50_CRC_SOURCE_TYPE_PIOR:
+		crc_args = (0x00000060 + or) << 12;
+		break;
+	case NV50_CRC_SOURCE_TYPE_SF:
+		crc_args = 0x00000030 << 12;
+		break;
+	default:
+		crc_args = 0;
+		break;
+	}
+
+	push = evo_wait(core, 4);
+	if (!push)
+		return;
+
+	if (source) {
+		evo_mthd(push, 0x2180 + hoff, 1);
+		evo_data(push, ctx->ntfy.handle);
+		evo_mthd(push, 0x2184 + hoff, 1);
+		evo_data(push, crc_args | wndw);
+	} else {
+		evo_mthd(push, 0x2184 + hoff, 1);
+		evo_data(push, 0);
+		evo_mthd(push, 0x2180 + hoff, 1);
+		evo_data(push, 0);
+	}
+
+	evo_kick(push, core);
+}
+
+static void crcc37d_set_ctx(struct nv50_head *head,
+			    struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
+	u32 *push = evo_wait(core, 2);
+
+	if (!push)
+		return;
+
+	evo_mthd(push, 0x2180 + (head->base.index * 0x400), 1);
+	evo_data(push, ctx ? ctx->ntfy.handle : 0);
+	evo_kick(push, core);
+}
+
+static u32 crcc37d_get_entry(struct nv50_head *head,
+			     struct nv50_crc_notifier_ctx *ctx,
+			     enum nv50_crc_source source, int idx)
+{
+	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+	struct crcc37d_entry __iomem *entry = &notifier->entries[idx];
+	u32 __iomem *crc_addr;
+
+	if (source == NV50_CRC_SOURCE_RG)
+		crc_addr = &entry->rg_crc;
+	else
+		crc_addr = &entry->output_crc[0];
+
+	return ioread32_native(crc_addr);
+}
+
+static bool crcc37d_ctx_finished(struct nv50_head *head,
+				 struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
+	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+	const u32 status = ioread32_native(&notifier->status);
+	const u32 overflow = status & 0x0000007e;
+
+	if (!(status & 0x00000001))
+		return false;
+
+	if (overflow) {
+		const char *engine = NULL;
+
+		switch (overflow) {
+		case 0x00000004: engine = "Front End"; break;
+		case 0x00000008: engine = "Compositor"; break;
+		case 0x00000010: engine = "RG"; break;
+		case 0x00000020: engine = "CRC output 1"; break;
+		case 0x00000040: engine = "CRC output 2"; break;
+		}
+
+		if (engine)
+			NV_ERROR(drm,
+				 "CRC notifier context for head %d overflowed on %s: %x\n",
+				 head->base.index, engine, status);
+		else
+			NV_ERROR(drm,
+				 "CRC notifier context for head %d overflowed: %x\n",
+				 head->base.index, status);
+	}
+
+	NV_DEBUG(drm, "Head %d CRC context status: %x\n",
+		 head->base.index, status);
+
+	return true;
+}
+
+const struct nv50_crc_func crcc37d = {
+	.set_src = crcc37d_set_src,
+	.set_ctx = crcc37d_set_ctx,
+	.get_entry = crcc37d_get_entry,
+	.ctx_finished = crcc37d_ctx_finished,
+	.flip_threshold = CRCC37D_MAX_ENTRIES - 30,
+	.num_entries = CRCC37D_MAX_ENTRIES,
+	.notifier_len = sizeof(struct crcc37d_notifier),
+};
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index bfea85782d0e..47015cea8063 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -775,6 +775,19 @@ struct nv50_msto {
 	bool disabled;
 };
 
+struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder)
+{
+	struct nv50_msto *msto;
+
+	if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST)
+		return nouveau_encoder(encoder);
+
+	msto = nv50_msto(encoder);
+	if (!msto->mstc)
+		return NULL;
+	return msto->mstc->mstm->outp;
+}
+
 static struct drm_dp_payload *
 nv50_msto_payload(struct nv50_msto *msto)
 {
@@ -1898,6 +1911,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	int i;
 
 	NV_ATOMIC(drm, "commit %d %d\n", atom->lock_core, atom->flush_disable);
+	nv50_crc_atomic_stop_reporting(state);
 	drm_atomic_helper_wait_for_fences(dev, state, false);
 	drm_atomic_helper_wait_for_dependencies(state);
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
@@ -1907,6 +1921,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 
 	/* Disable head(s). */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		struct nv50_head_atom *armh = nv50_head_atom(old_crtc_state);
 		struct nv50_head_atom *asyh = nv50_head_atom(new_crtc_state);
 		struct nv50_head *head = nv50_head(crtc);
 
@@ -1919,7 +1934,8 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 		}
 
 		if (asyh->clr.mask) {
-			nv50_head_flush_clr(head, asyh, atom->flush_disable);
+			nv50_head_flush_clr(head, armh, asyh,
+					    atom->flush_disable);
 			interlock[NV50_DISP_INTERLOCK_CORE] |= 1;
 		}
 	}
@@ -1968,6 +1984,8 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 		}
 	}
 
+	nv50_crc_atomic_prepare_notifier_contexts(state);
+
 	/* Update output path(s). */
 	list_for_each_entry_safe(outp, outt, &atom->outp, head) {
 		const struct drm_encoder_helper_funcs *help;
@@ -1990,6 +2008,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 
 	/* Update head(s). */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		struct nv50_head_atom *armh = nv50_head_atom(old_crtc_state);
 		struct nv50_head_atom *asyh = nv50_head_atom(new_crtc_state);
 		struct nv50_head *head = nv50_head(crtc);
 
@@ -1997,7 +2016,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			  asyh->set.mask, asyh->clr.mask);
 
 		if (asyh->set.mask) {
-			nv50_head_flush_set(head, asyh);
+			nv50_head_flush_set(head, armh, asyh);
 			interlock[NV50_DISP_INTERLOCK_CORE] = 1;
 		}
 
@@ -2081,6 +2100,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 		}
 	}
 
+	nv50_crc_atomic_start_reporting(state);
 	drm_atomic_helper_commit_hw_done(state);
 	drm_atomic_helper_cleanup_planes(dev, state);
 	drm_atomic_helper_commit_cleanup_done(state);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 8935ebce8ab0..da72223277fe 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -1,10 +1,12 @@
 #ifndef __NV50_KMS_H__
 #define __NV50_KMS_H__
+#include <linux/workqueue.h>
 #include <nvif/mem.h>
 
 #include "nouveau_display.h"
 
 struct nv50_msto;
+struct nouveau_encoder;
 
 struct nv50_disp {
 	struct nvif_disp *disp;
@@ -89,6 +91,14 @@ int nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 		     u64 syncbuf, struct nv50_dmac *dmac);
 void nv50_dmac_destroy(struct nv50_dmac *);
 
+/*
+ * For normal encoders this just returns the encoder. For active MST encoders,
+ * this returns the real outp that's driving displays on the topology.
+ * Inactive MST encoders return NULL, since they would have no real outp to
+ * return anyway.
+ */
+struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
+
 u32 *evo_wait(struct nv50_dmac *, int nr);
 void evo_kick(u32 *, struct nv50_dmac *);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/handles.h b/drivers/gpu/drm/nouveau/dispnv50/handles.h
index e3a62c7a0d08..a97a7bd29243 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/handles.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/handles.h
@@ -11,5 +11,6 @@
 #define NV50_DISP_HANDLE_VRAM                                           0xf0000001
 
 #define NV50_DISP_HANDLE_WNDW_CTX(kind)                        (0xfb000000 | kind)
+#define NV50_DISP_HANDLE_CRC_CTX(head, i) (0xfc000000 | head->base.index << 1 | i)
 
 #endif /* !__NV50_KMS_HANDLES_H__ */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 72bc3bce396a..4668bcfb596c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -24,27 +24,36 @@
 #include "core.h"
 #include "curs.h"
 #include "ovly.h"
+#include "crc.h"
 
 #include <nvif/class.h>
+#include <nvif/event.h>
+#include <nvif/cl0046.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_vblank.h>
 #include "nouveau_connector.h"
+
 void
 nv50_head_flush_clr(struct nv50_head *head,
-		    struct nv50_head_atom *asyh, bool flush)
+		    struct nv50_head_atom *armh,
+		    struct nv50_head_atom *asyh,
+		    bool flush)
 {
 	union nv50_head_atom_mask clr = {
 		.mask = asyh->clr.mask & ~(flush ? 0 : asyh->set.mask),
 	};
+	if (clr.crc)  nv50_crc_atomic_clr(head);
 	if (clr.olut) head->func->olut_clr(head);
 	if (clr.core) head->func->core_clr(head);
 	if (clr.curs) head->func->curs_clr(head);
 }
 
 void
-nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
+nv50_head_flush_set(struct nv50_head *head,
+		    struct nv50_head_atom *armh,
+		    struct nv50_head_atom *asyh)
 {
 	if (asyh->set.view   ) head->func->view    (head, asyh);
 	if (asyh->set.mode   ) head->func->mode    (head, asyh);
@@ -61,6 +70,7 @@ nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 	if (asyh->set.ovly   ) head->func->ovly    (head, asyh);
 	if (asyh->set.dither ) head->func->dither  (head, asyh);
 	if (asyh->set.procamp) head->func->procamp (head, asyh);
+	if (asyh->set.crc    ) nv50_crc_atomic_set (head, asyh);
 	if (asyh->set.or     ) head->func->or      (head, asyh);
 }
 
@@ -313,7 +323,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
 	struct nouveau_conn_atom *asyc = NULL;
 	struct drm_connector_state *conns;
 	struct drm_connector *conn;
-	int i;
+	int i, ret;
 
 	NV_ATOMIC(drm, "%s atomic_check %d\n", crtc->name, asyh->state.active);
 	if (asyh->state.active) {
@@ -408,6 +418,10 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
 		asyh->set.curs = asyh->curs.visible;
 	}
 
+	ret = nv50_crc_atomic_check(head, asyh, armh);
+	if (ret)
+		return ret;
+
 	if (asyh->clr.mask || asyh->set.mask)
 		nv50_atom(asyh->state.state)->lock_core = true;
 	return 0;
@@ -446,6 +460,7 @@ nv50_head_atomic_duplicate_state(struct drm_crtc *crtc)
 	asyh->ovly = armh->ovly;
 	asyh->dither = armh->dither;
 	asyh->procamp = armh->procamp;
+	asyh->crc = armh->crc;
 	asyh->or = armh->or;
 	asyh->dp = armh->dp;
 	asyh->clr.mask = 0;
@@ -467,10 +482,18 @@ nv50_head_reset(struct drm_crtc *crtc)
 	__drm_atomic_helper_crtc_reset(crtc, &asyh->state);
 }
 
+static int
+nv50_head_late_register(struct drm_crtc *crtc)
+{
+	return nv50_head_crc_late_register(nv50_head(crtc));
+}
+
 static void
 nv50_head_destroy(struct drm_crtc *crtc)
 {
 	struct nv50_head *head = nv50_head(crtc);
+
+	nvif_notify_fini(&head->base.vblank);
 	nv50_lut_fini(&head->olut);
 	drm_crtc_cleanup(crtc);
 	kfree(head);
@@ -488,8 +511,38 @@ nv50_head_func = {
 	.enable_vblank = nouveau_display_vblank_enable,
 	.disable_vblank = nouveau_display_vblank_disable,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.late_register = nv50_head_late_register,
+};
+
+static const struct drm_crtc_funcs
+nvd9_head_func = {
+	.reset = nv50_head_reset,
+	.gamma_set = drm_atomic_helper_legacy_gamma_set,
+	.destroy = nv50_head_destroy,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = nv50_head_atomic_duplicate_state,
+	.atomic_destroy_state = nv50_head_atomic_destroy_state,
+	.enable_vblank = nouveau_display_vblank_enable,
+	.disable_vblank = nouveau_display_vblank_disable,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.verify_crc_source = nv50_crc_verify_source,
+	.get_crc_sources = nv50_crc_get_sources,
+	.set_crc_source = nv50_crc_set_source,
+	.late_register = nv50_head_late_register,
 };
 
+static int nv50_head_vblank_handler(struct nvif_notify *notify)
+{
+	struct nouveau_crtc *nv_crtc =
+		container_of(notify, struct nouveau_crtc, vblank);
+
+	if (drm_crtc_handle_vblank(&nv_crtc->base))
+		nv50_crc_handle_vblank(nv50_head(&nv_crtc->base));
+
+	return NVIF_NOTIFY_KEEP;
+}
+
 struct nv50_head *
 nv50_head_create(struct drm_device *dev, int index)
 {
@@ -497,7 +550,9 @@ nv50_head_create(struct drm_device *dev, int index)
 	struct nv50_disp *disp = nv50_disp(dev);
 	struct nv50_head *head;
 	struct nv50_wndw *base, *ovly, *curs;
+	struct nouveau_crtc *nv_crtc;
 	struct drm_crtc *crtc;
+	const struct drm_crtc_funcs *funcs;
 	int ret;
 
 	head = kzalloc(sizeof(*head), GFP_KERNEL);
@@ -507,6 +562,11 @@ nv50_head_create(struct drm_device *dev, int index)
 	head->func = disp->core->func->head;
 	head->base.index = index;
 
+	if (disp->disp->object.oclass < GF110_DISP)
+		funcs = &nv50_head_func;
+	else
+		funcs = &nvd9_head_func;
+
 	if (disp->disp->object.oclass < GV100_DISP) {
 		ret = nv50_base_new(drm, head->base.index, &base);
 		if (ret)
@@ -531,9 +591,10 @@ nv50_head_create(struct drm_device *dev, int index)
 	if (ret)
 		goto fail_free;
 
-	crtc = &head->base.base;
+	nv_crtc = &head->base;
+	crtc = &nv_crtc->base;
 	drm_crtc_init_with_planes(dev, crtc, &base->plane, &curs->plane,
-				  &nv50_head_func, "head-%d", head->base.index);
+				  funcs, "head-%d", head->base.index);
 	drm_crtc_helper_add(crtc, &nv50_head_help);
 	/* Keep the legacy gamma size at 256 to avoid compatibility issues */
 	drm_mode_crtc_set_gamma_size(crtc, 256);
@@ -547,8 +608,22 @@ nv50_head_create(struct drm_device *dev, int index)
 			goto fail_crtc_cleanup;
 	}
 
+	ret = nvif_notify_init(&disp->disp->object, nv50_head_vblank_handler,
+			       false, NV04_DISP_NTFY_VBLANK,
+			       &(struct nvif_notify_head_req_v0) {
+				    .head = nv_crtc->index,
+			       },
+			       sizeof(struct nvif_notify_head_req_v0),
+			       sizeof(struct nvif_notify_head_rep_v0),
+			       &nv_crtc->vblank);
+	if (ret)
+		goto fail_lut_fini;
+
 	return head;
 
+fail_lut_fini:
+	if (head->func->olut_set)
+		nv50_lut_fini(&head->olut);
 fail_crtc_cleanup:
 	drm_crtc_cleanup(crtc);
 fail_free:
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h b/drivers/gpu/drm/nouveau/dispnv50/head.h
index c05bbba9e247..2e57910ba450 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
@@ -1,22 +1,29 @@
 #ifndef __NV50_KMS_HEAD_H__
 #define __NV50_KMS_HEAD_H__
 #define nv50_head(c) container_of((c), struct nv50_head, base.base)
+#include <linux/workqueue.h>
+
 #include "disp.h"
 #include "atom.h"
+#include "crc.h"
 #include "lut.h"
 
 #include "nouveau_crtc.h"
+#include "nouveau_encoder.h"
 
 struct nv50_head {
 	const struct nv50_head_func *func;
 	struct nouveau_crtc base;
+	struct nv50_crc crc;
 	struct nv50_lut olut;
 	struct nv50_msto *msto;
 };
 
 struct nv50_head *nv50_head_create(struct drm_device *, int index);
-void nv50_head_flush_set(struct nv50_head *, struct nv50_head_atom *);
-void nv50_head_flush_clr(struct nv50_head *, struct nv50_head_atom *, bool y);
+void nv50_head_flush_set(struct nv50_head *, struct nv50_head_atom *armh,
+			 struct nv50_head_atom *asyh);
+void nv50_head_flush_clr(struct nv50_head *, struct nv50_head_atom *armh,
+			 struct nv50_head_atom *asyh, bool y);
 
 struct nv50_head_func {
 	void (*view)(struct nv50_head *, struct nv50_head_atom *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head907d.c b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
index 3002ec23d7a6..63a0b45d96d6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
@@ -19,8 +19,15 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+#include <drm/drm_connector.h>
+#include <drm/drm_mode_config.h>
+#include <drm/drm_vblank.h>
+#include "nouveau_drv.h"
+#include "nouveau_bios.h"
+#include "nouveau_connector.h"
 #include "head.h"
 #include "core.h"
+#include "crc.h"
 
 void
 head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
@@ -29,9 +36,10 @@ head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 	u32 *push;
 	if ((push = evo_wait(core, 3))) {
 		evo_mthd(push, 0x0404 + (head->base.index * 0x300), 2);
-		evo_data(push, 0x00000001 | asyh->or.depth  << 6 |
-					    asyh->or.nvsync << 4 |
-					    asyh->or.nhsync << 3);
+		evo_data(push, asyh->or.depth  << 6 |
+			       asyh->or.nvsync << 4 |
+			       asyh->or.nhsync << 3 |
+			       asyh->or.crc_raster);
 		evo_data(push, 0x31ec6000 | head->base.index << 25 |
 					    asyh->mode.interlace);
 		evo_kick(push, core);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index cf5a68f4021a..87dd11b2fe96 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -46,10 +46,10 @@ headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 		}
 
 		evo_mthd(push, 0x2004 + (head->base.index * 0x400), 1);
-		evo_data(push, 0x00000001 |
-			       asyh->or.depth << 4 |
+		evo_data(push, depth << 4 |
 			       asyh->or.nvsync << 3 |
-			       asyh->or.nhsync << 2);
+			       asyh->or.nhsync << 2 |
+			       asyh->or.crc_raster);
 		evo_kick(push, core);
 	}
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 65e3b60804c6..e6cef3593aec 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -46,10 +46,11 @@ headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 		}
 
 		evo_mthd(push, 0x2004 + (head->base.index * 0x400), 1);
-		evo_data(push, 0xfc000001 |
-			       asyh->or.depth << 4 |
+		evo_data(push, 0xfc000000 |
+			       depth << 4 |
 			       asyh->or.nvsync << 3 |
-			       asyh->or.nhsync << 2);
+			       asyh->or.nhsync << 2 |
+			       asyh->or.crc_raster);
 		evo_kick(push, core);
 	}
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 700817dc4fa0..7a0bd9a720a0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -43,15 +43,7 @@
 #include <nvif/class.h>
 #include <nvif/cl0046.h>
 #include <nvif/event.h>
-
-static int
-nouveau_display_vblank_handler(struct nvif_notify *notify)
-{
-	struct nouveau_crtc *nv_crtc =
-		container_of(notify, typeof(*nv_crtc), vblank);
-	drm_crtc_handle_vblank(&nv_crtc->base);
-	return NVIF_NOTIFY_KEEP;
-}
+#include <dispnv50/crc.h>
 
 int
 nouveau_display_vblank_enable(struct drm_crtc *crtc)
@@ -135,50 +127,6 @@ nouveau_display_scanoutpos(struct drm_crtc *crtc,
 					       stime, etime);
 }
 
-static void
-nouveau_display_vblank_fini(struct drm_device *dev)
-{
-	struct drm_crtc *crtc;
-
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-		nvif_notify_fini(&nv_crtc->vblank);
-	}
-}
-
-static int
-nouveau_display_vblank_init(struct drm_device *dev)
-{
-	struct nouveau_display *disp = nouveau_display(dev);
-	struct drm_crtc *crtc;
-	int ret;
-
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-		ret = nvif_notify_init(&disp->disp.object,
-				       nouveau_display_vblank_handler, false,
-				       NV04_DISP_NTFY_VBLANK,
-				       &(struct nvif_notify_head_req_v0) {
-					.head = nv_crtc->index,
-				       },
-				       sizeof(struct nvif_notify_head_req_v0),
-				       sizeof(struct nvif_notify_head_rep_v0),
-				       &nv_crtc->vblank);
-		if (ret) {
-			nouveau_display_vblank_fini(dev);
-			return ret;
-		}
-	}
-
-	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
-	if (ret) {
-		nouveau_display_vblank_fini(dev);
-		return ret;
-	}
-
-	return 0;
-}
-
 static void
 nouveau_user_framebuffer_destroy(struct drm_framebuffer *drm_fb)
 {
@@ -545,9 +493,12 @@ nouveau_display_create(struct drm_device *dev)
 	drm_mode_config_reset(dev);
 
 	if (dev->mode_config.num_crtc) {
-		ret = nouveau_display_vblank_init(dev);
+		ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 		if (ret)
 			goto vblank_err;
+
+		if (disp->disp.object.oclass >= NV50_DISP)
+			nv50_crc_init(dev);
 	}
 
 	INIT_WORK(&drm->hpd_work, nouveau_display_hpd_work);
@@ -574,7 +525,6 @@ nouveau_display_destroy(struct drm_device *dev)
 #ifdef CONFIG_ACPI
 	unregister_acpi_notifier(&nouveau_drm(dev)->acpi_nb);
 #endif
-	nouveau_display_vblank_fini(dev);
 
 	drm_kms_helper_poll_fini(dev);
 	drm_mode_config_cleanup(dev);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
