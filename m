Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FBC6C0E46
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039110E321;
	Mon, 20 Mar 2023 10:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FAF10E2CF;
 Mon, 20 Mar 2023 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679306954; x=1710842954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ddRq29PaTIL7FjCntXXv6jIuk7QT+oOPLrBZAgQWUHw=;
 b=OmPu79UdCMiQAwcuUdF17G2A8Aln8cS3Yq5dyzz0ZSMrxeRD9NJZ/w5b
 DNGwmZsinrWLmwAXhCZg1BoTDvdq3eboiO9yZAfJUTQn+3x3AYmQTuw7S
 KsCjbAbQ7WPWSYBCpuqcz6D2ZnFyvY9jlRzQWcmgEHtIJ1nNhR+nu8/4z
 6Q3ohbu5DwgVSEUkSBncI2lTufOQDIyTWe9gbiH7oGCmZSaYx+E4k+pTi
 aJ1O9b3ENwd4EMwk2V1ZKz/CClgmX2Ko8rthZHsMGJwwlkMJKurqg94+v
 67yDU2CjczxBu+v24Y0/OH1PXcJn0oNgusfce3QFiqy+D5zojhiLO+KGq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="338647854"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="338647854"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="791560724"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="791560724"
Received: from nirmoyda-desk.igk.intel.com ([10.91.214.27])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:09:12 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/display: Add helper func to get intel_fbdev from
 drm_fb_helper
Date: Mon, 20 Mar 2023 11:09:02 +0100
Message-Id: <20230320100903.23588-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230320100903.23588-1-nirmoy.das@intel.com>
References: <20230320100903.23588-1-nirmoy.das@intel.com>
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

Add a helper function to retrieve struct intel_fbdev from
struct drm_fb_helper.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 23 ++++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 673bcdfb7ff6..8c3b3c3fd0e0 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -67,6 +67,11 @@ struct intel_fbdev {
 	struct mutex hpd_lock;
 };
 
+static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
+{
+	return container_of(fb_helper, struct intel_fbdev, helper);
+}
+
 static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
 {
 	return ifbdev->fb->frontbuffer;
@@ -79,9 +84,7 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
 
 static int intel_fbdev_set_par(struct fb_info *info)
 {
-	struct drm_fb_helper *fb_helper = info->par;
-	struct intel_fbdev *ifbdev =
-		container_of(fb_helper, struct intel_fbdev, helper);
+	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
 	int ret;
 
 	ret = drm_fb_helper_set_par(info);
@@ -93,9 +96,7 @@ static int intel_fbdev_set_par(struct fb_info *info)
 
 static int intel_fbdev_blank(int blank, struct fb_info *info)
 {
-	struct drm_fb_helper *fb_helper = info->par;
-	struct intel_fbdev *ifbdev =
-		container_of(fb_helper, struct intel_fbdev, helper);
+	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
 	int ret;
 
 	ret = drm_fb_helper_blank(blank, info);
@@ -108,9 +109,7 @@ static int intel_fbdev_blank(int blank, struct fb_info *info)
 static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 				   struct fb_info *info)
 {
-	struct drm_fb_helper *fb_helper = info->par;
-	struct intel_fbdev *ifbdev =
-		container_of(fb_helper, struct intel_fbdev, helper);
+	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
 	int ret;
 
 	ret = drm_fb_helper_pan_display(var, info);
@@ -136,8 +135,7 @@ static const struct fb_ops intelfb_ops = {
 static int intelfb_alloc(struct drm_fb_helper *helper,
 			 struct drm_fb_helper_surface_size *sizes)
 {
-	struct intel_fbdev *ifbdev =
-		container_of(helper, struct intel_fbdev, helper);
+	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
 	struct drm_framebuffer *fb;
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -193,8 +191,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 static int intelfb_create(struct drm_fb_helper *helper,
 			  struct drm_fb_helper_surface_size *sizes)
 {
-	struct intel_fbdev *ifbdev =
-		container_of(helper, struct intel_fbdev, helper);
+	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
 	struct intel_framebuffer *intel_fb = ifbdev->fb;
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-- 
2.39.0

