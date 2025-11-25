Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D88C84855
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 11:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5345910E3A8;
	Tue, 25 Nov 2025 10:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="HzPOTm9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9924610E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 10:39:29 +0000 (UTC)
Received: from francesco-nb.corp.toradex.com
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
 by mail11.truemail.it (Postfix) with ESMTPA id A6DFD1F952;
 Tue, 25 Nov 2025 11:39:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1764067166;
 bh=vYuwI8WDetzMM4568jAfg1o1xdUI8mBWi2pDRajww1A=; h=From:To:Subject;
 b=HzPOTm9Sem8M85fl0eKDNHSecJT7JY6o6k6N7yl3UI+ugDliQNS9KGJNActv3+lNs
 g7oYfZFOwocPxWZifrVtK3UYNC0SBnRdVQLUX1CjhHe9EKsion2ROZ/Z1x/wyspeTO
 RozDEvd28f7QCHbBO5e8ufQBRdPFE2huhkCEYkqxVgIAVKd3O9WrQM3qVjVeNiD+h5
 qYoG16YIdLP+9wtA4ryqi6hY4Jcjojimd3OAfVsgCrJqCm02CocDet9B+HbIHw9CGk
 oIpPsaxKh2/qM7JUYuechrBhxJVWY9PbFk8pk9Fjh3xPyf7c5aeqE1ET0nEqZKiG8m
 V8YoOyURqaGOQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, stable@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [PATCH v1] Revert "drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism"
Date: Tue, 25 Nov 2025 11:38:58 +0100
Message-ID: <20251125103900.31750-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This reverts commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
recovery mechanism").

The reverted commit introduces a regression on Verdin AM62, and
potentially on more devices, not being able to generate a clock
that the TI SN65DSI83 PLL can lock to, with the display periodically
blinking.

Verdin AM62 SoM has a Toshiba TC358778 DPI to DSI bridge, that can be
connected to an LVDS display over a TI SN65DSI83 bridge. Before this
change despite the TI SN65DSI83 reporting with a debug print a PLL
locking error the display was working fine with no visible glitches.

The reasons for this issue was investigated without getting to a final
conclusion:

 - the DPI clock was measure and it is stable/accurate
 - the DSI clock was not possible to measure, but this setup is used
   with other display/bridges with no known issues
 - the DSI clock is configured in continuous mode
 - the actual DSI clock generated from the TC358778 is generate with a
   PLL from a 25MHz reference clock
 - it's not clear why some frequencies are working and some are not, for
   example 50000000, 68750000, 72750000, 75000000 frequencies are fine,
   while 69750000, 71100000, 72500000 are not

Given that the safest approach is to just revert the commit, till a
proper solution for error recovery that is not introducing regression
is figured out.

Reported-by: João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com>
Closes: https://lore.kernel.org/all/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42/
Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery mechanism")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 136 --------------------------
 1 file changed, 136 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552..cf627aff569b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -35,12 +35,9 @@
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/timer.h>
-#include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_bridge_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
@@ -161,9 +158,6 @@ struct sn65dsi83 {
 	bool				lvds_dual_link_even_odd_swap;
 	int				lvds_vod_swing_conf[2];
 	int				lvds_term_conf[2];
-	int				irq;
-	struct delayed_work		monitor_work;
-	struct work_struct		reset_work;
 };
 
 static const struct regmap_range sn65dsi83_readable_ranges[] = {
@@ -369,100 +363,6 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
 	return dsi_div - 1;
 }
 
