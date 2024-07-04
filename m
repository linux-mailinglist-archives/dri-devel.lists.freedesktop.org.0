Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88593927098
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F90510E973;
	Thu,  4 Jul 2024 07:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="2U+wNgU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5470110E973
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 07:30:23 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-375e96f5fddso1318425ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720078222; x=1720683022; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=njjqiW8Ns8mYNrJ80NgEfDcYprJVubWaVkRJskWAXIs=;
 b=2U+wNgU4k7JdFTeIetjzsSCh7T4vht0dD9SIfDXp5XGUOBhFDI+kuEwnDZAE9FbCn/
 IrzTlgpqwcv0BelVakNQmgLcdu6a+Js6/65By2pq6SupjfK4RQhr4mh30sc4Ihp7M+RJ
 07QihXQGOLt+yjJ5n15Hd9km7LuNuGla5VIIfUqJln12G8o4HbsHI953tyODzUNoqlZC
 GX/nQvnzIIHnYXxZpi5UK9kfORza05JCGH+4YO+uSiB6lyHS+UZAI33AziM7ZozDq47N
 r6XmhqX4GgmY0jMBxkVS0VykDYcTx5o5JKVecFu5rWOlFw7Qlspbo1Dss9w7qhsdaa2m
 tkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720078222; x=1720683022;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=njjqiW8Ns8mYNrJ80NgEfDcYprJVubWaVkRJskWAXIs=;
 b=QcxfTPfc72G8S8CMq5V4oD3zSFDTWyvqQFEhGlCz0wpbvYmNKgIthaICVp2dysfYfa
 N8K9Rk1oDeXin0kqMOKxQCoJvV73YXQM1gpydzgQ2N6YqRNTsTqRrmDjAgDTSHWsmavI
 7YPzO4hGL80I9ju39YSsx3Ot8WCXXornrMagaHQlW0+M8VMZM/71h5o//LNFNgXRDqj+
 5LbIAiMLcfKHjeMp2mvOKwtF1dG90qrVnJI/VGGisyUEnxNK77lVN0O1zkec7TS8WkK6
 HrqJ8prQLDew/TAE0Ta2aPTr4b3aYjLWQ605Y5U6+ABCuuLA1EiXpZHqceLV1Jw3TdZb
 4ZOg==
X-Gm-Message-State: AOJu0YzMP7ZqmrbeX70xO3qWXTupZk26N0enszMT13FK1Tw0x4rfCuwH
 G9HphaJE2NURXTzhWt/YCxSZIzGNhBYq4i4vlGPL2Zgf6uX3sKJKbsdl/u8NOt0=
X-Google-Smtp-Source: AGHT+IHq5LpUPHgza6khej7OkvBbetS3RDUKCfz4i9ClMIDyTpJOLGhpWp+pTp8XNe59IpOUtdzLfg==
X-Received: by 2002:a05:6e02:160d:b0:383:8ec6:6d0d with SMTP id
 e9e14a558f8ab-383953e2419mr12869495ab.0.1720078222348; 
 Thu, 04 Jul 2024 00:30:22 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6a8dbb2fsm7735699a12.31.2024.07.04.00.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 00:30:21 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 2/5] drm/panel: boe-th101mb31ig002: switch to
 devm_gpiod_get_optional() for reset_gpio
Date: Thu,  4 Jul 2024 15:29:55 +0800
Message-Id: <20240704072958.27876-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Switch the driver to use devm_gpiod_get_optional() on reset_gpio to avoid
driver probe issues when reset line is not specified.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 159e401ad0e6..9f225c15b21c 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -286,7 +286,7 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->enable),
 				     "Failed to get enable GPIO\n");
 
-	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_HIGH);
+	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset))
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
 				     "Failed to get reset GPIO\n");
-- 
2.17.1

