Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC18857AF0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CA510EB10;
	Fri, 16 Feb 2024 11:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SGT97MOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62F210EB04
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 11:03:58 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41243d19ecaso3265745e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 03:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081437; x=1708686237; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R8jQXdAWc83YqnRTlVrzU/De4ogxASBLVUqo6LYFo1E=;
 b=SGT97MOJhlfH/C3wn2kXu+kg2TEEKC2gIvar2piwib9hGvBazoJnE/kIqTkkZl/YrO
 JE8nkEnibFgABjhC+qFMROzxCjUbQ8Qc4du/oT6lPBEZHuCtCBx3V0D2ZQUrO2kBZ1ln
 PSCLX7qzYXKJosF0rql1JVmJfEy968HaK/UQO/gLsmWYyGAerEMJ/WdHhSniX4XymprH
 DMPTKJJTPCyw9bZFlH9k61qjoZKzR7LAyxubYL2zefIPcXWYnN4wt/bYJZCXGJP1TVgi
 MBvSKD8oy/LrjvmHFMjkTgnH+WU3745gPMIIruulJY79WR/6Xged5rad6LaVj7es1CCw
 NRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081437; x=1708686237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8jQXdAWc83YqnRTlVrzU/De4ogxASBLVUqo6LYFo1E=;
 b=wjXkvvi0tWIW28CYwwmhfweSzusr1PSdj4qbFESGq1bpVdEOYZKPUBC6EKeCqsAmTN
 M96lmyr93AqSsxm6fHcWiN9a0fezMmfzH11lMtGMq3kKCkCmBtbW5NyTkQcuFTdnb8tU
 THxM/hH1zcoIJYFpsFA3HbtM+hCi0y1hkGVD57dSJpQoWfZPL5BFz3vY4cYqBb1e6vlF
 5IiQlZFr0c+oO+2qqcqH9hzC3FRNsaMIIz1wOgzE5egdP20lYkTu1f0aDe6N66MxD1bX
 sRY90SqMOFBHHnkonHqafnhiMu6AgrBjOunCfCB7EUspOO7ySB4l5GMfmUX/L2sYQnbW
 6fpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU024SNbXWET279jDCF3+m0Xwe6DfEA3Re/F5pvb+RtCd7qj1TBu3zq4cj1vroxcTtiGF41TMp1Ko02AKBOitVlaOpx7Mg5UzjQXxZ2vdWo
X-Gm-Message-State: AOJu0YxQ4Yw+qghubhYxFxnXQCerVuOPM5artje2/jS9QfYqYxTdScFv
 XrzFhmg5in+W3QattKPKe6CnRD4a5Zmzz0Tnj1EX1wOmBXaI50pCoTQJowM2HA4=
X-Google-Smtp-Source: AGHT+IFzz9cIIZTolTBZ+3VO8UaeUFnQ9Pv0L3AFv1B/Cdpl3JFGoVyw6+dpFPhP+R/v9EVwpKUaqw==
X-Received: by 2002:a05:600c:4588:b0:411:e0f0:7a71 with SMTP id
 r8-20020a05600c458800b00411e0f07a71mr3644178wmo.33.1708081437101; 
 Fri, 16 Feb 2024 03:03:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm1993174wmq.37.2024.02.16.03.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:03:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Feb 2024 12:03:50 +0100
Subject: [PATCH v3 3/7] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-topic-sm8650-gpu-v3-3-eb1f4b86d8d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6iOcnqwhICNEx1Y6vAHfd+4RDSuZsONu8Es38mDvAfI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlz0EWWkZTzHjh7vkQKJ9hbFCgC/WFN7MzqEHvZaxY
 8sk4gjyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc9BFgAKCRB33NvayMhJ0RvZEA
 Crl2phZ1jwOzdI4NighnxwfVUB8UXbrQi2GpTJhQkO5V+FITUCJ7L2gAkxXOUPc+U3nyAuKEcjoltT
 J42WrBFVTMuOApzNr/jXoJE4o8uYVPLbeFsz29N8byY6FSUSQ5bCmyAY8d7KtE5YiHBTyIhAzy28XQ
 C/NCVlTbQFRELxV5xFOyCzFdR3KDEoUvx1CT3J1ZnUVYAaMzAT67hju0duvjxzZ41IHVS3nR6QD7bQ
 JJRe3hOYw1yIKfzbV/R7nJBEQCa4JGiBh+CMlapH9gpELgXgpI3vsS5ND1xxS++m1cnIA5enyKpha3
 ESG8nJ252LOKDPSk2FyhoOQFKNaPfbdnk2btPGRdQHM0dtYuSZcJU+cajnDwavOFHJLhWLosoi7Gly
 ABqQ/Sf4KX7dFVCLGAOeoI2kC5AKjTMyN2vAObTttURE8LmYrg66hII1WQGAIQbRmtsZFvVs+m0EX5
 3hbl11a6AEJ++2Q4+XIbpbiuSpqm6uOqLll92/+Be7DWhCfpq+V4mEeRCbRnLK08GSGvHhgohmf/sZ
 hcKBZ5qWJjc/SU/Bo3ishf62Vi3fDL6DOkFFjOcgfjW4Uvrc3llb31nEdfwdEYRBSfWizuMZ/4afOz
 5xz5YmhER81YC4D06c9p+f4wX2tDWXp0WY7T3lUiu3qIbOGSUzRN9pV55bOQ==
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

Document the GPU SMMU found on the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 38c48131e6e7..740631782540 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -93,6 +93,7 @@ properties:
               - qcom,sm8350-smmu-500
               - qcom,sm8450-smmu-500
               - qcom,sm8550-smmu-500
+              - qcom,sm8650-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
           - const: arm,mmu-500
@@ -514,7 +515,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8550-smmu-500
+            - enum:
+                - qcom,sm8550-smmu-500
+                - qcom,sm8650-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500
@@ -553,7 +556,6 @@ allOf:
               - qcom,sdx65-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
-              - qcom,sm8650-smmu-500
               - qcom,x1e80100-smmu-500
     then:
       properties:

-- 
2.34.1

