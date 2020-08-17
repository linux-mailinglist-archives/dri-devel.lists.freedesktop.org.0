Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940124797A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 00:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187FF6E043;
	Mon, 17 Aug 2020 22:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2486E043;
 Mon, 17 Aug 2020 22:02:15 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id 2so8454469pjx.5;
 Mon, 17 Aug 2020 15:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKeW4IJzF0CN62iFUBZf8N+0bUvXfOukk7MmGMWb73s=;
 b=ovEV2Gt4Kz5tHXIGwlOGifxdvICnAxRUzYTINg7SqobJsDajsv5Qj0zwzR3E1LPIME
 elxyVX957CwsER7fnRO16ekjDQJ/7FvPyl4+zzSKTzWWZ52zxc74jfxx2Rp4e+ZvflyC
 0gDLPbckTd54HiZUKx6OrsQzGnVMmesq7p9N+PfdK/w5f8kv16Lo9JqAGshbcVSIJLg4
 dEoWiUt8ms5mAdlHuHJ8i2CnuYtMjTycLeNt4ufgO2GS7aq4slo/9rFlW226wJqfaS7t
 gc8dDvqtFyL+grNMrY2NqCv2ooaGyzq66ptpIRWA+/jNtA8xwkN7I/rkWXoMhbsAADfb
 oVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKeW4IJzF0CN62iFUBZf8N+0bUvXfOukk7MmGMWb73s=;
 b=Zts85VDxhNxEj3FwSnm7UrYP4bG/3RCi0z8GPH5MKwdR9hf7YissLgwDljcQt/ejvM
 GZioKgJkGqYnW/WnN46/W9xFx10ozqsRaNLZHLGTQrDngV4334v5s+mT8m7VOVH0e+1I
 tz3FhddsmacWe+oc51+8kQgKXB8agfJ8tQqmZF4wumxXZirs7GMXaheAj5doAyWOt9oa
 yuX/XXekAP1mK42qBfsrVoZi+lny0v2aYER/QHz4zZaFQ54JHP1DrxGbHL/G5AcwivQv
 SsjtnKk3Y/Ry8yUWuT0Ggzn5C9P6JfalwtJXmAZCNWYJjdQH53/Z/yvjVYHqssh/p6gV
 CGYw==
X-Gm-Message-State: AOAM530+1YC3vDqjbGzq+AprnPr1eGsu5l73l70r9Jt32hw4Zhb6EfZE
 gwluv6UVmHuruze9nI81Htm+Hr8FpbwS9A3h
X-Google-Smtp-Source: ABdhPJzOG4pmswwcAPA4FBggLea6MD4ebHVWw2ExFB4G80tbhY2wfkNfdR+7JLQ+/SftjtNuvhTJlQ==
X-Received: by 2002:a17:90b:1413:: with SMTP id
 jo19mr13655753pjb.37.1597701735169; 
 Mon, 17 Aug 2020 15:02:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b63sm20822564pfg.43.2020.08.17.15.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:02:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 03/20] iommu/arm-smmu: Add support for split pagetables
Date: Mon, 17 Aug 2020 15:01:28 -0700
Message-Id: <20200817220238.603465-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Thierry Reding <treding@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
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
