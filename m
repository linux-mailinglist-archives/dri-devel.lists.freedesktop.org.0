Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FDC514636
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4F510FB92;
	Fri, 29 Apr 2022 10:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFF610FB8E;
 Fri, 29 Apr 2022 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651226667; x=1682762667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6uQnL7RaSGfYSBRn+wrXOvgwFMZrMoy+tH/kTu9B1Ds=;
 b=f72aXkxxAc5JLTlUhQwra7eEdLanLcZD0LYA5jwv6KR8EJ4enNi4hHS9
 u0/K0CXCLEwOf7f+9DYHBB+qKsb6vHWYg4rkqJD97ZfzLKIfUywtDdSzN
 If/pUHlY8KCXBeCpYh25pfzch9VnB+LDrWQrdntAYBLR9RiYH/z0aZ65A
 tYqnywMLNsHa/cAy7N2y/umMj54XQBmE3tHZzgRPDZjDWK63MJFglZTzK
 LyvYFBwebdYbyckwHoT1+qQlT4msKxdv74SefYwtzA4HcxH6gIhsDL3NU
 6UCzX0YVYT8GE5JjYN/dsXHVa52mD3R70p5jP63zsOl0XcwNUk0Q9dH6p g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="246512552"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="246512552"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 03:04:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="684516814"
Received: from pfowens-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.234.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 03:04:25 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Only setup private tmpfs mount when needed and
 fix logging
Date: Fri, 29 Apr 2022 11:04:14 +0100
Message-Id: <20220429100414.647857-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429100414.647857-1-tvrtko.ursulin@linux.intel.com>
References: <20220429100414.647857-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

If i915 does not want to use huge pages there is a) no point in setting up
the private mount and b) should former fail, it is misleading to log THP
support is disabled in the caller, which does not even know if callee
tried to enable it.

Fix both by restructuring the flow in i915_gemfs_init and at the same time
note the failure to set it up in all cases.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 11 +-----
 drivers/gpu/drm/i915/gem/i915_gemfs.c     | 45 ++++++++++-------------
 drivers/gpu/drm/i915/gem/i915_gemfs.h     |  3 +-
 3 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index c2a3e388fcb4..955844f19193 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -671,17 +671,10 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 
 static int init_shmem(struct intel_memory_region *mem)
 {
-	int err;
-
-	err = i915_gemfs_init(mem->i915);
-	if (err) {
-		DRM_NOTE("Unable to create a private tmpfs mount, hugepage support will be disabled(%d).\n",
-			 err);
-	}
-
+	i915_gemfs_init(mem->i915);
 	intel_memory_region_set_name(mem, "system");
 
-	return 0; /* Don't error, we can simply fallback to the kernel mnt */
+	return 0; /* We have fallback to the kernel mnt if gemfs init failed. */
 }
 
 static int release_shmem(struct intel_memory_region *mem)
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index c5a6bbc842fc..46b9a17d6abc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -11,16 +11,11 @@
 #include "i915_gemfs.h"
 #include "i915_utils.h"
 
-int i915_gemfs_init(struct drm_i915_private *i915)
+void i915_gemfs_init(struct drm_i915_private *i915)
 {
 	char huge_opt[] = "huge=within_size"; /* r/w */
 	struct file_system_type *type;
 	struct vfsmount *gemfs;
-	char *opts;
-
-	type = get_fs_type("tmpfs");
-	if (!type)
-		return -ENODEV;
 
 	/*
 	 * By creating our own shmemfs mountpoint, we can pass in
@@ -34,29 +29,29 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 	 * regressions such a slow reads issue on Broadwell and Skylake.
 	 */
 
-	opts = NULL;
-	if (GRAPHICS_VER(i915) >= 11 || i915_vtd_active(i915)) {
-		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			opts = huge_opt;
-			drm_info(&i915->drm,
-				 "Transparent Hugepage mode '%s'\n",
-				 opts);
-		} else {
-			drm_notice(&i915->drm,
-				   "Transparent Hugepage support is recommended for optimal performance%s\n",
-				   GRAPHICS_VER(i915) >= 11 ?
-				   " on this platform!" :
-				   " when IOMMU is enabled!");
-		}
-	}
+	if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
+		return;
+
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		goto err;
 
-	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, opts);
+	type = get_fs_type("tmpfs");
+	if (!type)
+		goto err;
+
+	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, huge_opt);
 	if (IS_ERR(gemfs))
-		return PTR_ERR(gemfs);
+		goto err;
 
 	i915->mm.gemfs = gemfs;
-
-	return 0;
+	drm_info(&i915->drm, "Using Transparent Hugepages\n");
+	return;
+
+err:
+	drm_notice(&i915->drm,
+		   "Transparent Hugepage support is recommended for optimal performance%s\n",
+		   GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
+					      " when IOMMU is enabled!");
 }
 
 void i915_gemfs_fini(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.h b/drivers/gpu/drm/i915/gem/i915_gemfs.h
index 2a1e59af3e4a..5d835e44c4f6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.h
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.h
@@ -9,8 +9,7 @@
 
 struct drm_i915_private;
 
-int i915_gemfs_init(struct drm_i915_private *i915);
-
+void i915_gemfs_init(struct drm_i915_private *i915);
 void i915_gemfs_fini(struct drm_i915_private *i915);
 
 #endif
-- 
2.32.0

