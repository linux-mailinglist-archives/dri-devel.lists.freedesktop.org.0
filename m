Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3757EB31B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A4610E44B;
	Tue, 14 Nov 2023 15:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [IPv6:2001:41d0:203:375::bc])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2083A10E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:09:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699974126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/AJQfUuyoCHR0j5BR2C2vklNLNE7s2XZrrtydJkf1Y=;
 b=GbeqzuX9VdvKdWkR2XqDAMvGruVGq8spw3/v9UF6jqToYc3Z6Hew/hWfItzHXN0Xzk5wJD
 Qu/o7xOs2P/VBCJ3V5OjQ6v5AwiNp8C4t5HTkeduQYOhxoN0zK0isNsmlylCZAZn6/2x9L
 UxtcHTx8KMWl+yGrNIj0PtjKPD/pOIA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/8] drm/bridge: it66121: Add bridge_to_it66121() helper and
 use it
Date: Tue, 14 Nov 2023 23:01:24 +0800
Message-Id: <20231114150130.497915-3-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-1-sui.jingfeng@linux.dev>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Instead of using the container_of() directly, which avoid the code lines
too long in horizontial. Just trivial cleanup, no functional change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 6e5c10cfa0bc..83dbdbfc9ed8 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -315,6 +315,11 @@ struct it66121_ctx {
 	const struct it66121_chip_info *info;
 };
 
+static inline struct it66121_ctx *bridge_to_it66121(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct it66121_ctx, bridge);
+}
+
 static const struct regmap_range_cfg it66121_regmap_banks[] = {
 	{
 		.name = "it66121",
@@ -588,7 +593,7 @@ static bool it66121_is_hpd_detect(struct it66121_ctx *ctx)
 static int it66121_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
@@ -699,7 +704,7 @@ static u32 *it66121_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 						     u32 output_fmt,
 						     unsigned int *num_input_fmts)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	u32 *input_fmts;
 
 	*num_input_fmts = 0;
@@ -723,7 +728,7 @@ static u32 *it66121_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 static void it66121_bridge_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	struct drm_atomic_state *state = bridge_state->base.state;
 
 	ctx->connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
@@ -734,7 +739,7 @@ static void it66121_bridge_enable(struct drm_bridge *bridge,
 static void it66121_bridge_disable(struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 
 	it66121_set_mute(ctx, true);
 
@@ -746,7 +751,7 @@ static int it66121_bridge_check(struct drm_bridge *bridge,
 				struct drm_crtc_state *crtc_state,
 				struct drm_connector_state *conn_state)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 
 	if (ctx->info->id == ID_IT6610) {
 		/* The IT6610 only supports these settings */
@@ -765,7 +770,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 			     const struct drm_display_mode *adjusted_mode)
 {
 	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	int ret;
 
 	mutex_lock(&ctx->lock);
@@ -831,7 +836,7 @@ static enum drm_mode_status it66121_bridge_mode_valid(struct drm_bridge *bridge,
 						      const struct drm_display_info *info,
 						      const struct drm_display_mode *mode)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	unsigned long max_clock;
 
 	max_clock = (ctx->bus_width == 12) ? 74250 : 148500;
@@ -847,7 +852,7 @@ static enum drm_mode_status it66121_bridge_mode_valid(struct drm_bridge *bridge,
 
 static enum drm_connector_status it66121_bridge_detect(struct drm_bridge *bridge)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 
 	return it66121_is_hpd_detect(ctx) ? connector_status_connected
 					  : connector_status_disconnected;
@@ -855,7 +860,7 @@ static enum drm_connector_status it66121_bridge_detect(struct drm_bridge *bridge
 
 static void it66121_bridge_hpd_enable(struct drm_bridge *bridge)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	int ret;
 
 	ret = regmap_write_bits(ctx->regmap, IT66121_INT_MASK1_REG, IT66121_INT_MASK1_HPD, 0);
@@ -865,7 +870,7 @@ static void it66121_bridge_hpd_enable(struct drm_bridge *bridge)
 
 static void it66121_bridge_hpd_disable(struct drm_bridge *bridge)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	int ret;
 
 	ret = regmap_write_bits(ctx->regmap, IT66121_INT_MASK1_REG,
@@ -877,7 +882,7 @@ static void it66121_bridge_hpd_disable(struct drm_bridge *bridge)
 static struct edid *it66121_bridge_get_edid(struct drm_bridge *bridge,
 					    struct drm_connector *connector)
 {
-	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	struct it66121_ctx *ctx = bridge_to_it66121(bridge);
 	struct edid *edid;
 	int ret;
 
-- 
2.34.1

