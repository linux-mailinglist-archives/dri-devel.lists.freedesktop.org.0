Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A54FC7C9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C16610E3EF;
	Mon, 11 Apr 2022 22:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B797210E379;
 Mon, 11 Apr 2022 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649717005; x=1681253005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzyTgBWJcWFjHiiIWcKyk7fkPar4qKNDogw2XiqWCf8=;
 b=UxIH+ui7LM8cqiFywLvVueHtK8enEg/jBhfdQ48eAv+vUyTncqAr6PH0
 e/z2bUVctg6TKS4zXvgm1WIN03urOGBWH6jPi7OKgyRHTpPOAef/nzBIC
 IYcrcSKYTxuY4VePDg6Ify4qqBNja3aQCUt3jX7pdJivOmTsIWWUV1nTt
 xEVNxN8mFFNfGyF2TjBHngkHe4k+qKSi9OXF9OASU0EotDwIecZcXCJG5
 aW+jOwwUF2VFjAB2108JFoQLGMTKlAYTAmJ56vfqBHrnY7NS8NvVU0nNd
 4i5AYmX00ENV5q+Fthbq73LX3YahZXabSyiCgegYyFRPcTHixoP1I9gqd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249513173"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="249513173"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551432093"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/doc: Link query items to their uapi structs
Date: Mon, 11 Apr 2022 15:43:18 -0700
Message-Id: <20220411224319.467166-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220411224319.467166-1-matthew.d.roper@intel.com>
References: <20220411224319.467166-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the possible options for drm_i915_query_item.query_id with
links to the corresponding uapi structures.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/uapi/drm/i915_drm.h | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 787dab98f7b0..097a7935a510 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2724,18 +2724,24 @@ struct drm_i915_perf_oa_config {
  *
  * The behaviour is determined by the @query_id. Note that exactly what
  * @data_ptr is also depends on the specific @query_id.
- *
- * For specific queries see:
- *  * `GuC HWCONFIG blob uAPI`_
  */
 struct drm_i915_query_item {
-	/** @query_id: The id for this query */
+	/**
+	 * @query_id:
+	 *
+	 * The id for this query.  Currently accepted query IDs are:
+	 *  - %DRM_I915_QUERY_TOPOLOGY_INFO (see struct drm_i915_query_topology_info)
+	 *  - %DRM_I915_QUERY_ENGINE_INFO (see struct drm_i915_engine_info)
+	 *  - %DRM_I915_QUERY_PERF_CONFIG (see struct drm_i915_query_perf_config)
+	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
+	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
+	 */
 	__u64 query_id;
-#define DRM_I915_QUERY_TOPOLOGY_INFO    1
-#define DRM_I915_QUERY_ENGINE_INFO	2
-#define DRM_I915_QUERY_PERF_CONFIG      3
-#define DRM_I915_QUERY_MEMORY_REGIONS   4
-#define DRM_I915_QUERY_HWCONFIG_BLOB	5
+#define DRM_I915_QUERY_TOPOLOGY_INFO		1
+#define DRM_I915_QUERY_ENGINE_INFO		2
+#define DRM_I915_QUERY_PERF_CONFIG		3
+#define DRM_I915_QUERY_MEMORY_REGIONS		4
+#define DRM_I915_QUERY_HWCONFIG_BLOB		5
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -2751,14 +2757,14 @@ struct drm_i915_query_item {
 	/**
 	 * @flags:
 	 *
-	 * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
+	 * When &query_id == %DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
 	 *
-	 * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
+	 * When &query_id == %DRM_I915_QUERY_PERF_CONFIG, must be one of the
 	 * following:
 	 *
-	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
-	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
-	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
+	 *	- %DRM_I915_QUERY_PERF_CONFIG_LIST
+	 *      - %DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
+	 *      - %DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
 	 */
 	__u32 flags;
 #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
-- 
2.34.1

