Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E5AA849E6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6794C10EA22;
	Thu, 10 Apr 2025 16:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9pa4AYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BF910EA0D;
 Thu, 10 Apr 2025 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302789; x=1775838789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MqssvVmnoMMJ4rsdR5QV6lZJYKn6x4bUXf1g9XlXGLM=;
 b=X9pa4AYSE4bYjR3taD4SLgYFf9CmEfZQlAfxl3EijDmaTgMvDNLPKEkO
 ZpMYRGejCNZ0EI/cQLN1OLK2B9H8lKROzZk6Hyt6z6FVSZLk7DKqC1gMm
 kNoUQKAEZw8IHdeFkRZNniVvWog7uLyXjwqmyho+TMo4qhRkp2HPgCJl9
 aZslELnKFXKHwOU4uy0mJ9ANfNEUTkIax9BrXBHsYMiGS9D7FLDruvgXb
 4BsCosAE3Chw275gL2wOy5UCXUYgzhh35fflcjx+zpC/VFyU15cDLCFld
 C35mb0HbTqv9eQjpSOY/G2WcG4UhZ75lm8qK0+l1kWQ52jZJ+GyLaZ6Jj Q==;
X-CSE-ConnectionGUID: MUcbxzkFTmOU5bCu8kEmVQ==
X-CSE-MsgGUID: 1HQpSHPjTxOHmzKUq7VkAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220067"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:09 -0700
X-CSE-ConnectionGUID: 74M2c9aTSEqRwnD+V9diLw==
X-CSE-MsgGUID: a6l3O8DTTEKeEP0PUztQQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129183"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 06/19] drm/malidp: Pass along the format info from
 .fb_create() malidp_verify_afbc_framebuffer_size()
Date: Thu, 10 Apr 2025 19:32:05 +0300
Message-ID: <20250410163218.15130-7-ville.syrjala@linux.intel.com>
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
malidp_verify_afbc_framebuffer_size() to avoid the
redundant lookup.

Cc: Liviu Dudau <liviu.dudau@arm.com>
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

