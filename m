Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CBC3A451B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB646E7D7;
	Fri, 11 Jun 2021 15:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0650F6EF2E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 15:28:16 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id t9so2754852pgn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xr7PRB7Hd7uTEVi/Kqqr6QruQxC5reNs5RNxGaybH98=;
 b=YSZ4LEx/9RYLf/YKEG6tawzieyj/VAOpPCm5Fm982cDV6gY8FOWSj8Iha0Cw2ygemc
 3I0c6r5KExTHw/LJYZsBJHzskVIqgxxuoNNap9FQ4XuW20PKiHcekGBx9346xteGvy0g
 PyEd4u9wNOBOko8Jf1JfFmLyPmRNUFV9L6mCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xr7PRB7Hd7uTEVi/Kqqr6QruQxC5reNs5RNxGaybH98=;
 b=qCKbYWKInN1X+ngtmQObmFdQCk1EApCM8X8ym7ZuNiZwybFUXyqq3RL9x5FRzaFDd6
 8zhXjvCsVNtZS4vgo+8auqm4S4cnpux+U3yY5V8CtUbdVP5R9Rz4+AFAKQ9ao5P1Sp6E
 AeL2BgRfjaSsp60KYZ66CHkZgEhGzVKZ0noMt6PWnYmipyjuiQ5T+WHkuWOKUHCaLIo7
 k8NdjgnRcWtWC2VRHb3Xd6ELtGVCNbDA4eXSsAqXqSb5QtoUMvhBE5rsRnyNwipujlZI
 eMo5CCLjZdbToSKIWt1Ti+aGKrXvKhaRRz2LNps61Fi4w4mpZKG1c6H5El1oHG6pVjCX
 cScQ==
X-Gm-Message-State: AOAM531gsjBaV3wMYH35R2b1Z0XixUIupZQ3CizuDCsZ5lOjIEVcdGzS
 aZSBR3rNUxKj5UXWfiIUXWmSTw==
X-Google-Smtp-Source: ABdhPJxAymBN9XfurYEcX4Hnlqi/pyl7ilzdDB9Ga+mX+C72T/+t3ghcDjkBJ1DjqsKqJ9yREhHJyw==
X-Received: by 2002:a62:2682:0:b029:2f4:e1cf:9575 with SMTP id
 m124-20020a6226820000b02902f4e1cf9575mr8860532pfm.51.1623425295638; 
 Fri, 11 Jun 2021 08:28:15 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id e21sm5534829pjh.55.2021.06.11.08.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:28:15 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v9 07/14] swiotlb: Bounce data from/to restricted DMA pool if
 available
Date: Fri, 11 Jun 2021 23:26:52 +0800
Message-Id: <20210611152659.2142983-8-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
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

Regardless of swiotlb setting, the restricted DMA pool is preferred if
available.

The restricted DMA pools provide a basic level of protection against the
DMA overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system
needs to provide a way to lock down the memory access, e.g., MPU.

Note that is_dev_swiotlb_force doesn't check if
swiotlb_force == SWIOTLB_FORCE. Otherwise the memory allocation behavior
with default swiotlb will be changed by the following patche
("dma-direct: Allocate memory from restricted DMA pool if available").

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 10 +++++++++-
 kernel/dma/direct.c     |  3 ++-
 kernel/dma/direct.h     |  3 ++-
 kernel/dma/swiotlb.c    |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 06cf17a80f5c..8200c100fe10 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -85,6 +85,7 @@ extern enum swiotlb_force swiotlb_force;
  *		unmap calls.
  * @debugfs:	The dentry to debugfs.
  * @late_alloc:	%true if allocated using the page allocator
+ * @force_swiotlb: %true if swiotlb is forced
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -95,6 +96,7 @@ struct io_tlb_mem {
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
+	bool force_swiotlb;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
@@ -115,6 +117,11 @@ static inline void swiotlb_set_io_tlb_default_mem(struct device *dev)
 	dev->dma_io_tlb_mem = io_tlb_default_mem;
 }
 
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return dev->dma_io_tlb_mem->force_swiotlb;
+}
+
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
@@ -126,8 +133,9 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
 }
-static inline void swiotlb_set_io_tlb_default_mem(struct device *dev)
+static inline bool is_dev_swiotlb_force(struct device *dev)
 {
+	return false;
 }
 static inline void swiotlb_exit(void)
 {
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 7a88c34d0867..078f7087e466 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -496,7 +496,8 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
 	if (is_swiotlb_active(dev) &&
-	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE ||
+	     is_dev_swiotlb_force(dev)))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
 }
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 13e9e7158d94..f94813674e23 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,8 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (unlikely(swiotlb_force == SWIOTLB_FORCE) ||
+	    is_dev_swiotlb_force(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 21e99907edd6..e5ccc198d0a7 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -714,6 +714,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 			return -ENOMEM;
 
 		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false, true);
+		mem->force_swiotlb = true;
 
 		rmem->priv = mem;
 
-- 
2.32.0.272.g935e593368-goog

