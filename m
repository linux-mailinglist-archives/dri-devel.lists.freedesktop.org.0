Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB62A8C94
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 03:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C346E9F0;
	Fri,  6 Nov 2020 02:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988DF6E9F0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 02:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604629055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYBiCZ2IJU2my58IlcUBbr1ijWju8tVihX0YFbb+qlA=;
 b=KDSv258nwc8DOo7qlQwFemPR3TZ7UOwiNzDNOgwNoprWfH2jfZW9fBmwXdyGlSBMVS/Ji+
 16kzCNmJ6zNLD0XB03rmytAVTDotFy3lW8RQysiZxO10hIMNpYIJrW6qYyqVdA3BzaZdzm
 2WolkRtaGKmrPv/jpEt8ruvwy1h8DTE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-zJqIaMC3Oty8htsLuTtGLw-1; Thu, 05 Nov 2020 21:17:31 -0500
X-MC-Unique: zJqIaMC3Oty8htsLuTtGLw-1
Received: by mail-qv1-f70.google.com with SMTP id dd7so2193039qvb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 18:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DYBiCZ2IJU2my58IlcUBbr1ijWju8tVihX0YFbb+qlA=;
 b=X4JNf9LwfAb1fnoxqmmHuuYaLoByY9m0WK+aOvU4byWbKPRjp+qKc1rRIxaJkshyJT
 UnKt+2+TalGS/ojMkf4iOlINLyXgZM75jGQhD15zzGqNDabTi8uYlGW/AVHr/RPwbJXy
 P1bPalRS7rFW4s1CGmjnaFs4/AxZGC0OvqpTglMk4ZGsF/cj5KK7DtdZRQJ9tY2TXSVv
 BKHokCKYVsWh3/k2/bvwWuSLDsQYvUkxnWrYJ8EF8b517FbK8QtjssF6rAR9yqVsvr5J
 7uzSLkuqgrlR9TevFotCPAcd/IN7FN5lZMcG5ncO9mYIOdgM3MjGi49iNdVAGZsBggyA
 iwcg==
X-Gm-Message-State: AOAM532a+DEBVGOjbvCZ/f6XL/vwDxOC8ZA0fBqKCu1naSQiYPxZt2RF
 /g+/z5TN37mZv+rqDwTvH9EbDcEOmIG/HG/1+MSCZHBHdb55RkTR9KiqE8dICP0SqhPvEDTyjVP
 Tppm/7GATn0MIM34M2xWYoJA5BHyI
X-Received: by 2002:a37:9641:: with SMTP id y62mr2070801qkd.75.1604629050379; 
 Thu, 05 Nov 2020 18:17:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5QM6HEXI2dncK2r9XNmfS/Y9YcDwAjenA2hK4x+Khom7cCPUtgdrAMH52CDN6kaZttXG+1A==
X-Received: by 2002:a37:9641:: with SMTP id y62mr2070779qkd.75.1604629049897; 
 Thu, 05 Nov 2020 18:17:29 -0800 (PST)
Received: from xps13.jcline.org ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id q20sm2195301qtn.80.2020.11.05.18.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 18:17:29 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 1/3] drm/nouveau: Use helper to convert nouveau_drm to
 drm_device
