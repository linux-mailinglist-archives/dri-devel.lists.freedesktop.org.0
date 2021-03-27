Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F134B33F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 01:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2754D6F50B;
	Sat, 27 Mar 2021 00:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD936F507
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 00:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616803838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39EjvsduyyfiFVOpgoxS9AYEbRsiYTMMDiu0NqkCn5U=;
 b=VOv0YoU7vAyLn2x7BybDEMGKMp4z+Mb0ALrc1S9GJKPQmiYK3tpn4jJBth2DO5jh8ujMNU
 71BeKooJ5IugtCrECMbgMvUr8Z111E9Vg0xw6Qq85aRQRc3kdlaP8mc8lCiYm8VeDYG3XR
 IK1H8FZVvQLTA0XjZBBHZ2GcepTItEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-Zn0K5_yoPbKfnAuouO-sRw-1; Fri, 26 Mar 2021 20:10:33 -0400
X-MC-Unique: Zn0K5_yoPbKfnAuouO-sRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E21107ACCA;
 Sat, 27 Mar 2021 00:10:31 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71EF41972B;
 Sat, 27 Mar 2021 00:10:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/nouveau: Use helper to convert nouveau_drm to
 drm_device
Date: Fri, 26 Mar 2021 20:09:59 -0400
Message-Id: <20210327001001.229093-2-lyude@redhat.com>
In-Reply-To: <20210327001001.229093-1-lyude@redhat.com>
References: <20210327001001.229093-1-lyude@redhat.com>
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
Cc: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jeremy Cline <jcline@redhat.com>

In order to use the resource-managed allocation of a struct drm_device
instance, it is recommended to embed the drm_device instance within the
driver-specific structure.

As there is already a helper to convert a drm_device to a nouveau_drm
struct, this adds an inverse function and changes all direct references
to the pointer within nouveau_drm to use the function. It also adds a
helper to convert directly to a generic device structure.

This allows us to switch from maintaining a pointer in nouveau_drm to
embedding the structure by simply altering the helper function
implementations.

