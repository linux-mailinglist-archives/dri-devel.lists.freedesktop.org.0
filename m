Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D425A01FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E72710FC48;
	Wed, 24 Aug 2022 19:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE6210E7D9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kBxkoMSoocenFWS5QnFTVJk53upsFpOoCTaLoDSzmI=;
 b=TFcajZ3DRsXroElhqrketEQBeuLZzla0/xcxjdsXhnfLcFI9zhZ+2nF/C1VFXorwIQ/3ui
 2CJpsDdgWZDbJrGDAc7NEp7XXs0oRYOkdo6aSVqswRw56xqnffQWVGRtXUmQdswdxP35cL
 PqS+4G1rTtsWDplQ5IVTiOwSK8uoZPg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-Qq3KE4bTOmyrvNhCBmrfFQ-1; Fri, 19 Aug 2022 17:25:44 -0400
X-MC-Unique: Qq3KE4bTOmyrvNhCBmrfFQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 o2-20020a056402438200b0043d552deb2aso3341750edc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9kBxkoMSoocenFWS5QnFTVJk53upsFpOoCTaLoDSzmI=;
 b=MsKLWv5KUc6ObK+ga6pYEXgGYBqVp6i6v1F5OErE9EcGvTXkP7cm61NayD1XbmiNqk
 TewXvEH8rILbdBuZdXQboF8ZWp73ZwIMo1c1mYI0yXbYYNLYXEPgNuN8Wvl5dFGu5sw0
 8a7ygc1nbMhTVQUSDZIRyXJOKqBl80eF76hfsJgoG9biPNR0kfAfXVtw5ip0cYGVMZXR
 f0Mal/t3lAMNdhTBwUojUZjPkDt4xYZJflfFZ3B+PFAuzI2h21/60xBiWW/CeuvpTJMa
 P8gR+vYfQVi7WqEB/ZhEoNzu2F5TDt+TKq6GuDENEH3hh0xm+JCjNoVjf8hk0KfmZ6Nw
 vlBw==
X-Gm-Message-State: ACgBeo3CxbdDZ2EdU05y9hoFsxWRhI+zlCpHV5/usp7oZnhe9Ns6TWcc
 1gYxu0zr5WFBonr5Zu0727B5vGdQ4zm4VEc1TVEi8o8v7euXrRYfD9q3ktik0d7Ta9JBjkoYO4z
 Gz0uq07FR2x3JADFXaCD1VO8Frge4
X-Received: by 2002:a05:6402:50cc:b0:43e:6860:58fc with SMTP id
 h12-20020a05640250cc00b0043e686058fcmr7476993edb.243.1660944342981; 
 Fri, 19 Aug 2022 14:25:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+1euniUCHg7ze4TUzUMROSIcVgRyqCPA59DKYxuvVfH4krbl50afSwL5v7W/5t2MI7qbKbQ==
X-Received: by 2002:a05:6402:50cc:b0:43e:6860:58fc with SMTP id
 h12-20020a05640250cc00b0043e686058fcmr7476979edb.243.1660944342824; 
 Fri, 19 Aug 2022 14:25:42 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ej19-20020a056402369300b00445f1fa531bsm3650681edb.25.2022.08.19.14.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:25:42 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 7/8] drm/arm/malidp: crtc: protect device
 resources after removal
Date: Fri, 19 Aug 2022 23:25:37 +0200
Message-Id: <20220819212538.559902-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819212015.556220-1-dakr@redhat.com>
References: <20220819212015.556220-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/malidp_crtc.c | 41 +++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index dc01c43f6193..fa95278abae6 100644
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
@@ -27,6 +28,7 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
+	int idx;
 
 	/*
 	 * check that the hardware can drive the required clock rate,
@@ -34,6 +36,9 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 	 */
 	long rate, req_rate = mode->crtc_clock * 1000;
 
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return MODE_NOCLOCK;
+
 	if (req_rate) {
 		rate = clk_round_rate(hwdev->pxlclk, req_rate);
 		if (rate != req_rate) {
@@ -43,6 +48,8 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 		}
 	}
 
+	drm_dev_exit(idx);
+
 	return MODE_OK;
 }
 
@@ -53,6 +60,10 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct videomode vm;
 	int err = pm_runtime_get_sync(crtc->dev->dev);
+	int idx;
+
+	if (!drm_dev_enter(&malidp->base, &idx))
+		return;
 
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to enable runtime power management: %d\n", err);
@@ -68,6 +79,8 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	hwdev->hw->modeset(hwdev, &vm);
 	hwdev->hw->leave_config_mode(hwdev);
 	drm_crtc_vblank_on(crtc);
+
+	drm_dev_exit(idx);
 }
 
 static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -77,7 +90,10 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
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
@@ -91,6 +107,8 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to disable runtime power management: %d\n", err);
 	}
+
+	drm_dev_exit(idx);
 }
 
 static const struct gamma_curve_segment {
@@ -260,7 +278,10 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
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
@@ -334,6 +355,9 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
 	ret = hwdev->hw->se_calc_mclk(hwdev, s, &vm);
 	if (ret < 0)
 		return -EINVAL;
+
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -498,9 +522,16 @@ static int malidp_crtc_enable_vblank(struct drm_crtc *crtc)
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
 
@@ -508,9 +539,15 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
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
2.37.2

