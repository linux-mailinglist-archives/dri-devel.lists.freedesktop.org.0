Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D4892D54
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A4810E3FB;
	Sat, 30 Mar 2024 20:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XwdqXDzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82ED410E3FB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:52:46 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso2254309f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831965; x=1712436765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ur6wj7Am1MhdI1MTeYGSKdLS/Zh7sDkgdWv9M5NMjj8=;
 b=XwdqXDzog9bosCMyZraU16lCtckkAY59fdUtkurDOy+TuRXBxPWxny968nnUnBEgak
 jXz5uetJzepqeGow8+zdF5byjwrZpj4SKjO31Tj0DPivSzhudunT+knOOLKzrZnjgmXo
 1MVSx4HiVmNHsx8NZ35fM+r4ohzIhO1E5N4o26s4PhKLEoGdIVPEmMuTQ+j24ZmPCnKm
 hHjD3AF993ev33sXQD91YmATiznqD4Mn2/z6Ez8DmVaWSEqTmtQ7Z3LMmPK4G1RErG6N
 p0BhIhzqTAZN/fKkmaEZqmOoYtwD0mK4/mfYBrldVp+G/xIgw9woEhu7GS/eaIdXqdG5
 XOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831965; x=1712436765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ur6wj7Am1MhdI1MTeYGSKdLS/Zh7sDkgdWv9M5NMjj8=;
 b=uFDMG6xNyX9SvYzRwgYYcv4p5BGk2LJGx8aHkrgP1kiRQSBg6/WcS2Oxz00bXmFyqW
 kUg7p7GAzl2wpXogmTJuRBEC3UO4WPKJpAEXJGdS8TW7mrspiuWJcKbIjlwsWQfrpcyE
 +y3ES1UJhAi/s2TiOUlBj6j05Hnnz4tqE1ZuA1CNpH/xCsebmnfQRQUIA2pbCL3MgtAR
 q2HPuRpQ+gNK1YrIMie831K47u+AC/ushLDIBq2mMYZA6fPq7fB/D5wlTmC3lqmodOUj
 m8/9595qy3Tl6UO+v2imjMPHoPynYFni1Ezw7JFqDmvzbY8xBoD0VmxdfYOEPB+wmsdg
 MX8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4l5sRb3Yh3ijLbDIPQJ/6jTqU9gEDKCjlH4EcFy+YH2l/RkZeeZky208PNQE8tf4PWKRCjZIXinfFDtYHn921xjRajsEH7EvYGkN/1jHf
X-Gm-Message-State: AOJu0Yy8g7BILbdm3pjR66uW4sX8qyvBvWyiCH/IFV9lIPq14a9/qSDh
 s4tpftqt1W4cy2XKD4ZTlUlYIsrckzo0Rvfzm1z0vGntVJ1+CGanV2J69YeXb+g=
X-Google-Smtp-Source: AGHT+IHGeV8E/r8D99VT6rlf9tYE71QgG9MvULvj0tWUuJAxe/CbejwGsfVZwcwIlP7QPuju+VqMNg==
X-Received: by 2002:adf:f142:0:b0:341:7656:d358 with SMTP id
 y2-20020adff142000000b003417656d358mr3715366wro.38.1711831964745; 
 Sat, 30 Mar 2024 13:52:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b0033e41e1ad93sm7279868wry.57.2024.03.30.13.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:52:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/etnaviv: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:52:41 +0100
Message-Id: <20240330205241.92711-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 734412aae94d..87b31cfee41d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1995,7 +1995,6 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
 struct platform_driver etnaviv_gpu_driver = {
 	.driver = {
 		.name = "etnaviv-gpu",
-		.owner = THIS_MODULE,
 		.pm = pm_ptr(&etnaviv_gpu_pm_ops),
 		.of_match_table = etnaviv_gpu_match,
 	},
-- 
2.34.1

