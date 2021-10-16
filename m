Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E204303D3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 18:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B4A6E466;
	Sat, 16 Oct 2021 16:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10366E466
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 16:57:11 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id n11so8424877plf.4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XXUfMNv0URRORb2O8bvHq05n95BY24JE1yMh0N9T3BY=;
 b=bhv3BRqe71nLSEAG1xJp0bEQ6r+83lGtzaob3otasu8paVgb2miF7DjGda4n6QFB1G
 kgxAaaPsheyJ4OI6N02f4w6K6FdanyQrceKjJF7jz6SzzqMYCZ+lvHpswfjiKa9drj8A
 eYpvmkROXHBYaXB7NsAm+TpaGRUAOAo1yROOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XXUfMNv0URRORb2O8bvHq05n95BY24JE1yMh0N9T3BY=;
 b=yeZNhbCq76ZpWNX5o2WQnIWr8pLj9AZLquPBYZKMhRpSwYW8kPX1vb0S6kNVvhqWBj
 x0Pprr1E6oXZPniGV9t/i1CK0QsEcgRGiPtTJAwvYIXD/dkg0yyhfThoikkoROn7HTs4
 oguIlm7nXPgoMgvfH81z/kuUgEJSl4qrDTRt/LariuAnq2DEp0fU/YEl4Fqy+tV8ZAHA
 bFTy1k+H85A+R8+9XX/rsiXJcnW309vFjSIKUw9paasRlNyriea+3jOlJgeZfADuVMox
 rOdFZd/PHnUE/yBoEHo6qX/mjyZdol3eInbs5XlcjzHgtY3j7ePbvGN0Ps1y0TPtQ6lx
 u7Rg==
X-Gm-Message-State: AOAM531AL19Do6rh7Nh2JfySvC22TZSzi4PpGZ1m9EZOHp2xGTxFAaio
 09UYQjzI1cYRtZF9az/qay2l8A==
X-Google-Smtp-Source: ABdhPJwT32Vblw4zsKeIFVTsm2tYDajiwMsWWu414pVgPWP7SLbika4BjxV6BBjC4H4jGzA+XimfgQ==
X-Received: by 2002:a17:903:32c7:b0:13e:ea76:f8cb with SMTP id
 i7-20020a17090332c700b0013eea76f8cbmr17370682plr.74.1634403431284; 
 Sat, 16 Oct 2021 09:57:11 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:f81c:fe70:b049:bd51])
 by smtp.gmail.com with ESMTPSA id e9sm8407616pjl.41.2021.10.16.09.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 09:57:10 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: parade-ps8640: Enable runtime power management
Date: Sat, 16 Oct 2021 09:57:03 -0700
Message-Id: <20211016095644.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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

Fit ps8640 driver into runtime power management framework:

First, break _poweron() to 3 parts: (1) turn on power and wait for
ps8640's internal MCU to finish init (2) check panel HPD (which is
proxy by GPIO9) (3) the other configs. Runtime _resume() can be called
before panel is powered, so we only add (1) to _resume() and do (2)(3)
in _pre_enable(). We also add (2) to _aux_transfer() as we want to
ensure panel HPD is asserted before we start AUX CH transactions.

The original driver has a mysterious delay of 50 ms between (2) and
(3). Since Parade's support can't explain what the delay is for, and we
don't see removing the delay break any boards at hand, remove it to fit
into this driver change.

Besides, rename "powered" to "pre_enabled" and don't check for it in
the pm_runtime calls. The pm_runtime calls are already refcounted so
there's no reason to check there. The other user of "powered",
_get_edid(), only cares if pre_enable() has already been called.

Lastly, change some existing DRM_...() logging to dev_...() along the
way, since DRM_...() seem to be deprecated in [1].

[1] https://patchwork.freedesktop.org/patch/454760/

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 177 ++++++++++++++-----------
 1 file changed, 103 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 3aaa90913bf8..acfe1bf0f936 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -100,7 +101,7 @@ struct ps8640 {
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *gpio_reset;
 	struct gpio_desc *gpio_powerdown;
-	bool powered;
+	bool pre_enabled;
 };
 
 static const struct regmap_config ps8640_regmap_config[] = {
@@ -148,6 +149,25 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
 	return container_of(aux, struct ps8640, aux);
 }
 
