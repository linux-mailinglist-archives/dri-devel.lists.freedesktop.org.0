Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DBC46C100
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A415EBEA5;
	Tue,  7 Dec 2021 16:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E1DEBEA2;
 Tue,  7 Dec 2021 16:52:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="224882439"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="224882439"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 08:52:22 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="611740131"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 08:52:19 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/i915/xehpsdv: set min page-size to 64K
Date: Tue,  7 Dec 2021 22:21:54 +0530
Message-Id: <20211207165156.31244-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207165156.31244-1-ramalingam.c@intel.com>
References: <20211207165156.31244-1-ramalingam.c@intel.com>
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
Cc: Andi <andi.shyti@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

LMEM should be allocated at 64K granularity, since 4K page support will
eventually be dropped for LMEM when using the PPGTT.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  | 6 +++++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 5 ++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index bce03d74a0b4..ba90ab47d838 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -780,6 +780,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	struct intel_uncore *uncore = &i915->uncore;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct intel_memory_region *mem;
+	resource_size_t min_page_size;
 	resource_size_t io_start;
 	resource_size_t lmem_size;
 	u64 lmem_base;
@@ -791,8 +792,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
 	io_start = pci_resource_start(pdev, 2) + lmem_base;
 
+	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
+						I915_GTT_PAGE_SIZE_4K;
+
 	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
-					 I915_GTT_PAGE_SIZE_4K, io_start,
+					 min_page_size, io_start,
 					 type, instance,
 					 &i915_region_stolen_lmem_ops);
 	if (IS_ERR(mem))
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 9ea49e0a27c0..fde2dcb59809 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -197,6 +197,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	struct intel_uncore *uncore = gt->uncore;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct intel_memory_region *mem;
+	resource_size_t min_page_size;
 	resource_size_t io_start;
 	resource_size_t lmem_size;
 	int err;
@@ -211,10 +212,12 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
 		return ERR_PTR(-ENODEV);
 
+	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
+						I915_GTT_PAGE_SIZE_4K;
 	mem = intel_memory_region_create(i915,
 					 0,
 					 lmem_size,
-					 I915_GTT_PAGE_SIZE_4K,
+					 min_page_size,
 					 io_start,
 					 INTEL_MEMORY_LOCAL,
 					 0,
-- 
2.20.1

