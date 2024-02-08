Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37D84DB7A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 09:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34BE10E0E9;
	Thu,  8 Feb 2024 08:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+FW7tUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD07810E0E9;
 Thu,  8 Feb 2024 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707380720; x=1738916720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cs01kBDHpaG8Xn5x30JihMfv89H+OFPZEG/wuq90F7c=;
 b=U+FW7tUezErfh9bjAmmfaqhmo3Y4UnZUsemrBhZxymu9iS80I1EEHTff
 WJxoR2FSW/q4t2HI1ujeLvZhQnkFZEcP7Pg55IJFOujgHWUcUbtddKeDU
 ctm/iYC5nrTTcxBaHk12jXUT3m4Q6GQysEgJePySqCSt9ykWA0WDNXa7/
 KxBDBFPnzgVcq2qQCRP42hybP528wM90RWGhV5fIHZNiD7hDIobJB2cog
 QL4COal5NQEkJAIsBu/COQann/RLkCFtyCERip+NF22dqs0gkeV6M8XqA
 6WrFwdFki9IbajJ+cjiN0vSzYepi7Tjwa80i6/wf0iOtkz2wRL8ZFiFe7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18593998"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="18593998"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:25:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1582280"
Received: from waoconno-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.211.200])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:25:16 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, Jose Souza <jose.souza@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2] drm/i915: Add GuC submission interface version query
Date: Thu,  8 Feb 2024 08:25:10 +0000
Message-Id: <20240208082510.1363268-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
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

Compile tested only.

v2:
 * Added branch version.

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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 33 +++++++++++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       | 12 +++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 00871ef99792..d4dba1240b40 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -551,6 +551,38 @@ static int query_hwconfig_blob(struct drm_i915_private *i915,
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
+	if (ver.branch || ver.major || ver.minor || ver.patch)
+		return -EINVAL;
+
+	ver.branch = 0;
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
@@ -559,6 +591,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 	query_memregion_info,
 	query_hwconfig_blob,
 	query_geometry_subslices,
+	query_guc_submission_version,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 550c496ce76d..84fb7f7ea834 100644
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
@@ -3591,6 +3593,16 @@ struct drm_i915_query_memory_regions {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+* struct drm_i915_query_guc_submission_version - query GuC submission interface version
+*/
+struct drm_i915_query_guc_submission_version {
+	__u32 branch;
+	__u32 major;
+	__u32 minor;
+	__u32 patch;
+};
+
 /**
  * DOC: GuC HWCONFIG blob uAPI
  *
-- 
2.40.1

