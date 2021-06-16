Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BACCE3A91FC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 08:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619E26E500;
	Wed, 16 Jun 2021 06:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FD96E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 06:23:01 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id y15so1355500pfl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yx1sBUKg2SZ/J5oPuuLxuIdituaRXED8so7Vw8sLIws=;
 b=Q4K6eTywavWHh5xBRTV2Sn1QN0pqm21rAHVV9HUXv/UP1w8xNe4Z5udU+NX1vgnB1+
 c3YMRhLko40t5PNbJ2OEaPKxiaHUl4VjZBfqy96tFVH3Qfa8f64z0y648a814QEkXJ8w
 S/rgJ3x7L88xW9cuGs4qk0A1P9NST1SKpuLUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yx1sBUKg2SZ/J5oPuuLxuIdituaRXED8so7Vw8sLIws=;
 b=krAfyEnWR1NvtLpjyAoReVan3bAKTt2WfQ4QDcF/od/mDmyKhpnT761w/nsf2fv+JE
 ZMxM5uDufwEpSRbTR2hTSO98fHf7bBsDwSGGx43/f3AaV7VnLSXTnqFPSkrrYh+FKVbt
 XDDmtp12hFgtjNpoFOayqC6yt9WCDyQfzMVF9lkasONfegAhHvbPv4r4FMPRg9eRiKmf
 P5Ucm2PwIKYOVHVVM2TUk0L3p7ctwJ5B9UnatPj7KtKiCsbJpMXJczoRMO5WdyMtLBXG
 nZATF+NoQg/ht609bBYPYLmNREe1LtFRCyEoKfIKgEeohKz+1wm5Mv++6yMCkYtCnBo5
 j5sQ==
X-Gm-Message-State: AOAM5330YUfHctYmN88v5PKQaOj4ykP6c76O2w0GbW/M1ZaAdsReFitw
 UN2q603lsarDntnjQmZEiYKt1w==
X-Google-Smtp-Source: ABdhPJw3qSZ6gJG41Gxh6T5HUfWmBlX+79o8LgLEBQMF8QRY4VhLx/+veYL/HvERe1FdH5EyrXhyxw==
X-Received: by 2002:a63:4719:: with SMTP id u25mr3506046pga.193.1623824580858; 
 Tue, 15 Jun 2021 23:23:00 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id f18sm4233834pjq.48.2021.06.15.23.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:23:00 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v12 06/12] swiotlb: Use is_swiotlb_force_bounce for swiotlb
 data bouncing
Date: Wed, 16 Jun 2021 14:21:51 +0800
Message-Id: <20210616062157.953777-7-tientzu@chromium.org>
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

Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
use it to determine whether to bounce the data or not. This will be
useful later to allow for different pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 11 +++++++++++
 kernel/dma/direct.c     |  2 +-
 kernel/dma/direct.h     |  2 +-
 kernel/dma/swiotlb.c    |  4 ++++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index dd1c30a83058..8d8855c77d9a 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -84,6 +84,7 @@ extern enum swiotlb_force swiotlb_force;
  *		unmap calls.
  * @debugfs:	The dentry to debugfs.
  * @late_alloc:	%true if allocated using the page allocator
+ * @force_bounce: %true if swiotlb bouncing is forced
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -94,6 +95,7 @@ struct io_tlb_mem {
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
+	bool force_bounce;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
@@ -109,6 +111,11 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 	return mem && paddr >= mem->start && paddr < mem->end;
 }
 
+static inline bool is_swiotlb_force_bounce(struct device *dev)
+{
+	return dev->dma_io_tlb_mem->force_bounce;
+}
+
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
@@ -120,6 +127,10 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
 }
+static inline bool is_swiotlb_force_bounce(struct device *dev)
+{
+	return false;
+}
 static inline void swiotlb_exit(void)
 {
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 7a88c34d0867..a92465b4eb12 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -496,7 +496,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
 	if (is_swiotlb_active(dev) &&
-	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+	    (dma_addressing_limited(dev) || is_swiotlb_force_bounce(dev)))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
 }
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 13e9e7158d94..4632b0f4f72e 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (is_swiotlb_force_bounce(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 101abeb0a57d..b5a9c4c0b4db 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -179,6 +179,10 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->end = mem->start + bytes;
 	mem->index = 0;
 	mem->late_alloc = late_alloc;
+
+	if (swiotlb_force == SWIOTLB_FORCE)
+		mem->force_bounce = true;
+
 	spin_lock_init(&mem->lock);
 	for (i = 0; i < mem->nslabs; i++) {
 		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
-- 
2.32.0.272.g935e593368-goog

