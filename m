Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8331A86FE7E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4228810FF38;
	Mon,  4 Mar 2024 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FDThCF4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A88C10FF37
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:12:00 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so701943166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547118; x=1710151918; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C7jNpD8JVN2zPECncF/JczEVQcdrOC4+lvPqKzDW3Nk=;
 b=FDThCF4Dgtzb1E9r8vNDH959okrYMxiLQkz8G7JWnNcLzO3tq++6rs3+7EUB9ARSt8
 HOXMsVQ4u8fAPeeMJfcAxq+tofqAu2pPM5SYbnjkXIGRGToBHlaefv4S3IdxdNX287Tj
 SLMRoC9SgT8wIiGw+lDw32+PTRenrEXu2nTP1BeUTxiWBD5g47UfRWH4NPZJuRg1mp2I
 NppuMwoe+jeNcJaEqQ/ZpAqZbHsm+AozOcgtDIWUpjr5V0fHRj7dShdvKYmSiObs9Egn
 esptS/O0JQHa4lxonRjhxYQ3t4gZ46jUfmuSnSvQXNxSJUXGHqAmSm8WaAUa8Fu2SMqr
 apGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547118; x=1710151918;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7jNpD8JVN2zPECncF/JczEVQcdrOC4+lvPqKzDW3Nk=;
 b=sgWcusSmD3Onie/+X/lqiPA7IGmyyvxIOa6rQjxFA1SzQ0vMvQqGqUUOQgzh+giW+C
 ID0n1cPIKXOjyifdxk0C2IdRyv29LqX0nWKvQSSE0w1T4Ssfm9jktECh9EKVI6gN0E8r
 QYd4mVFXjDbmtMgGsciYMHa84vpmXUpaX1/pV4nBPCC79aBcpYWtu4QIBBDLyFP/aBp6
 hAZ7jv1I425kc8oACiQVXy7puzej4VVtKNIucF5bh6hueEDIsTNgI0mpzAmHaQKL3IIk
 UBsp5LwwQwfikuaKo5WVdOC5OZ+B7I5WAsapEk2bYiEJveRxSH26j5B0iM8A2r7XdplQ
 9KRw==
X-Gm-Message-State: AOJu0Yzg3pSeCN66LODFg0RbV7L2diICqkSzVldbrhM1elQt9hG2mUZj
 dpyHfupyLa5nHSkMPIjR5YhlpWXFwx2TZ6oWAsUF4r7al9NcqsUwO8LSFFCpsrM=
X-Google-Smtp-Source: AGHT+IHIKfIPI9q/DWJfY1zams1q9M6IFh+MBVE0LB3ZesWC40W+rYmZ2rQFJmiyAV8Fad1klY2w+A==
X-Received: by 2002:a17:906:f759:b0:a45:6251:f8e2 with SMTP id
 jp25-20020a170906f75900b00a456251f8e2mr895177ejb.7.1709547118705; 
 Mon, 04 Mar 2024 02:11:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:11:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Mar 2024 11:11:41 +0100
Subject: [PATCH 4/7] backlight: as3711_bl: Handle deferred probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-backlight-probe-v1-4-e5f57d0df6e6@linaro.org>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
In-Reply-To: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tYiRyc4GCWh0OQZcegdBJotlKUvQmMppy24vmgOYX4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5kf3pCwb8HgUK+ziA6YZsz55ShzwCbPlrjj
 dMl2yuN1lWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeZAAKCRDBN2bmhouD
 1/DiD/9EClVTNg83B4aoTpYk6q3ArcCWKbx42PizR2X6dccHjBKLN0SzFYUPp8ZRWNevidleHfh
 hupUfnR2wyDAYPVPWV8dJtdgoXjqCxq1y/1koCVZDMh7rajI7WnOkS6+g9z8POlL19KGLVYdi//
 Namj816X6p+XoGcwG7ns1mStAJdsc/RkT0gkuAN42tg/vREKdLIesdNxqO6PHytr8lr0oL5Qlf2
 O8Spa4QNgRt9FIlVFBvPv/UGY2ZlDjhUaPDn+xoIlqoCUN843JiGiAncg6CY+xPxs4XxbyKLFGp
 k2CSN4qRLf/sdfX4PagBz5wRrLKEkHDITyx0lJZ8K9NiSCWBD5XuJAApZJF81Fdam+7DIoyxPLd
 MxNndDTpFtHki2BkCFnq4kcOzKukGbR2jN0qBgi8y3H2JKsAdqQO3kgFS7Bec5ltmWT/4Qjtu2k
 cgw3rNW0c8rrFL/RpfV7mfgnnkB1HTcrv03TWerMJVvtTZlnp2udLIqpvjLsLiFj1Rl6Uy5ugtS
 aZ7OQgZkXseN2eOnZy3iB6URxjsuYEjwfWQ2pW8y8Y/1L4Sr/qJHZSTPRXKfNNsV19TI7msionx
 gDk54z5VALicMkbhcQGfaMiLD1bzd2ms0GRYNQ9KOFTFKsIu+56uI6bAXtAnbN2p5NypV/7lJ4w
 O9o+19pX4CAdJ5Q==
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

