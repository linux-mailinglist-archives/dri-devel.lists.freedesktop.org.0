Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7253A447A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 16:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068A86EEAA;
	Fri, 11 Jun 2021 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4766EE9E;
 Fri, 11 Jun 2021 14:55:21 +0000 (UTC)
IronPort-SDR: bgb79ib3SZKHjmqSzlHd6x/JM7FnYubXCkt9N1FtGxcxTx3zyKIjCoran4445NEHtSn72YmstO
 ihDoE5x8WLiQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="205355265"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="205355265"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 07:55:21 -0700
IronPort-SDR: ewAhAC2IRmjkIrSKW4fpW1/a+99G0vpp3SIpOx8c06gvRvmU5/ceg9Uv5NzSJxHFcP9rkHMgVG
 k6hNL5ai0v5Q==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="450783222"
Received: from delmer-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.23])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 07:55:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915/ttm: Use TTM for system memory
Date: Fri, 11 Jun 2021 16:54:59 +0200
Message-Id: <20210611145459.8576-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
References: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For discrete, use TTM for both cached and WC system memory. That means
we currently rely on the TTM memory accounting / shrinker. For cached
system memory we should consider remaining shmem-backed, which can be
implemented from our ttm_tt_populate calback. We can then also reuse our
own very elaborate shrinker for that memory.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
v2:
- Fix IS_ERR_OR_NULL() check to IS_ERR() (Reported by Matthew Auld)
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drv.h            |  3 ---
 drivers/gpu/drm/i915/intel_memory_region.c |  7 ++++++-
 drivers/gpu/drm/i915/intel_memory_region.h |  8 ++++++++
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index fd3d11728229..0940c1d7c5e6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -755,3 +755,25 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	/* i915 wants -ENXIO when out of memory region space. */
 	return (ret == -ENOSPC) ? -ENXIO : ret;
 }
+
+static const struct intel_memory_region_ops ttm_system_region_ops = {
+	.init_object = __i915_gem_ttm_object_init,
+};
+
+struct intel_memory_region *
+i915_gem_ttm_system_setup(struct drm_i915_private *i915,
+			  u16 type, u16 instance)
+{
+	struct intel_memory_region *mr;
+
+	mr = intel_memory_region_create(i915, 0,
+					totalram_pages() << PAGE_SHIFT,
+					PAGE_SIZE, 0,
+					type, instance,
+					&ttm_system_region_ops);
+	if (IS_ERR(mr))
+		return mr;
+
+	intel_memory_region_set_name(mr, "system-ttm");
+	return mr;
+}
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 38ff2fb89744..9643bebb951d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1751,9 +1751,6 @@ void i915_gem_cleanup_userptr(struct drm_i915_private *dev_priv);
 void i915_gem_init_early(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
 
-struct intel_memory_region *i915_gem_shmem_setup(struct drm_i915_private *i915,
-						 u16 type, u16 instance);
-
 static inline void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
 {
 	/*
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 12fb5423fd5e..0b016bdb8b84 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -220,7 +220,12 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		instance = intel_region_map[i].instance;
 		switch (type) {
 		case INTEL_MEMORY_SYSTEM:
-			mem = i915_gem_shmem_setup(i915, type, instance);
+			if (IS_DGFX(i915))
+				mem = i915_gem_ttm_system_setup(i915, type,
+								instance);
+			else
+				mem = i915_gem_shmem_setup(i915, type,
+							   instance);
 			break;
 		case INTEL_MEMORY_STOLEN_LOCAL:
 			mem = i915_gem_stolen_lmem_setup(i915, type, instance);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index c7e635d62e1a..1a2bb9fc9de5 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -143,4 +143,12 @@ void intel_memory_region_unreserve(struct intel_memory_region *mem);
 int intel_memory_region_reserve(struct intel_memory_region *mem,
 				resource_size_t offset,
 				resource_size_t size);
+
+struct intel_memory_region *
+i915_gem_ttm_system_setup(struct drm_i915_private *i915,
+			  u16 type, u16 instance);
+struct intel_memory_region *
+i915_gem_shmem_setup(struct drm_i915_private *i915,
+		     u16 type, u16 instance);
+
 #endif
-- 
2.31.1

