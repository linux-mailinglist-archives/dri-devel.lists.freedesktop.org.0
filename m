Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBA123BCB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59B56E1EC;
	Wed, 18 Dec 2019 00:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F391F6E0FB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:48:26 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x185so206748pfc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1QlmZsfy8tqgL3gLX6tEaIAY+HsFf3RdF701Sx/e0GM=;
 b=B5sjQP9CBzakB62HGCYDqYu6RrxnliiRXarpV3eTmTdhdpigPEIQKOR2bACIkJjNDk
 kgf6F7F/cQY67q/39zRIzQkdGiEIzE0hppXZiX8Caj7HyeydfVdln0j3dsvo75UjhpZq
 JP+qTYgmDz0qt/J0AWGlHOaOFiHt9NgbeEyus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1QlmZsfy8tqgL3gLX6tEaIAY+HsFf3RdF701Sx/e0GM=;
 b=lqek42woNstn+TdnYnNQIJ3nPzE5xsdW/wmalshM0lvjCzKgJrdEwIZxjR9x8cond1
 DDvmz4x0Tb9BG0YiLQXpgQhHvIv+U1MJ/zDfEGFSJxOyIxhM9QfGNd1obJaGQLawcq3j
 5eayll1KZMiPT507R4fSHgOg8yYl6mYBSWVckSenVR32D8a72vwESBgrKP9BLLZIbbcn
 8lznr8+PxsPjWywKdGYFDTAzGLoICqRNJ15NLfrkERqs6UYbHB9z39VTw5VhEZaaFDiG
 6Va2Vqz+OGDLfpF/3JC8ArsCYdSrB3wG8hf8MZfltDN7vS3g+2yhob2mpi3/jUyFAEND
 sThw==
X-Gm-Message-State: APjAAAVVMtNPti6fBGPnenpe8xT+fTgPwgx4wQQU0eKRlm8dwQfuE4Ox
 k8BciYKs7J0aFS8VN1zSgw+C7w==
X-Google-Smtp-Source: APXvYqzZZDsVkSyVUxjzC8BdmpNoJj6ZW7IR/vkDmkybW+uMcxIuBfj7m0V2qHCVob2lfDm7PHawgA==
X-Received: by 2002:a63:a508:: with SMTP id n8mr291544pgf.278.1576630106620;
 Tue, 17 Dec 2019 16:48:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:48:26 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/9] drm/bridge: ti-sn65dsi86: Split the setting of the dp
 and dsi rates
Date: Tue, 17 Dec 2019 16:47:33 -0800
Message-Id: <20191217164702.v2.1.Icb765d5799e9651e5249c0c27627ba33a9e411cf@changeid>
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

These two things were in one function.  Split into two.  This looks
like it's duplicating some code, but don't worry.  This is is just in
preparation for future changes.

This is intended to have zero functional change and will just make
future patches easier to understand.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 33 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 43abf01ebd4c..2fb9370a76e6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -417,6 +417,24 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
 			   REFCLK_FREQ(i));
 }
 
+static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
+{
+	unsigned int bit_rate_mhz, clk_freq_mhz;
+	unsigned int val;
+	struct drm_display_mode *mode =
+		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+
+	/* set DSIA clk frequency */
+	bit_rate_mhz = (mode->clock / 1000) *
+			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
+	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
+
+	/* for each increment in val, frequency increases by 5MHz */
+	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
+		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
+	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
+}
+
 /**
  * LUT index corresponds to register value and
  * LUT values corresponds to dp data rate supported
@@ -426,22 +444,16 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
+static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 {
-	unsigned int bit_rate_mhz, clk_freq_mhz, dp_rate_mhz;
-	unsigned int val, i;
+	unsigned int bit_rate_mhz, dp_rate_mhz;
+	unsigned int i;
 	struct drm_display_mode *mode =
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
 
 	/* set DSIA clk frequency */
 	bit_rate_mhz = (mode->clock / 1000) *
 			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
-	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
-
-	/* for each increment in val, frequency increases by 5MHz */
-	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
-		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
-	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
@@ -510,7 +522,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   val);
 
 	/* set dsi/dp clk frequency value */
-	ti_sn_bridge_set_dsi_dp_rate(pdata);
+	ti_sn_bridge_set_dsi_rate(pdata);
+	ti_sn_bridge_set_dp_rate(pdata);
 
 	/* enable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
