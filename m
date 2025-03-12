Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0FA5DDE3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981CB10E77B;
	Wed, 12 Mar 2025 13:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVB2y/Mm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9B10E31F;
 Wed, 12 Mar 2025 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741785888; x=1773321888;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=t1I2SCMsI0LtiTE259+L2ON/9t4ORERoJwJv1Uk32pY=;
 b=JVB2y/Mmz3CA+aNBe8RlYzQTYNw+1x7clCSth8L/hFtVM1t7ClicivTA
 lhN06zIAQjT3hvkEaomoqBqwS9UdDklyRqdJhlmQJHdfvE1BoKvfbq8KV
 Cb4dy+qqtZQ9BvexXPETCQe4dyyYKJv8NGN0Hh9QdVfRMAuDl2Y+8Izu4
 lLaCSGUlzMsnfmthblGbQtoFi37j/CmPNRFHqXVLQl6cE15KQ3R/oiRPg
 a3ybwgOnR5wBrfpuyA1d0xsVfz4Asqb9yCD9j5FzB4Jq/ysPheA079gUA
 k7Rnl3lCJ3C+FrAy2YlGM+xK4/lPIxgffwwuXjKymmEqY2rlN7dELKUBE g==;
X-CSE-ConnectionGUID: VoYTr0M1Qear3tMF5nl8MQ==
X-CSE-MsgGUID: pcSZ7QdRRxOYLnpbVtNhlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42028461"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42028461"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 06:24:48 -0700
X-CSE-ConnectionGUID: BroPoBm9T2ymdZbW80y/qQ==
X-CSE-MsgGUID: zZsjTW55QR+LSvgEcGQykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125821651"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 12 Mar 2025 06:24:45 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 12 Mar 2025 18:39:21 +0530
Subject: [PATCH v8 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-asyn-v8-1-0c4cbe5a066d@intel.com>
References: <20250312-asyn-v8-0-0c4cbe5a066d@intel.com>
In-Reply-To: <20250312-asyn-v8-0-0c4cbe5a066d@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, 
 20250219093211.4059187-1-arun.r.murthy@intel.com, 
 20250311085422.2573860-1-santhosh.reddy.guddati@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
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
v7: Place IN_FORMATS_ASYNC next to IN_FORMATS (Ville)
v8: replace uint32_t with u32 and uint64_t with u64 (Chaitanya)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++++++
 drivers/gpu/drm/drm_plane.c       | 12 ++++++++++--
 include/drm/drm_mode_config.h     |  6 ++++++
 include/drm/drm_plane.h           | 17 +++++++++++++++++
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 8642a2fb25a90116dab975aa0ab6b51deafb4b96..b4239fd04e9da4d4b5cfccdef1d3dde9556f322d 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -381,6 +381,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.modifiers_property = prop;
 
+	prop = drm_property_create(dev,
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "IN_FORMATS_ASYNC", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.async_modifiers_property = prop;
+
 	prop = drm_property_create(dev,
 				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
 				   "SIZE_HINTS", 0);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a41aca82d097d42237851da9a0a79b..110838c3e5920835e0875e57e6e479bcab7c8733 100644
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
@@ -197,7 +205,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	formats_size = sizeof(__u32) * plane->format_count;
 	if (WARN_ON(!formats_size)) {
 		/* 0 formats are never expected */
-		return 0;
+		return ERR_PTR(0);
 	}
 
 	modifiers_size =
@@ -213,7 +221,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 
 	blob = drm_property_create_blob(dev, blob_size, NULL);
 	if (IS_ERR(blob))
-		return -1;
+		return ERR_PTR(-1);
 
 	blob_data = blob->data;
 	blob_data->version = FORMAT_BLOB_CURRENT;
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
index dd718c62ac31bf16606f3ee9f025a5b171cd1e67..01479dd94e76a8389a0c9e9d6744400aa2291064 100644
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
+					   u32 format, u64 modifier);
+
 };
 
 /**

-- 
2.25.1

