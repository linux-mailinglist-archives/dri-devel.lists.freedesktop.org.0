Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F73D0DE03
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 22:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD86B10E079;
	Sat, 10 Jan 2026 21:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ltzHVbKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD6010E079
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 21:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768079562;
 bh=5oSK6ZqGW1O08DhJ5RerDVMpW9oPSKQr7Adg8seGHvM=;
 h=From:Date:Subject:To:Cc:From;
 b=ltzHVbKRz/LBWg7AQ+EKyQMVw6HQeghMfh1XBvkWj6CXkGT6MdOfa2BRy461NnsSo
 QxJQGmaNSNO95xoIPtKq8cAHrVPBi+P95fQC9TRkee28QzUIdzYQgm/aIpYH53/088
 VzzF/YOsR+mIbiiXpMWwtUPsmjzI1xhqES4yt7zBO+Hx18x+3ql3AJ5rIwfB+MVN9N
 /qDhcrC/OGVwW3gBHsznIh4RlurPjtbk8KGdzLa6tqSfe3wUrriuR9Fa6CqmRlZ/qA
 8JQPDJin5tFB6aa0zU+gqgAfdMrushf6D7yS7XgVk/+lMbCfYM0tJaeoIrJ7K+KWTV
 I2ZYbBeumw5Xg==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ACE6F17E14FA;
 Sat, 10 Jan 2026 22:12:42 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 10 Jan 2026 23:12:11 +0200
Subject: [PATCH] drm/rockchip: dw_hdmi_qp: Switch to gpiod_set_value_cansleep()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-dw-hdmi-qp-cansleep-v1-1-1ce937c5b201@collabora.com>
X-B4-Tracking: v=1; b=H4sIAKrAYmkC/x2MQQqAIBAAvxJ7bkENgvpKdFh0rYWyUqhA/HvSb
 eYwkyFxFE4wNhki35LkCFV024BdKSyM4qqDUaZXWit0D65uF7xOtBTSxlzBEmnjaeh8B7U8I3t
 5/+s0l/IBzRSAzWUAAAA=
X-Change-ID: 20260110-dw-hdmi-qp-cansleep-ccaa12fa93f3
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as
sleeping"), the Rockchip GPIO chip operations potentially sleep, hence
the kernel complains when trying to make use of the non-sleeping API:

[   16.653343] WARNING: drivers/gpio/gpiolib.c:3902 at gpiod_set_value+0xd0/0x108, CPU#5: kworker/5:1/93
...
[   16.678470] Hardware name: Radxa ROCK 5B (DT)
[   16.682374] Workqueue: events dw_hdmi_qp_rk3588_hpd_work [rockchipdrm]
...
[   16.729314] Call trace:
[   16.731846]  gpiod_set_value+0xd0/0x108 (P)
[   16.734548]  dw_hdmi_qp_rockchip_encoder_enable+0xbc/0x3a8 [rockchipdrm]
[   16.737487]  drm_atomic_helper_commit_encoder_bridge_enable+0x314/0x380 [drm_kms_helper]
[   16.740555]  drm_atomic_helper_commit_tail_rpm+0xa4/0x100 [drm_kms_helper]
[   16.743501]  commit_tail+0x1e0/0x2c0 [drm_kms_helper]
[   16.746290]  drm_atomic_helper_commit+0x274/0x2b8 [drm_kms_helper]
[   16.749178]  drm_atomic_commit+0x1f0/0x248 [drm]
[   16.752000]  drm_client_modeset_commit_atomic+0x490/0x5d0 [drm]
[   16.754954]  drm_client_modeset_commit_locked+0xf4/0x400 [drm]
[   16.757911]  drm_client_modeset_commit+0x50/0x80 [drm]
[   16.760791]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x9c/0x170 [drm_kms_helper]
[   16.763843]  drm_fb_helper_hotplug_event+0x340/0x368 [drm_kms_helper]
[   16.766780]  drm_fbdev_client_hotplug+0x64/0x1d0 [drm_client_lib]
[   16.769634]  drm_client_hotplug+0x178/0x240 [drm]
[   16.772455]  drm_client_dev_hotplug+0x170/0x1c0 [drm]
[   16.775303]  drm_connector_helper_hpd_irq_event+0xa4/0x178 [drm_kms_helper]
[   16.778248]  dw_hdmi_qp_rk3588_hpd_work+0x44/0xb8 [rockchipdrm]
[   16.781080]  process_one_work+0xc3c/0x1658
[   16.783719]  worker_thread+0xa24/0xc40
[   16.786333]  kthread+0x3b4/0x3d8
[   16.788889]  ret_from_fork+0x10/0x20

Since gpiod_get_value() is called from a context that can sleep, switch
to its *_cansleep() variant and get rid of the issue.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 6e39e8a00774..8604342f9943 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -121,7 +121,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 	struct drm_crtc *crtc = encoder->crtc;
 
 	/* Unconditionally switch to TMDS as FRL is not yet supported */
-	gpiod_set_value(hdmi->frl_enable_gpio, 0);
+	gpiod_set_value_cansleep(hdmi->frl_enable_gpio, 0);
 
 	if (!crtc || !crtc->state)
 		return;

---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260110-dw-hdmi-qp-cansleep-ccaa12fa93f3

