Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3FDA3F862
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A0810EA9B;
	Fri, 21 Feb 2025 15:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jTfIIi95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC37310EA9D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:03 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5dbf65c0c4fso419307a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151502; x=1740756302; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FX08Ji8HI3+KbtFLo37LoGENRgVWTP1rrMFXfNP52RU=;
 b=jTfIIi95FzXKkZFjHABhh116NE1FcKcCloRyrLPIce/iVAgyanDEt9f9DjWCQjktD1
 8+HUZAat4A7qqijrllJxkLkj+rLsdKtsdEfwVe5MPSQf2sLecO+n0G9XjkUw5bJMG1va
 LJSoNV4chHnq14EfRiz7NTbjGDh0Yix9y8BQj16vbK4Ef7HuBFTa2el8tBpLgCZxWvrq
 d+DI2zKP5xZA+Q8KuuF5XVSJm7Hlr28gGSINBYbz7w8UR+UGvdrU8RUA+GgH3jPemwSn
 SPh1pJZ4xeYGtTLU1gh4zlUbdivvmtA7TD4UatdskyzpGyotBQFE3ve80Ff7ziI1sVA4
 f67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151502; x=1740756302;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FX08Ji8HI3+KbtFLo37LoGENRgVWTP1rrMFXfNP52RU=;
 b=tR+asazHmaWIO2oNUncUiq52azsZvTo1yQQjDQkIbN9vOSZTlayRaTDjhsRGJWYJ2A
 EySbqFaeAs7YxFv+vqFmYHtaeGFWP1W97rAI+LwnpNb5/LTz7RdYpHsqFt0NGwpS5EFL
 LcoewviKtoEQA8AHIOcKuP5sTyEpbNE4oqJ7zOA+taBxiSY9uWM/lwSj4Lk3v9S2Kzcy
 qiNclrFts6z9Vhpmjq1mcYNERq59AXPsPuj0TzJe6NDztiFeZCrudSrG3EfJRRmQY7H6
 a1zwyC49h/7BUnc2EejiYHainevSMYdPFWjbmZHkRyWI/5A4Z+1tBVOtXHcdNvkj5Ttp
 gZtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgd4W9iJ7yaxBrWvypy+AWy/l7hFyLtGrlLZtprjXDlgf2IIIvbuuF9Z4VJz8Oz4lZNnVmcvw6aGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4wyh+zCpOazW5J2PV0qt4EWIvhMeIjgQgYxUrQgQCWUGZWPzD
 Rt5q7qOZpfjHgHT9738Szl+wHMjfHJJyk5WJkf5evCPXgqDGVAJ0WmXhPIpI+olSBXR8q17ZJqz
 KyoA=
X-Gm-Gg: ASbGncuCQqVgwsumWa9gMLew5qtk28Yeh9Bk20zsBa5/AXRIuXQPuGnkx7EIjPxCCg2
 W8gC+3tJTJ77y3UcWyMMJ6xCBKy6PptgDNQNOdz1/kACCHuQRePk6uKRUu3wAWMHTJ83C1r5VqE
 2wmlvphav1LLJhyz31Mx84iLQTeDwBafhoz+aV/6eWsEJnZQKqBkfwgIEil8RCnc+y/cdhzRlYP
 SfUHpcDUhfNLUGzrN3HeuVxtfa4q9qRx/8TYsAco/S8TV+pgc7O/BgrUPWo8axi5irMgMoHHVuK
 /jUkpr9CZafh8sidOAIi4OulXzTxs9cd4mL8hunrLDdZohTWRaevB2HEnt14+OFCWE4EILDCifO
 K
X-Google-Smtp-Source: AGHT+IF8JcIcNLGFatnCq0HaW0NuMPpymfwFQbEEmh3gv2V8ShCQQ5aDqao2hSWR/5S30IuJoRYTIg==
X-Received: by 2002:a17:907:3d8e:b0:ab3:2719:ca30 with SMTP id
 a640c23a62f3a-abc09bcce60mr159917666b.10.1740151502274; 
 Fri, 21 Feb 2025 07:25:02 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:16 +0100
Subject: [PATCH v3 06/21] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-6-3ea95b1630ea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vM/Rhh3m/LDu1luem1JmpPvieCwNMZVHKpBxAm5wGsQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqxZqvLkS7Sm+pYTmPzyxyD1ah6V8UqL7LVk
 Al+B54YAxOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iasQAKCRDBN2bmhouD
 14yRD/4hpTeve5G8gpNhRpsfE3K2tTI8bAm17okgIjLbmJY23bAm77DYOU+IcwU5VTIX+1ULQ36
 WayQMxJNrIp79EZQpLnwa2CIqN3/GP6Cts43HcA9M6kgu+nZ82zRLxEpGbMmCbvd71nR77S9KC1
 kH12EHfJAQ3FFbBkjgIdIo9of80KkfXoJjpefixITeHLMUpjekpCfupRGWzaRYEXIVW2ngfEVSG
 o6eifaDoXymOLra2l7sUZgsyv8Skk4lU/VowYgPq5KjHjmzWBVuR8vXNEbLUp0YZv7B3RAlD6vO
 4rIoqo6kBn9CLIRydM/lJmAHyXWtCCbGQLOtvNEMH7CQmok/ZZF9UAAn9EMYHY60tXSh0JiNvDQ
 FkkysUSPmNQ8nJd0wOBZg2I9C80uQyoe7EQL3DGrXKZbM5MD4tBfh0PVNjoiCtNeYFPpNaq3yqY
 8u68VBeehIKcpHPcgZe1JXmfdmsM7/172jbTkkISwcf6K88rGd6BqtpnDWFnr/0zpDH985s36TM
 CBx4LpwdSq77hY2BfPpmHUaGSu5dOgpxujzk7poef1twZJ5TBbP6M2FXQ1cLkspEjddfVe5hRwD
 c7qYE7zzyigGubfK58FbKxzyy2azap7z/epPZ7eEM1um62pbzqAHnx4/DnvN1VdnubRkLFSz0Jx
 BbN0FwMN1cttThw==
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
2.43.0

