Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0235BF86
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D486E288;
	Mon, 12 Apr 2021 09:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3916E23D;
 Mon, 12 Apr 2021 09:09:28 +0000 (UTC)
IronPort-SDR: lCxWojj5FiM7BjN3EOH2sEbaY1n799uOCBQpSENMIfGzH1n2jtD5Xrg2Hb/CHogk2EpKpQrZol
 FZEh827LgMSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709714"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709714"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:28 -0700
IronPort-SDR: a4i+4YLQL1fjBvSqEFyJBSE003eAch+iYz5SvC8LFKx/XfORxqfYk9dVFtzsPY/T6/V/7fG1vZ
 EVzM4eiMwsiQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712645"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/19] drm/i915/fbdev: Use lmem physical addresses for
 fb_mmap() on discrete
Date: Mon, 12 Apr 2021 10:05:14 +0100
Message-Id: <20210412090526.30547-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

use local memory io BAR address for fbdev's fb_mmap() operation on
discrete, fbdev uses the physical address of our framebuffer for its
fb_mmap() fn.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 29 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index ccd00e65a5fe..2b37959da747 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -41,6 +41,8 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 
+#include "gem/i915_gem_lmem.h"
+
 #include "i915_drv.h"
 #include "intel_display_types.h"
 #include "intel_fbdev.h"
@@ -178,6 +180,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	unsigned long flags = 0;
 	bool prealloc = false;
 	void __iomem *vaddr;
+	struct drm_i915_gem_object *obj;
 	int ret;
 
 	if (intel_fb &&
@@ -232,13 +235,27 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	info->fbops = &intelfb_ops;
 
 	/* setup aperture base/size for vesafb takeover */
-	info->apertures->ranges[0].base = ggtt->gmadr.start;
-	info->apertures->ranges[0].size = ggtt->mappable_end;
+	obj = intel_fb_obj(&intel_fb->base);
+	if (i915_gem_object_is_lmem(obj)) {
+		struct intel_memory_region *mem = obj->mm.region;
+
+		info->apertures->ranges[0].base = mem->io_start;
+		info->apertures->ranges[0].size = mem->total;
+
+		/* Use fbdev's framebuffer from lmem for discrete */
+		info->fix.smem_start =
+			(unsigned long)(mem->io_start +
+					i915_gem_object_get_dma_address(obj, 0));
+		info->fix.smem_len = obj->base.size;
+	} else {
+		info->apertures->ranges[0].base = ggtt->gmadr.start;
+		info->apertures->ranges[0].size = ggtt->mappable_end;
 
-	/* Our framebuffer is the entirety of fbdev's system memory */
-	info->fix.smem_start =
-		(unsigned long)(ggtt->gmadr.start + vma->node.start);
-	info->fix.smem_len = vma->node.size;
+		/* Our framebuffer is the entirety of fbdev's system memory */
+		info->fix.smem_start =
+			(unsigned long)(ggtt->gmadr.start + vma->node.start);
+		info->fix.smem_len = vma->node.size;
+	}
 
 	vaddr = i915_vma_pin_iomap(vma);
 	if (IS_ERR(vaddr)) {
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
