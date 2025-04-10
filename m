Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EBEA849EE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F95510EA33;
	Thu, 10 Apr 2025 16:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jL9nampm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBB910EA33;
 Thu, 10 Apr 2025 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302798; x=1775838798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tN8FLJpCJ2lOtxhelUmJm4/Ob6nHK2CI/3jpGng3wSM=;
 b=jL9nampmKsP/IULjQm4wqL6raf5wDz5uNokpIdSnduv5yWbRFhdVmwag
 5/KCuZWJvZusH7KzIGLS3Eh9UxUbSztA88eJi4UEkhOK7hS9Zf0gM/50I
 s2U1jiV9ACOxKPrtY9uhv2L7VUn/UiBBnM1r6edQ6o4FrXo51pITSARvD
 sUhTL+fftHD8BvO27UHqnuedJ+3DsLLi6nmLwUhD6IHDXY1wo9kq/SOYj
 diFUOLKCBMtiDRIeVNSdPTpvNpiUsOzXFwQ2D6INZ72++uZ2ERIqXGKig
 YfUHViWb3mj+kblXxdz4Uxyqkw5fAUnKgIjw9NiCUsFIvALkuLjPDvv3w A==;
X-CSE-ConnectionGUID: djYJPoMfSFWCJ9oPPAnn2Q==
X-CSE-MsgGUID: w1e/WUwdR5mcmyuXbfIJ2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220079"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220079"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:18 -0700
X-CSE-ConnectionGUID: 8Qt9bjqDSFmpXQz3QAkh7g==
X-CSE-MsgGUID: SO5BAB0LRD2I5gMwvZqOyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129274"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 08/19] drm/gem/afbc: Eliminate redundant drm_get_format_info()
Date: Thu, 10 Apr 2025 19:32:07 +0300
Message-ID: <20250410163218.15130-9-ville.syrjala@linux.intel.com>
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

Pass along the format info from .fb_create() to aliminate the
redundant drm_get_format_info() calls from the afbc code.

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 18 ++++++------------
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c   |  2 +-
 include/drm/drm_gem_framebuffer_helper.h     |  1 +
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 44016915c8fe..f243ea930033 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -495,13 +495,9 @@ EXPORT_SYMBOL(drm_gem_fb_end_cpu_access);
 // TODO Drop this function and replace by drm_format_info_bpp() once all
 // DRM_FORMAT_* provide proper block info in drivers/gpu/drm/drm_fourcc.c
 static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
+				  const struct drm_format_info *info,
 				  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	const struct drm_format_info *info;
-
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-
 	switch (info->format) {
 	case DRM_FORMAT_YUV420_8BIT:
 		return 12;
@@ -515,6 +511,7 @@ static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
 }
 
 static int drm_gem_afbc_min_size(struct drm_device *dev,
+				 const struct drm_format_info *info,
 				 const struct drm_mode_fb_cmd2 *mode_cmd,
 				 struct drm_afbc_framebuffer *afbc_fb)
 {
@@ -555,7 +552,7 @@ static int drm_gem_afbc_min_size(struct drm_device *dev,
 	afbc_fb->aligned_height = ALIGN(mode_cmd->height, h_alignment);
 	afbc_fb->offset = mode_cmd->offsets[0];
 
-	bpp = drm_gem_afbc_get_bpp(dev, mode_cmd);
+	bpp = drm_gem_afbc_get_bpp(dev, info, mode_cmd);
 	if (!bpp) {
 		drm_dbg_kms(dev, "Invalid AFBC bpp value: %d\n", bpp);
 		return -EINVAL;
@@ -577,6 +574,7 @@ static int drm_gem_afbc_min_size(struct drm_device *dev,
  *
  * @dev: DRM device
  * @afbc_fb: afbc-specific framebuffer
+ * @info: pixel format information
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  * @afbc_fb: afbc framebuffer
  *
@@ -590,20 +588,16 @@ static int drm_gem_afbc_min_size(struct drm_device *dev,
  * Zero on success or a negative error value on failure.
  */
 int drm_gem_fb_afbc_init(struct drm_device *dev,
+			 const struct drm_format_info *info,
 			 const struct drm_mode_fb_cmd2 *mode_cmd,
 			 struct drm_afbc_framebuffer *afbc_fb)
 {
-	const struct drm_format_info *info;
 	struct drm_gem_object **objs;
 	int ret;
 
 	objs = afbc_fb->base.obj;
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-	if (!info)
-		return -EINVAL;
 
-	ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
+	ret = drm_gem_afbc_min_size(dev, info, mode_cmd, afbc_fb);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index 1211ca0ffa00..2a6207b7f61e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -51,7 +51,7 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	if (drm_is_afbc(mode_cmd->modifier[0])) {
 		int ret, i;
 
-		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);
+		ret = drm_gem_fb_afbc_init(dev, info, mode_cmd, afbc_fb);
 		if (ret) {
 			struct drm_gem_object **obj = afbc_fb->base.obj;
 
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 971d266ab1ba..24f1fd40d553 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -52,6 +52,7 @@ void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_directi
 	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))
 
 int drm_gem_fb_afbc_init(struct drm_device *dev,
+			 const struct drm_format_info *info,
 			 const struct drm_mode_fb_cmd2 *mode_cmd,
 			 struct drm_afbc_framebuffer *afbc_fb);
 
-- 
2.49.0

