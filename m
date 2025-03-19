Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F6A689EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 11:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066C610E378;
	Wed, 19 Mar 2025 10:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfKEzxgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADBB10E346;
 Wed, 19 Mar 2025 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742381220; x=1773917220;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=OgTeSU/TT1SoBn1w7IH1aUFVuGzIwHDnaC5191LrPFg=;
 b=BfKEzxgo8dB1FahJD7/Hzz/kn7ko3lZNDFl1keKeo7ZBx9Q92QeQDMkH
 1BkTmO3nmgZZ7hoTYqq+SXI0N6Ny3Ox4RJDUiYK6E+Z2kxEYlhMcf5FN0
 ZR3Y+xqrILAOELgjW0UBXIFwt6+m8dH5nlFBh8MKo1QUIOPbL+VzmXoy5
 CwBL18oXJzvDs8KP64mYc7OYwBHfQUptrCBUSh/iXK2oKO8SY5sHPWFvs
 xaz7H6CqOeQrM1q2k+ZbeKizzn1/0Sexkpn7LuP0PGdcQmi+pPr9x4yoi
 lv0UjRPGdGGMR2ohRa31m7mBxQcrTUugFrrSGI4APC2CmyEHNbxIH+Dof w==;
X-CSE-ConnectionGUID: i7yoRzkASD2gcWwkT4MMKA==
X-CSE-MsgGUID: MH/rB0XdSI298fV5BFyrMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43733950"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43733950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 03:47:00 -0700
X-CSE-ConnectionGUID: ptAKfv9BQPurMYhaRJGTYg==
X-CSE-MsgGUID: HmsqVmmKSRKUUb9gsqNqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="153585824"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2025 03:46:58 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 19 Mar 2025 16:02:16 +0530
Subject: [PATCH v9 2/3] drm/plane: modify create_in_formats to accommodate
 async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-asyn-v9-2-629d1ece63e7@intel.com>
References: <20250319-asyn-v9-0-629d1ece63e7@intel.com>
In-Reply-To: <20250319-asyn-v9-0-629d1ece63e7@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, Arun R Murthy <arun.r.murthy@intel.com>, 
 Naveen Kumar <naveen1.kumar@intel.com>
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

v5: create_in_formats can return -ve value in failure case, correct the
if condition to check the creation of blob <Chaitanya>
Dont add the modifier for which none of the formats is not supported.
v6: Remove the code for masking the unsupported modifiers as UMD can
leave with it. (Naveen/Chaitanya)
v7: Retain the unsupported modifiers, userspace should have no
impact, return pointer to blob instead of blob_id(Ville)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index fe181c1002171acc68d3054c2d178f9b9f501fe2..5cd3956caf414fa72432f9d23fa289ec266408ce 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -193,9 +193,13 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
 	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
 }
 
-static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
+static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
+						       struct drm_plane *plane,
+						       bool (*format_mod_supported)
+						       (struct drm_plane *plane,
+							u32 format,
+							u64 modifier))
 {
-	const struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property_blob *blob;
 	struct drm_format_modifier *mod;
 	size_t blob_size, formats_size, modifiers_size;
@@ -221,7 +225,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 
 	blob = drm_property_create_blob(dev, blob_size, NULL);
 	if (IS_ERR(blob))
-		return -1;
+		return PTR_ERR(blob);
 
 	blob_data = blob->data;
 	blob_data->version = FORMAT_BLOB_CURRENT;
@@ -237,10 +241,10 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	mod = modifiers_ptr(blob_data);
 	for (i = 0; i < plane->modifier_count; i++) {
 		for (j = 0; j < plane->format_count; j++) {
-			if (!plane->funcs->format_mod_supported ||
-			    plane->funcs->format_mod_supported(plane,
-							       plane->format_types[j],
-							       plane->modifiers[i])) {
+			if (!format_mod_supported ||
+			    format_mod_supported(plane,
+						 plane->format_types[j],
+						 plane->modifiers[i])) {
 				mod->formats |= 1ULL << j;
 			}
 		}
@@ -251,10 +255,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 		mod++;
 	}
 
-	drm_object_attach_property(&plane->base, config->modifiers_property,
-				   blob->base.id);
-
-	return 0;
+	return blob;
 }
 
 /**
@@ -366,6 +367,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_blob *blob;
 	static const uint64_t default_modifiers[] = {
 		DRM_FORMAT_MOD_LINEAR,
 	};
@@ -477,8 +479,24 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_plane_create_hotspot_properties(plane);
 	}
 
-	if (format_modifier_count)
-		create_in_format_blob(dev, plane);
+	if (format_modifier_count) {
+		blob = create_in_format_blob(dev, plane,
+					     plane->funcs->format_mod_supported);
+		if (!IS_ERR(blob))
+			drm_object_attach_property(&plane->base,
+						   config->modifiers_property,
+						   blob->base.id);
+	}
+
+	if (plane->funcs->format_mod_supported_async) {
+		blob = create_in_format_blob(dev, plane,
+					     plane->funcs->format_mod_supported_async);
+		if (!IS_ERR(blob))
+			drm_object_attach_property(&plane->base,
+						   config->async_modifiers_property,
+						   blob->base.id);
+	}
+
 
 	return 0;
 }

-- 
2.25.1

