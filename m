Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F37171256E2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610846EA93;
	Wed, 18 Dec 2019 22:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF6D6EA91
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:36:04 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id w23so1540107pjd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWLrCBmbQYNUzFqSBsWhDuxG2CTjfW4UctSr9zQlrcM=;
 b=FkUP63X0pjdoYGeSCmX+sTsW3UjT9Iz4YMXkcnYAADSytPIkCdf3qU+AXOzHvbSTIT
 4YHXU58YEBKhpv87PiKXMPiSl3b5z9J71lpbY4YRBDpBtgH+BoYKzHUa6v/unmJRZk3J
 zR76WEhs7n5zByU++Zj9kBjfUSflVwowSoOnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWLrCBmbQYNUzFqSBsWhDuxG2CTjfW4UctSr9zQlrcM=;
 b=IySPZLgqgVLD1APj+8kKs1wwMzisfvh/2bMpVoGCWaB03q9Kc/FX1TpdA5VGoZQjlq
 ZhQF9IxTwaq4LQ4hcGjd8ctYgpWJBCOIo/gfDxofT4qBGCQIbfz51UoNdU7QXg6vE1iP
 ggQwqTonxha1HKprECjDSjwo3ptfa9GwO0E5cjbSDXGlWVxu7yvpz0FDctR7ohQCDUeq
 /ddijsClLavbRd1pzhYs3/VjJ6AvM3KFMiPa8r868COdZBs/bQadaCXPRWodLeNTPKHu
 +d9tnG5ttNHQfXTNNSJA+8RL5t23JA4kcJB+1lQof3d7uEy1YfWsNX9AhbO2FQpRAwTL
 Nl1A==
X-Gm-Message-State: APjAAAXwP9LUTo0/DTuUskDcw30DgyiF1GXYv5w0HrxyPI/pm4wfDJzq
 wsczWelfd1rNhDLde7Uce+yUpg==
X-Google-Smtp-Source: APXvYqyqdXK6Wz2oJpw/C/l5gEu2n1oknYoDT7ccWZpYVnogGsdlgyyemkDssR3QaspTP99E71UUgw==
X-Received: by 2002:a17:90a:c24b:: with SMTP id
 d11mr5970581pjx.128.1576708564377; 
 Wed, 18 Dec 2019 14:36:04 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:36:04 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
Date: Wed, 18 Dec 2019 14:35:27 -0800
Message-Id: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
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

The current bridge driver always forced us to use 24 bits per pixel
over the DP link.  This is a waste if you are hooked up to a panel
that only supports 6 bits per color or fewer, since in that case you
ran run at 18 bits per pixel and thus end up at a lower DP clock rate.

Let's support this.

While at it, let's clean up the math in the function to avoid rounding
errors (and round in the correct direction when we have to round).
Numbers are sufficiently small (because mode->clock is in kHz) that we
don't need to worry about integer overflow.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 0fc9e97b2d98..d5990a0947b9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -51,6 +51,7 @@
 #define SN_ENH_FRAME_REG			0x5A
 #define  VSTREAM_ENABLE				BIT(3)
 #define SN_DATA_FORMAT_REG			0x5B
+#define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
 #define SN_AUX_WDATA_REG(x)			(0x64 + (x))
@@ -436,6 +437,14 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
+static unsigned int ti_sn_bridge_get_bpp(struct ti_sn_bridge *pdata)
+{
+	if (pdata->connector.display_info.bpc <= 6)
+		return 18;
+	else
+		return 24;
+}
+
 /**
  * LUT index corresponds to register value and
  * LUT values corresponds to dp data rate supported
@@ -447,21 +456,17 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 
 static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 {
-	unsigned int bit_rate_mhz, dp_rate_mhz;
+	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
 	struct drm_display_mode *mode =
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
 
-	/*
-	 * Calculate minimum bit rate based on our pixel clock.  At
-	 * the moment this driver never sets the DP_18BPP_EN bit in
-	 * register 0x5b so we hardcode 24bpp.
-	 */
-	bit_rate_mhz = (mode->clock / 1000) * 24;
+	/* Calculate minimum bit rate based on our pixel clock. */
+	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
 
 	/* Calculate minimum DP data rate, taking 80% as per DP spec */
-	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
-							DP_CLK_FUDGE_DEN;
+	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
+				   1000 * pdata->dp_lanes * DP_CLK_FUDGE_DEN);
 
 	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
@@ -550,6 +555,10 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
+	/* Set the DP output format (18 bpp or 24 bpp) */
+	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
+	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
+
 	/* DP lane config */
 	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
