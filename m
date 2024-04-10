Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7689ED77
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01D7112361;
	Wed, 10 Apr 2024 08:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KsFImnIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A754112361
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:22:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so3793105a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712737345; x=1713342145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kww4yyZZsepXA1zvLsc6VOyWxL+8PLx2SuiK5eoL4A0=;
 b=KsFImnIBK54k4qW1CSo7yCPEP9OG16/o3kgFTxmDJ0mM1kMcPeiT2u4lmUFWc2wFxy
 TJIQtw2/+i0IW1SAVLiGjTb1xU0Iz3ixNndFom54ROAdaQC1DHejqTiK4235b72RG+zZ
 GPQns7pr8eMlpqknnPIljHk3kOUaaGxIUx1wWkJq/HaueMjsq8f42JzU/RsBVpKWjs/+
 Gy+7XAXquNdJkm1QBXuOAQLvkQ8teGtHWmLDJw2noIFoBhbu24bcdG2HK/fhH9LyiTv1
 FNyK+QdlqtDZDOROsNPqQQn/QARn1ilpFwZdTVDA+e0mZXykuRrfUXxGkzl+3g6ZPSmh
 olFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712737345; x=1713342145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kww4yyZZsepXA1zvLsc6VOyWxL+8PLx2SuiK5eoL4A0=;
 b=gbN2cEW8VthkyGdaxXviJPKZGCoI23KfevVrFTVHLDG9gAFk+qwAU3jhZeDd6mPG3F
 /0ohuIihq+JU3mE8QMazClLARQ35KaVzLlWaiDaZEXy1BJrjw6Xd88It65AQgeoihw7U
 hBEppDl1kLp8fht1AEGfIeZx39w3la7KHvGQqYcVPi1OD0hzaq9jK6SDfCdWwRe9xlth
 A/fPAPgslfT1jpjkYSogJFJDD8/8PitTZZt1UIE8b8PioCHMn6k2QY/AOgTdfBO0eOJ7
 J5GFT63p1R9dKyw6ciNqfK799rXThaHyOjTyxbqR8/iWE1/Rl/GSWydBON2iKZpRAn51
 eblQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkjoPD8hj2Ijay0OuglJfHeEhCQqJ6tB1YzdIl4IRR09xo+4QysX1MbQMCKnk22kIDXehWhm+gdzaMZzqa0kQlmlM24SMKLkyfZ6j8SHZP
X-Gm-Message-State: AOJu0YyFqIyxuAULL3i+8qIJ3tpty8spoOGhCMPz7y5Mw7e1ASylWXPL
 +VxUkMfVzD/16flNeuv6ryvmV/iafUNZ4oHtjnux+8OFP/DqdabHsSbx8qT4Ntg=
X-Google-Smtp-Source: AGHT+IEtecmPwxZNGIHCQ26Q+9Nf031V8etRRaG96Ui//oFqXfGHVqbraygxywND8sq/gwzeCowbpw==
X-Received: by 2002:a17:906:4888:b0:a51:9938:f77c with SMTP id
 v8-20020a170906488800b00a519938f77cmr968170ejq.52.1712737345532; 
 Wed, 10 Apr 2024 01:22:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 hx12-20020a170906846c00b00a51a9eccf2asm6338213ejc.125.2024.04.10.01.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:22:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RESEND] drm/armada: drop unneeded MODULE_ALIAS
Date: Wed, 10 Apr 2024 10:22:18 +0200
Message-Id: <20240410082218.46525-1-krzysztof.kozlowski@linaro.org>
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

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resent third time
https://lore.kernel.org/all/20220407202443.23000-1-krzysztof.kozlowski@linaro.org/

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/armada/armada_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index e51ecc4f7ef4..f48e2cf8de43 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -283,4 +283,3 @@ module_exit(armada_drm_exit);
 MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
 MODULE_DESCRIPTION("Armada DRM Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:armada-drm");
-- 
2.34.1

