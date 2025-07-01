Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC893AEF2A7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B550010E56B;
	Tue,  1 Jul 2025 09:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRX18Cyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E040C10E56B;
 Tue,  1 Jul 2025 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360921; x=1782896921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=199GVHb1c1ee5+FIsNAM1SxiCnm1JKkdgE9hqm1RzW4=;
 b=mRX18Cyniv68wXBHy4eWgBK7In/ftARr3RTDxa77hjT6nbVzKscX3Nlh
 sfJBUpmuYaZNiMOOleTd8+C7mIpz2QqGOMNpFJcmki9Wbv5X2a/tAmQrZ
 RH+bKR8WrDlFVL9BrV8hH/0rO0TFmxzYsKUUNhxXEa5rO3IKkUtL54L3v
 BiN4UDXvbHDhemxhXagTllMOqTJXIShgpdrjnZGpzt7L9MOyDGvYtPeka
 7d8rzTJG05bHkIQan8JaEGj/OEGssyS4AOpxRzzOlMgW7kVDomsOPhDTp
 HlV0CXJC8g9uX6gkz75gmUoBL2WSOW3DNm1axvcLvRLJZ9HPRSA+OGl0R w==;
X-CSE-ConnectionGUID: OzjeHpCrSQeppXSQocZsrA==
X-CSE-MsgGUID: yawF96ipQVmcP3oJSq9mgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218533"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:41 -0700
X-CSE-ConnectionGUID: 8cIpgEWYRv2u94x6YgSM7Q==
X-CSE-MsgGUID: jCe6A4a6RoebE5zE7GbaNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427223"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 12/19] drm/gma500: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:15 +0300
Message-ID: <20250701090722.13645-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

