Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62B7C871E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF9110E5F0;
	Fri, 13 Oct 2023 13:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C389D10E5F0;
 Fri, 13 Oct 2023 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697204696; x=1728740696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aRKfFlyEoRw+GwUNjdp0UrKdmqHsUDgV308MuJE5oMA=;
 b=QRPm1CUz17QN7oETvY2nGolj2oHiViVOksq5RyOc9GZ/M0b/8R1cbo/A
 uufPQ3LdBMB8NMxUJi33XWydtKv30uROdC8t7VdWOcyvnUIP4ClLmLNTa
 VnHedjlVLNT6QcCSK/FaZ3oz1s3zQHMmaqM2B+bgYZsHpaULCymMy90cS
 f/4xdncOzOkHYyyABhqknB+ZKgs+8A+aCuGxBydnPFVByp07EPJ3cOXMh
 xmSjiTrUVgxYAedvaPbj69XGVQRXDoaDG24j8PkPQ7yH5tlsTtOXCWmlD
 eRhrTBSul1S80KH4N/Gzc3aBpzfw/BSW09ZhB6OQeJRWRVeOhMx3C/mFH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471422321"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="471422321"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="820632321"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="820632321"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:44:52 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Flush WC GGTT only on required platforms
Date: Fri, 13 Oct 2023 15:44:39 +0200
Message-ID: <20231013134439.13579-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gen8_ggtt_invalidate() is only needed for limited set of platforms
where GGTT is mapped as WC otherwise this can cause unwanted
side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
valid.

v2: Add a func to detect wc ggtt detection (Ville)

Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 35 +++++++++++++++++++---------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 4d7d88b92632..401667f83f96 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -195,6 +195,21 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
 	spin_unlock_irq(&uncore->lock);
 }
 
+static bool needs_wc_ggtt_mapping(struct drm_i915_private *i915)
+{
+	/*
+	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
+	 * will be dropped. For WC mappings in general we have 64 byte burst
+	 * writes when the WC buffer is flushed, so we can't use it, but have to
+	 * resort to an uncached mapping. The WC issue is easily caught by the
+	 * readback check when writing GTT PTE entries.
+	 */
+	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
+		return true;
+
+	return false;
+}
+
 static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
 {
 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
@@ -202,8 +217,12 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
 	/*
 	 * Note that as an uncached mmio write, this will flush the
 	 * WCB of the writes into the GGTT before it triggers the invalidate.
+	 *
+	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
 	 */
-	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
+	if (needs_wc_ggtt_mapping(ggtt->vm.i915))
+		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6,
+				      GFX_FLSH_CNTL_EN);
 }
 
 static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
@@ -1126,17 +1145,11 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	GEM_WARN_ON(pci_resource_len(pdev, GEN4_GTTMMADR_BAR) != gen6_gttmmadr_size(i915));
 	phys_addr = pci_resource_start(pdev, GEN4_GTTMMADR_BAR) + gen6_gttadr_offset(i915);
 
-	/*
-	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
-	 * will be dropped. For WC mappings in general we have 64 byte burst
-	 * writes when the WC buffer is flushed, so we can't use it, but have to
-	 * resort to an uncached mapping. The WC issue is easily caught by the
-	 * readback check when writing GTT PTE entries.
-	 */
-	if (IS_GEN9_LP(i915) || GRAPHICS_VER(i915) >= 11)
-		ggtt->gsm = ioremap(phys_addr, size);
-	else
+	if (needs_wc_ggtt_mapping(i915))
 		ggtt->gsm = ioremap_wc(phys_addr, size);
+	else
+		ggtt->gsm = ioremap(phys_addr, size);
+
 	if (!ggtt->gsm) {
 		drm_err(&i915->drm, "Failed to map the ggtt page table\n");
 		return -ENOMEM;
-- 
2.41.0

