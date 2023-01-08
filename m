Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB96613F9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E1910E20B;
	Sun,  8 Jan 2023 07:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D2010E1E8
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:00 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bt23so8287528lfb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
 b=R2WINXEkAmqc1F+yT6f+c4Nfkv1d8jkC9Ma/KTvMQZauhWNfaMLsOKVE+pHlUeoc4f
 5C+d7kFjYlblzzjqqihOM3obvTaB7aTTSUSVTgbN7/lZsw8keQTvsF1OolTzdjNY6f/Y
 DZyf3cJ5b1U2UICzTE54FuTgWjbdzEpUfoGfsqz9/5ufnij3BmdycQ1l0vvxgIfTIk0V
 Yhr227dRtX+ilBRE9kKsHoauaJgLbocm4UfvosgyC/f8I6xqQQcLzOcyCYAxSIzV2Lmw
 G0k89rxP63Rl2EjCJ5Dg2HCVLL8zM9xeA8YnjAj/h9pPZDzk6ZQERTuikQcA66ZqSJLb
 LIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
 b=IpYR4U/GdMDqhMMSfYRclxM4H8deyuFDcCyTEsd58T4YYe5QzBasQtOLFVf2dmg47J
 XGhccgI0251SVqOFuTrBiiyTBMj/Jb/sN1+zO4a7JJE10PPq4XjVflp36PHKTrMljZmx
 /DLTp+TFaTMieoyMLpaywyprsLziNjT5tKvq/bM34rcblvTf6/6Xc2ToeIhUWsM/f0Mb
 o26TlR/qQFw8ranLXRQ3k8kEXqw47O17hZuF7qwtXDmdkkGaX42xAp9K6MJQ0fqeIVa9
 Q4TIlrC6cLSOzzrWsN0+JYP6mCDVDgHCr6rMB/P1YrIfrJOhixYjagdZt8oXR79L7IpI
 sT5Q==
X-Gm-Message-State: AFqh2krFPdad6S8DMEdEn+qFhAwfyhA9rB+k4nwatSQd9CXhR1dH3vUu
 IgAS2JIjFv83Lu/X2domaBXV+Q==
X-Google-Smtp-Source: AMrXdXtgGtsm2oDkn0j02HpZsV2wpEeIudu6QlL4kgQ2P9mZz0VJz1PqJhAaJhl+6guXztCXuxnYUQ==
X-Received: by 2002:a05:6512:104e:b0:4cb:43db:30fe with SMTP id
 c14-20020a056512104e00b004cb43db30femr5838626lfb.11.1673162758734; 
 Sat, 07 Jan 2023 23:25:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 03/12] drm/bridge: lt9611: fix polarity programming
Date: Sun,  8 Jan 2023 09:25:46 +0200
Message-Id: <20230108072555.2905260-4-dmitry.baryshkov@linaro.org>
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

Fix programming of hsync and vsync polarities

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 58f39b279217..deb503ca956a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -207,7 +207,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 
 		/* stage 2 */
 		{ 0x834a, 0x40 },
-		{ 0x831d, 0x10 },
 
 		/* MK limit */
 		{ 0x832d, 0x38 },
@@ -222,11 +221,19 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		{ 0x8325, 0x00 },
 		{ 0x832a, 0x01 },
 		{ 0x834a, 0x10 },
-		{ 0x831d, 0x10 },
-		{ 0x8326, 0x37 },
 	};
+	u8 pol = 0x10;
 
-	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		pol |= 0x2;
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		pol |= 0x1;
+	regmap_write(lt9611->regmap, 0x831d, pol);
+
+	if (mode->hdisplay == 3840)
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+	else
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	switch (mode->hdisplay) {
 	case 640:
@@ -236,7 +243,7 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	case 3840:
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	}
 
-- 
2.39.0

