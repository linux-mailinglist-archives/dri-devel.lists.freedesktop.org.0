Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A61D877D
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68336E489;
	Mon, 18 May 2020 18:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F206E489
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:47:38 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id q16so4602514plr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fI9/Coy2jHU24hv3APejJ/BFCoipYPisETaqwXZO4ww=;
 b=Wx0bS0ptDbThH06HCY0b1DBY2CcuHMoNlOElrVm8xW7XiC+ldEXxJH8tuZKYr9nHut
 XrzWPXrLPMmTRrsYhiO6C97bnWtz5QJubocZPZmSynQkozHiwSQJ9u8CcWZcho2f8V2M
 NncIB27kIHIR7LNvbIuihEXs2fQgdx8pnEYlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fI9/Coy2jHU24hv3APejJ/BFCoipYPisETaqwXZO4ww=;
 b=HPFvcy2K7kMBfpHZa8RMKrrPjkfbw7+U1soC9RWmYY9kj6L3M4JFL+pg7p1i7JOHAy
 udFFhkljMPIDuJUnSbossdErOlmEBDX7RqBNcHbO3eU/A5CSxOIKkQB13Uq7HJCgHLzC
 KYiURQtmR9w2FSvKGnMQs5U5WeCX9mwxxd9FHvnxLlogJM/FUtPkjk/Kbo/m6a7X7qsW
 8/9X2MUoXhZZFSPTkHBroDhICSM4ccZqOTZuctgztvR3bh170kRFp//1sGZxDm4C9ooe
 7FVXvUb6EqpMpLlTkfWddLhSpL6yFq2/ZQJqmPhXTrcgxFQVynFc3zlb2CjUJydsZ4yC
 2EzA==
X-Gm-Message-State: AOAM531Kq7tCddxDzqBFw5Z7XRiZlPFBC3V9oyd7qXCVnbkGAidtHKGM
 7lXiR38iF4MjGLGxm6kJaKmkLw==
X-Google-Smtp-Source: ABdhPJzq4lauJpJkoub5/jaKiCGMylfupnMDHNkDWGZnlKDqbU8PYXnVGgLx0sxltYZyEvgnmNutQQ==
X-Received: by 2002:a17:90a:ee85:: with SMTP id
 i5mr767777pjz.165.1589827658054; 
 Mon, 18 May 2020 11:47:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id s136sm9302719pfc.29.2020.05.18.11.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 11:47:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [REPOST PATCH v2] drm/bridge: ti-sn65dsi86: Implement lane reordering
 + polarity
Date: Mon, 18 May 2020 11:47:17 -0700
Message-Id: <20200518114656.REPOST.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
remapping of eDP lanes and also polarity inversion.  Both of these
features have been described in the device tree bindings for the
device since the beginning but were never implemented in the driver.
Implement both of them.

Part of this change also allows you to (via the same device tree
bindings) specify to use fewer than the max number of DP lanes that
the panel reports.  This could be useful if your display supports more
lanes but only a few are hooked up on your board.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
Re-posting patch v2, patch #1.  I added tags and put Sam in the "To"
list.  Patch #2 was dropped since it was squashed elsewhere.  This now
applies to the top of drm-misc-next.

Changes in v2:
- Use SN_MAX_DP_LANES instead of 4 in one place.
- Comment that we aren't doing full validation of dts params.
- Check dp_lanes <= SN_MAX_DP_LANES to avoid buffer overrun.
- Add missing of_node_put()

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 82 ++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1855fb9f09f2..2240e9973178 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -50,8 +50,12 @@
 #define SN_CHA_VERTICAL_BACK_PORCH_REG		0x36
 #define SN_CHA_HORIZONTAL_FRONT_PORCH_REG	0x38
 #define SN_CHA_VERTICAL_FRONT_PORCH_REG		0x3A
+#define SN_LN_ASSIGN_REG			0x59
+#define  LN_ASSIGN_WIDTH			2
 #define SN_ENH_FRAME_REG			0x5A
 #define  VSTREAM_ENABLE				BIT(3)
