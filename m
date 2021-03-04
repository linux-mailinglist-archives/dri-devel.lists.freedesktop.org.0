Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083332DE13
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 00:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843E36EA92;
	Thu,  4 Mar 2021 23:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF9B6EA92
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 23:53:13 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id b15so615568pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 15:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+h+F3vuabis5cicHM2Qzli6F7gn5nBS1+yxpb4YXQ8=;
 b=Ce9a++P61kOyTiiBWaKGm99NyEowe5VhEDxtPTdQ8kkSpVrxR3SkLppvh1qfm3MXLR
 IconjSYLsgrIpRScBAPMHvUf0E+VGsS3GO2IaEQJdpD8qR+Lu9fZd41BU3jwdlFMwNZk
 E7BZVrwp3IMWiKEx3b4dTfaJ+sI8fZ4el1l4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+h+F3vuabis5cicHM2Qzli6F7gn5nBS1+yxpb4YXQ8=;
 b=rBrlgH/2B79Etr4w5OXhFyF9S+ymOwJqMInCW+vtAyxmc0Hffh+GCKQAst/lC1rrg6
 cpJF3O8CJP7RBCwPiLltib61JDHCyUJ2afb8EHwzArXEIeiwghKp5CTrcuxmGwASQm0i
 tszE8w8ab/kf8iGsLydWrKbPg/uiBhv2Qu+DqylXQHA0KFYEP17ok0HKZW2WpIuR3Xf5
 bCmby6IcvRTgvvpIpllFWZvGmnzGfvzp6jBsutfqFIO1mcngC+28S0Fuc1jTFn/fqAXN
 /yJbOy51ALxl3h93EFOQYnx48jVDGdWF2m+IzwwjEEiHnzr56EDf9JAD5T64Bvsd3hSk
 QsnQ==
X-Gm-Message-State: AOAM531hCbB+qr7GqhtTwD/biXq1p2CY+uG+JSmgWSm8TxVR9WZxT4Nl
 P8C5O0vyF0w18sAVidyVhrHOAQ==
X-Google-Smtp-Source: ABdhPJyMxk81tqITl4qzr90NzLrGeAPlqNXj46hbZvLSLRJWpwiUGKIi2jxnzDUjOGwBKAZQGzsQJw==
X-Received: by 2002:a17:90a:7104:: with SMTP id
 h4mr6849219pjk.189.1614901993499; 
 Thu, 04 Mar 2021 15:53:13 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:c4da:3a70:94aa:f337])
 by smtp.gmail.com with ESMTPSA id r4sm319449pjl.15.2021.03.04.15.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 15:53:13 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Move code in prep for EDID read
 fix
Date: Thu,  4 Mar 2021 15:52:00 -0800
Message-Id: <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is _only_ code motion to prepare for the patch
("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only if
refclk") and make it easier to understand.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 196 +++++++++++++-------------
 1 file changed, 98 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 942019842ff4..491c9c4f32d1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -345,6 +345,104 @@ static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
 				       pdata->supplies);
 }
 
