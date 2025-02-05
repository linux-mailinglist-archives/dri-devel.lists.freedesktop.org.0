Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D99A28840
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 11:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFDA10E772;
	Wed,  5 Feb 2025 10:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikus0v4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0EB10E772;
 Wed,  5 Feb 2025 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738752117; x=1770288117;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=AWoDGjNvRz2CUSxTUs9m1ZegUhFYUa2t1JUxLRv3GF8=;
 b=ikus0v4J2TKKXRjuw95in1zcoAI5DkOfr1Ki+SRRywPCtKv/MJ66mCwK
 hYVVuP6a4f0WAX3F4JB9LiPkk3JBxuxrTGxLM9EPiyey/JX1HbBzjcq5e
 P/23b7M/sD51HBwOq1gE3nnZcFUrt9mkIi7iFk6+Gfw+lcogKC43dufFs
 /pgh0CkzNn7ELAhGCMzf5/KZTPbcrfuuudr7nJ+P4zE05Hd3s0OzQAEAi
 pFodi3p8McOT4U3vOK2qEB+rUAm1Rdv9wcIuA9T6J83PWF/rZhzZI+sff
 Ca/L/c8fam44JK1+t2Blx7xlOpYX4o3hN0oOt7Us62ek21bJL2pwIYVAl g==;
X-CSE-ConnectionGUID: d26qFhlIQbua3AJ76XbZnA==
X-CSE-MsgGUID: fBUImv2wQxy0KwAJARH1wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38544814"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="38544814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:41:57 -0800
X-CSE-ConnectionGUID: Bge0O7LpTP2sShIntW2H0w==
X-CSE-MsgGUID: JP5nnHA3Q+uPg9opXpNjhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114938024"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2025 02:41:55 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 05 Feb 2025 15:57:17 +0530
Subject: [PATCH v4 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-asyn-v4-1-9a5b018e359b@intel.com>
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

There exists a property IN_FORMATS which exposes the plane supported
modifiers/formats to the user. In some platforms when asynchronous flips
are used all of modifiers/formats mentioned in IN_FORMATS are not
supported. This patch adds a new plane property IN_FORMATS_ASYNC to
expose the async flips supported modifiers/formats so that user can use
this information ahead and done flips with unsupported
formats/modifiers. This will save flips failures.
Add a new function pointer similar to format_mod_supported specifically
for asynchronous flips.

v2: Remove async variable from drm_plane (Ville)
v3: Add new function pointer for async (Ville)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++++++
 drivers/gpu/drm/drm_plane.c       |  6 ++++++
 include/drm/drm_mode_config.h     |  6 ++++++
 include/drm/drm_plane.h           | 20 ++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 8642a2fb25a90116dab975aa0ab6b51deafb4b96..dbbef20753f834a85ae9ded748cff2b3f0e85043 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -388,6 +388,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
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
index a28b22fdd7a41aca82d097d42237851da9a0a79b..416818e54ccffcf3d3aada2723e96ce8ccf1dd97 100644
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
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 271765e2e9f2da62aaf0d258828ef4196e14822e..0c116d6dfd277262b1a4c0f097fce2d719f43844 100644
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
index dd718c62ac31bf16606f3ee9f025a5b171cd1e67..179da19d602ac94cb6eeea3e6522ae5c7738bb46 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -549,6 +549,26 @@ struct drm_plane_funcs {
 	 */
 	bool (*format_mod_supported)(struct drm_plane *plane, uint32_t format,
 				     uint64_t modifier);
+	/**
+	 * @format_mod_supported_async:
+	 *
+	 * This optional hook is used for the DRM to determine if for
+	 * asynchronous flip the given format/modifier combination is valid for
+	 * the plane. This allows the DRM to generate the correct format
+	 * bitmask (which formats apply to which modifier), and to validate
+	 * modifiers at atomic_check time.
+	 *
+	 * If not present, then any modifier in the plane's modifier
+	 * list is allowed with any of the plane's formats.
+	 *
+	 * Returns:
+	 *
+	 * True if the given modifier is valid for that format on the plane.
+	 * False otherwise.
+	 */
+	bool (*format_mod_supported_async)(struct drm_plane *plane,
+					   uint32_t format, uint64_t modifier);
+
 };
 
 /**

-- 
2.25.1

