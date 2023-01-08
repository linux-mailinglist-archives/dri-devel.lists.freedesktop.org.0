Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A8661712
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764EA10E230;
	Sun,  8 Jan 2023 16:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207FA10E1F4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bn6so6521366ljb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NH1d+1PPDWydMKrpXiB7N/7rHowCambw1HmOt4U8TEY=;
 b=Mc3S+dGTVyt3txPpj+xX7j2IQEbdfxP887iPwB8+OpSsJetRWSzuWELPuhoc8AJHJE
 Chz4gJNUCA0DO9/rcAF1QNSr7fg3NKrSRe3VVeL1LKqqcZIWJX1Ier/rtAY68BAAqLT3
 WrnBLU1TtpZkOrE3YGD7kNHPKmhbAFzF1AAC6uWZ1Xja5Sy/1DcxlRkZaa3XKlKqC5yZ
 OeKP4sYO3w8qC7JGmQNEn332SDfM/nf9DrmEvdzbdBZOZAXLx1A4a2ljK9C1LD6exSTx
 bYTq2XNnMtbTAZZpKByQibYXU5ilPYJl0dQ66bCAbg2AyQ6olSFDF01EoiSwFajuAAG9
 +r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NH1d+1PPDWydMKrpXiB7N/7rHowCambw1HmOt4U8TEY=;
 b=g2P865LUax9Ss34wLVGDCwWdVvsXDBJfP8IQG7mQHlZ5qx3vw8lf1plmIYhcup8Koa
 2+jUTb1NkvwGHqpTuhdXVzF3O8/hRJgIaI6p3VefXSsLlX5OywPdX4d7O1B882vzUgIl
 VV185UTG+W+/Aboxutz4nRHUPpZKLbOq88kKgf+dxE/E+ABzI1PRGL+8X0DMgHfdR27j
 s4i8EK9MAJSRUCG7eGj4nC/Xo7PMGn97fPSB8OqvNIa/02Tjtard9XYrXCFsYtvTO7P9
 ozRw4n6KeWTgLP3dcMbi547tdaiYSEi/CzdNHxMPCMNmgSv78Mc4S1vTk6xAi7ejn6Rs
 Rdsw==
X-Gm-Message-State: AFqh2kqowa4I+UjDLCrXCV20xD8rZI2AiCq7P6+mmKrvxqQLn5Nik8Y/
 U0h6lfuZVpsy45luA1ViLM5Jeg==
X-Google-Smtp-Source: AMrXdXssQ9vFGz21nmCaS2uBYJfIJBiPV2tuSTMIYZFfwOKfLE65KNuB3AcOhiEe6S+RBjkOIi7NAw==
X-Received: by 2002:a2e:9207:0:b0:27f:ba2d:6d64 with SMTP id
 k7-20020a2e9207000000b0027fba2d6d64mr13436717ljg.43.1673197024406; 
 Sun, 08 Jan 2023 08:57:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 09/13] drm/bridge: lt9611: fix sync polarity for DVI output
Date: Sun,  8 Jan 2023 18:56:52 +0200
Message-Id: <20230108165656.136871-10-dmitry.baryshkov@linaro.org>
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

Attaching DVI sink to the lt9611 requires different setup. Fix the
register write to make the DVI displays sync onto the correct sync
pulse.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 773d7a56f86f..7f9be74acf0d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -352,13 +352,16 @@ static int lt9611_video_check(struct lt9611 *lt9611)
 	return temp;
 }
 
-static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611)
+static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
 {
 	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
 	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
 	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
 
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	if (is_hdmi)
+		regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	else
+		regmap_write(lt9611->regmap, 0x82d6, 0x0c);
 	regmap_write(lt9611->regmap, 0x82d7, 0x04);
 }
 
@@ -719,7 +722,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	lt9611_mipi_input_analog(lt9611);
-	lt9611_hdmi_tx_digital(lt9611);
+	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
 	lt9611_hdmi_tx_phy(lt9611);
 
 	msleep(500);
-- 
2.39.0

