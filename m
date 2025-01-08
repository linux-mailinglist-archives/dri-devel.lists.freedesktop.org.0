Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16895A052DD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D823D10EB80;
	Wed,  8 Jan 2025 05:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nl5tPJ5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51E910E7F3;
 Wed,  8 Jan 2025 05:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736315623; x=1767851623;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YfdE+tXCtfzMRa9ShE8tlVVWCzVGli3JnImVc4Ureco=;
 b=Nl5tPJ5aWndJkHMmF1y7jVeLaijDTHMC3YJo9AKeI3PvEDh1rEYpygnO
 6VuRZ+vVhiRple61s3lqgo4d8hTw4Hrayr6dV/5egjNj67P/jjm8FOKBd
 xBj4ojxO49raCpuakWYnnPoFSOxc+xaJQMFBYIjHXm5kSBFk9n6aGM8QI
 uPG5Xghehx+QW1apHOzomv0Ruex7yld+xNbSrsfqHWx0Je04kLbzUDjkh
 GZqrYGASriiXkIrkMZp2p37g36hBts+MyD7naOzdsuMcV0VkIP+WhsCjt
 MllAKj4N1htEkDUXviqBooq+vNraWElAFjTkqc29MUb1qwA7iZ8kc9IQc Q==;
X-CSE-ConnectionGUID: wedE8xuhRxqbUEzhF0GH6w==
X-CSE-MsgGUID: sOrffXkYS4iBfYruOOUlhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="61903902"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="61903902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 21:53:42 -0800
X-CSE-ConnectionGUID: HXxlUrz6QvmnXDEnPkX96A==
X-CSE-MsgGUID: Eq5gP1QXSf6V4gUMpCbqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107024129"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 21:53:41 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 08 Jan 2025 11:09:00 +0530
Subject: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-asyn-v3-2-f4399635eec9@intel.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-0-f4399635eec9@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
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

Expose drm plane function to create formats/modifiers blob. This
function can be used to expose list of supported formats/modifiers for
sync/async flips.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 44 +++++++++++++++++++++++++++++---------------
 include/drm/drm_plane.h     |  4 ++++
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..4f35eec2b7770fcc90c3e07a9068b31c0563a4c0 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -191,7 +191,10 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
 	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
 }
 
-static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
+int drm_plane_create_format_blob(struct drm_device *dev,
+				 struct drm_plane *plane, u64 *modifiers,
+				 unsigned int modifier_count, u32 *formats,
+				 unsigned int format_count, bool is_async)
 {
 	const struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property_blob *blob;
@@ -200,14 +203,14 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	struct drm_format_modifier_blob *blob_data;
 	unsigned int i, j;
 
-	formats_size = sizeof(__u32) * plane->format_count;
+	formats_size = sizeof(__u32) * format_count;
 	if (WARN_ON(!formats_size)) {
 		/* 0 formats are never expected */
 		return 0;
 	}
 
 	modifiers_size =
-		sizeof(struct drm_format_modifier) * plane->modifier_count;
+		sizeof(struct drm_format_modifier) * modifier_count;
 
 	blob_size = sizeof(struct drm_format_modifier_blob);
 	/* Modifiers offset is a pointer to a struct with a 64 bit field so it
@@ -223,37 +226,45 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 
 	blob_data = blob->data;
 	blob_data->version = FORMAT_BLOB_CURRENT;
-	blob_data->count_formats = plane->format_count;
+	blob_data->count_formats = format_count;
 	blob_data->formats_offset = sizeof(struct drm_format_modifier_blob);
-	blob_data->count_modifiers = plane->modifier_count;
+	blob_data->count_modifiers = modifier_count;
 
 	blob_data->modifiers_offset =
 		ALIGN(blob_data->formats_offset + formats_size, 8);
 
-	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
+	memcpy(formats_ptr(blob_data), formats, formats_size);
 
 	mod = modifiers_ptr(blob_data);
-	for (i = 0; i < plane->modifier_count; i++) {
-		for (j = 0; j < plane->format_count; j++) {
-			if (!plane->funcs->format_mod_supported ||
+	for (i = 0; i < modifier_count; i++) {
+		for (j = 0; j < format_count; j++) {
+			if (is_async ||
+			    !plane->funcs->format_mod_supported ||
 			    plane->funcs->format_mod_supported(plane,
-							       plane->format_types[j],
-							       plane->modifiers[i])) {
+							       formats[j],
+							       modifiers[i])) {
 				mod->formats |= 1ULL << j;
 			}
 		}
 
-		mod->modifier = plane->modifiers[i];
+		mod->modifier = modifiers[i];
 		mod->offset = 0;
 		mod->pad = 0;
 		mod++;
 	}
 
-	drm_object_attach_property(&plane->base, config->modifiers_property,
-				   blob->base.id);
+	if (is_async)
+		drm_object_attach_property(&plane->base,
+					   config->async_modifiers_property,
+					   blob->base.id);
+	else
+		drm_object_attach_property(&plane->base,
+					   config->modifiers_property,
+					   blob->base.id);
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_plane_create_format_blob);
 
 /**
  * DOC: hotspot properties
@@ -476,7 +487,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	}
 
 	if (format_modifier_count)
-		create_in_format_blob(dev, plane);
+		drm_plane_create_format_blob(dev, plane, plane->modifiers,
+					     format_modifier_count,
+					     plane->format_types, format_count,
+					     false);
 
 	return 0;
 }
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index e8749e6fc3bc0acfc73bbd8401f85c3126e86759..eb84830fbb723e39436bfbadf369894a5657cd45 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -1008,5 +1008,9 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 int drm_plane_add_size_hints_property(struct drm_plane *plane,
 				      const struct drm_plane_size_hint *hints,
 				      int num_hints);
+int drm_plane_create_format_blob(struct drm_device *dev,
+				 struct drm_plane *plane, u64 *modifiers,
+				 unsigned int modifier_count, u32 *formats,
+				 unsigned int format_count, bool is_async);
 
 #endif

-- 
2.25.1

