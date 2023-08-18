Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75D780697
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0052510E4AF;
	Fri, 18 Aug 2023 07:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A316E10E493
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:51:34 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bbff6b2679so4778655ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692345094; x=1692949894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J3zzxCocNGAiuIkgmACmBWWghOpIjW/4eoGUpEKr6o8=;
 b=NG39hm02kllVH0dXlLgMmL2Ow1e1Ey1XoLZrKRR1MpScFsh37098sm88DEuJm0s+ep
 MWw2F1QNVnx6HAcxXDXykEIVV56bwoE56YZwxIZfb1D/870dNKRI2ROQadwYXGSsnZ3V
 Siy7a1U+kZdnOIrjKUIEOjDpaXakoLZHW7efA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692345094; x=1692949894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J3zzxCocNGAiuIkgmACmBWWghOpIjW/4eoGUpEKr6o8=;
 b=hZL4xYrCIba7cuA85LNuG9L48FKRtgG+YUD+2v9lpq+ICk4h/MLmTA1NodJbZDscqE
 PlDecjlb2ox48Yw7NPIFc+apdTW6gY6Y4BJ83IaL7+N5OAV6Yyb2Y/xxku13Nvg6UWMO
 /zrmL4wyohwPZIfu2QajlYplmoxOntpOL//u+UzElkEP+Mksr+xRmp3+htFNjQZD7fw8
 vDrOG4VsynklcvQKORhmStsOuX86zQ1WHbLbg/lBA1gNQKkHsIyqp8DP5ASKjJIdjdan
 +CnkU6kwGyrdprnos6brrEYtCZWWoy9dtrY1NgXlsx2ishGBy0x0f6T+0CiFw+4CHuzn
 htNQ==
X-Gm-Message-State: AOJu0YzI6NmIjFnx0TM3+TjtsXikFvaGz5aCz2SZSnlf04HkLZ21XqE3
 i8eM6GPcoW77OwDKYNE5ev1KUR+1mTwo4CPA6UM66w==
X-Google-Smtp-Source: AGHT+IFJHh35q6aNGymHtkm91PAyoM1bZBy5KAdjn7JyOzQe1u7k00CZT4Gn1K4rVx+ngtWULEN41g==
X-Received: by 2002:a17:902:d2ce:b0:1bd:fa71:f476 with SMTP id
 n14-20020a170902d2ce00b001bdfa71f476mr1792240plc.30.1692345093960; 
 Fri, 18 Aug 2023 00:51:33 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a170903049300b001ba066c589dsm1051834plb.137.2023.08.18.00.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 00:51:33 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	jshargo@chromium.org
Subject: [PATCH v3 2/7] drm/vkms: Support multiple DRM objects (crtcs,
 etc.) per VKMS device
Date: Fri, 18 Aug 2023 07:43:07 +0000
Message-ID: <20230818075057.3426088-3-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230818075057.3426088-1-brpol@chromium.org>
References: <20230818075057.3426088-1-brpol@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, mduggan@chromium.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 tzimmermann@suse.de, Brandon Pollack <brpol@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jim Shargo <jshargo@chromium.org>

This change supports multiple CRTCs, encoders, connectors instead of one
of each per device.

Since ConfigFS-based devices will support multiple crtcs, it's useful to
move all of the writeback/composition data from being per-"output" to
being per-CRTC.

Since there's still only ever one CRTC, this should be a no-op refactor.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Brandon Pollack <brpol@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  30 +++----
 drivers/gpu/drm/vkms/vkms_crtc.c      | 101 ++++++++++++---------
 drivers/gpu/drm/vkms/vkms_drv.c       |  12 +--
 drivers/gpu/drm/vkms/vkms_drv.h       |  70 +++++++++------
 drivers/gpu/drm/vkms/vkms_output.c    | 122 ++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_plane.c     |  38 ++++++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  33 +++----
 7 files changed, 259 insertions(+), 147 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index d5d4f642d367..a59eb75a21c4 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -300,13 +300,13 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	bool crc_pending, wb_pending;
 	u64 frame_start, frame_end;
 	u32 crc32 = 0;
 	int ret;
 
