Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B61A1BC7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83216E94E;
	Wed,  8 Apr 2020 06:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DD76E94E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 06:05:48 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i3so4723449qtv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 23:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=la175c9DEDIHk3uGIF+L0/B/W9ixXMBxxvxYraHXojQ=;
 b=qz+ogVx5bzbsbrrMH2avUgVhCc0+CZz48kXXeN4Ftk6sjRa2KdGvP9q73zpEDXcuCT
 Nw97Q2VkqpOlbBqI6KZLzopH2Uhp4D9/jyyxibHBQRvzGJIKijJJBzZADNBRGar9BRVx
 +RAfz9T+ZF1T5mp5B2S/wsNEBrVk1QaR+HE4OhLbvypeEjBVkxjAHLAZLM2AvAs+GShQ
 tVzb1aJBcTc8yLUVZbY3/X19PGk16mAy5bx4+vkUAuBJgtW7LYWTfPWINt7f2MDDLl6/
 HBGAaTtnXzUFmY4d+gzBArtKYumQ5hYJIoMIIJ5QyLEH5J+wW6bwzhDTJTf77cIRdcN3
 eiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=la175c9DEDIHk3uGIF+L0/B/W9ixXMBxxvxYraHXojQ=;
 b=Xx933DamWAp4RU57qaNGVFnZJxuWfjkpUOsm370wHlBTMpXHDq1nRp96bkVXaVJFh7
 7A5Uae4anKrL72PTcJyBqs4U384bQGSZrj2OZul7GfJ6dUR9b8Bz52r+fB3ymGPp+aOI
 XIT7gRGUNELGvEMBjnde+irYykxeKneK1N8yGaWmKPnyKWj7USPMnZXCQhGjnp/1H1sS
 y8TDZtJFk0QSbLc3It8U99QNI3ao7QFqKaNHEuG89WMS0imw1Gp2cpXWsJKjv3DEbNow
 qhyLVhnXaO358J4X48LPrnIYThMpLWypk7ii/VZrEkuS5t+et4WuKsE/YH6gpe2cMlf9
 QHvw==
X-Gm-Message-State: AGi0PuYvqkp8Zp0K8fsQuXrpt/63HMCS9+BHuhU6+SI6I0GctgzrPj88
 4R0M9FWzSS6eOuvPka8t9c9oYh3tvuX0og==
X-Google-Smtp-Source: APiQypIxjg/UarBlnhzp5LojE1qS1IvhJl5fzF/2MxPsw/z48xlte+1dkmItkK+xfp/3YqiH65Fv1w==
X-Received: by 2002:ac8:2dae:: with SMTP id p43mr5933924qta.341.1586325947491; 
 Tue, 07 Apr 2020 23:05:47 -0700 (PDT)
Received: from arch.localdomain (189-69-221-86.dial-up.telesp.net.br.
 [189.69.221.86])
 by smtp.gmail.com with ESMTPSA id w30sm19664170qtw.21.2020.04.07.23.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 23:05:46 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, manasi.d.navare@intel.com
Subject: [PATCH 2/2] drm/vkms: Add 'virtual_hw' module option
Date: Wed,  8 Apr 2020 03:05:03 -0300
Message-Id: <20200408060503.47709-3-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408060503.47709-1-gabrielabittencourt00@gmail.com>
References: <20200408060503.47709-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Virtual Vblank, virtual hardware module option ('virtual_hw')
allows to skip the timing of vblank routine.

Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.c  | 13 +++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h  |  2 ++
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index a72769b81efe..d4aa1ed93bf2 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -58,6 +58,18 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	return HRTIMER_RESTART;
 }
 
+static void vkms_virtual_vblank_simulate(struct vkms_output *output,
+					 struct drm_crtc *crtc)
+{
+	struct vkms_crtc_state *state;
+	bool ret;
+
+	state = output->composer_state;
+	ret = vkms_queue_compose_worker(output, state);
+	if (!ret)
+		DRM_DEBUG_DRIVER("Composer worker already queued\n");
+}
+
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
@@ -214,16 +226,25 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static bool vkms_crtc_atomic_check_vblank_enable(struct drm_crtc *crtc)
+{
+	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
+
+	return (!vkms_out->disable_vblank);
+}
+
 static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_state)
 {
-	drm_crtc_vblank_on(crtc);
+	if (vkms_crtc_atomic_check_vblank_enable(crtc))
+		drm_crtc_vblank_on(crtc);
 }
 
 static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
-	drm_crtc_vblank_off(crtc);
+	if (vkms_crtc_atomic_check_vblank_enable(crtc))
+		drm_crtc_vblank_off(crtc);
 }
 
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -258,6 +279,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
 
 	spin_unlock_irq(&vkms_output->lock);
+
+	if (vkms_output->disable_vblank)
+		vkms_virtual_vblank_simulate(vkms_output, crtc);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index eef85f1a0ce5..f7c25961b083 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,11 @@ bool enable_cursor;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
 
+bool virtual_hw;
+module_param_named(virtual_hw, virtual_hw, bool, 0444);
+MODULE_PARM_DESC(virtual_hw,
+		 "Enable virtual hardware mode / Disable vblank");
+
 static const struct file_operations vkms_driver_fops = {
 	.owner		= THIS_MODULE,
 	.open		= drm_open,
@@ -168,9 +173,13 @@ static int __init vkms_init(void)
 		goto out_put;
 	}
 
-	vkms_device->drm.irq_enabled = true;
+	vkms_device->output.disable_vblank = virtual_hw;
+	vkms_device->drm.irq_enabled = !virtual_hw;
+
+	if (virtual_hw)
+		DRM_INFO("Virtual hardware mode enabled");
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = (virtual_hw) ? 0 : drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_put;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index eda04ffba7b1..52ad8e06adc5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -19,6 +19,7 @@
 #define YRES_MAX  8192
 
 extern bool enable_cursor;
+extern bool virtual_hw;
 
 struct vkms_composer {
 	struct drm_framebuffer fb;
@@ -64,6 +65,7 @@ struct vkms_output {
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 	struct hrtimer vblank_hrtimer;
+	bool disable_vblank;
 	ktime_t period_ns;
 	struct drm_pending_vblank_event *event;
 	/* ordered wq for composer_work */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
