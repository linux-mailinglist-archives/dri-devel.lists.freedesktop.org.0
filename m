Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BED3A3638
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230466EE01;
	Thu, 10 Jun 2021 21:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1C76E4CF;
 Thu, 10 Jun 2021 21:44:22 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id o9so823289pgd.2;
 Thu, 10 Jun 2021 14:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJLWu1zM3KEPxqyiMkUoKzy2S77vpcKMGJiuiZ9HewA=;
 b=hnBQIh/wd7auKu7jB/+AkJxIOZRnhnERNDtkBJ2ycvt3RG1tw21KbmyRemIVrbHBUy
 WHOSstymU0X3jzlUY4Sn/LVT4DsEoV013MIDj6PNhWaBxdg1TzwXxj1SRXEiIwVPS4qS
 MOJxQ3HskbbmG6/bXlAJjhxjTMH7LhXDbDzdaPs8E/foeaNptuAk8Rweeudo7vnB65Pp
 Ij9G4sPVrc2g3vpeqxhxNZtKYV6O/iyxWgZ18OOJzXTl0ngYfYlViAaD/kga2ruHC+3r
 5VmwHd9tNnUvHkf9Ltv5SP3DRvo/XC0OVZXtyvo/2dRZfW9NCZYCfKzyXxVUbTpPDnvs
 0Alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJLWu1zM3KEPxqyiMkUoKzy2S77vpcKMGJiuiZ9HewA=;
 b=JAaBdWhOjASJ8qbIuK3WCg/rH4HOugrEAYwkv4L017n97ttN9gpUla2VocTndUeN3C
 eKfBaS4ka1rYWyin+XiccRfMwPked9KNrX0BHsIC9cUoVhnSmLZ3tKZnVXwTGBo6UDb9
 Xdw0FPcYNxNKkGAJVaZwLKaazWjfGS9MfeOyfYw5+V7Q4syRHb0HQFtQJb/u8NBAcSmZ
 yisN1EeHfTxaBjqf4KLBfotWZpZ5i83VNBnQRD/RF9jW/gyJCrvKCYl9Pyj/jHg+QfQ1
 WE/zGwUQCAZfa620JBLzu3a47bjExV21lQJTnTHHqKkNAbsh5kWKGlAL6KL3UknY6Uvi
 g+1Q==
X-Gm-Message-State: AOAM533oCm8rNCuVQfPYkW3WBYZaZQRBDnH2ox01SkH4n6pymiRIRc5G
 kyU02zJOE6BfxP8HVE0sbcCQn0dQs1UukA==
X-Google-Smtp-Source: ABdhPJwbRxLCvWQdGZhBquW/xO9Y8PRm7Z5dFqU/NP/5TiyY9cbq46fok0OwhL/Hg4fvi2Ihwu+wyg==
X-Received: by 2002:a63:ba5e:: with SMTP id l30mr427490pgu.43.1623361461037;
 Thu, 10 Jun 2021 14:44:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id n14sm3110079pfa.138.2021.06.10.14.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:44:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v5 4/5] iommu/arm-smmu-qcom: Add stall support
Date: Thu, 10 Jun 2021 14:44:12 -0700
Message-Id: <20210610214431.539029-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610214431.539029-1-robdclark@gmail.com>
References: <20210610214431.539029-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add, via the adreno-smmu-priv interface, a way for the GPU to request
the SMMU to stall translation on faults, and then later resume the
translation, either retrying or terminating the current translation.

This will be used on the GPU side to "freeze" the GPU while we snapshot
useful state for devcoredump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
 include/linux/adreno-smmu-priv.h           |  7 +++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b2e31ea84128..61fc645c1325 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -13,6 +13,7 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 	bool bypass_quirk;
 	u8 bypass_cbndx;
+	u32 stall_enabled;
 };
 
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
@@ -23,12 +24,17 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
 		u32 reg)
 {
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+
 	/*
 	 * On the GPU device we want to process subsequent transactions after a
 	 * fault to keep the GPU from hanging
 	 */
 	reg |= ARM_SMMU_SCTLR_HUPCF;
 
+	if (qsmmu->stall_enabled & BIT(idx))
+		reg |= ARM_SMMU_SCTLR_CFCFG;
+
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
@@ -48,6 +54,31 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
 }
 
+static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+
+	if (enabled)
+		qsmmu->stall_enabled |= BIT(cfg->cbndx);
+	else
+		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
+}
+
+static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	u32 reg = 0;
+
+	if (terminate)
+		reg |= ARM_SMMU_RESUME_TERMINATE;
+
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -173,6 +204,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
+	priv->set_stall = qcom_adreno_smmu_set_stall;
+	priv->resume_translation = qcom_adreno_smmu_resume_translation;
 
 	return 0;
 }
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index 53fe32fb9214..c637e0997f6d 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -45,6 +45,11 @@ struct adreno_smmu_fault_info {
  *                 TTBR0 translation is enabled with the specified cfg
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
+ * @set_stall:     Configure whether stall on fault (CFCFG) is enabled.  Call
+ *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
+ *                 the GPU driver must call resume_translation()
+ * @resume_translation: Resume translation after a fault
+ *
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
  * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
@@ -60,6 +65,8 @@ struct adreno_smmu_priv {
     const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
+    void (*set_stall)(const void *cookie, bool enabled);
+    void (*resume_translation)(const void *cookie, bool terminate);
 };
 
 #endif /* __ADRENO_SMMU_PRIV_H */
-- 
2.31.1

