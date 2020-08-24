Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38AE2507FE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D2D6E44E;
	Mon, 24 Aug 2020 18:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14836E43A;
 Mon, 24 Aug 2020 18:41:58 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id p37so4996472pgl.3;
 Mon, 24 Aug 2020 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKeW4IJzF0CN62iFUBZf8N+0bUvXfOukk7MmGMWb73s=;
 b=QupFDcDQ+J/BaRegO7eha4+W6WwIpAwNtCuueunU/Y/sIUrOPF6mxnGAeRETIyCS9z
 5jIDNS/oX7L3yzUY32LxAJia+VBQ9/wo7RmNYccWOYesqVTFba96QlyrsFlIwS1RXM0z
 F9o0Nm7Aqj9tYGNwaj1qKEHCLghoGaOkjZ81BDEpbFj9zH6o44UA7diBGGGoVYYl9Ogg
 FgU8yOPrK5XQW8QlEnjxPDgptp99FMIj2Fq3CJLqDbawVqOALIdqDaWqHDJNsNVQF66B
 TkgKrNn/0ND6uGJb4BagXQ5NFy40qmczg7hakt4rgG7Fqoj1E9KonvWfdmjoH+5M6qcc
 oMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKeW4IJzF0CN62iFUBZf8N+0bUvXfOukk7MmGMWb73s=;
 b=cMWPggHxhb9lvINdBK8ZJeGVOL3RKAQeGPyUH0lhg1bLouNxWroDXQj4Pkky41DXEk
 oMhYY2r0OeEgIilJ7BP3Zu6hQb/8TCe/TP0G1FDmcDQPXAEf1QmbT2i7LaMu5YVNF2HF
 SzextY1TY1kHq7xij1v6wXI+5KT8fdbyVXyBYut5vxHnJ+2g/Ha4K6xqU7xEQ/GPA3NZ
 dxBFXrh2HQPzmL2k2s3A+G4X6samyob5TX5PNcxhywNGcfesJ30JISUnPpVccRczQ+hI
 8KwwDeXVmo1QX3mtugYWGxjNuYKT8O5rAsRsh5Ug369+CFmCUaar3SMWPKvVVwcXPxNY
 Kmww==
X-Gm-Message-State: AOAM533uMFPq+v4tZJe5NwfehdyOUm70E9n456I7dlUitzhDGbMRvOxW
 AF2bc4JoE3z8vXmHIa6BN6JOQd69ij4hFQ==
X-Google-Smtp-Source: ABdhPJxn13wAUy7w/ZA3PkY4X0k1/D35A+O3YPsK8fwkZ0jAk5+bBLMZwY56hTkxAOOJZKTpQNkmdQ==
X-Received: by 2002:a17:902:82c7:: with SMTP id
 u7mr4781570plz.310.1598294517871; 
 Mon, 24 Aug 2020 11:41:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id z17sm12923442pfq.38.2020.08.24.11.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:41:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 03/20] iommu/arm-smmu: Add support for split pagetables
Date: Mon, 24 Aug 2020 11:37:37 -0700
Message-Id: <20200824183825.1778810-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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
Cc: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Sibi Sankar <sibis@codeaurora.org>, Brian Masney <masneyb@onstation.org>,
 freedreno@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>,
 Stephen Boyd <swboyd@chromium.org>, Krishna Reddy <vdumpa@nvidia.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Enable TTBR1 for a context bank if IO_PGTABLE_QUIRK_ARM_TTBR1 is selected
by the io-pgtable configuration.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 21 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 25 +++++++++++++++++++------
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 37d8d49299b4..976d43a7f2ff 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -552,11 +552,15 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
 			cb->ttbr[1] = 0;
 		} else {
-			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
-			cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
-						  cfg->asid);
+			cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
+				cfg->asid);
 			cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
-						 cfg->asid);
+				cfg->asid);
+
+			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
+				cb->ttbr[1] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+			else
+				cb->ttbr[0] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
 		}
 	} else {
 		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
@@ -822,7 +826,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 
 	/* Update the domain's page sizes to reflect the page table format */
 	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_end = (1UL << ias) - 1;
+
+	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+		domain->geometry.aperture_start = ~0UL << ias;
+		domain->geometry.aperture_end = ~0UL;
+	} else {
+		domain->geometry.aperture_end = (1UL << ias) - 1;
+	}
+
 	domain->geometry.force_aperture = true;
 
 	/* Initialise the context bank with our page table cfg */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 83294516ac08..f3e456893f28 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -169,10 +169,12 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_TCR			0x30
 #define ARM_SMMU_TCR_EAE		BIT(31)
 #define ARM_SMMU_TCR_EPD1		BIT(23)
+#define ARM_SMMU_TCR_A1			BIT(22)
 #define ARM_SMMU_TCR_TG0		GENMASK(15, 14)
 #define ARM_SMMU_TCR_SH0		GENMASK(13, 12)
 #define ARM_SMMU_TCR_ORGN0		GENMASK(11, 10)
 #define ARM_SMMU_TCR_IRGN0		GENMASK(9, 8)
+#define ARM_SMMU_TCR_EPD0		BIT(7)
 #define ARM_SMMU_TCR_T0SZ		GENMASK(5, 0)
 
 #define ARM_SMMU_VTCR_RES1		BIT(31)
@@ -350,12 +352,23 @@ struct arm_smmu_domain {
 
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 {
-	return ARM_SMMU_TCR_EPD1 |
-	       FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
-	       FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
-	       FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
-	       FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
-	       FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
+		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
+		FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
+		FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
+		FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+
+       /*
+	* When TTBR1 is selected shift the TCR fields by 16 bits and disable
+	* translation in TTBR0
+	*/
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+		tcr = (tcr << 16) & ~ARM_SMMU_TCR_A1;
+		tcr |= ARM_SMMU_TCR_EPD0;
+	} else
+		tcr |= ARM_SMMU_TCR_EPD1;
+
+	return tcr;
 }
 
 static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
