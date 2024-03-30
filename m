Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87F892D05
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6510E4F2;
	Sat, 30 Mar 2024 20:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sOn2+KHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24B610E428
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-341e3682c78so1733943f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830804; x=1712435604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=clpsgKia2XerUP4HrlmZlIy54Q7jyrtNTsV1ZOiogC4=;
 b=sOn2+KHxopIXOJJxJg5LbAn54cfGzvRbtAjoOLGElAGqHlca3lL5gMariQ9N/L1mZF
 Ds8GJFtEY8/QEtHYBVEbDD6P/cSBDSfC5mQZO7Ox+Z1YXEdW/9xB9/zD/JYupmMo86w5
 +uFYlkuyVBxBniQxeHktNB4RpGtYckTvfFHOcVGDkY74oaCAIZ1cmPmvt/tBXTXbDuRL
 wrE15dubS1j+14PmTbgwSvaUekQepb0lIRVf6c8Z3kjfwkoCIb3OW992nUSes5ZBob7y
 2tiHZMvd3jfZk2CtDfgYBKpunHOcznizYg+WHKM0O1GUPOfHqyPZvKRP9g7UxzAQflba
 0ahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830804; x=1712435604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clpsgKia2XerUP4HrlmZlIy54Q7jyrtNTsV1ZOiogC4=;
 b=Erpm2dW06NqSJSbPuWkmflQf7pF+vrSyAa/FZxRfRdbwpbS7jovqVPET5SZ5IJeyXF
 BNowytoXqIYg6jjGOC7f47SWYmn3N0WJ/FSUWUh07wlv13EnNqvpfJHYCeZmqavBaGHS
 cLNWH25D4pjM0doOsga+VDdqo6eg4XzKwyadS4PM21ZMYD8IpNoFc1UKvgtUpAN61N/W
 lQR7aTGDBvJFAP2IGB6fm3xDrYxiuv1qMDD8/gR4QVjqa7UVWVEOXxpRcsuOQ89Qgx8j
 STovUtwZcgOMcU+51AVv9ceutUWLiuFyc4usRPnxUJQdPmf3AODeehsWWa2F1HjIhO6T
 DntA==
X-Gm-Message-State: AOJu0YzDC6GWGSsiXSzg5L+OB5dYMIxEktrbgMlJRMGDNRUHo9cY5SKD
 lQ4RoWyC30yn/ZjsfCMGi4xdrgLhVKd6Aqzl8814HtKrZETcHTFmCyvm9G3urZM=
X-Google-Smtp-Source: AGHT+IG8cfxx8ygvJDe2F2vg6nC7yHE1iwGECA3+RNlyBj0C8IGiqTKwAh1xjipjjTdWA0R0u2LkqA==
X-Received: by 2002:a5d:5268:0:b0:341:bdd4:aedf with SMTP id
 l8-20020a5d5268000000b00341bdd4aedfmr3351086wrc.25.1711830804308; 
 Sat, 30 Mar 2024 13:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:07 +0100
Subject: [PATCH 03/11] drm/exynos: dsi: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-3-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KoVaQPHwcBE53K4bT1O+VFU2Z1tadYOC4fUf9qvhKG8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcGyRD2nb2Vdn95Ldfkr93QVk0HwYc7oj74z
 du1HvkV/5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3BgAKCRDBN2bmhouD
 1wHQD/oCjZnIWVTfsxCoRR2NKz5MjOixUCe2W3gvzTaphlnVtY49l4q0T2HhnMn5ndT3TuzkY3U
 rCsahA87PNsNHNpnTrPil7cPzmJygJ/PWZ8V0azkCFSJaede64TvYkZtYW7Rd19Y4//pkc/7T1a
 Hewc33f071/LmhhoBwsUuDt8CBvFR636Dbi6CAHUPCAnjRfzB5O4TI40JfNpmMXXZ9V97e6gDmA
 J6kuniX8LUIvZ+YxC9zM8QlINOqPwxrADOTTD4r2jyuwlC6E0ZDAFxgklRrgofOwKR8vzGnYYPs
 0IybqLGt8fh/KKnVFdem2zTWbg5ktwAyVx9I69XlT/KTGCRRrs6OOy26zDI1xVivaVwiUCNWgzz
 ECpUyZI32IfbWDqlJkS89JZFleOzJcdfx4X+ysWMiUnMZQfpMqRJpuYWD9kZKzWKCeak6xHUrxe
 lCp0RnuOS1qqrmuUaz1QaRNrPH5mmunKOoe4AQ0jlEahpeXtDtNKhq+aoDosWF+7PbylaRtFS7N
 HkVZOY59/7Gu6ABUaLnbgpVU5m+TRAzBALxu+alySkZxqN0Yc+QnFpa6PJWG8SNv/tn38zpqTgj
 v/YViY0E/UkGF84uyvScclSxF8QFW96x9kAsIv6iRtAqDfi7gbKtt5xra1wp7cbFlA6vWOFIJ5M
 f7t9EzT+L3WguBg==
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
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 2fe0e5f3f638..bf16deaae68b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -184,7 +184,6 @@ struct platform_driver dsi_driver = {
 	.remove_new = samsung_dsim_remove,
 	.driver = {
 		   .name = "exynos-dsi",
-		   .owner = THIS_MODULE,
 		   .pm = &samsung_dsim_pm_ops,
 		   .of_match_table = exynos_dsi_of_match,
 	},

-- 
2.34.1