-	spin_lock_irq(&out->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	frame_start = crtc_state->frame_start;
 	frame_end = crtc_state->frame_end;
 	crc_pending = crtc_state->crc_pending;
@@ -330,7 +330,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->gamma_lut.base = NULL;
 	}
 
-	spin_unlock_irq(&out->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	/*
 	 * We raced with the vblank hrtimer and previous work already computed
@@ -348,10 +348,10 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
-		spin_lock_irq(&out->composer_lock);
+		drm_writeback_signal_completion(&vkms_crtc->wb_connector, 0);
+		spin_lock_irq(&vkms_crtc->composer_lock);
 		crtc_state->wb_pending = false;
-		spin_unlock_irq(&out->composer_lock);
+		spin_unlock_irq(&vkms_crtc->composer_lock);
 	}
 
 	/*
@@ -401,30 +401,30 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled)
 {
 	bool old_enabled;
 
 	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+		drm_crtc_vblank_get(&vkms_crtc->base);
 
-	mutex_lock(&out->enabled_lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
+	mutex_lock(&vkms_crtc->enabled_lock);
+	old_enabled = vkms_crtc->composer_enabled;
+	vkms_crtc->composer_enabled = enabled;
 
 	/* the composition wasn't enabled, so unlock the lock to make sure the lock
 	 * will be balanced even if we have a failed commit
 	 */
-	if (!out->composer_enabled)
-		mutex_unlock(&out->enabled_lock);
+	if (!vkms_crtc->composer_enabled)
+		mutex_unlock(&vkms_crtc->enabled_lock);
 
 	if (old_enabled)
-		drm_crtc_vblank_put(&out->crtc);
+		drm_crtc_vblank_put(&vkms_crtc->base);
 }
 
 int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
 	bool enabled = false;
 	int ret = 0;
 
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 3c5ebf106b66..f10a5ec8111d 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "linux/mutex.h"
 #include <linux/dma-fence.h>
 
 #include <drm/drm_atomic.h>
@@ -11,27 +12,27 @@
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
-	struct vkms_output *output = container_of(timer, struct vkms_output,
-						  vblank_hrtimer);
-	struct drm_crtc *crtc = &output->crtc;
+	struct vkms_crtc *vkms_crtc = timer_to_vkms_crtc(timer);
+	struct drm_crtc *crtc = &vkms_crtc->base;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
 	bool ret, fence_cookie, composer_enabled;
 
 	fence_cookie = dma_fence_begin_signalling();
 
-	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
-					  output->period_ns);
+	ret_overrun = hrtimer_forward_now(&vkms_crtc->vblank_hrtimer,
+					  vkms_crtc->period_ns);
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
+	mutex_lock(&vkms_crtc->enabled_lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
-	state = output->composer_state;
-	composer_enabled = output->composer_enabled;
-	mutex_unlock(&output->enabled_lock);
+	state = vkms_crtc->composer_state;
+	composer_enabled = vkms_crtc->composer_enabled;
+	mutex_unlock(&vkms_crtc->enabled_lock);
 
 	if (state && composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
@@ -39,7 +40,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 		/* update frame_start only if a queued vkms_composer_worker()
 		 * has read the data
 		 */
-		spin_lock(&output->composer_lock);
+		spin_lock(&vkms_crtc->composer_lock);
 		if (!state->crc_pending)
 			state->frame_start = frame;
 		else
@@ -47,9 +48,10 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 					 state->frame_start, frame);
 		state->frame_end = frame;
 		state->crc_pending = true;
-		spin_unlock(&output->composer_lock);
+		spin_unlock(&vkms_crtc->composer_lock);
 
-		ret = queue_work(output->composer_workq, &state->composer_work);
+		ret = queue_work(vkms_crtc->composer_workq,
+				 &state->composer_work);
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
@@ -62,25 +64,27 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
 
-	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	out->vblank_hrtimer.function = &vkms_vblank_simulate;
-	out->period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC,
+		     HRTIMER_MODE_REL);
+	vkms_crtc->vblank_hrtimer.function = &vkms_vblank_simulate;
+	vkms_crtc->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns,
+		      HRTIMER_MODE_REL);
 
 	return 0;
 }
 
 static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
