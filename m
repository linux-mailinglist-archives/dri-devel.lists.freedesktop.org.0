Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A87FAC86
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825B10E2FC;
	Mon, 27 Nov 2023 21:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2A310E2FC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:26:51 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7436F877FA;
 Mon, 27 Nov 2023 22:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1701120410;
 bh=OU9QUeYmu7L9yF2F+KvzaO+xevqXeLCS8T7R91s64Cs=;
 h=From:To:Cc:Subject:Date:From;
 b=CAAYvRmzbb4h/g6FWZ7qwMUdFhMu1+K4udzTWU1GMJImMoY/giZyQMPuJFDOaevTJ
 HaeusWXBoiMJyeLsJOmXO6+qBxBWpElh+c8lSPpJynZStp/4w1X6/yKwCKtjn0OBoT
 Aa4J2tK2vl5Kuj5ytiQbfeQUaPTm6Or3/Ypfd0McXwCR7IDdRMkY1+ZWnnEu/Ekn7N
 09vmpgggo2G0kIoZ/Feu7iv9spGKDQlw40b2sTrvl9+Mp0Gnj3/DsrDsbgGPpdjuKz
 3EIUKqhq8ZDHwf2G9nNwNcxd8G39JBklbP0RvGJd/vDCHoQ6ivTVqm9lyZEgynUI1x
 ao0HpKrDRCCzg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: lcdif: Switch to drmm_mode_config_init
Date: Mon, 27 Nov 2023 22:26:25 +0100
Message-ID: <20231127212638.77688-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from deprecated unmanaged drm_mode_config_init() to
managed drmm_mode_config_init(). No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 18de2f17e2491..ea10bf81582e9 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -167,7 +167,11 @@ static int lcdif_load(struct drm_device *drm)
 		return ret;
 
 	/* Modeset init */
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret) {
+		dev_err(drm->dev, "Failed to initialize mode config\n");
+		return ret;
+	}
 
 	ret = lcdif_kms_init(lcdif);
 	if (ret < 0) {
@@ -227,7 +231,6 @@ static void lcdif_unload(struct drm_device *drm)
 	drm_crtc_vblank_off(&lcdif->crtc);
 
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
-- 
2.42.0

