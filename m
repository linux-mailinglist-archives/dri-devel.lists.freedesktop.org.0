Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13801C536B4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B7B10E77A;
	Wed, 12 Nov 2025 16:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="uXGm9niC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E6610E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:34:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C39D01A1A42;
 Wed, 12 Nov 2025 16:34:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 996F86070B;
 Wed, 12 Nov 2025 16:34:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10D10102F1BA8; Wed, 12 Nov 2025 17:34:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762965294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0pMT+aT4AJiznRBcaHknDkWgDDjg3dsj5pXkKOf+n0k=;
 b=uXGm9niCgFce1r9ejT7Q27ZwTUZBk8vJxQc2SmlAWHeACNSg4Aqfw3fZVCw4CbfNctuvB3
 hzOZKd9NarrtUO0cuGkE1IDaGe1Mp7imOKTqORu/f7D4ANOyKZa1dv4mhT61OsCZPNALaL
 rRX4inqocvpaHXArIQyEdNPJXYcxTLq8szAKB7KwzdJo5ajk6XdxPu4P5njHRJ4zxUSzu4
 xg8eXeXXqmYfYYegYgVY6xC14Yvds1tRcRDAZm1N0lifgSx8ZtBwE3YS7SmWHZxpIiVYqb
 F2KcpeH6cpUzwxkn9P2EPNg+gAC/o3hmd5M4ehrgZfvA/tdv1Z/fStH/7C86CQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 12 Nov 2025 17:34:35 +0100
Subject: [PATCH v3 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-drm-bridge-atomic-vs-remove-v3-2-85db717ce094@bootlin.com>
References: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
In-Reply-To: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
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

To support hot-unplug of this bridge we need to protect access to device
resources in case sn65dsi83_remove() happens concurrently to other code.

Some care is needed for the case when the unplug happens before
sn65dsi83_atomic_disable() has a chance to enter the critical section
(i.e. a successful drm_bridge_enter() call), which occurs whenever the
hardware is removed while the display is active. When that happens,
sn65dsi83_atomic_disable() in unable to release the resources taken by
sn65dsi83_atomic_pre_enable().

To ensure those resources are released exactly once on device removal:

 * move the code to release them to a dedicated function
 * register that function when the resources are taken in
   sn65dsi83_atomic_pre_enable()
 * if sn65dsi83_atomic_disable() happens before sn65dsi83_remove()
   (typical non-hot-unplug case):
   * sn65dsi83_atomic_disable() can enter the critical section
     (drm_bridge_enter() returns 0) -> it releases and executes the
     devres action
 * if sn65dsi83_atomic_disable() happens after sn65dsi83_remove()
   (typical hot-unplug case):
   * sn65dsi83_remove() -> drm_bridge_unplug() prevents
     sn65dsi83_atomic_disable() from entering the critical section
     (drm_bridge_enter() returns nonzero), so sn65dsi83_atomic_disable()
     cannot release and execute the devres action
   * the devres action is executed at the end of sn65dsi83_remove()

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Don't call drm_bridge_remove(), it's now in drm_bridge_unplug()
- use gotos for error management in sn65dsi83_atomic_pre_enable()
- simplify sn65dsi83_release_resources() comment

Changes in v2:
- Use a devres action instead of a flag
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 86 +++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552ab167d4e8d9b74957c585e4c6fb7..ac74b9e85b97604c95a255fc2c59bd0e7a3137f5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -406,6 +406,10 @@ static void sn65dsi83_reset_work(struct work_struct *ws)
 {
 	struct sn65dsi83 *ctx = container_of(ws, struct sn65dsi83, reset_work);
 	int ret;
+	int idx;
+
+	if (!drm_bridge_enter(&ctx->bridge, &idx))
+		return;
 
 	/* Reset the pipe */
 	ret = sn65dsi83_reset_pipe(ctx);
@@ -415,12 +419,18 @@ static void sn65dsi83_reset_work(struct work_struct *ws)
 	}
 	if (ctx->irq)
 		enable_irq(ctx->irq);
+
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
 {
 	unsigned int irq_stat;
 	int ret;
+	int idx;
+
+	if (!drm_bridge_enter(&ctx->bridge, &idx))
+		return;
 
 	/*
 	 * Schedule a reset in case of:
@@ -441,6 +451,8 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
 
 		schedule_work(&ctx->reset_work);
 	}
+
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_monitor_work(struct work_struct *work)
@@ -463,6 +475,37 @@ static void sn65dsi83_monitor_stop(struct sn65dsi83 *ctx)
 	cancel_delayed_work_sync(&ctx->monitor_work);
 }
 
+/*
+ * Release resources taken by sn65dsi83_atomic_pre_enable().
+ *
+ * Invoked by sn65dsi83_atomic_disable() normally, or by devres after
+ * sn65dsi83_remove() in case this happens befora atomic_disable.
+ */
+static void sn65dsi83_release_resources(void *data)
+{
+	struct sn65dsi83 *ctx = (struct sn65dsi83 *)data;
+	int ret;
+
+	if (ctx->irq) {
+		/* Disable irq */
+		regmap_write(ctx->regmap, REG_IRQ_EN, 0x0);
+		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, 0x0);
+	} else {
+		/* Stop the polling task */
+		sn65dsi83_monitor_stop(ctx);
+	}
+
+	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+	usleep_range(10000, 11000);
+
+	ret = regulator_disable(ctx->vcc);
+	if (ret)
+		dev_err(ctx->dev, "Failed to disable vcc: %d\n", ret);
+
+	regcache_mark_dirty(ctx->regmap);
+}
+
 static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *state)
 {
@@ -478,11 +521,15 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	__le16 le16val;
 	u16 val;
 	int ret;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	ret = regulator_enable(ctx->vcc);
 	if (ret) {
 		dev_err(ctx->dev, "Failed to enable vcc: %d\n", ret);
-		return;
+		goto err_exit;
 	}
 
 	/* Deassert reset */
@@ -625,7 +672,7 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
 		/* On failure, disable PLL again and exit. */
 		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
-		return;
+		goto err_add_action;
 	}
 
 	/* Trigger reset after CSR register update. */
