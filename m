Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C027409F2F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 23:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443DA6E25A;
	Mon, 13 Sep 2021 21:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6E36E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 21:33:50 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso301657pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 14:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUfWaMx/BaEPF/fGnMvUdMwxe4eiT46pCWcuK6ipNPw=;
 b=gKK5YOWQqzracFp0zWYuIM2M7iqkbd4ShaP0ZkGTdJGr33NX+yvpnJ07DQF1BKGAnU
 5AT07eWD27VVD77tfjKbdumFu0v1MaKNSTk75eo9rIppznrOJ1bL6Q4UxRk/IWn76Gs0
 nsMg+kCdzrhxd8k1By5TuercCXmYXn4XT1lCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUfWaMx/BaEPF/fGnMvUdMwxe4eiT46pCWcuK6ipNPw=;
 b=m8Gth+KC665437lsI5GnHMTTXZKozs3FOKcm8rFSsk6UOneoQkTi+Q2C0cUYTpkbu9
 TihY9oW/Mvvjliw/pQyY2ceN17VctX7hvF/OFqJYHhg0KONX5cnCuzKvuKqEo4O4f2Ku
 vdxACM0ASIyyyBJKpjonyRTkdudb8cvRoycKpTzO0BZK5ORR+QjyZ3+o+RrSDDj159+J
 2CxBzglIntacDN9Gr9Kgp4J9g7yrOeLlgj+IGMCoukHUJRGuuvXch0fHKv5oAbsyuoMw
 zJVkLtRjejVwt/LhuFnJcX5VLHVKsG/wJocPCYptisc5zl5u1RtPSbcg0jybS44rOG8u
 TAKw==
X-Gm-Message-State: AOAM5338VDGYJoowVZJj7oSZ1DlGdMRxmyuWeVz11f2FosI8kBO9G8oC
 HRtka9CpEDwaWlB7xGf1p2wqsA==
X-Google-Smtp-Source: ABdhPJxkVc+w+Gfd3q//IYfYCsgwnwNLFIdZcMPHmbx/t02DqtNxm39y8C9PcMm8sXSY0wHtjhsFbw==
X-Received: by 2002:a17:90a:aa14:: with SMTP id
 k20mr1740783pjq.88.1631568830138; 
 Mon, 13 Sep 2021 14:33:50 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:b3b2:2a45:e533:cf25])
 by smtp.gmail.com with ESMTPSA id b20sm7859907pfl.9.2021.09.13.14.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 14:33:49 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: dianders@chromium.org, swboyd@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 1/2] drm/bridge: parade-ps8640: Use regmap APIs
Date: Mon, 13 Sep 2021 14:33:43 -0700
Message-Id: <20210913143255.RFC.v2.1.I8ad7a535bb18a1f41f3858f83379beedb397a9db@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
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

Replace the direct i2c access (i2c_smbus_* functions) with regmap APIs,
which will simplify the future update on ps8640 driver.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v2:
- Add separate reg map config per page

 drivers/gpu/drm/bridge/parade-ps8640.c | 89 ++++++++++++++++++--------
 1 file changed, 63 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 685e9c38b2db..1b2414601538 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
@@ -31,6 +32,11 @@
 
 #define NUM_MIPI_LANES		4
 
