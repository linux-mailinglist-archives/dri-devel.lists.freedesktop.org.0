Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B848BB605
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B00E112A0D;
	Fri,  3 May 2024 21:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YN0io0Sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC85112A0B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1ed835f3c3cso1043575ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772256; x=1715377056;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiw1xydznhtSh3tRBtRhpS0zYaaoLUo2meLrU+lEUtM=;
 b=YN0io0SbP/R5NF8ZwQ+udsLC/XzeEjYWIqV2yHP77wpAqZ84XG1bVtgw8QjZgl3Vsd
 Jmz6m1BNjz3cvsA3OxHsGhnWlX8NqLDTaxY/qL2bqNXD9A8JAYV3RHVKpoMQe/6LczLM
 F+R+yFef/QNut2aW1fbcqnR6KQXWbcytlx1Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772256; x=1715377056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uiw1xydznhtSh3tRBtRhpS0zYaaoLUo2meLrU+lEUtM=;
 b=IweErIekt6TRikUtfZ3vLYyxwLK2utdG/WvwLl6kwWf0d7wavwWlDFCim9oK21t4rt
 fDdtUPNauUTw5zNulKEdwVMjxxZakuF2BW0lLOXujuWzc+wjPnxBiiTBScZP/ZtiN7yJ
 +3A7BUHbCG4I8l0ajEc00itBEp6IIuY7H+vPQ1kReL7DuzDaR7RAQsRxZSXkIHwVeymm
 oGxAUUMmAWlMMGjJqe/p0+QkE9VuFyeaEQLYttxLmBRW1Bq4U9VmE8zxCjv09uDDYuGK
 H34JvNMNBWolaAjY2g6gdPL8zjVm0Qp4WsH36VNbAf2xfYOM3ddRrfY1RO5cwtcD3mVt
 TKFQ==
X-Gm-Message-State: AOJu0Yx9TTkUGketDTjnY2zyouMG7hCYa0adr8nE/T4/MIfcJxeYL/7O
 I/6mUvxCSm4ApjzJZIX1QBUh0qmB35CWYfW6WNULvASzEeTTP9k67vO7nK2EPaXrRKeUIJ+GuMc
 /2A==
X-Google-Smtp-Source: AGHT+IFe81rGj8McqUJlsjyFTCj7SugLiyekq3wZXTXyN5wCjggXDovNiqeay6g57DA6tB8RQd7/nQ==
X-Received: by 2002:a17:902:e750:b0:1e7:b7a7:9f20 with SMTP id
 p16-20020a170902e75000b001e7b7a79f20mr5609022plf.59.1714772256078; 
 Fri, 03 May 2024 14:37:36 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 30/48] drm/panel: xinpeng-xpp055c272: Stop tracking
 prepared
Date: Fri,  3 May 2024 14:33:11 -0700
Message-ID: <20240503143327.RFT.v2.30.I2145be78ce28327f4588c2c21370f22fd79d28b8@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: "Heiko Stübner" <heiko@sntech.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 8670386498a4..8262c00670cf 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -52,7 +52,6 @@ struct xpp055c272 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vci;
 	struct regulator *iovcc;
-	bool prepared;
 };
 
 static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
@@ -136,9 +135,6 @@ static int xpp055c272_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -152,8 +148,6 @@ static int xpp055c272_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vci);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -163,9 +157,6 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vci);
 	if (ret < 0) {
@@ -209,8 +200,6 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 
 	msleep(50);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

