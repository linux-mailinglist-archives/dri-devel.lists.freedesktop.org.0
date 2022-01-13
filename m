Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B653F48D2D9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 08:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCA11122B8;
	Thu, 13 Jan 2022 07:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8DE1122B2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 07:32:07 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 ie23-20020a17090b401700b001b38a5318easo9851914pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 23:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGXhh44addCWe8AOzHydLKky1ps+n2furtOGFFp/QwQ=;
 b=Eaqd/PV04y5G4zT8Tz5X+Pxs26ZZJ6i0vWlfOuzap13frb1NR7IDGmoDVSqw5t0HVs
 nPhcq1nljBlW8BbEUZICaqEZsqW6KcuUPii/D7+eXxG/ham5gB7b+zbprGZ2vVMxuFF/
 9mYV9G7yeVHmYCn2whlp0W7MgLCD81+9Qaofg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGXhh44addCWe8AOzHydLKky1ps+n2furtOGFFp/QwQ=;
 b=FJ8d+Na3cxM0pJyVjBcrp5NCpQE/MnrOMs7Vyp32/C/xZ6uUviTvJsAw82mAIKjnPW
 pAhhw1rkNo09N7g+R7jbQ5sSrxooFm7Y11X8sCXYdwTzWmVaQn6/IpoM1WnHFhKNDumX
 X68gN2dOUqnfx+IoJ99YBT4Il/YYQL78Bo4nXZ93aG8NwNg+H1yIX+wGOZ3ZiNh3i8r+
 rYRde6YmrgjaMP4xpQ3IrptxiZ2n+iFk2tBcy1lF4aWamKq6LBtXZjdEAW7lj+Gfsd27
 bIZysoCexk71/l92YUc7SmS9dizUMkDsEei7VXwTQNGCYxOveRUlyVZdefeTvjFulB98
 tcIA==
X-Gm-Message-State: AOAM530uKmxjJy6o1vO5WdFOmBYSw6P+w5zzFlSbi9Z5faIrYuzbuvOP
 tv9VQzA5sdULdv4qlBWMl8og2GdlE+xajw==
X-Google-Smtp-Source: ABdhPJwsizx1s2fB9QFU0nisjqZob7TQqUIw9/kvY3DshLIezzzM1gqFN+0ELBu28qLMTcFtkttaMg==
X-Received: by 2002:a63:905:: with SMTP id 5mr2889464pgj.485.1642059126973;
 Wed, 12 Jan 2022 23:32:06 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3ced:e0da:4852:430c])
 by smtp.gmail.com with ESMTPSA id om3sm7747701pjb.49.2022.01.12.23.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:32:06 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 2/3] drm/bridge: anx7625: Support reading edid through aux
 channel
Date: Thu, 13 Jan 2022 15:31:57 +0800
Message-Id: <20220113073158.2171673-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220113073158.2171673-1-hsinyi@chromium.org>
References: <20220113073158.2171673-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support reading edid through aux channel if panel is connected to aux
bus. Extend anx7625_aux_dpcd_trans() to implement aux transfer function:

1. panel is populated in devm_of_dp_aux_populate_ep_devices(), so move
   anx7625_parse_dt() after.
2. Use pm runtime autosuspend since aux transfer function is called
   multiple times when reading edid.
3. No-op if aux transfer length is 0.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
v1->v2: Fix cmd for native read/write.

This patch is based on drm-misc-next and depends on
https://patchwork.freedesktop.org/patch/469081/
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 127 +++++++++++++++++++---
 drivers/gpu/drm/bridge/analogix/anx7625.h |   4 +
 2 files changed, 113 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index dbe708eb3bcf11..24665bb93f9244 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -24,6 +24,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_hdcp.h>
@@ -231,19 +232,22 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 	return 0;
 }
 
-static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
-				  u32 address, u8 len, u8 *buf)
+static int anx7625_aux_trans(struct anx7625_data *ctx, u8 op, u32 address,
+			     u8 len, u8 *buf)
 {
 	struct device *dev = &ctx->client->dev;
 	int ret;
 	u8 addrh, addrm, addrl;
 	u8 cmd;
 
-	if (len > MAX_DPCD_BUFFER_SIZE) {
+	if (len > DP_AUX_MAX_PAYLOAD_BYTES) {
 		dev_err(dev, "exceed aux buffer len.\n");
 		return -EINVAL;
 	}
 
+	if (!len)
+		return len;
+
 	addrl = address & 0xFF;
 	addrm = (address >> 8) & 0xFF;
 	addrh = (address >> 16) & 0xFF;
@@ -262,7 +266,7 @@ static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
 				 AP_AUX_ADDR_19_16, addrh);
 
-	if (op == DPCD_WRITE)
+	if (op == DPCD_WRITE || op == AP_AUX_WRITE)
 		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
 					       AP_AUX_BUFF_START, len, buf);
 	/* Enable aux access */
@@ -275,14 +279,14 @@ static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
 	}
 
 	ret = wait_aux_op_finish(ctx);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(dev, "aux IO error: wait aux op finish.\n");
 		return ret;
 	}
 
 	/* Write done */
-	if (op == DPCD_WRITE)
-		return 0;
+	if (op == DPCD_WRITE || op == AP_AUX_WRITE)
+		return len;
 
 	/* Read done, read out dpcd data */
 	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
@@ -292,7 +296,7 @@ static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
 		return -EIO;
 	}
 
-	return 0;
+	return len;
 }
 
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
@@ -867,7 +871,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 	}
 
 	/* Read downstream capability */
