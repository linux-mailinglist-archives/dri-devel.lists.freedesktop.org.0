Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927412A2060
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766E06EB21;
	Sun,  1 Nov 2020 17:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A28C6ED1E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 09:25:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604049908; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Mf495N1kOp6PaUPWfrbYkZejWWJI2RzjgHv3VyrN5Q8=;
 b=Mg3bLiFanFokTpIrEJLNuQpDFhbhZcpNdfO2Eerlo0mjwd07U20XpYBBkerH8g3M5WORV4Na
 XqhUuJwiKDcmzunJ9fPulVarDmTj4NF1UqX4ybR446gS8cZL3vOijWWOOzqCBQxKZnjI9+Nu
 mdDubu/mVT/xsJh7Jx1IlwPYA28=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f9bdbc019b4d9bb883647b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 09:24:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83DB8C433AD; Fri, 30 Oct 2020 09:24:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95DADC433F0;
 Fri, 30 Oct 2020 09:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95DADC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv7 6/7] iommu: arm-smmu-impl: Use table to list QCOM
 implementations
Date: Fri, 30 Oct 2020 14:53:13 +0530
Message-Id: <d30ffda4c452dfa3f195a6a0549f786cbb8c378d.1604048969.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use table and of_match_node() to match qcom implementation
instead of multiple of_device_compatible() calls for each
QCOM SMMU implementation.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  9 +--------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 21 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index d199b4bff15d..ffaf3f91ba52 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -217,14 +217,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
-	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
-		return qcom_smmu_impl_init(smmu);
-
-	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
-		return qcom_adreno_smmu_impl_init(smmu);
+	smmu = qcom_smmu_impl_init(smmu);
 
 	if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
 		smmu->impl = &mrvl_mmu500_impl;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 0f763d555c92..221e2a6a3231 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -314,12 +314,23 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	return &qsmmu->smmu;
 }
 
+static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
+	{ .compatible = "qcom,sc7180-smmu-500" },
+	{ .compatible = "qcom,sdm845-smmu-500" },
+	{ .compatible = "qcom,sm8150-smmu-500" },
+	{ .compatible = "qcom,sm8250-smmu-500" },
+	{ }
+};
+
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
-	return qcom_smmu_create(smmu, &qcom_smmu_impl);
-}
+	const struct device_node *np = smmu->dev->of_node;
 
-struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu)
-{
-	return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
+	if (of_match_node(qcom_smmu_impl_of_match, np))
+		return qcom_smmu_create(smmu, &qcom_smmu_impl);
+
+	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
+		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
+
+	return smmu;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index dfc44d806671..43b2411e65cc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -525,7 +525,6 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
-struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu);
 
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
