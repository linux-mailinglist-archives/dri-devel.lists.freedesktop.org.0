Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334767160A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ACE10E055;
	Wed, 18 Jan 2023 08:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7E110E6CE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id vm8so81254750ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EPo30eXxIqiDes4Q3ryePcQbuaNGcUHr9bzE1lqhMk=;
 b=V+M888y0DsTbf8ukmahbdvJjbXld+C3mtg7f28nunecY+1HHOZUPuCcguw6Agwen/e
 zawTVdDGcU+pKKLfpMuuAF8e5dNOtWOFP70kyVbBUQtVxAs1JHDH01KorSMqPKGXMrIO
 iaa5qgvd4GVRUztRgtytC9XKntAMZ9DUi+rH1NSJfeQAO3gpdpFnVHOXAt+akz1JgByT
 2OaqCnTgA2Ut7tzhstjpi3xYGmXcNcJ+CFVSDiFp63YL5WJHmIFcU9nvFpObgYRTDErs
 W9+hUuZ/2uvgPiVZ8TCRak50p6aFoYx652fpuR4goECvO8v2sSDgDG1Pa9nWHOBwO968
 OluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EPo30eXxIqiDes4Q3ryePcQbuaNGcUHr9bzE1lqhMk=;
 b=iVAgt3ulF/LfcBINqvJ86mJtf9IW+yc0x4iAMjNeaHGk8fbhhWKIoD9KOKIA2FuLo0
 8k2ChqDhf0dibIEt+7th5srpkVPDjPAkDQTsf/33292noQrJ62fXWteZ2l22BlLvhtCe
 fnqwlhmU4a/svvifTIK03FtoKeK2SbSETIqxNibiRW1xbrhBeSX1I/elHH77k72TomFt
 IaixNvPplRCKxNS5tRxHB2lc066Df1Bjy217UEVIl5kdYbWdvEVFn1nQCmO8Ee0bweY1
 QkF4HEhLinFG1+eOBaHDJ2W3Q2GJ13+kdq03dJF2GjGbswYUh6YWf8iaPZmmxwVu268a
 AUrg==
X-Gm-Message-State: AFqh2kpellpfG24PvW/fn8VPZNGylGBwIRWbC/31O4exjgkE4hoFLjzb
 D4MR5zjb09njPxeiGPED1i7EaQ==
X-Google-Smtp-Source: AMrXdXueaqKIjBvQTVPvF1em064T6cm/Li8AuOULGgIZVnUfkC+UD9debypBCj2bvQ0OtCqs5E66Yg==
X-Received: by 2002:a17:906:a24f:b0:873:4ebb:94cd with SMTP id
 bi15-20020a170906a24f00b008734ebb94cdmr4651244ejb.10.1674029825760; 
 Wed, 18 Jan 2023 00:17:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 05/13] drm/bridge: lt9611: fix clock calculation
Date: Wed, 18 Jan 2023 10:16:50 +0200
Message-Id: <20230118081658.2198520-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of having several fixed values for the pcr register, calculate
it before programming. This allows the bridge to support most of the
display modes.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 32 +++++++++++--------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index f377052a45a4..e2799a0df8f8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -192,8 +192,9 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
 }
 
-static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
+static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int postdiv)
 {
+	unsigned int pcr_m = mode->clock * 5 * postdiv / 27000;
 	const struct reg_sequence reg_cfg[] = {
 		{ 0x830b, 0x01 },
 		{ 0x830c, 0x10 },
@@ -236,24 +237,14 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 	else
 		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
-	switch (mode->hdisplay) {
-	case 640:
-		regmap_write(lt9611->regmap, 0x8326, 0x14);
-		break;
-	case 1920:
-		regmap_write(lt9611->regmap, 0x8326, 0x37);
-		break;
-	case 3840:
-		regmap_write(lt9611->regmap, 0x8326, 0x37);
-		break;
-	}
+	regmap_write(lt9611->regmap, 0x8326, pcr_m);
 
 	/* pcr rst */
 	regmap_write(lt9611->regmap, 0x8011, 0x5a);
 	regmap_write(lt9611->regmap, 0x8011, 0xfa);
 }
 
-static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
+static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int *postdiv)
 {
 	unsigned int pclk = mode->clock;
 	const struct reg_sequence reg_cfg[] = {
@@ -271,12 +262,16 @@ static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode
 
 	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
-	if (pclk > 150000)
+	if (pclk > 150000) {
 		regmap_write(lt9611->regmap, 0x812d, 0x88);
-	else if (pclk > 70000)
+		*postdiv = 1;
+	} else if (pclk > 70000) {
 		regmap_write(lt9611->regmap, 0x812d, 0x99);
-	else
+		*postdiv = 2;
+	} else {
 		regmap_write(lt9611->regmap, 0x812d, 0xaa);
+		*postdiv = 4;
+	}
 
 	/*
 	 * first divide pclk by 2 first
@@ -895,14 +890,15 @@ static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	struct hdmi_avi_infoframe avi_frame;
+	unsigned int postdiv;
 	int ret;
 
 	lt9611_bridge_pre_enable(bridge);
 
 	lt9611_mipi_input_digital(lt9611, mode);
-	lt9611_pll_setup(lt9611, mode);
+	lt9611_pll_setup(lt9611, mode, &postdiv);
 	lt9611_mipi_video_setup(lt9611, mode);
-	lt9611_pcr_setup(lt9611, mode);
+	lt9611_pcr_setup(lt9611, mode, postdiv);
 
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
 						       &lt9611->connector,
-- 
2.39.0

