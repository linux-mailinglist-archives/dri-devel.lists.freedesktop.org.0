Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8986BD6E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 18:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC71110ED7A;
	Thu, 16 Mar 2023 17:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE6510E215;
 Thu, 16 Mar 2023 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678987357; x=1710523357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OeTkcfdBFKQwxpPiF1Z0wHOCaJStswRb41rkqkqtagg=;
 b=HIkCLoYn3DWN9f977l9KkIaRVfJHc+LiKg0Gy6ATYbN0daZda2K40CCb
 1afrOC6a8tK4EbIzvN22XVN0/thbXwGBHK9n+B0Q4s4sIQINbAMnDM6VJ
 f+z7QqISoQ0vU64aJ0l8CceP3r10VuE1SQNl6detVV8h75gKnciCwx05U
 NJl68NgQp2qxJZ+MT38q2YYaGnH5zKzOZXvVNm7hd30ufo/85km9irxpn
 f6+0V27Vb/r1wTb0A/P3XLjsrGS66JXQiCIUS8TnFp0P3e/gjpxQebM1f
 4AKh8ZNLcNwbOg6S5aivpgnAo4X4uTCF98wSv7/pNNc1TkiN75tJNoxd6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317713417"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="317713417"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 10:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="629980268"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="629980268"
Received: from nirmoyda-desk.igk.intel.com ([10.91.214.27])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 10:22:34 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm/i915/display: Implement fb_mmap callback function
Date: Thu, 16 Mar 2023 18:22:20 +0100
Message-Id: <20230316172220.16068-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230316172220.16068-1-nirmoy.das@intel.com>
References: <20230316172220.16068-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 673bcdfb7ff6..51d6fa034b00 100644
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
@@ -120,6 +122,16 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return ret;
 }
 
+#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)
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
@@ -131,6 +143,7 @@ static const struct fb_ops intelfb_ops = {
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
 	.fb_pan_display = intel_fbdev_pan_display,
 	.fb_blank = intel_fbdev_blank,
+	.fb_mmap = intel_fbdev_mmap,
 };
 
 static int intelfb_alloc(struct drm_fb_helper *helper,
-- 
2.39.0

