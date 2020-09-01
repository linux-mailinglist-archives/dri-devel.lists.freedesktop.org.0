Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2793259A28
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ACF6E89F;
	Tue,  1 Sep 2020 16:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C726E89F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:47:12 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id o16so909847pjr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e9NL/zqQnmkXSTv+zE5CjT9WgTIhkDu67eIbOBI/UcM=;
 b=Fc9Tcszai4/bLCcetlVEqYPAQ1RbvGCHa9RLG2Ilfq2hnHpUlH+Lr12DMYNrZdmIvd
 J1gYJyFz3ZiOX/nGK3nQjczz2tSYqUxBCxDgHFvewsnmXEHL6YOWDr9VUQUCbibQwnBk
 M2fdYx4wzwvAtVk13Zqj6hCdsFIiwdWeSQqGbgziZxiUH0VphzSLWp5ZUvWWJx2MOn2h
 gL54vp6ySx99JC7MH/gq8RjevHdiaiSvvXOrCHWy1sXa2yjK+ruue6B+w7cWMPWFR1Kr
 KJThp6mg237V6t+C9r4SBa1hX1xsy3I8Iy0oDK9sQUzCB9sS59nACFzmNK8ZkkNkBuT8
 rW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e9NL/zqQnmkXSTv+zE5CjT9WgTIhkDu67eIbOBI/UcM=;
 b=YRpADyfNbvIL6G97oP4LdIwnqvhj/h7+CFtgSeQATqIBLrFXT0pTL6aNvnvZNxNuUh
 KZbjGI/rYpsDFwgrIKfK2Zs6xoz6G2a8SQHwMBm6cVXO2XSwr4SmbiErfpGsjQNtcYEc
 Vm9B7qSVKnyIa6TY5IP8IWAMGeBPsEUeMc2sGU2Ls/BYrqF+h4MjbP2oUnr68quay+o+
 T4wPCginxamjXMfsYFsoVbhXE0JKNHL6c7W7rvjTxkH1IgTxHaH7RmuvdtPDtfI8CiSO
 dfzLw1URx6jO1pdTRCQ6oXsKlS/z9iA/sH++rQxCGROuRpS22yPQQXB+if0bKFLTh57m
 yYtA==
X-Gm-Message-State: AOAM532hIx4b9WUZahZA6b0GeBq2Lv/uvsRKiEuT+SCWKxPiLzjDkJDS
 a2c2PeUxMhdgqnvVvkt/yI928ii1mNm0Kw==
X-Google-Smtp-Source: ABdhPJz0lqmiiFmT7Ipagca1YExexKrcu3kTt6dMEXbM6hlOjXoTtuz3jq+P6Mh0ozaDUeXYEjzlPQ==
X-Received: by 2002:a17:902:a60f:: with SMTP id
 u15mr2120473plq.239.1598978831367; 
 Tue, 01 Sep 2020 09:47:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id b64sm2430699pfa.200.2020.09.01.09.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:47:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 13/20] iommu/arm-smmu: Add support for split pagetables
Date: Tue,  1 Sep 2020 09:46:30 -0700
Message-Id: <20200901164707.2645413-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thierry Reding <treding@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Enable TTBR1 for a context bank if IO_PGTABLE_QUIRK_ARM_TTBR1 is selected
by the io-pgtable configuration.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 19 +++++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 25 +++++++++++++++++++------
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 37d8d49299b4..8e884e58f208 100644
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
+						 cfg->asid);
 			cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
 						 cfg->asid);
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
