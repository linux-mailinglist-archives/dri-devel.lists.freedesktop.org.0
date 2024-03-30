Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62E892CF7
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A13810E352;
	Sat, 30 Mar 2024 20:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gZnbdiDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7113810E34E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:28:10 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34100f4f9a2so2080348f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830489; x=1712435289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cb1rJ0C9hI2g+B3ZJcFx/t6UoBBJIXeH0O1CoQprhnI=;
 b=gZnbdiDykiH+AHoOcEsDezOHjrr6BpncHQYQ1IEJJh67aEGWBKvrjLvMK2msV+BiBo
 xXRzr/H4b3+GNatPa0LLbbtVMTcQAUtl9rDZQlOCb0h9+QRHzj/zg0Z2qhzp4f44yGwO
 7pKxcMM/U/ixQpe/5MhDju9hthjqgErIaEIZBvrT2BtvQXu0/ot9fBU8KjXmuR4P8rXD
 RJZ8a3CEjqZLkTCqzJ07gY2gk2LwoiRqdz7YVcwz08e9iFizrKf0r9AcqKliK9ApOSYo
 sSb/MGbvoIiC8lxOxXlg+d0MANoIt05Zrdk2ZJOKMAC9nM8l78dXOXvkSFt1i7g0vo6G
 TmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830489; x=1712435289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cb1rJ0C9hI2g+B3ZJcFx/t6UoBBJIXeH0O1CoQprhnI=;
 b=FWeY3a1F4TXjsLHtUQ+0KnWOq6Hvn3Ayo2y6ckwJfD5ReFl+VJ6J0OQGcm2O28Xi/P
 VtE5CNKeC6JU4XlWvimHLCKK3dtNga/Isdv7Qmc5o4MsrHynEstdsjN7UeSQRMwJv223
 9aapDin0pQ0Do56U4GHk920mEiW8gyQmh1dSnsNI0FNdaLjrvSzSxPD68geCu4k6ChZ0
 DLPZdMFP/zZyfBzUH/5qcil5FxysOTboxgRz0Udi2rEPe+E7jWoMfcDK9cS8Br/7O+U1
 Y0FjDRLwd/E3zaPfaxnmC05ZpV3JN3K5RLOZZCucDYnb5bFbhj4YUdVDj0MxerjTY7yY
 ZgvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ooZmW+cuscjvozQLUtHEsZqAijrCBYeaD5HP1WTjVHdJxHAQauufByt+CWebdqCXYL0mSr89feX5Dpq26sJjBIchHPDfvYMDOusszCks
X-Gm-Message-State: AOJu0Yy4LwWgY/HYCfUhTbM+oBvlRXqbtoCqb4vLy6ZsWpVeYuv4YsxT
 WS4PBCtW/xzt4PPPer1Q0S77P43ldFzegIfdIJsAvH/ehpmWaFbXcIEzhlIZduQ=
X-Google-Smtp-Source: AGHT+IEjYZHqefeHkDLiTxUeDHyCaf2Z/cuKICwGIF/hHCEy9VBp+E0CqbfkFxv/fqV4T+CQdbdFNA==
X-Received: by 2002:adf:ec84:0:b0:33e:d244:9c62 with SMTP id
 z4-20020adfec84000000b0033ed2449c62mr3082832wrn.68.1711830488802; 
 Sat, 30 Mar 2024 13:28:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 bk20-20020a0560001d9400b0033fc06f2d84sm7240090wrb.109.2024.03.30.13.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:28:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/omap: dmm_tiler: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:28:04 +0100
Message-Id: <20240330202804.83936-1-krzysztof.kozlowski@linaro.org>
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
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 9753c1e1f994..1aca3060333e 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -1212,7 +1212,6 @@ struct platform_driver omap_dmm_driver = {
 	.probe = omap_dmm_probe,
 	.remove_new = omap_dmm_remove,
 	.driver = {
-		.owner = THIS_MODULE,
 		.name = DMM_DRIVER_NAME,
 		.of_match_table = of_match_ptr(dmm_of_match),
 		.pm = &omap_dmm_pm_ops,
-- 
2.34.1

