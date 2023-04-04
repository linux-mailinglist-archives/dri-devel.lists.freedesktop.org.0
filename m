Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808366D6563
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B0610E6D2;
	Tue,  4 Apr 2023 14:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A8210E6CE;
 Tue,  4 Apr 2023 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680618735; x=1712154735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b+7vAye6yKlGhJLZuGZgx4WaStVtA/1Ovufj+rm4zOM=;
 b=L0lNNYu6RPtpmTdp2AOuBKXVASS+PqLBpmHzF7yTY2MnQArRtJ9rYQaV
 msCBlE8NJR6o5PGq0DA4ENv6Y/20BG2MMqF853W0T72vben+9RN7fGoVk
 0Dms3+pxzAFLEtI+TxbEZz8ubZfGlV4NTLmICjyRZSSqvVpZNpKz+M7vg
 BDWMOxwZODNNF+/N713LdQBvK3XgW/hw87YNqLEm4Fn+TX0E6TITOXe3p
 Up/W1A6tuDtRh/fz5FQU6pgG1hkQISq8aSEoPJCK4gLD3kQyHsSHB5lu1
 pf/NHNbaue0xRQXeot0+PcOqAs+mqCrDE35OSW9mAErwJJu9t27W9GxbG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="404960905"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="404960905"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="688918205"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="688918205"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/display: Implement fb_mmap callback function
Date: Tue,  4 Apr 2023 16:31:00 +0200
Message-Id: <20230404143100.10452-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230404143100.10452-1-nirmoy.das@intel.com>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If stolen memory allocation fails for fbdev, the driver will
fallback to system memory. Calculation of smem_start is wrong
for such framebuffer objs if the platform comes with no gmadr or
no aperture. Solve this by adding fb_mmap callback which will
use GTT if aperture is available otherwise will use cpu to access
the framebuffer.

v2: Use to_intel_fbdev() function(Jani)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 2ac9e9f8a128..aab1ae74a8f7 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -40,8 +40,10 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "gem/i915_gem_lmem.h"
+#include "gem/i915_gem_mman.h"
 
 #include "i915_drv.h"
 #include "intel_display_types.h"
@@ -119,6 +121,15 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return ret;
 }
 
+static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
+	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
+	struct drm_i915_gem_object *obj = to_intel_bo(bo);
+
+	return i915_gem_fb_mmap(obj, vma);
+}
+
 static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -130,6 +141,7 @@ static const struct fb_ops intelfb_ops = {
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
 	.fb_pan_display = intel_fbdev_pan_display,
 	.fb_blank = intel_fbdev_blank,
+	.fb_mmap = intel_fbdev_mmap,
 };
 
 static int intelfb_alloc(struct drm_fb_helper *helper,
-- 
2.39.0

