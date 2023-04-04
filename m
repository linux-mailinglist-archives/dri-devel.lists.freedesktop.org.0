Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D674F6D6561
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B220A10E6CE;
	Tue,  4 Apr 2023 14:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2897510E6CF;
 Tue,  4 Apr 2023 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680618732; x=1712154732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WKqygKWt8ctTo0xZ7kC1ll9vQP9VZ/o7OhKwqKls0LE=;
 b=IkHfN6jF5nc27phG4mWVMw0Im5uTl2tNwoMpJte8v87q5Pg3rG3d9VN6
 chvrK5oP/AQPDtW7QArsBkQLWW1zbufgcUkcSpD0TyYJmLDtJaObJ2pFe
 H4YsY2Fhhvf5y23nTm1LQ7Nfjj1CrUY/dKEgaNxDOriQCFJ6mPdEGYoKt
 mcdnqiIRd0a+VubK8xcJuGbZuW3tIW1HLCC73ERijFVucaxbCUQNCDzXb
 MHRMl9GYKpebf2HdVivskOYFreZ2JZAkR53haiQYgZkqFcAKC896Z4E4O
 s6GShSzhQ1mkZQvdb619LrNhZfit6+Xo6jhMtUrMlJbyM3u+4Ta1TtSb3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="404960862"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="404960862"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="688918173"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="688918173"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:14 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/display: Add helper func to get intel_fbdev from
 drm_fb_helper
Date: Tue,  4 Apr 2023 16:30:59 +0200
Message-Id: <20230404143100.10452-4-nirmoy.das@intel.com>
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

Add a helper function to retrieve struct intel_fbdev from
struct drm_fb_helper.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 23 ++++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index f7d48d00ae4b..2ac9e9f8a128 100644
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
@@ -194,8 +192,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
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

