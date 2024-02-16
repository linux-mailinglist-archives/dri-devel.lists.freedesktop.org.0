Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE6B857AE7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFF510EAFB;
	Fri, 16 Feb 2024 11:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QDpcN9xy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D67810EAFB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 11:03:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4121a8635a2so12178825e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 03:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081436; x=1708686236; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AWxHJkBPvh7dfzfYkfpsJVh1kKWdDbAwY9dahQR1fTQ=;
 b=QDpcN9xy4yiMfyZPNXQQ6hvx1x2miEg/K9CxHNezbfZ0E+4e6nU2tonGjuEiAdm+jh
 q4wXepv9yU/9FDtaCT4ouV6nk2SrC1cFR8rkHSd7J2e1nFjtj8tBTJV8zUhQlBXestxO
 0za082EukgG3yhPt5UUjzdgvWBnfX98HaxGfkN0WoQmW3EZDob1biGKdWmra1psLmwXh
 LIbrEdDj2txpJBg3Letn36SQGmSsaBaHhQM1KE9Rf4jAUe6bU0ff0oDQ3Bw1towKETBR
 cvXTgF7O9DURQrUVLqUi+Br3uYOiWjTffk+5sju9BK1aYkY+sG9cfi6EXoi3n9SyqCQR
 /d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081436; x=1708686236;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWxHJkBPvh7dfzfYkfpsJVh1kKWdDbAwY9dahQR1fTQ=;
 b=DDUVTAtybpJShu9BPAobQXiMLJzrmxrUI0ZjF+PhRLm7Q8+X6YVp3XJs4PswpL/XK1
 p2FjdWlO7ERv0bDg77d9cFt2B5AeHtwcFKPqgOLIqXrVwDaKqtbtk/5Lpy+IjqmFSMFx
 lA2jgyl9I1CHCcuVM4kOSM1XyrKnZh8lpTNA4AYNJbY60hOrTtrbF0yFaMHOp1tqXfyv
 2c7l60LBetKNyfaWNvHnIrkttBwscTLYhI1mfMb8HGgQgRMKhWsX1c5sCuCnpAx7TRfP
 iOBzv16fr0dGKYSYM5m5DEDrr0GjAyP1AgjNDEfi0KVDhtt9RURuHYki1CPqHkT0O7t/
 iJFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsaCp7Fh/70sK+BAWGPwwof/DGuBSwdKi7powyCOojQXynIXhy2O1DGwildXSuDS2RkVAbkzdqoAbd3+b+8OQwlDgIU8JihiWZ2L/EARXB
X-Gm-Message-State: AOJu0Yx8ZrrbMXwtxooLzZ4RMQgEJgrl+wtLz2Ph2oJuCMMKI65SgziL
 PLwQS6aTQbo5Iw5iXyPe5FzEMLCNAB89evb3x8NMbIukOrLKI7iXChpIqgO274Q=
X-Google-Smtp-Source: AGHT+IEibQ/Igt+OBTemdGFhAzHNU82OtjS01cgsM+Rhg5xCut32DRol5sAh63j4m2MM+BVPWD1pCA==
X-Received: by 2002:a05:600c:1f89:b0:410:656c:d6d with SMTP id
 je9-20020a05600c1f8900b00410656c0d6dmr3225887wmb.18.1708081435852; 
 Fri, 16 Feb 2024 03:03:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm1993174wmq.37.2024.02.16.03.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:03:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Feb 2024 12:03:49 +0100
Subject: [PATCH v3 2/7] dt-bindings: arm-smmu: fix SM8[45]50 GPU SMMU if
 condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-topic-sm8650-gpu-v3-2-eb1f4b86d8d3@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
In-Reply-To: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bKSwIMquL3ldQeZEbQDg4MhNZo4DD2FIt5FqyCH+Nw0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlz0EVlZtPi8kLuM8GFD/opq53aRjm2jON3EvioLGw
 Pp2Pq6eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc9BFQAKCRB33NvayMhJ0eJRD/
 wMuGubcv5rl5NSZDd1jyjLXF66wVusziyc0Uj6bd6emX+Y5vX8RUWtEKTpyuOGzPk90izPMId0UFzd
 z9OcL+cud177MKnZ59fRzF2Ceas8GdkdI4TKwhvW2c9NzmPb/k/wDQHKVfRlfAPfoHCYJ+Yth/tDeM
 aAWpW2YY7srWsK2LY3uOFMHHVDRUvJgIPNZMxgu+m68UpkxK4R+r1nTOPgYD5DDhUXSts8P6PU1r5q
 bLhP5LCD/OzJQTCo5JOI/FVtFTIY9neCngCQnQQoBuu8g0NXlq2hVCtrH2Q8EK5nIMxony8Px1fJVp
 1zhgF7KvBPOv8+ZE5yAs6qEeUaca/GMh6iaQ1eH5voudCNhtlCNllEiuUcH/eWexoqVO96PSjg5h/C
 6UBqp7apKCKtQjCbUU1L1aXsdHaJWKL/elXvZGroLEZW8hXjWR+03aD0RwKN9/efIQjhReSzKyyFMb
 hxLlsCYOdsAmYwoY50+XOvmZZZ8+tfAM1RHCQx45llmq7HcYCg4aypDnMYpAJIOTKjJzI+LrVZIFlk
 5+DQbwIN7Ux0ULMwAjTGy69f0f9Ta0cyOs9C3QoAeXrGH8QVgxAEJb3uWYCCfs6vds6LHDr6c1wJx9
 GS0yygCa534u2Tc1Y2EdlZgGus1HblB7dz89fVvGMsFZlCXZ3I8lXguGKIYw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The if condition for the SM8[45]50 GPU SMMU is too large,
add the other compatible strings to the condition to only
allow the clocks for the GPU SMMU nodes.

Fixes: 4fff78dc2490 ("dt-bindings: arm-smmu: Document SM8[45]50 GPU SMMU")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a4042ae24770..38c48131e6e7 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -484,7 +484,12 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,sm8450-smmu-500
+          items:
+            - const: qcom,sm8450-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+
     then:
       properties:
         clock-names:
@@ -508,7 +513,11 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,sm8550-smmu-500
+          items:
+            - const: qcom,sm8550-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
     then:
       properties:
         clock-names:

-- 
2.34.1

