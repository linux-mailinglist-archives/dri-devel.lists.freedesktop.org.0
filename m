Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CC892D2B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1F010E1B1;
	Sat, 30 Mar 2024 20:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oVqiKGs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D3510E3AF
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:38:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41545616455so16929885e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831117; x=1712435917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tEuhNlFy4b3+yhLexNOoFHfsFUeLSaYltIREIoKVZzI=;
 b=oVqiKGs9MtJ3LudOF/dvSgyRyD3pgTam2Fe8KTmTIagQhI81ehnRFke+9tnYrfWa5P
 Um3yKPEwt5kznzRA9Pdx4IToXF+CE86JTFdsl2dzYosVHQ+BJvoNUxAbr1NRJ1gLJLus
 I9KaIsGzKMUQZI630WdQtsoXCDIu2cNQ0e8+X7Qwa2IvdESVUTbX2LPCA4cp/69jPoC+
 ed/lhMIQXHWnOLA5Q5yU97Lc9kIjctwhq+EDw4FOEN9dhfVkWCvV8uG1BWjNqanuJK8m
 Kpd5upXQDdjuFMvaJAtzN84jy3DHYxCsAPZ7OC0X6geZU6rrOSw2Csf5pBWqjlsLv4f5
 T7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831117; x=1712435917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tEuhNlFy4b3+yhLexNOoFHfsFUeLSaYltIREIoKVZzI=;
 b=O6nWa7HkxSc6hZ17ox7hJaMVHe/RWb0Mg5g/ZY+3JlS7IsWus7d/yhyz9CpdDTH0LX
 OuqBpMVL8vTctycP5itPiR4F6KZY+zDP8ZXKq97VxpBhQgQVgzrIIlu1AhWl20pVVddd
 V/PY+lYFC5Z9JNyMm9SIg8kQp/VLmOfuQucXj91mkbWe0cVlixmx87A64dlk5v4UezNI
 umn3V4CH84dc/YKhCfXx3oDaZHMgWkLvcFgB64iy19p2sh+wCGYPYMcaB34tj9PMHd9k
 /4d1W/FFjed+97LvZ03OFPNCtw0xgKsYC3coueD1NfUD+0nFvVznN0RAGsmjGBSiKtfJ
 BoeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXukuG23WPYqLOp95VjsFcfr1eJrpeKeNucEpvyr21umr0x0tkIDTrZN/c/I9YUqNPAaDpzK2uUi1Yc+aaWkxUBL0BvnETFwLzDSDm5QfPL
X-Gm-Message-State: AOJu0Yxsb/Cvw3iqFvQfpn+A+rMjD+oVGOmK+b4Y7L8Vz3k9p5PeDzkQ
 iaGMh7uQNp00xaGg6rYBAwuob7b6r7pWwgpmbHH+vklvOBgLFI/XGKF4275S9r8=
X-Google-Smtp-Source: AGHT+IHHAQTuIzSwBI4Bu2eK2F2rnc7x4I9zYnB2XZiiedbhLcKRgcKBtNt7iw26Cp3hUzmPb8k/Og==
X-Received: by 2002:a05:600c:1d1d:b0:414:897b:bc2b with SMTP id
 l29-20020a05600c1d1d00b00414897bbc2bmr3623342wms.33.1711831116903; 
 Sat, 30 Mar 2024 13:38:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b0041493e21844sm12663154wmq.27.2024.03.30.13.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:38:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] drm/sti: hda: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:38:29 +0100
Message-Id: <20240330203831.87003-2-krzysztof.kozlowski@linaro.org>
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
 drivers/gpu/drm/sti/sti_hda.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 6ee35612a14e..f18faad974aa 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -807,7 +807,6 @@ MODULE_DEVICE_TABLE(of, hda_of_match);
 struct platform_driver sti_hda_driver = {
 	.driver = {
 		.name = "sti-hda",
-		.owner = THIS_MODULE,
 		.of_match_table = hda_of_match,
 	},
 	.probe = sti_hda_probe,
-- 
2.34.1

