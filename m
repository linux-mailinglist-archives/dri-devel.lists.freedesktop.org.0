Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FBA86670
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 21:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E147010EC81;
	Fri, 11 Apr 2025 19:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFJy+Usk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9531F10EC7D;
 Fri, 11 Apr 2025 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744399899; x=1775935899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w+Vjmub2xScVHRka08R5XNRGsi6pot7a0OypMzMixXU=;
 b=aFJy+UskGStKVbGmC6SetzuPhJ2RCz7vyV3DTLp9sFN33h36vhX04G0J
 7e6BfvGtkbdxyzSnmlXsiqNhwUcw3ZW5jRiDwpEyGiXxDeFKlD9wgvCOa
 3mfYzjv9r4nwY1I64hTLYDrOQXVw+1oqwqzrcS1YsBKTK7TFUqb2LUUQH
 2p4gSlW2qKMAopPYDGpxF/e8c7sAS+On6uNzfzocZvDRaynWn/lnmAVv3
 1pfP315VTmU+BwIzYqWycn6R2jbI1k72Dvbg1Pv8fdWUDpcAkHDKcsxT0
 DiRgeX60E2wigjfAB1SuNAVqap0QCnMS7ebHwPlaIP0M3nj0SToDO9rPV g==;
X-CSE-ConnectionGUID: 4vY82TL/QJW2L6y39kv5FQ==
X-CSE-MsgGUID: OtxSkWd4QUCXWZCYMUikZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="68451355"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="68451355"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 12:31:38 -0700
X-CSE-ConnectionGUID: hduMWZDBQryhLazq22oIUw==
X-CSE-MsgGUID: +HM9mSdRR6GnAhQCKx1Lng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="134435651"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 11 Apr 2025 12:31:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Apr 2025 22:31:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 07/19] drm/gem: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Fri, 11 Apr 2025 22:31:32 +0300
Message-ID: <20250411193132.9835-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-8-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-8-ville.syrjala@linux.intel.com>
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

Pass along the format info from .fb_create() to aliminate the
redundant drm_get_format_info() calls from the gem fb code.

v2: Fix kernel docs (Laurent)

Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: virtualization@lists.linux.dev
Cc: spice-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 23 +++++++++-----------
 drivers/gpu/drm/qxl/qxl_display.c            |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c   |  3 ++-
 drivers/gpu/drm/xen/xen_drm_front_kms.c      |  2 +-
 include/drm/drm_gem_framebuffer_helper.h     |  2 ++
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 2533655b3984..c526abcaa864 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -67,6 +67,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
 static int
 drm_gem_fb_init(struct drm_device *dev,
 		 struct drm_framebuffer *fb,
+		 const struct drm_format_info *info,
 		 const struct drm_mode_fb_cmd2 *mode_cmd,
 		 struct drm_gem_object **obj, unsigned int num_planes,
 		 const struct drm_framebuffer_funcs *funcs)
@@ -74,7 +75,7 @@ drm_gem_fb_init(struct drm_device *dev,
 	unsigned int i;
 	int ret;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
 	for (i = 0; i < num_planes; i++)
 		fb->obj[i] = obj[i];
@@ -135,6 +136,7 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
  * @dev: DRM device
  * @fb: framebuffer object
  * @file: DRM file that holds the GEM handle(s) backing the framebuffer
+ * @info: pixel format information
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  * @funcs: vtable to be used for the new framebuffer object
  *
@@ -151,21 +153,14 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
 int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			       struct drm_framebuffer *fb,
 			       struct drm_file *file,
+			       const struct drm_format_info *info,
 			       const struct drm_mode_fb_cmd2 *mode_cmd,
 			       const struct drm_framebuffer_funcs *funcs)
 {
-	const struct drm_format_info *info;
 	struct drm_gem_object *objs[DRM_FORMAT_MAX_PLANES];
 	unsigned int i;
 	int ret;
 
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-	if (!info) {
-		drm_dbg_kms(dev, "Failed to get FB format info\n");
-		return -EINVAL;
-	}
-
 	if (drm_drv_uses_atomic_modeset(dev) &&
 	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
 				      mode_cmd->modifier[0])) {
@@ -200,7 +195,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 		}
 	}
 
-	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
+	ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
 	if (ret)
 		goto err_gem_object_put;
 
@@ -221,6 +216,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
  *                                  callback
  * @dev: DRM device
  * @file: DRM file that holds the GEM handle(s) backing the framebuffer
+ * @info: pixel format information
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  * @funcs: vtable to be used for the new framebuffer object
  *
@@ -233,6 +229,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
  */
 struct drm_framebuffer *
 drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
+			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *mode_cmd,
 			     const struct drm_framebuffer_funcs *funcs)
 {
@@ -243,7 +240,7 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
+	ret = drm_gem_fb_init_with_funcs(dev, fb, file, info, mode_cmd, funcs);
 	if (ret) {
 		kfree(fb);
 		return ERR_PTR(ret);
@@ -286,7 +283,7 @@ drm_gem_fb_create(struct drm_device *dev, struct drm_file *file,
 		  const struct drm_format_info *info,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
+	return drm_gem_fb_create_with_funcs(dev, file, info, mode_cmd,
 					    &drm_gem_fb_funcs);
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create);
@@ -326,7 +323,7 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
+	return drm_gem_fb_create_with_funcs(dev, file, info, mode_cmd,
 					    &drm_gem_fb_funcs_dirtyfb);
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index f7bc83f2d489..ae7e572b1b4a 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1179,7 +1179,7 @@ qxl_user_framebuffer_create(struct drm_device *dev,
 			    const struct drm_format_info *info,
 			    const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	return drm_gem_fb_create_with_funcs(dev, file_priv, mode_cmd,
+	return drm_gem_fb_create_with_funcs(dev, file_priv, info, mode_cmd,
 					    &qxl_fb_funcs);
 }
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index d46297bec5f8..1211ca0ffa00 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -40,7 +40,8 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	if (!afbc_fb)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_gem_fb_init_with_funcs(dev, &afbc_fb->base, file, mode_cmd,
+	ret = drm_gem_fb_init_with_funcs(dev, &afbc_fb->base,
+					 file, info, mode_cmd,
 					 &rockchip_drm_fb_funcs);
 	if (ret) {
 		kfree(afbc_fb);
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index a360003bee47..806ec66ee7f7 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -62,7 +62,7 @@ fb_create(struct drm_device *dev, struct drm_file *filp,
 	struct drm_gem_object *gem_obj;
 	int ret;
 
-	fb = drm_gem_fb_create_with_funcs(dev, filp, mode_cmd, &fb_funcs);
+	fb = drm_gem_fb_create_with_funcs(dev, filp, info, mode_cmd, &fb_funcs);
 	if (IS_ERR(fb))
 		return fb;
 
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 4fdf9d3d1863..971d266ab1ba 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -25,10 +25,12 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
 int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			       struct drm_framebuffer *fb,
 			       struct drm_file *file,
+			       const struct drm_format_info *info,
 			       const struct drm_mode_fb_cmd2 *mode_cmd,
 			       const struct drm_framebuffer_funcs *funcs);
 struct drm_framebuffer *
 drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
+			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *mode_cmd,
 			     const struct drm_framebuffer_funcs *funcs);
 struct drm_framebuffer *
-- 
2.49.0