-	hrtimer_cancel(&out->vblank_hrtimer);
+	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
 }
 
 static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
@@ -88,9 +92,8 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      bool in_vblank_irq)
 {
 	struct drm_device *dev = crtc->dev;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	unsigned int pipe = crtc->index;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-	struct vkms_output *output = &vkmsdev->output;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
 	if (!READ_ONCE(vblank->enabled)) {
@@ -98,7 +101,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 		return true;
 	}
 
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
 		return true;
@@ -110,7 +113,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	 * the vblank core expects. Therefore we need to always correct the
 	 * timestampe by one frame.
 	 */
-	*vblank_time -= output->period_ns;
+	*vblank_time -= vkms_crtc->period_ns;
 
 	return true;
 }
@@ -236,18 +239,18 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	/* This lock is held across the atomic commit to block vblank timer
 	 * from scheduling vkms_composer_worker until the composer is updated
 	 */
-	spin_lock_irq(&vkms_output->lock);
+	spin_lock_irq(&vkms_crtc->lock);
 }
 
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -262,9 +265,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
 
-	spin_unlock_irq(&vkms_output->lock);
+	spin_unlock_irq(&vkms_crtc->lock);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
@@ -275,31 +278,45 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor)
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor)
 {
-	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_crtc *vkms_crtc;
 	int ret;
 
-	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
+	if (vkmsdev->output.num_crtcs >= VKMS_MAX_OUTPUT_OBJECTS)
+		return ERR_PTR(-ENOMEM);
+
+	vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
+
+	ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
 					 &vkms_crtc_funcs, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init CRTC\n");
-		return ret;
+		goto out_error;
 	}
 
-	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
+	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
 
-	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
-	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
+	drm_mode_crtc_set_gamma_size(&vkms_crtc->base, VKMS_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(&vkms_crtc->base, 0, false, VKMS_LUT_SIZE);
 
-	spin_lock_init(&vkms_out->lock);
-	spin_lock_init(&vkms_out->composer_lock);
-	mutex_init(&vkms_out->enabled_lock);
+	spin_lock_init(&vkms_crtc->lock);
+	spin_lock_init(&vkms_crtc->composer_lock);
+	mutex_init(&vkms_crtc->enabled_lock);
 
-	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
-	if (!vkms_out->composer_workq)
-		return -ENOMEM;
+	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
+	if (!vkms_crtc->composer_workq) {
+		ret = -ENOMEM;
+		goto out_error;
+	}
+
+	return vkms_crtc;
 
-	return ret;
+out_error:
+	memset(vkms_crtc, 0, sizeof(*vkms_crtc));
+	vkmsdev->output.num_crtcs -= 1;
+	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 387c832f5dc9..65b1e2c52106 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -57,8 +57,8 @@ static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
 
-	if (vkms->output.composer_workq)
-		destroy_workqueue(vkms->output.composer_workq);
+	for (int i = 0; i < vkms->output.num_crtcs; i++)
+		destroy_workqueue(vkms->output.crtcs[i].composer_workq);
 }
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -203,15 +203,15 @@ static int vkms_platform_probe(struct platform_device *pdev)
 		goto out_release_group;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = vkms_modeset_init(vkms_device);
 	if (ret) {
-		DRM_ERROR("Failed to vblank\n");
+		DRM_ERROR("Unable to initialize modesetting\n");
 		goto out_release_group;
 	}
 
