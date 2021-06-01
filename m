Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03B3397C98
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 00:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0670589FCA;
	Tue,  1 Jun 2021 22:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB1689FCA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 22:44:24 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id g24so529207pji.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 15:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJLWu1zM3KEPxqyiMkUoKzy2S77vpcKMGJiuiZ9HewA=;
 b=o0aIzUoMyQQRtceHM1SXoISjdEnETGSI2ufzc+HT1e7iXZjTkSFoeEO2XpE9lNRJf4
 nm+1XzkIpWYS7hkkmUFo+rpBnNtv4DdAKJOgpWKjH3R6TJ8w4JRNBgWR6HyzQiCqhpAu
 D1Z1Ccb9PUZH5Z0mvvaGKjiQNeQRUy09UogE92dWbX8efIgpXVJBdb+sLgnKd4btN2Zr
 l3xvyrOuC1r+bQ5zSirtY88vnQYRtgF2Teg8t/G/Z6lWXEDFMu69E12nf7YX5GXE3p2s
 J5WXZTyZUXFDyfnzwGaCu6b8iRz51pFFUajadlHzkg/EhWTa18nWm6Rvyi1W/l2SrXDh
 QCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJLWu1zM3KEPxqyiMkUoKzy2S77vpcKMGJiuiZ9HewA=;
 b=Zj+guQufNImGf8si+5LGoHmgLKZxPMsSvLNNvHT/GfA5vg+4bBUAH+Nsu8WtrYHJ0w
 eCfMMieAJxW0Y4wsLuTN78pryrNEre1X6D98FRgCV5PM8k7F0FgAF33m2TF3T/+9UPYG
 J6HSSUloEJ3QvjwoGGF+cFHQzEDPLMrPZh/UhherYP1NpRJ5x62L47Ub5APqPmfyuTEJ
 cpuhe2oNfrWwnvEafZpk+KgQzn8Fo25eNW26j64oqqJKlNBAXCBCvGbqb9mm+Bk0CgxI
 keRzlwVaayUL7MsW3LmMGhy6U8IybDBlk0NjmvW5+jhvbM6sqQwwmToh456PSnNsgEsU
 DYgg==
X-Gm-Message-State: AOAM531OLAGTOdKv2PJuKEa8ZZ3pceOl6BewxMb8IlR+InKoZJrA6cog
 vkwKCceQDUNYX+4jMB61JqdTUyIdBuSoZA==
X-Google-Smtp-Source: ABdhPJxQ3LhrawMskRqIefAPHQvPFU6+Vwmlqu/3BEN6SO0qcIxJBrYWOahRSd0n4eXw33l6ORzHtA==
X-Received: by 2002:a17:90a:ce0b:: with SMTP id
 f11mr2060379pju.185.1622587463602; 
 Tue, 01 Jun 2021 15:44:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 o7sm15553793pgs.45.2021.06.01.15.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 15:44:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/6] iommu/arm-smmu-qcom: Add stall support
Date: Tue,  1 Jun 2021 15:47:23 -0700
Message-Id: <20210601224750.513996-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601224750.513996-1-robdclark@gmail.com>
References: <20210601224750.513996-1-robdclark@gmail.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Robin Murphy <robin.murphy@arm.com>,
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

