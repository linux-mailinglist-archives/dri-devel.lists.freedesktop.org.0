Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEC892D12
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1BA10E695;
	Sat, 30 Mar 2024 20:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UbNE7HN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1540410E14E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:22 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-341cf28dff6so2198957f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830801; x=1712435601; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qxXsLaV/Jp0AuTCoy11lqfJYU7SA1bxHTVlpRCdXP0o=;
 b=UbNE7HN3wLEM0gYQx3yTrDVi/nV/3ZO/khNGvgVgKfWaOg6eCgoAAeXtWKa0MFQLCW
 vRZk3yVcq8khFcVsEHczNZYyepS9DkWmQI3jtLXkCFiajPJ304OeBndzEYJU6iu5TB6A
 g9Oc4Z3cUfiQhjfd4hWHaJUiz/rKnwVuCkVy6vQKXcak5pQh160JlsGitq1Fz5ZskHVd
 VnHYT7NLS02jtnciLXr4vNvUMNASuqGzaK9cX9rXVoUtgy0CXThFlujp25WXyYuKa3cj
 oxFHAnGRlde5dPleJw6FWigxg3d0ZByNaJJI+MAxFDpoIOZjdx+l5Y8qF2iTJeJZ/96V
 PDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830801; x=1712435601;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxXsLaV/Jp0AuTCoy11lqfJYU7SA1bxHTVlpRCdXP0o=;
 b=njb+q6B56IAXR4fEVonnzh5iqV+Xgwi1tpJYqZqKO+/DIitDJI2LsoLo7EcN021h0W
 Om6c7pRaMdMDR1Og2z/6BpHR7lzlM4PRt1fp8JosvpEZd5G//DO+hdS1JCTgGjJjRWWj
 0D4Lq9hIl5xPnWUrcnCiHF5EZPCwrm1vCYFRCzaG6oOVWE4NnfXBcNJROpSAR9+NTACr
 cfvgTdO3KXQwsHwkBtuyt9pLxYIxVOtt4zqiIAHju0yBoHQFZwxF7rQ5MlSKkhCJOMu5
 EpLpL5DKn9Tjks1PSnJojzVOKsYmsZQnWsaWi00tjO5mT5WvJwJessB/TS9O2gsGSmuD
 tFEw==
X-Gm-Message-State: AOJu0Yz9BUngfTyGC37fv6CtXxmZN10Ip28r1Fo2NePpUQy+QcwJvW0i
 EUMpkIHNFTOPv7dAdj/DHYSExM1GapuNjmSKE8kI+/7ehy7vUM/WPNPHVRFxGjM=
X-Google-Smtp-Source: AGHT+IHN/nKCm/+Mnbt3kT5922it2JlAg2uTRVYbLIOJLEZ4YrvuKM85wtb0sB8SeztSNGtLyUBYjA==
X-Received: by 2002:adf:f747:0:b0:33e:6efa:757e with SMTP id
 z7-20020adff747000000b0033e6efa757emr3751670wrp.22.1711830801306; 
 Sat, 30 Mar 2024 13:33:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:05 +0100
Subject: [PATCH 01/11] drm/exynos: fimc: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-1-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=815;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RrrYKA/AFI5ndy2h1Lx8b0hMlMn5qR8304zzYvRKNZU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcEZEHDFpKCTeyd9y90cBj1gZxYBm7I4YGUJ
 Sxemb8fceqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3BAAKCRDBN2bmhouD
 1xT3D/9zXrRAF+TmbzdfPV40breUzsBxyRtoc1viFKPZ51qVOINcSfgvasG+FYOE3m2Bsv2/cN8
 KohEWM0YcyH9ILS4YFz0hWOAKxLUARJWIocN+3ATd3BJvuSMoyfGaasvvgHwVXtKDM5hw3rJKdh
 O7AeV6fOH3/OTjgQ7sxknMrTwLDViIzXTh81p45zNgd0Mmn1Dw96uWp4PNIztsV0JzChNgt4/jp
 FNh9xntzf6pYgkeupWD3bCVV0M6NWmkLQMARj5miXx+zdAibMbIYK1/Q7etUCFDU7aKkQ/RVa6n
 GW9T75h9zvmdC0hipz2Osc7qAMOdBgJ6/MchkpZIf0s5XRApNgTtbVxv5EhZ3hJbXsKyFZtAdDg
 kT470aNoLsY3nxcwuVCntfrB/8Aay7japfstnoR6qOy6EV7AiAsE3CHX7E8LS0Badjz+ItkmIj7
 hTpWAxe3Pfk4vV0zoofqYyY2kuAW06VgxtqlmoCLg+OdIIhnogjnOsH0byKZ3r1uYMlxWM213+1
 xAuNnbwqLJSP81BX8vhQgTu2nco91Ks2a+bMDOlGv1rOWy6XwNUm/2OBpqFtFboicqooI/16MTh
 edSgCFuJtOwEBbhG7PlFWD+OJ/YAFRjb/08fGmD56aMZDjGayokHjEypvUisIO2AyDwEv1Uj0LD
 6/l2Z3jONE8VGTA==
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
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index e81a576de398..142184c8c3bc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1412,7 +1412,6 @@ struct platform_driver fimc_driver = {
 	.driver		= {
 		.of_match_table = fimc_of_match,
 		.name	= "exynos-drm-fimc",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&fimc_pm_ops),
 	},
 };

-- 
2.34.1