+static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
+{
+	u32 bit_rate_khz, clk_freq_khz;
+	struct drm_display_mode *mode =
+		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+
+	bit_rate_khz = mode->clock *
+			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
+	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
+
+	return clk_freq_khz;
+}
+
+/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
+static const u32 ti_sn_bridge_refclk_lut[] = {
+	12000000,
+	19200000,
+	26000000,
+	27000000,
+	38400000,
+};
+
+/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
+static const u32 ti_sn_bridge_dsiclk_lut[] = {
+	468000000,
+	384000000,
+	416000000,
+	486000000,
+	460800000,
+};
+
+static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
+{
+	int i;
+	u32 refclk_rate;
+	const u32 *refclk_lut;
+	size_t refclk_lut_size;
+
+	if (pdata->refclk) {
+		refclk_rate = clk_get_rate(pdata->refclk);
+		refclk_lut = ti_sn_bridge_refclk_lut;
+		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
+		clk_prepare_enable(pdata->refclk);
+	} else {
+		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
+		refclk_lut = ti_sn_bridge_dsiclk_lut;
+		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
+	}
+
+	/* for i equals to refclk_lut_size means default frequency */
+	for (i = 0; i < refclk_lut_size; i++)
+		if (refclk_lut[i] == refclk_rate)
+			break;
+
+	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
+			   REFCLK_FREQ(i));
+}
+
+static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+
+	clk_disable_unprepare(pdata->refclk);
+
+	pm_runtime_put_sync(pdata->dev);
+}
+
+static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+
+	pm_runtime_get_sync(pdata->dev);
+
+	/* configure bridge ref_clk */
+	ti_sn_bridge_set_refclk_freq(pdata);
+
+	/*
+	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
+	 * so the HPD is an internal signal that's only there to signal that
+	 * the panel is done powering up.  ...but the bridge chip debounces
+	 * this signal by between 100 ms and 400 ms (depending on process,
+	 * voltage, and temperate--I measured it at about 200 ms).  One
+	 * particular panel asserted HPD 84 ms after it was powered on meaning
+	 * that we saw HPD 284 ms after power on.  ...but the same panel said
+	 * that instead of looking at HPD you could just hardcode a delay of
+	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
+	 * delay in its prepare and always disable HPD.
+	 *
+	 * If HPD somehow makes sense on some future panel we'll have to
+	 * change this to be conditional on someone specifying that HPD should
+	 * be used.
+	 */
+	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
+			   HPD_DISABLE);
+
+	drm_panel_prepare(pdata->panel);
+}
+
 static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 			       enum drm_bridge_attach_flags flags)
 {
@@ -443,64 +541,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 	drm_panel_unprepare(pdata->panel);
 }
 
-static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
-{
-	u32 bit_rate_khz, clk_freq_khz;
-	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
-
-	bit_rate_khz = mode->clock *
-			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
-	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
-
-	return clk_freq_khz;
-}
-
-/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
-static const u32 ti_sn_bridge_refclk_lut[] = {
-	12000000,
-	19200000,
-	26000000,
-	27000000,
-	38400000,
-};
-
-/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
-static const u32 ti_sn_bridge_dsiclk_lut[] = {
-	468000000,
-	384000000,
-	416000000,
-	486000000,
-	460800000,
-};
-
-static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
-{
-	int i;
-	u32 refclk_rate;
-	const u32 *refclk_lut;
-	size_t refclk_lut_size;
-
-	if (pdata->refclk) {
-		refclk_rate = clk_get_rate(pdata->refclk);
-		refclk_lut = ti_sn_bridge_refclk_lut;
-		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
-		clk_prepare_enable(pdata->refclk);
-	} else {
-		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
-		refclk_lut = ti_sn_bridge_dsiclk_lut;
-		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
-	}
-
-	/* for i equals to refclk_lut_size means default frequency */
-	for (i = 0; i < refclk_lut_size; i++)
-		if (refclk_lut[i] == refclk_rate)
-			break;
-
-	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
-			   REFCLK_FREQ(i));
-}
-
 static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
 {
 	unsigned int bit_rate_mhz, clk_freq_mhz;
@@ -821,46 +861,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	drm_panel_enable(pdata->panel);
 }
 
-static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
-{
-	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
-
-	pm_runtime_get_sync(pdata->dev);
-
-	/* configure bridge ref_clk */
-	ti_sn_bridge_set_refclk_freq(pdata);
-
-	/*
-	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
-	 * so the HPD is an internal signal that's only there to signal that
-	 * the panel is done powering up.  ...but the bridge chip debounces
-	 * this signal by between 100 ms and 400 ms (depending on process,
-	 * voltage, and temperate--I measured it at about 200 ms).  One
-	 * particular panel asserted HPD 84 ms after it was powered on meaning
-	 * that we saw HPD 284 ms after power on.  ...but the same panel said
-	 * that instead of looking at HPD you could just hardcode a delay of
-	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
-	 * delay in its prepare and always disable HPD.
-	 *
-	 * If HPD somehow makes sense on some future panel we'll have to
-	 * change this to be conditional on someone specifying that HPD should
-	 * be used.
-	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
-
-	drm_panel_prepare(pdata->panel);
-}
-
-static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
-{
-	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
-
-	clk_disable_unprepare(pdata->refclk);
-
-	pm_runtime_put_sync(pdata->dev);
-}
-
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.pre_enable = ti_sn_bridge_pre_enable,
-- 
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
