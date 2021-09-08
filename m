Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F636403EF6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 20:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B1E6E243;
	Wed,  8 Sep 2021 18:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB06E243
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 18:18:21 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id x7so2763881pfa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dc8bU3FuTk4waaTc7T6xBFFGAsFlK1NcO7ssuYFs6YY=;
 b=EQQ8GS8AroJXzU87ZB9buYPTkkZ3DYI19V3O+HgIBO0Upm0ZmVX5XSMZBcP9RRGY4P
 kB2r+GNl4JIWhqDY6slQyIT9D28hVzvwv20BZPWEZueHRAy8gN1St0EKkH2AQWrEheph
 mg2v8g2FC1rXz00O+BhgjHw5yBHdyPA7F6uGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dc8bU3FuTk4waaTc7T6xBFFGAsFlK1NcO7ssuYFs6YY=;
 b=3rCMG+ahrUzPl9eWcO/LpQADtBAm285WNTQH7bt4dWnTAFYnoAYB0lrpxZqiXo7CcA
 OLMTEP1UgL+A9nfkWcRUa15HlvOsxXDz4cxQTerIY6WjtVpukLl1IZSD9D6r3vc0QSUY
 DAFcaQ7RlRi2WqxMVEs6wt4mHQIZXJ/RNMDDhnuV3EomzNxX6NbuV99NlBi81EGYVqjZ
 KA8gF4sW3mT80gJQdUTDFZJV9FHCvSpoBovk2ltZ20LOOJlADf8ShjpKFd1DZYeIISjD
 Pgo8bDZm30WcHZm3NAru0ZKABVYK+KTTccIschBsJRV04LrmR6kDIXmpjUP2OTrc9QaB
 eCcA==
X-Gm-Message-State: AOAM533oG48fFSDEZ5i546DT19w2Zbguatj19yqUFcAgpviD98Yz6gjY
 SyTVD0HSwEtHNA2DSxNCWkamEQ==
X-Google-Smtp-Source: ABdhPJxUNTQZ1PbbukdNQ4H5YtW6c/pagbiOvhCgyhOQlJ7N+YFrhT9emI9RxtA3hdpDf3k3mMRIBg==
X-Received: by 2002:a62:60c7:0:b0:40a:4bd7:752c with SMTP id
 u190-20020a6260c7000000b0040a4bd7752cmr5037144pfb.52.1631125101069; 
 Wed, 08 Sep 2021 11:18:21 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:527e:e80d:8e14:9d07])
 by smtp.gmail.com with ESMTPSA id mq12sm2917584pjb.38.2021.09.08.11.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:18:20 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: parade-ps8640: Use regmap APIs
Date: Wed,  8 Sep 2021 11:18:05 -0700
Message-Id: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
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

 drivers/gpu/drm/bridge/parade-ps8640.c | 66 +++++++++++++++-----------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 685e9c38b2db..a16725dbf912 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
@@ -64,12 +65,29 @@ struct ps8640 {
 	struct drm_bridge *panel_bridge;
 	struct mipi_dsi_device *dsi;
 	struct i2c_client *page[MAX_DEVS];
+	struct regmap	*regmap[MAX_DEVS];
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *gpio_reset;
 	struct gpio_desc *gpio_powerdown;
 	bool powered;
 };
 
+static const struct regmap_range ps8640_volatile_ranges[] = {
+	{ .range_min = 0, .range_max = 0xff },
+};
+
+static const struct regmap_access_table ps8640_volatile_table = {
+	.yes_ranges = ps8640_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(ps8640_volatile_ranges),
+};
+
+static const struct regmap_config ps8640_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_table = &ps8640_volatile_table,
+	.cache_type = REGCACHE_NONE,
+};
+
 static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
 {
 	return container_of(e, struct ps8640, bridge);
@@ -78,13 +96,13 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
 static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 				     const enum ps8640_vdo_control ctrl)
 {
-	struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
-	u8 vdo_ctrl_buf[] = { VDO_CTL_ADD, ctrl };
+	struct regmap *map = ps_bridge->regmap[PAGE3_DSI_CNTL1];
+	u8 vdo_ctrl_buf[] = {VDO_CTL_ADD, ctrl};
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
@@ -96,8 +114,7 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 
 static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 {
-	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
-	unsigned long timeout;
+	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
 	int ret, status;
 
 	if (ps_bridge->powered)
@@ -121,18 +138,12 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
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
@@ -144,22 +155,15 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
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
@@ -361,6 +365,10 @@ static int ps8640_probe(struct i2c_client *client)
 	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
 	ps_bridge->page[PAGE0_DP_CNTL] = client;
+	ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client,
+						&ps8640_regmap_config);
+	if (IS_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]))
+		return PTR_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]);
 
 	for (i = 1; i < ARRAY_SIZE(ps_bridge->page); i++) {
 		ps_bridge->page[i] = devm_i2c_new_dummy_device(&client->dev,
@@ -371,6 +379,10 @@ static int ps8640_probe(struct i2c_client *client)
 				client->addr + i);
 			return PTR_ERR(ps_bridge->page[i]);
 		}
+		ps_bridge->regmap[i] = devm_regmap_init_i2c(ps_bridge->page[i],
+							&ps8640_regmap_config);
+		if (IS_ERR(ps_bridge->regmap))
+			return PTR_ERR(ps_bridge->regmap[i]);
 	}
 
 	i2c_set_clientdata(client, ps_bridge);
-- 
2.33.0.153.gba50c8fa24-goog