-	ret = vkms_modeset_init(vkms_device);
+	ret = drm_vblank_init(&vkms_device->drm, vkms_device->output.num_crtcs);
 	if (ret) {
-		DRM_ERROR("Unable to initialize modesetting\n");
+		DRM_ERROR("Failed to vblank\n");
 		goto out_release_group;
 	}
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4c35d6305f2a..761cd809617e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -23,6 +23,10 @@
 
 #define NUM_OVERLAY_PLANES 8
 
+
+#define VKMS_MAX_OUTPUT_OBJECTS 16
+#define VKMS_MAX_PLANES (3 * VKMS_MAX_OUTPUT_OBJECTS)
+
 #define VKMS_LUT_SIZE 256
 
 struct vkms_frame_info {
@@ -66,6 +70,27 @@ struct vkms_plane {
 	struct drm_plane base;
 };
 
+struct vkms_crtc {
+	struct drm_crtc base;
+
+	struct drm_writeback_connector wb_connector;
+	struct hrtimer vblank_hrtimer;
+	ktime_t period_ns;
+	struct drm_pending_vblank_event *event;
+	/* ordered wq for composer_work */
+	struct workqueue_struct *composer_workq;
+	/* protects concurrent access to composer */
+	spinlock_t lock;
+	/* guarantees that if the composer is enabled, a job will be queued */
+	struct mutex enabled_lock;
+
+	/* protected by @enabled_lock */
+	bool composer_enabled;
+	struct vkms_crtc_state *composer_state;
+
+	spinlock_t composer_lock;
+};
+
 struct vkms_color_lut {
 	struct drm_color_lut *base;
 	size_t lut_length;
@@ -97,25 +122,14 @@ struct vkms_crtc_state {
 };
 
 struct vkms_output {
-	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-	struct drm_writeback_connector wb_connector;
-	struct hrtimer vblank_hrtimer;
-	ktime_t period_ns;
-	struct drm_pending_vblank_event *event;
-	/* ordered wq for composer_work */
-	struct workqueue_struct *composer_workq;
-	/* protects concurrent access to composer */
-	spinlock_t lock;
-	/* guarantees that if the composer is enabled, a job will be queued */
-	struct mutex enabled_lock;
-
-	/* protected by @enabled_lock */
-	bool composer_enabled;
-	struct vkms_crtc_state *composer_state;
-
-	spinlock_t composer_lock;
+	int num_crtcs;
+	struct vkms_crtc crtcs[VKMS_MAX_OUTPUT_OBJECTS];
+	int num_encoders;
+	struct drm_encoder encoders[VKMS_MAX_OUTPUT_OBJECTS];
+	int num_connectors;
+	struct drm_connector connectors[VKMS_MAX_OUTPUT_OBJECTS];
+	int num_planes;
+	struct vkms_plane planes[VKMS_MAX_PLANES];
 };
 
 struct vkms_device;
@@ -133,12 +147,14 @@ struct vkms_device {
 	struct vkms_config config;
 };
 
-#define drm_crtc_to_vkms_output(target) \
-	container_of(target, struct vkms_output, crtc)
+#define drm_crtc_to_vkms_crtc(crtc) container_of(crtc, struct vkms_crtc, base)
 
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
 
+#define timer_to_vkms_crtc(timer) \
+	container_of(timer, struct vkms_crtc, vblank_hrtimer)
+
 #define to_vkms_crtc_state(target)\
 	container_of(target, struct vkms_crtc_state, base)
 
@@ -146,13 +162,14 @@ struct vkms_device {
 	container_of(target, struct vkms_plane_state, base.base)
 
 /* CRTC */
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor);
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor);
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int index);
+				   enum drm_plane_type type);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
@@ -163,11 +180,12 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
+				    struct vkms_crtc *vkms_crtc);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 963a64cf068b..86faf94f7408 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include "vkms_drv.h"
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "vkms_drv.h"
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -28,74 +32,116 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
 }
 
 static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
