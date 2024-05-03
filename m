Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC78BB5DF
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CA01128F7;
	Fri,  3 May 2024 21:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="W+/vD/tG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD6F1124B3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:26 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e4c4fb6af3so950735ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772185; x=1715376985;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+m8p2+fwwMHEcaYlRhsoMqeDao9Xs+fgyRTTXxpyQQ=;
 b=W+/vD/tGhnARKRyybp0mu2Z40trgfWrk7e/lHh9mTQQkfjeqzbl89xQA8db1hkam8g
 sGlj4j2ZYpIdE3NTftgGWUY8Y47j/YqIKC8WKp+iBcmds6p+2kotxdQyk7TfwieHYUeZ
 ECQRZKdjz8RZZ3uzw4iVwTBCModhbe+qtF5fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772185; x=1715376985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+m8p2+fwwMHEcaYlRhsoMqeDao9Xs+fgyRTTXxpyQQ=;
 b=UKH180T5KSzH1DIVDdaEy2c+hA/Xxpp+NcMWbvRoqf4vTuEUiu3uSFV4Ucp1CXjeOv
 nDGjNBNX3aTTXcX1bu8OE1H4Gi8NbGdwKJTOI2MwTOHUhC2EZ/W+Yf2MIPCuU8maX7dP
 Q9vlhcWJfNqAD3HiD64QKiKQO/e9AohS65wc3TtUvmaosIgcgAkrebXtXJz+bJ21bVt1
 BX8dfswAMPwP0pg66HXvzRo2q6fdwOO1e2ZEwpey2HwZXXMQACkWND+aW8jrec6wc83J
 6O3eDiTUS5CfF8XmoVY+Iio4lOb+0nReXZQEsyC+hgw4WuKjzO+N5x+Pmf86Dd9EnQjz
 sgcQ==
X-Gm-Message-State: AOJu0YyQSCrNJ9li0nKCrmKuuWj1QsjVErSnK5jkP9DR80IpU3KVnzid
 BC/ZGuq3RDVtqR4w76Qi87paLuyGyP22n4MtkTpdbypc7EclTedcDXwhQEwLP2mPHknFZp08d8J
 ecQ==
X-Google-Smtp-Source: AGHT+IEe8XlbR/2YlPVfssvvzVEwgr7rfoy9E26NkJtjDWBN5xy4JZSBQ68VuPVn9y4gwaS+LyUeIg==
X-Received: by 2002:a17:902:c407:b0:1e5:e676:4b09 with SMTP id
 k7-20020a170902c40700b001e5e6764b09mr5664110plk.25.1714772185179; 
 Fri, 03 May 2024 14:36:25 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 01/48] drm/panel: raydium-rm692e5: Stop tracking
 prepared
Date: Fri,  3 May 2024 14:32:42 -0700
Message-ID: <20240503143327.RFT.v2.1.I784238de4810658212a5786b219f128460562a37@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New

 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
index a613ba5b816c..21d97f6b8a2f 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -23,7 +23,6 @@ struct rm692e5_panel {
 	struct drm_dsc_config dsc;
 	struct regulator_bulk_data supplies[3];
 	struct gpio_desc *reset_gpio;
-	bool prepared;
 };
 
 static inline struct rm692e5_panel *to_rm692e5_panel(struct drm_panel *panel)
@@ -171,9 +170,6 @@ static int rm692e5_prepare(struct drm_panel *panel)
 	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable regulators: %d\n", ret);
@@ -213,8 +209,6 @@ static int rm692e5_prepare(struct drm_panel *panel)
 
 	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x00);
 
-	ctx->prepared = true;
-
 	return 0;
 }
 
@@ -222,13 +216,9 @@ static int rm692e5_unprepare(struct drm_panel *panel)
 {
 	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
 
-	if (!ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 
-	ctx->prepared = false;
 	return 0;
 }
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