+static void ps8640_ensure_hpd(struct ps8640 *ps_bridge)
+{
+	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
+	struct device *dev = &ps_bridge->page[PAGE2_TOP_CNTL]->dev;
+	int status;
+	int ret;
+
+	/*
+	 * Apparently something about the firmware in the chip signals that
+	 * HPD goes high by reporting GPIO9 as high (even though HPD isn't
+	 * actually connected to GPIO9).
+	 */
+	ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
+				status & PS_GPIO9, 20 * 1000, 200 * 1000);
+
+	if (ret < 0)
+		dev_warn(dev, "HPD didn't go high: %d", ret);
+}
+
 static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 				   struct drm_dp_aux_msg *msg)
 {
@@ -171,6 +191,9 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	if (msg->address & ~SWAUX_ADDR_MASK)
 		return -EINVAL;
 
+	pm_runtime_get_sync(dev);
+	ps8640_ensure_hpd(ps_bridge);
+
 	switch (request) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_NATIVE_READ:
@@ -180,14 +203,15 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	case DP_AUX_I2C_READ:
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto exit;
 	}
 
 	ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to write PAGE0_AUXCH_CFG3: %d\n",
 			      ret);
-		return ret;
+		goto exit;
 	}
 
 	/* Assume it's good */
@@ -213,7 +237,7 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 				DRM_DEV_ERROR(dev,
 					      "failed to write WDATA: %d\n",
 					      ret);
-				return ret;
+				goto exit;
 			}
 		}
 	}
@@ -228,7 +252,7 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to read PAGE0_SWAUX_STATUS: %d\n",
 			      ret);
-		return ret;
+		goto exit;
 	}
 
 	switch (data & SWAUX_STATUS_MASK) {
@@ -250,9 +274,11 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 		len = data & SWAUX_M_MASK;
 		break;
 	case SWAUX_STATUS_INVALID:
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto exit;
 	case SWAUX_STATUS_TIMEOUT:
-		return -ETIMEDOUT;
+		ret = -ETIMEDOUT;
+		goto exit;
 	}
 
 	if (len && (request == DP_AUX_NATIVE_READ ||
@@ -264,48 +290,48 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 				DRM_DEV_ERROR(dev,
 					      "failed to read RDATA: %d\n",
 					      ret);
-				return ret;
+				goto exit;
 			}
 
 			buf[i] = data;
 		}
 	}
 
+exit:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	if (ret)
+		return ret;
 	return len;
 }
 
-static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
-				     const enum ps8640_vdo_control ctrl)
+static void ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
+				      const enum ps8640_vdo_control ctrl)
 {
 	struct regmap *map = ps_bridge->regmap[PAGE3_DSI_CNTL1];
+	struct device *dev = &ps_bridge->page[PAGE3_DSI_CNTL1]->dev;
 	u8 vdo_ctrl_buf[] = { VDO_CTL_ADD, ctrl };
 	int ret;
 
 	ret = regmap_bulk_write(map, PAGE3_SET_ADD,
 				vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
 
-	if (ret < 0) {
-		DRM_ERROR("failed to %sable VDO: %d\n",
-			  ctrl == ENABLE ? "en" : "dis", ret);
-		return ret;
-	}
-
-	return 0;
+	if (ret < 0)
+		dev_err(dev, "failed to %sable VDO: %d\n",
+			ctrl == ENABLE ? "en" : "dis", ret);
 }
 
-static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
+static int __maybe_unused ps8640_resume(struct device *dev)
 {
-	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
-	int ret, status;
-
-	if (ps_bridge->powered)
-		return;
+	struct ps8640 *ps_bridge = dev_get_drvdata(dev);
+	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
 				    ps_bridge->supplies);
 	if (ret < 0) {
-		DRM_ERROR("cannot enable regulators %d\n", ret);
-		return;
+		dev_err(dev, "cannot enable regulators %d\n", ret);
+		return ret;
 	}
 
 	gpiod_set_value(ps_bridge->gpio_powerdown, 0);
@@ -319,81 +345,70 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 	 */
 	msleep(200);
 
-	ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
-				       status & PS_GPIO9, 20 * 1000, 200 * 1000);
-
-	if (ret < 0) {
-		DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", ret);
-		goto err_regulators_disable;
-	}
-
-	msleep(50);
-
-	/*
-	 * The Manufacturer Command Set (MCS) is a device dependent interface
-	 * intended for factory programming of the display module default
-	 * parameters. Once the display module is configured, the MCS shall be
-	 * disabled by the manufacturer. Once disabled, all MCS commands are
-	 * ignored by the display interface.
-	 */
-
-	ret = regmap_update_bits(map, PAGE2_MCS_EN, MCS_EN, 0);
-	if (ret < 0) {
-		DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
-		goto err_regulators_disable;
-	}
-
-	/* Switch access edp panel's edid through i2c */
-	ret = regmap_write(map, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
-	if (ret < 0) {
-		DRM_ERROR("failed write PAGE2_I2C_BYPASS: %d\n", ret);
-		goto err_regulators_disable;
-	}
-
-	ps_bridge->powered = true;
-
-	return;
-
-err_regulators_disable:
-	regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
-			       ps_bridge->supplies);
+	return 0;
 }
 
