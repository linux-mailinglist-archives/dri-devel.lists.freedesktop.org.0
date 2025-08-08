Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B33B1E919
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9937910E936;
	Fri,  8 Aug 2025 13:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XejCrbEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECC810E936
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:24:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0966044325;
 Fri,  8 Aug 2025 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754659479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3dxBTvYDc023lk4xf7xQvavR9Sed93h6eShZ8+/P+k=;
 b=XejCrbEnpOHx7vxn9eWzaG/FcgZaAm6TjjQ7Iz848DW8G0DrZcwvUkf8WSXsvi/GOQIVJy
 ACvEIqtleZ/JiHgXQqM2o8yUIKHnQhK93KBdgY+Eo5yPO10M+Ubw0PSkegH7yjL7ZCueZR
 LOtUfZ9wYZ3niUGrOniRNqLs7xCaWNQ+VxWzsbuYcLu/8HO1x3ohf5o+Vj4PCbH8OQKcSX
 89u1sdIvFTDBKb5sQ4vYBMAupI8jG4yyVvKsSqmO8iQlfs9fvVGx9rf31yOXlTAbxctu0z
 UVEkbMPWR+Hpxaz0G7TNEPFC/XBlA55YU4EYoyt1oQ7pRV3BdBsyama+HCS0UQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 08 Aug 2025 15:24:29 +0200
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources on
 unplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
In-Reply-To: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepjeekrddvuddvrddvjedrudduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejkedrvdduvddrvdejrdduudehpdhhvghloheplgdujedvrdduiedrtddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehnvghilhdrrghrm
 hhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-GND-Sasl: luca.ceresoli@bootlin.com
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
sn65dsi83_atomic_disable() in unable to release some resources, thus this
needs to be done in sn65dsi83_remove() after drm_bridge_unplug().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 53 +++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552ab167d4e8d9b74957c585e4c6fb7..9e4cecf4f7cb056f0c34e87007fcebf50780e49c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -157,6 +157,7 @@ struct sn65dsi83 {
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
+	bool				disable_resources_needed;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
 	int				lvds_vod_swing_conf[2];
@@ -406,6 +407,10 @@ static void sn65dsi83_reset_work(struct work_struct *ws)
 {
 	struct sn65dsi83 *ctx = container_of(ws, struct sn65dsi83, reset_work);
 	int ret;
+	int idx;
+
+	if (!drm_bridge_enter(&ctx->bridge, &idx))
+		return;
 
 	/* Reset the pipe */
 	ret = sn65dsi83_reset_pipe(ctx);
@@ -415,12 +420,18 @@ static void sn65dsi83_reset_work(struct work_struct *ws)
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
@@ -441,6 +452,8 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
 
 		schedule_work(&ctx->reset_work);
 	}
+
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_monitor_work(struct work_struct *work)
@@ -478,10 +491,15 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
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
 
@@ -625,6 +643,8 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
 		/* On failure, disable PLL again and exit. */
 		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
+		ctx->disable_resources_needed = true;
+		drm_bridge_exit(idx);
 		return;
 	}
 
@@ -633,6 +653,9 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 
 	/* Wait for 10ms after soft reset as specified in datasheet */
 	usleep_range(10000, 12000);
+
+	ctx->disable_resources_needed = true;
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
@@ -640,6 +663,10 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	unsigned int pval;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	/* Clear all errors that got asserted during initialization. */
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
@@ -659,6 +686,8 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 		/* Use the polling task */
 		sn65dsi83_monitor_start(ctx);
 	}
+
+	drm_bridge_exit(idx);
 }
 
 static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
@@ -666,6 +695,10 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	int ret;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	if (ctx->irq) {
 		/* Disable irq */
@@ -685,6 +718,9 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 		dev_err(ctx->dev, "Failed to disable vcc: %d\n", ret);
 
 	regcache_mark_dirty(ctx->regmap);
+
+	ctx->disable_resources_needed = false;
+	drm_bridge_exit(idx);
 }
 
 static enum drm_mode_status
@@ -1005,7 +1041,24 @@ static void sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
+	drm_bridge_unplug(&ctx->bridge);
 	drm_bridge_remove(&ctx->bridge);
+
+	/*
+	 * sn65dsi83_atomic_disable() should release some resources, but it
+	 * cannot if we call drm_bridge_unplug() before it can
+	 * drm_bridge_enter(). If that happens, let's release those
+	 * resources now.
+	 */
+	if (ctx->disable_resources_needed) {
+		if (!ctx->irq)
+			sn65dsi83_monitor_stop(ctx);
+
+		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+		usleep_range(10000, 11000);
+
+		regulator_disable(ctx->vcc);
+	}
 }
 
 static const struct i2c_device_id sn65dsi83_id[] = {

-- 
2.50.1

