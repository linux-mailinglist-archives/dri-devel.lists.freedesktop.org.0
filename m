Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB91C7BDB
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 23:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3BF6E8E3;
	Wed,  6 May 2020 21:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A296E8E3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 21:03:02 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id l25so1723649pgc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kNOjcx8gUe4LcNa0DGD/2mZyxy2UY+rOg6kDdh95q/g=;
 b=RuTQe/IkdPESXaNP0CW9o3PGMXt5OyadMALmxpnvDvBq85fe+3WJ/6n02THqluRrek
 QZRfAgYsXh3vtVrr3NCTkl7eaTPqgoiDnpn9PDY8jLk1P/fT+Vj7d//djvSQ3YuDm4fm
 ZIjPRibQH1qqD2NccofSkzzX3Ox60qrj5pAnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kNOjcx8gUe4LcNa0DGD/2mZyxy2UY+rOg6kDdh95q/g=;
 b=dOZxZqxcLD9ihJc75hIinGq0QZ2wmmLqgYQn+1SVVkUTHV83YCMKp8EAp1c0nF7KZz
 YTsE2aCatbYmZfqBBKz5PqKnflqsFY1rw6xqLD18kJUm4258RvgtiJsPo9M2/RekQh9+
 JUSb58d4zK5xOArzzcZfRema3t00wXPt6oh7Yb0CdfARMz9QaJIIkA2G4aeCBQmodfIC
 UlEvzCU6N0E2Kx4AuhFTzT/lvchXhunKhUBkgEBOyCT6qOa91fBzT26mnbsLiHGtcVDs
 cDepywNMRqvjqR1SpIT13E1BQooZB+NpantDSO1B95rtKg/b9OW2pY6hTPCpP5WBOpio
 Jdng==
X-Gm-Message-State: AGi0PuZaXxE/XyMEiW7NlW86fL9wT5xE0smSbmgpeubjnCaJ7sQAzZ4u
 jKsO1IPcnkXxstLxCqQTRXehYQ==
X-Google-Smtp-Source: APiQypLw5mWEXXaLMtP1aPqbjJPjyqUpxyfRnW5wUrhN7JEcZmZKlPMPl/8nk6HjSB0z7aCypH+3Nw==
X-Received: by 2002:a63:7ce:: with SMTP id 197mr8968956pgh.113.1588798981792; 
 Wed, 06 May 2020 14:03:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u5sm2256412pgi.70.2020.05.06.14.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 14:03:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
Date: Wed,  6 May 2020 14:02:41 -0700
Message-Id: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
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
---
This patch is based upon my my outstanding series[1] not because there
is any real requirement but simply to avoid merge conflicts.  I
believe that my previous series is ready to land.  If, however, you'd
prefer that I rebase this patch somewhere atop something else then
please shout.

[1] https://lore.kernel.org/r/20200430194617.197510-1-dianders@chromium.org

Changes in v2:
- Use SN_MAX_DP_LANES instead of 4 in one place.
- Comment that we aren't doing full validation of dts params.
- Check dp_lanes <= SN_MAX_DP_LANES to avoid buffer overrun.
- Add missing of_node_put()

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 82 ++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1a125423eb07..534b712dccf8 100644
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
 
 /**
@@ -115,6 +120,8 @@
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
  * @supplies:     Data for bulk enabling/disabling our regulators.
  * @dp_lanes:     Count of dp_lanes we're using.
+ * @ln_assign:    Value to program to the LN_ASSIGN register.
+ * @ln_polr:      Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -140,6 +147,8 @@ struct ti_sn_bridge {
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
+	u8				ln_assign;
+	u8				ln_polrs;
 
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
@@ -707,26 +716,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
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
 
@@ -1063,6 +1066,55 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
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
@@ -1105,6 +1157,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
+
 	ret = ti_sn_bridge_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
-- 
2.26.2.645.ge9eca65c58-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
