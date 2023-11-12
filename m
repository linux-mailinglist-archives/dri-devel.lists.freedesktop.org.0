Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168377E920C
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B79210E161;
	Sun, 12 Nov 2023 18:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AD210E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:44:14 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5ac376d311aso41268677b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 10:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699814654; x=1700419454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ph7m6E1Vtkv7RR08QhRUG59xkdDRnqIt7SGyWJz8QU=;
 b=FwWSfkIy8fHU/NGdMLowuqQrRXhvC2unfnekpBQ3FS3khqKHxUnQ3a/CWoTjYxBmN1
 Id7/SmxOOKZ1+neKjkp3ow4w8qeDLmfHn+YRHGd/c1AofSAlftrtiqtGW6/0OvnbABFk
 /He4AtGcmUkBMSbnCjozyE1yFnLqxrbgzDzVLvW1N6ieuWqdbdihu/Chco6KsYhtru4r
 dp9j7X7S1pATGML0lDwanl3w7yS645Odhq++X/rs5dPPCLjF+OSwlpItNrKyAkcEZauv
 EV+jKLWRWJ2RDD4urIXx3tZFK+C3W6iyO0YZN7owDBV1HzcfEKjvDRRZjNNHMdcZJKnk
 W4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699814654; x=1700419454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ph7m6E1Vtkv7RR08QhRUG59xkdDRnqIt7SGyWJz8QU=;
 b=WY8dwiSmJIOjVx+PlVTwYjpHR0wSYCor4MXGQ717XBjlZXPC54f9SmA6EZ+04jgR64
 eFN7PCEs9QLmGBXcfsS0ULL77Lv/yoWloGIoAK3DyPWMA2e6qTh2Fuft/P2Awm9vy0vR
 cbzkOcVcflTA2+1R0StKFEhPGBylV3SHyle9Aj/yjqJ7ffeKy6FczwmWeJjIUcuMGvMy
 gSK/vwzx+qX6ZfvhINa1nbbwRj/IkSyQe5kxuJKDCWGaFuAhqMBLCzMmAa+OcePSzWLh
 V06FgReyvy8w40cgSMBor8o10DGzULtSfKrH4ghB13CLXTYEolqswv7BW6z6+23dPmT6
 5cqw==
X-Gm-Message-State: AOJu0Yw0XKLr4m8vo8OsTx3ftA4QklE0bCItfjKKPjMXEIjPbD2Z0TOD
 2IU7KijIreJPSHHW/Dr3FdaTDg==
X-Google-Smtp-Source: AGHT+IHpzvYeJiWjBu0flWuD/GyQnhsKd8gKM5c0RQLvUyFjf+fvZeq5nvs0RJ5Nw84f/GzsfgSNXA==
X-Received: by 2002:a81:4113:0:b0:5a8:277f:b378 with SMTP id
 o19-20020a814113000000b005a8277fb378mr2138130ywa.1.1699814653985; 
 Sun, 12 Nov 2023 10:44:13 -0800 (PST)
Received: from krzk-bin.. ([12.161.6.170]) by smtp.gmail.com with ESMTPSA id
 u63-20020a0deb42000000b005b3f6c1b5edsm1308938ywe.80.2023.11.12.10.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 10:44:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: gpu: samsung-g2d: constrain iommus and
 power-domains
Date: Sun, 12 Nov 2023 19:44:02 +0100
Message-Id: <20231112184403.3449-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide specific constraints for iommus and power-domains, based on
current DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpu/samsung-g2d.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
index f368966cf83a..132aaa49597b 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
@@ -30,8 +30,12 @@ properties:
     minItems: 1
     maxItems: 2
 
-  iommus: {}
-  power-domains: {}
+  iommus:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
 
 required:
   - compatible
-- 
2.34.1

