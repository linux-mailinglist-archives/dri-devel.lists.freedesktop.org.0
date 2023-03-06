Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98266ABC9B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2087610E20E;
	Mon,  6 Mar 2023 10:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2468810E1EB;
 Mon,  6 Mar 2023 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678098540; x=1709634540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o98yHmZBDxX8kIzndpSRhxsC3uJh1+fVE9iG80yOceU=;
 b=hMiJ3l9LWzLVKbEcbHs8SPuMaQVZgGNBL5QT7tbs3UZ7+R9gDDoYZv0c
 S8YzBU99zmXeKUTVOnm2LGm5BXpCrFdDBhVhLpfJRMnKPz2+SeiNLed2F
 Zx49JkI1QTKw9rSu+sgpg64emuJrRE4lB1PgC/0z5inAJkBTc8NmDFlcn
 2rXSz1TpFGTpiUck4wvsQr3NIoaK75z8thVzUkLIid5ruoEmcY6tKF8BJ
 o41J7YfkEmXR19Om+JudzcMYLnG0QggcRoNUIh6wIFT5cr4iq640dOBLz
 qGH/me1nLNY3goIUk1dS8HbEwJOStj4MNV++5kw97R07mrTJ7hWR9z/vv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="332995600"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="332995600"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 02:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="676119856"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="676119856"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 02:28:58 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap callback function
Date: Mon,  6 Mar 2023 11:28:50 +0100
Message-Id: <20230306102850.18299-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230306102850.18299-1-nirmoy.das@intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If stolen memory allocation fails for fbdev, the driver will
fallback to system memory. Calculation of smem_start is wrong
for such framebuffer objs if the platform comes with no gmadr or
no aperture. Solve this by adding fb_mmap callback which also gives
driver more control.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 98ae3a3a986a..ed0f9e2af3ed 100644
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
@@ -120,6 +122,23 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return ret;
 }
 
+#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)
+static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
+	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
+	struct drm_i915_gem_object *obj = to_intel_bo(bo);
+	struct drm_device *dev = fbdev->helper.dev;
+
+	vma->vm_page_prot =
+			pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+
+	if (obj->stolen)
+		return vm_iomap_memory(vma, info->fix.smem_start,
+				       info->fix.smem_len);
+
+	return i915_gem_object_mmap(obj, vma);
+}
 static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -131,6 +150,7 @@ static const struct fb_ops intelfb_ops = {
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
 	.fb_pan_display = intel_fbdev_pan_display,
 	.fb_blank = intel_fbdev_blank,
+	.fb_mmap = intel_fbdev_mmap,
 };
 
 static int intelfb_alloc(struct drm_fb_helper *helper,
-- 
2.39.0

