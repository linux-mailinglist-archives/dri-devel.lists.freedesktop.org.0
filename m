Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A2BDA02D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AACA10E611;
	Tue, 14 Oct 2025 14:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RNADabNC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFADD10E611
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:32:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 505834E410B4;
 Tue, 14 Oct 2025 14:32:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1CBB5606EC;
 Tue, 14 Oct 2025 14:32:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33456102F22A2; 
 Tue, 14 Oct 2025 16:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760452364; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ymjbkmmdhTepVZ85RT59GiYo13e8uSHn7hAepQwgfAM=;
 b=RNADabNCV2MWexohRd3lc0F6s45DAoUjgpQc3Yk/i7HZJx8NhP/z9Q/PDl+QAFgDwe10R8
 gpy2azL3LNXHX1DGNijrI9+qIiPomXR2RsdNSVEGPILsgDYxcZ0ssPL2y5LI5TGRgI311h
 bgt3SVXafUboiTYYvNakXFfqIcMgcWfinG7FxM42ilhcFgUJ1QdqWT0LjquQsbjhOZC7z2
 8ZNYqFU9lK8iARg1nQwxfcXHQl2KHzijbRbciLlJ86NCeEgoO69kQOYj1M9eCKM4BKv5Ro
 GfE5Q//Xljh9YZ0lfuOPwXfytemY4MzOKlGzPdOHi99GD0e3xgsqM2ccFZlsIw==
From: Kory Maincent <kory.maincent@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Bajjuri Praneeth <praneeth@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 thomas.petazzoni@bootlin.com, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
Date: Tue, 14 Oct 2025 16:32:28 +0200
Message-ID: <20251014143229.559564-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
should only be called when the device has been successfully registered.
Currently, these functions are called unconditionally in tilcdc_fini(),
which causes warnings during probe deferral scenarios.

[    7.972317] WARNING: CPU: 0 PID: 23 at drivers/gpu/drm/drm_atomic_state_helper.c:175 drm_atomic_helper_crtc_duplicate_state+0x60/0x68
...
[    8.005820]  drm_atomic_helper_crtc_duplicate_state from drm_atomic_get_crtc_state+0x68/0x108
[    8.005858]  drm_atomic_get_crtc_state from drm_atomic_helper_disable_all+0x90/0x1c8
[    8.005885]  drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x90/0x144
[    8.005911]  drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [tilcdc]
[    8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [tilcdc]

Fix this by moving both drm_kms_helper_poll_fini() and
drm_atomic_helper_shutdown() inside the priv->is_registered conditional
block, ensuring they only execute after successful device registration.

Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for misc drivers")
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 7caec4d38ddf..2031267a3490 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -172,11 +172,11 @@ static void tilcdc_fini(struct drm_device *dev)
 	if (priv->crtc)
 		tilcdc_crtc_shutdown(priv->crtc);
 
-	if (priv->is_registered)
+	if (priv->is_registered) {
 		drm_dev_unregister(dev);
-
-	drm_kms_helper_poll_fini(dev);
-	drm_atomic_helper_shutdown(dev);
+		drm_kms_helper_poll_fini(dev);
+		drm_atomic_helper_shutdown(dev);
+	}
 	tilcdc_irq_uninstall(dev);
 	drm_mode_config_cleanup(dev);
 
-- 
2.43.0