+#define COMMON_PS8640_REGMAP_CONFIG \
+	.reg_bits = 8, \
+	.val_bits = 8, \
+	.cache_type = REGCACHE_NONE
+
 /*
  * PS8640 uses multiple addresses:
  * page[0]: for DP control
@@ -64,12 +70,48 @@ struct ps8640 {
 	struct drm_bridge *panel_bridge;
 	struct mipi_dsi_device *dsi;
 	struct i2c_client *page[MAX_DEVS];
+	struct regmap	*regmap[MAX_DEVS];
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *gpio_reset;
 	struct gpio_desc *gpio_powerdown;
 	bool powered;
 };
 
+static const struct regmap_config ps8640_regmap_config[] = {
+	[PAGE0_DP_CNTL] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0xbf
+	},
+	[PAGE1_VDO_BDG] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0xff
+	},
+	[PAGE2_TOP_CNTL] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0xff
+	},
+	[PAGE3_DSI_CNTL1] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0xff
+	},
+	[PAGE4_MIPI_PHY] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0xff
+	},
+	[PAGE5_VPLL] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0x7f
+	},
+	[PAGE6_DSI_CNTL2] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0xff
+	},
+	[PAGE7_SPI_CNTL] = {
+		COMMON_PS8640_REGMAP_CONFIG,
+		.max_register = 0xff
+	}
+};
+
 static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
 {
 	return container_of(e, struct ps8640, bridge);
@@ -78,13 +120,13 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
 static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 				     const enum ps8640_vdo_control ctrl)
 {
-	struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
+	struct regmap *map = ps_bridge->regmap[PAGE3_DSI_CNTL1];
 	u8 vdo_ctrl_buf[] = { VDO_CTL_ADD, ctrl };
 	int ret;
 
-	ret = i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
-					     sizeof(vdo_ctrl_buf),
-					     vdo_ctrl_buf);
+	ret = regmap_bulk_write(map, PAGE3_SET_ADD,
+				vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
+
 	if (ret < 0) {
 		DRM_ERROR("failed to %sable VDO: %d\n",
 			  ctrl == ENABLE ? "en" : "dis", ret);
@@ -96,8 +138,7 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 
 static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 {
-	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
-	unsigned long timeout;
+	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
 	int ret, status;
 
 	if (ps_bridge->powered)
@@ -121,18 +162,12 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 	 */
 	msleep(200);
 
-	timeout = jiffies + msecs_to_jiffies(200) + 1;
+	ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
+			status & PS_GPIO9, 20 * 1000, 200 * 1000);
 
-	while (time_is_after_jiffies(timeout)) {
-		status = i2c_smbus_read_byte_data(client, PAGE2_GPIO_H);
-		if (status < 0) {
-			DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", status);
-			goto err_regulators_disable;
-		}
-		if ((status & PS_GPIO9) == PS_GPIO9)
-			break;
-
-		msleep(20);
+	if (ret < 0) {
+		DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", ret);
+		goto err_regulators_disable;
 	}
 
 	msleep(50);
@@ -144,22 +179,15 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 	 * disabled by the manufacturer. Once disabled, all MCS commands are
 	 * ignored by the display interface.
 	 */
-	status = i2c_smbus_read_byte_data(client, PAGE2_MCS_EN);
-	if (status < 0) {
-		DRM_ERROR("failed read PAGE2_MCS_EN: %d\n", status);
-		goto err_regulators_disable;
-	}
 
-	ret = i2c_smbus_write_byte_data(client, PAGE2_MCS_EN,
-					status & ~MCS_EN);
+	ret = regmap_update_bits(map, PAGE2_MCS_EN, MCS_EN, 0);
 	if (ret < 0) {
 		DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
 		goto err_regulators_disable;
 	}
 
 	/* Switch access edp panel's edid through i2c */
-	ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
-					I2C_BYPASS_EN);
+	ret = regmap_write(map, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
 	if (ret < 0) {
 		DRM_ERROR("failed write PAGE2_I2C_BYPASS: %d\n", ret);
 		goto err_regulators_disable;
@@ -362,6 +390,10 @@ static int ps8640_probe(struct i2c_client *client)
 
 	ps_bridge->page[PAGE0_DP_CNTL] = client;
 
+	ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
+	if (IS_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]))
+		return PTR_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]);
+
 	for (i = 1; i < ARRAY_SIZE(ps_bridge->page); i++) {
 		ps_bridge->page[i] = devm_i2c_new_dummy_device(&client->dev,
 							     client->adapter,
@@ -371,6 +403,11 @@ static int ps8640_probe(struct i2c_client *client)
 				client->addr + i);
 			return PTR_ERR(ps_bridge->page[i]);
 		}
+
+		ps_bridge->regmap[i] = devm_regmap_init_i2c(ps_bridge->page[i],
+						ps8640_regmap_config + i);
+		if (IS_ERR(ps_bridge->regmap[i]))
+			return PTR_ERR(ps_bridge->regmap[i]);
 	}
 
 	i2c_set_clientdata(client, ps_bridge);
-- 
2.33.0.309.g3052b89438-goog