@@ -633,6 +680,11 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 
 	/* Wait for 10ms after soft reset as specified in datasheet */
 	usleep_range(10000, 12000);
+
+err_add_action:
+	devm_add_action(ctx->dev, sn65dsi83_release_resources, ctx);
+err_exit:
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
@@ -640,6 +692,10 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	unsigned int pval;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	/* Clear all errors that got asserted during initialization. */
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
@@ -659,32 +715,22 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 		/* Use the polling task */
 		sn65dsi83_monitor_start(ctx);
 	}
+
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 				     struct drm_atomic_state *state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	int ret;
+	int idx;
 
-	if (ctx->irq) {
-		/* Disable irq */
-		regmap_write(ctx->regmap, REG_IRQ_EN, 0x0);
-		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, 0x0);
-	} else {
-		/* Stop the polling task */
-		sn65dsi83_monitor_stop(ctx);
-	}
-
-	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
-	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
-	usleep_range(10000, 11000);
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
-	ret = regulator_disable(ctx->vcc);
-	if (ret)
-		dev_err(ctx->dev, "Failed to disable vcc: %d\n", ret);
+	devm_release_action(ctx->dev, sn65dsi83_release_resources, ctx);
 
-	regcache_mark_dirty(ctx->regmap);
+	drm_bridge_exit(idx);
 }
 
 static enum drm_mode_status
@@ -1005,7 +1051,7 @@ static void sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
-	drm_bridge_remove(&ctx->bridge);
+	drm_bridge_unplug(&ctx->bridge);
 }
 
 static const struct i2c_device_id sn65dsi83_id[] = {

-- 
2.51.1

