Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC3C1256E6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E986EA95;
	Wed, 18 Dec 2019 22:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62026EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:36:07 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g6so1620404plp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zh2WONlL2QLylOiG7Lvfb6u/MwNz9xzHSH4c0Q9q478=;
 b=J6WJV0wasg+kqIVXBNMlns+IsbVKKG4AQ9LpSOrPAkgwihNdILN9tQK+U0O+k1PbA5
 gxrpCN5/+F+L12BahYXVgWPU2kvlNARg4aWNfXFBEE8fs57buniyOA7+tb9PlCnVhWlO
 oORfvcQ/MB164pAjKE7Ps0YfSw8EwFdXoDDtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zh2WONlL2QLylOiG7Lvfb6u/MwNz9xzHSH4c0Q9q478=;
 b=V3K0qlJRM1xUIGffKlDGINoupID32XW6MVkzG45s6e5wd3Cy5rP8WT+z9iiUji5rzO
 qfnvTuv4wc0+s806+/vaaxvZqdSAxr1W0x5dCC6LwDLOOv4eGR140oHa4+hCLt0fiEJx
 44PtDGWjfSXS65qqDw3Qt1kAP0hPOoyFlTvPIyBuX1YgyFfgmacwh2At74SyOJjYd7X0
 5st2ZikMvTeDFWLxP66tQOnJpGeh83yhK9wksLrm1sf9N6sVw6cyMhjJs6e8dgDmhZVp
 3bv7A8NeiEZj9ClX789ye3wG0pAN4kHYJkH+yd/FomAC648ASaKowF+9ZIb0CqXHMFxO
 DRrw==
X-Gm-Message-State: APjAAAUJgVlb3D+WyOf83mZUQw4OYl0qrrjsj26kURwRmQlxXbzhE83t
 zf+LwO2SMUCOA2GXKT4bs6jTtg==
X-Google-Smtp-Source: APXvYqyvRh+2bjRGA1ph9HJJL+8k25OE8VeJdeu2JybP6jBo2txzOTS7qsQDIK4g9KIBEugQQcE0mA==
X-Received: by 2002:a17:902:8f85:: with SMTP id
 z5mr5552213plo.43.1576708567454; 
 Wed, 18 Dec 2019 14:36:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:36:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
Date: Wed, 18 Dec 2019 14:35:30 -0800
Message-Id: <20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
References: <20191218223530.253106-1-dianders@chromium.org>
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>,
Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, and
Rob Clark <robdclark@chromium.org>.

Let's read the SUPPORTED_LINK_RATES and/or MAX_LINK_RATE (depending on
the eDP version of the sink) to figure out what eDP rates are
supported and pick the ideal one.

NOTE: I have only personally tested this code on eDP panels that are
1.3 or older.  Code reading SUPPORTED_LINK_RATES for DP 1.4+ was
tested by hacking the code to pretend that a table was there.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Init rate_valid table, don't rely on stack being 0 (oops).
- Rename rate_times_200khz to rate_per_200khz.
- Loop over the ti_sn_bridge_dp_rate_lut table, making code smaller.
- Use 'true' instead of 1 for bools.
- Added note to commit message noting DP 1.4+ isn't well tested.

Changes in v2:
- Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 100 +++++++++++++++++++-------
 1 file changed, 75 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e1b817ccd9c7..a57c6108cb1f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -475,39 +475,85 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 	return i;
 }
 
-static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
+static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
+					  bool rate_valid[])
 {
-	u8 data;
+	unsigned int rate_per_200khz;
+	unsigned int rate_mhz;
+	u8 dpcd_val;
 	int ret;
+	int i, j;
+
+	ret = drm_dp_dpcd_readb(&pdata->aux, DP_EDP_DPCD_REV, &dpcd_val);
+	if (ret != 1) {
+		DRM_DEV_ERROR(pdata->dev,
+			      "Can't read eDP rev (%d), assuming 1.1\n", ret);
+		dpcd_val = DP_EDP_11;
+	}
+
+	if (dpcd_val >= DP_EDP_14) {
+		/* eDP 1.4 devices must provide a custom table */
+		__le16 sink_rates[DP_MAX_SUPPORTED_RATES];
+
+		ret = drm_dp_dpcd_read(&pdata->aux, DP_SUPPORTED_LINK_RATES,
+				       sink_rates, sizeof(sink_rates));
+
+		if (ret != sizeof(sink_rates)) {
+			DRM_DEV_ERROR(pdata->dev,
+				"Can't read supported rate table (%d)\n", ret);
+
+			/* By zeroing we'll fall back to DP_MAX_LINK_RATE. */
+			memset(sink_rates, 0, sizeof(sink_rates));
+		}
+
+		for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
+			rate_per_200khz = le16_to_cpu(sink_rates[i]);
+
+			if (!rate_per_200khz)
+				break;
+
+			rate_mhz = rate_per_200khz * 200 / 1000;
+			for (j = 0;
+			     j < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
+			     j++) {
+				if (ti_sn_bridge_dp_rate_lut[j] == rate_mhz)
+					rate_valid[j] = true;
+			}
+		}
+
+		for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
+			if (rate_valid[i])
+				return;
+		}
+		DRM_DEV_ERROR(pdata->dev,
+			      "No matching eDP rates in table; falling back\n");
+	}
 
-	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
+	/* On older versions best we can do is use DP_MAX_LINK_RATE */
+	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &dpcd_val);
 	if (ret != 1) {
 		DRM_DEV_ERROR(pdata->dev,
 			      "Can't read max rate (%d); assuming 5.4 GHz\n",
 			      ret);
-		return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
+		dpcd_val = DP_LINK_BW_5_4;
 	}
 
-	/*
-	 * Return an index into ti_sn_bridge_dp_rate_lut.  Just hardcode
-	 * these indicies since it's not like the register spec is ever going
-	 * to change and a loop would just be more complicated.  Apparently
-	 * the DP sink can only return these few rates as supported even
-	 * though the bridge allows some rates in between.
-	 */
-	switch (data) {
-	case DP_LINK_BW_1_62:
-		return 1;
-	case DP_LINK_BW_2_7:
-		return 4;
+	switch (dpcd_val) {
+	default:
+		DRM_DEV_ERROR(pdata->dev,
+			      "Unexpected max rate (%#x); assuming 5.4 GHz\n",
+			      (int)dpcd_val);
+		/* fall through */
 	case DP_LINK_BW_5_4:
-		return 7;
+		rate_valid[7] = 1;
+		/* fall through */
+	case DP_LINK_BW_2_7:
+		rate_valid[4] = 1;
+		/* fall through */
+	case DP_LINK_BW_1_62:
+		rate_valid[1] = 1;
+		break;
 	}
-
-	DRM_DEV_ERROR(pdata->dev,
-		      "Unexpected max data rate (%#x); assuming 5.4 GHz\n",
-		      (int)data);
-	return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
 }
 
 static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
@@ -609,9 +655,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
 	const char *last_err_str = "No supported DP rate";
 	int dp_rate_idx;
-	int max_dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
 
@@ -655,11 +701,15 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
+	ti_sn_bridge_read_valid_rates(pdata, rate_valid);
+
 	/* Train until we run out of rates */
-	max_dp_rate_idx = ti_sn_bridge_get_max_dp_rate_idx(pdata);
 	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
-	     dp_rate_idx <= max_dp_rate_idx;
+	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
+		if (!rate_valid[dp_rate_idx])
+			continue;
+
 		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
 		if (!ret)
 			break;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