Date: Thu,  5 Nov 2020 21:16:54 -0500
Message-Id: <20201106021656.40743-2-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106021656.40743-1-jcline@redhat.com>
References: <20201106021656.40743-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     | 10 +++---
 drivers/gpu/drm/nouveau/dispnv50/base.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  7 ++--
 drivers/gpu/drm/nouveau/dispnv50/core.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  5 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 17 +++++-----
 drivers/gpu/drm/nouveau/dispnv50/oimm.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  5 +--
 drivers/gpu/drm/nouveau/dispnv50/wimm.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  5 +--
 drivers/gpu/drm/nouveau/nouveau_bo.c        | 16 ++++-----
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_display.c   | 16 ++++-----
 drivers/gpu/drm/nouveau/nouveau_dmem.c      | 17 +++++-----
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h       | 36 ++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     | 19 +++++------
 drivers/gpu/drm/nouveau/nouveau_gem.c       |  8 ++---
 drivers/gpu/drm/nouveau/nouveau_svm.c       |  4 +--
 drivers/gpu/drm/nouveau/nouveau_ttm.c       |  4 +--
 drivers/gpu/drm/nouveau/nouveau_vga.c       |  8 ++---
 27 files changed, 124 insertions(+), 84 deletions(-)

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
index 302d4e6fc52f..fdf9af6b0fca 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -305,12 +305,13 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
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
index 27ea3f34706d..cf1f4472d55b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -58,7 +58,7 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 		{  NV50_DISP_CORE_CHANNEL_DMA, 0, core507d_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, cores);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index e6f16a7750f0..6f553f9f85ee 100644
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
index 121c24a18f11..cbe7107ba815 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs.c
@@ -40,7 +40,7 @@ nv50_curs_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 		{  NV50_DISP_CURSOR, 0, curs507a_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, curses);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 54fbd6fe751d..d44352f55268 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -140,11 +140,12 @@ curs507a_new_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
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
index b111fe24a06b..a357ab626450 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -325,7 +325,8 @@ static int
 nv50_outp_acquire(struct nouveau_encoder *nv_encoder, bool hda)
 {
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
+	struct nv50_disp *disp = nv50_disp(dev);
 	struct {
 		struct nv50_disp_mthd_v1 base;
 		struct nv50_disp_acquire_v0 info;
@@ -589,7 +590,6 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 			     bool *enabled, unsigned char *buf, int max_bytes)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
-	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_encoder *encoder;
 	struct nouveau_encoder *nv_encoder;
 	struct drm_connector *connector;
@@ -599,7 +599,7 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 
 	*enabled = false;
 
-	drm_for_each_encoder(encoder, drm->dev) {
+	drm_for_each_encoder(encoder, drm_dev) {
 		struct nouveau_connector *nv_connector = NULL;
 
 		nv_encoder = nouveau_encoder(encoder);
@@ -677,7 +677,7 @@ static const struct component_ops nv50_audio_component_bind_ops = {
 static void
 nv50_audio_component_init(struct nouveau_drm *drm)
 {
-	if (!component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
+	if (!component_add(nouveau_to_dev(drm), &nv50_audio_component_bind_ops))
 		drm->audio.component_registered = true;
 }
 
@@ -685,7 +685,7 @@ static void
 nv50_audio_component_fini(struct nouveau_drm *drm)
 {
 	if (drm->audio.component_registered) {
-		component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
+		component_del(nouveau_to_dev(drm), &nv50_audio_component_bind_ops);
 		drm->audio.component_registered = false;
 	}
 }
@@ -2001,14 +2001,15 @@ static void
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
@@ -2022,7 +2023,7 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
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
index a1ac153d5e98..02e67418edbb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimm.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimm.c
@@ -35,7 +35,7 @@ nv50_wimm_init(struct nouveau_drm *drm, struct nv50_wndw *wndw)
 		{ GV100_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid;
 
 	cid = nvif_mclass(&disp->disp->object, wimms);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
index 685b70871324..823e318008a2 100644
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
index 0356474ad6f6..1b159eae6b6d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -788,7 +788,7 @@ nv50_wndw_new(struct nouveau_drm *drm, enum drm_plane_type type, int index,
 		{ GV100_DISP_WINDOW_CHANNEL_DMA, 0, wndwc37e_new },
 		{}
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_disp *disp = nv50_disp(nouveau_to_drm_dev(drm));
 	int cid, ret;
 
 	cid = nvif_mclass(&disp->disp->object, wndws);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 57df997c5ff3..8ed6a73803fe 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -359,11 +359,12 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
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
index 8133377d865d..fd2381cdd225 100644
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
@@ -546,6 +546,7 @@ void
 nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i;
 
@@ -557,7 +558,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 		return;
 
 	for (i = 0; i < ttm_dma->num_pages; i++)
-		dma_sync_single_for_device(drm->dev->dev,
+		dma_sync_single_for_device(dev->dev,
 					   ttm_dma->dma_address[i],
 					   PAGE_SIZE, DMA_TO_DEVICE);
 }
@@ -566,6 +567,7 @@ void
 nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i;
 
@@ -577,7 +579,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 		return;
 
 	for (i = 0; i < ttm_dma->num_pages; i++)
-		dma_sync_single_for_cpu(drm->dev->dev, ttm_dma->dma_address[i],
+		dma_sync_single_for_cpu(dev->dev, ttm_dma->dma_address[i],
 					PAGE_SIZE, DMA_FROM_DEVICE);
 }
 
@@ -991,7 +993,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_resource *new_reg,
 		   struct nouveau_drm_tile **new_tile)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	u64 offset = new_reg->start << PAGE_SHIFT;
 
@@ -1013,7 +1015,7 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 		      struct nouveau_drm_tile **old_tile)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct dma_fence *fence = dma_resv_get_excl(bo->base.resv);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
@@ -1310,7 +1312,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1324,7 +1325,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1334,14 +1334,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 			  struct ttm_tt *ttm)
 {
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
 		return;
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
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
index bceb48a2dfca..9a5b96e4a0e4 100644
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
@@ -473,7 +473,7 @@ static void
 nouveau_display_hpd_work(struct work_struct *work)
 {
 	struct nouveau_drm *drm = container_of(work, typeof(*drm), hpd_work);
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	u32 pending;
@@ -519,9 +519,9 @@ nouveau_display_hpd_work(struct work_struct *work)
 	if (changed)
 		drm_kms_helper_hotplug_event(dev);
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
+	pm_runtime_mark_last_busy(nouveau_to_dev(drm));
 noop:
-	pm_runtime_put_sync(drm->dev->dev);
+	pm_runtime_put_sync(nouveau_to_dev(drm));
 }
 
 #ifdef CONFIG_ACPI
@@ -536,20 +536,20 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 
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
index 92987daa5e17..1342b7f576d8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -141,7 +141,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 		struct vm_fault *vmf, struct migrate_vma *args,
 		dma_addr_t *dma_addr)
 {
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct page *dpage, *spage;
 	struct nouveau_svmm *svmm;
 
@@ -191,7 +191,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.end		= vmf->address + PAGE_SIZE,
 		.src		= &src,
 		.dst		= &dst,
-		.pgmap_owner	= drm->dev,
+		.pgmap_owner	= nouveau_to_drm_dev(drm),
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
 	};
 
@@ -212,7 +212,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(nouveau_to_dev(drm), dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
 	return ret;
@@ -253,7 +253,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	chunk->pagemap.range.end = res->end;
 	chunk->pagemap.nr_range = 1;
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
-	chunk->pagemap.owner = drm->dev;
+	chunk->pagemap.owner = nouveau_to_drm_dev(drm);
 
 	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
 			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, NULL, NULL,
@@ -569,7 +569,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
 		dma_addr_t *dma_addr, u64 *pfn)
 {
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct page *dpage, *spage;
 	unsigned long paddr;
 
@@ -618,12 +618,13 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
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
@@ -634,7 +635,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
+		dma_unmap_page(dev, dma_addrs[nr_dma], PAGE_SIZE,
 				DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
@@ -653,7 +654,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
-		.pgmap_owner	= drm->dev,
+		.pgmap_owner	= nouveau_to_drm_dev(drm),
 		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
 	};
 	unsigned long i;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index d141a5f004af..bc6f51bf23b7 100644
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
index 9d04d1b36434..3e2920a10099 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -226,12 +226,46 @@ struct nouveau_drm {
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
@@ -252,7 +286,7 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 
 #define NV_PRINTK(l,c,f,a...) do {                                             \
 	struct nouveau_cli *_cli = (c);                                        \
-	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
+	dev_##l(nouveau_to_dev(_cli->drm), "%s: "f, _cli->name, ##a);                \
 } while(0)
 
 #define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 24ec5339efb4..e4e0313fadfe 100644
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
 
@@ -448,23 +448,24 @@ static void
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
 
@@ -511,7 +512,7 @@ nouveau_fbcon_output_poll_changed(struct drm_device *dev)
 		 */
 		NV_DEBUG(drm, "fbcon HPD event deferred until runtime resume\n");
 		fbcon->hotplug_waiting = true;
-		pm_runtime_put_noidle(drm->dev->dev);
+		pm_runtime_put_noidle(nouveau_to_dev(drm));
 	} else {
 		DRM_WARN("fbcon HPD event lost due to RPM failure: %d\n",
 			 ret);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index dd51cd0ae20c..f85d89fc4885 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -42,7 +42,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
@@ -66,7 +66,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
 	struct nouveau_vma *vma;
 	int ret;
@@ -143,7 +143,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
+	struct device *dev = nouveau_to_dev(drm);
 	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : & cli->vmm;
 	struct nouveau_vma *vma;
 	int ret;
@@ -201,7 +201,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
+	ret = drm_gem_object_init(nouveau_to_drm_dev(drm), &nvbo->bo.base, size);
 	if (ret) {
 		drm_gem_object_release(&nvbo->bo.base);
 		kfree(nvbo);
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4f69e4c3dafd..3b43bd4a165e 100644
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
@@ -567,7 +567,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		.end = notifier->notifier.interval_tree.last + 1,
 		.default_flags = hmm_flags,
 		.hmm_pfns = hmm_pfns,
-		.dev_private_owner = drm->dev,
+		.dev_private_owner = nouveau_to_drm_dev(drm),
 	};
 	struct mm_struct *mm = notifier->notifier.mm;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index a37bc3d7b38b..10f191ba7ed4 100644
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
 
@@ -325,7 +325,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 #endif
 
 	ret = ttm_bo_device_init(&drm->ttm.bdev, &nouveau_bo_driver,
-				 drm->dev->dev, dev->anon_inode->i_mapping,
+				 dev->dev, dev->anon_inode->i_mapping,
 				 dev->vma_offset_manager, need_swiotlb,
 				 drm->client.mmu.dmabits <= 32);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index c85dd8afa3c3..00eaf0759757 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -85,7 +85,7 @@ nouveau_switcheroo_ops = {
 void
 nouveau_vga_init(struct nouveau_drm *drm)
 {
-	struct drm_device *dev = drm->dev;
+	struct drm_device *dev = nouveau_to_drm_dev(drm);
 	bool runtime = nouveau_pmops_runtime();
 
 	/* only relevant for PCI devices */
@@ -101,13 +101,13 @@ nouveau_vga_init(struct nouveau_drm *drm)
 	vga_switcheroo_register_client(dev->pdev, &nouveau_switcheroo_ops, runtime);
 
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
 
 	/* only relevant for PCI devices */
@@ -121,7 +121,7 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 
 	vga_switcheroo_unregister_client(dev->pdev);
 	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
-		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
+		vga_switcheroo_fini_domain_pm_ops(dev->dev);
 }
 
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
