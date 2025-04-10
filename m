Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF0A849FA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33E710EA36;
	Thu, 10 Apr 2025 16:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGcZINRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF1110EA3A;
 Thu, 10 Apr 2025 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302813; x=1775838813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qMXxTBrdwvvlGaGUGPTZ4iX7l5UqdxDx3f215qp4RfI=;
 b=KGcZINRxunpje4ExDNOGKJ/iUmq/BPoFYfELhAkmBNq25CNPGAJ3CVN1
 GNQWMBXziKyRL0YyA6Ztgn4wjUwDeuo+RJOmJmuRszxsw2HAJ9fB/S8K6
 3CzDXIVoIY9QzNdP+wUdnZPfexvjn9HXcikZPiPx2XAwmZNEM6Xpw2LCw
 pzqucco9yl/vQmCjdWiLvFegnp0hAMaWdapDJQm2roBgEySZwVDkMhWUf
 Qdm8IIZu5rD2k7PpG+1q5gscxD0FHxKbKD9syaiOcTZjXqAMjpWGaxJSw
 Ey+vyzzqMkhB+fquvxBcih+ydwqNzcEX+MkhFBpV34bYSWFAttfAGJ82a A==;
X-CSE-ConnectionGUID: 6F1VEUkqSYipX3ecxggK7A==
X-CSE-MsgGUID: tThvtu0/RamrFl74EQR7Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220104"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220104"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:33 -0700
X-CSE-ConnectionGUID: 3tQb4RMFS2eMPdfWHRrO8w==
X-CSE-MsgGUID: 5D6pe+jdRdiib7SELebwQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129358"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 12/19] drm/gma500: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:11 +0300
Message-ID: <20250410163218.15130-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/gma500/fbdev.c       |  5 ++++-
 drivers/gpu/drm/gma500/framebuffer.c | 14 +++++++-------
 drivers/gpu/drm/gma500/psb_drv.h     |  1 +
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 8edefea2ef59..d32689cb0e23 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -203,7 +203,10 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 		return PTR_ERR(backing);
 	obj = &backing->base;
 
-	fb = psb_framebuffer_create(dev, &mode_cmd, obj);
+	fb = psb_framebuffer_create(dev,
+				    drm_get_format_info(dev, mode_cmd.pixel_format,
+							mode_cmd.modifier[0]),
+				    &mode_cmd, obj);
 	if (IS_ERR(fb)) {
 		ret = PTR_ERR(fb);
 		goto err_drm_gem_object_put;
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index f9ade8361354..e69b537ded6b 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -29,25 +29,23 @@ static const struct drm_framebuffer_funcs psb_fb_funcs = {
  */
 static int psb_framebuffer_init(struct drm_device *dev,
 					struct drm_framebuffer *fb,
+					const struct drm_format_info *info,
 					const struct drm_mode_fb_cmd2 *mode_cmd,
 					struct drm_gem_object *obj)
 {
-	const struct drm_format_info *info;
 	int ret;
 
 	/*
 	 * Reject unknown formats, YUV formats, and formats with more than
 	 * 4 bytes per pixel.
 	 */
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-	if (!info || !info->depth || info->cpp[0] > 4)
+	if (!info->depth || info->cpp[0] > 4)
 		return -EINVAL;
 
 	if (mode_cmd->pitches[0] & 63)
 		return -EINVAL;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 	fb->obj[0] = obj;
 	ret = drm_framebuffer_init(dev, fb, &psb_fb_funcs);
 	if (ret) {
@@ -60,6 +58,7 @@ static int psb_framebuffer_init(struct drm_device *dev,
 /**
  *	psb_framebuffer_create	-	create a framebuffer backed by gt
  *	@dev: our DRM device
+ *	@info: pixel format information
  *	@mode_cmd: the description of the requested mode
  *	@obj: the backing object
  *
@@ -69,6 +68,7 @@ static int psb_framebuffer_init(struct drm_device *dev,
  *	TODO: review object references
  */
 struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
+					       const struct drm_format_info *info,
 					       const struct drm_mode_fb_cmd2 *mode_cmd,
 					       struct drm_gem_object *obj)
 {
@@ -79,7 +79,7 @@ struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
-	ret = psb_framebuffer_init(dev, fb, mode_cmd, obj);
+	ret = psb_framebuffer_init(dev, fb, info, mode_cmd, obj);
 	if (ret) {
 		kfree(fb);
 		return ERR_PTR(ret);
@@ -112,7 +112,7 @@ static struct drm_framebuffer *psb_user_framebuffer_create
 		return ERR_PTR(-ENOENT);
 
 	/* Let the core code do all the work */
-	fb = psb_framebuffer_create(dev, cmd, obj);
+	fb = psb_framebuffer_create(dev, info, cmd, obj);
 	if (IS_ERR(fb))
 		drm_gem_object_put(obj);
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 7f77cb2b2751..0b27112ec46f 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -594,6 +594,7 @@ extern void psb_modeset_cleanup(struct drm_device *dev);
 
 /* framebuffer */
 struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
+					       const struct drm_format_info *info,
 					       const struct drm_mode_fb_cmd2 *mode_cmd,
 					       struct drm_gem_object *obj);
 
-- 
2.49.0