-static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
+static int __maybe_unused ps8640_suspend(struct device *dev)
 {
+	struct ps8640 *ps_bridge = dev_get_drvdata(dev);
 	int ret;
 
-	if (!ps_bridge->powered)
-		return;
-
 	gpiod_set_value(ps_bridge->gpio_reset, 1);
 	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
 	ret = regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
 				     ps_bridge->supplies);
 	if (ret < 0)
-		DRM_ERROR("cannot disable regulators %d\n", ret);
+		dev_err(dev, "cannot disable regulators %d\n", ret);
 
-	ps_bridge->powered = false;
+	return ret;
 }
 
+static const struct dev_pm_ops ps8640_pm_ops = {
+	SET_RUNTIME_PM_OPS(ps8640_suspend, ps8640_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
 static void ps8640_pre_enable(struct drm_bridge *bridge)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
+	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
 	int ret;
 
-	ps8640_bridge_poweron(ps_bridge);
+	pm_runtime_get_sync(dev);
+	ps8640_ensure_hpd(ps_bridge);
 
-	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
+	/*
+	 * The Manufacturer Command Set (MCS) is a device dependent interface
+	 * intended for factory programming of the display module default
+	 * parameters. Once the display module is configured, the MCS shall be
+	 * disabled by the manufacturer. Once disabled, all MCS commands are
+	 * ignored by the display interface.
+	 */
+
+	ret = regmap_update_bits(map, PAGE2_MCS_EN, MCS_EN, 0);
+	if (ret < 0)
+		dev_warn(dev, "failed write PAGE2_MCS_EN: %d\n", ret);
+
+	/* Switch access edp panel's edid through i2c */
+	ret = regmap_write(map, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
 	if (ret < 0)
-		ps8640_bridge_poweroff(ps_bridge);
+		dev_warn(dev, "failed write PAGE2_MCS_EN: %d\n", ret);
+
+	ps8640_bridge_vdo_control(ps_bridge, ENABLE);
+
+	ps_bridge->pre_enabled = true;
 }
 
 static void ps8640_post_disable(struct drm_bridge *bridge)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 
+	ps_bridge->pre_enabled = false;
+
 	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
-	ps8640_bridge_poweroff(ps_bridge);
+	pm_runtime_put_sync(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
 }
 
 static int ps8640_bridge_attach(struct drm_bridge *bridge,
@@ -474,7 +489,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 					   struct drm_connector *connector)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-	bool poweroff = !ps_bridge->powered;
+	bool poweroff = !ps_bridge->pre_enabled;
 	struct edid *edid;
 
 	/*
@@ -512,6 +527,12 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.pre_enable = ps8640_pre_enable,
 };
 
+static void ps8640_runtime_disable(void *data)
+{
+	pm_runtime_dont_use_autosuspend(data);
+	pm_runtime_disable(data);
+}
+
 static int ps8640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -587,6 +608,13 @@ static int ps8640_probe(struct i2c_client *client)
 	ps_bridge->aux.transfer = ps8640_aux_transfer;
 	drm_dp_aux_init(&ps_bridge->aux);
 
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_add_action_or_reset(dev, ps8640_runtime_disable, dev);
+	if (ret)
+		return ret;
+
 	drm_bridge_add(&ps_bridge->bridge);
 
 	return 0;
@@ -613,6 +641,7 @@ static struct i2c_driver ps8640_driver = {
 	.driver = {
 		.name = "ps8640",
 		.of_match_table = ps8640_match,
+		.pm = &ps8640_pm_ops,
 	},
 };
 module_i2c_driver(ps8640_driver);
-- 
2.33.0.1079.g6e70778dc9-goog

