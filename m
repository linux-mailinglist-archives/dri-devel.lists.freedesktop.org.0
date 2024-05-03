Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43238BB5F3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B34113293;
	Fri,  3 May 2024 21:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZX/TWgLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9B1113293
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:04 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1e3c3aa8938so873175ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772223; x=1715377023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGe/o9E+2J3mWXQ+Ut7332ISLmsjuHNvcfhFlYYK3u0=;
 b=ZX/TWgLr1sJookd/cuuepueKZOSneK6q84Uj7GVTlzQYtlw4UmKcQL7rSW8CdJ1Hw0
 d+kJbnB44+7FSwW+GylxFFVr0ohOe+/XFIorjeMoDzBRT91PJqz80gsWwWNTcktXliyL
 H8aRWqkPbrzq6two6UBE5EgtTmMIMzm744POI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772223; x=1715377023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGe/o9E+2J3mWXQ+Ut7332ISLmsjuHNvcfhFlYYK3u0=;
 b=K6+G/aDMYuFL8J40tpCItxhj1VOo8MopO/eLTPctcwouEJBybw/dMT5xpCrGnUs+nk
 XyQMlL3RmQDwhtfnrVY/f4kTzvlI06IBTcOjMr592+LIuxkFseD8VhYFY4ujnzec5jDb
 NnGKrPEGJvSZgR0k25sqYdBcD6MqoRPAJNZ8pSh6oWiUMhOTSFKt34np2NiLgvpgTeQN
 bBOAjl8r1TaFdjp8f3zCEaCkKu8+056EN/1grcnENAT845gbfb6xH9ycAkp0BR0PHxZ1
 AkTX6bzYSMh1CqDqxjSEte2xS8VsZTlzMVzQUuhUNBNC9YlHfJEzipY9otRsaPrNa4f/
 32yw==
X-Gm-Message-State: AOJu0YwJXy8ZBE/ASM6cToQzTUA6xoc9W3XuZpzCmnO+YOnxaHX6aL/H
 OX0H8WCTtjjgEDPbWJ3CSwV2w59SjfHrArotc4s1fAn56AOgEW0cSkLLjSLOAofky11/wKpwARv
 wzA==
X-Google-Smtp-Source: AGHT+IEgRFrCTmA76ZQ+ZA/ZsnLrxvKdZ+FvjBO/HzwbNFAg+uY38D+QTINvkSf/bzeDzCo33IN3pA==
X-Received: by 2002:a17:902:d386:b0:1e7:d492:1206 with SMTP id
 e6-20020a170902d38600b001e7d4921206mr4129620pld.53.1714772222926; 
 Fri, 03 May 2024 14:37:02 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:02 -0700 (PDT)
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
Subject: [RFT PATCH v2 16/48] drm/panel: ltk500hd1829: Stop tracking prepared
Date: Fri,  3 May 2024 14:32:57 -0700
Message-ID: <20240503143327.RFT.v2.16.I4f574b87fe24765ddd4424437159b37a6481aa1a@changeid>
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

 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index a4c9a5cb9811..ef27cab08f1d 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -40,7 +40,6 @@ struct ltk500hd1829 {
 	struct regulator *vcc;
 	struct regulator *iovcc;
 	const struct ltk500hd1829_desc *panel_desc;
-	bool prepared;
 };
 
 static const struct ltk500hd1829_cmd ltk101b4029w_init[] = {
@@ -492,9 +491,6 @@ static int ltk500hd1829_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", ret);
@@ -510,8 +506,6 @@ static int ltk500hd1829_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -522,9 +516,6 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 	unsigned int i;
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	ret = regulator_enable(ctx->vcc);
 	if (ret < 0) {
 		dev_err(ctx->dev, "Failed to enable vci supply: %d\n", ret);
@@ -568,8 +559,6 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 		goto disable_iovcc;
 	}
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

