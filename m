Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1A7FAC85
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999FD10E161;
	Mon, 27 Nov 2023 21:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1482810E161
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:26:21 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A0BFC87092;
 Mon, 27 Nov 2023 22:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1701120380;
 bh=BZ1sKpIDBf9H18aKieVsgC/ESr+tMO0FnR3W5o8naKo=;
 h=From:To:Cc:Subject:Date:From;
 b=HbDhKaEP6D17VAElyar0Ja8tvkmapUuLEiEspXHtj/wCtC+wxl7FWc1Pahujs9WCt
 WpJ3ox735rwTnTN2QSbnciScp0npF0dy1mSuxyRaDQKZSP87k0e/YsfyEXRfsIMDDn
 vHSBc9TBIhINkPqcnOFEpNqFT8CgFrIJr5ivRLoruoXjdLMs2SVWCuiT9nv97JT89q
 uJpOTydAxSALTfcCvr174Js4bxb7Q3Gu65l3jaPclita8jhzYwQHE/iPlZ1c/4spxy
 Hn9DAAZu1UKJocmOLxqEkFwJvj2iZOUwBEbPraWSYQuhZAcsD6bGNFeCsayc2uZJMM
 TcKwlFtlqaM+w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/mxsfb: Switch to drmm_mode_config_init
Date: Mon, 27 Nov 2023 22:25:38 +0100
Message-ID: <20231127212612.77667-1-marex@denx.de>
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
V2: Drop matching drm_mode_config_cleanup
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 3bfa369b2507e..cfa3176ebe2c2 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -248,7 +248,11 @@ static int mxsfb_load(struct drm_device *drm,
 	pm_runtime_enable(drm->dev);
 
 	/* Modeset init */
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret) {
+		dev_err(drm->dev, "Failed to initialize mode config\n");
+		goto err_vblank;
+	}
 
 	ret = mxsfb_kms_init(mxsfb);
 	if (ret < 0) {
@@ -311,7 +315,6 @@ static int mxsfb_load(struct drm_device *drm,
 static void mxsfb_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 
 	pm_runtime_get_sync(drm->dev);
 	mxsfb_irq_uninstall(drm);
-- 
2.42.0

