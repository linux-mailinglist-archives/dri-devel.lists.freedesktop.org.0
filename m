Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD03A9201
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 08:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA4C6E4EA;
	Wed, 16 Jun 2021 06:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B166B6E4EA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 06:23:09 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so1120187pjq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 23:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cTgFKnn3cLtvPfjI+55Cezw2EcnHDtp9/QQ3R2B3hUE=;
 b=cyJuCSilvPYniiPuEKQywgAZ2h40B6myx9TbQoS+O9qIihERcGr8FMpcEdjS0/tshr
 T6oF/Jqx7uEfUaJBG88Ds+6w77XhG2zyZ5Tn4UAWzJqH5XWwEFNMsFYg6ebrjJXldgCo
 SKPhXn/2f6RY0GqzhxLpDEImP7+pN5t8KYNM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cTgFKnn3cLtvPfjI+55Cezw2EcnHDtp9/QQ3R2B3hUE=;
 b=DSd5yjAqBr/Of4naQyE2CAmKQIxC3uwJ2cUb6bJhTz6DhtQlqtuGF8eqzXKFW5jpBo
 D70WR1LMLv7gXNcGFF45JHiOxyhv0nHRhpaBsp0w/+myaOaEsggXbtKlbPXGAmPKJl9m
 iCPbaqZlCaX278Ow+Tpvk9YbA5YeafUbF0sa7LxSmfe8R1/dW7scYsPeg9OKnUfm9jTe
 4JrgJyMmrn2BFujBaZD8GI9vRpmSKnCzCPk7qOywusCCnbIWS5HTpBq6r7jrV8jEL2A/
 QA6AoZ0Zf4Zgz6JHCotAhUqn/MsVlnNeziWYaGIQZc1SJMq4eBJGo00Nzphw3gsTzln9
 d1Wg==
X-Gm-Message-State: AOAM530Qjwo5MKNuQo1IokUzjgSwk5wD3gEBEsb7WrggammAgBD6M9LQ
 D67YYx4cxze/tdgAjRRVTHn5xw==
X-Google-Smtp-Source: ABdhPJxAvAAxvtMv6OUMS0EcucXOxwEcajpljVPpcHfCCwVFyghupOkDxlHVu6RexNkHSd0Tgg6RHw==
X-Received: by 2002:a17:90a:9511:: with SMTP id
 t17mr3458123pjo.108.1623824589397; 
 Tue, 15 Jun 2021 23:23:09 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id f8sm960978pfv.73.2021.06.15.23.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:23:08 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v12 07/12] swiotlb: Move alloc_size to swiotlb_find_slots
Date: Wed, 16 Jun 2021 14:21:52 +0800
Message-Id: <20210616062157.953777-8-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210616062157.953777-1-tientzu@chromium.org>
References: <20210616062157.953777-1-tientzu@chromium.org>
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

Rename find_slots to swiotlb_find_slots and move the maintenance of
alloc_size to it for better code reusability later.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b5a9c4c0b4db..b59e689aa79d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -431,8 +431,8 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
  * Find a suitable number of IO TLB entries size that will fit this request and
  * allocate a buffer from that IO TLB pool.
  */
-static int find_slots(struct device *dev, phys_addr_t orig_addr,
-		size_t alloc_size)
+static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
+			      size_t alloc_size)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
@@ -487,8 +487,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 	return -1;
 
 found:
-	for (i = index; i < index + nslots; i++)
+	for (i = index; i < index + nslots; i++) {
 		mem->slots[i].list = 0;
+		mem->slots[i].alloc_size =
+			alloc_size - ((i - index) << IO_TLB_SHIFT);
+	}
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
@@ -529,7 +532,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
-	index = find_slots(dev, orig_addr, alloc_size + offset);
+	index = swiotlb_find_slots(dev, orig_addr, alloc_size + offset);
 	if (index == -1) {
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
@@ -543,11 +546,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * This is needed when we sync the memory.  Then we sync the buffer if
 	 * needed.
 	 */
-	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
+	for (i = 0; i < nr_slots(alloc_size + offset); i++)
 		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
-		mem->slots[index + i].alloc_size =
-			alloc_size - (i << IO_TLB_SHIFT);
-	}
 	tlb_addr = slot_addr(mem->start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-- 
2.32.0.272.g935e593368-goog

