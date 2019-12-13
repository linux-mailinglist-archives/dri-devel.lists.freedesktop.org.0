Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F05311EEB5
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB126EE20;
	Fri, 13 Dec 2019 23:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C9E6EE1B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:46:13 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id bd4so1876673plb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+EeHRETkxu0picdlIzKsYQGsspaxhuZcBp2HnJGPsVI=;
 b=dcKFlE9XwzZl4mRXm1/nubZ9pM/vI36bs0JeNK8OmJeHbYVsGHdZYepNRVJ27sqRc8
 hBJ40LIojZR/TpIta9y7LrW5GFl/dpxEH1+dISE61RwY2XZdnLh1/ZIv6XoYsVSE5+b2
 5ynaQAh0YciRpY3C3TrKMakmgW3Wn/NaJtiGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+EeHRETkxu0picdlIzKsYQGsspaxhuZcBp2HnJGPsVI=;
 b=SfBN5NVXodRJJxg0KWyd00VoE3HHvA91+Yu+sW5qELHRnYMTMl7ag2la8qmQgH2KsJ
 usH8IKK5bYXe+as+JsB0HHFVP5YojP0D1x/mNsdhM9yqATtB4ZV3dLO34PXVTKEBGvqd
 3xgoR9FOrd2E5rzktPUipDygIHWCnelb27AS0g49uddpts1H9xi5Od6bAkyXxZgLFBSH
 e/+N5PjmM6RbzkZiK4jJFhm59vAHED056Dt5ek47HE8XuLHd1Wd4Aw09yYPVAb5IyAZ+
 GdEotb9sXfFeWFpQdDWHurqHp6IqzmU0j1fapbHUS0ZNioTzINpj0ELX22/9WknVEQan
 GCdQ==
X-Gm-Message-State: APjAAAXv3HjnbAmYhFzuB8U2mpIPA8Uz1IQk0YHHCerc0GfY44qKuuS2
 myj1Wx0eAjP1UOu/CUx3JRFOTw==
X-Google-Smtp-Source: APXvYqzwmXELCKHrbQ5y46SHZ0WNh/wWcubb9wd3jDnndYX/iS4e3gFT+K2H5pXNZA1dmILWpcEWAg==
X-Received: by 2002:a17:90a:2569:: with SMTP id
 j96mr2373833pje.79.1576280773362; 
 Fri, 13 Dec 2019 15:46:13 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:46:12 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 8/9] drm/bridge: ti-sn65dsi86: Train at faster rates if slower
 ones fail
Date: Fri, 13 Dec 2019 15:45:29 -0800
Message-Id: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
References: <20191213234530.145963-1-dianders@chromium.org>
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 seanpaul@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we fail training at a lower DP link rate let's now keep trying
until we run out of rates to try.  Basically the algorithm here is to
start at the link rate that is the theoretical minimum and then slowly
bump up until we run out of rates or hit the max rate of the sink.  We
query the sink using a DPCD read.

This is, in fact, important in practice.  Specifically at least one
panel hooked up to the bridge (AUO B116XAK01) had a theoretical min
rate more than 1.62 GHz (if run at 24 bpp) and fails to train at the
next rate (2.16 GHz).  It would train at 2.7 GHz, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 69 +++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 48fb4dc72e1c..cc8bef172f69 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -454,7 +454,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
+static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
@@ -472,8 +472,42 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
-			   DP_DATARATE_MASK, DP_DATARATE(i));
+	return i;
+}
+
+static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
+{
+	u8 data;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
+	if (ret != 1) {
+		DRM_DEV_ERROR(pdata->dev,
+			      "Can't read max rate (%d); assuming 5.4 GHz\n",
+			      ret);
+		return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
+	}
+
+	/*
+	 * Return an index into ti_sn_bridge_dp_rate_lut.  Just hardcode
+	 * these indicies since it's not like the register spec is ever going
+	 * to change and a loop would just be more complicated.  Apparently
+	 * the DP sink can only return these few rates as supported even
+	 * though the bridge allows some rates in between.
+	 */
+	switch (data) {
+	case DP_LINK_BW_1_62:
+		return 1;
+	case DP_LINK_BW_2_7:
+		return 4;
+	case DP_LINK_BW_5_4:
+		return 7;
+	}
+
+	DRM_DEV_ERROR(pdata->dev,
+		      "Unexpected max data rate (%#x); assuming 5.4 GHz\n",
+		      (int)data);
+	return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
 }
 
 static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
@@ -530,13 +564,15 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
 	return data & DP_LANE_COUNT_MASK;
 }
 
-static int ti_sn_link_training(struct ti_sn_bridge *pdata)
+static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
+			       const char **last_err_str)
 {
 	unsigned int val;
 	int ret;
 
 	/* set dp clk frequency value */
-	ti_sn_bridge_set_dp_rate(pdata);
+	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
+			   DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
 
 	/* enable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
@@ -545,7 +581,7 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
 				       val & DPPLL_SRC_DP_PLL_LOCK, 1000,
 				       50 * 1000);
 	if (ret) {
-		DRM_ERROR("DP_PLL_LOCK polling failed (%d)\n", ret);
+		*last_err_str = "DP_PLL_LOCK polling failed";
 		goto exit;
 	}
 
@@ -556,9 +592,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
 				       val == ML_TX_NORMAL_MODE, 1000,
 				       500 * 1000);
 	if (ret) {
-		DRM_ERROR("Training complete polling failed (%d)\n", ret);
+		*last_err_str = "Training complete polling failed";
 	} else if (val == ML_TX_MAIN_LINK_OFF) {
-		DRM_ERROR("Link training failed, link is off\n");
+		*last_err_str = "Link training failed, link is off";
 		ret = -EIO;
 	}
 
@@ -573,6 +609,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	const char *last_err_str;
+	int dp_rate_idx;
+	int max_dp_rate_idx;
 	unsigned int val;
 	int ret;
 
@@ -616,9 +655,19 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
-	ret = ti_sn_link_training(pdata);
-	if (ret)
+	/* Train until we run out of rates */
+	max_dp_rate_idx = ti_sn_bridge_get_max_dp_rate_idx(pdata);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
+	     dp_rate_idx <= max_dp_rate_idx;
+	     dp_rate_idx++) {
+		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
+		if (!ret)
+			break;
+	}
+	if (ret) {
+		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
 		return;
+	}
 
 	/* config video parameters */
 	ti_sn_bridge_set_video_timings(pdata);
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
