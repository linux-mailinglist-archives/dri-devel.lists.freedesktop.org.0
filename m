Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4A803DD2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFAC10E3C9;
	Mon,  4 Dec 2023 18:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8D10E3C4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:27 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6d8ba6c9b4bso1218746a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716247; x=1702321047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
 b=fGvGKFwigQxDr7FsZ6dWQxZwOagbBv6eGhLwohcVXP12ghwo40vnVNUqLxnwfzv64J
 JYyG7X+qvFhrYTut7sGgaBh1uUXSsodupjzvT5Zm5xBETgaPX6cN6Y12CWZPwaweZ35m
 5OCLJLpOWrPutblfV4svl/ciGDCrPGtLPg/zLjGfxhWnuOY1pQrsFJCXVgB9kYaT6WHI
 b5mV8eQMF48si/YEzfl5oZ13jzcMWc7waEeBWFWVrPCLdh9W4KMhT9dHp0lwJo0KRnQU
 t4L/fkx85mufsMv1USlQ4CzOBzAXmvH3YWTQGR2KJBqxQLlUAbCi6O4XgmpIYEhcfHgx
 SnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716247; x=1702321047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
 b=rfizmy/RPTu8rjEjFfTmnN1XGzNS72UxQq69r+Jv+OKub5nRv8lCQy69NM8e5Mdt0B
 gNVJsKwTYv44VNEifYDHVTC5ahkq0T7Zsi7nLCWLMWOfQUQywnznIpvz7Pvrc7ZLE1Ek
 z9isN0h1G9y8DDj3cXiWlzEPSymYlu16nkWq8g/kNvh4XDi+x8jeBYNWXPhv0x1wGHIE
 VIyHe+MEqTcvG8psZILoQs2Zh5TPTNZxciCRzYj89xioijURdlTRldouwMGPp/ytmoN6
 2jgNxHT+e2UqYusGLJuBGLABwjYj/Z5p+izE+89eiOCKxOBXgu91z41Rl/qScEGT8hnM
 +pfg==
X-Gm-Message-State: AOJu0YwFxaQZvg9sQRbdAbVQOqgRKJ7ASNeN4Zk5hXvzyHembOpweWNP
 i17ffoo4oeZ+uepSoXajm4g=
X-Google-Smtp-Source: AGHT+IHcWm1h1Em1kIkk/o+9cIGFYSuJffLp9RQVhcgIZgRMRwVf1HJ4lBuXR12rytbhyYdoJFAN0w==
X-Received: by 2002:a05:6830:1283:b0:6d8:7eb4:ca7d with SMTP id
 z3-20020a056830128300b006d87eb4ca7dmr2963949otp.54.1701716247207; 
 Mon, 04 Dec 2023 10:57:27 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:27 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 02/10] drm/panel: himax-hx8394: Drop shutdown logic
Date: Mon,  4 Dec 2023 12:57:11 -0600
Message-Id: <20231204185719.569021-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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

The driver shutdown is duplicate as it calls drm_unprepare and
drm_disable which are called anyway when associated drivers are
shutdown/removed.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index 3823ff388b96..d8e590d5e1da 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -390,27 +390,11 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void hx8394_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-}
-
 static void hx8394_remove(struct mipi_dsi_device *dsi)
 {
 	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	hx8394_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -427,7 +411,6 @@ MODULE_DEVICE_TABLE(of, hx8394_of_match);
 static struct mipi_dsi_driver hx8394_driver = {
 	.probe	= hx8394_probe,
 	.remove = hx8394_remove,
-	.shutdown = hx8394_shutdown,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = hx8394_of_match,
-- 
2.34.1

