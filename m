Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71857A396C3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 10:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD08410E63E;
	Tue, 18 Feb 2025 09:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epzE2i57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206710E63D;
 Tue, 18 Feb 2025 09:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739870265; x=1771406265;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=u5bjDgqW+g6qffOrSLcIjtm75P8AAaC3vftEkokJv3s=;
 b=epzE2i57Rch6tNKqvgjZ9wNNDUoDMA1ELAOxpgg4SuQqrMCrjcnwCR9y
 ppZ28AoSXG00UpUqp1thztg2SC2FXwyTJXQkUc8EY6LMBwgcCOXRISOir
 2W7tnVdW8voYWjRT5aIICNhPyYx/tFQU0Zi3yfiSQDqMKPG70FqBdmZuo
 B2ivkcPQVqhsA/KR1Vz0veWf0E/qEwf16rhrSjGNFZ+sblR/xm5GhgqnW
 8csWeI+NfXtB/A6WS4wbBI3llsYL4CPQeXgKr6chjPWEfuRy752bjPJTd
 1T9PEsnG5m5E0x65whryU7gQzLQ/7KP1P5N4hdMu5QcKq/Btr32A+XU2F A==;
X-CSE-ConnectionGUID: iQOYefiDTx63zTR92vAtRg==
X-CSE-MsgGUID: UjGwu1TgRXmn/31e58Nm5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51198273"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="51198273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 01:17:45 -0800
X-CSE-ConnectionGUID: T4Ni+bQSSFizCKsq5fEUDg==
X-CSE-MsgGUID: pn9RoHZKRCi1hkKurU7dhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151534690"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 18 Feb 2025 01:17:42 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 18 Feb 2025 14:32:47 +0530
Subject: [PATCH v5 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-asyn-v5-1-7ac5ac4abd4a@intel.com>
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

There exists a property IN_FORMATS which exposes the plane supported
modifiers/formats to the user. In some platforms when asynchronous flip
are used all of modifiers/formats mentioned in IN_FORMATS are not
supported. This patch adds a new plane property IN_FORMATS_ASYNC to
expose the async flip supported modifiers/formats so that user can use
this information ahead and do flip with unsupported
formats/modifiers. This will save flip failures.
Add a new function pointer similar to format_mod_supported specifically
for asynchronous flip.

v2: Remove async variable from drm_plane (Ville)
v3: Add new function pointer for async (Ville)
v5: Typo corrected in commit message & some correction in the kernel
documentation. (Chaitanya)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++++++
 drivers/gpu/drm/drm_plane.c       |  8 ++++++++
 include/drm/drm_mode_config.h     |  6 ++++++
 include/drm/drm_plane.h           | 17 +++++++++++++++++
 4 files changed, 38 insertions(+)

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
index a28b22fdd7a41aca82d097d42237851da9a0a79b..fe181c1002171acc68d3054c2d178f9b9f501fe2 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -141,6 +141,14 @@
  *     various bugs in this area with inconsistencies between the capability
  *     flag and per-plane properties.
  *
+ * IN_FORMATS_ASYNC:
+ *     Blob property which contains the set of buffer format and modifier
+ *     pairs supported by this plane for asynchronous flips. The blob is a struct
+ *     drm_format_modifier_blob. Userspace cannot change this property. This is an
+ *     optional property and if not present then user should expect a failure in
+ *     atomic ioctl when the modifier/format is not supported by that plane under
+ *     asynchronous flip.
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
index dd718c62ac31bf16606f3ee9f025a5b171cd1e67..4393a0e9edf91ccfd78ef62b168b9313187c1a81 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -549,6 +549,23 @@ struct drm_plane_funcs {
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

