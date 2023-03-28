Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A76CB320
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 03:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E5510E288;
	Tue, 28 Mar 2023 01:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BC810E285;
 Tue, 28 Mar 2023 01:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679966680; x=1711502680;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tYmLQA5TDPa/4sjnwTsQ75KfzRZFycJ7TGfbae2a2vE=;
 b=Hts58JeiBFYyb2O1AyhCSSwEFkwf/3h1VPnmh9fr4E55xlk8HAMIBMyM
 Ix+pGv6IhhIsbYaUR3o/uAAVUtxyBRKgOgSaknWn56jate3tQ6Dj8Q/9o
 REl9UfEK89YfiHlELQPFqDPreuKPGnNtCRn665UiZxCNkzSDPN4rz+4Z9
 9G0DqgQLBaG1BEcxeKVHItBXMWPHXsDE7fhue7ZN+vY3l7ebZh+OTucUI
 J9ehnnu4vZZ6xaBIhWXaCpXGKmA5C1vn8BUMpfEW6WIUaNzJ+JxNNPHQs
 U3/U9vR0WtoIy/IorqK2Qx44kch/vHlGrEGjRvW/EI7Bl0wTGtiWxhKLw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="368194664"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="368194664"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 18:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="807687817"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="807687817"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 18:24:39 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Fix MTL stolen memory GGTT mapping
Date: Mon, 27 Mar 2023 18:24:30 -0700
Message-Id: <20230328012430.2524330-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Fei Yang <fei.yang@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PTEs expect the offset from the base of the fake LMEM region (i.e.
the base of stolen) and not from the base of the DSM. Quoting the specs:
"Driver will set the Device Memory bit = 1 in the PTE when pointing to a
page in DSM and program the PTE with offset from LMEM_BAR. Device Memory
Offset from LMEM_BAR is same as offset from BGSM."

DSM starts 8MBs from BGSM, so we set dsm_base = 8MB.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---

I've omitted the fixes tag from the commit message since MTL is still
under force_probe, so there isn't really any need to propagate the fixes,
but here it is for reference:

Fixes: dbb2ffbfd708 ("drm/i915/mtl: enable local stolen memory")

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index d8e06e783e30..8ac376c24aa2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -890,8 +890,9 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	if (HAS_LMEMBAR_SMEM_STOLEN(i915)) {
 		/*
 		 * MTL dsm size is in GGC register.
-		 * Also MTL uses offset to DSMBASE in ptes, so i915
-		 * uses dsm_base = 0 to setup stolen region.
+		 * Also MTL uses offset to GSMBASE in ptes, so i915
+		 * uses dsm_base = 8MBs to setup stolen region, since
+		 * DSMBASE = GSMBASE + 8MB.
 		 */
 		ret = mtl_get_gms_size(uncore);
 		if (ret < 0) {
@@ -899,11 +900,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 			return ERR_PTR(ret);
 		}
 
-		dsm_base = 0;
+		dsm_base = SZ_8M;
 		dsm_size = (resource_size_t)(ret * SZ_1M);
 
 		GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) != SZ_256M);
-		GEM_BUG_ON((dsm_size + SZ_8M) > lmem_size);
+		GEM_BUG_ON((dsm_base + dsm_size) > lmem_size);
 	} else {
 		/* Use DSM base address instead for stolen memory */
 		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
@@ -912,14 +913,12 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
 	}
 
-	io_size = dsm_size;
-	if (HAS_LMEMBAR_SMEM_STOLEN(i915)) {
-		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + SZ_8M;
-	} else if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
+	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
 		io_start = 0;
 		io_size = 0;
 	} else {
 		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
+		io_size = dsm_size;
 	}
 
 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
-- 
2.37.3