-	.get_modes    = vkms_conn_get_modes,
+	.get_modes = vkms_conn_get_modes,
 };
 
-static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
-				  struct drm_crtc *crtc)
+static struct drm_connector *
+vkms_connector_init(struct vkms_device *vkms_device)
 {
-	struct vkms_plane *overlay;
+	struct drm_connector *connector;
+	int ret;
 
-	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
-	if (IS_ERR(overlay))
-		return PTR_ERR(overlay);
+	if (vkms_device->output.num_connectors >= VKMS_MAX_OUTPUT_OBJECTS)
+		return ERR_PTR(-ENOMEM);
 
-	if (!overlay->base.possible_crtcs)
-		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+	connector = &vkms_device->output
+			     .connectors[vkms_device->output.num_connectors++];
+	ret = drm_connector_init(&vkms_device->drm, connector,
+				 &vkms_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret) {
+		memset(connector, 0, sizeof(*connector));
+		vkms_device->output.num_connectors -= 1;
+		return ERR_PTR(ret);
+	}
 
-	return 0;
+	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+
+	return connector;
+}
+
+static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	if (vkms_device->output.num_encoders >= VKMS_MAX_OUTPUT_OBJECTS)
+		return ERR_PTR(-ENOMEM);
+
+	encoder = &vkms_device->output
+			   .encoders[vkms_device->output.num_encoders++];
+	ret = drm_encoder_init(&vkms_device->drm, encoder, &vkms_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		memset(encoder, 0, sizeof(*encoder));
+		vkms_device->output.num_encoders -= 1;
+		return ERR_PTR(ret);
+	}
+	return encoder;
 }
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
-	struct drm_encoder *encoder = &output->encoder;
-	struct drm_crtc *crtc = &output->crtc;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct vkms_crtc *vkms_crtc;
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
 	unsigned int n;
 
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
+	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config.overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
-			if (ret)
-				return ret;
+			struct vkms_plane *overlay = vkms_plane_init(
+				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
+			if (IS_ERR(overlay)) {
+				ret = PTR_ERR(overlay);
+				goto err_planes;
+			}
 		}
 	}
 
 	if (vkmsdev->config.cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
-		if (IS_ERR(cursor))
-			return PTR_ERR(cursor);
+		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
+		if (IS_ERR(cursor)) {
+			ret = PTR_ERR(cursor);
+			goto err_planes;
+		}
 	}
 
-	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
-	if (ret)
-		return ret;
+	vkms_crtc = vkms_crtc_init(vkmsdev, &primary->base,
+				   cursor ? &cursor->base : NULL);
+	if (IS_ERR(vkms_crtc)) {
+		DRM_ERROR("Failed to init crtc\n");
+		ret = PTR_ERR(vkms_crtc);
+		goto err_planes;
+	}
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
-	if (ret) {
+	for (int i = 0; i < vkmsdev->output.num_planes; i++) {
+		vkmsdev->output.planes[i].base.possible_crtcs |=
+			drm_crtc_mask(&vkms_crtc->base);
+	}
+
+	connector = vkms_connector_init(vkmsdev);
+	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
+		ret = PTR_ERR(connector);
 		goto err_connector;
 	}
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
-
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret) {
+	encoder = vkms_encoder_init(vkmsdev);
+	if (IS_ERR(encoder)) {
 		DRM_ERROR("Failed to init encoder\n");
+		ret = PTR_ERR(encoder);
 		goto err_encoder;
 	}
-	encoder->possible_crtcs = 1;
+	encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
@@ -104,7 +150,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	}
 
 	if (vkmsdev->config.writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev);
+		writeback = vkms_enable_writeback_connector(vkmsdev, vkms_crtc);
 		if (writeback)
 			DRM_ERROR("Failed to init writeback connector\n");
 	}
@@ -120,7 +166,13 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	drm_connector_cleanup(connector);
 
 err_connector:
