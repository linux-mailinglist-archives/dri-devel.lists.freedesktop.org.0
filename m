Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12F5F1DC2
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB70410E666;
	Sat,  1 Oct 2022 16:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFFE10E666
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NI0bF9fBHKufsMehkRni4gVvJDlrywziIYn+evXebr8=;
 b=h8J1+sGzojx99fDxZMYMyqacTcKr1p6a09t/msd42GkmU9/XLdSCGHnalbEYuHZUuKs87Z
 7L1LISCQ2BFC4hql7+m58AvWX5jQOdqnVmZIr/UG8NKoAEgDsolYkjm2lIZs2pMm/wUFQ+
 YQpZ/GxIb4RQp9a5kvwTlaaXNjY802k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-zmfYQEFFNoCFwtAQQqkX7g-1; Sat, 01 Oct 2022 12:40:16 -0400
X-MC-Unique: zmfYQEFFNoCFwtAQQqkX7g-1
Received: by mail-ed1-f71.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so5723328edd.12
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NI0bF9fBHKufsMehkRni4gVvJDlrywziIYn+evXebr8=;
 b=JWootb6cpM+QhvYb/+Ibmn6L0sTABb544dz8hMM5TVsXWp2ND7gHsO6qftp4dZea1a
 o9+6apeOrlSqdPpMKfJwhOuUav4ndz97Nxrz45w8BjQMox47cuPmKi/xPDRMsyXyY6Os
 CFYccvaDip+1LBhORYKi0L7WyDZfe4+CFNDiv8FpAqErbhy7q4cV0xdWWzrpYkYsuP4N
 OY8V7UZos0yNPhH7VIzDXALWda670We/K1dMQfjVLNGsLccrFK6CFoD2QKqzT34Ibtv0
 gkhW7KUh3nOh2BcgTcNQ8XHyJgJuaANXiUP7LovwvN8G5Qew+EHDASMWiOD7pHHgkzmk
 kPig==
X-Gm-Message-State: ACrzQf2JXpW2xlOCAfMXx/XiCDPgJOtEQ3mt4KDHhaorcK1GrieGBFqX
 8AIhxtSVCa/iniN/08aj1oM3nvpqfbhiPFqwZBYpWOAUMe/MlgG0IVP21VIujLEMEGIMlUkLGXi
 mFDG6G7aVSsbsk2v2BMurLwSnRv08
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr10256747ejv.677.1664642415616; 
 Sat, 01 Oct 2022 09:40:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7C/Ts2uHJUPcJEM6l6hCyE9V7MI9D7avdy67tj8jdhoBYY6yqYRglyvOpGoWE5CwNmUEgcUw==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr10256732ejv.677.1664642415407; 
 Sat, 01 Oct 2022 09:40:15 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a1709062cc800b0072b7d76211dsm2926614ejr.107.2022.10.01.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:40:14 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 7/9] drm/arm/malidp: crtc: protect device
 resources after removal
Date: Sat,  1 Oct 2022 18:39:44 +0200
Message-Id: <20221001163946.534067-8-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001163946.534067-1-dakr@redhat.com>
References: <20221001163946.534067-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c | 61 +++++++++++++++++++++++++------
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index dc01c43f6193..e11cda5fdeb7 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -27,6 +28,8 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
+	enum drm_mode_status status = MODE_OK;
+	int idx;
 
 	/*
 	 * check that the hardware can drive the required clock rate,
@@ -34,15 +37,21 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 	 */
 	long rate, req_rate = mode->crtc_clock * 1000;
 
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return MODE_NOCLOCK;
+
 	if (req_rate) {
 		rate = clk_round_rate(hwdev->pxlclk, req_rate);
 		if (rate != req_rate) {
 			DRM_DEBUG_DRIVER("pxlclk doesn't support %ld Hz\n",
 					 req_rate);
-			return MODE_NOCLOCK;
+			status = MODE_NOCLOCK;
+			goto out;
 		}
 	}
 
+out:
+	drm_dev_exit(idx);
 	return MODE_OK;
 }
 
@@ -52,11 +61,15 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct videomode vm;
-	int err = pm_runtime_get_sync(crtc->dev->dev);
+	int err, idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return;
 
+	err = pm_runtime_get_sync(crtc->dev->dev);
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to enable runtime power management: %d\n", err);
-		return;
+		goto out;
 	}
 
 	drm_display_mode_to_videomode(&crtc->state->adjusted_mode, &vm);
@@ -68,6 +81,9 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	hwdev->hw->modeset(hwdev, &vm);
 	hwdev->hw->leave_config_mode(hwdev);
 	drm_crtc_vblank_on(crtc);
+
+out:
+	drm_dev_exit(idx);
 }
 
 static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -77,7 +93,10 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
 									 crtc);
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
-	int err;
+	int err, idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return;
 
 	/* always disable planes on the CRTC that is being turned off */
 	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
@@ -91,6 +110,8 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to disable runtime power management: %d\n", err);
 	}
+
+	drm_dev_exit(idx);
 }
 
 static const struct gamma_curve_segment {
@@ -260,7 +281,10 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
 	u32 h_upscale_factor = 0; /* U16.16 */
 	u32 v_upscale_factor = 0; /* U16.16 */
 	u8 scaling = cs->scaled_planes_mask;
-	int ret;
+	int idx, ret;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return -ENODEV;
 
 	if (!scaling) {
 		s->scale_enable = false;
@@ -268,8 +292,10 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
 	}
 
 	/* The scaling engine can only handle one plane at a time. */
-	if (scaling & (scaling - 1))
-		return -EINVAL;
+	if (scaling & (scaling - 1)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
 		struct malidp_plane *mp = to_malidp_plane(plane);
@@ -331,10 +357,10 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
 
 mclk_calc:
 	drm_display_mode_to_videomode(&state->adjusted_mode, &vm);
-	ret = hwdev->hw->se_calc_mclk(hwdev, s, &vm);
-	if (ret < 0)
-		return -EINVAL;
-	return 0;
+	ret = hwdev->hw->se_calc_mclk(hwdev, s, &vm) < 0 ? -EINVAL : 0;
+out:
+	drm_dev_exit(idx);
+	return ret;
 }
 
 static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
@@ -498,9 +524,16 @@ static int malidp_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
+	int idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return -ENODEV;
 
 	malidp_hw_enable_irq(hwdev, MALIDP_DE_BLOCK,
 			     hwdev->hw->map.de_irq_map.vsync_irq);
+
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -508,9 +541,15 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
+	int idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return;
 
 	malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK,
 			      hwdev->hw->map.de_irq_map.vsync_irq);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_crtc_funcs malidp_crtc_funcs = {
-- 
2.37.3

