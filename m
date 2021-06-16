Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BBB3A900A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 05:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F876E4C7;
	Wed, 16 Jun 2021 03:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5836E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:54:02 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 i11-20020a17090a2acbb029016f0cce7c3fso726783pjg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 20:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oRb0kCzQtLL1ODc5XeMJxnNfFZ/YZDLs649wILFum/w=;
 b=fDeLRHQuzvZl/O2NTctSqXJKMWXTxqlo16QC4RXzz6Fvxm73sl/3M8yfUKRM/Xfzv2
 sPwjA2S4EPwgw1F4xRrjz17pkm8IuR4J9KX6wisU/p3khyvTs1wWM44nrtHddPEv3UvM
 iBGwg92Cx7crarCTSI8jG8z24tV7ZZ8Qr4q3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oRb0kCzQtLL1ODc5XeMJxnNfFZ/YZDLs649wILFum/w=;
 b=jIegdnG0oYXfOJ/s3mXd/UYNxLUfC0RU9VLuYkXt9fDY7rOMbdc0po9th3bOIZ3eoI
 K6JJOkSAwzepbnjGAk8sui0ekY4s+dyK3BMpzonVRS/c3FtOwsMWE5ugJpYRd1gT4B+a
 TJqosmZtmvpsEIAHFLwoNhRpDcEfDQedIL2jxOnJgucnn3hh/8e7Cf5+iQd1C1+oFIV5
 Nb6WLMtkOSme/fxMX2Ywsxdu/sTWf9CGcaKiJSqPYglsUA+5hBIHWChMKEig+nvaynGP
 YgLcNwhRax3DDnLmBDXYzP2hqR86ye8HrT/oJRAySewJz1piVSCJL6+Fo19paedCDRrj
 23GA==
X-Gm-Message-State: AOAM530n+0DrL/lOK+kqUzrnWIg+ySU9u86Oykakz0BXjnRPYvEeq9l9
 qeJz167r1Vy/3K35fAAd2ENMdQ==
X-Google-Smtp-Source: ABdhPJz2SpFmFttTbKmua4yfCKw+rNX4RUtDeeiYBVc41CWQZ990iBLac4Laog8hhJ7q/QRKPHHVEg==
X-Received: by 2002:a17:902:bf02:b029:11e:89a0:8694 with SMTP id
 bi2-20020a170902bf02b029011e89a08694mr1859083plb.83.1623815641807; 
 Tue, 15 Jun 2021 20:54:01 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id o186sm531682pfb.59.2021.06.15.20.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 20:54:01 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v11 08/12] swiotlb: Refactor swiotlb_tbl_unmap_single
Date: Wed, 16 Jun 2021 11:52:36 +0800
Message-Id: <20210616035240.840463-9-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210616035240.840463-1-tientzu@chromium.org>
References: <20210616035240.840463-1-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new function, swiotlb_release_slots, to make the code reusable for
supporting different bounce buffer pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 037772724b3c..fec4934b9926 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -555,27 +555,15 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	return tlb_addr;
 }
 
-/*
- * tlb_addr is the physical address of the bounce buffer to unmap.
- */
-void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
-			      size_t mapping_size, enum dma_data_direction dir,
-			      unsigned long attrs)
+static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 {
-	struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long flags;
-	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
+	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
 	int nslots = nr_slots(mem->slots[index].alloc_size + offset);
 	int count, i;
 
-	/*
-	 * First, sync the memory before unmapping the entry
-	 */
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
-		swiotlb_bounce(hwdev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
-
 	/*
 	 * Return the buffer to the free list by setting the corresponding
 	 * entries to indicate the number of contiguous entries available.
@@ -610,6 +598,23 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	spin_unlock_irqrestore(&mem->lock, flags);
 }
 
+/*
+ * tlb_addr is the physical address of the bounce buffer to unmap.
+ */
+void swiotlb_tbl_unmap_single(struct device *dev, phys_addr_t tlb_addr,
+			      size_t mapping_size, enum dma_data_direction dir,
+			      unsigned long attrs)
+{
+	/*
+	 * First, sync the memory before unmapping the entry
+	 */
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
+		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
+
+	swiotlb_release_slots(dev, tlb_addr);
+}
+
 void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
 		size_t size, enum dma_data_direction dir)
 {
-- 
2.32.0.272.g935e593368-goog

