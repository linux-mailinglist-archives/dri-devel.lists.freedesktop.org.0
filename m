Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC55892D08
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DCC10E4A6;
	Sat, 30 Mar 2024 20:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yTHsJJ59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC15210E4A6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-341d381d056so1917986f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830807; x=1712435607; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WzQehRS9oRLFJRnmwyStVfkjm/N5c+OaNPBVlQqmOSk=;
 b=yTHsJJ59JanbwZDnLV6PBAnFa3FWaeLDwXHBLywb/hfWtDeJ/mjU9sp36dDlsvL0iI
 J4IcDjWg+mLPDigHcu7+/oH+r+05mTmEPufAoRb70Y6zKp1/hD8/BgV+un86cs/YLI6O
 K+eTcsO+bz4JdtrYLkHni8gfyroGIrkYU7/+oRjEeR3frxsUEOraNZV15BcMl6vcvCu2
 i7pZJEWwkY018wGt1nN0k0z6cDCuA65ZI23XfcBsMepR3M4BYwQH2rRJ0ZKve1PcDDgC
 W9blGy/qdEx9VbIM6I5obdScBFxmbfIEzbrB7e7h4pUl6vIdWLWhRVhwuO/VZ59SEUSu
 zSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830807; x=1712435607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WzQehRS9oRLFJRnmwyStVfkjm/N5c+OaNPBVlQqmOSk=;
 b=NT9fTZQOfps79JQv6ll5THsbLgreyrEvmODQpR7/J41wagIUHaXkHQ/PNX/qk/hmo+
 jQYDVt8PuKiHSC+t7lPHcjGjA7EexFR1Nj1fq6Vbm2q0K7RufbXCw+yVO3UqFcyP64EB
 GvBcgM9lUlFJcWDr0LNwQrg2flWWMYGhHyx40qX6Ds3jmfZ2NvnLlljQGu1ZaTnycLDM
 cAvrOoXnRT2BRet5PLqPsCvM15Gt8+5gymSkxYR3N3sJDWyiD5Z3CPuId3+xoVRksqCj
 JaFttJrkn6u20TyD0hkW0wbTWkOowb3zeaqpuyMp9GvpTFUwhjt0adHoM/44zuT3SmuU
 ZmDA==
X-Gm-Message-State: AOJu0YxQDfIB4O6OW2sX2TxXzR1R5n5o3b53K49/oKmTeRqA6sYykflt
 b3g/TLsmkp9hdtZ7uqUd4VpiAwBEaFF23yQD0d/uN2+BfZVH7nz/N/Mgmk+mc+Q=
X-Google-Smtp-Source: AGHT+IEJQXH3ynH/xKwS6TrPwsPJ2dWY81Swhh0Qq2irHiXazZOF2Ze9Wr7dZtzAxISlshV7KzjdkQ==
X-Received: by 2002:a5d:5104:0:b0:341:cfa4:6076 with SMTP id
 s4-20020a5d5104000000b00341cfa46076mr3412473wrt.25.1711830807311; 
 Sat, 30 Mar 2024 13:33:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:09 +0100
Subject: [PATCH 05/11] drm/exynos: gsc: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-5-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=E6DDT3xCv3BWpcxdM1wHQ30TS7jHa8YzU1AqhlUDJAs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcIO9ZBnFNNFpw3uAPbxJndhdtUQzOsYdbxE
 j50xp4f1l6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CAAKCRDBN2bmhouD
 1/KMD/9FHfaV8wiiiiiJ1mjqYTJdBvq/BIpsWaTeXoxkWPLe1M2IYDUzyg+27O5UsrPtxFKoT1T
 VNW7L9euxWmfA2Q0rN4CmkFkdA3ZP6eSYN/DBVGUMolHO4xkyrxh7QikdsCCsqkjHf6ABWneObl
 9EAMgB6nZFyX10RisLHBAuMfgD2bsmX+cUGwywssrB2MVn7cFIayhk+aSVRQUD+VEH6ewxPtMDE
 QRclDdApO7xJv+KhpqY08t8CCW5oqDik6zbQ0kincfF0yxFqmulWie/SXXXljdqpqqcCe8LKxQv
 A21Hr7GtZ3oWOOo81UmqmuaEfd1awp5YteWoUlcRBaT1J0ulVTJouxrGNVYbVheo5Wg+uJrlSZX
 sxy/oEMLblWjLdO3btvKngry47PK2uSVuva30SbUCOgMthO7XBBd0AXSTyrm3LRbUlpIjvxMLFD
 cT8sJlEWahwYku3sdTVzLWdlK/N+w6p0HPPnYAiYF8by2fylwDH2pyl99oKJ8sk8TNrzY4FjOOJ
 vzd2XHTVFCFl3v6pSxngP/4H1RwVzaUZlGtkxMez7ikbAfNF32Qkz3kHRipjuYGTz2Dy9hjs68l
 KTTRkqQMFNpdo11JjL+fauTiGlXCyDWrE6jioKiIsTIZyrQ1ZZzdDZnPcVG/vXDx3S4O9kM0W9p
 64gNWiv2OETCS3A==
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
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 180507a47700..1b111e2c3347 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1423,7 +1423,6 @@ struct platform_driver gsc_driver = {
 	.remove_new	= gsc_remove,
 	.driver		= {
 		.name	= "exynos-drm-gsc",
-		.owner	= THIS_MODULE,
 		.pm	= &gsc_pm_ops,
 		.of_match_table = exynos_drm_gsc_of_match,
 	},

-- 
2.34.1

