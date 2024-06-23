Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672FA913AB6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 14:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9106810E210;
	Sun, 23 Jun 2024 12:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g/E/FeWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556FA10E123
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 12:59:37 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-364c9ec17d1so2098518f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719147575; x=1719752375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ws1yhAOxT/v0xOVLwszOW0D6d4xFjidlrdHX+n3YJlI=;
 b=g/E/FeWjX2ZW1xvHrSHvZnJMFpS9k7arldU6yP6ZBAgneBkgQ2yQSxaEd/+FtNyrJv
 ftC8mF1eWB9zxeC1sLS+rG9jm7GOLfz7H+PB3jhjkc1lAidgAYH/4YXIVnJQB/DChTqZ
 Y9Qa4StEba6KP0qNiz2DkNlVGjf+HAiYCLLnn6d0iulpH6H2UYTpIImudQAvsH93UfQu
 7woSc6cyMvTyc4KiUdA0hbfFpC+9D9YwW/iEaS/S0sWTSmechm1P8B5SedrsbZkGnncR
 I+tcKqiYV8W9BYTNthstw7LwQRWdK4p9zzuVIoK7AFrrwNs11fNA4qOPDucgcLB96som
 FeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719147575; x=1719752375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ws1yhAOxT/v0xOVLwszOW0D6d4xFjidlrdHX+n3YJlI=;
 b=hkBjV6c5i3KCcrGkTLKjNmRZWbNP2H7B+vnCT8Xq0tKlNb/ePJ6nOcZ9MR4oOxvjni
 f6N2bChGSDkXshuPEQTQMdo/Vq7NgGIEFJbKVx8bK+m0ybtFqKQ5D6nVysnDiI/XsKh+
 gqu24Wte9iwOIJlfZA5fFGDTs2Z11ffBIl9uc8mjZ+A6UlA8uB0hQzUiJcj/PFRNrnuA
 q5jmjcC1wzxb7SfLa0a19Eccd1Q3etUISixhtvssatIdBvP25tcUtubhKD8+Pf466MSH
 5nXWiHyxxuvaPj1QRFY3dIAsyLzSpIbZqVgc3Dcbl51dPPxIQ8BgUCMv5wL7Y/ykS0Gr
 ppoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp5T/bC/zJ7Ev6tSrooHVXREKJGISkCdS9ECDXG4hJeWHVrBi9kYycx+mXV/FgZtIQpflurU5Smv7QOgbGYhwkS8reXK2eHO5msf4JW+v3
X-Gm-Message-State: AOJu0Yyr1EZfRTvCleEm5uT4EjOkYnFBoa5767KnFjrynOPv3caY09KC
 H8cm6oIygojG27Kxg7u5c4jMy2Fc3Hkh7gQEDM5Cpah8pghAIaqdM66YAdRKGLo=
X-Google-Smtp-Source: AGHT+IH/FPiPO1kX2dxDboF7jruNga6O3TVW36OIWCsw7kwZBc8YPjnPRr443tH7ldk0wY395QD3/w==
X-Received: by 2002:a5d:6d02:0:b0:366:ec30:adcf with SMTP id
 ffacd0b85a97d-366ec30aeb4mr1166492f8f.5.1719147575020; 
 Sun, 23 Jun 2024 05:59:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9bfe4sm7245088f8f.53.2024.06.23.05.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 05:59:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH] dt-bindings: display/msm/gmu: fix the schema being not applied
Date: Sun, 23 Jun 2024 14:59:30 +0200
Message-ID: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for
given binding validation if the schema contains compatible list with
pattern and a const fallback.  This leads to binding being a no-op - not
being applied at all.  Issue should be fixed in the dtschema but for now
add a work-around do the binding can be used against DTS validation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b3837368a260..8d1b515f59ec 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -17,6 +17,18 @@ description: |
   management and support to improve power efficiency and reduce the load on
   the CPU.
 
+# dtschema does not select nodes based on pattern+const, so add custom select
+# as a work-around:
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno-gmu
+          - qcom,adreno-gmu-wrapper
+  required:
+    - compatible
+
 properties:
   compatible:
     oneOf:
-- 
2.43.0

