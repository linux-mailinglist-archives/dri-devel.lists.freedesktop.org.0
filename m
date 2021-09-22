Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C041535C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 00:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AEC6E060;
	Wed, 22 Sep 2021 22:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0F6E05F;
 Wed, 22 Sep 2021 22:26:08 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso5540896pjh.5; 
 Wed, 22 Sep 2021 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WCMLDltvC1dKxSIyIZE+6LP/jkA86h78VZKD3EckBc=;
 b=b5c8dDz/0BcqZE9GwtAt4HpSoosfgotGxcZwmzujhaXxCwVfhCo2bdn7iyVRlEb61b
 kdt2MOu8E+1DMHgipjJn1MkAnHAtXdCyQRD3QAXzW2QjmEV0BmxPLmCVTu5XJrBuFlSQ
 6x6jgRisFnXeZ6UnVTWHT7/89jxZkyH2bE4K2HxlOin8SJzd7x5li2akSGznh/8bvat5
 T8vpPncPw7Fo0/QUZrkWp0QbtDtLIW20bThzkVVVxE+FKBO2QVAbo5/INjs8zbDBfIpK
 zHrK6E7VRc+C1w4tK3wkx+LwRBrjvJmBnwgHqLYfqV1QzEUb2WvyH3bE8m9UJBCachi7
 v6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WCMLDltvC1dKxSIyIZE+6LP/jkA86h78VZKD3EckBc=;
 b=EqpgKm9hLj/FMoYLogt7THb6fHT8b1Yo9wxbaly+rkWyjehWFfTJ7aumeNrnpqN3Ur
 HrnbA+4JPOLHL8M1w6pG5RPtJMe5llMDFdvq0mxMXktk8Rp0QGrD3pv0728PM5vGdHh0
 aVOq/E7sw86zHluFFd98ohUuaVTLaPR26fH/lrjw0JDiYAznuWD0/PAfmlW0cyhhsSGI
 m90XBTJZo9+4yooj2+/JXyJ5Eq0FGWAIi6I273DFaFsJAY0IAwzgYYK7OPEUCJ3bYZkh
 lTr5zsy2aOBXh9oaW1B9jIS7WWXFaji2r1lHTa3MEiOwff5uvnKYlAc/nt41Q2T6WVp5
 swxg==
X-Gm-Message-State: AOAM532Vs4K/9WTZFXrOhCAeaLtri+/nw6U65LqvCoca55PrCeluHJTU
 W+0LobxRp58I7E3WAANsFZ5YITz69q4=
X-Google-Smtp-Source: ABdhPJx8Fk6wSe3f+aWLKeQPr0N9oabkoKmJ78CFl91xbk6olyNUWDYxhgku5teAj53kgszlMATrBg==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr1452308pjo.243.1632349566778; 
 Wed, 22 Sep 2021 15:26:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e7sm3246999pfv.158.2021.09.22.15.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 15:26:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Yong Wu <yong.wu@mediatek.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Wed, 22 Sep 2021 15:30:21 -0700
Message-Id: <20210922223029.495772-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922223029.495772-1-robdclark@gmail.com>
References: <20210922223029.495772-1-robdclark@gmail.com>
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
index 87def58e79b5..5571d7203f11 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -638,38 +638,61 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 	return __arm_lpae_unmap(data, gather, iova, size, data->start_level, ptep);
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
@@ -752,6 +775,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map		= arm_lpae_map,
 		.unmap		= arm_lpae_unmap,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 4d40dfa75b55..6cba731ed8d3 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -145,6 +145,13 @@ struct io_pgtable_cfg {
  * @map:          Map a physically contiguous memory region.
  * @unmap:        Unmap a physically contiguous memory region.
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
@@ -156,6 +163,8 @@ struct io_pgtable_ops {
 			size_t size, struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
+			    void *ptes, int *num_ptes);
 };
 
 /**
-- 
2.31.1