This patch should introduce no functional changes.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     | 10 +++---
 drivers/gpu/drm/nouveau/dispnv50/base.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  7 ++--
 drivers/gpu/drm/nouveau/dispnv50/core.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  5 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 16 +++++----
 drivers/gpu/drm/nouveau/dispnv50/oimm.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  5 +--
 drivers/gpu/drm/nouveau/dispnv50/wimm.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  5 +--
 drivers/gpu/drm/nouveau/nouveau_bo.c        | 14 ++++----
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_display.c   | 16 ++++-----
 drivers/gpu/drm/nouveau/nouveau_dmem.c      | 17 +++++-----
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h       | 36 ++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     | 19 +++++------
 drivers/gpu/drm/nouveau/nouveau_gem.c       |  8 ++---
 drivers/gpu/drm/nouveau/nouveau_svm.c       |  4 +--
 drivers/gpu/drm/nouveau/nouveau_ttm.c       | 10 +++---
 drivers/gpu/drm/nouveau/nouveau_vga.c       |  8 ++---
 27 files changed, 128 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index f9e962fd94d0..3e1b00f3086e 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -915,7 +915,7 @@ nv04_crtc_mode_set_base_atomic(struct drm_crtc *crtc,
 			       int x, int y, enum mode_set_atomic state)
 {
 	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 
 	if (state == ENTER_ATOMIC_MODE_SET)
 		nouveau_fbcon_accel_save_disable(dev);
@@ -990,7 +990,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		     uint32_t buffer_handle, uint32_t width, uint32_t height)
 {
 	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_bo *cursor = NULL;
 	struct drm_gem_object *gem;
@@ -1050,7 +1050,7 @@ nv04_finish_page_flip(struct nouveau_channel *chan,
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_drm *drm = chan->drm;
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct nv04_page_flip_state *s;
 	unsigned long flags;
 
@@ -1088,7 +1088,7 @@ nv04_flip_complete(struct nvif_notify *notify)
 	struct nv04_page_flip_state state;
 
 	if (!nv04_finish_page_flip(chan, &state)) {
-		nv_set_crtc_base(drm->dev, drm_crtc_index(state.crtc),
+		nv_set_crtc_base(nouveau_to_drm_dev(drm), drm_crtc_index(state.crtc),
 				 state.offset + state.crtc->y *
 				 state.pitch + state.crtc->x *
 				 state.bpp / 8);
@@ -1106,7 +1106,7 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_drm *drm = chan->drm;
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct nvif_push *push = chan->chan.push;
 	unsigned long flags;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base.c b/drivers/gpu/drm/nouveau/dispnv50/base.c
index 7c752acf2b48..cd70456dd37f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base.c
@@ -40,7 +40,7 @@ nv50_base_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 		{  NV50_DISP_BASE_CHANNEL_DMA, 0, base507c_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, bases);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 788db043a342..db309fe175c2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -309,12 +309,13 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	struct nv50_disp_base_channel_dma_v0 args = {
 		.head = head,
 	};
-	struct nouveau_display *disp = nouveau_display(drm->dev);
-	struct nv50_disp *disp50 = nv50_disp(drm->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
+	struct nouveau_display *disp = nouveau_display(dev);
+	struct nv50_disp *disp50 = nv50_disp(dev);
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(func, drm->dev, DRM_PLANE_TYPE_PRIMARY,
+	ret = nv50_wndw_new_(func, dev, DRM_PLANE_TYPE_PRIMARY,
 			     "base", head, format, BIT(head),
 			     NV50_DISP_INTERLOCK_BASE, interlock_data, &wndw);
 	if (*pwndw = wndw, ret)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index abefc2343443..e311aaeec91d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -59,7 +59,7 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 		{  NV50_DISP_CORE_CHANNEL_DMA, 0, core507d_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, cores);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index 1a1d806e0b01..15db193b684a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -158,7 +158,7 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
 	      s32 oclass, struct nv50_core **pcore)
 {
 	struct nv50_disp_core_channel_dma_v0 args = {};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	struct nv50_core *core;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs.c b/drivers/gpu/drm/nouveau/dispnv50/curs.c
index 31d8b2e4791d..e8747ae1f6cc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs.c
@@ -41,7 +41,7 @@ nv50_curs_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 		{  NV50_DISP_CURSOR, 0, curs507a_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, curses);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 00e19fd959ea..ac9855aab5b1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -153,11 +153,12 @@ curs507a_new_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	struct nv50_disp_cursor_v0 args = {
 		.head = head,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
+	struct nv50_disp *disp = nv50_disp(dev);
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(&curs507a_wndw, drm->dev, DRM_PLANE_TYPE_CURSOR,
+	ret = nv50_wndw_new_(&curs507a_wndw, dev, DRM_PLANE_TYPE_CURSOR,
 			     "curs", head, curs507a_format, BIT(head),
 			     NV50_DISP_INTERLOCK_CURS, interlock_data, &wndw);
 	if (*pwndw = wndw, ret)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 351f95498953..30e54dbb3b63 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -339,7 +339,8 @@ static int
 nv50_outp_acquire(struct nouveau_encoder *nv_encoder, bool hda)
 {
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
+	struct nv50_disp *disp = nv50_disp(dev);
 	struct {
 		struct nv50_disp_mthd_v1 base;
 		struct nv50_disp_acquire_v0 info;
@@ -628,7 +629,7 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 
 	mutex_lock(&drm->audio.lock);
 
-	drm_for_each_encoder(encoder, drm->dev) {
+	drm_for_each_encoder(encoder, drm_dev) {
 		struct nouveau_connector *nv_connector = NULL;
 
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
@@ -701,7 +702,7 @@ static const struct component_ops nv50_audio_component_bind_ops = {
 static void
 nv50_audio_component_init(struct nouveau_drm *drm)
 {
-	if (component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
+	if (component_add(nouveau_to_dev(drm), &nv50_audio_component_bind_ops))
 		return;
 
 	drm->audio.component_registered = true;
@@ -714,7 +715,7 @@ nv50_audio_component_fini(struct nouveau_drm *drm)
 	if (!drm->audio.component_registered)
 		return;
 
-	component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
+	component_del(nouveau_to_dev(drm), &nv50_audio_component_bind_ops);
 	drm->audio.component_registered = false;
 	mutex_destroy(&drm->audio.lock);
 }
@@ -2031,14 +2032,15 @@ static void
 nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 {
 	struct nouveau_drm *drm = nouveau_drm(state->dev);
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
+	struct nv50_disp *disp = nv50_disp(dev);
 	struct nv50_core *core = disp->core;
 	struct nv50_mstm *mstm;
 	struct drm_encoder *encoder;
 
 	NV_ATOMIC(drm, "commit core %08x\n", interlock[NV50_DISP_INTERLOCK_BASE]);
 
-	drm_for_each_encoder(encoder, drm->dev) {
+	drm_for_each_encoder(encoder, dev) {
 		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
 			mstm = nouveau_encoder(encoder)->dp.mstm;
 			if (mstm && mstm->modified)
@@ -2052,7 +2054,7 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 				       disp->core->chan.base.device))
 		NV_ERROR(drm, "core notifier timeout\n");
 
-	drm_for_each_encoder(encoder, drm->dev) {
+	drm_for_each_encoder(encoder, dev) {
 		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
 			mstm = nouveau_encoder(encoder)->dp.mstm;
 			if (mstm && mstm->modified)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/oimm.c b/drivers/gpu/drm/nouveau/dispnv50/oimm.c
index 2a2841d344c8..e90074f0e6de 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/oimm.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/oimm.c
@@ -38,7 +38,7 @@ nv50_oimm_init(struct nouveau_drm *drm, struct nv50_wndw *wndw)
 		{  NV50_DISP_OVERLAY, 0, oimm507b_init },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, oimms);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c b/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c
index a6c3a9b95bdb..9b83a5097ed2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c
@@ -30,7 +30,7 @@ oimm507b_init_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	struct nv50_disp_overlay_v0 args = {
 		.head = wndw->id,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int ret;
 
 	ret = nvif_object_ctor(&disp->disp->object, "kmsOvim", 0, oclass,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly.c b/drivers/gpu/drm/nouveau/dispnv50/ovly.c
index 90c246d47604..9067942fd87b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly.c
@@ -40,7 +40,7 @@ nv50_ovly_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 		{  NV50_DISP_OVERLAY_CHANNEL_DMA, 0, ovly507e_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid, ret;
 
 	cid = nvif_mclass(&disp->disp->object, ovlys);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index afd6c7271de1..252e0189b155 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -150,11 +150,12 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 	struct nv50_disp_overlay_channel_dma_v0 args = {
 		.head = head,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
+	struct nv50_disp *disp = nv50_disp(dev);
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(func, drm->dev, DRM_PLANE_TYPE_OVERLAY,
+	ret = nv50_wndw_new_(func, dev, DRM_PLANE_TYPE_OVERLAY,
 			     "ovly", head, format, BIT(head),
 			     NV50_DISP_INTERLOCK_OVLY, interlock_data,
 			     &wndw);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimm.c b/drivers/gpu/drm/nouveau/dispnv50/wimm.c
index 566fbddfc8d7..5c9b2d30c36e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimm.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimm.c
@@ -36,7 +36,7 @@ nv50_wimm_init(struct nouveau_drm *drm, struct nv50_wndw *wndw)
 		{ GV100_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, wimms);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
index b390029c69ec..93d6d420769b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
@@ -72,7 +72,7 @@ wimmc37b_init_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 		.pushbuf = 0xb0007b00 | wndw->id,
 		.index = wndw->id,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int ret;
 
 	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 3aecd46edd53..9b489075e1e3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -799,7 +799,7 @@ nv50_wndw_new(struct nouveau_drm *drm, enum drm_plane_type type, int index,
 		{ GV100_DISP_WINDOW_CHANNEL_DMA, 0, wndwc37e_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid, ret;
 
 	cid = nvif_mclass(&disp->disp->object, wndws);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 183d2c0e65b6..1f476b2ce44c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -355,11 +355,12 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 		.pushbuf = 0xb0007e00 | index,
 		.index = index,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
+	struct nv50_disp *disp = nv50_disp(dev);
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(func, drm->dev, type, "wndw", index,
+	ret = nv50_wndw_new_(func, dev, type, "wndw", index,
 			     wndwc37e_format, heads, NV50_DISP_INTERLOCK_WNDW,
 			     BIT(index), &wndw);
 	if (*pwndw = wndw, ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e891365fbe94..0b3b45a0f773 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -136,7 +136,7 @@ static void
 nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 
 	WARN_ON(nvbo->bo.pin_count > 0);
@@ -544,6 +544,7 @@ void
 nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i, j;
 
@@ -565,7 +566,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 
 			++num_pages;
 		}
-		dma_sync_single_for_device(drm->dev->dev,
+		dma_sync_single_for_device(dev->dev,
 					   ttm_dma->dma_address[i],
 					   num_pages * PAGE_SIZE, DMA_TO_DEVICE);
 		i += num_pages;
@@ -576,6 +577,7 @@ void
 nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i, j;
 
@@ -598,7 +600,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 			++num_pages;
 		}
 
-		dma_sync_single_for_cpu(drm->dev->dev, ttm_dma->dma_address[i],
+		dma_sync_single_for_cpu(dev->dev, ttm_dma->dma_address[i],
 					num_pages * PAGE_SIZE, DMA_FROM_DEVICE);
 		i += num_pages;
 	}
@@ -797,7 +799,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 			return ret;
 	}
 
-	if (drm_drv_uses_atomic_modeset(drm->dev))
+	if (drm_drv_uses_atomic_modeset(nouveau_to_drm_dev(drm)))
 		mutex_lock(&cli->mutex);
 	else
 		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
@@ -927,7 +929,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_resource *new_reg,
 		   struct nouveau_drm_tile **new_tile)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	u64 offset = new_reg->start << PAGE_SHIFT;
 
@@ -949,7 +951,7 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 		      struct nouveau_drm_tile **old_tile)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct dma_fence *fence = dma_resv_get_excl(bo->base.resv);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index c2bc05eb2e54..04635c327726 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -51,19 +51,20 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
 	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	int ret;
 
-	ret = pm_runtime_get_sync(drm->dev->dev);
+	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(drm->dev->dev);
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
 	}
 
 	seq_printf(m, "0x%08x\n",
 		   nvif_rd32(&drm->client.device.object, 0x101000));
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
-	pm_runtime_put_autosuspend(drm->dev->dev);
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 5bd120c20844..ae9e34826f39 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -139,7 +139,7 @@ nouveau_decode_mod(struct nouveau_drm *drm,
 		   uint32_t *tile_mode,
 		   uint8_t *kind)
 {
-	struct nouveau_display *disp = nouveau_display(drm->dev);
+	struct nouveau_display *disp = nouveau_display(nouveau_to_drm_dev(drm));
 	BUG_ON(!tile_mode || !kind);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR) {
@@ -198,7 +198,7 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
 			    uint32_t *tile_mode,
 			    uint8_t *kind)
 {
-	struct nouveau_display *disp = nouveau_display(drm->dev);
+	struct nouveau_display *disp = nouveau_display(nouveau_to_drm_dev(drm));
 	int mod;
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
@@ -467,7 +467,7 @@ static void
 nouveau_display_hpd_work(struct work_struct *work)
 {
 	struct nouveau_drm *drm = container_of(work, typeof(*drm), hpd_work);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	u32 pending;
@@ -513,9 +513,9 @@ nouveau_display_hpd_work(struct work_struct *work)
 	if (changed)
 		drm_kms_helper_hotplug_event(dev);
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
+	pm_runtime_mark_last_busy(nouveau_to_dev(drm));
 noop:
-	pm_runtime_put_sync(drm->dev->dev);
+	pm_runtime_put_sync(nouveau_to_dev(drm));
 }
 
 #ifdef CONFIG_ACPI
@@ -530,20 +530,20 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 
 	if (!strcmp(info->device_class, ACPI_VIDEO_CLASS)) {
 		if (info->type == ACPI_VIDEO_NOTIFY_PROBE) {
-			ret = pm_runtime_get(drm->dev->dev);
+			ret = pm_runtime_get(nouveau_to_dev(drm));
 			if (ret == 1 || ret == -EACCES) {
 				/* If the GPU is already awake, or in a state
 				 * where we can't wake it up, it can handle
 				 * it's own hotplug events.
 				 */
-				pm_runtime_put_autosuspend(drm->dev->dev);
+				pm_runtime_put_autosuspend(nouveau_to_dev(drm));
 			} else if (ret == 0) {
 				/* We've started resuming the GPU already, so
 				 * it will handle scheduling a full reprobe
 				 * itself
 				 */
 				NV_DEBUG(drm, "ACPI requested connector reprobe\n");
-				pm_runtime_put_noidle(drm->dev->dev);
+				pm_runtime_put_noidle(nouveau_to_dev(drm));
 			} else {
 				NV_WARN(drm, "Dropped ACPI reprobe event due to RPM error: %d\n",
 					ret);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 8cf657a6654f..d2c538318f99 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -140,7 +140,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 		struct vm_fault *vmf, struct migrate_vma *args,
 		dma_addr_t *dma_addr)
 {
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct page *dpage, *spage;
 	struct nouveau_svmm *svmm;
 
@@ -190,7 +190,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.end		= vmf->address + PAGE_SIZE,
 		.src		= &src,
 		.dst		= &dst,
-		.pgmap_owner	= drm->dev,
+		.pgmap_owner	= nouveau_to_drm_dev(drm),
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
 	};
 
@@ -211,7 +211,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(nouveau_to_dev(drm), dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
 	return ret;
@@ -252,7 +252,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	chunk->pagemap.range.end = res->end;
 	chunk->pagemap.nr_range = 1;
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
-	chunk->pagemap.owner = drm->dev;
+	chunk->pagemap.owner = nouveau_to_drm_dev(drm);
 
 	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
 			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, NULL, NULL,
@@ -568,7 +568,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
 		dma_addr_t *dma_addr, u64 *pfn)
 {
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct page *dpage, *spage;
 	unsigned long paddr;
 
@@ -617,12 +617,13 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		dma_addr_t *dma_addrs, u64 *pfns)
 {
 	struct nouveau_fence *fence;
+	struct device *dev = nouveau_to_dev(drm);
 	unsigned long addr = args->start, nr_dma = 0, i;
 
 	for (i = 0; addr < args->end; i++) {
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
 				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+		if (!dma_mapping_error(dev, dma_addrs[nr_dma]))
 			nr_dma++;
 		addr += PAGE_SIZE;
 	}
@@ -633,7 +634,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
+		dma_unmap_page(dev, dma_addrs[nr_dma], PAGE_SIZE,
 				DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
@@ -652,7 +653,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
-		.pgmap_owner	= drm->dev,
+		.pgmap_owner	= nouveau_to_drm_dev(drm),
 		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
 	};
 	unsigned long i;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 885815ea917f..bce1abea0d58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -213,7 +213,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		{ NVIF_CLASS_VMM_NV04 , -1 },
 		{}
 	};
-	u64 device = nouveau_name(drm->dev);
+	u64 device = nouveau_name(nouveau_to_drm_dev(drm));
 	int ret;
 
 	snprintf(cli->name, sizeof(cli->name), "%s", sname);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index ba65f136cf48..526e110b52ac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -225,12 +225,46 @@ struct nouveau_drm {
 	} audio;
 };
 
+/**
+ * nouveau_drm() - Retrieve the &struct nouveau_drm from a &struct drm_device.
+ * @dev: The generic DRM device structure.
+ *
+ * This is the inverse of the nouveau_to_drm_dev() function.
+ *
+ * RETURNS: A pointer to the containing &struct nouveau_drm.
+ */
 static inline struct nouveau_drm *
 nouveau_drm(struct drm_device *dev)
 {
 	return dev->dev_private;
 }
 
+/**
+ * nouveau_to_drm_dev() - Get a &struct drm_device from the device-specific
+ * struct.
+ * @nv_dev: The nouveau-specific device structure.
+ *
+ * This is the inverse of the nouveau_drm() function.
+ *
+ * RETURNS: A pointer to the generic &struct drm_device.
+ */
+static inline struct drm_device *
+nouveau_to_drm_dev(struct nouveau_drm *nv_dev) {
+	return nv_dev->dev;
+}
+
+/**
+ * nouveau_to_dev() - Get the generic &struct device for the nouveau device.
+ * @nv_dev: The nouveau-specific device structure.
+ *
+ * RETURNS: A pointer to the generic &struct device associated with the
+ * driver-specific &struct nouveau_drm.
+ */
+static inline struct device *
+nouveau_to_dev(struct nouveau_drm *nv_dev) {
+	return nouveau_to_drm_dev(nv_dev)->dev;
+}
+
 static inline bool
 nouveau_drm_use_coherent_gpu_mapping(struct nouveau_drm *drm)
 {
@@ -251,7 +285,7 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 
 #define NV_PRINTK(l,c,f,a...) do {                                             \
 	struct nouveau_cli *_cli = (c);                                        \
-	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
+	dev_##l(nouveau_to_dev(_cli->drm), "%s: "f, _cli->name, ##a);                \
 } while(0)
 
 #define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4fc0fa696461..dc3f2de42e1b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -188,9 +188,9 @@ nouveau_fbcon_open(struct fb_info *info, int user)
 {
 	struct nouveau_fbdev *fbcon = info->par;
 	struct nouveau_drm *drm = nouveau_drm(fbcon->helper.dev);
-	int ret = pm_runtime_get_sync(drm->dev->dev);
+	int ret = pm_runtime_get_sync(nouveau_to_dev(drm));
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put(drm->dev->dev);
+		pm_runtime_put(nouveau_to_dev(drm));
 		return ret;
 	}
 	return 0;
@@ -201,7 +201,7 @@ nouveau_fbcon_release(struct fb_info *info, int user)
 {
 	struct nouveau_fbdev *fbcon = info->par;
 	struct nouveau_drm *drm = nouveau_drm(fbcon->helper.dev);
-	pm_runtime_put(drm->dev->dev);
+	pm_runtime_put(nouveau_to_dev(drm));
 	return 0;
 }
 
@@ -450,23 +450,24 @@ static void
 nouveau_fbcon_set_suspend_work(struct work_struct *work)
 {
 	struct nouveau_drm *drm = container_of(work, typeof(*drm), fbcon_work);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	int state = READ_ONCE(drm->fbcon_new_state);
 
 	if (state == FBINFO_STATE_RUNNING)
-		pm_runtime_get_sync(drm->dev->dev);
+		pm_runtime_get_sync(dev->dev);
 
 	console_lock();
 	if (state == FBINFO_STATE_RUNNING)
-		nouveau_fbcon_accel_restore(drm->dev);
+		nouveau_fbcon_accel_restore(dev);
 	drm_fb_helper_set_suspend(&drm->fbcon->helper, state);
 	if (state != FBINFO_STATE_RUNNING)
-		nouveau_fbcon_accel_save_disable(drm->dev);
+		nouveau_fbcon_accel_save_disable(dev);
 	console_unlock();
 
 	if (state == FBINFO_STATE_RUNNING) {
 		nouveau_fbcon_hotplug_resume(drm->fbcon);
-		pm_runtime_mark_last_busy(drm->dev->dev);
-		pm_runtime_put_sync(drm->dev->dev);
+		pm_runtime_mark_last_busy(dev->dev);
+		pm_runtime_put_sync(dev->dev);
 	}
 }
 
@@ -513,7 +514,7 @@ nouveau_fbcon_output_poll_changed(struct drm_device *dev)
 		 */
 		NV_DEBUG(drm, "fbcon HPD event deferred until runtime resume\n");
 		fbcon->hotplug_waiting = true;
-		pm_runtime_put_noidle(drm->dev->dev);
+		pm_runtime_put_noidle(nouveau_to_dev(drm));
 	} else {
 		DRM_WARN("fbcon HPD event lost due to RPM failure: %d\n",
 			 ret);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c88cbb85f101..e2bbc1d52d88 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -44,7 +44,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
@@ -68,7 +68,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
 	struct nouveau_vma *vma;
 	int ret;
@@ -145,7 +145,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : & cli->vmm;
 	struct nouveau_vma *vma;
 	int ret;
@@ -203,7 +203,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
+	ret = drm_gem_object_init(nouveau_to_drm_dev(drm), &nvbo->bo.base, size);
 	if (ret) {
 		drm_gem_object_release(&nvbo->bo.base);
 		kfree(nvbo);
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 1c3f890377d2..622ed5d6464d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -265,7 +265,7 @@ nouveau_svmm_invalidate_range_start(struct mmu_notifier *mn,
 	 * the invalidation is handled as part of the migration process.
 	 */
 	if (update->event == MMU_NOTIFY_MIGRATE &&
-	    update->migrate_pgmap_owner == svmm->vmm->cli->drm->dev)
+	    update->migrate_pgmap_owner == nouveau_to_drm_dev(svmm->vmm->cli->drm))
 		goto out;
 
 	if (limit > svmm->unmanaged.start && start < svmm->unmanaged.limit) {
@@ -571,7 +571,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		.end = notifier->notifier.interval_tree.last + 1,
 		.default_flags = hmm_flags,
 		.hmm_pfns = hmm_pfns,
-		.dev_private_owner = drm->dev,
+		.dev_private_owner = nouveau_to_drm_dev(drm),
 	};
 	struct mm_struct *mm = notifier->notifier.mm;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index b81ae90b8449..45c15851d21f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -284,7 +284,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	struct nvkm_device *device = nvxx_device(&drm->client.device);
 	struct nvkm_pci *pci = device->pci;
 	struct nvif_mmu *mmu = &drm->client.mmu;
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	bool need_swiotlb = false;
 	int typei, ret;
 
@@ -324,10 +324,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	need_swiotlb = !!swiotlb_nr_tbl();
 #endif
 
-	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
-				  dev->anon_inode->i_mapping,
-				  dev->vma_offset_manager, need_swiotlb,
-				  drm->client.mmu.dmabits <= 32);
+	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, dev->dev,
+			      dev->anon_inode->i_mapping,
+			      dev->vma_offset_manager, need_swiotlb,
+			      drm->client.mmu.dmabits <= 32);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 7c4b374b3eca..69eac29b730b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -85,7 +85,7 @@ nouveau_switcheroo_ops = {
 void
 nouveau_vga_init(struct nouveau_drm *drm)
 {
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	bool runtime = nouveau_pmops_runtime();
 	struct pci_dev *pdev;
 
@@ -103,13 +103,13 @@ nouveau_vga_init(struct nouveau_drm *drm)
 	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime);
 
 	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
-		vga_switcheroo_init_domain_pm_ops(drm->dev->dev, &drm->vga_pm_domain);
+		vga_switcheroo_init_domain_pm_ops(dev->dev, &drm->vga_pm_domain);
 }
 
 void
 nouveau_vga_fini(struct nouveau_drm *drm)
 {
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	bool runtime = nouveau_pmops_runtime();
 	struct pci_dev *pdev;
 
@@ -125,7 +125,7 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 
 	vga_switcheroo_unregister_client(pdev);
 	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
-		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
+		vga_switcheroo_fini_domain_pm_ops(dev->dev);
 }
 
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
