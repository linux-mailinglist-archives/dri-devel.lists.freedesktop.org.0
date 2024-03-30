Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70713892D29
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E14E10E368;
	Sat, 30 Mar 2024 20:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K777aU4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7308410E0BF
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:38:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4154471fb59so17650835e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831120; x=1712435920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Un1QbmvT45lYJwe0aH3oZN8c8VesXAq+GuCUOlRaJG0=;
 b=K777aU4c/8PJUXBC7yvrgmpOZUuIvQrsaBdmyh32wmguHHMUSAyHNvUPbjmKn/PsOg
 WZVOQ0plPGPib56IqCEn0N7cFra/xcVIDbwtaZRaJwUfNQKiN3JFFCj4tTzZDWOA+n6P
 DIreJ/8BuSVgQhl+YOMFIMR4K+xcdwfzVWdjpMvSTwFMB49t+udPZJsg1ZbGO045t5Pv
 tanRNsTuxWrAfsgdaz4JNvZu/XRYMuVW8O+k2e20W6CA2/OpGPFEsuR2p7j4bW6ifhri
 ehpkKUto3+1+UuJ5RwcQbGLMCQp9rOJQbGdIK893cs0uXP4RCv56Jdb6wOOlVl2Dq3//
 q3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831120; x=1712435920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Un1QbmvT45lYJwe0aH3oZN8c8VesXAq+GuCUOlRaJG0=;
 b=qtb4i2+JZVB+hi5wWiSnttUonIxLFxo+1MsKfdhYskGrj9UObPTFHHzIgdqtFTPyAD
 LmL5uauz+fP8ex8HXUpIH/hB0aDwxdQVLU58ArXmOGAReB6Vs+qXNED6MLQja3ouYxB2
 RsDb1VnJucVGaFmZ/w+cbL50D5mM7VtNgJ4R9GSUxMzbQLr3YXWO9xr60awW0tkBnfI2
 Rg4fbw+01kZQrnlLcJsnzI0WXfJ8K+s68IxMQsOzKveKz3gPiUbdO9++r2zehuj0NosC
 j4Uty3R/ObtCzULGyfnh6WPs3zPmkoG3a1AVERxYOdu414zkNfYs63MmaxZKhTeCJt3H
 nNwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQSiUIPG2UgY23Xa2k6SyziqSvoGesP5OhdGmJdfNBxxN4VvIxj2Df8Jq5wZivQcIapp5Kbtzi5TCLdSJbFKQ7VvODBmRqVzHriZD1+EcH
X-Gm-Message-State: AOJu0YyYIdO5P+KnEtnpAE2Invt52Ath31lDROs5OOtQvyKfcX8M1CvL
 iw5xwdQOfBFmJpmvO/lX5oVvpC1SGnJZqAqwtsH4AhTN7l7DzVINJrx1sXGqxmM=
X-Google-Smtp-Source: AGHT+IHMmXGFp1Yul8sOgeCFpqScFZ3w8slz8zMmapCjOq3ViqdjJda4cjOX6fibuuQQ86AHXntaRw==
X-Received: by 2002:a05:600c:4f0d:b0:414:392:3abc with SMTP id
 l13-20020a05600c4f0d00b0041403923abcmr3395249wmq.11.1711831119771; 
 Sat, 30 Mar 2024 13:38:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b0041493e21844sm12663154wmq.27.2024.03.30.13.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:38:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] drm/sti: vtg: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:38:31 +0100
Message-Id: <20240330203831.87003-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/gpu/drm/sti/sti_vtg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
index 5e5f82b6a5d9..5ba469b711b5 100644
--- a/drivers/gpu/drm/sti/sti_vtg.c
+++ b/drivers/gpu/drm/sti/sti_vtg.c
@@ -431,7 +431,6 @@ MODULE_DEVICE_TABLE(of, vtg_of_match);
 struct platform_driver sti_vtg_driver = {
 	.driver = {
 		.name = "sti-vtg",
-		.owner = THIS_MODULE,
 		.of_match_table = vtg_of_match,
 	},
 	.probe	= vtg_probe,
-- 
2.34.1

