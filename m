Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAE9123BCE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FA66E1EE;
	Wed, 18 Dec 2019 00:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B8D6E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:48:37 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z124so237852pgb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hoP8Z5Z61mMBDF1+npZ9T/QrS/VoGR8uQg11JFsoGTc=;
 b=oeVsyAIa5iN/aA4MgG7pqbaTlz/5X6ae3HXOXG1Y9kHYJ304SGd2VQF3eaTCb+wE58
 P7H28u3OeR+18Sfwl0HQhJbCt8UOyP7dI4EybOF83A4FwPEQuLdaJ+xhlcMUZoBbdJ5G
 h63t+KVw4+PcjIyZKJ2z2Up48Ne78vfRD9QXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hoP8Z5Z61mMBDF1+npZ9T/QrS/VoGR8uQg11JFsoGTc=;
 b=TOh6dQZC/m9nx/ItLmggve7oBYGDzeHAvwW+IIoJl7faay2Knsoim2phGQQqbJCaho
 +kmpVUmZN+7CP5PvwIEEovgAml2+OZvv1XvldjH+802V8Vt2jDob4dN5LgKN0O8MGlQM
 wY91fiOFgY4LwjBYqExDc4rf/bp4x0fpzBAlo1WEs+0dEXlw9zW+xxRKY9GLzeHbrqCv
 u/RM+tQRsZ+e/sf4PpiZBVWx3wqYiu5TQb1cf5JLofyxlFIC5DSm6s5D5WG+JToK2q/1
 KNVqmKSYgtM0xij995UjUwxWfLayBFZtvGb6C9/KXskTh8R1kcHGeNlNl9KZ/914jVR8
 FTLA==
X-Gm-Message-State: APjAAAXMXMDGDISlKxOhM92URZMVv1XIrIObONjMBDkCDoRb7uPpNYT0
 I3kg4VaF01krViO/16yMIQaEtA==
X-Google-Smtp-Source: APXvYqxcMrfU/jOsIH85TVMLLbcznBUzvoNbJTuG9kOb7KLcCglRD8QUE0HxCDacH9G1I5QdnXpmFA==
X-Received: by 2002:a63:1106:: with SMTP id g6mr281740pgl.13.1576630116967;
 Tue, 17 Dec 2019 16:48:36 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:48:36 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
Date: Tue, 17 Dec 2019 16:47:41 -0800
Message-Id: <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218004741.102067-1-dianders@chromium.org>
References: <20191218004741.102067-1-dianders@chromium.org>
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 118 ++++++++++++++++++++------
 1 file changed, 93 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e1b817ccd9c7..da5ddf6be92b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -475,39 +475,103 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 	return i;
 }
 
-static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
+static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
+					  bool rate_valid[])
 {
-	u8 data;
+	u8 dpcd_val;
+	int rate_times_200khz;
 	int ret;
+	int i;
 
-	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
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
+			rate_times_200khz = le16_to_cpu(sink_rates[i]);
+
+			if (!rate_times_200khz)
+				break;
+
+			switch (rate_times_200khz) {
+			case 27000:
+				rate_valid[7] = 1;
+				break;
+			case 21600:
+				rate_valid[6] = 1;
+				break;
+			case 16200:
+				rate_valid[5] = 1;
+				break;
+			case 13500:
+				rate_valid[4] = 1;
+				break;
+			case 12150:
+				rate_valid[3] = 1;
+				break;
+			case 10800:
+				rate_valid[2] = 1;
+				break;
+			case 8100:
+				rate_valid[1] = 1;
+				break;
+			default:
+				/* unsupported */
+				break;
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
+
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
@@ -609,9 +673,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)];
 	const char *last_err_str = "No supported DP rate";
 	int dp_rate_idx;
-	int max_dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
 
@@ -655,11 +719,15 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
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
