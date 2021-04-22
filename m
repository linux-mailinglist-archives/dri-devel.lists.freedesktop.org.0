Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5E367D48
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 11:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983696EA49;
	Thu, 22 Apr 2021 09:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71F6EA45
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:16:27 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id s22so11195230pgk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1G5gj/PLnNQoz3P+bt8iN1QajwUJDsAf4nstP4iCbTM=;
 b=ZafF4FJfUesR9XAbkWt/lHd17ocE0jXR3kp0OWu0BRdKPJbUFlOj0f0VYgPE/3Qbwc
 2Pr4TcvUUd9nj9g/tNqn7Y2IvHmckH0eWpuGxaNexZ+lPD9cFlBvIVCgeso5f0AEea0I
 mnsLx26nkhrYwieYrY0jqZ1+5YTFvye3ftPFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1G5gj/PLnNQoz3P+bt8iN1QajwUJDsAf4nstP4iCbTM=;
 b=pLf0We2UB1sz26HzcWWJwmJZyHFpPzGa9E5z9TCCClAG/1QOZrTWfP2KVmBhFSrJNp
 RlM8GfvX6FYAPDLOby6AgZSfVDksl6vVffWKbgT//bM+xa0sdZQJkxkv5MQoKfugIxwz
 gfuptNt4KwxuiPMZdDEygG4OdGbZLUpmlRKGc46AdfycoLrGclAw5EQbO466iItbOHbd
 JXqvwoJgtfkwjHd+SK7P7Y6Gtgt0q6Mww1kN802btZ11g6+WOXvaf6UUm1vwK4TtC/GO
 ajHlKob4RW8PFEz/9ga2qA24fyenGWGJtNiHVZYhBUZU88l+VDc14WNZnbpAcu4exipV
 PU2w==
X-Gm-Message-State: AOAM5338xqWm8M3LFcNhiz7HNXjWZxGKeqivLaNHRCdkGwN7Eox42d0b
 T31r+PfNaxGwV86HRLg/4u2HaQ==
X-Google-Smtp-Source: ABdhPJxNq2WnH0g8PS1NVKpMmzhbtunLVw3q0JGcM/1rJuID7QxOQ0TgMJb+xzMVpYX2xV/rncERHw==
X-Received: by 2002:a63:c49:: with SMTP id 9mr2335649pgm.381.1619079386771;
 Thu, 22 Apr 2021 01:16:26 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id n3sm1433648pga.92.2021.04.22.01.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:16:26 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 08/16] swiotlb: Update is_swiotlb_active to add a struct
 device argument
Date: Thu, 22 Apr 2021 16:15:00 +0800
Message-Id: <20210422081508.3942748-9-tientzu@chromium.org>
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

Update is_swiotlb_active to add a struct device argument. This will be
useful later to allow for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
 drivers/pci/xen-pcifront.c                   | 2 +-
 include/linux/swiotlb.h                      | 4 ++--
 kernel/dma/direct.c                          | 2 +-
 kernel/dma/swiotlb.c                         | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ce6b664b10aa..7d48c433446b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 
 	max_order = MAX_ORDER;
 #ifdef CONFIG_SWIOTLB
-	if (is_swiotlb_active()) {
+	if (is_swiotlb_active(NULL)) {
 		unsigned int max_segment;
 
 		max_segment = swiotlb_max_segment();
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index e8b506a6685b..2a2ae6d6cf6d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active();
+	need_swiotlb = is_swiotlb_active(NULL);
 #endif
 
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index b7a8f3a1921f..6d548ce53ce7 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !is_swiotlb_active()) {
+	if (!err && !is_swiotlb_active(NULL)) {
 		err = pci_xen_swiotlb_init_late();
 		if (err)
 			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 2a6cca07540b..c530c976d18b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -123,7 +123,7 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
-bool is_swiotlb_active(void);
+bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
@@ -143,7 +143,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
 	return SIZE_MAX;
 }
 
-static inline bool is_swiotlb_active(void)
+static inline bool is_swiotlb_active(struct device *dev)
 {
 	return false;
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 84c9feb5474a..7a88c34d0867 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -495,7 +495,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
-	if (is_swiotlb_active() &&
+	if (is_swiotlb_active(dev) &&
 	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ffbb8724e06c..1d221343f1c8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -659,9 +659,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
 }
 
-bool is_swiotlb_active(void)
+bool is_swiotlb_active(struct device *dev)
 {
-	return io_tlb_default_mem != NULL;
+	return get_io_tlb_mem(dev) != NULL;
 }
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
