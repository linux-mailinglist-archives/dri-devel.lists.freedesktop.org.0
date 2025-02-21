Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B6AA3F85A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079AB10EA89;
	Fri, 21 Feb 2025 15:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Op0ATXya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEBF10EA93
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:24:53 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-abb88d2b67eso28360566b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151492; x=1740756292; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2cslAnLurx2uWkIblqnE5n5YBSWA6fYOjQz9w/DOA/I=;
 b=Op0ATXya8HErOpRQ7xm1noMFoy3tUHCtxsUcsYQmoVOG82s65gShcqLyLsuaiBkK4S
 Dc64ZpEr6IumQ1asgA3UTefIGbIhpj1csdWCuR6ba0Myf+aKqYAkw+NFlh9SmpIRwLi2
 ScLHWdYnSC8zPFqVpI2f7Ye1qRrlgx7hzvMlxKC3gN5sm1spIHUpXJf4V6HZBrlgD1Jh
 2LAnbrU9vi5p8sRGrOFWyIjt0tSt9MvKu4KnOWVq2NL3YcUjKUBNRus4EF6oHnuK/rtS
 v56rJv74C+ZJwzJNoqUu6IXqrQOo0tZaTm66MbdalAIcc0C9yiAhblpvrlK3UVOJIOJk
 +F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151492; x=1740756292;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cslAnLurx2uWkIblqnE5n5YBSWA6fYOjQz9w/DOA/I=;
 b=hltkMCaNiYad0aZdKR4X3JoJXdxcQuQpZY8Icu4uhdlVyunJK/n2/7JWgDdKsbLzi9
 VjRL1YHxLNRSo/EHJp0R1jqomnuNw8tBklp/N/aLFLgvWdWCyxd8VsgrIlNwcGA/9GtA
 18wtnt6y2wK3NhBmVQkcyJu5VJj+8LvQppINYKAJsVubGcIk/AVNtEX6FrZqiVksTMOX
 ihsxRIJcxSg/bIbfFyoHS2UDfhXaKQObzGTQXWcZFxkPckVYI2RrLrnO6+HXcHcIlkKB
 NYKwcfGLDeEZ0OH90rDnnGGpIMdAm95FFnsoOYmtNSK0VjDXcmnGf5AECnRpWGw2/iyi
 zyfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9AZ4au2Phm2Mb4eceBkCKrQIcRCotZnp5/NDaZ1xtFOM2dEHjLpH+WFtqdfr4pZkB3iJ/V2+zju8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAhYHWxzBSwLo0oZcdS4+89YBAcEP8Lix7Ymgf9j90ADUPamKI
 h2LpBpK9LBFPoQqw3F/qGckTCYWyGQqsDWlGC82POXuOhmKNhtI3IKolUfRFhXU=
X-Gm-Gg: ASbGncuMUu50JduS31L+Uotj1hH5olfJSKC6OsHiiTCp0thBcqzzhU0fEXmlg+iKZN4
 ujSAVnwaNdfVv6eRSKMkKspHFxQ2NTA/6DEQoJdq6J5bxLalJL48fU3cZ2kV+HfxZNeV+KHg2uB
 wOl+qHkOm5GrnmSF89z/EQsMU0DSWQugjU4W3Dj7Ub2xL1xHVAJY3rvO+Ya6EENCF52zWBNFCkv
 c/8Heq6QZxRkIngs2UqznNqP4lrN9C6k6Xk2Xis1ahe8Z+2QdfeiBuSbCL3OmAYGy3QGewsm7Ps
 LWQCCLHys7vBYnfFlLliEUzKquNqNsFkNfLmq8v9XhVwXsnKulOOSHj4rFX2a5ikauo5d+pdXtW
 s
X-Google-Smtp-Source: AGHT+IFKIQuk3xKeyN1ac8pfvFoGo1xm55r4yDfi0obbysI0RFch3oRgefyzIhmQ666lB2tFSSmLeg==
X-Received: by 2002:a17:907:7286:b0:aa6:9c29:86d1 with SMTP id
 a640c23a62f3a-abc099b8837mr122567366b.3.1740151491870; 
 Fri, 21 Feb 2025 07:24:51 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:11 +0100
Subject: [PATCH v3 01/21] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-1-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gC/FypNj+ZpUyniZ+8EtOmpEbEyuPuBTmn13DjMHXtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqsgXbxiTLYqR/PSolFrAbqMkllUjvxoL/mo
 OOMU655pAqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iarAAKCRDBN2bmhouD
 17YvD/wKGo6OfOEhuVfcMzmhFGgg37DWi/RIVXURAzYJ+joeU6L1inAafck7Qy+TNi6sa6k8YO1
 fBublLhM8E95wDVz2/WQV6PDZNKInMFryiQ8uIV9DGH4hqdtEMBp8ori6Rb1RTJICbSZWuTjEyp
 +9pggs6KDS6zo9nqtigeo3Tzcg98GlwsgEISJbA7N+ZfmNi/oNk7FEEdUxJ6FK3n61s9uoEgP3f
 fW1a/fSYE1ZGgoZ7R9UBXRDmddpNJwIYT32TWF3SJjr+tSXkLOnUKloaDf3FCpe/viuYqusz2f3
 muedbNjHozEOgPn3dpTvX6xCOBqgi605kIhmwJxme4fdw73jbYW3OBinFykeIAyosNeaHFwAt/9
 bZFl89wn8JGqzw1WpXJ+vPo0E4Y52PExXh8YYS9rSpaiAvZ/XPpoau6LFw2zAXFpuEpQlWK0fKN
 K81L05zXOa5dw8BFdJPaOXXqcVk08zwTqtxUeRWGP6dYYF8VPPhrdB4mLj56sNxguCHUR18pkW4
 HJ8UIhckPvigJQ4xaKWiwMOh1K4YIDf8UwejgyXirT3Xu00G4FBt/LnVt/MJsO6PtzGtbzY5pOj
 +Uk1USE2aNZrkUR6OusYZaTDOx4n5Vafs9/9NMO3ia2lXDdiWIDh9u7Yj8Hd4CI1Ev2GpyPwC1y
 kL6N46HexQeM2nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Several devices have the same clock inputs, thus they can be in the same
if:then: clause, making everything smaller.  No functional impact.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
 1 file changed, 5 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ffbd1dc9470e2091b477b0c88392d81802119f48..e496e5430918d54b2f07f1d5b64de85d29256951 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -248,24 +248,6 @@ allOf:
           contains:
             enum:
               - qcom,msm8916-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: mdp_core
-            - const: iface
-            - const: bus
-            - const: byte
-            - const: pixel
-            - const: core
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,msm8953-dsi-ctrl
               - qcom,msm8976-dsi-ctrl
     then:
@@ -328,28 +310,13 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
-              - qcom,sm6125-dsi-ctrl
-              - qcom,sm6350-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
+              - qcom,sm6125-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
@@ -393,27 +360,6 @@ allOf:
             - const: pixel
             - const: core
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdm845-dsi-ctrl
-              - qcom,sm6115-dsi-ctrl
-              - qcom,sm6375-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0

