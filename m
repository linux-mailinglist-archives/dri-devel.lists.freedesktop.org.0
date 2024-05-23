Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD08CD97A
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 19:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA7810F1BC;
	Thu, 23 May 2024 17:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZvhlVwkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE64D10F1B8;
 Thu, 23 May 2024 17:52:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1ed96772f92so23646575ad.0; 
 Thu, 23 May 2024 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716486752; x=1717091552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wABXq7eXvgE4oT9T1Y9/oyMqa6vAj39hBqoQ2M3pSr8=;
 b=ZvhlVwkAlhDTvrBb7GTSNzub8DGsA+lszYko1zH6jovd3XXoH/R2BAPLgfpND+jwHx
 aCKfPezqrNkUepJ4mJMFSOJ5F9N2FbXwkDbhOQTT1tXCXucTzAgzm79Qvns2PPl2+UxR
 RqrSmTeYGaCX2A+Mlg3tXiBNmGH4K8scxn3pquKPm9fkI6vN0i2pxOeSbW4n41xilzol
 z1nOG4opW54qzNbiYFELeWdUfazJF/YdsC0xUmHOx2S3eTyPtF0c0k1yvY5NCR9j10A7
 dhjlvi/SPle/VOaLOsifM5ah13ei20xapyM4HVwplnYqJbA/xmkDTn1vIgilQTHD4170
 Balw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716486752; x=1717091552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wABXq7eXvgE4oT9T1Y9/oyMqa6vAj39hBqoQ2M3pSr8=;
 b=XXBq3tS2pZzwruyBBH/qRkcGZ/znow3lK2/V+Zv5VKA1Ckka1Fgxdj2c5ytisQCXU3
 TshV+cbtCF2NhU5X9PR8msTwky4kNVkZWQYt5gkQoK3KkTrjMmfEhtgd96FQptAtKspv
 vbT27B4jJHrBU1XKmSpOUF6h9E8pv/faqAtbS3B4Ez7HmGjQTiyTzcKnpig8WDFDkRk6
 SVxLpD705AUoA9wR8uZW3hNpyf9SoXZKX0OHOGmcoA7BppnOd0WFY0mXDhRE+JdMa4Gd
 8z7kpSZMuNSg+jj44MqeBkhZUyj8nbeFO8Vj4tn8tpO2dJA3PiRRl+6FinN1AGwN61Ts
 tdVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT9f5MbjYHqpN+MVjq1iGhJ2kVC+qon8dJ2SSgyyyDEdAbqWXQHtJ2dLOUBilsOFL4RCcM2TQWbRwx4CRbByiYQS/28VRPpyCLPXANHvQR
X-Gm-Message-State: AOJu0YycVg/kzYJ1zB30M/AlnnIhqMN540iyRH3SuQen7QDFphqvwJzX
 Lfoa9Ln8xruTIrGIvhVxM6K66wcNwjJprorrorcgO4epeN7KmqwuBKkKBA==
X-Google-Smtp-Source: AGHT+IFBPjfPlLDxDBNEdpWCZ7OpFK84HiZnku+Zm5KcsQ3+xnkFTJMGfUhkA5lhqjC+tpNwMNZFoQ==
X-Received: by 2002:a17:902:e889:b0:1f3:4b2a:1ac8 with SMTP id
 d9443c01a7336-1f4486bd92cmr964985ad.13.1716486752590; 
 Thu, 23 May 2024 10:52:32 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f326c0cec2sm31874455ad.174.2024.05.23.10.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:52:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Thu, 23 May 2024 10:52:21 -0700
Message-ID: <20240523175227.117984-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523175227.117984-1-robdclark@gmail.com>
References: <20240523175227.117984-1-robdclark@gmail.com>
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
---
 drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
 include/linux/io-pgtable.h     |  4 +++
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f7828a7aad41..f47a0e64bb35 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+			int (*cb)(void *cb_data, void *pte, int level),
+			void *cb_data)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_lpae_iopte pte, *ptep = data->pgd;
 	int lvl = data->start_level;
+	int ret;
 
 	do {
 		/* Valid IOPTE pointer? */
 		if (!ptep)
-			return 0;
+			return -EFAULT;
 
 		/* Grab the IOPTE we're interested in */
 		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
@@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 
 		/* Valid entry? */
 		if (!pte)
-			return 0;
+			return -EFAULT;
+
+		ret = cb(cb_data, &pte, lvl);
+		if (ret)
+			return ret;
 
-		/* Leaf entry? */
+		/* Leaf entry?  If so, we've found the translation */
 		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
+			return 0;
 
 		/* Take it to the next level */
 		ptep = iopte_deref(pte, data);
 	} while (++lvl < ARM_LPAE_MAX_LEVELS);
 
 	/* Ran out of page tables to walk */
+	return -EFAULT;
+}
+
+struct iova_to_phys_walk_data {
+	arm_lpae_iopte pte;
+	int level;
+};
+
+static int iova_to_phys_walk_cb(void *cb_data, void *pte, int level)
+{
+	struct iova_to_phys_walk_data *d = cb_data;
+
+	d->pte = *(arm_lpae_iopte *)pte;
+	d->level = level;
+
 	return 0;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct iova_to_phys_walk_data d;
+	int ret;
+
+	ret = arm_lpae_pgtable_walk(ops, iova, iova_to_phys_walk_cb, &d);
+	if (ret)
+		return 0;
 
-found_translation:
-	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
+	iova &= (ARM_LPAE_BLOCK_SIZE(d.level, data) - 1);
+	return iopte_to_paddr(d.pte, data) | iova;
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
@@ -807,6 +839,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map_pages	= arm_lpae_map_pages,
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86cf1f7ae389..261b48af068a 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -177,6 +177,7 @@ struct io_pgtable_cfg {
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @pgtable_walk: (optional) Perform a page table walk for a given iova.
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -190,6 +191,9 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
+			    int (*cb)(void *cb_data, void *pte, int level),
+			    void *cb_data);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.45.1

