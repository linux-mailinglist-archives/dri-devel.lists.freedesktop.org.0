Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15868A9C83
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77901113CDF;
	Thu, 18 Apr 2024 14:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eYIUIAQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CF0113CDB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41881bce4b5so10008295e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449854; x=1714054654;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
 b=eYIUIAQw91tl0sl0UwkL4p5z5Di9/9bPqlDwcOZauBKNBJnABIzcmIzcecckjgydli
 i7WYsLryjaEVhWfzzPJ0BrQjj+CmAzoqN0slgK6wf7/miCdSTCEn3RLyKsiPXlPtbIdd
 QTUTuskJfR7RfX1w4LoESeQeaMj8H6p7uKrFLY9SjJ0JTpGrX4WoQiqNOUHRoA/ZRlyi
 mT4h1hVcGjBuXEzuHVwsKSZanRyujA1SwFJFABIPS4wivYNgQeJN8s4PsoXSL3ZelbqT
 odXDMsAVcfVG7O45y0S+CPeMunBpS55aVv/wXfTeSsyHJMXKFUfbKBk0AQgB5VvnAqBG
 I1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449854; x=1714054654;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
 b=T0pPJC75qUyQFCYgTLF97Zl0fLHR3rCgH6VPegH5oQSzmMxwBU2UZZJyZ3pRe3M8kl
 J6wSSF3I/Ck/lpBfg7mn61qplUbYDXh6oDUTKl1RMo9zNQjP650tLJi8opLwP/ucv6eL
 AhXv0mZYs5m9K0GumSW6gUr2wHkh8Haa0C/fNkaX5FZKkzFG+LAGZVK/bZMYVRfb7lHk
 gqCTVV5HD0jXzQMA9KnhAagytFqF7N//B9lycJ8fFt+gK8COkKtagck1MHCURDiVVCc0
 pe06PW5U9Dd3leIOQ70Cwj+xwsho9wRw8GXNsvhnc97y2X8p6g9cY2We/gYgKWJomMYo
 ydUA==
X-Gm-Message-State: AOJu0YzlLV4QyCIWxFXKB8yage6E7GlEaIuw27g08G/kRHi3R+d1n9dZ
 KAIjz9go767/g54ciFhRB158ZL7QX0yjyE8nMxj1yLyhO3hEHghMhZp2KhMJ8qE=
X-Google-Smtp-Source: AGHT+IGNk7+q98Dt50c94htj2Yax4/KnYeuA1Mwztlc7Yw/kKE9BWFSk6X7OkJkTV8uxkSAExv++dg==
X-Received: by 2002:a05:600c:5254:b0:418:fb6f:5f3d with SMTP id
 fc20-20020a05600c525400b00418fb6f5f3dmr290856wmb.17.1713449854525; 
 Thu, 18 Apr 2024 07:17:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:03 +0200
Subject: [PATCH v3 15/17] arm64: defconfig: enable display connector
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-15-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=woF6NgCy9sWp4jU9xhCym7WDVQPI/tzmO1lBDEzOVXQ=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjXZeg5Jh2Is/gAHWoRmg5aIyMiEXbGdEHozO1
 0cFGgByJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHUReAhD/
 9Yax8im2q4PngGvAwi5mmyFvPkrrQweqeFZGttybB7sZdfiirXSiQhiPajWkHJ5qYP3CaLIdpsBbwO
 Rly04rqoR9UjnSnssubHEZRNV8FDtUpWG2kx2KI8YtrPQXLedyoviZ5yXRMhrIo4YQKztKVAM1anaN
 +4z/FdycM/OVy+qFYOtxIBm5OZVvmTBFcaobZ7N/b8dnOVarjKVjWcJMqc5DvBg82J9pfb7i5a32+j
 qkq7SMbQJPWRhsJJ1p+PmDZc34BROzx6SdrqIaQTJnDjE3jg9ejPrn72qGRpeCHd5u+WRMmbRlWe34
 QjAIUX44315fL/fLIduyc01lfQV48zhoOFVjpUGN219Rl/nbxQdtQizyG9s3C52+sBnHtBtCKGtM5p
 KeRTXx1RnMx3zK5gkElzJRvnWP3BpiS7jkdcymFux9TZriFYx9saLHrclsMJIMoAgdDwNvi+2YDgbv
 ZFd1zRXXRB3wFltaeIYmv61ET5XbsgRNVlB3erg09SjegSD5W4C+dUv8X7DTr/JNQYk5xB8c0r5kLA
 S1ZmTU+T7QLg2br8fX3i9CU7FZDBm4vI+C/FubNpkg75I5aXe2dOy+RetsN0udQ96a/LBJPDmKFksS
 ZnLWgsJyU/bn4dG+J0ziy4jI04KodR1dokrbqRImv1aZvrEx8euPdeTU6aiQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce98a150014..1df337882835 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -872,6 +872,7 @@ CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

