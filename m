Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF31256E5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6D26EA94;
	Wed, 18 Dec 2019 22:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69416EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:36:05 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l35so1544167pje.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QP3hto2DkGs5zfqrn5iFzXGkO+IMFlaTb8eCMvV6iIE=;
 b=UGsME4pC8nghpPdCjLDgXini+EViM55h+lfRas8ujaAKW47+L0aKOkHmXZdM6wiju8
 29Q6jJeMwAlaql+e0xHowqkoXbQy2tP3VCQwWUCD4hT4zh+xMSO39uIHzMvrFZjPNZNx
 MddBNqOQnNE9uBj82l5d+/ewjWxJi/WYFPT5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QP3hto2DkGs5zfqrn5iFzXGkO+IMFlaTb8eCMvV6iIE=;
 b=FjZ+nSeQkb25mzAeJ35vLy0kKzPagCqSQKJv4IwtYD0m9qPpqE/0xk99KoqBTaGzU5
 dTkvrLizXS5DvGhfzN+6oKQy4K8N6CdI19QrVLAZtpWm33oyNIOl6Jj8gWOpsBtI4CCa
 GXBHQ7yQqmVYQBbafIBuKbcjud7S/oUbnUNNmbXqDv/sCPHE3enAq2SuMjZyez18yKYm
 nNF/C/8veK6iWzOLe6nWkDzZKA1hPM2yNlZrQMuBQkl+d6NIzLv6cND9qTI6uncejGt/
 4qNc5ddLGg2ABX97A877QkoybuckL+1dlX0evNChRkzVHXB24NZyCbBLXWROWtZLbSoI
 Qh3A==
X-Gm-Message-State: APjAAAWW1tFCypjX0/dQl5/rjvfVOybqGAz7mll626aW2B7GiKZQMUg3
 qs711Q9hKxrHMuETp/0auXzhWtJV0ShqOA==
X-Google-Smtp-Source: APXvYqxtP1lMnx/3xEi3oFq4iWgbZUUpxGe52GSqGOvL9qaT6rFZP39+dSxlwoU7Z23/mNzxHNXzcg==
X-Received: by 2002:a17:90a:d789:: with SMTP id z9mr5781477pju.5.1576708565325; 
 Wed, 18 Dec 2019 14:36:05 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:36:04 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 7/9] drm/bridge: ti-sn65dsi86: Group DP link training bits
 in a function
Date: Wed, 18 Dec 2019 14:35:28 -0800
Message-Id: <20191218143416.v3.7.I1fc75ad11db9048ef08cfe1ab7322753d9a219c7@changeid>
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

We'll re-organize the ti_sn_bridge_enable() function a bit to group
together all the parts relating to link training and split them into a
sub-function.  This is not intended to have any functional change and
is in preparation for trying link training several times at different
rates.  One small side effect here is that if link training fails
we'll now leave the DP PLL disabled, but that seems like a sane thing
to do.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 86 ++++++++++++++++-----------
 1 file changed, 52 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index d5990a0947b9..48fb4dc72e1c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -530,6 +530,46 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
 	return data & DP_LANE_COUNT_MASK;
 }
 
+static int ti_sn_link_training(struct ti_sn_bridge *pdata)
+{
+	unsigned int val;
+	int ret;
+
+	/* set dp clk frequency value */
+	ti_sn_bridge_set_dp_rate(pdata);
+
+	/* enable DP PLL */
+	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
+
+	ret = regmap_read_poll_timeout(pdata->regmap, SN_DPPLL_SRC_REG, val,
+				       val & DPPLL_SRC_DP_PLL_LOCK, 1000,
+				       50 * 1000);
+	if (ret) {
+		DRM_ERROR("DP_PLL_LOCK polling failed (%d)\n", ret);
+		goto exit;
+	}
+
+	/* Semi auto link training mode */
+	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0x0A);
+	ret = regmap_read_poll_timeout(pdata->regmap, SN_ML_TX_MODE_REG, val,
+				       val == ML_TX_MAIN_LINK_OFF ||
+				       val == ML_TX_NORMAL_MODE, 1000,
+				       500 * 1000);
+	if (ret) {
+		DRM_ERROR("Training complete polling failed (%d)\n", ret);
+	} else if (val == ML_TX_MAIN_LINK_OFF) {
+		DRM_ERROR("Link training failed, link is off\n");
+		ret = -EIO;
+	}
+
+exit:
+	/* Disable the PLL if we failed */
+	if (ret)
+		regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
+
+	return ret;
+}
+
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
@@ -555,29 +595,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
-	/* Set the DP output format (18 bpp or 24 bpp) */
-	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
-	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
-
-	/* DP lane config */
-	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
-	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
-			   val);
-
-	/* set dsi/dp clk frequency value */
+	/* set dsi clk frequency value */
 	ti_sn_bridge_set_dsi_rate(pdata);
-	ti_sn_bridge_set_dp_rate(pdata);
-
-	/* enable DP PLL */
-	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
-
-	ret = regmap_read_poll_timeout(pdata->regmap, SN_DPPLL_SRC_REG, val,
-				       val & DPPLL_SRC_DP_PLL_LOCK, 1000,
-				       50 * 1000);
-	if (ret) {
-		DRM_ERROR("DP_PLL_LOCK polling failed (%d)\n", ret);
-		return;
-	}
 
 	/**
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
@@ -588,19 +607,18 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
 			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
 
-	/* Semi auto link training mode */
-	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0x0A);
-	ret = regmap_read_poll_timeout(pdata->regmap, SN_ML_TX_MODE_REG, val,
-				       val == ML_TX_MAIN_LINK_OFF ||
-				       val == ML_TX_NORMAL_MODE, 1000,
-				       500 * 1000);
-	if (ret) {
-		DRM_ERROR("Training complete polling failed (%d)\n", ret);
-		return;
-	} else if (val == ML_TX_MAIN_LINK_OFF) {
-		DRM_ERROR("Link training failed, link is off\n");
+	/* Set the DP output format (18 bpp or 24 bpp) */
+	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
+	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
+
+	/* DP lane config */
+	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
+	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
+			   val);
+
+	ret = ti_sn_link_training(pdata);
+	if (ret)
 		return;
-	}
 
 	/* config video parameters */
 	ti_sn_bridge_set_video_timings(pdata);
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
