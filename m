Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56D7228F4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9B410E2AF;
	Mon,  5 Jun 2023 14:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B541510E2AD;
 Mon,  5 Jun 2023 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685975860; x=1717511860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QbsAIrV9jX/lP1THkGIi6qBZBg8CblTQDxVAQavB504=;
 b=gF2ccKHw3sz0DakrHF3n2ddfinkBCNqKxCrOjlftjoPvivAdNHwpslFS
 dRtPICeJs06myESr24aBJvgLUifdJPJUsQTjU0LXu7QOnulxGilG+54Ke
 n4h1FGVT8eY7y6WgmWDbpVkAsJRdhmOHkmULcB4P2NIvnkqlcdC2mIPCa
 bfpVEOcsJZ3Z+JMTq8HbdBPEURly3sIW+1d6Lw39A7lk973J2f5sVX4Gz
 CwtXeGZSHjP6Mr4TwusugRDV1TtDgdDxOAmDfLtMwl7WGRy4Yt1Agi7cq
 npA4GCF6/qb7uBNmLOkRZCuna5CAJ083mBAPDt/gpN0WaHJ8Lk0YdBHRu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356393345"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="356393345"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 07:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738379841"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="738379841"
Received: from mloughma-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.238.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 07:37:28 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Implement fdinfo memory stats printing
Date: Mon,  5 Jun 2023 15:37:20 +0100
Message-Id: <20230605143720.435046-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the newly added drm_print_memory_stats helper to show memory
utilisation of our objects in drm/driver specific fdinfo output.

To collect the stats we walk the per memory regions object lists
and accumulate object size into the respective drm_memory_stats
categories.

Objects with multiple possible placements are reported in multiple
regions for total and shared sizes, while other categories are
counted only for the currently active region.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 2a44b3876cb5..2a40f763f8f6 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -41,6 +41,70 @@ void __i915_drm_client_free(struct kref *kref)
 }
 
 #ifdef CONFIG_PROC_FS
+static void
+add_obj_meminfo(struct drm_i915_gem_object *obj,
+		struct intel_memory_region *mr,
+		struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
+{
+	u64 sz = obj->base.size;
+	enum intel_region_id id;
+	unsigned int i;
+
+	id = mr->id;
+	if (obj->base.handle_count > 1)
+		stats[id].shared += sz;
+	else
+		stats[id].private += sz;
+
+	if (i915_gem_object_has_pages(obj)) {
+		stats[id].resident += sz;
+
+		if (!dma_resv_test_signaled(obj->base.resv,
+					    dma_resv_usage_rw(true)))
+			stats[id].active += sz;
+		else if (i915_gem_object_is_shrinkable(obj) &&
+			 obj->mm.madv == I915_MADV_DONTNEED)
+			stats[id].purgeable += sz;
+	}
+
+	/* Attribute size and shared to all possible object memory regions. */
+	for (i = 0; i < obj->mm.n_placements; i++) {
+		if (obj->mm.placements[i] == mr)
+			continue;
+
+		id = obj->mm.placements[i]->id;
+		if (obj->base.handle_count > 1)
+			stats[id].shared += sz;
+		else
+			stats[id].private += sz;
+	}
+}
+
+static void show_meminfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
+	struct drm_i915_private *i915 = file_priv->i915;
+	struct intel_memory_region *mr;
+	unsigned int id;
+
+	for_each_memory_region(mr, i915, id) {
+		struct drm_i915_gem_object *obj;
+
+		mutex_lock(&mr->objects.lock);
+		list_for_each_entry(obj, &mr->objects.list, mm.region_link)
+			add_obj_meminfo(obj, mr, stats);
+		mutex_unlock(&mr->objects.lock);
+	}
+
+	for_each_memory_region(mr, i915, id)
+		drm_print_memory_stats(p,
+				       &stats[id],
+				       DRM_GEM_OBJECT_RESIDENT |
+				       DRM_GEM_OBJECT_PURGEABLE,
+				       mr->name);
+}
+
 static const char * const uabi_class_names[] = {
 	[I915_ENGINE_CLASS_RENDER] = "render",
 	[I915_ENGINE_CLASS_COPY] = "copy",
@@ -102,6 +166,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	 * ******************************************************************
 	 */
 
+	show_meminfo(p, file);
+
 	if (GRAPHICS_VER(i915) < 8)
 		return;
 
-- 
2.39.2

