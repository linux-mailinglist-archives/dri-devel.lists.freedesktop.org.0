Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1536B18A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 12:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF33B6E7F1;
	Mon, 26 Apr 2021 10:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5786E7FE;
 Mon, 26 Apr 2021 10:20:31 +0000 (UTC)
IronPort-SDR: eIqxESii0CW7PFZCyiDmk+bMOKxdVbwPg86hvzyAMSJPdxof93GyneuQ+vtPkWuV7tB+GMS5vu
 Ciefwu7o9rxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196370957"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196370957"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 03:20:31 -0700
IronPort-SDR: l+QXS+mWX9YpKiOm8ohjV9bYZ5yQU6W15bUUcPNN/x6XQKVmksBaL2lnDQ5ifkHRi8r6jvkSJD
 eDVnS8uGnV5Q==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="422613739"
Received: from rgunnin1-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.201])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 03:20:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/fbdev: Use lmem physical addresses for fb_mmap()
 on discrete
Date: Mon, 26 Apr 2021 11:18:19 +0100
Message-Id: <20210426101821.42147-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426101821.42147-1-matthew.auld@intel.com>
References: <20210426101821.42147-1-matthew.auld@intel.com>
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

Use local memory io BAR address for fbdev's fb_mmap() operation on
discrete, fbdev uses the physical address of our framebuffer for its
fb_mmap() fn.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
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
