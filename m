Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2415BB1AB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 19:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9FE10E970;
	Fri, 16 Sep 2022 17:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE59410E501;
 Fri, 16 Sep 2022 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663349791; x=1694885791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGZ8lgCw3SCsbauSmP603+rkndqm1kBG/7Qo3k0QVPQ=;
 b=Y9S7KQzUOu/tsAvEnEHuueI0Y6VV4mJHGqlJadyduop3nE/wN+a4aC0e
 0m3RNCz7hxFg+i+FOTlAWEJU/ZJWIZHakJ2FBiPtdfbOBNqMuqCEn3/+a
 ml1GqfmJ6CWcovt167HM4L2wXz7NK2dx+RVnkAmUfnk+S+eHEreM0evyb
 2bygZBm1m4gN1O34DPa7jIgoVMqvTLwwV+wgW8/VzQGBFAU/ZZvAKx2By
 kv6/2FykVfxqmoARBF0GZXZfJjReNmpM4NBIw12ZjqdQ67SkfRc65pdL3
 1HtkFyAA1CajwYwdg4lwiLb9eWBTidLQf4gvi5/kAeSR26gTcd8w1vwvX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="278769863"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="278769863"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 10:36:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="721499670"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 10:36:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Caz Yokoyama <caz@caztech.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v2 3/3] drm/i915/dgfx: Make failure to setup stolen non-fatal
Date: Fri, 16 Sep 2022 10:36:08 -0700
Message-Id: <20220915-stolen-v2-3-20ff797de047@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915-stolen-v2-0-20ff797de047@intel.com>
References: <20220915-stolen-v2-0-20ff797de047@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-bbe61
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
Cc: tejas.upadhyay@intel.com, dri-devel@lists.freedesktop.org,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no reason to consider the setup of Data Stolen Memory fatal on
dgfx and non-fatal on integrated. Move the debug and error propagation
around so both have the same behavior: non-fatal. Before this change,
loading i915 on a system with TGL + DG2 would result in just TGL
succeeding the initialization (without stolen).

Now loading i915 on the same system with an injected failure in
i915_gem_init_stolen():

	$ dmesg | grep stolen
	i915 0000:00:02.0: [drm] Injected failure, disabling use of stolen memory
	i915 0000:00:02.0: [drm:init_stolen_smem [i915]] Skip stolen region: failed to setup
	i915 0000:03:00.0: [drm] Injected failure, disabling use of stolen memory
	i915 0000:03:00.0: [drm:init_stolen_lmem [i915]] Skip stolen region: failed to setup

Both GPUs are still available:

	$ sudo build/tools/lsgpu
	card1                    Intel Dg2 (Gen12)                 drm:/dev/dri/card1
	└─renderD129                                               drm:/dev/dri/renderD129
	card0                    Intel Tigerlake (Gen12)           drm:/dev/dri/card0
	└─renderD128                                               drm:/dev/dri/renderD128

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 6edf4e374f54..c5a4035c99cd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -494,26 +494,26 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 		drm_notice(&i915->drm,
 			   "%s, disabling use of stolen memory\n",
 			   "iGVT-g active");
-		return 0;
+		return -ENOSPC;
 	}
 
 	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
 		drm_notice(&i915->drm,
 			   "%s, disabling use of stolen memory\n",
 			   "DMAR active");
-		return 0;
+		return -ENOSPC;
 	}
 
 	if (adjust_stolen(i915, &mem->region))
-		return 0;
+		return -ENOSPC;
 
 	if (request_smem_stolen(i915, &mem->region))
-		return 0;
+		return -ENOSPC;
 
 	i915->dsm = mem->region;
 
 	if (init_reserved_stolen(i915))
-		return 0;
+		return -ENOSPC;
 
 	/* Exclude the reserved region from driver use */
 	mem->region.end = i915->dsm_reserved.start - 1;
@@ -527,7 +527,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 		(u64)i915->stolen_usable_size >> 10);
 
 	if (i915->stolen_usable_size == 0)
-		return 0;
+		return -ENOSPC;
 
 	/* Basic memrange allocator for stolen space. */
 	drm_mm_init(&i915->mm.stolen, 0, i915->stolen_usable_size);
@@ -765,11 +765,17 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
 
 static int init_stolen_smem(struct intel_memory_region *mem)
 {
+	int err;
+
 	/*
 	 * Initialise stolen early so that we may reserve preallocated
 	 * objects for the BIOS to KMS transition.
 	 */
-	return i915_gem_init_stolen(mem);
+	err = i915_gem_init_stolen(mem);
+	if (err)
+		drm_dbg(&mem->i915->drm, "Skip stolen region: failed to setup\n");
+
+	return 0;
 }
 
 static int release_stolen_smem(struct intel_memory_region *mem)
@@ -786,21 +792,25 @@ static const struct intel_memory_region_ops i915_region_stolen_smem_ops = {
 
 static int init_stolen_lmem(struct intel_memory_region *mem)
 {
+	struct drm_i915_private *i915 = mem->i915;
 	int err;
 
 	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
-		return -ENODEV;
+		return 0;
 
 	err = i915_gem_init_stolen(mem);
-	if (err)
-		return err;
+	if (err) {
+		drm_dbg(&mem->i915->drm, "Skip stolen region: failed to setup\n");
+		return 0;
+	}
 
-	if (mem->io_size && !io_mapping_init_wc(&mem->iomap,
-						mem->io_start,
-						mem->io_size)) {
-		err = -EIO;
+	if (mem->io_size &&
+	    !io_mapping_init_wc(&mem->iomap, mem->io_start, mem->io_size))
 		goto err_cleanup;
-	}
+
+	drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
+		&mem->io_start);
+	drm_dbg(&i915->drm, "Stolen Local DSM base: %pa\n", &mem->region.start);
 
 	return 0;
 
@@ -874,16 +884,6 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	if (IS_ERR(mem))
 		return mem;
 
-	/*
-	 * TODO: consider creating common helper to just print all the
-	 * interesting stuff from intel_memory_region, which we can use for all
-	 * our probed regions.
-	 */
-
-	drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
-		&mem->io_start);
-	drm_dbg(&i915->drm, "Stolen Local DSM base: %pa\n", &dsm_base);
-
 	intel_memory_region_set_name(mem, "stolen-local");
 
 	mem->private = true;
@@ -908,6 +908,7 @@ i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 	intel_memory_region_set_name(mem, "stolen-system");
 
 	mem->private = true;
+
 	return mem;
 }
 

-- 
b4 0.10.0-dev-bbe61
