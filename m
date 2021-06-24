Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA33B242D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 02:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620776E997;
	Thu, 24 Jun 2021 00:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD926E997
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 00:03:43 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 231D31852;
 Thu, 24 Jun 2021 02:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624493021;
 bh=jWJOddzft+ARTfrgbPHZii3ZZXhAtyhRFRTVwwRsibI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jILJtBDo0esM9hC+RcC3i5hq/Z4NngVUqg1BqqFg86GmdxyMJo3t+CwFK1hYZdIzm
 7LjuncVin5BVM4mU3ohleyBSzhJZ5LSM1ZMkLIqf0A5KbPb2s294pi/iucIgkdB5P+
 11i6EJz6m8U9cPYPLwQjXKxC8t2POJvRovn/ITEQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/bridge: ti-sn65dsi86: Use bitmask to store valid
 rates
Date: Thu, 24 Jun 2021 03:03:01 +0300
Message-Id: <20210624000304.16281-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The valid rates are stored in an array of 8 booleans. Replace it with a
bitmask to save space.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f0c7c6d4b2c1..28c1ea370ae4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -616,9 +616,9 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
 	return i;
 }
 
-static void ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata,
-					  bool rate_valid[])
+static unsigned int ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata)
 {
+	unsigned int valid_rates = 0;
 	unsigned int rate_per_200khz;
 	unsigned int rate_mhz;
 	u8 dpcd_val;
@@ -658,13 +658,13 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata,
 			     j < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 			     j++) {
 				if (ti_sn_bridge_dp_rate_lut[j] == rate_mhz)
-					rate_valid[j] = true;
+					valid_rates |= BIT(j);
 			}
 		}
 
 		for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
-			if (rate_valid[i])
-				return;
+			if (valid_rates & BIT(i))
+				return valid_rates;
 		}
 		DRM_DEV_ERROR(pdata->dev,
 			      "No matching eDP rates in table; falling back\n");
@@ -686,15 +686,17 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata,
 			      (int)dpcd_val);
 		fallthrough;
 	case DP_LINK_BW_5_4:
-		rate_valid[7] = 1;
+		valid_rates |= BIT(7);
 		fallthrough;
 	case DP_LINK_BW_2_7:
-		rate_valid[4] = 1;
+		valid_rates |= BIT(4);
 		fallthrough;
 	case DP_LINK_BW_1_62:
-		rate_valid[1] = 1;
+		valid_rates |= BIT(1);
 		break;
 	}
+
+	return valid_rates;
 }
 
 static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
@@ -812,8 +814,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
-	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
 	const char *last_err_str = "No supported DP rate";
+	unsigned int valid_rates;
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
@@ -852,13 +854,13 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
-	ti_sn_bridge_read_valid_rates(pdata, rate_valid);
+	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
 	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
-		if (!rate_valid[dp_rate_idx])
+		if (!(valid_rates & BIT(dp_rate_idx)))
 			continue;
 
 		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
-- 
Regards,

Laurent Pinchart

