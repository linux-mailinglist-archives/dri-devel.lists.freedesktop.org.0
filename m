Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA098A057ED
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 11:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648710E849;
	Wed,  8 Jan 2025 10:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G3ZqTgLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BAF10E843
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 10:19:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9DD90FF805;
 Wed,  8 Jan 2025 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736331564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zT4BJvqvjE1eW0ILbkiW+8DhklIBuRn9HyMgioarGPs=;
 b=G3ZqTgLw49//gZOhVuYeMg4zc/uWKHSnHEC9Ij0P/C/GDN8xIcHJW3yZIUtKa1HujQMGZe
 yLCQ6Xc7onYYvQ2f4Cip+oijXRS9RawXwSTqcvt0KQPyO9srKmkn3qKWbC0iPK+BvIJfzs
 eajqoe796GHrF9BrEhtQHg9bgVVODqDSHIAP522wuS1ktBa2bs2MKbB3E7hNuaS0zNuaAL
 b5ZlfNNAWLiPNASOdtGdmEaISqJPodfxDmDoi91Akw4RmHH2t+ypQ+UlQJckzqlAKH6i9/
 m9B0Xe736PXNPWqGLpf7qnCcs/dAr4ek42VrhhofjZMAJYlDELJ6r9cgt7Wc6w==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery mechanism
Date: Wed,  8 Jan 2025 11:19:02 +0100
Message-ID: <20250108101907.410456-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108101907.410456-1-herve.codina@bootlin.com>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
from errors by itself. A full restart of the bridge is needed in those
cases to have the bridge output LVDS signals again.

Also, during tests, cases were observed where reading the status of the
bridge was not even possible. Indeed, in those cases, the bridge stops
to acknowledge I2C transactions. Only a full reset of the bridge (power
off/on) brings back the bridge to a functional state.

The TI SN65DSI83 has some error detection capabilities. Introduce an
error recovery mechanism based on this detection.

The errors detected are signaled through an interrupt. On system where
this interrupt is not available, the driver uses a polling monitoring
fallback to check for errors. When an error is present or when reading
the bridge status leads to an I2C failure, the recovery process is
launched.

Restarting the bridge needs to redo the initialization sequence. This
initialization sequence has to be done with the DSI data lanes driven in
LP11 state. In order to do that, the recovery process resets the whole
output path (i.e the path from the encoder to the connector) where the
bridge is located.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 147 ++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index e6264514bb3f..74bc05647436 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -35,9 +35,12 @@
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_drv.h> /* DRM_MODESET_LOCK_ALL_BEGIN() needs drm_drv_uses_atomic_modeset() */
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -147,6 +150,9 @@ struct sn65dsi83 {
 	struct regulator		*vcc;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
+	bool				use_irq;
+	struct delayed_work		monitor_work;
+	struct work_struct		reset_work;
 };
 
 static const struct regmap_range sn65dsi83_readable_ranges[] = {
@@ -328,6 +334,111 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
 	return dsi_div - 1;
 }
 
