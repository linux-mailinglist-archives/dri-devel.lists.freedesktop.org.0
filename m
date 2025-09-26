Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF43BA4A93
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE4B10E18F;
	Fri, 26 Sep 2025 16:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L1atmfeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B97C10E18F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:35:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 27D28C00D98;
 Fri, 26 Sep 2025 16:34:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 85F1D606B5;
 Fri, 26 Sep 2025 16:35:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0B56102F1829; 
 Fri, 26 Sep 2025 18:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758904508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ICzSvLvJb7esyCKXOeOL5sJVQ8upayrrtyMxyExJw7M=;
 b=L1atmfeBiDc6ktznLNxQbLAPCdAs2qwzkmXmYL+F1kKNRUOxRYYki4LKTc32XRi+Y2/zMn
 eAljRYkPA9LVeWDK3HG7JvDAaLy5jsZ1xnWwRChVy3RRUq88NpFKhysLHXkKMjXtv2yY1h
 WoPjpNrnuM7Izs7DDepPGLm6Hpcn4T2MsClHITKghBWIRmMMToqCV82k8MFTM8/q+m3Sms
 0EmEBpeA+DRggKp/c2WD43BNwigbcXlA0CkYHpjUlh77U2zq2YMo+tHzenq2fXUt/AsqRZ
 rSpgEkJN9zE4tgtijaUN2WrvbH6gpIyFNPwIl09uF0S+QGEbB/e1qv4hFYYFXA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Sep 2025 18:33:28 +0200
Subject: [PATCH v2 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-drm-bridge-atomic-vs-remove-v2-2-69f7d5ca1a92@bootlin.com>
References: <20250926-drm-bridge-atomic-vs-remove-v2-0-69f7d5ca1a92@bootlin.com>
In-Reply-To: <20250926-drm-bridge-atomic-vs-remove-v2-0-69f7d5ca1a92@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Changed in v2:
- Use a devres action instead of a flag
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 85 ++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552ab167d4e8d9b74957c585e4c6fb7..92014366449237668b50cc884a67f52fcd5777c3 100644
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
@@ -463,6 +475,40 @@ static void sn65dsi83_monitor_stop(struct sn65dsi83 *ctx)
 	cancel_delayed_work_sync(&ctx->monitor_work);
 }
 
+/*
+ * Release resources taken by sn65dsi83_atomic_pre_enable().
+ *
+ * Normally invoked by sn65dsi83_atomic_disable(). But if
+ * sn65dsi83_remove() is invoked while enabled, then drm_bridge_unplug()
+ * would defuse sn65dsi83_atomic_disable(). Thus a devres action is used to
+ * ensure exactly one code path (removal or atomic disable) invokes this
+ * code.
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
@@ -478,10 +524,15 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
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
+		drm_bridge_exit(idx);
 		return;
 	}
 
@@ -625,6 +676,8 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
 		/* On failure, disable PLL again and exit. */
 		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
+		devm_add_action(ctx->dev, sn65dsi83_release_resources, ctx);
+		drm_bridge_exit(idx);
 		return;
 	}
 
@@ -633,6 +686,9 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 
 	/* Wait for 10ms after soft reset as specified in datasheet */
 	usleep_range(10000, 12000);
+
+	devm_add_action(ctx->dev, sn65dsi83_release_resources, ctx);
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
@@ -640,6 +696,10 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	unsigned int pval;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	/* Clear all errors that got asserted during initialization. */
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
@@ -659,32 +719,22 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
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
-
-	if (ctx->irq) {
-		/* Disable irq */
-		regmap_write(ctx->regmap, REG_IRQ_EN, 0x0);
-		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, 0x0);
-	} else {
-		/* Stop the polling task */
-		sn65dsi83_monitor_stop(ctx);
-	}
+	int idx;
 
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
@@ -1005,6 +1055,7 @@ static void sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
+	drm_bridge_unplug(&ctx->bridge);
 	drm_bridge_remove(&ctx->bridge);
 }
 

-- 
2.51.0

