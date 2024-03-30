Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F06892D0B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F357110E584;
	Sat, 30 Mar 2024 20:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Eg8VEXEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BE910E4A6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:36 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-341c7c8adf3so1989146f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830815; x=1712435615; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ONzs374y2ZZQ1dydMn/i0qQ92QOrtMdVepJ+YZpfIxA=;
 b=Eg8VEXEL5Wha+4l6sPkd/mLHvEi3l4W1T1r9SkJOyp0EbrYKxTifttZtDKX0/j4WMb
 LKKgtJnVjRyb+f04pVcpKJpLMNOjeuE+pu90C24nRsvFw8P1gD5LK+YpElYZg+y7z/Ig
 g0aGAvcjwLSteKtysPFNptz1Nw5ydGJ1NF535r9tuBJq0dNJ/1+voIIDChn6/C66E2qe
 GyPSlpWFQwpUJYR9LDqW4L7dqPI7+T+YoKknp14PEF8vZ5IObOF5IMds/WiBBAyqzW00
 IV9trh5PhyjRCnumZDIMpnpljnUW5VdxKc46yytcixJDNlV0DraYapWtQWB+d1la4kog
 5FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830815; x=1712435615;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ONzs374y2ZZQ1dydMn/i0qQ92QOrtMdVepJ+YZpfIxA=;
 b=vugw68/+HyfW2YLn73Z1N6jgW5UMyADjKR+wImJl8jVNo3+uPHpuDCP89Eo0pDeOYL
 AmMKFEZnnOUAZ3A96zSO5NT+CxrW6BQ02GJMRWAmhXWMEPDJBMPh6Efh6ZqrPpoijIEy
 1pto+b9XahdnMI4Ov5NCojapFZBpCAyMpQkMV0ktA4nzki1/E3Cufl73B3ZKmheYQRG3
 d80R/v2Qs0L8XO1w4LW0aEGsVtzRETCi+cHqbgAFue1U3zbONTbQSg0MD3iC/iEhX2kn
 WgNekgvBWJhGYpDUwiq+eZGP6OqBTvzlvBX0bCdXVKOpuvzncpOLzxtoc/Tze8wOcv7s
 i5+g==
X-Gm-Message-State: AOJu0Yx1bqT8jDv0FuQJ5TIQ/ZS5I1hiEavCHuBC6UoPNV7+nf/iKv9G
 3RGLxfguc2HIgbfOAYLlyplnoArqs2R/Nm8azI0QifaJBMhYHOI8+41cJbb4rn4=
X-Google-Smtp-Source: AGHT+IFk9Y40VlFC3fq1m4LPmsbmadOu/r9RP0QX6ioImBx0Z4DDeukF3X61ng8xjtDRT4Kq9PpeFQ==
X-Received: by 2002:a05:6000:366:b0:33e:c389:69ff with SMTP id
 f6-20020a056000036600b0033ec38969ffmr3102277wrf.68.1711830815031; 
 Sat, 30 Mar 2024 13:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:14 +0100
Subject: [PATCH 10/11] drm/exynos: hdmi: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-10-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MRyvhFqUHJTCwrqcUOctTIpVc2d3BqgjKqNWZ2ls3sM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcMu3ioGpIwgAMlPdiGBxDZevzR2aeirZ0+c
 iaB36NGsjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3DAAKCRDBN2bmhouD
 1zA+D/9PczHqQtk5Gt8jztAK2kf8QbuSCt+Dws8ZWR/QbuQ4ui74Zz3JLDzhG8wFUv6EbWwbMbr
 c/7H5EvzVIzWvqmjQFBZ0g5IPxNbSm0g5MY5/SJLgwN8XJE+/QHEo8iCSDAp/YRqAlzIbP+ez3d
 FPrEusO8YhnH7UHZCCfXPAHy+bISnorGwlOeTMochJ1NseuvOxI38JDBiJBcJrhfjtoZvUgcuj7
 SgMBxKLUYayOlBRGYX4wZAquCFnWnsgVqmF8CdvVIjaXt30p6BNfhV6aD78yAOqJGRo5soetLmE
 l4ygzTlQPlKF85TYu3KcGNO8NnF6OdTadTaGhnFHtaSbwnQJ3sa9LIv0d3zED8XVYzFf26nWQTO
 v5tnHcPR3Ypygt2BRHM6jnFGRcgxeJfkIYcU6LHkF146LtCK+T841Nm9bWGJz2ZAj2IFaDtadXS
 oNHzeLB9cTmoNgonteLxocojXJy/wCoccYQ0AxjN/u0kASj1eVovGIDAcMpeWzFfB+fPmcmzbL4
 W1x8btFvmTnQ9aKDtfZTPGAg41oMPXR6VvwkwHIE6cxgWMAPIGRtRr2PCSK3xZz8E0yVv5/zZZU
 s7ACz21ewNS+C0tcGK7Jpfh7WrVgXkwyi1CC3bt3+dsXKJKl/FhZ/ZIrq8WHqGMQvigbEJtnmra
 vCiindfJ5PCitSQ==
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
 drivers/gpu/drm/exynos/exynos_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b1d02dec3774..5fdeec8a3875 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2126,7 +2126,6 @@ struct platform_driver hdmi_driver = {
 	.remove_new	= hdmi_remove,
 	.driver		= {
 		.name	= "exynos-hdmi",
-		.owner	= THIS_MODULE,
 		.pm	= &exynos_hdmi_pm_ops,
 		.of_match_table = hdmi_match_types,
 	},

-- 
2.34.1

