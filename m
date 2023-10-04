Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F537B7E74
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 13:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820AD10E002;
	Wed,  4 Oct 2023 11:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E5210E002;
 Wed,  4 Oct 2023 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696420144; x=1727956144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ALAKMlfb0feQVeKuHI5P4D4nGOKl3RymOvpE+8IODNA=;
 b=HE3x5g8dzZMHzJOxPSROg731gs0tEpVVFT/cjFoaTEQSMXy3+toMn7rO
 fmzy3tXGyuJh5JLeQg4ineWaeQh/LFyjGH9BYQHT9z9XuCiRPrBkXkPjY
 AI2Rg4ZbVVLHkZtMmR1TGQdzmFxa+E0zr01nYJkoNTqU5xr9krZNR88N9
 tW1fxNnViLh7kBimTvPpQbhx70cbFNQKO6YKNu9FmTsW4QrjwRX6kajLU
 MH/TgBQgv06ZsZYGnAnx2T2odjA+leUQy1r9Yi08obneLSmI6skVb5Gn0
 FY2NmYcL6egOL3QIoh9a3DUHzQLjPShO+kdRQPTyd/c9BrbACVjyN4BMD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="4703423"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="4703423"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 04:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="817059227"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="817059227"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 04:49:01 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Reduce MCR lock surface
Date: Wed,  4 Oct 2023 13:48:54 +0200
Message-ID: <20231004114854.23237-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Take the mcr lock only when driver needs to write into a mcr based
tlb based registers.

To prevent GT reset interference, employ gt->reset.mutex instead, since
intel_gt_mcr_multicast_write relies on gt->uncore->lock not being held.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_tlb.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
index 139608c30d97..7b2d9549e595 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.c
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
@@ -59,8 +59,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 
-	intel_gt_mcr_lock(gt, &flags);
-	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
+	mutex_lock(&gt->reset.mutex);/* serialise invalidate with GT reset */
 
 	awake = 0;
 	for_each_engine(engine, gt, id) {
@@ -68,9 +67,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 			continue;
 
 		if (engine->tlb_inv.mcr)
-			intel_gt_mcr_multicast_write_fw(gt,
-							engine->tlb_inv.reg.mcr_reg,
-							engine->tlb_inv.request);
+			intel_gt_mcr_multicast_write(gt,
+						     engine->tlb_inv.reg.mcr_reg,
+						     engine->tlb_inv.request);
 		else
 			intel_uncore_write_fw(uncore,
 					      engine->tlb_inv.reg.reg,
@@ -90,8 +89,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	     IS_ALDERLAKE_P(i915)))
 		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
 
-	spin_unlock(&uncore->lock);
-	intel_gt_mcr_unlock(gt, flags);
+	mutex_unlock(&gt->reset.mutex);
 
 	for_each_engine_masked(engine, gt, awake, tmp) {
 		if (wait_for_invalidate(engine))
-- 
2.41.0

