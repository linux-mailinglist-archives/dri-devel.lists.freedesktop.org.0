Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC2AA4C40
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F5910E7C5;
	Wed, 30 Apr 2025 13:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q8DJ+RLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B1810E7B1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cee550af2so5072615e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018076; x=1746622876; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=Q8DJ+RLLv+OtEaUzr8zk+Gpo3ON9s/ajUeSshqUU9AhPqPCs7fN3Xz/BUvaYVlK8eW
 iVIiZqBLAnV+w7oUnm2YehaHz8KwvB4xtvwJwuI4jfKkHpS50JHvi8p/BQXpwlkspwve
 KNmDaP0ndymLndnDYfAqjMBx2rrYeZpZ4V21ZcJIp5plFzk+NYU3yUYfYrLrMtDnzSzh
 3e69Cli7gBjxKZUmIZWWQXf5eLsUbv4EJDhtVtMxNBab09IIRyT32PDQI3vxHG+s/dle
 +yq3i7AkmWw236aZO/nrtPMA0kkumK76AYL+5q0YRxh2du0TTu9g3KmRM0ZlKLzvEMRQ
 N4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018076; x=1746622876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=w7pzqtyjorc8Nd4KRzNbOkaMea+lntk9zaYeb7HN/YQUSquF2Efq5J1wxj36VOAD62
 HMSWNjO3hgR83V62A1o7hsCW8F9Vpr2rHygurk/C6gGDTIr4C7/8URRzHSbs2iDwLPnn
 YwhU6nXpIccdrTuQTYoLUqxkiWAV3VYTA9PlUrNeFgvz7I9IQn3C+cuj1Hho+C3ksQG5
 prHqO9SoGMQ80rb6ItGyvl+t6yPYCie/QFk7RTJn5ucxiCP4mjHJYIsjqt5MbDugZGHV
 NHs9LRifJHJTtRt9n6Tz/TCEmBRn0qWziYFX3Aroi+2FbbYymKM8f/LYyjgOvBq8R0wl
 Ip3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHaeytitxS3JYQ/SN43DRKjj55UcmhRuukihGKRv/lks0kGbj/y7ThI22KRlgX62HIXmSnqkRHgg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmfdGlB/l0uRyJbfSFDrWgO/bilfCKfrCucqJv1rF3RW6593Ga
 ELPmmnjOadMcBYyTJS3WMKxXAiOWPgANUEo8vt+rJRjfMZzTN1ONGGjMmX/xaZc=
X-Gm-Gg: ASbGncsVaAl1GE9Gl62k24OKcoSZd+EEEUS0vu2qhHLkwuQDE4ofv5ZTn2xp5MjhstF
 M9Qp8M2ofAoKzfrgSsS7atH0co7K5aDbjDWRZ59sCRTg+sHrbq9VN4wLGXv0j/Ik8CBwISqOwtq
 +iIDCXLkfxcN8PofflVadBO1mLcA9zXuXqv0Z+7fp+ANx3ruNG+zr9ne6GurJDg0BLu+0xBqkr7
 u4gqxGGqUdga2tzTYM0Gfrn29X3JfVrDrEt+FPmj/Rwc6stMIiqJ0F0jJRr6oJhf3/rnIfVv1G5
 87GrasouTzQz1l9cxcXaFtvEt8hSTjQsmw/Dag7MkaR53sM+BzFRJvV/Vhg=
X-Google-Smtp-Source: AGHT+IE18JTYANDILCbq/VvMcef+4LOGatEO297qJkCdJ+51jnqFQMRJCyhHvokQM2QNs9XBMo3gwg==
X-Received: by 2002:a5d:5c84:0:b0:39f:6e2:f846 with SMTP id
 ffacd0b85a97d-3a09007e389mr808544f8f.11.1746018075739; 
 Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:34 +0200
Subject: [PATCH v5 04/24] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-4-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh72FpXr2OvUJMdqZsONrKoHxF92CtBzOH/+I
 WqrcPyAtRmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9gAKCRDBN2bmhouD
 1+MZD/9OF5Hp81jdBQTywFeOv8VerfYbTkQjgvr569Zvd6mUXMgHttCIYZ4RrBdqh5+U2LjGd9o
 yA6suSThzxkiMb7b9X5JAtwcXrNXHTwFyodBiUN3IWd7i8Iom7/LZaHbJ3XWcyiHjFPLXmZ4iAC
 f+W5hqAcKjZRLkTjQOG4XRbVmnZnuhx5K9UKomzZ3MseyCdJgv/4qeiXVRj3vTco/eqCPh4x2Hn
 +fsXYNuJU8tGelCxGIZgQ5uOV8X6YiNZ3dRjQjaajPNbtL10FcLOJyjo5EHhhGCSrg/QIepbrT0
 3hfYRzQaef8mX1/7r9Da8S01UUw3lcVDEbxAFPRUdj9tHr3sn1Ym4tlCWlXprGysGMn+E30fyCX
 J0nXHFAH1HaAbsevaDzc3I0Nq3LAIn0+NMHbxdoAmgwtN8OS8d2x2udAbugBFLZtV3lJK9Zf+pN
 20XKakZvuzlqs7iLROykPYv14kRuBHe/RpUJblAVD6nlO5bbSL2uX/KJ6P8PbOzz9Ji+e2gu++t
 niXHUk1YPckv1HqkSVyI1djubaN8W6cxm9W0uoQdcWcsH3Tx9jkrecK5fZd6vtPyn7K724vnsVU
 mbgSnEGQu7KZ2NsTbNxJ1YC4lWx/ihyAP2i54eCqpvPpz+KA1HD/SB2XFW3CGlBWy+lm8Pk9f7q
 zot22z/xMwkT4wA==
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

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.45.2

