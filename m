Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4227397C90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 00:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D049D89F47;
	Tue,  1 Jun 2021 22:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E9489F47
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 22:44:14 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id k7so525225pjf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 15:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIFc0p7RPawTOWte2X5RUNbAQ3QNHzruJUPp0tR4Akc=;
 b=MmqhSHv4pVmqOUQWG/JUj1wtc2XO84UZVkcICuPLv/X/UETgtt2ZbucwGxhjEH00nc
 bN8YjynQlzHWvDYsjzwlcNWjwNFby8q3j/4BRcH9BXO+v3BM+fPBI3iqtdMeJyhupBiu
 pZYqL8hYupt9XkK56b+yY4BGXo21+AY9V3B+54vWz5jEuWfJAuYRWiuULjBDEmadb0Ix
 JxrnR3HIkfOsyOvHjaX0HYlLr/w2VTqzEVDbjVRmylejTG2jTkZ0Js5fzvNYag3ft+ha
 gPijtYVLNlgVm2wvCtYDgfGv0oc3NZPdyHzFs1VdTAWcDV9EpTCkO9EWdLK3d+uCBvhA
 /JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HIFc0p7RPawTOWte2X5RUNbAQ3QNHzruJUPp0tR4Akc=;
 b=oGJ9DkciaCe4wDxRGB/DrQQsv+yHP//42p1nSZTAAhszv7zV1IiNhmbm+JOjvdNFE9
 OXdKvNjIutEf9rN7bDXG3c4Tqg6lqQFggrUwDcayhpiGD4HmVadeFaRnPUuH+JmY6n2K
 FXxi3Dj5EJ5RKRq06JM15bzXIQqtD5EizFLii+QafpiqxdtPUreY/vfhv6n9RDvDCbEw
 p2bm5wma6bJHCwIdqZ/iBxY660vU01isE49QJrnQBWuN8DyK74l7GFq8dmFJbFjRd040
 O72veBSP+fM5wg7/1oiJCCQAKxSduTXGIs261olsWWM8oXTMKVsGszWiCBJukNnJy2zU
 XaTA==
X-Gm-Message-State: AOAM53027WaCPfoYWxSmg/bA0Iz/7ZXCDEHUzwgyVLVwWczCnt1T0uzk
 /TYw35X2LFdf3oUF3N2t0O1v1AmwKSpWCA==
X-Google-Smtp-Source: ABdhPJz+mXa+RxvTgPFmzqT2n/ljpzsvUmOehprsrvVU92aCy02WZlEr7eJEXWTLgpAguGtLgLpzew==
X-Received: by 2002:a17:90a:b796:: with SMTP id
 m22mr26919264pjr.220.1622587453472; 
 Tue, 01 Jun 2021 15:44:13 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r4sm13660868pff.197.2021.06.01.15.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 15:44:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/6] iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback
 to get pagefault info
Date: Tue,  1 Jun 2021 15:47:21 -0700
Message-Id: <20210601224750.513996-4-robdclark@gmail.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jordan Crouse <jcrouse@codeaurora.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Add a callback in adreno-smmu-priv to read interesting SMMU
registers to provide an opportunity for a richer debug experience
in the GPU driver.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 17 ++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 include/linux/adreno-smmu-priv.h           | 31 +++++++++++++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 98b3a1c2a181..b2e31ea84128 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -32,6 +32,22 @@ static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
+static void qcom_adreno_smmu_get_fault_info(const void *cookie,
+		struct adreno_smmu_fault_info *info)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+
+	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
+	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
+	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
+	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
+	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
+	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
+	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -156,6 +172,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->cookie = smmu_domain;
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
+	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index c31a59d35c64..84c21c4b0691 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -224,6 +224,8 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_FSYNR0		0x68
 #define ARM_SMMU_FSYNR0_WNR		BIT(4)
 
+#define ARM_SMMU_CB_FSYNR1		0x6c
+
 #define ARM_SMMU_CB_S1_TLBIVA		0x600
 #define ARM_SMMU_CB_S1_TLBIASID		0x610
 #define ARM_SMMU_CB_S1_TLBIVAL		0x620
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index a889f28afb42..53fe32fb9214 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -8,6 +8,32 @@
 
 #include <linux/io-pgtable.h>
 
+/**
+ * struct adreno_smmu_fault_info - container for key fault information
+ *
+ * @far: The faulting IOVA from ARM_SMMU_CB_FAR
+ * @ttbr0: The current TTBR0 pagetable from ARM_SMMU_CB_TTBR0
+ * @contextidr: The value of ARM_SMMU_CB_CONTEXTIDR
+ * @fsr: The fault status from ARM_SMMU_CB_FSR
+ * @fsynr0: The value of FSYNR0 from ARM_SMMU_CB_FSYNR0
+ * @fsynr1: The value of FSYNR1 from ARM_SMMU_CB_FSYNR0
+ * @cbfrsynra: The value of CBFRSYNRA from ARM_SMMU_GR1_CBFRSYNRA(idx)
+ *
+ * This struct passes back key page fault information to the GPU driver
+ * through the get_fault_info function pointer.
+ * The GPU driver can use this information to print informative
+ * log messages and provide deeper GPU specific insight into the fault.
+ */
+struct adreno_smmu_fault_info {
+	u64 far;
+	u64 ttbr0;
+	u32 contextidr;
+	u32 fsr;
+	u32 fsynr0;
+	u32 fsynr1;
+	u32 cbfrsynra;
+};
+
 /**
  * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
  *
@@ -17,6 +43,8 @@
  * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
  *                 NULL config disables TTBR0 translation, otherwise
  *                 TTBR0 translation is enabled with the specified cfg
+ * @get_fault_info: Called by the GPU fault handler to get information about
+ *                  the fault
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
  * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
@@ -31,6 +59,7 @@ struct adreno_smmu_priv {
     const void *cookie;
     const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
+    void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
 };
 
-#endif /* __ADRENO_SMMU_PRIV_H */
\ No newline at end of file
+#endif /* __ADRENO_SMMU_PRIV_H */
-- 
2.31.1

