Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104EA46EFFB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3511310F2D9;
	Thu,  9 Dec 2021 16:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556AD10E116;
 Thu,  9 Dec 2021 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639067347; x=1670603347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ku01Mbk+zewXE6P0LRCEOSQklgP4Gp21LPewXzb+n/U=;
 b=X5ZDdSJZ8j5VfIeFiz32xc9Mc/Nvfeq96fmkN34NuM6zNCMxu8JzuPbm
 GFUQS9SUZB2Rk3uLbFM/elp+Avz3NwptyaywcOerV39oadrDm4npJfEaS
 sMQUSa25WAAD27or1biOFvu+vizdw194Ogt9n8djjAxGJqfbRb2XfUBOq
 SkkQcWqU5jVIZOE+72CvL0T++wZ3vIp+9lNNLTvUBO9fTlmBYKUIgdQFo
 ybSskEUyu2PXKQa44lBOq0MIr5ZX4yQtlZa/s9TUjbzeuGu9XuhXVIdpw
 QtljQYsZRN7zqXgC3e03bOsGSBzLaHNh3gkvdz5oHLeOMBhN5zBb1x+fq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218164806"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="218164806"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 08:26:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="463301187"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 08:26:37 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 2/3] drm/i915: Sanitycheck device iomem on probe
Date: Thu,  9 Dec 2021 21:56:20 +0530
Message-Id: <20211209162620.5218-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208153404.27546-3-ramalingam.c@intel.com>
References: <20211208153404.27546-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

As we setup the memory regions for the device, give each a quick test to
verify that we can read and write to the full iomem range. This ensures
that our physical addressing for the device's memory is correct, and
some reassurance that the memory is functional.

v2: wrapper for memtest [Chris]

v3: Removed the unused ptr i915 [Chris]

v4: used the %pa for the resource_size_t.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index b43121609e25..7bfb6df02e72 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <linux/prandom.h>
+
 #include "intel_memory_region.h"
 #include "i915_drv.h"
 #include "i915_ttm_buddy_manager.h"
@@ -29,6 +31,99 @@ static const struct {
 	},
 };
 
+static int __iopagetest(struct intel_memory_region *mem,
+			u8 __iomem *va, int pagesize,
+			u8 value, resource_size_t offset,
+			const void *caller)
+{
+	int byte = prandom_u32_max(pagesize);
+	u8 result[3];
+
+	memset_io(va, value, pagesize); /* or GPF! */
+	wmb();
+
+	result[0] = ioread8(va);
+	result[1] = ioread8(va + byte);
+	result[2] = ioread8(va + pagesize - 1);
+	if (memchr_inv(result, value, sizeof(result))) {
+		dev_err(mem->i915->drm.dev,
+			"Failed to read back from memory region:%pR at [%pa + %pa] for %ps; wrote %x, read (%x, %x, %x)\n",
+			&mem->region, &mem->io_start, &offset, caller,
+			value, result[0], result[1], result[2]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int iopagetest(struct intel_memory_region *mem,
+		      resource_size_t offset,
+		      const void *caller)
+{
+	const u8 val[] = { 0x0, 0xa5, 0xc3, 0xf0 };
+	void __iomem *va;
+	int err;
+	int i;
+
+	va = ioremap_wc(mem->io_start + offset, PAGE_SIZE);
+	if (!va) {
+		dev_err(mem->i915->drm.dev,
+			"Failed to ioremap memory region [%pa + %pa] for %ps\n",
+			&mem->io_start, &offset, caller);
+		return -EFAULT;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(val); i++) {
+		err = __iopagetest(mem, va, PAGE_SIZE, val[i], offset, caller);
+		if (err)
+			break;
+
+		err = __iopagetest(mem, va, PAGE_SIZE, ~val[i], offset, caller);
+		if (err)
+			break;
+	}
+
+	iounmap(va);
+	return err;
+}
+
+static resource_size_t random_page(resource_size_t last)
+{
+	/* Limited to low 44b (16TiB), but should suffice for a spot check */
+	return prandom_u32_max(last >> PAGE_SHIFT) << PAGE_SHIFT;
+}
+
+static int iomemtest(struct intel_memory_region *mem, const void *caller)
+{
+	resource_size_t last = resource_size(&mem->region) - PAGE_SIZE;
+	int err;
+
+	/*
+	 * Quick test to check read/write access to the iomap (backing store).
+	 *
+	 * Write a byte, read it back. If the iomapping fails, we expect
+	 * a GPF preventing further execution. If the backing store does not
+	 * exist, the read back will return garbage. We check a couple of pages,
+	 * the first and last of the specified region to confirm the backing
+	 * store + iomap does cover the entire memory region; and we check
+	 * a random offset within as a quick spot check for bad memory.
+	 */
+
+	err = iopagetest(mem, 0, caller);
+	if (err)
+		return err;
+
+	err = iopagetest(mem, last, caller);
+	if (err)
+		return err;
+
+	err = iopagetest(mem, random_page(last), caller);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 struct intel_memory_region *
 intel_memory_region_lookup(struct drm_i915_private *i915,
 			   u16 class, u16 instance)
@@ -90,6 +185,20 @@ void intel_memory_region_debug(struct intel_memory_region *mr,
 			   &mr->total, &mr->avail);
 }
 
+static int intel_memory_region_memtest(struct intel_memory_region *mem,
+				       void *caller)
+{
+	int err = 0;
+
+	if (!mem->io_start)
+		return 0;
+
+	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
+		err = iomemtest(mem, caller);
+
+	return err;
+}
+
 struct intel_memory_region *
 intel_memory_region_create(struct drm_i915_private *i915,
 			   resource_size_t start,
@@ -126,8 +235,15 @@ intel_memory_region_create(struct drm_i915_private *i915,
 			goto err_free;
 	}
 
+	err = intel_memory_region_memtest(mem, (void *)_RET_IP_);
+	if (err)
+		goto err_release;
+
 	return mem;
 
+err_release:
+	if (mem->ops->release)
+		mem->ops->release(mem);
 err_free:
 	kfree(mem);
 	return ERR_PTR(err);
-- 
2.20.1

