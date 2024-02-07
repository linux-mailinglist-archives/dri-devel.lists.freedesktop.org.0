Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE084CA07
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 12:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D6510E21E;
	Wed,  7 Feb 2024 11:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVyH4gb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FA410E175;
 Wed,  7 Feb 2024 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707306984; x=1738842984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k4J/1QzlEJbQwn3BPfIRRa/3BqHxrSxvZaAZF5h0Ei0=;
 b=HVyH4gb0Malk8OXiHeZh517TF39bHzYcFvTrfLnqcrSiVPSr5tkLFxhz
 6KZ4oNHqfNkMTqEaO4d6IQ9JfE3wB+E3K7IKQ16Gvia/kPvUFVSCQYRBd
 80FW0ac10XqMIsrvtx0OiZhZNDNNyyI4CvsOWy0gKgRX8wj01JBpS9Buh
 J001KRotRTBp2tngi6WDd19gb/JqwmzbGsA3tv5yrpwhGq0eSnzGLIIKS
 B/yp9oAAQ8R/BxyMZFzBFM1rCVcTuwpML+3bhPYLVIsWHOfkVsKjPYQtI
 /FRi8mImPkFgu2LQdaXVS8pzRuSt5cFKmMJDvW6QSKLVd3OB/osqj0/DF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23450748"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="23450748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="38742193"
Received: from ahamill-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:56:17 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, Jose Souza <jose.souza@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
Subject: [RFC] drm/i915: Add GuC submission interface version query
Date: Wed,  7 Feb 2024 11:56:12 +0000
Message-Id: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add a new query to the GuC submission interface version.

Mesa intends to use this information to check for old firmware versions
with a known bug where using the render and compute command streamers
simultaneously can cause GPU hangs due issues in firmware scheduling.

Based on patches from Vivaik and Joonas.

There is a little bit of an open around the width required for versions.
While the GuC FW iface tells they are u8, i915 GuC code uses u32:

 #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
 #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
 #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
...
 struct intel_uc_fw_ver {
         u32 major;
         u32 minor;
         u32 patch;
         u32 build;
 };

So we could make the query u8, and refactor the struct intel_uc_fw_ver
to use u8, or not. To avoid any doubts on why are we assigning u32 to
u8 I simply opted to use u64. Which avoids the need to add any padding
too.

Compile tested only.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Sagar Ghuge <sagar.ghuge@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 32 +++++++++++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       | 11 +++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 00871ef99792..999687f6a3d4 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct drm_i915_private *i915,
 	return hwconfig->size;
 }
 
+static int
+query_guc_submission_version(struct drm_i915_private *i915,
+			     struct drm_i915_query_item *query)
+{
+	struct drm_i915_query_guc_submission_version __user *query_ptr =
+					    u64_to_user_ptr(query->data_ptr);
+	struct drm_i915_query_guc_submission_version ver;
+	struct intel_guc *guc = &to_gt(i915)->uc.guc;
+	const size_t size = sizeof(ver);
+	int ret;
+
+	if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
+		return -ENODEV;
+
+	ret = copy_query_item(&ver, size, size, query);
+	if (ret != 0)
+		return ret;
+
+	if (ver.major || ver.minor || ver.patch)
+		return -EINVAL;
+
+	ver.major = guc->submission_version.major;
+	ver.minor = guc->submission_version.minor;
+	ver.patch = guc->submission_version.patch;
+
+	if (copy_to_user(query_ptr, &ver, size))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 					struct drm_i915_query_item *query_item) = {
 	query_topology_info,
@@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 	query_memregion_info,
 	query_hwconfig_blob,
 	query_geometry_subslices,
+	query_guc_submission_version,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 550c496ce76d..d80d9b5e1eda 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
 	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
 	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
 	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
+	 *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct drm_i915_query_guc_submission_version)
 	 */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO		1
@@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_MEMORY_REGIONS		4
 #define DRM_I915_QUERY_HWCONFIG_BLOB		5
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
+#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION	7
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+* struct drm_i915_query_guc_submission_version - query GuC submission interface version
+*/
+struct drm_i915_query_guc_submission_version {
+	__u64 major;
+	__u64 minor;
+	__u64 patch;
+};
+
 /**
  * DOC: GuC HWCONFIG blob uAPI
  *
-- 
2.40.1

