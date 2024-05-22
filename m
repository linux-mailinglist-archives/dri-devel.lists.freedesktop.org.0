Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2928CC83F
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 23:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8F310EF70;
	Wed, 22 May 2024 21:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WdVuFQI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C0410EF0C;
 Wed, 22 May 2024 21:50:29 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1f32a3b9491so7864365ad.0; 
 Wed, 22 May 2024 14:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716414629; x=1717019429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2K8+gSIw4h67vM78HufTAFJM7Lhu4djthlJzN7dgn0c=;
 b=WdVuFQI9CbA/hbVSMkUhcyG+/hMu43/i1+hWF6M77aeiPBk7lJmVCFXhYg0PdaKPB9
 Jrwir5v4Lc42qO8Lsh2kVQy0wc0iuYLMRzqLckasjsMy2KtXc03wjwKLQdVrVMsiezH3
 V75K7P4OR3yFDFV6ZIM60dtCbLnA4SOo30hhxZTIomZZI35ErlVrrupTFk813MOzEiZN
 U8de8mwt3NroMomPnMT+qnXBuyafnTVTkVrMYnMJfMyRr/b2mgLUhWIQzdOoP+KSvZeI
 3pdE8IYw6wLxPs3Y5/vVovAEMIq5lpPDojDcS503vRvaN9+9IsaWYmOQK79xvOKqEE7W
 osNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716414629; x=1717019429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2K8+gSIw4h67vM78HufTAFJM7Lhu4djthlJzN7dgn0c=;
 b=qhO8WIctF+ZPWU07zBldb2G5U/rJ5DTVR9ODodck7vVlC8b4bO2VT1PFv2D/jXyw+S
 UsTtKv/cRBrP8/h4Z4lp5gqNCPYDOE4N6TGF/5wPIl7dhu0uzg48PZJZyG4x7frQYs3V
 6qIzMPO5EZwJ7pc+on0HwQxH02qIXEz9DGCJpHURDmLbZTZwzMObgHXKHVy680XKjbub
 52LDaX2phUdbw/NUAw6kcJNeZCk1A6X/2+/lwbgX8doVKKJ9XIe1K8rcFoVAEoG2M3Bk
 gRyvvV25vJSLcy7UdKauJbscWKIgn3tOE/H0ZtqJLDY7paBAxx+tJXx/yffEOAB/Xs85
 jcTQ==
X-Gm-Message-State: AOJu0YxeByg3QrqVFGHfOnxcL1iEkNrYQJB18W9T8tm+eBksmnzNAkb0
 V+kpkLo2QTEyzEEVuffoNCre9nvdDCcyydp/vCXOKINxjyVo7nUk0PxlLg==
X-Google-Smtp-Source: AGHT+IFIIpfLzA2F8YRHGJoHwYIzp1NwLhTR7zRlOfJiiosDMMxFWV3+xMEZwsF1wYLyTw/w3Kgo7A==
X-Received: by 2002:a17:902:f544:b0:1f2:f854:f59 with SMTP id
 d9443c01a7336-1f31c9652d7mr38668525ad.15.1716414628554; 
 Wed, 22 May 2024 14:50:28 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c03619csm243076425ad.209.2024.05.22.14.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 14:50:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Wed, 22 May 2024 14:50:04 -0700
Message-ID: <20240522215014.26007-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522215014.26007-1-robdclark@gmail.com>
References: <20240522215014.26007-1-robdclark@gmail.com>
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
 drivers/iommu/io-pgtable-arm.c | 50 ++++++++++++++++++++++++++++------
 include/linux/io-pgtable.h     |  4 +++
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f7828a7aad41..86d2b34d6f95 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+static int pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
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
+	ret = pgtable_walk(ops, iova, iova_to_phys_walk_cb, &d);
+	if (ret)
+		return 0;
 
-found_translation:
-	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
+	iova &= (ARM_LPAE_BLOCK_SIZE(d.level, data) - 1);
+	return iopte_to_paddr(d.pte, data) | iova;
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
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

