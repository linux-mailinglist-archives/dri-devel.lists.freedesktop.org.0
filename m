Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D37EC1EF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 13:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D6F10E54A;
	Wed, 15 Nov 2023 12:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE3D10E541
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 12:13:47 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 3F5762072F;
 Wed, 15 Nov 2023 13:13:44 +0100 (CET)
From: Francesco Dolcini <francesco@dolcini.it>
To: Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 3/3] drm/bridge: lt8912b: Add power supplies
Date: Wed, 15 Nov 2023 13:13:38 +0100
Message-Id: <20231115121338.22959-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115121338.22959-1-francesco@dolcini.it>
References: <20231115121338.22959-1-francesco@dolcini.it>
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
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add supplies to the driver that can be used to turn the Lontium lt8912b
on and off. It can have up to 7 independent supplies, we add them all
and enable/disable them with bulk_enable/disable.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 097ab04234b7..273157428c82 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -43,6 +43,8 @@ struct lt8912 {
 
 	struct videomode mode;
 
+	struct regulator_bulk_data supplies[7];
+
 	u8 data_lanes;
 	bool is_power_on;
 };
@@ -257,6 +259,12 @@ static int lt8912_free_i2c(struct lt8912 *lt)
 
 static int lt8912_hard_power_on(struct lt8912 *lt)
 {
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(lt->supplies), lt->supplies);
+	if (ret)
+		return ret;
+
 	gpiod_set_value_cansleep(lt->gp_reset, 0);
 	msleep(20);
 
@@ -267,6 +275,9 @@ static void lt8912_hard_power_off(struct lt8912 *lt)
 {
 	gpiod_set_value_cansleep(lt->gp_reset, 1);
 	msleep(20);
+
+	regulator_bulk_disable(ARRAY_SIZE(lt->supplies), lt->supplies);
+
 	lt->is_power_on = false;
 }
 
@@ -661,6 +672,21 @@ static int lt8912_bridge_suspend(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(lt8912_bridge_pm_ops, lt8912_bridge_suspend, lt8912_bridge_resume);
 
+static int lt8912_get_regulators(struct lt8912 *lt)
+{
+	unsigned int i;
+	const char * const supply_names[] = {
+		"vdd", "vccmipirx", "vccsysclk", "vcclvdstx",
+		"vcchdmitx", "vcclvdspll", "vcchdmipll"
+	};
+
+	for (i = 0; i < ARRAY_SIZE(lt->supplies); i++)
+		lt->supplies[i].supply = supply_names[i];
+
+	return devm_regulator_bulk_get(lt->dev, ARRAY_SIZE(lt->supplies),
+				       lt->supplies);
+}
+
 static int lt8912_parse_dt(struct lt8912 *lt)
 {
 	struct gpio_desc *gp_reset;
@@ -712,6 +738,10 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 		goto err_free_host_node;
 	}
 
+	ret = lt8912_get_regulators(lt);
+	if (ret)
+		goto err_free_host_node;
+
 	of_node_put(port_node);
 	return 0;
 
-- 
2.25.1

