Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051A13760E1
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 09:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D046C6ED1A;
	Fri,  7 May 2021 07:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66BB6E7D3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 06:37:53 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so4755610pjz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 23:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vaXy2JHrBxaYnwLyYH5HyUVs0F4XBdNV67c88m2iH3U=;
 b=iqHj1wWBR2w+PKWJzc7bFOcWn9lY0PCpSl3c8GrsmL4DbRau4Z9aIbXTHv4G0eqnBm
 JliY2NYI80upo/JdrYmvEzX9MewYx22TvkJa5n/x5fSX7n8Eep419s4Qa9QQElFFH+CN
 jSkxhUU5K/0S7Ehc5g0L/h5bRYOzyIcDBpKxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vaXy2JHrBxaYnwLyYH5HyUVs0F4XBdNV67c88m2iH3U=;
 b=USlcWGhrCkC/LH2+t5z6bF3smkxCvFRKIEfml4Gk5LjqHi4t2f28Pu2pv4wT0bkCgG
 KGXYv9ZhZLW+WWf+SZFVFNpZhJlpmF7HCACFBMy+G8es5okAsdkC3riHTLfK0Mlpdg24
 A2FpR2716ud5tPmkHnwRHZuY1V3l/HFzIYzDjtYBkCn0kNe+4kMe0hD496cZi1bwv6uE
 c8itGr3Z73/Qf6oaHPUP7SDwnO4n2RBfAtnljVo+8JjNIU7Y0qBspmyfR0D0pM/HjthH
 QVm4qHgqxwT+ag1Uxgg05YDE7aq5ePGtBd0U/M0NIVSvmyQGjqildy2wyPIHSQATsvJh
 0e+w==
X-Gm-Message-State: AOAM530OiGmqf3z+58227x7D0xZnHRidrSqcQYljbrRZJGWSK075qbOJ
 u0ZeB/4bejPGK0BmCvgAj4kk/A==
X-Google-Smtp-Source: ABdhPJxhBWiBeTxygAX2edAC+Bd58rixGrcB3WjwLgKLzGYH7tHoh0AWGp11Ex0MxAzqYoJ6hp4fLg==
X-Received: by 2002:a17:90a:d582:: with SMTP id
 v2mr9358680pju.88.1620369473423; 
 Thu, 06 May 2021 23:37:53 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id d16sm3713345pgk.34.2021.05.06.23.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 23:37:52 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH 1/2] drm/bridge: anx7625: refactor power control to use
 runtime PM framework
Date: Fri,  7 May 2021 14:35:47 +0800
Message-Id: <20210507063620.390280-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 May 2021 07:04:43 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver originally use an atomic_t for keep track of the power
status, which makes the driver more complicated than needed, and has
some race condition as it's possible to have the power on and power off
sequence going at the same time.

This patch remove the usage of the atomic_t power_status, and use the
kernel runtime power management framework instead.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Change-Id: I58e19680b6d9ffb04be2a90f458400a1433925aa
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 147 +++++++++-------------
 drivers/gpu/drm/bridge/analogix/anx7625.h |   1 -
 2 files changed, 62 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 23283ba0c4f9..0d90cd63fc27 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -1005,33 +1006,6 @@ static void anx7625_power_on_init(struct anx7625_data *ctx)
 	}
 }
 
-static void anx7625_chip_control(struct anx7625_data *ctx, int state)
-{
-	struct device *dev = &ctx->client->dev;
-
-	DRM_DEV_DEBUG_DRIVER(dev, "before set, power_state(%d).\n",
-			     atomic_read(&ctx->power_status));
-
-	if (!ctx->pdata.low_power_mode)
-		return;
-
-	if (state) {
-		atomic_inc(&ctx->power_status);
-		if (atomic_read(&ctx->power_status) == 1)
-			anx7625_power_on_init(ctx);
-	} else {
-		if (atomic_read(&ctx->power_status)) {
-			atomic_dec(&ctx->power_status);
-
-			if (atomic_read(&ctx->power_status) == 0)
-				anx7625_power_standby(ctx);
-		}
-	}
-
-	DRM_DEV_DEBUG_DRIVER(dev, "after set, power_state(%d).\n",
-			     atomic_read(&ctx->power_status));
-}
-
 static void anx7625_init_gpio(struct anx7625_data *platform)
 {
 	struct device *dev = &platform->client->dev;
@@ -1061,9 +1035,6 @@ static void anx7625_stop_dp_work(struct anx7625_data *ctx)
 	ctx->hpd_status = 0;
 	ctx->hpd_high_cnt = 0;
 	ctx->display_timing_valid = 0;
-
-	if (ctx->pdata.low_power_mode == 0)
-		anx7625_disable_pd_protocol(ctx);
 }
 
 static void anx7625_start_dp_work(struct anx7625_data *ctx)
@@ -1105,49 +1076,26 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
 	int ret, val;
 	struct device *dev = &ctx->client->dev;
 
-	if (atomic_read(&ctx->power_status) != 1) {
-		DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
-		return;
-	}
-
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
 				 5000,
 				 5000 * 100);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "HPD polling timeout!\n");
-	} else {
-		DRM_DEV_DEBUG_DRIVER(dev, "HPD raise up.\n");
-		anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
-				  INTR_ALERT_1, 0xFF);
-		anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
-				  INTERFACE_CHANGE_INT, 0);
+		DRM_DEV_ERROR(dev, "no hpd.\n");
+		return;
 	}
 