-	drm_crtc_cleanup(crtc);
+	drm_crtc_cleanup(&vkms_crtc->base);
+
+err_planes:
+	for (int i = 0; i < output->num_planes; i++)
+		drm_plane_cleanup(&output->planes[i].base);
+
+	memset(output, 0, sizeof(*output));
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e5c625ab8e3e..950e6c930273 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -8,6 +8,8 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
@@ -65,6 +67,20 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 	kfree(vkms_state);
 }
 
+static void vkms_plane_destroy(struct drm_plane *plane)
+{
+	struct vkms_plane *vkms_plane =
+		container_of(plane, struct vkms_plane, base);
+
+	if (plane->state) {
+		vkms_plane_destroy_state(plane, plane->state);
+		plane->state = NULL;
+	}
+
+	drm_plane_cleanup(plane);
+	memset(vkms_plane, 0, sizeof(struct vkms_plane));
+}
+
 static void vkms_plane_reset(struct drm_plane *plane)
 {
 	struct vkms_plane_state *vkms_state;
@@ -86,9 +102,10 @@ static void vkms_plane_reset(struct drm_plane *plane)
 static const struct drm_plane_funcs vkms_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy = vkms_plane_destroy,
 	.reset			= vkms_plane_reset,
 	.atomic_duplicate_state = vkms_plane_duplicate_state,
-	.atomic_destroy_state	= vkms_plane_destroy_state,
+	.atomic_destroy_state = vkms_plane_destroy_state,
 };
 
 static void vkms_plane_atomic_update(struct drm_plane *plane,
@@ -198,17 +215,22 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int index)
+				   enum drm_plane_type type)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_output *output = &vkmsdev->output;
 	struct vkms_plane *plane;
+	int ret;
 
-	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
-					   &vkms_plane_funcs,
-					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, type, NULL);
-	if (IS_ERR(plane))
-		return plane;
+	if (output->num_planes >= VKMS_MAX_PLANES)
+		return ERR_PTR(-ENOMEM);
+
+	plane = &output->planes[output->num_planes++];
+	ret = drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_funcs,
+				       vkms_formats, ARRAY_SIZE(vkms_formats),
+				       NULL, type, NULL);
+	if (ret)
+		return ERR_PTR(ret);
 
 	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..92565e3e25f6 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/iosys-map.h>
+#include <linux/kernel.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
@@ -102,7 +103,8 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct vkms_device *vkmsdev;
+	struct vkms_crtc *vkms_crtc =
+		container_of(connector, struct vkms_crtc, wb_connector);
 
 	if (!job->fb)
 		return;
@@ -111,8 +113,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->output, false);
+	vkms_set_composer(vkms_crtc, false);
 	kfree(vkmsjob);
 }
 
@@ -121,11 +122,10 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
-	struct vkms_output *output = &vkmsdev->output;
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
-	struct drm_connector_state *conn_state = wb_conn->base.state;
-	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct vkms_crtc *vkms_crtc =
+		drm_crtc_to_vkms_crtc(connector_state->crtc);
+	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
+	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
 	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
@@ -133,23 +133,25 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct vkms_frame_info *wb_frame_info;
 	u32 wb_format = fb->format->format;
 
-	if (!conn_state)
+	if (!connector_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->output, true);
+	vkms_set_composer(vkms_crtc, true);
 
-	active_wb = conn_state->writeback_job->priv;
+	active_wb = connector_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
-	spin_lock_irq(&output->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	wb_frame_info->offset = fb->offsets[0];
 	wb_frame_info->pitch = fb->pitches[0];
 	wb_frame_info->cpp = fb->format->cpp[0];
 
+	crtc_state->wb_pending = true;
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->pixel_write = get_pixel_write_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
@@ -163,9 +165,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_commit = vkms_wb_atomic_commit,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
+				    struct vkms_crtc *vkms_crtc)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-- 
2.42.0.rc1.204.g551eb34607-goog

