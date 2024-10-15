Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C999DF4E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 09:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36EA10E51B;
	Tue, 15 Oct 2024 07:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G/aMMY2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A49310E526
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:30:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 107E25C5CCF;
 Tue, 15 Oct 2024 07:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5810CC4CEC7;
 Tue, 15 Oct 2024 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728977411;
 bh=WzQng1jqigLHiW/ZeFs9Mk/VLb7dmk5XfaPiLi6P/U4=;
 h=From:To:Cc:Subject:Date:From;
 b=G/aMMY2RTpSHa/d9iSlkbAP8/2+6vPMCQj7WcPtrsPpvFCOFje8w2wZwdz+e4wQiu
 Kp7Bq6TEHSUSsD5IpvX9ZK8mOkQEENGT5w0qlsCCBL5Mt6QibSOEFXs5FVsDLbuJUX
 cuJvFXopzldl1ywj+8eSw5aDrOuAa7q4a+KOxAHeMX0jHV2+3eINPuL38nigxOIW78
 6WJD9ZJeTb2zVlU8X7gi1A+EoXvTNx1jBpiusAg26WbwWs5yFjx4A6P6ekxAmwqXws
 DPEZGlNnx2OSiYnHgvH82/uyGMtR1xUJxW2b6L7cMAyARYp9IvWMSO7njdAZooskBg
 B8/XL1sUO8rlA==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/imx: parallel-display: add legacy bridge Kconfig
 dependency
Date: Tue, 15 Oct 2024 07:29:57 +0000
Message-Id: <20241015073004.4066457-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The driver now uses the legacy bridge helper code but can be configured
to get built without it:

ERROR: modpost: "devm_imx_drm_legacy_bridge" [drivers/gpu/drm/imx/ipuv3/parallel-display.ko] undefined!

Add the required dependency, same as in the ldb driver.

Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 0ea1feb84672..acaf25089001 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -15,6 +15,7 @@ config DRM_IMX_PARALLEL_DISPLAY
 	depends on DRM_IMX
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
+	select DRM_IMX_LEGACY_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 
-- 
2.39.5

