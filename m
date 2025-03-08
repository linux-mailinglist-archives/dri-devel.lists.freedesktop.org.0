Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17812A57770
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 02:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748EA10EC63;
	Sat,  8 Mar 2025 01:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JQq5yZxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3A10EC5E;
 Sat,  8 Mar 2025 01:43:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C5A15C6602;
 Sat,  8 Mar 2025 01:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA71C4CEE5;
 Sat,  8 Mar 2025 01:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741398201;
 bh=OG5d4gY7vmYN/Ho4ZXDwy54ckaj7MCjmkwbMaApZrvU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JQq5yZxJlsLHgKqwEIJjBV36D0Kdgq3y8Ju9bXkzTOORm1xc2n8YZ89xtV+KxH4cR
 J0hSfIHtRE/RZhILpnFZN/jvw/q+O61Cv5dCsOJMLsbG22OKQwertUg/gsaWNK+CjG
 Lm0xLwep/ejVBAyJgQyAxt0iTspdKtdJd/ADwsTiopeVxh8Bl6JS2AZ3EXlk+TArIF
 YVDYo5MNJlnaIHuytj/FFTU3FzFF9Jjrjd6l53fwTHNjsM/L0QAo6gN92Cv9D1Zu7P
 h7EKGJCF6OjhbtuYleg5p4I5qGVRGtpnGeXJMJqf5x5lp1NFW41xCSqWGTwYjUejzs
 9CUdXmUfCH+Mw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:27 +0200
Subject: [PATCH 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-9-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j/LGXpgnuRffqJSRqVOkk/ZdY8s1uzD2F9Jjdwztl/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6CAxxZGDgsjcLcAI1NZ2TOAk2MEfUKHJoSf5
 XfKxzcufCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8uggAAKCRCLPIo+Aiko
 1dM/B/9hE66yTgSssAuebWoQUA0xTmBhut7MIiW8AzsAp6XUxO5+gBnmAu0vc76K+ON8DqKP0a7
 exediHmxBxwPm+jtH/vOnd9Nyw+QZFohfmyMPcnYwl6EiLZCptHnDR59t5dwFSOCRmnpF1Q7+0K
 NPoGLkVRcTMyddOB1wHSG03Uwm+LF+Fq0v7ZGuOjw28ilCDiDcCwa4lpaSlO2SkA0V0bQtY2ngC
 K3aDcYf6wQ37aHiN6R7fVQ51Nvc/Vfn2kAoEsHy0pdgUs8TAc7j485cIsqc7le+csce3tN2f9iO
 dZkXgfi5xVEwi4mENH7Fn0t0eLukFsRkgfDo/Pt6u9zOUbRe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5

