Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA4892D17
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D9410E5FA;
	Sat, 30 Mar 2024 20:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KxJFJcCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0F10E4A6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-33ececeb19eso1742346f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830812; x=1712435612; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=okXcxozSlQaij09cQMnZFJDIm4akho99cwdDVwFRPRY=;
 b=KxJFJcCtSHNCcKveVbgb3YK7tTyuE9sUtI0y6jjG2WukfdsUYGBaoftSpVvRBxFaHF
 FlODmbsBLkJAkaYqmUeNG8tZg+Hng4blSXiymOwjRDbPL58BtoY3Am3RX/WlFCze+Zo+
 vwRkS+MS+Itvm37jtHtgSrA+3OK6t+LLLZp1AinxvPVDgcF7IvCw5vAYrKVD6WKrn/0Q
 zWO637yfnWYY94PI+nnjGziTywfyhsIlGusGRMy/ljmaElHy6mJ+z3KI7i1z3o1PNU1r
 +KlbbL8YHm3v5dsS3nOAlalatWqHfv3h6kTmN5kYhBUsAnosM8O4/2DKFaSgh4BPTkQ0
 VstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830812; x=1712435612;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okXcxozSlQaij09cQMnZFJDIm4akho99cwdDVwFRPRY=;
 b=KfEDTEPcTKhQ3D3/x1GcNPSrsLAmQGBrGGkH0EIa6rqY/sx0/+xM95NW1xOuOuuiTO
 Gc8SmTy81Esyn6iVyB/K/cmvzDIi+a55PZD68Q5st20e+I6Hq/jP9o+jB3l6PD1yjqij
 959UTsiB2rLUtzLrzins8tdVLdfG2ZE4phQN9UmHIKOVRfYcTSNJU6R+kp8fUpVVLhXU
 blAUagjr4BRxUCwS11CUQ4onsV7RPZtIH2XUm1Wd9/pKm3eEAEZF2bx6xGTkeWirjAdm
 AH781/6er0PTDJXy1mz5f3JJ5HorwmKhl8pYs4FkAPkxtHijQyVw2nfw8CDf7GQifdf3
 JaVw==
X-Gm-Message-State: AOJu0YzSv/AyANpjLftXHNE3vmtc2wxjRIRvsHI3fiW64V1y6MrZOyZJ
 0mXIT/bf3KwAChJc/p6duflSyo3/KR5rEOPfdCzxciEqlpGla4N3mk/0XNk4VfH97e88xGyw1gw
 W
X-Google-Smtp-Source: AGHT+IExwBRR6ELoyteAMM2AZW4w8CR/HrFou77porojhjA8ckvKqLMd9dECVHqm4WmsmgahTvhvmg==
X-Received: by 2002:a5d:634d:0:b0:33e:c679:da6 with SMTP id
 b13-20020a5d634d000000b0033ec6790da6mr3566287wrw.57.1711830811832; 
 Sat, 30 Mar 2024 13:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:12 +0100
Subject: [PATCH 08/11] drm/exynos: scaler: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-8-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HRewJKROx6Nn0LHgKE6EsT3R6rrYRmwDKHHjjo48+wQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcKOr3YLYD5+4yT9hehw4TZ/rfZQRMW7yGMm
 I+Cj48ZCm+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CgAKCRDBN2bmhouD
 13qjEACDMauB2fSHi3ELii/UYDCIxSdm7lIwe3GbeuuaNXy/BOVfJ4BLMuI4PiOt8ibSVGKdL2K
 yGFTyCeWRGyAF6LuHdAxx+HV1eBOd2OQViUyV2Vz5S26aI+ECWbIXfyGxikGT+ycKfgvWW1AxvV
 LnLO9Pv6LBQvinwTaJcooAofnMVt/9n8ObNek+tlc+9I3KZrrxlx9/3uhmeBNql6FOEZBNPTG/k
 SR+6KUfAQioPnUrbHLAg9D9K3dyot/GeqbNErdEtp9WVPwciM+0Jle321GAu3XgXpHNLhTLZ6SC
 B/1lrHE6Z5ZzNY9m3OgPWcnDYjOQW+9U3yzwyp3jupHWsRmIUerDXVPlhO4gIl9/dwYAVL6aRs1
 FkZZOp0VgLKXVlArf5k5yEmjAFmZKTpXh7LpuTMK79PrTxXxrxTEcTI47AcQ1XohYu4MqPxl8WF
 tT6ecMgM4/1sWJ37MlvEopkMXBJLjZzpypXCDuTl1/TWgrF2LFKkReFuhBZ4rQ9a66Yq/ubyHuJ
 RoO7FJK3k/VXksypzy6/jQfWk/iwgmHBhgnB1t5yqlY0Wt1xD8lL5xABe2SOk6lHIMhxniEIoqB
 nsJ+Z0HWrudEPjT0xhKr8+glFNJIWv+AO/6woNhwTDhjh1K0OG8VFXwblK+DdH5fT4UY1AzhBZI
 D/yO/PcM0tml27Q==
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
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 392f721f13ab..a9d469896824 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -722,7 +722,6 @@ struct platform_driver scaler_driver = {
 	.remove_new	= scaler_remove,
 	.driver		= {
 		.name	= "exynos-scaler",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&scaler_pm_ops),
 		.of_match_table = exynos_scaler_match,
 	},

-- 
2.34.1

