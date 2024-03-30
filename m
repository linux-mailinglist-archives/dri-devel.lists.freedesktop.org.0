Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F842892D26
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8D410E41C;
	Sat, 30 Mar 2024 20:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SgYoPbaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D7F10E368
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:38:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4155f5b8c41so641755e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831115; x=1712435915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qiZfiYec9JvljDN1YM11DQZd3LvrJpGPdWmUgthRHDA=;
 b=SgYoPbaNROSPU+E/PgW1S9ogv1vX1MYchEYWE4g+KbW9csIsJToI4MhtHAc6rijflW
 jddl/Q8Io7cTjNxVhDvlT1clp334nP+mOeBBxpB1LY+x6NN0gPmwyhLPowibNBOOPieh
 RBTxMz3HoawLkgjrcBKfTdbRYHw9UBlWvu+mZ0g8Bvi4ws4jvMdWHGqibUnMiNns0ITw
 jqljbqgo2QrTmc5ci/ijE1D+z33ai50dxEaRgnGhY/92GnhVJPENalb0qW7EDUJxBrQz
 o/IPvHuV+hk9vbrdvu6r5xlEyf+3baiPnmL+2KrMlwhnImRhBsL9Js/wHDYcDNsJVpb2
 wCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831115; x=1712435915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qiZfiYec9JvljDN1YM11DQZd3LvrJpGPdWmUgthRHDA=;
 b=a+JfD3VRthm4zD/butAuposb+k+HHrJIpy1uCDAi+3D6w7wXuHpL7yRR5l9mQEuDMl
 yGpVucQadoRjt30GoBHDnAcHzuZjPBRUlgLe/Nh/h4Zi3U19EomD9NicIBClaaBAUZsB
 goI2DiHmz7NUeGzWpMPwjGdX1j+FdxxwH17h7ziLuczmg5a+eJrUkPi7Safi8G9X4/Fp
 OPWdTbUrDoyHswCppT/8GTvIBLMDFQ/YdsEl2mYNZ9QZsvNMQzvjs98ykhgVg8THuu8G
 fYp4vhndVrsEFDAVkOHoaxsk6Y/KTRWmTAfmNDPdZi8B9jRbrEPTOaLXvcHuKxNJtgg1
 JCIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtohUiiwUWrxxlvOU8XeHYmA2jAs55rdpKbsj9ayeYv0AOdxA9P3cDglq+DGbXwZOq4s343nSKg+kckm6bSJ9d0sqfg4kaBVxUwi/JcROD
X-Gm-Message-State: AOJu0YyUd8AY9CgJ4UmvJFa0eZQDLgOXiHR0MI0IPT0X0QEnV6fdivxi
 /RlXo1cmrmBEoDUeDP7tdvu6jFlPZXMSz4/cT74uLkfYNHsLUPWxsgyz1oRTV90=
X-Google-Smtp-Source: AGHT+IGAw24+hOas7D5hzaxRF5caQ5bx7P/vLD5i+/kvSP3UAzqxOqiL8pC5Mv/I75CHrhlERYGNkA==
X-Received: by 2002:a05:600c:4eca:b0:412:ea4c:dc4b with SMTP id
 g10-20020a05600c4eca00b00412ea4cdc4bmr4148579wmq.6.1711831115459; 
 Sat, 30 Mar 2024 13:38:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b0041493e21844sm12663154wmq.27.2024.03.30.13.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:38:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] drm/sti: dvo: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:38:28 +0100
Message-Id: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
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
 drivers/gpu/drm/sti/sti_dvo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index fd1df4ce3852..00502889c7f4 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -581,7 +581,6 @@ MODULE_DEVICE_TABLE(of, dvo_of_match);
 struct platform_driver sti_dvo_driver = {
 	.driver = {
 		.name = "sti-dvo",
-		.owner = THIS_MODULE,
 		.of_match_table = dvo_of_match,
 	},
 	.probe = sti_dvo_probe,
-- 
2.34.1

