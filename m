Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D685B13D1FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 03:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728D96EBB3;
	Thu, 16 Jan 2020 02:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CEA56EBAF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 02:15:25 +0000 (UTC)
X-UUID: 8ecbccea5b964b5987dbcbe8da4e84ab-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ivEcPT8iEpAX9W6/VujM8EVm+W1Y9SnJ0dVmMcBNlH8=; 
 b=Xfmj0XqnyVnPUnXKOcXQoDdQazli1e0cvGmAGK/uHUMZ3ZlMEBmETiEsiAdheYZaLp/5V2LMc0mkQnGq/zsIkM0H6+v74yor+pGO2xIWcyMiiEkuQ68F3kPbG+GR0UVyN+bWvfQI/mCU7Ak0g9PsAmKWTYCWmYdsJC+dQrpXt8Y=;
X-UUID: 8ecbccea5b964b5987dbcbe8da4e84ab-20200116
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 65801640; Thu, 16 Jan 2020 10:15:22 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 16 Jan 2020 10:14:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 16 Jan 2020 10:14:27 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 3/5] drm/panel: support for auo,
 kd101n80-45na wuxga dsi video mode panel
Date: Thu, 16 Jan 2020 10:15:09 +0800
Message-ID: <20200116021511.22675-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200116021511.22675-1-jitao.shi@mediatek.com>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A9E163718BE7D98B910CE3EDC929C20F035A8CDDEAAD2CE69E028F97959B0B892000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Auo,kd101n80-45na's connector is same as boe,tv101wum-nl6.
The most codes can be reuse.
So auo,kd101n80-45na and boe,tv101wum-nl6 use one driver file.
Add the different parts in driver data.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  6 +-
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 64 +++++++++++++++++--
 2 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ca727c233a9a..b5413edd625b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -30,13 +30,13 @@ config DRM_PANEL_BOE_HIMAX8279D
 	  the host and has a built-in LED backlight.
 
 config DRM_PANEL_BOE_TV101WUM_NL6
-	tristate "BOE TV101WUM 1200x1920 panel"
+	tristate "BOE TV101WUM and AUO KD101N80 45NA 1200x1920 panel"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
-	  Say Y here if you want to support for BOE TV101WUM WUXGA PANEL
-	  DSI Video Mode panel
+	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
+	  45NA WUXGA PANEL DSI Video Mode panel
 
 config DRM_PANEL_LVDS
 	tristate "Generic LVDS panel driver"
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 51fde588adc1..2160144ca51b 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -34,6 +34,7 @@ struct panel_desc {
 	enum mipi_dsi_pixel_format format;
 	const struct panel_init_cmd *init_cmds;
 	unsigned int lanes;
+	bool discharge_on_disable;
 };
 
 struct boe_panel {
@@ -367,6 +368,15 @@ static const struct panel_init_cmd boe_init_cmd[] = {
 	{},
 };
 
+static const struct panel_init_cmd auo_kd101n80_45na_init_cmd[] = {
+	_INIT_DELAY_CMD(24),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(120),
+	_INIT_DCS_CMD(0x29),
+	_INIT_DELAY_CMD(120),
+	{},
+};
+
 static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 {
 	return container_of(panel, struct boe_panel, base);
@@ -444,12 +454,22 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 	}
 
 	msleep(150);
-	gpiod_set_value(boe->enable_gpio, 0);
-	usleep_range(500, 1000);
-	regulator_disable(boe->avee);
-	regulator_disable(boe->avdd);
-	usleep_range(5000, 7000);
-	regulator_disable(boe->pp1800);
+
+	if (boe->desc->discharge_on_disable) {
+		regulator_disable(boe->avee);
+		regulator_disable(boe->avdd);
+		usleep_range(5000, 7000);
+		gpiod_set_value(boe->enable_gpio, 0);
+		usleep_range(5000, 7000);
+		regulator_disable(boe->pp1800);
+	} else {
+		gpiod_set_value(boe->enable_gpio, 0);
+		usleep_range(500, 1000);
+		regulator_disable(boe->avee);
+		regulator_disable(boe->avdd);
+		usleep_range(5000, 7000);
+		regulator_disable(boe->pp1800);
+	}
 
 	boe->prepared = false;
 
@@ -542,6 +562,35 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = boe_init_cmd,
+	.discharge_on_disable = false,
+};
+
+static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
+	.clock = 157000,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 80,
+	.hsync_end = 1200 + 80 + 24,
+	.htotal = 1200 + 80 + 24 + 36,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 16,
+	.vsync_end = 1920 + 16 + 4,
+	.vtotal = 1920 + 16 + 4 + 16,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc auo_kd101n80_45na_desc = {
+	.modes = &auo_kd101n80_45na_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 135,
+		.height_mm = 216,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = auo_kd101n80_45na_init_cmd,
+	.discharge_on_disable = true,
 };
 
 static int boe_panel_get_modes(struct drm_panel *panel,
@@ -673,6 +722,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "boe,tv101wum-nl6",
 	  .data = &boe_tv101wum_nl6_desc
 	},
+	{ .compatible = "auo,kd101n80-45na",
+	  .data = &auo_kd101n80_45na_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
