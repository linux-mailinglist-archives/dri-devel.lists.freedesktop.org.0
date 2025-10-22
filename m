Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39624BFCD18
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 17:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387410E7E8;
	Wed, 22 Oct 2025 15:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UNKHtIv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B85810E7E8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:17:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E607D1A15DC;
 Wed, 22 Oct 2025 15:17:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9620606DC;
 Wed, 22 Oct 2025 15:17:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B185D102F23AD; 
 Wed, 22 Oct 2025 17:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761146271; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=CChA9h90pM92X6zpGVU45uXBGsE28460coNy6HElnTo=;
 b=UNKHtIv5f1DzlxegUyhHSDfJ7g25b/CPCEU3SM9RVlJIpi6E0EBTl6jl7VFNlEpJ4NTWV2
 HcfDK+MtQX0e4N747aUnearfX70ksr/PyZkeevsJTT7nNSW9ZpGExcEc+zA4HYpJJfg1sK
 AJUAfvAsW3OdDMfP2WzJ6jw4XQYfRULAmPSaaoqKvjtCmLz61sbyC5hXDgRNvOoFVDbDvR
 S2OhtLkr0zhAYk30l8KVPulymsRD/PtA229eg2kOF+SHPnAFtoqGBFdqYgNj+H+IetJKwJ
 jGDrqHNXZZCTIjw+P4todOqIqXWFf4bhXCRRtrC3MilgZ4DKL2xHf5BH2dpRUw==
From: Kory Maincent <kory.maincent@bootlin.com>
To: Douglas Anderson <dianders@chromium.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Bajjuri Praneeth <praneeth@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 stable@vger.kernel.org, Swamil Jain <s-jain1@ti.com>,
 thomas.petazzoni@bootlin.com, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/tilcdc: Fix removal actions in case of failed probe
Date: Wed, 22 Oct 2025 17:17:38 +0200
Message-ID: <20251022151739.864344-1-kory.maincent@bootlin.com>
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

Cc: stable@vger.kernel.org
Reviewed-by: Swamil Jain <s-jain1@ti.com>
Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for misc drivers")
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

I'm working on removing the usage of deprecated functions as well as
general improvements to this driver, but it will take some time so for
now this is a simple fix to a functional bug.

Change in v2:
- Add missing cc: stable tag
- Add Swamil reviewed-by
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

