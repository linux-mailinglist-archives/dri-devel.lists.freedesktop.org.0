Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4ACA3112
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C08810E901;
	Thu,  4 Dec 2025 09:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qumC81uX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D2810E901
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:46:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 71C4D601B0;
 Thu,  4 Dec 2025 09:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51CFC4CEFB;
 Thu,  4 Dec 2025 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764841601;
 bh=3Xo6KEFNNleLs7NQbRdlOybDeYxGnm96HhQ7ttb1sa4=;
 h=From:To:Cc:Subject:Date:From;
 b=qumC81uXbcWCwG/Jll8DFkNziiV0b8/vPnQBlJ04lGwHHzGWUFixsy1daHL5jZjcX
 fwdaSlJ/2UV+bUwlSJ89XbTwiordBco22NN1g7Lu/FLMOLeACPJF4lIAM7SEfAe+PJ
 vW532CoWcoOjz1dPWVHPSK+qLw5lnVYG7kURBf7/SJBthZqAYSfQPKySL4ohENGJLd
 JdN+lRwBfBfxLjYYZXijwlyrLORrrmT1SDQYyS/9Q6urK5sySCmtUHx1I+cSSM7/PE
 M9KiK7UAvHFmt6SS0wuCdeOCAJVch8U0PQOpRU8YhC8y7HDNdA1NvozuCVQp/24y4g
 41l/SwBo0Zcfg==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: select DRM_DISPLAY_HELPER as needed
Date: Thu,  4 Dec 2025 10:46:26 +0100
Message-Id: <20251204094635.1030724-1-arnd@kernel.org>
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

CONFIG_DRM_BRIDGE_CONNECTOR is a bool option that turns on features of
the display helpers, which are in a module controlled by the (tristate)
CONFIG_DRM_DISPLAY_HELPER. If the display helpers are in a loadable
module, a built-in driver trying to use the bridge connectors fails
to link:

x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
parallel-display.c:(.text+0xcd): undefined reference to `drm_bridge_connector_init'
x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/imx-ldb.o: in function `imx_ldb_bind':
imx-ldb.c:(.text+0x224): undefined reference to `drm_bridge_connector_init'

Select the DRM_BRIDGE_CONNECTOR symbol as well, to ensure it's built-in
if anything needs it.

Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index acaf25089001..1c3825a86380 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,7 @@ config DRM_IMX
 config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	depends on DRM_IMX
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_IMX_LEGACY_BRIDGE
@@ -33,6 +34,7 @@ config DRM_IMX_LDB
 	depends on DRM_IMX
 	depends on COMMON_CLK
 	select MFD_SYSCON
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
-- 
2.39.5

