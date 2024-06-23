Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C587913A3D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 14:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940210E013;
	Sun, 23 Jun 2024 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g9wgUsy5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3FC10E036
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 12:00:31 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4217a96de38so25343715e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719144029; x=1719748829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wq0GDSPoIp4+sLNJUnd9TkEoaORchJ/hKSadjq9Ps7M=;
 b=g9wgUsy5Cosu70629IeRBRxj2yqLUudk4TPbnX3xV4Rb8HKKW1c4B+CVpOGq5BTvYF
 aqkVnK6vqacBAwSav56jW60TaI35YrKhsdRxaRrZP9ifpLtMsEhUOzEo6B2QAwUEsTE1
 sdTLWN6WrxtsPIL/NvQAiq4TzSu6QmlAduSFPjSEgj9q9v7NTF9SURCzJHbVd8ZAPRm2
 nMYqrbCV++jAcocXe0Y6ckkXRSLCzi/zp95O6dggMug0LQcaJ9l37j8cjkzotlee/UPW
 pgrg+4HegwaDLbg4ju5beeSIcAdoKbWwpFrzjTsyMR35D+wwXdpyMcYegvTrvFh5uI4H
 243Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719144029; x=1719748829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wq0GDSPoIp4+sLNJUnd9TkEoaORchJ/hKSadjq9Ps7M=;
 b=YwORRCxNglh5T9qgBGCKeDX7ueplZStdWeIm9UbCLR2zbQITw8ZXGQZKzo8Mmhxl4p
 DTUs4mLungWVhK3qTGUvxlzqjXABDN0YVfRyhmjCgTHI/PWC6fDjQHthBu5WDJ7fvtlJ
 HrObGWxvIbSaJiDkme0WJu2OCixPQ1EP1dIJjWgFYE9VqMOubjgPMlJE8akochjsagDM
 A75lqX08WEvnrbGxROhnRn31YoiFU7vibqsD8ztPGakiShrc6JBmnuHdb+PmSgpzdkcs
 6WqjGz+gLZu8zrKUG5A05t5qEM7vMnuWgA4V3x84Z+v30f5vNSI1/cbR98Qq4EErWc+i
 bq2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnc+UqV6hHlkA6RgPbiMb0xbmguIKqOstdv+HFmTlMclgbpqj3eHcCBIMov3Hf45HUS6CoWGSgI4ygSkF0JoHmg5qtjYqjSKEgV/efdgEY
X-Gm-Message-State: AOJu0YzGmFA/orcSi7YjpUXOISG5ksCV2m2E4oXIxhd7/Smhwktv7Efw
 JS/qo4P8j9xo2DdbQVF1mwDTG6L2Tt48Vg17882beEKmNq08lL5eNat4ny13qJU=
X-Google-Smtp-Source: AGHT+IENFAK7IVpV/k8lzPMo9UahIiF1uHLMk0nrZAmjoYC0Fijkz3aInqbbeS6fxxaaR/xdi+aTqA==
X-Received: by 2002:a05:600c:b44:b0:424:784c:b13b with SMTP id
 5b1f17b1804b1-42489e3ac94mr22668335e9.13.1719144029481; 
 Sun, 23 Jun 2024 05:00:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d3basm105465515e9.4.2024.06.23.05.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 05:00:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: display/msm/gpu: constrain clocks in
 top-level
Date: Sun, 23 Jun 2024 14:00:24 +0200
Message-ID: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
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

We expect each schema with variable number of clocks, to have the widest
constrains in top-level "properties:".  This is more readable and also
makes binding stricter, if there is no "if:then:" block for given
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 40b5c6bd11f8..253e68d92779 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -32,9 +32,13 @@ properties:
           - pattern: '^amd,imageon-200\.[0-1]$'
           - const: amd,imageon
 
-  clocks: true
+  clocks:
+    minItems: 2
+    maxItems: 7
 
-  clock-names: true
+  clock-names:
+    minItems: 2
+    maxItems: 7
 
   reg:
     minItems: 1
-- 
2.43.0

