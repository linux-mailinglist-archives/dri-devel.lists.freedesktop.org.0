Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FAEA32BA8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F1F10E910;
	Wed, 12 Feb 2025 16:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARUNm6G3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEBD10E905;
 Wed, 12 Feb 2025 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739377996; x=1770913996;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=is6jENgogeyedVHuv/WlNYpfefBbYVRD9mREtoWHC3o=;
 b=ARUNm6G3NwEvvENPwsBF5DoSVrgWx/w5diTMMf9FcEnWj+tz9X5WV6UT
 4MdsNmlqlgX9MlLV87c6GSR33c8oWcExBWycTr6852cciLAm1t4G9ofB6
 grXTcZRoA22JtZDq0hcK+5vqBeU+GTQ3bDhU04SRnrSDvyQoR+7YvlUNA
 iVXwtwEVJvLLmA87dzOzR5t/o6M9wtXDgAc+eW19kvaFyzS0Pa2ZAGc6J
 VTHovJidTW0U8uwBmrgB/cHpjLQPXQcT9e5Qg+z9x+iDCveHkhzFWjn7C
 bdAg8GIOF/MjmotUUtxdVypn0/cljld6q/owxLUljQT/92zOh6kdVFfsa g==;
X-CSE-ConnectionGUID: 8O6RUI/eT/KwY1QbJlMghA==
X-CSE-MsgGUID: oqJECVLTT7ytwvy/5M60Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39969129"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39969129"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:33:16 -0800
X-CSE-ConnectionGUID: au7BUwWvSIWyrBTSpC8Mbg==
X-CSE-MsgGUID: aI648bw3R+CD3OsOorSqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116989305"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 12 Feb 2025 08:33:14 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 12 Feb 2025 21:48:23 +0530
Subject: [PATCH v5 2/3] drm/plane: modify create_in_formats to accommodate
 async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-asyn-v5-2-dc182281dca3@intel.com>
References: <20250212-asyn-v5-0-dc182281dca3@intel.com>
In-Reply-To: <20250212-asyn-v5-0-dc182281dca3@intel.com>
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

v5: create_in_formats can return -ve value in failure case, correct the
if condition to check the creation of blob <Chaitanya>
Dont add the modifier for which none of the formats is not supported.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 46 +++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index c9d8871417722186d2b6f87197c9e15a70924b4f..01f67f1f5f29e37b8d0e0793c58bbe1bba337eb2 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -190,9 +190,12 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
 	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
 }
 
-static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
+static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane,
+				 bool (*format_mod_supported)
+						(struct drm_plane *plane,
+						 uint32_t format,
+						 uint64_t modifier))
 {
-	const struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property_blob *blob;
 	struct drm_format_modifier *mod;
 	size_t blob_size, formats_size, modifiers_size;
@@ -234,24 +237,26 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
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
 
+		if (!mod->formats) {
+			mod->modifier = 0;
+			blob_data->count_modifiers--;
+			continue;
+		}
 		mod->modifier = plane->modifiers[i];
 		mod->offset = 0;
 		mod->pad = 0;
 		mod++;
 	}
 
-	drm_object_attach_property(&plane->base, config->modifiers_property,
-				   blob->base.id);
-
-	return 0;
+	return blob->base.id;
 }
 
 /**
@@ -368,6 +373,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	};
 	unsigned int format_modifier_count = 0;
 	int ret;
+	int blob_id;
 
 	/* plane index is used with 32bit bitmasks */
 	if (WARN_ON(config->num_total_plane >= 32))
@@ -474,8 +480,24 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_plane_create_hotspot_properties(plane);
 	}
 
-	if (format_modifier_count)
-		create_in_format_blob(dev, plane);
+	if (format_modifier_count) {
+		blob_id = create_in_format_blob(dev, plane,
+						plane->funcs->format_mod_supported);
+		if (blob_id > 0)
+			drm_object_attach_property(&plane->base,
+						   config->modifiers_property,
+						   blob_id);
+	}
+
+	if (plane->funcs->format_mod_supported_async) {
+		blob_id = create_in_format_blob(dev, plane,
+						plane->funcs->format_mod_supported_async);
+		if (blob_id > 0)
+			drm_object_attach_property(&plane->base,
+						   config->async_modifiers_property,
+						   blob_id);
+	}
+
 
 	return 0;
 }

-- 
2.25.1