-	anx7625_aux_dpcd_trans(ctx, DPCD_READ, 0x68028, 1, &bcap);
+	anx7625_aux_trans(ctx, DPCD_READ, 0x68028, 1, &bcap);
 	if (!(bcap & 0x01)) {
 		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
 		return 0;
@@ -956,7 +960,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 	dev_dbg(dev, "notify downstream enter into standby\n");
 	/* Downstream monitor enter into standby mode */
 	data = 2;
-	ret |= anx7625_aux_dpcd_trans(ctx, DPCD_WRITE, 0x000600, 1, &data);
+	ret |= anx7625_aux_trans(ctx, DPCD_WRITE, 0x000600, 1, &data);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
 
@@ -1655,11 +1659,64 @@ static int anx7625_parse_dt(struct device *dev,
 	return 0;
 }
 
+static bool anx7625_of_panel_on_aux_bus(struct device *dev)
+{
+	struct device_node *bus, *panel;
+
+	bus = of_get_child_by_name(dev->of_node, "aux-bus");
+	if (!bus)
+		return false;
+
+	panel = of_get_child_by_name(bus, "panel");
+	of_node_put(bus);
+	if (!panel)
+		return false;
+	of_node_put(panel);
+
+	return true;
+}
+
 static inline struct anx7625_data *bridge_to_anx7625(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct anx7625_data, bridge);
 }
 
+static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
+                                    struct drm_dp_aux_msg *msg)
+{
+	struct anx7625_data *ctx = container_of(aux, struct anx7625_data, aux);
+	struct device *dev = &ctx->client->dev;
+	u8 request = msg->request & ~DP_AUX_I2C_MOT, op;
+	int ret = 0;
+
+	pm_runtime_get_sync(dev);
+	msg->reply = 0;
+	switch (request) {
+	case DP_AUX_NATIVE_WRITE:
+		op = DPCD_WRITE;
+		break;
+	case DP_AUX_I2C_WRITE:
+		op = AP_AUX_WRITE;
+		break;
+	case DP_AUX_NATIVE_READ:
+		op = DPCD_READ;
+		break;
+	case DP_AUX_I2C_READ:
+		op = AP_AUX_READ;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	if (!ret) {
+		ret = anx7625_aux_trans(ctx, op, msg->address, msg->size,
+					msg->buffer);
+	}
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
@@ -2066,6 +2123,13 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
+	ctx->aux.drm_dev = bridge->dev;
+	err = drm_dp_aux_register(&ctx->aux);
+	if (err) {
+		dev_err(dev, "failed to register aux channel: %d\n", err);
+		return err;
+	}
+
 	if (ctx->pdata.panel_bridge) {
 		err = drm_bridge_attach(bridge->encoder,
 					ctx->pdata.panel_bridge,
@@ -2079,6 +2143,13 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void anx7625_bridge_detach(struct drm_bridge *bridge)
+{
+	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
+
+	drm_dp_aux_unregister(&ctx->aux);
+}
+
 static enum drm_mode_status
 anx7625_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_info *info,
@@ -2344,6 +2415,7 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.attach = anx7625_bridge_attach,
+	.detach = anx7625_bridge_detach,
 	.mode_valid = anx7625_bridge_mode_valid,
 	.mode_set = anx7625_bridge_mode_set,
 	.atomic_check = anx7625_bridge_atomic_check,
@@ -2501,6 +2573,12 @@ static const struct dev_pm_ops anx7625_pm_ops = {
 			   anx7625_runtime_pm_resume, NULL)
 };
 
+static void anx7625_runtime_disable(void *data)
+{
+	pm_runtime_dont_use_autosuspend(data);
+	pm_runtime_disable(data);
+}
+
 static int anx7625_i2c_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
@@ -2523,13 +2601,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
 	pdata = &platform->pdata;
 
-	ret = anx7625_parse_dt(dev, pdata);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
-		return ret;
-	}
-
 	platform->client = client;
 	i2c_set_clientdata(client, platform);
 
@@ -2577,6 +2648,19 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		}
 	}
 
+	platform->aux.name = "anx7625-aux";
+	platform->aux.dev = dev;
+	platform->aux.transfer = anx7625_aux_transfer;
+	drm_dp_aux_init(&platform->aux);
+	devm_of_dp_aux_populate_ep_devices(&platform->aux);
+
+	ret = anx7625_parse_dt(dev, pdata);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
+		return ret;
+	}
+
 	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
 		ret = -ENOMEM;
 		DRM_DEV_ERROR(dev, "fail to reserve I2C bus.\n");
@@ -2584,6 +2668,12 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	}
 
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_suspend_ignore_children(dev, true);
+	ret = devm_add_action_or_reset(dev, anx7625_runtime_disable, dev);
+	if (ret)
+		return ret;
 
 	if (!platform->pdata.low_power_mode) {
 		anx7625_disable_pd_protocol(platform);
@@ -2596,7 +2686,8 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
-	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
+	if (!anx7625_of_panel_on_aux_bus(&client->dev))
+		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
 	if (!platform->pdata.panel_bridge)
 		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
 					DRM_BRIDGE_OP_DETECT;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 56165f5b254c14..cab19735c22e21 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -231,6 +231,9 @@
 #define AP_AUX_ADDR_15_8  0x12
 #define AP_AUX_ADDR_19_16 0x13
 
+#define AP_AUX_READ 0x1
+#define AP_AUX_WRITE 0x4
+
 /* Bit[0:3] AUX status, bit 4 op_en, bit 5 address only */
 #define AP_AUX_CTRL_STATUS 0x14
 #define AP_AUX_CTRL_OP_EN 0x10
@@ -474,6 +477,7 @@ struct anx7625_data {
 	u8 bridge_attached;
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
+	struct drm_dp_aux aux;
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.34.1.575.g55b058a8bb-goog

