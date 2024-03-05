Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51D8717AE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB40112910;
	Tue,  5 Mar 2024 08:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LFRT+FT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A24112910
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso7540660a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626339; x=1710231139; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=POVvCdCwqgBsDTzLmq+xlV1vSpeRHUQ3tEhlOTxlYcU=;
 b=LFRT+FT+IEf8yV+WULkyCENAWdDRuvcxAK0co2Az9KYdDtqz1cxF8Bj4wCX74VMHMd
 TVFhnx9FaANi99IUlRATlAh1Yyx6WT+qpVvyM8m3aVkbNisnS5iWdkKsmakdqMAy7aTd
 sJyage65ApfBy4zGwce/gz80zJJCNFzbgQi2EGoI0JLuIkuv4MfqTDP6rhxsESsHIOfF
 Qu5J91ZVqomW31xmz5asUfIt+9lN+dVICA3EHmKfUTnA6URSP6S/D1Z4t6xTAx31ZBlF
 OjsYLFASF35LKxTFSZDN+62JfBgTLVHCv45DG8v0qKO0ZZRhQlDTo/HvHieYZB7ex30t
 vvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626339; x=1710231139;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POVvCdCwqgBsDTzLmq+xlV1vSpeRHUQ3tEhlOTxlYcU=;
 b=dSbnJghTmKZg4kyUC7yk4TbUGRI40syCYiuN443b5nKtRiFFexM2/96A5s5Y+/hrpe
 oDandr/TeEJhkcxc5dijNqYTVgIUNRgJ2IhiRLYrm/CugRfUBVPLNvrsHrHVrQ4WkQtW
 iApSUxoT++gZbx6hH1pUr524s1lLXz69vZ12EwV2f3QR2wvJ53VtFlbsu/s9VAl73IUu
 pTRepHXRJDQaTx51wnfpid9t6+3434eHzysIjqzy06bfl244x2MHScvE5AqXN6M164bI
 ie6z4yz+miUDG0MeNFOk67MDSF3tGlfoBtNjeYttlsq+jI03zZPFgRw9gAfzX8v+safZ
 tDGw==
X-Gm-Message-State: AOJu0Yyro0kXMZPy8vr0Ae9/uDH8Lgd9DLxAFIOyqKULo2SX/UvAqnQE
 P6PyfXvdEd2UAkEvYcqM4HIzzJQg8Wlhwc6wWYbtk6wsCLVunrHzn1WyhaKux9o=
X-Google-Smtp-Source: AGHT+IGOwgFjm9p+7mY8WcaCSk3d8VXb2bBW8TuCFZ36DSxBXROjoRrcLWhEMUftUIgCJZt6zZLL7w==
X-Received: by 2002:aa7:c3d9:0:b0:567:38db:8076 with SMTP id
 l25-20020aa7c3d9000000b0056738db8076mr4309804edr.21.1709626339498; 
 Tue, 05 Mar 2024 00:12:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:11:59 +0100
Subject: [PATCH v2 4/7] backlight: as3711_bl: Handle deferred probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-4-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rLcNWyHrJ59PgQVMQdROdn158veQsUOWpOpARELHPHY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPYiTvjPqEeJttKrU7WiswuUE0dpbgygo9ZR
 33m9uiM1euJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT2AAKCRDBN2bmhouD
 12YgD/9IXBNCquP3bPqgvY8F0d6uhoxY77XF+TciANVjhfSwKpU37EewVGovz0Iqnt6HWaDWN6j
 F21SWV7MUAEoUrnIsLHKojTKz8CSXamKEGAjPAtUUXOMgjFneB7r1biTAbhkdeLR98b4MUJOdel
 816YAtPIwC6d3RgCF19e5h8rGj2fxWNnb/qJTK/DKsNNN8L3m+lczzFyE3aFdcEcW/IrPEFlZ9r
 M8s6i3GDwbVINPBfSTKmJLYUJyLuyJiohQTgzlU7Nkcp6G2I4ufyiAmZP8/kmMG8w2ZAJ/M3y0e
 PvQ1z/ZuFfFqLvNZZiuL7IkG5UQJ3FVLtCIsure9tkDLyGUNsHIFutW4dHczc9HvFvi9pVzt6LK
 7T6rw/26yrYKfCaBJEGn9zpVaxiAIl2XczCIo3Gz5Aygy/8U4p7y+oUa9qUawoutjLXtTCDbKIt
 OgbZlnYagsZCtaQGiMG5aFwX586KxBz9a4td3TUSq7L1Osa1d93WVbNetGeaLTTfoB1Rsu0SnSV
 YgXBWi7SbTL45BS82xRTGDrf+jctkC0oVC1qQELCRTwBzwH6QHUzn8lBPh+mJgViOMMWlqTpblo
 xumCSjPITNs0L4Yz2T6PqFn/0xK7RlnvQbgPxII4GvtnVm4lCbuJ0yCedULW9uBWchL02hx8wbK
 R9FlO8clmcCQD2Q==
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
 drivers/video/backlight/as3711_bl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
index 28437c2da0f5..e6f66bb35ef5 100644
--- a/drivers/video/backlight/as3711_bl.c
+++ b/drivers/video/backlight/as3711_bl.c
@@ -383,10 +383,8 @@ static int as3711_backlight_probe(struct platform_device *pdev)
 
 	if (pdev->dev.parent->of_node) {
 		ret = as3711_backlight_parse_dt(&pdev->dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "DT parsing failed: %d\n", ret);
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "DT parsing failed\n");
 	}
 
 	if (!pdata->su1_fb && !pdata->su2_fb) {

-- 
2.34.1

