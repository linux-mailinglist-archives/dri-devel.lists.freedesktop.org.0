Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0442F367D61
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 11:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A546EA54;
	Thu, 22 Apr 2021 09:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556586EA3E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:17:10 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso533077pjn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=amLAD+RuuU3TmKFLsrLVVPzhv2qyOaj37trLDwA/WtE=;
 b=Dj/C9WZrDChheWfT11j6BI+1xKOZ8hApHZ2w0Qy3MxSy/cqQLSJYj2gZK/YuJ4iIqk
 8k9EDKNs+mFov1kHPXJWtO3gtxQvHorUgtfKDGGqzwW6RF+yPi7tP6JrpUnkOT4Bvhjl
 Alh5tpYaBvNeWg/DoLW0FIIaWItMtbLb2gNS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=amLAD+RuuU3TmKFLsrLVVPzhv2qyOaj37trLDwA/WtE=;
 b=UEN+Evz4pARmQO0Ly+7HaG0z2Bw6YcYOP+c/3mrR2SAi4oeOZAkihrPDS0iqI4Ka6l
 tMEZvsycBArxL6n2H1Q2Mf3nKgmwTvQ+2cwzinrTSaQsoehQlY3S7TQQo7CCpFKrlOxi
 XXhW/9Gve/6hhD4o+QY1Q3pcTp1DJpvnVe4ZHzolPAZ8R3GoqBkm65aeo677X1pl6KHu
 1zPxgnaY/Pu2LkC44aNb2IqbZ2KlOKLor7i0zqhIMvrNv5dH73vpDa8KWQ6YBlFPNJr5
 FVqAXU+fY/3qxKyfcnuzx3/NV8TJz/phS1O/oSTBULmWfOaY1utfRdS6wBzQtZUeicK2
 x+Yw==
X-Gm-Message-State: AOAM533b8/4FJPoGxWpdWSrfwOqhSS00aqleN20zPlgqkZZgxfGxvqp7
 h1gSZKQbTxMO11dRBhstO7xI+Q==
X-Google-Smtp-Source: ABdhPJw5kQ5A6QRD+RO8aTMY2CqyP4o05a4lnui6PsoqZSt0Lb4MmrzRSlYlz+T9E15MIZErilA+dw==
X-Received: by 2002:a17:902:7fc9:b029:eb:4828:47e8 with SMTP id
 t9-20020a1709027fc9b02900eb482847e8mr2274855plb.56.1619079429963; 
 Thu, 22 Apr 2021 01:17:09 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id r127sm1426080pfr.163.2021.04.22.01.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:17:09 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 13/16] swiotlb: Add restricted DMA alloc/free support.
Date: Thu, 22 Apr 2021 16:15:05 +0800
Message-Id: <20210422081508.3942748-14-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Apr 2021 09:10:06 +0000
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
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the functions, swiotlb_{alloc,free} to support the memory allocation
from restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h |  4 ++++
 kernel/dma/swiotlb.c    | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 0c5a18d9cf89..e8cf49bd90c5 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -134,6 +134,10 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *swiotlb_alloc(struct device *dev, size_t size);
+bool swiotlb_free(struct device *dev, struct page *page, size_t size);
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index af0feb8eaead..274272c79080 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -454,8 +454,9 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 
 	index = wrap = wrap_index(mem, ALIGN(mem->index, stride));
 	do {
-		if ((slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
-		    (orig_addr & iotlb_align_mask)) {
+		if (orig_addr &&
+		    (slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
+			    (orig_addr & iotlb_align_mask)) {
 			index = wrap_index(mem, index + 1);
 			continue;
 		}
@@ -695,6 +696,36 @@ late_initcall(swiotlb_create_default_debugfs);
 #endif
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *swiotlb_alloc(struct device *dev, size_t size)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	phys_addr_t tlb_addr;
+	int index;
+
+	if (!mem)
+		return NULL;
+
+	index = find_slots(dev, 0, size);
+	if (index == -1)
+		return NULL;
+
+	tlb_addr = slot_addr(mem->start, index);
+
+	return pfn_to_page(PFN_DOWN(tlb_addr));
+}
+
+bool swiotlb_free(struct device *dev, struct page *page, size_t size)
+{
+	phys_addr_t tlb_addr = page_to_phys(page);
+
+	if (!is_swiotlb_buffer(dev, tlb_addr))
+		return false;
+
+	release_slots(dev, tlb_addr);
+
+	return true;
+}
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
