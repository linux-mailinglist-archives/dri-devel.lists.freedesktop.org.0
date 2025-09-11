Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7AB5321C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B4F10EAFE;
	Thu, 11 Sep 2025 12:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H+GDVnGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0701110EAFD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:29:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3d44d734cabso595357f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593758; x=1758198558; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iU5qxqQ3QlAqV/z++RFsbMDTEhPRXVKvJSuYqKmt2lo=;
 b=H+GDVnGlkm3lOn3GF5wTOaDOU8J5tPN2ATwBpmKUHv97JgAQG/DksVZNY63wAywaRv
 XEHXqVvm2o+yPS3OV7j1l4aNFWwbN/kI//xB7ocfbw/13pc/PoWDZECOPjhCGdLGVb/6
 184jh+MvFOKsHi7SbXnYyWaL5K+YvXwSD87c34VSHbQqSiE83pdsZkaHiBR9lpCL/o/8
 wpv6jhzDDOuuVcr+1ibdXwWnvIS4tqbOOKGpFQr147suHw8iGVixMN1gLtELM7aekEPu
 v6mM6vULK1dVToYA2s/Zkpe57TH+LST1qdXyg9+t3Bv1Ps3ZMsl1krfzjAwgfhc3i9OR
 7w+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593758; x=1758198558;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iU5qxqQ3QlAqV/z++RFsbMDTEhPRXVKvJSuYqKmt2lo=;
 b=RpXpS2ENxac/BWqs3V9T8EOFh3qCkjaBgDC3nsEXz/CNXbp8WBodI3JcfAWEhQT34G
 IJcC4qe/kPn1oChcfqtUz6k0CEOdgFEzE8a/Tvf9BDd88VE8Pa5XJ/hjLlJYFSPDa7CC
 Cy6yNXEffWJtcX4hERCqCJl15xXKm/cpkqS6nSS1WKpN+t6Qil4HkQxJALUDvj1tr7Re
 Tfui9pPYJ1f4YIuQqWuwq0HPzfT9hXliU5+JsOCCDQsHFQSJA1hr7JgjXH3ED73G0ZTq
 DA+PuqufyOUzOdSW7cBLRcxJWeUT9p0kotVpt/9UyY8rP2Py+HIDnU6uUcDwSCq3ZG9V
 iFYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM0Fp4UVF7yl7RstvA6kvCRfsb3F9jcW77JrOgFCAwmJMOczDKSWjmUa/HH0uqAFqSdKqQ9NdY+sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVaZLCQRTpDUGQ6V4/sHCwqOSVv8d95GHCYL9W0u6G0rVLhihM
 nLaTEBk+BFn25yEG4jbbixfldDBHfC5UGsfk8QEaMAEkB/uOiJWsz4Gb5JoPiOw4jTM=
X-Gm-Gg: ASbGncv+jGrJj4HMzGnbglcesTaWUTuL7NcfbGxAiQ5DMrz/oNrayJhCO4McxCEIaIQ
 KyWLtveRvPBNbyywaL8Kkr+MDUgb1MmwffjJTCijjAvJBqnwU8yJxNUMnljNuhq71woqLK0zD/P
 FI1ocdljC8jFsFfhuyNuaOJSoEdfQ80vHic533X0323+goaEj6vQepNeNkSll2bvAoJXJKDbFiy
 hySwkxxURDeQjuLNWGS4ST+dg26KryeFrGQ6kmVVcoDyFywXzXjNdZCxjOKg3OAhE2WZ8/fPtxB
 XbBUMJpikdcrfZS+oN5DKklvmhw9usKRc16Gq/bZOP1/mKQeAsa9xoYEFGl87gd6NG2tB/qnlHQ
 2XxzwjL+qW5jUamFTmmJfOeh4OsJZPbrjWQ==
X-Google-Smtp-Source: AGHT+IFWZTWiXMDADOt1G4QAp/SFmNA4LJ7kToOBm61D0izqVFxvUQDX8KXFSUag/JDhBo37YTQjjw==
X-Received: by 2002:a05:6000:2502:b0:3e7:4835:8ea7 with SMTP id
 ffacd0b85a97d-3e748359441mr10681959f8f.8.1757593758409; 
 Thu, 11 Sep 2025 05:29:18 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:29:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:49 +0300
Subject: [PATCH 2/6] dt-bindings: display: msm: Document the Glymur Display
 Processing Unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-2-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=AnOXO7m0V2+5EV8Mv50wScBsDq9l11L/Vhh0fgbgYEQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCRIB7YzDXcPBwww3XfuZwJ96qdhgZxW+R9+
 CJm7Erg+b6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAkQAKCRAbX0TJAJUV
 VueyD/4vMtmE+QKJqal9APF+kXMGk4ZAPOWfXP3dl0dBg+0h0tdInJRu/Do4YH125zjiG5dBK7u
 +HWqfLrlaWCCFKoTSyJ5cwIQPjz1uNHUKADtGkgTS/35F5q6VQucEthCeqiAPzdHN41oGG+AGBB
 VMvPgvrAITIVenCzY+QHi1urWXtgkQhdazYZf0xpH4S54w2s97CAhnHOd5lOCfHeifAESXdlsWt
 ponTQTcqvzEH3zXsm2rWfOghtc0STMzVNqafxZZL+o4MgghO/D6G4uN4oqbKwLOVf4SCw9vAlF8
 7AX9jZ49eK/+nC4An08NNEka0KepmWEmv0AWuNkMv7PS0Y2kOYo9tRMizkv47I/9gUbnfVEjmZs
 SoMzlBKNMDjIqa+yK9/lbuzij/tgObP8qFtkbxjD1fdgSunKi61ldchgvC1/855LP5Rlpjwf4v2
 1f+IRct9ASrlOdUpUIkMX2AFfZPyLxqTSKfjy0+F0z7VlAHFpiyVVFRNjBbawkwmudOIasgH1N4
 Ln7qYqSejvwnLyCmTK2Xi2xSRZxT/lGgxV8mpdz7FMQ0nIUQ62cX5lwljAGpyUO3lcnFGgozpbx
 KCyz+KBDTK1WbH1hdhXBf7Kxva2WOrCawj578XSp6vEaRRfAzBXV9uCer5NORaIeKZNaBr/RWyh
 Ys0TT+ArWe7Uq1Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add DPU for Qualcomm Glymur SoC which has very few changes compared
to SM8750, just enough to make them incompatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..feb1b8030ae0e381118a9482252a915199e19383 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,glymur-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu

-- 
2.45.2

