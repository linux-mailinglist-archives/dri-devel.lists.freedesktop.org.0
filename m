Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE01C4D53
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 06:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B592089DB5;
	Tue,  5 May 2020 04:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F25989DB5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 04:36:50 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id mq3so480184pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 21:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5SV7znDZj2vF4BeN0SiN5TJYiEnDS4XivioQXZuhPh4=;
 b=ZEc0NLi+aIin3AkXRZkeRQiRk+TDNUOj+x0/5O8flev1STCDQPJJkGggnbnTCqvmzS
 JlVjr/g8Fqe4TQk4cKCwLIYXy9a+52E1PDvnarr4WIv3og9DnjkNJF2UIRJolwh8LdMV
 6mwlQLx9M9+pGlIvYSi8HhGifl9O7pNlhtzus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5SV7znDZj2vF4BeN0SiN5TJYiEnDS4XivioQXZuhPh4=;
 b=aGP0FCQIbW6PBRbMjWXVFvTUUsZzLq9cR8kqNolxSHoNf2bSBGyti9Phoe5YyRdi3V
 Ab/dQ9tZPqkvHaK8thR6Jrk3LILUv7AWmCdn73cszLpw30R5LeHz6N3dXihxRs3agABv
 L+3iqMYeONG54LWcMJCVzAvRLv+qAKxcg96xFEtkeWmdOwg0Rbcd74qloW19rnzl/aar
 0aN3yUscwR2vHnhzpf1fQ/MMZTZ7q0+qlGwSCIXL1OBPsvC/2/bvQzMO9hCBZWoaC3wQ
 TP4OUW8n1Cp2iffBkKKqZ9sCCTmq+HJm1Rqx44X/uziAj/iV9TDainRCmdIlVuJeXF3R
 0Ccg==
X-Gm-Message-State: AGi0Pub9Lr8a10JvEJC71n0PqonQpAt7rFBeKa4QCs07NnjRlNqpC1SM
 W3aNo6Msa+8WdL/uhvQhVSY+aA==
X-Google-Smtp-Source: APiQypK7/7dCJWi/+VDQPv2P2H8cAIhUXPt/t/i3OjRNUYr04IY9RxCToT3JAyvI4LekDwb/sBvkCQ==
X-Received: by 2002:a17:90a:d0c3:: with SMTP id
 y3mr593880pjw.133.1588653409714; 
 Mon, 04 May 2020 21:36:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p189sm658871pfp.135.2020.05.04.21.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 21:36:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity
Date: Mon,  4 May 2020 21:36:31 -0700
Message-Id: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org
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
---
This patch is based upon my my outstanding series[1] not because there
is any real requirement but simply to avoid merge conflicts.  I
believe that my previous series is ready to land.  If, however, you'd
prefer that I rebase this patch somewhere atop something else then
please shout.

[1] https://lore.kernel.org/r/20200430194617.197510-1-dianders@chromium.org

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 75 ++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1a125423eb07..52cca54b525f 100644
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
 	val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
+	regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
+	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
+			   pdata->ln_polrs << LN_POLRS_OFFSET);
+
 	/* set dsi clk frequency value */
 	ti_sn_bridge_set_dsi_rate(pdata);
 
@@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
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
+	 */
+	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
+	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (dp_lanes > 0) {
+		of_property_read_u32_array(endpoint, "data-lanes",
+					   lane_assignments, dp_lanes);
+		of_property_read_u32_array(endpoint, "lane-polarities",
+					   lane_polarities, dp_lanes);
+	} else {
+		dp_lanes = SN_MAX_DP_LANES;
+	}
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
@@ -1105,6 +1152,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
+
 	ret = ti_sn_bridge_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
-- 
2.26.2.526.g744177e7f7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
