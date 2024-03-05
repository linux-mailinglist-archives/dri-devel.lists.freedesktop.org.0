Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C58717AF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07F4112918;
	Tue,  5 Mar 2024 08:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B93BeP3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFFE112913
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:19 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so7375575a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626338; x=1710231138; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SGEzMDVs2SuhSNZcHsDkwLnjMMEuR/jN0H7FBJN5bdE=;
 b=B93BeP3xrFFnQGqCHs6LBX5RBmoZ6ha9Uy/WqyhOHfEk65aOVHhfVb/yz0NuPZMDUr
 7v3dt+jSXUW5mmdUJnhnAxP0al0UzyVUTYSkEkvWhY3VH1jECpXqfzkgl+vDClSo07V9
 VC/cqVGZqa20D/V4tTqBgZf63/5/fxvXsLUB1htj7LRreOA/OHrZenCDLkCCgqz+Enc+
 +KXZRPkF5ZIfkp2ms6GzdyZ+Bs73NImrCQ2fsOca+j1Uo35gW0y77StB8daY9Ga/9GKT
 ao5hrs0SUsIdFPMbzInavMxrJihz65i37La90pTmFQ4RBzZ1/Wm9rRXx1b8m8eSMmNxf
 yGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626338; x=1710231138;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SGEzMDVs2SuhSNZcHsDkwLnjMMEuR/jN0H7FBJN5bdE=;
 b=qEpnp9FH+YLsfyZVZy+Fps/aLb8SnDz7x75gk5GshLUIwlRHVc+fZt6AvCkrpLa2qJ
 2Ku9nz72I8kYPMr64sdbUXcSFV36Xpl8ObnNs+mZfTFZCeuYelcpVvUPnzRHx72EmnIP
 I1czAYQzyjIdEe/bHeurlQWVEDh/AuIVlQvykqofc+g1EvlohyoLiVOPwu6Zwa85n2PJ
 UXwmwIAQkmsIA2AgoBqSCIDTUuRE6UhviVHSJgu9AxuZd5xMBi7Ygph9i3q74u8Cdvcc
 qZ537gRyFom6hs5bTkNdDHHmstGmmrfeqJLTJlYhWlbJcHj3InVAZvxfzdLWLidwWBPR
 haAw==
X-Gm-Message-State: AOJu0YyNdjk4aBHu8jy9Hs0Otp33cHreIsad4u55c6n9teEbJQMkXN8l
 xUtpiuDUWRBWkuGL+W3kdwYdTloSbFJuMv7UV28OjGooL8eyNG/T8OaDuyQSaIM=
X-Google-Smtp-Source: AGHT+IGPoDsTMtd30w/DOshzWoUEHpx/Q/pa5sDpp/arpdkYcoyWSkhqspl63v7mKF9KA18tbb+Y6g==
X-Received: by 2002:a50:c88c:0:b0:566:44ca:9f5c with SMTP id
 d12-20020a50c88c000000b0056644ca9f5cmr6893675edh.8.1709626338138; 
 Tue, 05 Mar 2024 00:12:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:11:58 +0100
Subject: [PATCH v2 3/7] backlight: bd6107: Handle deferred probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-3-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=utYDuw34nGuToY7y1IT+NIEhf3NsXvVlpcJR4JW2mxc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPX0BTP6R7BZf+T2A19wNFHqlTtCuGUa2M9E
 W+LsqYM6eyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT1wAKCRDBN2bmhouD
 17l9D/9V3Rtsc9kSl3ihhdhQ3TA7WjcTHaWmAnmked6/2v/yRSimxEfAaz+db9sq1EZ23XaHlA6
 ICFtKCF/SvSGy80HnJvGKX1Th7Eem6h1onaS0Zip0WVVyrRzkoIKYfLbHRge29FExq6ycEcDF7O
 5bu0FL7MaiwjmEbP7Kyb57n+Vp0V/FUbVMJz4dk4QrVSkZyJfUa9PGjURWJN7QZxVgFp2ntwxNT
 tcnLYB6kr4o9/xezchi5rX1z+tRx5cHZZyr2KTDqRL50k6xeE6lL3WYyfQNyNaObvGZeuAn9rbA
 TOqHm44+n4QD1zGM2jG+9qTb3MCttYy3J3ix6WXhUl2VOzA3IUYARp7Gy09+r3EH2JDwWAHWkf6
 OrNM3MxYy9jAmkXNxPkcOoHxm0Mynoz5IQlX9kwcwruj1Eu7Y+rSgjrd9hg+fgc2CuNsb/VPkR5
 Pb2gsGKYCLQSj3akNr6JTu7T9ch2H+scaP40a169Nc5mjwqXNWTqx5vw17OjuUy3+xYkFmS1QFc
 tnLVTBhUXjpum518RA9w30D1JkVK5K82wlOAKZdiwgZ16oREN6NXUIOMZwXW9zsQu4X+ZL8SqXP
 IOa1VEKXQ+H9MIVu0sgGul2COHGnhRJgbOc1dJZrgbXQ7WS6XOhzflJhcl/ct4yrxqnepmw2Dxh
 MgoyRlqN12K8NdQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Don't pollute dmesg on deferred probe and simplify the code with
dev_err_probe().

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/bd6107.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index c95a12bf0ce2..b1e7126380ef 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -119,7 +119,6 @@ static int bd6107_probe(struct i2c_client *client)
 	struct backlight_device *backlight;
 	struct backlight_properties props;
 	struct bd6107 *bd;
-	int ret;
 
 	if (pdata == NULL) {
 		dev_err(&client->dev, "No platform data\n");
@@ -147,11 +146,9 @@ static int bd6107_probe(struct i2c_client *client)
 	 * the reset.
 	 */
 	bd->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(bd->reset)) {
-		dev_err(&client->dev, "unable to request reset GPIO\n");
-		ret = PTR_ERR(bd->reset);
-		return ret;
-	}
+	if (IS_ERR(bd->reset))
+		return dev_err_probe(&client->dev, PTR_ERR(bd->reset),
+				     "unable to request reset GPIO\n");
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;

-- 
2.34.1

