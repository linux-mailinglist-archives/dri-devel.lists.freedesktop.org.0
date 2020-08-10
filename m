Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2A241696
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFD76E11F;
	Tue, 11 Aug 2020 06:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9927189C08
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 15:22:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; d="scan'208";a="54088463"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 00:22:34 +0900
Received: from localhost.localdomain (unknown [172.29.52.120])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 32CE44008545;
 Tue, 11 Aug 2020 00:22:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for regulator
Date: Mon, 10 Aug 2020 16:22:18 +0100
Message-Id: <20200810152219.6254-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the support for enabling optional regulator that may be used as VCC
source.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
New Patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
---
 drivers/gpu/drm/bridge/lvds-codec.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 24fb1befdfa2..5858a29aafe6 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -10,13 +10,16 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
 struct lvds_codec {
+	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
 };
@@ -38,6 +41,14 @@ static int lvds_codec_attach(struct drm_bridge *bridge,
 static void lvds_codec_enable(struct drm_bridge *bridge)
 {
 	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
+	int ret;
+
+	ret = regulator_enable(lvds_codec->vcc);
+	if (ret) {
+		dev_err(lvds_codec->dev,
+			"Failed to enable regulator \"vcc\": %d\n", ret);
+		return;
+	}
 
 	if (lvds_codec->powerdown_gpio)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
@@ -46,9 +57,15 @@ static void lvds_codec_enable(struct drm_bridge *bridge)
 static void lvds_codec_disable(struct drm_bridge *bridge)
 {
 	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
+	int ret;
 
 	if (lvds_codec->powerdown_gpio)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
+
+	ret = regulator_disable(lvds_codec->vcc);
+	if (ret)
+		dev_err(lvds_codec->dev,
+			"Failed to disable regulator \"vcc\": %d\n", ret);
 }
 
 static const struct drm_bridge_funcs funcs = {
@@ -63,12 +80,24 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	int error;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
 		return -ENOMEM;
 
+	lvds_codec->dev = &pdev->dev;
 	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
+
+	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "vcc");
+	if (IS_ERR(lvds_codec->vcc)) {
+		error = PTR_ERR(lvds_codec->vcc);
+		if (error != -EPROBE_DEFER)
+			dev_err(lvds_codec->dev,
+				"Unable to get \"vcc\" supply: %d\n", error);
+		return error;
+	}
+
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
 	if (IS_ERR(lvds_codec->powerdown_gpio)) {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
