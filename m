Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3C72C64DB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C6A6EC94;
	Fri, 27 Nov 2020 12:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7266EC8C;
 Fri, 27 Nov 2020 12:09:49 +0000 (UTC)
IronPort-SDR: NcEGX88af6+I4WwZE635+FO3Tlhown+6Ow4W58XdZcuQZ0/zfbN8XdYRlAY5OqSLi7/mJdZwwu
 xtPcnNDnMqeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540717"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:49 -0800
IronPort-SDR: 79kc55yoqesTiRhp036EO7F5i6Bru+cEtMuzdNx7Ou9l0UIzlvSPtNuFAydF+VG4nPdKdY4uzK
 kkQx5z9Lo23Q==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029093"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:47 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 077/162] drm/i915/fbdev: Use lmem physical addresses for
 fb_mmap() on discrete
Date: Fri, 27 Nov 2020 12:05:53 +0000
Message-Id: <20201127120718.454037-78-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 27 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index bdf44e923cc0..831e99e0785c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -178,6 +178,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	unsigned long flags = 0;
 	bool prealloc = false;
 	void __iomem *vaddr;
+	struct drm_i915_gem_object *obj;
 	int ret;
 
 	if (intel_fb &&
@@ -232,13 +233,27 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	info->fbops = &intelfb_ops;
 
 	/* setup aperture base/size for vesafb takeover */
-	info->apertures->ranges[0].base = ggtt->gmadr.start;
-	info->apertures->ranges[0].size = ggtt->mappable_end;
+	obj = intel_fb_obj(&intel_fb->base);
+	if (HAS_LMEM(dev_priv) && i915_gem_object_is_lmem(obj)) {
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
