Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F3892D09
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537B410E4BD;
	Sat, 30 Mar 2024 20:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wge/M3Gp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAFF10E428
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so1990975f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830806; x=1712435606; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z1D2GKKtgBLQaWU6UCZfIYuzr/yBjzb0mw3ATsAKHlc=;
 b=Wge/M3GpP02UVCb+Wj4+w/50MuvF0EecINasnOXY/tG1JulPIHu23n2kWF5lge3016
 GndarjxeFthnBLPtHJYrieTvFEUN6oQttvGml6hiyUmzdt7fkjVnRg5hcpxQTUfRMwwl
 8noLQmRt4FYnlMaWb+qfEaJjJbFDvtt/Il+MX3PU1E3T5bOrvEoNaZBnqxWH+G7pBHIK
 vZaCWlxLH0ogKfohp1jK5T9rmh2EzFJ8SB5eOj4518FJVEyro017GhC8K1/g5KTHgVIE
 Rjq5Mz5G7z/H0z3AGmzwbjCymMLMN9BmTNoiZLxupG0h5giLpMyfwMlhU/Pq9pIVptb5
 WffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830806; x=1712435606;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1D2GKKtgBLQaWU6UCZfIYuzr/yBjzb0mw3ATsAKHlc=;
 b=RFJO4X5XX33ppt0uF4ZH0Dd/jtvhdWJXGKtIx2oRZv5v37FZ1D/eBhwgdNdBMU6PO1
 Q5P5onFihOgRsTbiKwillSuk3vGc1D6Ekb0PXhuFZN95lCd/82qai3o4HcLjZ1tPG6jR
 iKu6AQ/Q5zDqDAIRS/Uq7XqELDE6DANvON8bIAj0hWgNG8SdvwP9jos9cJJoUTBe3urk
 DbYLm/Y0hAndSxCarwp/8NfRXG2Sgr76xO6AGUyvcIBRTWQBa5V/s4w6nrdzflbCn4EE
 NNVDcmBxVJk0eVaHUae1ES5lxbrBSrt4Nuo9VGdspr+avJAp4eGpl5SgI4a3JDQaufJ3
 pxAg==
X-Gm-Message-State: AOJu0YzWPm9jwS5mCFoxpp+beYCIrMyPMzWH/DuvTPSwbyxJrdjrLSED
 1/vePglzoOz2D62LjQslUFOuG4XGJYmZ5D0mnTJsdWh1G/B8y5X/jRSOoMop+Sk=
X-Google-Smtp-Source: AGHT+IGigQOgLeBcNolGJLhXejMHYggnr7rlgEmT1AFz4irqhKtcDbgROMKs7R/eC3QUNH6//jsQTg==
X-Received: by 2002:adf:e008:0:b0:341:cfd6:42af with SMTP id
 s8-20020adfe008000000b00341cfd642afmr3985234wrh.31.1711830805823; 
 Sat, 30 Mar 2024 13:33:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:08 +0100
Subject: [PATCH 04/11] drm/exynos: g2d: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-4-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tldT1/fBoaq2haWADAIe5Xo4h0FdGGOuKzR2j/SWneg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcHRsjhC/8++OmeIDCP4tqjryqtoKoVzciO7
 VIxxbv5MdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3BwAKCRDBN2bmhouD
 10FzD/9sgSJFn88mos0b9+dalUSJHv9/5d+greBogCsP4KUY+UK0dNbKEwexYK8uQEtBpG330xH
 huJDju4xA/490ixgB/b325Mf93NmO9wVJ9eK2yrN3k009JCGCG3cqlW0n9R6rIebI4gRiguDoPI
 L1s/jRlM/3B9KOyLcmiVR5VBrPK6QWha7dt20PcXNt6mOV1TUXuQHyGAygx8bqLplJmJamkRb/Y
 rj74/B6p659THl2KY7ZPdEaX9hBGaQNAZepB9AkKFNHZsVbkIVJoOUNy9sf0gps7RWJa2n24DUo
 7VAyIDFCG6LjAn0oEZNv7Vz0hcaIMnGooe18HoTA65RAdmXqaEB1xYaBPnUIaF1B8kDGay3da3e
 E7zJt7Mf0960ZZzPNkI/tFcL/5eBuwD8wJBjB8vpt8LyHU+e9WLPFKvZetDMCjmoqoOvcyjaqDc
 UVGw2dKGlwqyRQQBxFr719wirWRcErjCIiGqtu0GG+TMIgbIjhF4dNu4YC0myPJhTj1ykyiktrY
 2emo+1ANcg2VffN1aXXBOXGuCahFvSszjngEtGW7NrZ7hsHBnCevoMuIj+wFl/mk9lw7vWMmVzx
 2y7TFr69ken47MR+fa4MNGHyDqFeNNP/OcSG6y/tynCpDs6UQhjxfALtFwRXjaQWI3xsmT+31vy
 HqAZTSebw1ndfOg==
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
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index f3138423612e..3a3b2c00e400 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1610,7 +1610,6 @@ struct platform_driver g2d_driver = {
 	.remove_new	= g2d_remove,
 	.driver		= {
 		.name	= "exynos-drm-g2d",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&g2d_pm_ops),
 		.of_match_table = exynos_g2d_match,
 	},

-- 
2.34.1

