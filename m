Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B17E920B
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F70D10E159;
	Sun, 12 Nov 2023 18:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6471D10E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:44:16 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5c08c47c055so21380447b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 10:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699814655; x=1700419455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VA6uZGdGjNfy56jm7BNtgPNmqVGZq5+CSaOwN7oZJ+E=;
 b=ehC55Pd0yRWSPiftydvYT2wNbKRMY4OE2IXp4zmYMM42U9zXGfIgRskilFEgiSWykE
 j2jJn3hZUgLpgxQdYBRjCB1hewiqmEhZvDIfoVCLX0e2WlzqUXFxFg/CNTGf/Si4HWMj
 +01laD23E/T/sE2M/uVpOwZWbNg5TPEOQCwirChGYu6RhDVvmBi6xTCFHFSF8co+9LX/
 mcxzFpxt9cYo32h+obx0ihqctdMjBuCvFV2yo/Wmk5UGOvtVIGT3mpZQkKh2OHHHsqaq
 pyFjogfX8FIZ6ksCFIr9/1nTcvt9ORCBayzpI7PsD6ynHZETl+O9pawFkfgYdjhLTeXZ
 MbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699814655; x=1700419455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VA6uZGdGjNfy56jm7BNtgPNmqVGZq5+CSaOwN7oZJ+E=;
 b=DRUElncX8RasQlSypuqmMG4Mxg9a2HICsz0Cga5HayZOmi7RYYqykWo/P6UaN5datG
 GBGUwMJc6QAvTafkhQAIMLdV9bv3oVfHbjtYukmC5c7samRP4eCZckw/R2cRMVRH8Cce
 GSydGeEE3l2+os4qpFnvbz9ZDCjMM0RRPSFbfUIPNKJy9UdjQ2x4tm6cHRdEFuZaMYTv
 iKbmJK9PFP6t5R5LEYL6rk20NYxyZOKu8F/LWrWysK5A8UYFXlRZK9pQU7mqbV5pyDJ4
 3H/TIQfSeawjnlrgNXxodjnfWDplEy7gwPTLUkKKb51kdZmaBQ7d0faSxIrMuU25dkvK
 Mc2A==
X-Gm-Message-State: AOJu0Ywva38qLuXVsrW9qdqmSA8o6px6ylwxL6qO4tNO3d79HRUKjfRF
 Nd4SGaorzLJYD01IwuOqjzbMNA==
X-Google-Smtp-Source: AGHT+IFDp9bTcaoYSS3SmDoNnC/Q/pGeVtVhCAudVa3PU9gSMb/Nn24WRlw1g6TBbP8UrZiRDk3iCg==
X-Received: by 2002:a0d:cc53:0:b0:5af:b0ca:6950 with SMTP id
 o80-20020a0dcc53000000b005afb0ca6950mr4995062ywd.42.1699814655547; 
 Sun, 12 Nov 2023 10:44:15 -0800 (PST)
Received: from krzk-bin.. ([12.161.6.170]) by smtp.gmail.com with ESMTPSA id
 u63-20020a0deb42000000b005b3f6c1b5edsm1308938ywe.80.2023.11.12.10.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 10:44:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] dt-bindings: gpu: samsung-scaler: constrain iommus and
 power-domains
Date: Sun, 12 Nov 2023 19:44:03 +0100
Message-Id: <20231112184403.3449-5-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/gpu/samsung-scaler.yaml      | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
index e08fc1e4115f..9fb530e65d0e 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
@@ -29,8 +29,12 @@ properties:
     minItems: 1
     maxItems: 3
 
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
@@ -54,6 +58,8 @@ allOf:
         clock-names:
           items:
             - const: mscl
+        iommus:
+          minItems: 2
 
     else:
       properties:
@@ -67,6 +73,8 @@ allOf:
             - const: pclk
             - const: aclk
             - const: aclk_xiu
+        iommus:
+          maxItems: 1
 
 additionalProperties: false
 
-- 
2.34.1

