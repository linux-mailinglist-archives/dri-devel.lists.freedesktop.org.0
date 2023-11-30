Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F187FF40C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67F910E311;
	Thu, 30 Nov 2023 15:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDC410E010
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:37 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6d81580d696so631165a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359796; x=1701964596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
 b=U4RqpfC9fEJPE9+XDHgR7wElzEwAakMvV7KyYoXPWMA5g8sU3TkUivo9H8ECZVH0PJ
 DbuFXL+jbMe7RVd9taAS5+dW0iF8MgzHtmZzSwMcbtT0TMtYs0fvyQqoZCikiWJNwtiJ
 SmmwpO8FGoN61b6qNCa9vMoVqeA7gO0P1QM8pbZmXpUsrdmflo7Aqjq7W8j8sLoRHpV/
 Re3iMId7o9tJ4cY9uQcWeHkfCNv1UAQurzMbELC2JM6tLlmwM4JIvPZPlwPZ1nQg4l6L
 3Wh16nmm8oegS7e3qecbP1FyGxR/hHVA4SWpbt3KRGUYGhRf7GxcsGnx9vLSFBWOULRN
 q9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359796; x=1701964596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
 b=ktmlr1aDlrZ1GsttzxVxS0tMa8GWYGHvjbsY/lkbh1z6BHWKO9ZSz1ETWYty2+kJTg
 PQa0MsBmkTrKYGnpNfGqt/W7lxIhXGcG2GDbi7A5IJ1B+BHiulaezy9dlvtJhq0Nw5W3
 MaEmHpEE3nt4kdhH9pEgtGO4I0Qezrkpcong4hAk4uLpVG8ZOK1iPv0CWq5N7xDRg4Wu
 MPf0fR75aBQr6kOwsrQ3p/oMWUxdfS3JbFwsO9aqPRJ9bou4h1EkOewaPUJcnncazU7q
 1g1xUOkWpQaCbwTYOIKG7PNBItUvslKPZOOfdgroh+LGzSNXHXXCJJkKwRlsy5TAK8cg
 /kDw==
X-Gm-Message-State: AOJu0YyZECRzHjnCj7chj398P9WOYjZS8vbElNyfT+lM2XRWcXEvH3Ck
 S/zTQfJuzoBT9+XhyVwIGPU=
X-Google-Smtp-Source: AGHT+IGIpq0HDFW1aPCXeHwe/OsY5YBOo1MLLv/ekDphC3bLN7juAg1D5RuJGsNdYUMwqF8OYWLbzA==
X-Received: by 2002:a9d:7743:0:b0:6d8:328e:faa2 with SMTP id
 t3-20020a9d7743000000b006d8328efaa2mr12216049otl.26.1701359796668; 
 Thu, 30 Nov 2023 07:56:36 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:36 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 1/9] drm/panel: himax-hx8394: Drop prepare/unprepare tracking
Date: Thu, 30 Nov 2023 09:56:16 -0600
Message-Id: <20231130155624.405575-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Drop the panel specific prepare/unprepare logic. This is now tracked
by the DRM stack [1].

[1] commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
drm_panel")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c73243d85de7..3823ff388b96 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -68,7 +68,6 @@ struct hx8394 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
-	bool prepared;
 
 	const struct hx8394_panel_desc *desc;
 };
@@ -262,16 +261,11 @@ static int hx8394_unprepare(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 
-	if (!ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -280,9 +274,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	ret = regulator_enable(ctx->vcc);
@@ -301,8 +292,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 
 	msleep(180);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_vcc:
-- 
2.34.1