+static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
+{
+	struct drm_atomic_state *state = ERR_PTR(-EINVAL);
+	struct drm_device *dev = sn65dsi83->bridge.dev;
+	struct drm_connector_state *connector_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector *connector;
+	int err;
+
+	/*
+	 * Reset active outputs of the related CRTC.
+	 *
+	 * This way, drm core will reconfigure each components in the CRTC
+	 * outputs path. In our case, this will force the previous component to
+	 * go back in LP11 mode and so allow the reconfiguration of SN64DSI83
+	 * bridge.
+	 *
+	 * Keep the lock during the whole operation to be atomic.
+	 */
+
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
+
+	state = drm_atomic_helper_duplicate_state(dev, &ctx);
+	if (IS_ERR(state)) {
+		err = PTR_ERR(state);
+		goto unlock;
+	}
+
+	state->acquire_ctx = &ctx;
+
+	connector = drm_atomic_get_old_connector_for_encoder(state,
+							     sn65dsi83->bridge.encoder);
+	if (!connector) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	connector_state = drm_atomic_get_connector_state(state, connector);
+	if (IS_ERR(connector_state)) {
+		err = PTR_ERR(connector_state);
+		goto unlock;
+	}
+
+	err = drm_atomic_helper_reset_pipe(connector_state->crtc, &ctx);
+	if (err < 0)
+		goto unlock;
+
+unlock:
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
+	if (!IS_ERR(state))
+		drm_atomic_state_put(state);
+	return err;
+}
+
+static void sn65dsi83_reset_work(struct work_struct *ws)
+{
+	struct sn65dsi83 *ctx = container_of(ws, struct sn65dsi83, reset_work);
+	int ret;
+
+	dev_warn(ctx->dev, "reset the pipe\n");
+
+	/* Reset the pipe */
+	ret = sn65dsi83_reset_pipe(ctx);
+	if (ret) {
+		dev_err(ctx->dev, "reset pipe failed %pe\n", ERR_PTR(ret));
+		return;
+	}
+}
+
+static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
+{
+	unsigned int irq_stat;
+	int ret;
+
+	/*
+	 * Schedule a reset in case of:
+	 *  - the bridge doesn't answer
+	 *  - the bridge signals an error
+	 */
+
+	ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
+	if (ret || irq_stat)
+		schedule_work(&ctx->reset_work);
+}
+
+static void sn65dsi83_monitor_work(struct work_struct *work)
+{
+	struct sn65dsi83 *ctx = container_of(to_delayed_work(work),
+					     struct sn65dsi83, monitor_work);
+
+	sn65dsi83_handle_errors(ctx);
+
+	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
+}
+
+static void sn65dsi83_monitor_start(struct sn65dsi83 *ctx)
+{
+	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
+}
+
+static void sn65dsi83_monitor_stop(struct sn65dsi83 *ctx)
+{
+	cancel_delayed_work_sync(&ctx->monitor_work);
+}
+
 static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 					struct drm_bridge_state *old_bridge_state)
 {
@@ -516,6 +627,15 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
 	if (pval)
 		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
+
+	if (ctx->use_irq) {
+		/* Enable irq to detect errors */
+		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
+		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
+	} else {
+		/* Use the polling task */
+		sn65dsi83_monitor_start(ctx);
+	}
 }
 
 static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
@@ -524,6 +644,15 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	int ret;
 
+	if (ctx->use_irq) {
+		/* Disable irq */
+		regmap_write(ctx->regmap, REG_IRQ_EN, 0x0);
+		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, 0x0);
+	} else {
+		/* Stop the polling task */
+		sn65dsi83_monitor_stop(ctx);
+	}
+
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
 	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(10000, 11000);
@@ -681,6 +810,14 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 	return 0;
 }
 
+static irqreturn_t sn65dsi83_irq(int irq, void *data)
+{
+	struct sn65dsi83 *ctx = data;
+
+	sn65dsi83_handle_errors(ctx);
+	return IRQ_HANDLED;
+}
+
 static int sn65dsi83_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -698,6 +835,8 @@ static int sn65dsi83_probe(struct i2c_client *client)
 		return ret;
 
 	ctx->dev = dev;
+	INIT_WORK(&ctx->reset_work, sn65dsi83_reset_work);
+	INIT_DELAYED_WORK(&ctx->monitor_work, sn65dsi83_monitor_work);
 
 	if (dev->of_node) {
 		model = (enum sn65dsi83_model)(uintptr_t)
@@ -722,6 +861,14 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	if (IS_ERR(ctx->regmap))
 		return dev_err_probe(dev, PTR_ERR(ctx->regmap), "failed to get regmap\n");
 
+	if (client->irq) {
+		ret = devm_request_threaded_irq(ctx->dev, client->irq, NULL, sn65dsi83_irq,
+						IRQF_ONESHOT, dev_name(ctx->dev), ctx);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request irq\n");
+		ctx->use_irq = true;
+	}
+
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
 
-- 
2.47.1

