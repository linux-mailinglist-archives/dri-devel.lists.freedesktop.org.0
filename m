Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C17123BCC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709FA6E1ED;
	Wed, 18 Dec 2019 00:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214266E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:48:36 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id h14so193238pfe.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9IC4tuu93sxhS5/hkcuM77NLng78YMcsjStdyaY+2qo=;
 b=LWhkZm4IPl4QlGNHa7ZJ/TwRe3JeWi2FbxfxTmcOP2UqnThsELw9YKLxTFnYL7+s2a
 xnoYV7iu/oCVMj3m0HoFsBUvigV2rV2F7XO7TJ95Cm+uQiVM1Vpvc0iWdB6E7zowpqvH
 MNgvQnMmMnDNt1kci61p0pgQBwehKL7d4XOxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9IC4tuu93sxhS5/hkcuM77NLng78YMcsjStdyaY+2qo=;
 b=HEVRyol08V7zAp8RBgIqAEdbg+c9wrnaFamP+F/yjLDKQz/luxxW8s2RXg0VRecwAG
 C8uFYbDteAEv0/nb7LF+AxdeY8mND8TLKWuEktuV+guIXltEL5zf7jEMtFgwWcUpEmhu
 B5m5fZ7vHnzwPya/3ls1xODyCAdfd1h92nF4coy92T6M+iMi9suvsLp3miXmZCPhN0oM
 y74nDl3ORpkbLmxmrbPMQ7vwdy8j8q1z9tyrEqBfhQuWOWv9sEN0lFk+qdRbdnd6vjP6
 14lHC8gIYtADle5dUsJl9idYRR/gVhQtzPi9hP1JnAniTrBiCXGTQhzCHZVlbXA4BU8U
 /XOA==
X-Gm-Message-State: APjAAAUQ84IKEmSslgtI05+GgFUpOMQXZchfUiT7L5cOCMNyuzTovS2Z
 d1qILxs+d3TPOg7i+O3qq1UMxA==
X-Google-Smtp-Source: APXvYqyAO+e95wJC/0qM/pXGxI/bmqTiA42Pe2SQ9FvItS4GZpJZwQp27IOgoOSCrXAbRRqHd4BaCA==
X-Received: by 2002:a63:646:: with SMTP id 67mr876568pgg.150.1576630115721;
 Tue, 17 Dec 2019 16:48:35 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:48:35 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 8/9] drm/bridge: ti-sn65dsi86: Train at faster rates if
 slower ones fail
Date: Tue, 17 Dec 2019 16:47:40 -0800
Message-Id: <20191217164702.v2.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
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
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v2:
- Squash in maybe-uninitialized fix from Rob Clark.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 71 ++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 48fb4dc72e1c..e1b817ccd9c7 100644
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
 
@@ -573,8 +609,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	const char *last_err_str = "No supported DP rate";
+	int dp_rate_idx;
+	int max_dp_rate_idx;
 	unsigned int val;
-	int ret;
+	int ret = -EINVAL;
 
 	/*
 	 * Run with the maximum number of lanes that the DP sink supports.
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
