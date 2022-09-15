Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3C5BA1E8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 22:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2BE10EBD6;
	Thu, 15 Sep 2022 20:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEF410E2C9;
 Thu, 15 Sep 2022 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663274382; x=1694810382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mq0tNrEXWLEZp88frDCzSuoKakeRjY5/tOpz4mZ+xhc=;
 b=JCkV3Ja1TS6CgiCd+ioGH9daqU+42mxXG6RfnKR8xMKmAr0F+qMNoKH4
 Eg0g8GCdJfGN3UuerifLNaSeQEoVkyqG1mqKDXw2sjDBne6n7W80F79Nw
 hFroHV+EksxTVIiq7U+dT62vcoMDrrYK/87KntVxFyzJnLshUrTtIGwbG
 RTq8blV1ASqOa09sbhTIp5OndEOq3SldOYojWxlGYlRoRHzZp3NBk/FGW
 yZlMBDXY2fg6gXcqaNBOC++EuvqYbHXAa6gZcu4hkVNpNfE310ZslQ4dB
 gZbTTL+xj3GoaI04938vnaMZxBN0JDF2cqIzwVp4xE1UX9kwRcGxmfH22 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="300193626"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="300193626"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="647991385"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 4/4] drm/i915/dgfx: Make failure to setup stolen non-fatal
Date: Thu, 15 Sep 2022 13:39:08 -0700
Message-Id: <20220915-stolen-v1-4-117c5f295bb2@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
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
Cc: tejas.upadhyay@intel.com, aravind.iddamsetty@intel.com,
 dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
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
index 0e57a6d81534..4f1bac7ce522 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -493,26 +493,26 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
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
@@ -526,7 +526,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 		(u64)i915->stolen_usable_size >> 10);
 
 	if (i915->stolen_usable_size == 0)
-		return 0;
+		return -ENOSPC;
 
 	/* Basic memrange allocator for stolen space. */
 	drm_mm_init(&i915->mm.stolen, 0, i915->stolen_usable_size);
@@ -764,11 +764,17 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
 
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
@@ -785,21 +791,25 @@ static const struct intel_memory_region_ops i915_region_stolen_smem_ops = {
 
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
 
@@ -873,16 +883,6 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
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
@@ -907,6 +907,7 @@ i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 	intel_memory_region_set_name(mem, "stolen-system");
 
 	mem->private = true;
+
 	return mem;
 }
 

-- 
b4 0.10.0-dev-bbe61
