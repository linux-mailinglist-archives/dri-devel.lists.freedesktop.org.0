Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A619BCA8D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146E210E55F;
	Tue,  5 Nov 2024 10:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfGs9dFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A0910E557;
 Tue,  5 Nov 2024 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730802951; x=1762338951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pyOQ/mxEZT4HahP/Y4QV6pHhaaMe/ceMczmkNYYTyL0=;
 b=KfGs9dFhakAHQ+hAkIQgrlEkEcYaa+74UvySjj0rKjXLYruG6iY8+t4W
 1yMNj1ztUKqA7wPZNHcPHvhkP1OkTH24bdPertUSQZF4Qtz9AKYrSbiIe
 ZXtw8bO0wzIZqQohX9sJWuMiW29zJ3mSFB1/fuLVj9g3fR8qVuBwjceR4
 tVcZb6OtZ6LzZ0e/0LnEd0rs6LrDFqR2MY7MxbFioeqOLZWnpVcuE9Foc
 K8gNmmr3imTo5A8k8v5gl8gOKQt8++/6yaxeW7lHk35qa6AQO2cBQ2stN
 hdhmCPvpU0T/Fhs1g2iteP6NmVF8LPVXnGUpqpVWB+oe+pLeE/CTooodd w==;
X-CSE-ConnectionGUID: u/lB8vphRkKZUNrD2YUQfg==
X-CSE-MsgGUID: lkM7z/v6SMq7wnqcNrYaIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34230832"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34230832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:35:50 -0800
X-CSE-ConnectionGUID: uIYCvY1oQ9+qi5Ys6raJhQ==
X-CSE-MsgGUID: kfFqa+3qSu+zms62KKdYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83485545"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 02:35:49 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 1/4] drm/plane: Add new plane property IN_FORMATS_ASYNC
Date: Tue,  5 Nov 2024 15:56:05 +0530
Message-Id: <20241105102608.3912133-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105102608.3912133-1-arun.r.murthy@intel.com>
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
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

There exists a property IN_FORMATS which exposes the plane supported
modifiers/formats to the user. In some platforms when asynchronous flips
are used all of modifiers/formats mentioned in IN_FORMATS are not
supported. This patch adds a new plane property IN_FORMATS_ASYNC to
expose the async flips supported modifiers/formats so that user can use
this information ahead and done flips with unsupported
formats/modifiers. This will save flips failures.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++
 drivers/gpu/drm/drm_plane.c       | 73 +++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  6 +++
 include/drm/drm_plane.h           | 10 +++++
 4 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37d2e0a4ef4b..cff189a2e751 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -379,6 +379,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.size_hints_property = prop;
 
+	prop = drm_property_create(dev,
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "IN_FORMATS_ASYNC", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.async_modifiers_property = prop;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a4..01b8e6932fda 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -141,6 +141,12 @@
  *     various bugs in this area with inconsistencies between the capability
  *     flag and per-plane properties.
  *
+ * IN_FORMATS_ASYNC:
+ *     Blob property which contains the set of buffer format and modifier
+ *     pairs supported by this plane for asynchronous flips. The blob is a struct
+ *     drm_format_modifier_blob. Without this property the plane doesn't
+ *     support buffers with modifiers. Userspace cannot change this property.
+ *
  * SIZE_HINTS:
  *     Blob property which contains the set of recommended plane size
  *     which can used for simple "cursor like" use cases (eg. no scaling).
@@ -249,6 +255,70 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	return 0;
 }
 
+static int create_in_format_async_blob(struct drm_device *dev, struct drm_plane *plane)
+{
+	const struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_blob *blob;
+	struct drm_format_modifier *async_mod;
+	size_t blob_size, async_formats_size, async_modifiers_size;
+	struct drm_format_modifier_blob *blob_data;
+	unsigned int i, j;
+
+	async_formats_size = sizeof(__u32) * plane->async_format_count;
+	if (WARN_ON(!async_formats_size)) {
+		/* 0 formats are never expected */
+		return 0;
+	}
+
+	async_modifiers_size =
+		sizeof(struct drm_format_modifier) * plane->async_modifier_count;
+
+	blob_size = sizeof(struct drm_format_modifier_blob);
+	/* Modifiers offset is a pointer to a struct with a 64 bit field so it
+	 * should be naturally aligned to 8B.
+	 */
+	BUILD_BUG_ON(sizeof(struct drm_format_modifier_blob) % 8);
+	blob_size += ALIGN(async_formats_size, 8);
+	blob_size += async_modifiers_size;
+
+	blob = drm_property_create_blob(dev, blob_size, NULL);
+	if (IS_ERR(blob))
+		return -1;
+
+	blob_data = blob->data;
+	blob_data->version = FORMAT_BLOB_CURRENT;
+	blob_data->count_formats = plane->async_format_count;
+	blob_data->formats_offset = sizeof(struct drm_format_modifier_blob);
+	blob_data->count_modifiers = plane->async_modifier_count;
+
+	blob_data->modifiers_offset =
+		ALIGN(blob_data->formats_offset + async_formats_size, 8);
+
+	memcpy(formats_ptr(blob_data), plane->async_format_types, async_formats_size);
+
+	async_mod = modifiers_ptr(blob_data);
+	for (i = 0; i < plane->async_modifier_count; i++) {
+		for (j = 0; j < plane->async_format_count; j++) {
+			if (!plane->funcs->format_mod_supported ||
+			    plane->funcs->format_mod_supported(plane,
+							       plane->async_format_types[j],
+							       plane->async_modifiers[i])) {
+				async_mod->formats |= 1ULL << j;
+			}
+		}
+
+		async_mod->modifier = plane->async_modifiers[i];
+		async_mod->offset = 0;
+		async_mod->pad = 0;
+		async_mod++;
+	}
+
+	drm_object_attach_property(&plane->base, config->async_modifiers_property,
+				   blob->base.id);
+
+	return 0;
+}
+
 /**
  * DOC: hotspot properties
  *
@@ -472,6 +542,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	if (format_modifier_count)
 		create_in_format_blob(dev, plane);
 
+	if (plane->async_modifier_count)
+		create_in_format_async_blob(dev, plane);
+
 	return 0;
 }
 
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 271765e2e9f2..0c116d6dfd27 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -936,6 +936,12 @@ struct drm_mode_config {
 	 */
 	struct drm_property *modifiers_property;
 
+	/**
+	 * @async_modifiers_property: Plane property to list support modifier/format
+	 * combination for asynchronous flips.
+	 */
+	struct drm_property *async_modifiers_property;
+
 	/**
 	 * @size_hints_property: Plane SIZE_HINTS property.
 	 */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index dd718c62ac31..d9571265251a 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -658,11 +658,21 @@ struct drm_plane {
 	 */
 	bool format_default;
 
+	/** @format_types: array of formats supported by this plane */
+	uint32_t *async_format_types;
+	/** @format_count: Size of the array pointed at by @format_types. */
+	unsigned int async_format_count;
+
 	/** @modifiers: array of modifiers supported by this plane */
 	uint64_t *modifiers;
 	/** @modifier_count: Size of the array pointed at by @modifier_count. */
 	unsigned int modifier_count;
 
+	/** @modifiers: array of modifiers supported by this plane */
+	uint64_t *async_modifiers;
+	/** @modifier_count: Size of the array pointed at by @modifier_count. */
+	unsigned int async_modifier_count;
+
 	/**
 	 * @crtc:
 	 *
-- 
2.25.1