-static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
-{
-	struct drm_modeset_acquire_ctx ctx;
-	int err;
-
-	/*
-	 * Reset active outputs of the related CRTC.
-	 *
-	 * This way, drm core will reconfigure each components in the CRTC
-	 * outputs path. In our case, this will force the previous component to
-	 * go back in LP11 mode and so allow the reconfiguration of SN65DSI83
-	 * bridge.
-	 *
-	 * Keep the lock during the whole operation to be atomic.
-	 */
-
-	drm_modeset_acquire_init(&ctx, 0);
-
-	dev_warn(sn65dsi83->dev, "reset the pipe\n");
-
-retry:
-	err = drm_bridge_helper_reset_crtc(&sn65dsi83->bridge, &ctx);
-	if (err == -EDEADLK) {
-		drm_modeset_backoff(&ctx);
-		goto retry;
-	}
-
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
-
-	return 0;
-}
-
-static void sn65dsi83_reset_work(struct work_struct *ws)
-{
-	struct sn65dsi83 *ctx = container_of(ws, struct sn65dsi83, reset_work);
-	int ret;
-
-	/* Reset the pipe */
-	ret = sn65dsi83_reset_pipe(ctx);
-	if (ret) {
-		dev_err(ctx->dev, "reset pipe failed %pe\n", ERR_PTR(ret));
-		return;
-	}
-	if (ctx->irq)
-		enable_irq(ctx->irq);
-}
-
-static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
-{
-	unsigned int irq_stat;
-	int ret;
-
-	/*
-	 * Schedule a reset in case of:
-	 *  - the bridge doesn't answer
-	 *  - the bridge signals an error
-	 */
-
-	ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
-	if (ret || irq_stat) {
-		/*
-		 * IRQ acknowledged is not always possible (the bridge can be in
-		 * a state where it doesn't answer anymore). To prevent an
-		 * interrupt storm, disable interrupt. The interrupt will be
-		 * after the reset.
-		 */
-		if (ctx->irq)
-			disable_irq_nosync(ctx->irq);
-
-		schedule_work(&ctx->reset_work);
-	}
-}
-
-static void sn65dsi83_monitor_work(struct work_struct *work)
-{
-	struct sn65dsi83 *ctx = container_of(to_delayed_work(work),
-					     struct sn65dsi83, monitor_work);
-
-	sn65dsi83_handle_errors(ctx);
-
-	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
-}
-
-static void sn65dsi83_monitor_start(struct sn65dsi83 *ctx)
-{
-	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
-}
-
-static void sn65dsi83_monitor_stop(struct sn65dsi83 *ctx)
-{
-	cancel_delayed_work_sync(&ctx->monitor_work);
-}
-
 static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *state)
 {
@@ -650,15 +550,6 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
 	if (pval)
 		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
-
-	if (ctx->irq) {
-		/* Enable irq to detect errors */
-		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
-		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
-	} else {
-		/* Use the polling task */
-		sn65dsi83_monitor_start(ctx);
-	}
 }
 
 static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
@@ -667,15 +558,6 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	int ret;
 
-	if (ctx->irq) {
-		/* Disable irq */
-		regmap_write(ctx->regmap, REG_IRQ_EN, 0x0);
-		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, 0x0);
-	} else {
-		/* Stop the polling task */
-		sn65dsi83_monitor_stop(ctx);
-	}
-
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
 	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(10000, 11000);
@@ -925,14 +807,6 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 	return 0;
 }
 
-static irqreturn_t sn65dsi83_irq(int irq, void *data)
-{
-	struct sn65dsi83 *ctx = data;
-
-	sn65dsi83_handle_errors(ctx);
-	return IRQ_HANDLED;
-}
-
 static int sn65dsi83_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -946,8 +820,6 @@ static int sn65dsi83_probe(struct i2c_client *client)
 		return PTR_ERR(ctx);
 
 	ctx->dev = dev;
-	INIT_WORK(&ctx->reset_work, sn65dsi83_reset_work);
-	INIT_DELAYED_WORK(&ctx->monitor_work, sn65dsi83_monitor_work);
 
 	if (dev->of_node) {
 		model = (enum sn65dsi83_model)(uintptr_t)
@@ -972,14 +844,6 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	if (IS_ERR(ctx->regmap))
 		return dev_err_probe(dev, PTR_ERR(ctx->regmap), "failed to get regmap\n");
 
-	if (client->irq) {
-		ctx->irq = client->irq;
-		ret = devm_request_threaded_irq(ctx->dev, ctx->irq, NULL, sn65dsi83_irq,
-						IRQF_ONESHOT, dev_name(ctx->dev), ctx);
-		if (ret)
-			return dev_err_probe(dev, ret, "failed to request irq\n");
-	}
-
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
 
-- 
2.47.3

