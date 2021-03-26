Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A124634B27E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 00:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68E06F4F9;
	Fri, 26 Mar 2021 23:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAD66F4FA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 23:13:06 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id f10so5586544pgl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 16:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Br5dnsn6qntOpU2U5zqHAGfW5LmzUx9sZjoQtT0uBvA=;
 b=IEdGgwaqDywiGX1dYZabuHGeCPVqPOmtJ9gWumaiYE8LhpP7TPrmgh9Am25ZaK541g
 Sd6wCiWEHPLssN/QZZQCUeV+b1jFHBa9vQqdVSP3T3NKxBgV1FzobrzJQk+NKL1vpuLV
 nEBB9ozh/jSnm0UXI/GzbP33fvZOn8O0AIvyW/rAMtsz/ObcK8gFgtMXwYpCI7Cdziuy
 hK/y6rYLo5xaOrwm+VBc/5k6KIR1KnM5+EV+9VYRQNJJmPdIwyGNck0fJFpkoeQjmTPC
 AxTNhc1eE8HVAOr6kzUsbL0Uf0SoOCvwLRALNWIDRuXgHEd9O9L4wwkNJpd+hDPMKjIY
 3mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Br5dnsn6qntOpU2U5zqHAGfW5LmzUx9sZjoQtT0uBvA=;
 b=oMeWPyI1N/s89dQmPTXIguOREFUq0c9lMASBhg6cxf1CakObuwoax9wmrDRgMrrEcH
 Xd/VyQtXR7Ldlcd+u68JMhSBiVqaef7HujCTKdOaF9pMiot0GlfREQIB4Won8Kmtj/uN
 1zoM53NHuQJqS4cZ42ZQ77kM5QOoX62ejvuUZTB/3Sed62IGxqD0M7R2bQD0m+hD2gcI
 9FuMDP0TBarXHU+rxmZaq0gShIDluQ46cqzbp4LAm5PRp1b4KyFrxP6SeM0G799Y10cE
 MkVnVjHV3OJOe3V92qgqefT6bAnZPdF40lKMmf6ReFJ2upX9lmGf1TpznjkVVKbac+CG
 R6gw==
X-Gm-Message-State: AOAM530LlmAexVni+N5dqd1Cqbc2A62QwWQkEV9624xGkYSRtdDr+9yr
 Ft1gRsQjleqBP/poj5rAJMmoZaENYYk0ow==
X-Google-Smtp-Source: ABdhPJyNsiHsr3ai4ailFi6BHrwZ2FIzfLry8wAsmSYAHRtFtpb20MzTEwoKOTxny41h4vqVptXooQ==
X-Received: by 2002:a65:458f:: with SMTP id o15mr13853926pgq.111.1616800385764; 
 Fri, 26 Mar 2021 16:13:05 -0700 (PDT)
Received: from wildbow.anholt.net ([97.115.138.77])
 by smtp.gmail.com with ESMTPSA id a144sm10289325pfd.200.2021.03.26.16.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 16:13:05 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
Date: Fri, 26 Mar 2021 16:13:02 -0700
Message-Id: <20210326231303.3071950-1-eric@anholt.net>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

db820c wants to use the qcom smmu path to get HUPCF set (which keeps
the GPU from wedging and then sometimes wedging the kernel after a
page fault), but it doesn't have separate pagetables support yet in
drm/msm so we can't go all the way to the TTBR1 path.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

We've been seeing a flaky test per day or so in Mesa CI where the
kernel gets wedged after an iommu fault turns into CP errors.  With
this patch, the CI isn't throwing the string of CP errors on the
faults in any of the ~10 jobs I've run so far.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index bcda17012aee..51f22193e456 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -130,6 +130,16 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 
+static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
+{
+	const struct device_node *np = smmu->dev->of_node;
+
+	if (of_device_is_compatible(np, "qcom,msm8996-smmu-v2"))
+		return false;
+
+	return true;
+}
+
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
@@ -144,7 +154,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	 * be AARCH64 stage 1 but double check because the arm-smmu code assumes
 	 * that is the case when the TTBR1 quirk is enabled
 	 */
-	if ((smmu_domain->stage == ARM_SMMU_DOMAIN_S1) &&
+	if (qcom_adreno_can_do_ttbr1(smmu_domain->smmu) &&
+	    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) &&
 	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
 		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
