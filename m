Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44922A74686
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B35610E9C0;
	Fri, 28 Mar 2025 09:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imtmrrWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB24410E9BD;
 Fri, 28 Mar 2025 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743155043; x=1774691043;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yhViCb+tsh7e5ZKwbOnNx/b0WUEUkcKtzPEBQ2TIwcc=;
 b=imtmrrWhSCRXGcamOomrLGonvVeQeeb5M6FcYsyU7CmPoDgidTsCA9rL
 7hKpXkBFMywXf9XmIUA/kY0e1oztEODn5RNnMblV2W48x8f+rl0NfqzyN
 ksmJpy3uqQ+c1qsjCtAQtLxCvfZ0tlKrZDBPLpEHDWvAg7VM5pOwGZkST
 BcuRu7+fJ+gBHn8wYltecfjsmRzxHMCMD9ktyod+k+Tylpb5cjrqPIsvx
 qZybstKFIJAsLdnkALEvcLfsHgW+ephto2tWZuZoFP+cUzO+npDHNo4X7
 2/dvIO4bDP90ionWgTeCI2YjBP3PVnWPjk17kFPxM2jXPvQcd6MRxoplw g==;
X-CSE-ConnectionGUID: ZtaSS7BtSyuSHlH5L/1Okg==
X-CSE-MsgGUID: IQCMoIaQQrq3tWUINz26iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48170269"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="48170269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 02:44:03 -0700
X-CSE-ConnectionGUID: bbztgl3zQOSwTdJey7JHmw==
X-CSE-MsgGUID: KSrUmvFyQDeHn35gSl1Tbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="129547521"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2025 02:43:59 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 28 Mar 2025 14:59:14 +0530
Subject: [PATCH v10 2/4] drm/plane: modify create_in_formats to acommodate
 async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-asyn-v10-2-8b8ad12cfc97@intel.com>
References: <20250328-asyn-v10-0-8b8ad12cfc97@intel.com>
In-Reply-To: <20250328-asyn-v10-0-8b8ad12cfc97@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
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
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index fe181c1002171acc68d3054c2d178f9b9f501fe2..04992dfd4c79274ff057961a947f4203a375d275 100644
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
+		return NULL;
 
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

