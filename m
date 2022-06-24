Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C255993F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 14:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC34D10F118;
	Fri, 24 Jun 2022 12:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8600D10F118
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 12:11:12 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id n0Au270034C55Sk010AuK9; Fri, 24 Jun 2022 14:11:09 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o4i9F-000gb5-7w; Fri, 24 Jun 2022 14:10:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o4i9E-009n2N-Gy; Fri, 24 Jun 2022 14:10:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2] drm/bridge: imx: i.MX8 bridge drivers should depend on
 ARCH_MXC
Date: Fri, 24 Jun 2022 14:10:51 +0200
Message-Id: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The various Freescale i.MX8 display bridges are only present on
Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to prevent
asking the user about these drivers when configuring a kernel without
i.MX SoC support.

Fixes: e60c4354840b2fe8 ("drm/bridge: imx: Add LDB support for i.MX8qm")
Fixes: 3818715f62b42b5c ("drm/bridge: imx: Add LDB support for i.MX8qxp")
Fixes: 96988a526c97cfbe ("drm/bridge: imx: Add i.MX8qxp pixel link to DPI support")
Fixes: 1ec17c26bc06289d ("drm/bridge: imx: Add i.MX8qm/qxp display pixel link support")
Fixes: 93e163a9e0392aca ("drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
---
v2:
  - s/i.MX8MP/i.MX8/,
  - Add Reviewed-by.
---
 drivers/gpu/drm/bridge/imx/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 212a7b0e64fd8b5a..608f47f41bcd1c81 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -1,3 +1,5 @@
+if ARCH_MXC || COMPILE_TEST
+
 config DRM_IMX8QM_LDB
 	tristate "Freescale i.MX8QM LVDS display bridge"
 	depends on OF
@@ -41,3 +43,5 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
 	help
 	  Choose this to enable pixel link to display pixel interface(PXL2DPI)
 	  found in Freescale i.MX8qxp processor.
+
+endif # ARCH_MXC || COMPILE_TEST
-- 
2.25.1

