Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E603856D0D5
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 20:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6518A8E1;
	Sun, 10 Jul 2022 18:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FC318A8D7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 18:45:41 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id n18so3778498lfq.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnp1mrs/Of0t/9cEF28am0OHlHeknBHuzCICWh/E4/A=;
 b=JuVQrtOCfc62LJj9U6JMkApfcd0dUCLZTiMpMluGxMmSdhb8rgv7G7vTkdtBrkhoDF
 rYy0oAt7LwjaCj0Aisp5GwwzLh71f1HQWMhtnilZoVcqSIicy/SJuvX2i5Riw4I5C0+R
 ntmUN2nixGdz93LwCAS90HMS+GxvkqX51oCiPh9sgCmJWKhLLBtGgE7mYADfFneOL8SD
 O4I9YtRhDkoJOK6nUSloyXWhCqwW6rcRuUFBI+f/g2PBrpHzjPB+tTpGDdAVFYxj0tSl
 wBH5qIa4mqCc3/sXRjKcY3jAqXdo6lpw8UZaJ+IxuG/1b/D2xOVSiJ8SiA5uZyYUyqmC
 eIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnp1mrs/Of0t/9cEF28am0OHlHeknBHuzCICWh/E4/A=;
 b=IXC2X3ijqSLmxYC9w7d47odhkELslyGQLnkr287wuHwkVUOtmkqJtvBqu3P6tOVFEw
 JvoxhY1UxkCqnsTmG7reppwjh7zQOrftnst4HEirh72iG1ZMKecmxVcikvzFDvvr6Fa/
 IVyCtUxp4t0Ltf8hu6pnEYRXKpJOl03eiRr8jrGD/L/7oNqFMu2OIjrcvyCXt/6xy3Fp
 qDbsIZQR7lpPnWN+ZJgmxkVBVYD+OsyjkBlw/r2KiC89wQ7drv2gz99sU0zmPbBQuejU
 owsKeqCV1avR+A/bdAh6E4poIrcyqsw6dk+NRFfj4iZAU8V1ph0M2kGsZUcvpIlDYbqz
 /0NA==
X-Gm-Message-State: AJIora9Jch4O3BHjao2Gw5S/ZbDs6fmOcUAMAboHiIPCBBIFUJKO8G0z
 qUFStF0Ky5dZoebEpYUKDEXU5Q==
X-Google-Smtp-Source: AGRyM1vUwAt+NGr3Nq0llhahT8pCS5vuJoyhMe3KCbS8MWMSHCV/JlLzwTBY4EoDay0SZrJc10gLhQ==
X-Received: by 2002:a05:6512:ac3:b0:487:f32:90ca with SMTP id
 n3-20020a0565120ac300b004870f3290camr8952037lfu.360.1657478741523; 
 Sun, 10 Jul 2022 11:45:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 2/3] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
Date: Sun, 10 Jul 2022 21:45:35 +0300
Message-Id: <20220710184536.172705-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than reading the pdata->connector directly, fetch the connector
using drm_atomic_state. This allows us to make pdata->connector optional
(and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 01171547f638..df08207d6223 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
-static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
+static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
 {
-	if (pdata->connector->display_info.bpc <= 6)
+	if (connector->display_info.bpc <= 6)
 		return 18;
 	else
 		return 24;
@@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
+static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
@@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
 
 	/* Calculate minimum bit rate based on our pixel clock. */
-	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
+	bit_rate_khz = mode->clock * bpp;
 
 	/* Calculate minimum DP data rate, taking 80% as per DP spec */
 	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
@@ -1016,12 +1016,19 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	struct drm_connector *connector;
 	const char *last_err_str = "No supported DP rate";
 	unsigned int valid_rates;
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
 	int max_dp_lanes;
+	unsigned int bpp;
+
+	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
+							     bridge->encoder);
+	if (!connector)
+		return;
 
 	max_dp_lanes = ti_sn_get_max_lanes(pdata);
 	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
@@ -1047,8 +1054,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
 			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
 
+	bpp = ti_sn_bridge_get_bpp(connector);
 	/* Set the DP output format (18 bpp or 24 bpp) */
-	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
+	val = (bpp == 18) ? BPP_18_RGB : 0;
 	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
 
 	/* DP lane config */
@@ -1059,7 +1067,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
-	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
 		if (!(valid_rates & BIT(dp_rate_idx)))
-- 
2.35.1

