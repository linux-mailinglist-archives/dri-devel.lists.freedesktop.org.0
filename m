Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA3962D36
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F62D10E559;
	Wed, 28 Aug 2024 16:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j1X65Phy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5199A10E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:03:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-371a13c7c80so544513f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724861031; x=1725465831; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o2C0Ata5DnGBKpgrOPOJ9Qpj52V9oZzJPEy8talc8NA=;
 b=j1X65PhyQnReXOdkp6wm0q42epajz5pwSrewLja23svjQJb4ZeNKaPiXj8nVFfXYeT
 nJLDNnwiLQjryaeNPArd9hfsMTr41nGIc3YgxJIEfPWCt2pM79PHtl3yB9zZc4NFpj8z
 aCRmDHpqKltrV7631At8iz2eo1G1r5hc1tFBv1x5+KWx4aWrBhrTCiGBSNBEtgvMvTTM
 meeTDEuYzqwpZbCSUYNp5iXwRRTX/M0Lys9zVD3vdXRP82kTXlrdqK7OZQrfOQDxlWiu
 cNzcHj6uQ45QeiSL+UT0RILtqcjCuYw8GML0AbE7X+6WiwO3hzF345BmY+FnXvBO05Dt
 dSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724861031; x=1725465831;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o2C0Ata5DnGBKpgrOPOJ9Qpj52V9oZzJPEy8talc8NA=;
 b=Z2AnZI3bnQBRTY/k9ca1MyrkC3+GatdsL9j3QjZzYx13Erh4kebObjdK0Q/+Na3rOX
 eehiixrfPvYoJfrKnX9vsSSGTGVb1gqIDKmyyXizedpoNOAXXgUgYQdEFPSg60dbsrqk
 SUCJVSay8s6vQjGSXVrycHyeMmYDJfA1XbR26T1sEN7yTgpyUesMregJ1V82qayosm20
 lbwrkCiWdr//7netvnQWyJTg09oo2bWN29eKXSVaIJL33ldFAS4AbMapt6gLAKzwust3
 7zzc3K6ikjKOt8ARpnj8JT+YQr1U3THeWgA5wNaUinLuk431NbYIxFwp6A5QOGcOukr4
 yGug==
X-Gm-Message-State: AOJu0YyZnHrbs3IR1+qXP/oKVa1TYscnGRvocdmPkl0nAiEQbxNeVf5S
 iXexVJJkwE9HE+bXQdQzlWBQskUFp/JuVJBkeCjoNyRvc9sIO5+zGiI9DLD8clc=
X-Google-Smtp-Source: AGHT+IHvuPcJW8cEF/aAGTjwURVAhubJtGabQ01KMZXeK1b8TtkqlbqetIk/BSaMtAYnDBF6QArDOw==
X-Received: by 2002:adf:9b8f:0:b0:363:ac4d:c44f with SMTP id
 ffacd0b85a97d-3749b54b1f8mr42849f8f.17.1724861029903; 
 Wed, 28 Aug 2024 09:03:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b22da51sm153232f8f.15.2024.08.28.09.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:03:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 18:03:40 +0200
Subject: [PATCH 2/2] drm/panel: visionox-vtdr6130: switch to
 devm_regulator_bulk_get_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-2-0cae20d4c55d@linaro.org>
References: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
In-Reply-To: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6lc/0TowARllWPS3Y80o0s8enD0/CNCX2NvstCPsOjQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmz0piSlPdFi79yS2eRARm4Yw4O94DArWL02Xvc4e0
 5xAIc+CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs9KYgAKCRB33NvayMhJ0f4mD/
 9T/TEyl6b35MYJ4t7Sup6k2/8ibDWGQTqsL1VG8DAV62i98cFQASpEL8UXyOe9BGdEfFbExFYqpbJ6
 TWg9p+FjpbgVEAqg+ZSb7srDuMVXLpu1Z9bJcWKEQcm68ee4mrWAdsyKrxsdyiqytLtIOq5Sy8wHcI
 RobGyJzY4ECVSkjRDeHO9T9jQbmUeqEseZ1HI0BV7r3TND6iQkASdF8YsGwQqmf9dx7keJez1dp7gj
 RKWBqzqJWjvHC8/aMC2siasLSyp/pWBLHJxlm6tl++ven7uebVJg1mgQnLdynFH5kUVdT4LKLaUusY
 wdF35FlL95y85vZ74QLiCGoOauhSanIF+pi2Qj9QQqO1C/rSNUP1OqIkAQ2FMOESupeXrxV572hpYi
 GII/A9IirtLJVFaQPWnWwlDYD1aX+rznfj7CNj2ZVYdw7YUfFKWViSeg3LCzPJKXVBE18cBAjSCiKV
 kXB83hXH8+1yEunIm1B6gKp8NoNpTWYQvLC3y+/RouvIB4vFqhsgOR6c7LxEHp5irbhMrjMg3TYrRD
 S2T/Jr8CAR/NY400y3xcO9+YrUJ9QtvRL+GUJ6Ub5BEY38d7BUO6FcoHmuvE/4O8w3EElK+BYfuxr7
 mSUPGYWitcjntN+xegNK9NttmAvFDRciE1+1jDE1rHjAU7V+VTkHHNcpEnGA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to devm_regulator_bulk_get_const() to stop setting the supplies
list in probe(), and move the regulator_bulk_data struct in static const.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 26 +++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index ebe92871dbb6..17b8defe79c1 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -19,7 +19,13 @@ struct visionox_vtdr6130 {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
-	struct regulator_bulk_data supplies[3];
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data visionox_vtdr6130_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vci" },
+	{ .supply = "vdd" },
 };
 
 static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
@@ -139,7 +145,7 @@ static int visionox_vtdr6130_prepare(struct drm_panel *panel)
 	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
+	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_vtdr6130_supplies),
 				    ctx->supplies);
 	if (ret < 0)
 		return ret;
@@ -149,7 +155,8 @@ static int visionox_vtdr6130_prepare(struct drm_panel *panel)
 	ret = visionox_vtdr6130_on(ctx);
 	if (ret < 0) {
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+		regulator_bulk_disable(ARRAY_SIZE(visionox_vtdr6130_supplies),
+				       ctx->supplies);
 		return ret;
 	}
 
@@ -164,7 +171,8 @@ static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
-	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(visionox_vtdr6130_supplies),
+			       ctx->supplies);
 
 	return 0;
 }
@@ -244,12 +252,10 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->supplies[0].supply = "vddio";
-	ctx->supplies[1].supply = "vci";
-	ctx->supplies[2].supply = "vdd";
-
-	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
-				      ctx->supplies);
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(visionox_vtdr6130_supplies),
+					    visionox_vtdr6130_supplies,
+					    &ctx->supplies);
 	if (ret < 0)
 		return ret;
 

-- 
2.34.1

