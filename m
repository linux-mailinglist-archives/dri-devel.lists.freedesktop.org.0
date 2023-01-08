Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8066170E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE29810E200;
	Sun,  8 Jan 2023 16:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEAC10E20C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so9507303lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jsw80iE4Bz5Oyb4Yui9qzxM/xJUIMCcqN7Ll6Uw4NDY=;
 b=alH/lGvw0HcCLjFAslrqET+DjUrHL52unC6JngmkQo3R+u4GToTofXI41ORv5lGv3x
 V6lJn+39OHyT5/6+l2VRTjDOV8APqJVdBOmtqskna7BCh+31sle2sstwtuPOApV10Vtb
 2pTnwOmsuzCPUBnyDh6ZyuOU67os8gdzmNqeVTcZrECtTijODRYtMLJD26M2gH9Tan3H
 Ko1KerXL7SWgPX5UN0kCSgkvBLQcpE8kHH44fDzM4rILX0Ep/BwtLhkgsDC56+WsYCRg
 JHSQWRaZvVIE8xk6XoK5VJBrqS0DfVHbrfbmXSdeWSLIVD9Cgi99blLEw+R9W5f+E4HV
 Ejow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jsw80iE4Bz5Oyb4Yui9qzxM/xJUIMCcqN7Ll6Uw4NDY=;
 b=i8i0Mc5Z4+ZlVhYbJNQ8+hCrXxg7HogRVVv4xIyFjMYT4KkpCIjsCQulKZywcwMgfx
 CZx4C6REj5FbZPO5P3fag9XD0tVc64hS5gnYe18D6Y1J65xCmze9LLOcHjYYaVeAcRI+
 qenVHJt8+BdIT0q1VAGreNu/YiifFxcQJBxVc+ErXHNoI1GLy0DVydKsMMMl9zgyijgp
 fSL79dQ3lZ6mqF6V20X4qf2JI312q4iPygOLK6RF1Wzymu2w0FsytgLS6Bv4d576Xa2/
 90ZWb8PN3dSDElfWYemh0fuWNlUc439rSUerUucwbOMn/LxoxcB/9duZ5tn1I6gNL3Ep
 F6QA==
X-Gm-Message-State: AFqh2kosC/Bp6OOdV9aTR3hljJ9JwkmAMhRWET9RJjcHfilpMDNRuu6q
 V3AgRPg0SXsIoUzhq+X51DT2Rg==
X-Google-Smtp-Source: AMrXdXtFKEVoP2iuRUwM0axgQM+w8vmZcyRa7+dy2pWh64vnZwOeWLem/37rL7Xv8qcFt0EsZpOOQA==
X-Received: by 2002:a05:6512:3e1b:b0:4b5:5616:ecd2 with SMTP id
 i27-20020a0565123e1b00b004b55616ecd2mr21993729lfv.55.1673197027668; 
 Sun, 08 Jan 2023 08:57:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 13/13] drm/bridge: lt9611: properly program the dual host
 mode
Date: Sun,  8 Jan 2023 18:56:56 +0200
Message-Id: <20230108165656.136871-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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

If the bridge is connected using both DSI ports, the driver should use
both of them all the time. Correct programming sequence to always use
dual-port mode if both dsi0 and dsi1 are connected.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 28 ++++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index df9f015aa3a0..561da6bd2698 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -118,7 +118,7 @@ static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
 		{ 0x8306, 0x0a },
 	};
 
-	if (mode->hdisplay == 3840)
+	if (lt9611->dsi1_node)
 		reg_cfg[1].def = 0x03;
 
 	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
@@ -191,16 +191,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		{ 0x832d, 0x38 },
 		{ 0x8331, 0x08 },
 	};
-	const struct reg_sequence reg_cfg2[] = {
-		{ 0x830b, 0x03 },
-		{ 0x830c, 0xd0 },
-		{ 0x8348, 0x03 },
-		{ 0x8349, 0xe0 },
-		{ 0x8324, 0x72 },
-		{ 0x8325, 0x00 },
-		{ 0x832a, 0x01 },
-		{ 0x834a, 0x10 },
-	};
 	u8 pol = 0x10;
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -209,10 +199,18 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		pol |= 0x1;
 	regmap_write(lt9611->regmap, 0x831d, pol);
 
-	if (mode->hdisplay == 3840)
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
-	else
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	if (lt9611->dsi1_node) {
+		unsigned int hact = mode->hdisplay;
+
+		hact >>= 2;
+		hact += 0x50;
+		hact = min(hact, 0x3e0U);
+		regmap_write(lt9611->regmap, 0x830b, hact / 256);
+		regmap_write(lt9611->regmap, 0x830c, hact % 256);
+		regmap_write(lt9611->regmap, 0x8348, hact / 256);
+		regmap_write(lt9611->regmap, 0x8349, hact % 256);
+	}
 
 	regmap_write(lt9611->regmap, 0x8326, pcr_m);
 
-- 
2.39.0

