Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D4259A35
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B416E8AA;
	Tue,  1 Sep 2020 16:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BFB6E8AA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:47:36 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d19so969739pgl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6bArpQOenZ1r4IwzKVpzZ3sdPjqYb3Z5T6BZu8MLRy0=;
 b=I7UCJIzeBAAOgAsNsgzoZK0Uza7dH630S1MxfkMHiactiF7JQraMk9MJUguKgnYv2q
 veR/pLP1tvmFgw31DChdsSWvzB082tn5HdPs6QStgad0OAEqSQVtxxzoz1a4U6Q1BSl1
 f36D17v3JLTqEsrDLWUw3jvM5fOpOIM9QRY+99292MfG+ajAbggm1TZAo4GktMprZHXx
 aKdKGCwrN+fcInF0B1thh9V3FrL9xReZb8qF35PSwTxaz3jTDfLdTpGX+6mEkBzUC1LO
 AWzae63KE8yDM8KCr/56g4Ryiom6ATcPCuMoQOhO4mHakiv0tm5ZTM7YKiiSoOF9P0sE
 4WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bArpQOenZ1r4IwzKVpzZ3sdPjqYb3Z5T6BZu8MLRy0=;
 b=SeeGGR3U4MWldxzWfalQ1oDLURFn6b1JnuUCKJq56R1Ijv8VRpkwjd7tmn04HfixPv
 dmlmWyACqbJoOZrYWhwSIBnjWzfrIPYdtSUrD+KHHt8vEdNYLYWhd5zEZn7uYD3xZHNx
 UMfBT8JvjwElPZIQp6Z33RiV0ZneEw7R0d4IjdvXGA4PCDOw/o4l9aDNrM3PE2YUeIO9
 5FeKefcRbQ40hqSikkoB8M6fehMr71Pzj1Rvx/VwJmCpxkN54RuM08/IiLf0Ry8kmOSF
 kcCBxUAGyGkG5S5tXPn0GCG0wlOFc1Cbpa/8HfqyHOGdTRrpr6kcXLNxw7D4W9+xjDtt
 zGYQ==
X-Gm-Message-State: AOAM530DjvHokwBDikXZRWx/mxPb5uvFyr/OvAajHX05xFXkGFejnb4R
 dRxO8BVmp0L81WGVRnTe32SMD7BFAtjJcvmb
X-Google-Smtp-Source: ABdhPJxP2Btj8c5sNN2AEoBDA2X8SJkq9iwTq3L2XoqeeqMxQ9sgaHXP7ArHd4K3sOypPhsMrGtq/Q==
X-Received: by 2002:a63:62c7:: with SMTP id w190mr2280107pgb.25.1598978854996; 
 Tue, 01 Sep 2020 09:47:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id k6sm1998873pju.2.2020.09.01.09.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:47:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 17/20] iommu/arm-smmu: Add a way for implementations to
 influence SCTLR
Date: Tue,  1 Sep 2020 09:46:34 -0700
Message-Id: <20200901164707.2645413-18-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Thierry Reding <treding@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
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

From: Rob Clark <robdclark@chromium.org>

For the Adreno GPU's SMMU, we want SCTLR.HUPCF set to ensure that
pending translations are not terminated on iova fault.  Otherwise
a terminated CP read could hang the GPU by returning invalid
command-stream data.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 3 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 5640d9960610..2aa6249050ff 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -127,6 +127,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
 		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
 
+	/*
+	 * On the GPU device we want to process subsequent transactions after a
+	 * fault to keep the GPU from hanging
+	 */
+	smmu_domain->cfg.sctlr_set |= ARM_SMMU_SCTLR_HUPCF;
+
 	/*
 	 * Initialize private interface with GPU:
 	 */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 68b7b9e6140e..1773f54a7464 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -617,6 +617,9 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= ARM_SMMU_SCTLR_E;
 
+	reg |= cfg->sctlr_set;
+	reg &= ~cfg->sctlr_clr;
+
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index cd75a33967bb..2df3a70a8a41 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -144,6 +144,7 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
 #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
+#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
 #define ARM_SMMU_SCTLR_CFIE		BIT(6)
 #define ARM_SMMU_SCTLR_CFRE		BIT(5)
 #define ARM_SMMU_SCTLR_E		BIT(4)
@@ -341,6 +342,8 @@ struct arm_smmu_cfg {
 		u16			asid;
 		u16			vmid;
 	};
+	u32				sctlr_set;    /* extra bits to set in SCTLR */
+	u32				sctlr_clr;    /* bits to mask in SCTLR */
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
