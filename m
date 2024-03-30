Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E747B892D04
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDF010E428;
	Sat, 30 Mar 2024 20:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BwZGuWtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE4510E428
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-341d381d056so1917956f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830803; x=1712435603; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OB+mZPgEXqLavq1JG1IoHeYm+GeMKprho4AeMvxB8yU=;
 b=BwZGuWtGWQEgp/tBAY0ivqVJLOt4qq+blP/cTivsRiZe+R125enYnOs/tcgIWtWxhG
 SwnbJVmm61L9uT8UwU9ZWDAbhvsx3AQmfYQ/AXydRj6/pnAp4TnqOBINgQtuDOhVg1SJ
 GLagxXrUP9pgsVFd7Sj3dcMvf6c8MXiD60LATfjCgm1pUK7faNqbthJ3YnedcMEoj+0T
 1vnh/HSglcH2LaGHO6WHtxtg77qeVD6pS8aoy4YMxuGz3TC3IG8jWv+OrdnKmV9iFKQ6
 S6mlzdcB4UKgCa3JtXG3xpSK1GblekxiKhI3W80SwAaAEy1066sBLscr6f1CeG2ZkXE5
 aRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830803; x=1712435603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OB+mZPgEXqLavq1JG1IoHeYm+GeMKprho4AeMvxB8yU=;
 b=YtdYXEhDhatHbWUm5J9t8eovZrH40fIFNFtUtuAVc3nQbQd1B7/yQHcmC3aEQucwZF
 v+ugrdQzCEMfug5/9XZVH1ehC3yW24kAhyyhHlTqt6r7wEjygD4lw33bL448hPgNgF3A
 SdnN6D9GP91rWpSJnjxk47ZD+6J1ogS8SG2prDoLV+bM4+MjpymUBkPsVpwAam0+v1lp
 JHj6oqkQm+seVzqK4WpPIum1n6c3RUb/Eo8JvvoFP9mXcRDBoy8VNILZ3vOi8l1vrVdH
 1bbmtiDQXMaNsJ/WUEeKaCF5OSDw0x2j7gtm6MbBjOlYzgahx7yFUBGCL6jv1LeC83g+
 AZAg==
X-Gm-Message-State: AOJu0Yx7JLDH3gHtD8/llyz5lNt8XD+qMIoiTfhhhKOU2ZUfdHJssTbJ
 jgrShXR1eIyyDxtJZR1Bt0XfWPCCRRoNToK3KYThNyiAniQvqjTTO7cx0GnTdp0=
X-Google-Smtp-Source: AGHT+IEDpegVoUKkaUUQrTQUvyjhtCNbHQ+2hYwRm+4WVlURQe9DBtLxRYGOSBLUUid7iPnBug5tuQ==
X-Received: by 2002:a5d:590e:0:b0:33e:dd4:ca5c with SMTP id
 v14-20020a5d590e000000b0033e0dd4ca5cmr3926086wrd.45.1711830802860; 
 Sat, 30 Mar 2024 13:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:06 +0100
Subject: [PATCH 02/11] drm/exynos: fimd: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-2-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=849;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u4iw+tXf5NJS/1BtLNSIfV6mW+a49y5mz2WIaW7YV50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcFZKqSKNTGk39UoWnSoKLPHD7OASNRcGAlP
 Qu1wkB8jqeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3BQAKCRDBN2bmhouD
 16v3D/4sGgIwlyPOlxLxPdzgi6X5NUzD2At20YM0rC7vZgynK+D1tIt+4o/3vMMuY02yX3lkmOD
 tGZz+BsUla/KYDkk7wHvoDm/L5p0LKM+oMy5813CBjk9HYDLmTExh8mUDn+Q4da49KoqLOGTnJW
 baOyetFOh62lmUgS5QXNDmzrKcgwbgQKmYADSCfazpkUU4rgpYtUUDkDTki0PHVdK1ivQUaHodK
 rhPWh62Gya3orWcQEj/0GZRA7Gr6+u0aNxhm8QRR6p1+sqOcVEa3PqwPi6alY8bPn2kBp1hcELr
 2eTKFPoX2xrgscvVbB5SlmO9uiOvAXu4SPmJZA+mpAXDMvOQ+ptIsxxmW21auu0FxnJs+luO+GW
 S1EH26vybJdMsb8Oi60ya2q/LxphjEyB5DPdzE/eJWIE+cJ2MBA+pcT7a9lGlwH6yCOMP89Bs9N
 wLr4ac9DUl2ESjf0TH63DrwAW0LEEoHX5xVcOE7fKFoDhYyeSu/kSaBsv2+k6tj6jVzwp0Q/d5/
 X4mSAQ9zt6v6TBqJ1+8IONpejRsZqPAyg1T/NSpQIApr1KPeM4yezAoied5+KBe50DtEDrnwkst
 Ljg23vH1f5TpUKVqTtSQrJutqrC5TLGIC9n6Sdzdn1yry7N9Ent1h7f4c+3MHbQ2pk3ZkKvD/Wd
 SJVJFC1uvzHHpkQ==
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
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index f2145227a1e0..f57df8c48139 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1326,7 +1326,6 @@ struct platform_driver fimd_driver = {
 	.remove_new	= fimd_remove,
 	.driver		= {
 		.name	= "exynos4-fb",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&exynos_fimd_pm_ops),
 		.of_match_table = fimd_driver_dt_match,
 	},

-- 
2.34.1

