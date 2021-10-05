Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6194422BFF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCFE6EB90;
	Tue,  5 Oct 2021 15:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22726EB87;
 Tue,  5 Oct 2021 15:11:58 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id x8so2523687plv.8;
 Tue, 05 Oct 2021 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E82Cx5NdqaUuINJgQKibCVb+p6vXVPNvYvc2YfkgoB0=;
 b=cO+hkCLv/qSB++cn/DXwauppsy55Fnhvf4U6BCC68I1drgBLrT1Su9mjLqMZi92k8Y
 OGrveJGXv9eQRBPFPFsCqxqjAkTJvw5Nne1uwY0HkR/OO01F1PBW/SupEJ6Jx5uAe1p3
 RCfpKtVGke/y9UxOQf4XrTUIPSyXYSBIRG6ODAJSSeMXQwOwl+OS8BahYkPFfMADDLyu
 n1LQVLqIo+Zc5VB6dUUuu/gnyabOtE8I1ewZhOHEhfvVyUno8FSe14fE64hVgaVMhX/v
 3mKqq80UnMiG15hK+vpvWGdXl81aVI8K3o834+/+GKdohFijqGKPd89NXig7WhdJIgdS
 tlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E82Cx5NdqaUuINJgQKibCVb+p6vXVPNvYvc2YfkgoB0=;
 b=4ypx+pbMsHX+kGPIyd+191r0FZJp5Octx3hoByrGlbnbpCeMpKar1DMbDgcRE7qwQY
 zya6JU2OCmTSJat+eP3ByflkkQhz5naSrUSPIJ3gHVFXYf2Wdi8xHae6ifSTCJtvycKh
 OGR/+4d0kTpsNbwyjMM5KIn8Zhl4ujJp/K4gvQB1es5HjXvt5pDY7HCcwx5XvkC2lqDM
 Ceq/C0Ivlj64L6I3Br2TylCvBskhEbPViL5zrb0GYpJIImokHUAzoK5rtA2L1e5//LnI
 69WQhfSsKPIbF1DGoZH5V6YwZAu6fti0E+mBfqMudnj4q3hK293UkoBQbCEpj8tdsQo2
 X8tQ==
X-Gm-Message-State: AOAM530gQR3tm2MP4mFtyy9qCAe/Wrwfbi9ERHpved59y1H84Hj3gWX9
 kR+FeMMUGZ+WHqxBJ4DaTkAmPm/0Nng=
X-Google-Smtp-Source: ABdhPJwHxECxSN9lHmDRg12ksn5Q+7p33RRlUTZ5arcREYmllLsReuMFC1PvuycX4zOgeQE+9jnoIg==
X-Received: by 2002:a17:90b:38d2:: with SMTP id
 nn18mr4521074pjb.110.1633446717886; 
 Tue, 05 Oct 2021 08:11:57 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 a12sm2275639pjq.16.2021.10.05.08.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:11:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Yong Wu <yong.wu@mediatek.com>, Sven Peter <sven@svenpeter.dev>,
 iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Tue,  5 Oct 2021 08:16:25 -0700
Message-Id: <20211005151633.1738878-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005151633.1738878-1-robdclark@gmail.com>
References: <20211005151633.1738878-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add an io-pgtable method to retrieve the raw PTEs that would be
traversed for a given iova access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 40 +++++++++++++++++++++++++++-------
 include/linux/io-pgtable.h     |  9 ++++++++
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index dd9e47189d0d..c470fc0b3c2b 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -700,38 +700,61 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 	return arm_lpae_unmap_pages(ops, iova, size, 1, gather);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+				 void *_ptes, int *num_ptes)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_lpae_iopte pte, *ptep = data->pgd;
+	arm_lpae_iopte *ptes = _ptes;
+	int max_ptes = *num_ptes;
 	int lvl = data->start_level;
 
+	*num_ptes = 0;
+
 	do {
+		if (*num_ptes >= max_ptes)
+			return -ENOSPC;
+
 		/* Valid IOPTE pointer? */
 		if (!ptep)
-			return 0;
+			return -EFAULT;
 
 		/* Grab the IOPTE we're interested in */
 		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
 		pte = READ_ONCE(*ptep);
 
+		ptes[(*num_ptes)++] = pte;
+
 		/* Valid entry? */
 		if (!pte)
-			return 0;
+			return -EFAULT;
 
 		/* Leaf entry? */
 		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
+			return 0;
 
 		/* Take it to the next level */
 		ptep = iopte_deref(pte, data);
 	} while (++lvl < ARM_LPAE_MAX_LEVELS);
 
-	/* Ran out of page tables to walk */
-	return 0;
+	return -EFAULT;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	arm_lpae_iopte pte, ptes[ARM_LPAE_MAX_LEVELS];
+	int lvl, num_ptes = ARM_LPAE_MAX_LEVELS;
+	int ret;
+
+	ret = arm_lpae_pgtable_walk(ops, iova, ptes, &num_ptes);
+	if (ret)
+		return 0;
+
+	pte = ptes[num_ptes - 1];
+	lvl = num_ptes - 1 + data->start_level;
 
-found_translation:
 	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
 	return iopte_to_paddr(pte, data) | iova;
 }
@@ -816,6 +839,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.unmap		= arm_lpae_unmap,
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86af6f0a00a2..501f362a929c 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -148,6 +148,13 @@ struct io_pgtable_cfg {
  * @unmap:        Unmap a physically contiguous memory region.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @pgtable_walk: Return details of a page table walk for a given iova.
+ *                This returns the array of PTEs in a format that is
+ *                specific to the page table format.  The number of
+ *                PTEs can be format specific.  The num_ptes parameter
+ *                on input specifies the size of the ptes array, and
+ *                on output the number of PTEs filled in (which depends
+ *                on the number of PTEs walked to resolve the iova)
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -165,6 +172,8 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
+			    void *ptes, int *num_ptes);
 };
 
 /**
-- 
2.31.1

