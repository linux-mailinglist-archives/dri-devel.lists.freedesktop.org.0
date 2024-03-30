Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F913892D10
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0544B10E646;
	Sat, 30 Mar 2024 20:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OfnoDej2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FFD10E4BD
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:30 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33ed4d8e9edso2311702f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830808; x=1712435608; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PJTxAUN0vGoMH7nJgQ+DaMYINAW5H4gp4U0ZtpRjHrE=;
 b=OfnoDej2u/L7rUqKGH9mvEDKUNDR2/z4mU6p1COkoUVdzRXuUByZ1MfbagvcLwfMgU
 Ak9H8oQeVIITo0mo0Ro3hANK0qO1owOSogZUEBkkJVwK3Usp0rRNgvlfalN86RxFeMrb
 R/J17J2grpTBp3AQZTEmzGfohNcXtIxRiRnzYKiE8Kr13QlWqT/bp2wIhRStl7kawluH
 /l1ouJD0gadofDviNbTgsRwgsvXBWARqdFYe8rfwB77Oft8UcJMfsrkbcXh4ZmCu3J0P
 go9GYvpr0ebXcpC/Qdwkb3Vv5z5Xod+evAQGKXUyxqZqw5sgObwIgl+GLzoW1Qa5Sqoh
 NAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830808; x=1712435608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJTxAUN0vGoMH7nJgQ+DaMYINAW5H4gp4U0ZtpRjHrE=;
 b=rnYXID4MLGQDFZs6j9SCL3zzc7hCj+8CiSESz8Qy8CoMxVXxiFsMr9a695uaz1dmWf
 ukVbfyavV7yH4haXHlaIZ+Bj323SY6m6IRDHsQ4Pt5DeOO06LWhzX2cokUCBZ2ih66W/
 ggs5N2K71iOaS5DPY4/wwJoa8jb9vstBSl/JZ9yT3kdL6xx9qihqkGB5cXX7nKYChTAZ
 BzkIzd2OLKQtjyZlMLjtttJtQkKD+DkzLBa/u/zu8HVhUh2C6prOkkzACX7L+K0iCKdE
 kruJHEY0mcdMLm2QciZGdBViv3tUSiauuGRHr02aLtKOp9UNL5DJBpbz5sVs3MtRXMQr
 Nf+Q==
X-Gm-Message-State: AOJu0YxCtDlYHEzAXCOPbxGfrvmn0/1h6Jg8ayhbUJ2bk1hldqhU5Qhk
 AIvxuYtfzHi6TPJWGR1F9ucQxpnsdWcD38UK+5XX1vKi+Uvc89/FEDV/ROf+YZA=
X-Google-Smtp-Source: AGHT+IFxQQijUVcegod93FCFGv8cw1dxNYvym0KjEdok7UHQxBy8zsgoRntIK5eYFhLZG57RYUCMkw==
X-Received: by 2002:adf:f541:0:b0:33e:c522:e3b9 with SMTP id
 j1-20020adff541000000b0033ec522e3b9mr3296057wrp.36.1711830808608; 
 Sat, 30 Mar 2024 13:33:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:10 +0100
Subject: [PATCH 06/11] drm/exynos: mic: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-6-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+rmPcG4JV6iyQUX2Hn4oOFRCElJhv8FINWMmM2WbyO4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcJ5k0+d3ca3TO3/w0FDMkZE8O8xf+Hu4Szh
 ewMK1QPAyGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CQAKCRDBN2bmhouD
 13C6EACKeeh6w1JkMKnow+vqi34knY2zmKJruFipBrXww0Xx68+bYUI19y//5JMwB/pykR+wZdy
 0cP0Xm/L3D15URlDZrhRcdBxEq1hZtjwkS8oLb+zQ6+cjFfX4ZXmItuIS+8j/ywvydgCNHHShbA
 zyLN45u7uzgmJijin3AnKCediRfatmVvBtKdAaUs8eVPOGtnGcu5a4J0WtxGI8LoC0fv+5UIlYQ
 OR66+6t9O7wWzN4JDh/0J7G2tTpj0FfUKnVSxQmTR8wgIFC8aSlDCpLQKkC+Fm+1w5WY/8U5Z2m
 GJgLc4Jn1D/IS0dEHgRoE26rE+0X8zIj+F+GcYMvIB4WhveDwpKLkkhHOs+6RqKdbKqIjskkQYh
 yIhE8UJfB+/4zCSM8dDrILC4c2BOjxgc28L6ZdQ/LRuf3AS8OmUwOF3FdGFYLQ3Yx/PD0pgzvGn
 CMQSrTMDSsizNXLYbFDBBtldk55PtsgUxbZMvobimazAnE5sGwSreFaen+iPWVN5iOj72ncCNUT
 +CPsV3XuyJ/PWiGdRoipCtOFdWmuTbhJD5dhc7NWNQGaWRZYsi4SqSXN6r2YXqBjVTKtaViSd4c
 V9i3DEtMWeBa1pQ+K1aqiKV4VtUmI2A56UFa6rryHIlWdwFj6FUlkg2eHBjk/HMHpeoPMVSVJ4G
 +RdSlAYzRRcsyPg==
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index e2920960180f..d61ec451807c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -464,7 +464,6 @@ struct platform_driver mic_driver = {
 	.driver		= {
 		.name	= "exynos-mic",
 		.pm	= pm_ptr(&exynos_mic_pm_ops),
-		.owner	= THIS_MODULE,
 		.of_match_table = exynos_mic_of_match,
 	},
 };

-- 
2.34.1

