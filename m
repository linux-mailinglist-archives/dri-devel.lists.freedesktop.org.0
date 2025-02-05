Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F04A28843
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 11:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35D210E778;
	Wed,  5 Feb 2025 10:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZtZwOl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88CD10E776;
 Wed,  5 Feb 2025 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738752121; x=1770288121;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YUOGMVHE1L42kt3LyqceEq2RL9qn/sSbwMVUIHbPsIQ=;
 b=XZtZwOl1USfKaPUwvRDbraGm+d0kajTQtLctw+9aq7svXkgXlYjb9okw
 IAJJrWaJctlsgt8QLDxfmwkox9EMbwj0aSzTLsCWegXzrm3Ckrolig2L9
 JYjARsO7FrbShzBaiphC9KErXtBYlBqD8yNRTvAtnQ5kodXLhe4ch9A2o
 SzCxSw6N5pft1EYRKG1KimRmK73N4enpdgajAC8bzZUaPIIkca3UF+6AH
 ex6zkdFMTKT3fq0Na8OYQnKodZnTXdZSJOLJklxqHTKsylHpNx8WZ5P/o
 P/UkVkI28wyWtrlmCR8aPNzDOTY2mSIwpl+rNpiHyVRo/IXhmMYqd/b9V A==;
X-CSE-ConnectionGUID: WGaaTRm9TH6+rlV56DNvBA==
X-CSE-MsgGUID: M2eoRjSaSue3l6sREyLYIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38544816"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="38544816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:42:00 -0800
X-CSE-ConnectionGUID: Vhsae9ZZSn6LuczpU6Y4mg==
X-CSE-MsgGUID: MjPskYC2SLC2HQ0piX4xBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114938027"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2025 02:41:59 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 05 Feb 2025 15:57:18 +0530
Subject: [PATCH v4 2/3] drm/plane: modify create_in_formats to accommodate
 async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-asyn-v4-2-9a5b018e359b@intel.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
In-Reply-To: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

create_in_formats creates the list of supported format/modifiers for
synchronous flips, modify the same function so as to take the
format_mod_supported as argument and create list of format/modifier for
async as well.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..3819fdde985576bd6ba6a08ceb64613bd5e0a663 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -191,7 +191,11 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
 	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
 }
 
-static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
+static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane,
+				 bool (*format_mod_supported)
+						(struct drm_plane *plane,
+						 uint32_t format,
+						 uint64_t modifier))
 {
 	const struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property_blob *blob;
@@ -235,10 +239,10 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	mod = modifiers_ptr(blob_data);
 	for (i = 0; i < plane->modifier_count; i++) {
 		for (j = 0; j < plane->format_count; j++) {
-			if (!plane->funcs->format_mod_supported ||
-			    plane->funcs->format_mod_supported(plane,
-							       plane->format_types[j],
-							       plane->modifiers[i])) {
+			if (!format_mod_supported || format_mod_supported
+							(plane,
+							 plane->format_types[j],
+							 plane->modifiers[i])) {
 				mod->formats |= 1ULL << j;
 			}
 		}
@@ -249,10 +253,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 		mod++;
 	}
 
-	drm_object_attach_property(&plane->base, config->modifiers_property,
-				   blob->base.id);
-
-	return 0;
+	return blob->base.id;
 }
 
 /**
@@ -369,6 +370,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	};
 	unsigned int format_modifier_count = 0;
 	int ret;
+	int blob_id;
 
 	/* plane index is used with 32bit bitmasks */
 	if (WARN_ON(config->num_total_plane >= 32))
@@ -475,8 +477,24 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_plane_create_hotspot_properties(plane);
 	}
 
-	if (format_modifier_count)
-		create_in_format_blob(dev, plane);
+	if (format_modifier_count) {
+		blob_id = create_in_format_blob(dev, plane,
+						plane->funcs->format_mod_supported);
+		if (blob_id)
+			drm_object_attach_property(&plane->base,
+						   config->modifiers_property,
+						   blob_id);
+	}
+
+	if (plane->funcs->format_mod_supported_async) {
+		blob_id = create_in_format_blob(dev, plane,
+						plane->funcs->format_mod_supported_async);
+		if (blob_id)
+			drm_object_attach_property(&plane->base,
+						   config->async_modifiers_property,
+						   blob_id);
+	}
+
 
 	return 0;
 }

-- 
2.25.1