+#define  LN_POLRS_OFFSET			4
+#define  LN_POLRS_MASK				0xf0
 #define SN_DATA_FORMAT_REG			0x5B
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
@@ -98,6 +102,7 @@
 
 #define SN_REGULATOR_SUPPLY_NUM		4
 
+#define SN_MAX_DP_LANES			4
 #define SN_NUM_GPIOS			4
 #define SN_GPIO_PHYSICAL_OFFSET		1
 
@@ -116,6 +121,8 @@
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
  * @supplies:     Data for bulk enabling/disabling our regulators.
  * @dp_lanes:     Count of dp_lanes we're using.
+ * @ln_assign:    Value to program to the LN_ASSIGN register.
+ * @ln_polr:      Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -141,6 +148,8 @@ struct ti_sn_bridge {
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
+	u8				ln_assign;
+	u8				ln_polrs;
 
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
@@ -708,26 +717,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
+	int max_dp_lanes;
 
-	/*
-	 * Run with the maximum number of lanes that the DP sink supports.
-	 *
-	 * Depending use cases, we might want to revisit this later because:
-	 * - It's plausible that someone may have run fewer lines to the
-	 *   sink than the sink actually supports, assuming that the lines
-	 *   will just be driven at a higher rate.
-	 * - The DP spec seems to indicate that it's more important to minimize
-	 *   the number of lanes than the link rate.
-	 *
-	 * If we do revisit, it would be important to measure the power impact.
-	 */
-	pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
+	max_dp_lanes = ti_sn_get_max_lanes(pdata);
+	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
 
 	/* DSI_A lane config */
-	val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
+	val = CHA_DSI_LANES(SN_MAX_DP_LANES - pdata->dsi->lanes);
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
+	regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
+	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
+			   pdata->ln_polrs << LN_POLRS_OFFSET);
+
 	/* set dsi clk frequency value */
 	ti_sn_bridge_set_dsi_rate(pdata);
 
@@ -1089,6 +1092,55 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
 	return ret;
 }
 
+static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
+				     struct device_node *np)
+{
+	u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
+	u32 lane_polarities[SN_MAX_DP_LANES] = { };
+	struct device_node *endpoint;
+	u8 ln_assign = 0;
+	u8 ln_polrs = 0;
+	int dp_lanes;
+	int i;
+
+	/*
+	 * Read config from the device tree about lane remapping and lane
+	 * polarities.  These are optional and we assume identity map and
+	 * normal polarity if nothing is specified.  It's OK to specify just
+	 * data-lanes but not lane-polarities but not vice versa.
+	 *
+	 * Error checking is light (we just make sure we don't crash or
+	 * buffer overrun) and we assume dts is well formed and specifying
+	 * mappings that the hardware supports.
+	 */
+	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
+	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (dp_lanes > 0 && dp_lanes <= SN_MAX_DP_LANES) {
+		of_property_read_u32_array(endpoint, "data-lanes",
+					   lane_assignments, dp_lanes);
+		of_property_read_u32_array(endpoint, "lane-polarities",
+					   lane_polarities, dp_lanes);
+	} else {
+		dp_lanes = SN_MAX_DP_LANES;
+	}
+	of_node_put(endpoint);
+
+	/*
+	 * Convert into register format.  Loop over all lanes even if
+	 * data-lanes had fewer elements so that we nicely initialize
+	 * the LN_ASSIGN register.
+	 */
+	for (i = SN_MAX_DP_LANES - 1; i >= 0; i--) {
+		ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
+		ln_polrs = ln_polrs << 1 | lane_polarities[i];
+	}
+
+	/* Stash in our struct for when we power on */
+	pdata->dp_lanes = dp_lanes;
+	pdata->ln_assign = ln_assign;
+	pdata->ln_polrs = ln_polrs;
+}
+
 static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1131,6 +1183,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
+
 	ret = ti_sn_bridge_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
-- 
2.26.2.761.g0e0b3e54be-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
