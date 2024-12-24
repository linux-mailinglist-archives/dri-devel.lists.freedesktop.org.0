Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF69FB860
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DC210E164;
	Tue, 24 Dec 2024 01:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="TYzTvkif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7416910E164
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:48:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CB401040DBFE; Tue, 24 Dec 2024 02:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735004849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wDhN0XmPre4sSVFdX7AsOqi03BwPOpRqwx4iRqOkPwc=;
 b=TYzTvkifQxLSk7mPY5WJmRMF7dZ3B55MLWgD/wAEEiNBotIEyDkPSblouS7ivIrMEjCIyN
 Zcr/RiT7jUe9PaO806d3KnBL7uatxr3iR8wl8QBhr84CrD8jRBkZtWiOcl+RPPceEgWBnH
 ZQuQdmSukx4ydB+woBHyPc6MpEa4WifLOqqNKB+fF/GdjA74jOCyk0ETkDeNvBe1gDpcbS
 tPHeVTE2K81PMKgBimPIacTF2P6QXwyDg9tznWGY1J9tTY++69W2iEzlFHf2+EE+n7NiDJ
 iBU/TCU/7+wLLM3yx8YYDlOZSHOwrjj+A54YDu0r7RjyaffEoLdk4RaiExNx3w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Tue, 24 Dec 2024 02:46:14 +0100
Message-ID: <20241224014701.253490-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
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

The dw-hdmi output_port is set to 1 in order to look for a connector
next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
The output_port set to 1 makes the DW HDMI driver core look up the
next bridge in DT, where the next bridge is often the hdmi-connector .

Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: No change
---
 drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb856..d8e9fbf75edbb 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 config DRM_IMX8MP_HDMI_PVI
 	tristate "Freescale i.MX8MP HDMI PVI bridge support"
 	depends on OF
+	select DRM_DISPLAY_CONNECTOR
 	help
 	  Choose this to enable support for the internal HDMI TX Parallel
 	  Video Interface found on the Freescale i.MX8MP SoC.
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec2890..4ebae5ad072ad 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
 	plat_data->priv_data = hdmi;
 	plat_data->phy_force_vendor = true;
+	plat_data->output_port = 1;
 
 	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
 	if (IS_ERR(hdmi->dw_hdmi))
-- 
2.45.2

