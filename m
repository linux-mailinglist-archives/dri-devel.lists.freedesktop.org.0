Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97E892CF9
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C99910E3BA;
	Sat, 30 Mar 2024 20:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jXkNEQi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283610E34E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:28:21 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d476d7972aso42718121fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830499; x=1712435299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VgjEC6mZVs3So/hqI3O+3ycA6ijS0e0kjizc/9UESu8=;
 b=jXkNEQi4P8ALyHbsz6DReMl04GISc0sVuTKX3nQv0eHeePcGJhVc4ZM/lTbiTtwFsL
 FeoL5QRbKzIeZpCnG8reSKGK4A1fgStv3SzBEcyNOKhwNjuZzdDAPiBcZyaA1K2H5FyM
 dtxy81XVtbbqrssfdesI40CrgUYax/Za+IKRe5Cj9IwFRA+RPiYl3jvGyUSk4t1xiYBR
 SO0uv611pbtW8HnWAPmEHaXfJ9LOvVOi8ytG43+SFDDVUg4H4wnNNGJu2Zwm1Ibf5sZw
 z5zk4/9sJa6TUGTroclVHMdDOREKDlbQhfdch6SKIykQZ9wjqWW4AL/+HdIQf7R09mi1
 DYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830499; x=1712435299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VgjEC6mZVs3So/hqI3O+3ycA6ijS0e0kjizc/9UESu8=;
 b=H6lAS0aSJ8xi0h4QFmqwN9rUYwhH7wk7KOfoqvI6Rc7QdeFQwBtxfeKqM/pyOxunYl
 yfVV+/FWixgKknL3FqRLypWzww37u+r7Lzx2UYSPUU5xOD1pW97nqTICgbs1RVoqQbvf
 kkrFUsxSfKRszNXXAt16TqRSMNYlAR4dAXiW++FwJU/E8WOm/JLr90Auia7YeBzPiuRB
 G7u4RgPMvECT/3qAXW5KyYCPqDjT7BStQpx+MDpX3fGq91I2yJZ2SmLBVosDLP/V06ps
 3VzY5vj+lb5NC8TBT0Ct6fgWeW6HWL+xOqnW06ZB9jO+u0YIjc9PIsgDMMRNCFJYgC7V
 4gtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjaTojK4C2MfczgMb4SImx7T2V35kYsjGacleZNbA19Tnw+q4g/KvTWfwop70zCIVQLl2Tg/fDK4Puy0jcHnIYCKvE0kkf7prz2YFfYq24
X-Gm-Message-State: AOJu0Ywxmzp5agqXvoeXK/V+E634wV++R8y47pdZDyiC3Vks/3BFQq4L
 mLWTrtQujF1Q9OWqkGVs4F6iretyBIP8cJTC2HBfLDX15TNiX80CIKp0o8n/TNA=
X-Google-Smtp-Source: AGHT+IFaqdVLHxk3OG9Fric3iB9NG5ZmjFBedjjf2RCQQIV53J1zBua/CNpqD1diLQN+bzP8QmCXOg==
X-Received: by 2002:a05:651c:94:b0:2d6:b8d2:3712 with SMTP id
 20-20020a05651c009400b002d6b8d23712mr3234554ljq.26.1711830499381; 
 Sat, 30 Mar 2024 13:28:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b004146a1bf590sm12602084wmb.32.2024.03.30.13.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:28:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/armada: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:28:16 +0100
Message-Id: <20240330202816.83973-1-krzysztof.kozlowski@linaro.org>
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
does not need to.  The CRTC driver is registered in different file,
armada_drv.c, but that should be the same module and if the
values were different core would overwrite them anyway.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/armada/armada_crtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index c78687c755a8..1e67c84525d7 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -1087,7 +1087,6 @@ struct platform_driver armada_lcd_platform_driver = {
 	.remove_new = armada_lcd_remove,
 	.driver = {
 		.name	= "armada-lcd",
-		.owner	=  THIS_MODULE,
 		.of_match_table = armada_lcd_of_match,
 	},
 	.id_table = armada_lcd_platform_ids,
-- 
2.34.1

