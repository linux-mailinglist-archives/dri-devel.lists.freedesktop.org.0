Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5DA396C8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 10:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C07510E649;
	Tue, 18 Feb 2025 09:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJrV/qdg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0E910E643;
 Tue, 18 Feb 2025 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739870267; x=1771406267;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=A2zS+yfR5avl/+r6Dk9rX25feUyDYRcNJsojQIdcsUY=;
 b=XJrV/qdg4G8LISpsxc4ka0/Zr7Z6Yx1e+0N1bswe77ZTLfJfK5LeB3ID
 MD7VPO0l3sT4jjenHm2omWH+wk1niKncFRGPo8V00MmVUypx7WPGDMW+W
 sBCWBV5QN3AB8plESdK6CWYUSEH/XTt8X2NFbu9W+ZSywF1utbZctfKHp
 LW9FNJUZ1iLz4HOjmqbhDfFWpOY02WDT/RML+SuBzh+zSUS3MxjB0j5Ba
 0DmzbSB8nkIZy5pe26WB4YTet9x3JU4tUsAflcDYiVHgTnQ4PezJMGlzB
 1p06vxLOduCD8HE/vouhuMXAibZRoc2FFyXnSW7DQ6y6p9qUDYsETPATx Q==;
X-CSE-ConnectionGUID: fvwN+3jwQfeDBkmaAjz9DQ==
X-CSE-MsgGUID: 8uabLjCwTv67aZE8WtardQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51198274"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="51198274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 01:17:47 -0800
X-CSE-ConnectionGUID: wInGtYlkQO6ODXxKRZE7uA==
X-CSE-MsgGUID: 3Ldi3qOHShqP577F43ttKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151534697"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 18 Feb 2025 01:17:45 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 18 Feb 2025 14:32:48 +0530
Subject: [PATCH v5 2/3] drm/plane: modify create_in_formats to accommodate
 async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-asyn-v5-2-7ac5ac4abd4a@intel.com>
References: <20250218-asyn-v5-0-7ac5ac4abd4a@intel.com>
In-Reply-To: <20250218-asyn-v5-0-7ac5ac4abd4a@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index fe181c1002171acc68d3054c2d178f9b9f501fe2..a27ea45f3c12f5c3ff9532e9c0e3ae0897a02501 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -193,9 +193,12 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
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
@@ -237,10 +240,10 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
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
@@ -251,10 +254,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 		mod++;
 	}
 
-	drm_object_attach_property(&plane->base, config->modifiers_property,
-				   blob->base.id);
-
-	return 0;
+	return blob->base.id;
 }
 
 /**
@@ -371,6 +371,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	};
 	unsigned int format_modifier_count = 0;
 	int ret;
+	int blob_id;
 
 	/* plane index is used with 32bit bitmasks */
 	if (WARN_ON(config->num_total_plane >= 32))
@@ -477,8 +478,24 @@ static int __drm_universal_plane_init(struct drm_device *dev,
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

