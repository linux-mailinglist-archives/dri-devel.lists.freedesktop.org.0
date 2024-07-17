Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A261D93409B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 18:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7F510E2F9;
	Wed, 17 Jul 2024 16:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hpoBTlDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0D910E2E9;
 Wed, 17 Jul 2024 16:36:45 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1fb4a807708so62601075ad.2; 
 Wed, 17 Jul 2024 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721234204; x=1721839004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xS3DSdckRYn7jTy4h1ciXu44qXa/Pj3ya32AUzBMa0Y=;
 b=hpoBTlDB5c1M64dJ3nfTPCMafbx5Q6eyS5TYUVsLNu1ERB3cAaV2YPk9c6JL0ZgrPB
 a7zg4BAFRGUPyjwzFQeq3+wKH29trBajSnTdEzEbYqOu6EZGjSJVteaz76k+MrA23bMr
 UbShGtj61BFk0yBRIT1Ub8Am3GnmHQx4BAhTxFmBZDfQmWbb9VnY06Iwsv8oZ/Fr0Tuw
 +/sz7B3wZtlsM6wQXsa4pRMjI9rairXfuXSYWoglZGAL7jtQOXNkiqQgMMt4RSIQyuor
 o8mBPU0CqSrDYVXsE0U3MNLjI40szoqKO+AparmM6B5Hxhc/fwmlTuyTQTdR24Wtrm4V
 IF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721234204; x=1721839004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xS3DSdckRYn7jTy4h1ciXu44qXa/Pj3ya32AUzBMa0Y=;
 b=RPwwWDgKK99xyHNZrGrggDlwdaGIvEvkFJBAbPjLEsZZ3nR30EtLUY9M/prvCMksLF
 uerws02OREBkLg160XApQjdxNonabMCPrmctRZVYOXJgRJ5x7q5DVR1TfFErJ4Fxtdk8
 N/RZI+nMFVQFGoCLy1hyyHIY4lHBjwjVzDgSD7dbKvh0qU6LCiZ21G7bIYdZ6POpY7jx
 UqisJhbd10QyDJCrrZBQxqimVWkTXOeEmfPNTQ47uU09N5jDFwXOLHSQf6rEnY6sF0WK
 A6Y4MS9TaDMdcmJM5FF6enue3hCFZWvM754ksfBnA5++tnCXGFHEO0BSPqtUXbGnEWkp
 Osxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnuNMgRyPD9aaBe5MkBNLeMAopOPMrManryivr3xc6lmXH3lzgEBRqllhw8928cnBhwE+LDF+aHTWuhTTSsaYnevqkR2HFuigB8hvDiCsQ
X-Gm-Message-State: AOJu0YxtNBHyAly7+94O4hHducDoxLLLHFqe8ZPwxR0imWw1ez6OqW/d
 a/UrgXx1IgPash7WMGRiZKFABTfcnfmRkX8cyAf1ZLxo16zzD5TZgqMgqA==
X-Google-Smtp-Source: AGHT+IFurVoTGjQHWIcjxe79/Go15gofqseCdO3ikokdIlMnT18lCbu7d4emLjIItFuPe/nEVyrcRw==
X-Received: by 2002:a17:902:ec8c:b0:1fb:779e:4fd0 with SMTP id
 d9443c01a7336-1fc4e130dfdmr17894525ad.24.1721234204256; 
 Wed, 17 Jul 2024 09:36:44 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc4c34a38fsm13762865ad.37.2024.07.17.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:36:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <jroedel@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu <baolu.lu@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Wed, 17 Jul 2024 09:36:21 -0700
Message-ID: <20240717163627.43423-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717163627.43423-1-robdclark@gmail.com>
References: <20240717163627.43423-1-robdclark@gmail.com>
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

Add an io-pgtable method to walk the pgtable returning the raw PTEs that
would be traversed for a given iova access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Joerg Roedel <jroedel@suse.de>

---
 drivers/iommu/io-pgtable-arm.c | 36 +++++++++++++++++++++++++---------
 include/linux/io-pgtable.h     | 17 ++++++++++++++++
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 3d23b924cec1..e70803940b46 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -690,9 +690,11 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops,
+				 unsigned long iova,
+				 void *_wd)
 {
+	struct arm_lpae_io_pgtable_walk_data *wd = _wd;
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_lpae_iopte pte, *ptep = data->pgd;
 	int lvl = data->start_level;
@@ -700,7 +702,7 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	do {
 		/* Valid IOPTE pointer? */
 		if (!ptep)
-			return 0;
+			return -ENOENT;
 
 		/* Grab the IOPTE we're interested in */
 		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
@@ -708,22 +710,37 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 
 		/* Valid entry? */
 		if (!pte)
-			return 0;
+			return -ENOENT;
 
-		/* Leaf entry? */
+		wd->ptes[wd->level++] = pte;
+
+		/* Leaf entry?  If so, we've found the translation */
 		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
+			return 0;
 
 		/* Take it to the next level */
 		ptep = iopte_deref(pte, data);
 	} while (++lvl < ARM_LPAE_MAX_LEVELS);
 
 	/* Ran out of page tables to walk */
-	return 0;
+	return -ENOENT;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct arm_lpae_io_pgtable_walk_data wd = {};
+	int ret, lvl;
+
+	ret = arm_lpae_pgtable_walk(ops, iova, &wd);
+	if (ret)
+		return 0;
+
+	lvl = wd.level + data->start_level;
 
-found_translation:
 	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
+	return iopte_to_paddr(wd.ptes[wd.level - 1], data) | iova;
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
@@ -804,6 +821,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map_pages	= arm_lpae_map_pages,
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86cf1f7ae389..df6f6e58310c 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -171,12 +171,28 @@ struct io_pgtable_cfg {
 	};
 };
 
+/**
+ * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
+ *
+ * @ptes:     The recorded PTE values from the walk
+ * @level:    The level of the last PTE
+ *
+ * @level also specifies the last valid index in @ptes
+ */
+struct arm_lpae_io_pgtable_walk_data {
+	u64 ptes[4];
+	int level;
+};
+
 /**
  * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
  *
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @pgtable_walk: (optional) Perform a page table walk for a given iova.  The
+ *                type for the wd parameter is specific to pgtable type, as
+ *                the PTE size and number of levels differs per pgtable type.
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -190,6 +206,7 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.45.2

