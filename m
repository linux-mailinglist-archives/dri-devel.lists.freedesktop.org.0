Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68843A5543D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90E610EA5D;
	Thu,  6 Mar 2025 18:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E55EmeLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD33710EA5D;
 Thu,  6 Mar 2025 18:11:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 112C9A45054;
 Thu,  6 Mar 2025 18:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2361AC4CEE0;
 Thu,  6 Mar 2025 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741284698;
 bh=TGDEu2STiqYGeD3JRa0RBM3cTzKUNBPChBweLyyidiw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=E55EmeLXqmagfIpWgpi7jjJYLRMx2cH7bqj2sbGLvoDlVUQeT1qXYQVQ7aBz3TfBv
 L1GnHx5iJw5LILaUZVVd5PUrb4lBJy5A3bOvhsr+msMBuXBL+CyqGMQkjSrmFm/GXf
 /xFaYgKtDBebfBg4n7FWQPWFr865vccT6w1bRI6PuPcI5iC3MDIwANy6IhM5L1QBae
 mVfq/Sx/g+YDAaekZJSltViMJx/g5vMUbh40bt/333QKpyM8TT+R+klLD6QhF97RXW
 ce25W2PW9JcvmJIe3nBpiOjhnzPrJOqDFwHAtOYLEwBfp0n0nUKzK1MSG8kzPUy+hb
 vy7WYqrtgKNBw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:13 +0100
Subject: [PATCH 01/11] dt-bindings: iommu: qcom,iommu: Add optional TBU clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-1-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1136;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=GbSJhNvPymdXfLEhMABU7ydqhf3LjmvyneLWjlqwYcY=;
 b=Gvxxdpcoh52RW4kU1ayFveBjlOW3okp2WEGgXcJakTS1JpAZj2OYMvZDAVGPqFKpZL2uVdxcN
 rPakUHjJQTQDsRfMVYqAMosWgIdVzkB5xsq0u8SY1sRBLb9OTb+VSmp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some MMU instances feature a Translation Buffer Unit (TBU), which comes
with its own clock. Allow describing it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index 5ae9a628261fd251c1e991a70662c6d37ef2c4e3..09879bc8ad8d04b73dd22f7f64b2d1de60409941 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -31,14 +31,18 @@ properties:
           - const: qcom,msm-iommu-v2
 
   clocks:
+    minItems: 2
     items:
       - description: Clock required for IOMMU register group access
       - description: Clock required for underlying bus access
+      - description: Clock required for the MMU Translation Buffer Unit
 
   clock-names:
+    minItems: 2
     items:
       - const: iface
       - const: bus
+      - const: tbu
 
   power-domains:
     maxItems: 1

-- 
2.48.1

