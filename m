Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FAF892D0A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC5A10E506;
	Sat, 30 Mar 2024 20:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a6CLHnFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E661E10E4BD
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:34 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-341c7c8adf3so1989134f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830813; x=1712435613; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R/ItlhUR6jqnWFgbd5yxm7hVl8DoM4r1gHAqPNu+ncU=;
 b=a6CLHnFvmwQ8JCqBFVGzOEndk65PreU/tozAhFMYdKt3TBsWD4m1omeWDMrc/sGQtE
 BqZwT+mxQqVfe0BJTF3qlWZHZGbBU8FyJo8wg7xbJXWW30DzDhVJPNLzc0zi1xv3QipT
 L3+RyCfwen93VbBFV25dCrmtk7F/cgDhTzY1vV6kHQD7vPuV1p42cnKMXIHkKUzR58bj
 gjLtJlQ6ErF7g4Qur6a357jddnVQHEZ3vX+szF0fviM7XUTZ8KtDrcnbzI0lk4Q3+8+2
 58ZGZKBC1MLQa6tEr+n6VEViBEAomssv8PQakhDUgpfIbZ3f0z9PHvV5mXrddUehjpJO
 N55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830813; x=1712435613;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/ItlhUR6jqnWFgbd5yxm7hVl8DoM4r1gHAqPNu+ncU=;
 b=EiE5u8lhjdkMVAhNJrsGLzeie9iYKBYuVjsmvWVNAdShBymiEfVSi8Y0SU+2PajETr
 8LhqbC7atIOADeTDN2Awr+nn4rm6KIfVKGAdX6qbPjPP7+voi4B1zTizFVDz7B2Wr5B8
 VFG71VNFC8XRC1XJHFDppOUG6G349K6v9ZMqJKshPeQTxS9fsyfTeCBzJbvtI0j9JJ/q
 7/RKVrQDZ4k0tjpD607didICXi6DIR3krlQIa0IgvC8CAE/8pYlyFIzGJX7G7CLMPCE+
 l2XrNphio1i6/2jFRXb2zz9JY1U8Y5AFbAVk0a+pdvXGH5uO34Rkc4nxzelVKVCXbBqQ
 1DYg==
X-Gm-Message-State: AOJu0YxU/6wOQjWnkFSKX5EI/18RqWvgb1tT/fIbPlb/9UxPkoL5VVNP
 VF4ycitX73cbAN23LoRxgjX9tfcEn2Y3HHxRLKS13o4IdxUllt5r8AY5loPd8eDllOiwwxj1MuP
 W
X-Google-Smtp-Source: AGHT+IHJ6Uc+SxizZqKRJbUIgtj1cEsA67ojpQsBe7EuZyWLS0AH1SOG5LrKQA0o/ciVQimEwo8NLQ==
X-Received: by 2002:adf:f6c4:0:b0:341:7fce:4f80 with SMTP id
 y4-20020adff6c4000000b003417fce4f80mr3243150wrp.25.1711830813363; 
 Sat, 30 Mar 2024 13:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:13 +0100
Subject: [PATCH 09/11] drm/exynos: vidi: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-9-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=805;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kCyb2/5lgQ7u+UoU351athV0HM/cfffQPiYFhVagfsg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcLHKtqQjf4/WiHSYUsGWsKyIwFPTmHHqGL4
 jxGp4ajBxCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CwAKCRDBN2bmhouD
 17NyD/4l+dx1iazbcMQ/sTMRO1Kbni/i64ZZ74Ym15MB4Gjkh4aVVE9CWpP4bbnN5Mm8fAPI0af
 R+gFtyngt/nlWc3wZwc05Y/4Tr0/kiiphchcYQWUjXpk5PeUKpHO1PSEhoRivovov/X/jLuMvHV
 1vdoxEoB5RPbNtbHElMeXUZSE7zezwsO0kL3wcJrIGyIzNZQ5qngO66jd4qwHqRNAWhao5O2AYb
 YNeB8TRE/I5/IWu/4m/QQZod61x8h93aJpOWi/tnb4YLc8qeJxejg7ydEzYPXK0rZK8FTvGqwax
 qE9EeyAdhMeWB7Tfyv0Mn8O/+fezL/ZzEodyslzjLmGyPUW0eyowXxhkxhFDiswoz2O7OPLeMud
 mKY9e1gjleFm8bdOhVvJeFgfRTXRYr+QUdsI375Ixn6pGwQq78dlZpF+Y1rfzMiBjcsF0Q8pcc6
 xJlbz0FMaDuTvyhFx3tSCKEtF7+VNDhRstdmY0w/G8oSiM+m2pfAZ07Bgjj1Yxk6PfdgDpDT71X
 hd8Q3ZSiZpCbhKVDeO418FOI9xmDj1knCTRQHGDlo/btCyVtHYoQ8Vp4Lb8uTohqQInhwRNcMlp
 Oh8T+oGlxiSvw71yBl2Vbv8IQjcvX/RqgyCDCfzGFYFSxKzEAIgsFxJV0a8HZrA0U0bm1qDpCx2
 kQc6ZjcRZwJvfXA==
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
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index f5bbba9ad225..fab135308b70 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -479,7 +479,6 @@ struct platform_driver vidi_driver = {
 	.remove_new	= vidi_remove,
 	.driver		= {
 		.name	= "exynos-drm-vidi",
-		.owner	= THIS_MODULE,
 		.dev_groups = vidi_groups,
 	},
 };

-- 
2.34.1

