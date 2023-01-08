Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD47E6613FD
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A016510E232;
	Sun,  8 Jan 2023 07:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E95910E1E5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:00 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bp15so8293194lfb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MojOF/93S3oRnJzgKxf5e9Ahv/idd5WHTFRxpckdje4=;
 b=y8Wlk6GZX25Kumr1IZr7HR3n/P5fsUN9/SQeJbUzi+ubexFu3PE3t5fwrdQevn1QTM
 FmrewR4dmUHwJiJ+4TRb/bI9wqzqNxxav8+LMR1BRaSIaew3PtLN5E3eHO9F6oS8IMbs
 jD9nogvLB4pm6ZhR8omo1oT55mzD7zNwPnT9/jf9XvKfbBHyEDXCZPASyYMqO0V/a2xk
 3QrQZsWJZoSyVNATiC+AdMO1YW1olo1ZnpMg2F0RczhWpd6lVvSnW1eUcNCwu9wKQYbf
 6IRw2RceQUATc+LhAHlM1zCdq2PDk8Pzzcs8lSadEj36mSSKRryJp3LnlO9GwvUx0du2
 K5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MojOF/93S3oRnJzgKxf5e9Ahv/idd5WHTFRxpckdje4=;
 b=tEaMf9noWVPUDL1VAtWrn21ebSVq/QEaC5jLUvTstZOvu7m0aTv1lcIyrbPsudNJ/e
 6GZK+RiMib5DHjxRFInJyAGUdfyAkCa9/+DM4Kk21fGBgcKlsfKbYSwgLKW4vmxRfUWa
 zfJ/LNMkkqs2HJq/YQVFfP+hDK51TOHsR1ATwZyM4S8SFhx2hy4PVxmbFG3IKNp+cEhe
 yj56MIa/Y25DOqjYIssnWjVeaxUQU/wP3IipYm1QYjgiEEojY87M43+pGTslCkVPlXxE
 a1q8E5m6oPTR5zFY77FLJ89Qi14tpWeEaH4CavrA2N5JpPVrf5pHp344l3JXsxnaNfGA
 so9g==
X-Gm-Message-State: AFqh2krO9r0dYmcPnFw/wHcBzP82WYmLErqpyI5g4m7LfjkgugyzbfPD
 xUF6T+GKHZF0bqiPLj+iFQTMdQ==
X-Google-Smtp-Source: AMrXdXtQyqcg9qK49gf+njlh8RAH/3piH8mYKaqr1bwvc3f32iElChmBrkVB9yjNaYcPgOnEF7LI4w==
X-Received: by 2002:a05:6512:2344:b0:4cb:430b:c6b with SMTP id
 p4-20020a056512234400b004cb430b0c6bmr5231018lfu.29.1673162760087; 
 Sat, 07 Jan 2023 23:26:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 05/12] drm/bridge: lt9611: fix clock calculation
Date: Sun,  8 Jan 2023 09:25:48 +0200
Message-Id: <20230108072555.2905260-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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