-	anx7625_start_dp_work(ctx);
-}
-
-static void anx7625_disconnect_check(struct anx7625_data *ctx)
-{
-	if (atomic_read(&ctx->power_status) == 0)
-		anx7625_stop_dp_work(ctx);
-}
-
-static void anx7625_low_power_mode_check(struct anx7625_data *ctx,
-					 int state)
-{
-	struct device *dev = &ctx->client->dev;
+	DRM_DEV_DEBUG_DRIVER(dev, "system status: 0x%x. HPD raise up.\n", val);
+	anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
+			  INTR_ALERT_1, 0xFF);
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+			  INTERFACE_CHANGE_INT, 0);
 
-	DRM_DEV_DEBUG_DRIVER(dev, "low power mode check, state(%d).\n", state);
+	anx7625_start_dp_work(ctx);
 
-	if (ctx->pdata.low_power_mode) {
-		anx7625_chip_control(ctx, state);
-		if (state)
-			anx7625_hpd_polling(ctx);
-		else
-			anx7625_disconnect_check(ctx);
-	}
+	if (!ctx->pdata.panel_bridge && ctx->bridge_attached)
+		drm_helper_hpd_irq_event(ctx->bridge.dev);
 }
 
 static void anx7625_remove_edid(struct anx7625_data *ctx)
@@ -1180,9 +1128,6 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 	int intr_vector, status;
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "power_status=%d\n",
-			     (u32)atomic_read(&ctx->power_status));
-
 	status = anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
 				   INTR_ALERT_1, 0xFF);
 	if (status < 0) {
@@ -1228,22 +1173,25 @@ static void anx7625_work_func(struct work_struct *work)
 						struct anx7625_data, work);
 
 	mutex_lock(&ctx->lock);
+
+	if (pm_runtime_suspended(&ctx->client->dev))
+		goto unlock;
+
 	event = anx7625_hpd_change_detect(ctx);
-	mutex_unlock(&ctx->lock);
 	if (event < 0)
-		return;
+		goto unlock;
 
 	if (ctx->bridge_attached)
 		drm_helper_hpd_irq_event(ctx->bridge.dev);
+
+unlock:
+	mutex_unlock(&ctx->lock);
 }
 
 static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
 {
 	struct anx7625_data *ctx = (struct anx7625_data *)data;
 
-	if (atomic_read(&ctx->power_status) != 1)
-		return IRQ_NONE;
-
 	queue_work(ctx->workqueue, &ctx->work);
 
 	return IRQ_HANDLED;
@@ -1305,9 +1253,9 @@ static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
 		return (struct edid *)edid;
 	}
 
-	anx7625_low_power_mode_check(ctx, 1);
+	pm_runtime_get_sync(dev);
 	edid_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
-	anx7625_low_power_mode_check(ctx, 0);
+	pm_runtime_put(dev);
 
 	if (edid_num < 1) {
 		DRM_DEV_ERROR(dev, "Fail to read EDID: %d\n", edid_num);
@@ -1611,10 +1559,7 @@ static void anx7625_bridge_enable(struct drm_bridge *bridge)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
 
-	anx7625_low_power_mode_check(ctx, 1);
-
-	if (WARN_ON(!atomic_read(&ctx->power_status)))
-		return;
+	pm_runtime_get_sync(dev);
 
 	anx7625_dp_start(ctx);
 }
@@ -1624,14 +1569,11 @@ static void anx7625_bridge_disable(struct drm_bridge *bridge)
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = &ctx->client->dev;
 
-	if (WARN_ON(!atomic_read(&ctx->power_status)))
-		return;
-
 	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
 
 	anx7625_dp_stop(ctx);
 
-	anx7625_low_power_mode_check(ctx, 0);
+	pm_runtime_put(dev);
 }
 
 static enum drm_connector_status
@@ -1735,6 +1677,38 @@ static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
 	i2c_unregister_device(ctx->i2c.tcpc_client);
 }
 
+static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	mutex_lock(&ctx->lock);
+
+	anx7625_stop_dp_work(ctx);
+	anx7625_power_standby(ctx);
+
+	mutex_unlock(&ctx->lock);
+
+	return 0;
+}
+
+static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	mutex_lock(&ctx->lock);
+
+	anx7625_power_on_init(ctx);
+	anx7625_hpd_polling(ctx);
+
+	mutex_unlock(&ctx->lock);
+
+	return 0;
+}
+
+static const struct dev_pm_ops anx7625_pm_ops = {
+	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend, anx7625_runtime_pm_resume, NULL)
+};
+
 static int anx7625_i2c_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
@@ -1778,8 +1752,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	}
 	anx7625_init_gpio(platform);
 
-	atomic_set(&platform->power_status, 0);
-
 	mutex_init(&platform->lock);
 
 	platform->pdata.intp_irq = client->irq;
@@ -1809,9 +1781,11 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		goto free_wq;
 	}
 
-	if (platform->pdata.low_power_mode == 0) {
+	pm_runtime_enable(dev);
+
+	if (!platform->pdata.low_power_mode) {
 		anx7625_disable_pd_protocol(platform);
-		atomic_set(&platform->power_status, 1);
+		pm_runtime_get_sync(dev);
 	}
 
 	/* Add work function */
@@ -1847,6 +1821,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 	if (platform->pdata.intp_irq)
 		destroy_workqueue(platform->workqueue);
 
+	if (!platform->pdata.low_power_mode)
+		pm_runtime_put_sync_suspend(&client->dev);
+
 	anx7625_unregister_i2c_dummy_clients(platform);
 
 	kfree(platform);
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index e4a086b3a3d7..034c3840028f 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -369,7 +369,6 @@ struct anx7625_i2c_client {
 
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
-	atomic_t power_status;
 	int hpd_status;
 	int hpd_high_cnt;
 	/* Lock for work queue */

base-commit: e48661230cc35b3d0f4367eddfc19f86463ab917
-- 
2.31.1.607.g51e8a6a459-goog

