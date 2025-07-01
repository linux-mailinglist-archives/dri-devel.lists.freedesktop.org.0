Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A0AEF295
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B178E10E54F;
	Tue,  1 Jul 2025 09:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPazR7JX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619A10E54F;
 Tue,  1 Jul 2025 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360894; x=1782896894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HQmSWkEeXTcFkCtiUYLwXY0kVrT95NQjeZ1rtQEPyhA=;
 b=LPazR7JXo2zTcbN9SgpnxcpCntRI7LeQzuve4eJEu8ITDG/BYSF6BnjI
 QU23NkWIXOdBpbxblm+caC7bz2WoRh0m0Ub5x9uRWDbFoNfI1Z0A7Fn8g
 ii09wsUUzhik5KOkvNw4aUKQW2kteeqTSZeL5SR7TcyKlU4RE/Sa7cOL7
 hYz+Abb2FFZ6TKBye7jj4OE6i5+p7DY5XXx0d/jmoZ32uoC0/umrolksO
 QC9KFJaSg2gF2NBjpK+ofsg/iZfIXT00EmaY4Fs0OvpGcyDwT7LDpfZbl
 Lw97Yl8oZmWrv3XPPqUd8EO2sfac9/mkMeMrZze8kDXlxf/9JDgj3vmCC Q==;
X-CSE-ConnectionGUID: Pn7GQM/LQbSTNDrjNXKyTg==
X-CSE-MsgGUID: IwVgtFu2Q9mMKFqJhW5/xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218441"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218441"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:14 -0700
X-CSE-ConnectionGUID: V4sUdgKZTWSDQtc3NDzrLQ==
X-CSE-MsgGUID: +dpd0Kp+T+Gcl9YZB9RprQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427072"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 06/19] drm/malidp: Pass along the format info from
 .fb_create() malidp_verify_afbc_framebuffer_size()
Date: Tue,  1 Jul 2025 12:07:09 +0300
Message-ID: <20250701090722.13645-7-ville.syrjala@linux.intel.com>
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
malidp_verify_afbc_framebuffer_size() to avoid the
redundant lookup.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 8b920566f2e8..bc5f5e9798c3 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -306,10 +306,10 @@ malidp_verify_afbc_framebuffer_caps(struct drm_device *dev,
 static bool
 malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
 				    struct drm_file *file,
+				    const struct drm_format_info *info,
 				    const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	int n_superblocks = 0;
-	const struct drm_format_info *info;
 	struct drm_gem_object *objs = NULL;
 	u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
 	u32 afbc_superblock_width = 0, afbc_size = 0;
@@ -325,9 +325,6 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
 		return false;
 	}
 
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-
 	n_superblocks = (mode_cmd->width / afbc_superblock_width) *
 		(mode_cmd->height / afbc_superblock_height);
 
@@ -367,10 +364,11 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
 
 static bool
 malidp_verify_afbc_framebuffer(struct drm_device *dev, struct drm_file *file,
+			       const struct drm_format_info *info,
 			       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	if (malidp_verify_afbc_framebuffer_caps(dev, mode_cmd))
-		return malidp_verify_afbc_framebuffer_size(dev, file, mode_cmd);
+		return malidp_verify_afbc_framebuffer_size(dev, file, info, mode_cmd);
 
 	return false;
 }
@@ -381,7 +379,7 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	if (mode_cmd->modifier[0]) {
-		if (!malidp_verify_afbc_framebuffer(dev, file, mode_cmd))
+		if (!malidp_verify_afbc_framebuffer(dev, file, info, mode_cmd))
 			return ERR_PTR(-EINVAL);
 	}
 
-- 
2.49.0

