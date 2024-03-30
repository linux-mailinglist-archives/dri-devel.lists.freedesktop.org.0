Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B1E892D28
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FE310E0BF;
	Sat, 30 Mar 2024 20:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RgRUJuIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A06610E3AF
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:38:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4155f5b8cf5so802855e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831118; x=1712435918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFs4+JJnShJ+MLRpqXVBdO/xAumqPjEee/iEWsZXnTY=;
 b=RgRUJuIeDkQMhgVF3vY4tZyJSwW/tiFyct84140qH5mHkrCD4/lb+7ns17zxEeFE5v
 UetLq/yu2g72+dlZzqp21Hb71ZVKGrGNgyDOYOruOLphunIVs+UPrZL49UUnMhvBD34m
 uJz/UPZQobKyluZE8QFJng1AqMgf1mMKcPYz8cZ6AATDsaN+0LzxbA3Gsz2abpQoumiX
 o61hMGup+qQzcFg5MkQ1ZCNvUn+WVJajKo9WsyWwlSdJ3dlcz7yY0WSkWdBH8jIRCU7Z
 nraAy553d4az1c2rqpc993UjOPaHAgxZsZpe2zyF2Hhv7/uA9QC104lGI8KeEburP34g
 xrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831118; x=1712435918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFs4+JJnShJ+MLRpqXVBdO/xAumqPjEee/iEWsZXnTY=;
 b=T21XHxNdsAWV/H25RhiRmSeGg10GEVzqv9FojHF/0WHbzktcMoEfX6IKZYkd0Ze2BY
 WFWuXofVWV5R6MSCKzw8Z4CoanImUl2zYmrFnV5hHVWBp8bCj9d7IOL6HRKpD2xKL8Fm
 QEe4z8ADDYJA0HAv8P7PvpI1Bp4bzsSfBYEWrlbSyk2+ScJQsNZQOz76gmBEzhwJIHIq
 FXClDGEWD/bFXEEOP6OrbTJ7Cr+n5NKwJ20L/wG5PGFaN7rXydKSqiBpR8GelXj91z2m
 6wwWkKcEkn3eW6BpXZ4i47Aq5qP52LtR2RKAddNefDsSeDpFVDv5xd5K5LMPniTl5NF+
 PuWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvw2LxA4+62LtCiKgjkf2mwt8/9p2MuTMJcLRnBymUsTmqcbOBzgtJF7Gn4JYJMdxhwO+sFiGS2SCqAeKTmq6i0cb1NomenEh67QVuqp0p
X-Gm-Message-State: AOJu0YxENPspg17KZjPBkDYsiBaEngcEWt5KBF1RRnmHsVPbjH7Z6nsl
 8y8gv3Q/40HW22i4caOqgihmTCLeHfs/7T27kUgsttrV8gw0HE4w3Vcv5QOirzE=
X-Google-Smtp-Source: AGHT+IG7v7k288T1Vn3krtCWuG9g6DrlfdzI9rYZk3NsnNHv7nvenJUD+y7dYXT65M6K74TQ5WG4ZQ==
X-Received: by 2002:a05:600c:3ba2:b0:413:38ee:69e7 with SMTP id
 n34-20020a05600c3ba200b0041338ee69e7mr4379496wms.36.1711831118494; 
 Sat, 30 Mar 2024 13:38:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b0041493e21844sm12663154wmq.27.2024.03.30.13.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:38:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] drm/sti: tvout: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:38:30 +0100
Message-Id: <20240330203831.87003-3-krzysztof.kozlowski@linaro.org>
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
 drivers/gpu/drm/sti/sti_tvout.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 64615638b79a..e714c232026c 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -886,7 +886,6 @@ MODULE_DEVICE_TABLE(of, tvout_of_match);
 struct platform_driver sti_tvout_driver = {
 	.driver = {
 		.name = "sti-tvout",
-		.owner = THIS_MODULE,
 		.of_match_table = tvout_of_match,
 	},
 	.probe = sti_tvout_probe,
-- 
2.34.1

