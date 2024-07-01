Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048E291E431
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 17:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0422910E471;
	Mon,  1 Jul 2024 15:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHD98ZVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0410210E46D;
 Mon,  1 Jul 2024 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719847969; x=1751383969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVL+wcmayVrZfgSrFL0JdS8HmgNZ5w1ywa4tgvPa3qM=;
 b=dHD98ZVABCys+Bzx8emK6PA+Qk2mHIVDbS3uXcbwvps0Tq/2ulY/1Kx7
 5QU8puf8yhQ81yED9NgV/w7whZ/5T/osZFKkUOM1u3w3HQKKDvW3FuABa
 K33yKB/50qsadMZ4woLEvMkAiugOAijVrTm7xmgKc2isGa+3RYvV49fSS
 /Yu5LlDJ1VgMotgc1/nIw2jz9fZWmUtCQEXjd91bWy7S2JFn7IF0IuNQr
 phgPobXR8DYR04EemXmsoZdYf6qfKadyeEFkLZt5d25U/MhV7Hg0F7XlE
 0pPaLDBSlZPNm4O8ONOH4eEiGCFPSN8LqLycqQ2WWsM0O3rG6FgmwwqTD A==;
X-CSE-ConnectionGUID: mhf0SutgRgyZwoHv9As41Q==
X-CSE-MsgGUID: gt4dCvB9SK6RksIaQWbqqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34527125"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="34527125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:32:48 -0700
X-CSE-ConnectionGUID: j239LkcRSf2xdjEYXEUpqw==
X-CSE-MsgGUID: HVgVCdPKTtaSUWVVdBCSgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="49912463"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:32:46 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 4/4] drm/xe/lnl: Offload system clear page activity to GPU
Date: Mon,  1 Jul 2024 17:17:38 +0200
Message-ID: <20240701151738.6749-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240701151738.6749-1-nirmoy.das@intel.com>
References: <20240701151738.6749-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

On LNL because of flat CCS, driver creates a migrate job to clear
CCS meta data. Extend that to also clear system pages using GPU.
Inform TTM to allocate pages without __GFP_ZERO to avoid double page
clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
clearn-on-free as XE now takes care of clearing pages. If a bo
is in system placement and there is a cpu map then for such BO gpu
clear will be avoided as there is no dma mapping for such BO.

To test the patch, created a small test that tries to submit a job
after binding various sizes of buffer which shows good gains for larger
buffer. For lower buffer sizes, the result is not very reliable as the
results vary a lot.

With the patch
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
Using IGT_SRANDOM=1719237905 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 9493 us
Time taken for size SZ_2M: 5503 us
Time taken for size SZ_64M: 13016 us
Time taken for size SZ_128M: 29464 us
Time taken for size SZ_256M: 38408 us
Time taken for size SZ_1G: 148758 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 3889 us
Time taken for size SZ_2M: 6091 us
Time taken for size SZ_64M: 20920 us
Time taken for size SZ_128M: 32394 us
Time taken for size SZ_256M: 61710 us
Time taken for size SZ_1G: 215437 us
Subtest basic-store-benchmark: SUCCESS (0.589s)

With the patch:
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
Using IGT_SRANDOM=1719238062 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 11803 us
Time taken for size SZ_2M: 4237 us
Time taken for size SZ_64M: 8649 us
Time taken for size SZ_128M: 14682 us
Time taken for size SZ_256M: 22156 us
Time taken for size SZ_1G: 74457 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 5129 us
Time taken for size SZ_2M: 12563 us
Time taken for size SZ_64M: 14860 us
Time taken for size SZ_128M: 26064 us
Time taken for size SZ_256M: 47167 us
Time taken for size SZ_1G: 170304 us
Subtest basic-store-benchmark: SUCCESS (0.417s)

With the patch and init_on_alloc=0
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
Using IGT_SRANDOM=1719238219 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 4803 us
Time taken for size SZ_2M: 9212 us
Time taken for size SZ_64M: 9643 us
Time taken for size SZ_128M: 13479 us
Time taken for size SZ_256M: 22429 us
Time taken for size SZ_1G: 83110 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 4003 us
Time taken for size SZ_2M: 4443 us
Time taken for size SZ_64M: 12960 us
Time taken for size SZ_128M: 13741 us
Time taken for size SZ_256M: 26841 us
Time taken for size SZ_1G: 84746 us
Subtest basic-store-benchmark: SUCCESS (0.290s)

v2: Handle regression on dgfx(Himal)
    Update commit message as no ttm API changes needed.
v3: Fix Kunit test.
v4: handle data leak on cpu mmap(Thomas)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4d6315d2ae9a..b76a44fcf3b1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -387,6 +387,13 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
+	/* If the device can support gpu clear pages then set proper ttm
+	 * flag. Zeroed pages are only required for ttm_bo_type_device so
+	 * unwanted data is leaked to userspace.
+	 */
+	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear)
+		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
@@ -408,6 +415,10 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return 0;
 
+	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear pages */
+	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
+		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
+
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
 	if (err)
 		return err;
@@ -653,6 +664,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	int ret = 0;
 
+	/*
+	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
+	 * moving to system as the bo doesn't dma_mapping.
+	 */
+	if (!old_mem && ttm && !ttm_tt_is_populated(ttm)) {
+		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -676,7 +695,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
 
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
-		(!ttm && ttm_bo->type == ttm_bo_type_device);
+		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
+		(ttm && ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
 
 	if (new_mem->mem_type == XE_PL_TT) {
 		ret = xe_tt_map_sg(ttm);
@@ -790,6 +810,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 					 handle_system_ccs;
 			bool clear_bo_data = mem_type_is_vram(new_mem->mem_type);
 
+			if (ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE))
+				clear_bo_data |= true;
+
 			fence = xe_migrate_clear(migrate, bo, new_mem,
 						 clear_bo_data, clear_ccs);
 		}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..293579e35c2e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -636,6 +636,13 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	/**
+	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
+	 * and use GPU to clear pages as well.
+	 */
+	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
+		xe->mem.gpu_page_clear = true;
+
 	err = xe_vram_probe(xe);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..ece68c6f3668 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -325,6 +325,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @gpu_page_clear: clear pages offloaded to GPU */
+		bool gpu_page_clear;
 	} mem;
 
 	/** @sriov: device level virtualization data */
-- 
2.42.0

