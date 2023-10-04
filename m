Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C441A7B7EA1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEBE10E108;
	Wed,  4 Oct 2023 12:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07110E108;
 Wed,  4 Oct 2023 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696421062; x=1727957062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zjpxRTYgJqVtre7Tj0qCwp0fkQ9Bjrbhc3TAa0X9RSM=;
 b=KmwHF6E0fIAfBPj2rVriv3s3PR71KvIOMpHLoyIYXGOmbD3z94WSIbGs
 PIZ82fpQTnTVfTctHFlhO+q2Fo1jjRncfQ713bsWWNAmLChwv/GSO9VSz
 bAKuZA4WTPItfUjpoB/CXsf8ARaodWECwQJx1ipqE9KHqWs8dZyMOmrpi
 MKRzqmAJ6UJNNNPHI10jk9GRFWjUFVBq26X7r7rsZpmAi55n5TZgOKhbP
 J4aQi74+3cMJF/TGkLaiX0wIyRK6+QMSFIwamgt+HWjKhLc5Pql29n461
 fgpC3/77silMo8RGhH+6qXcgJloU3/b4ZK/bu3ahMYUVq4JYtUws3wnx8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="414063318"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="414063318"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="817063984"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="817063984"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:04:19 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Reduce MCR lock surface
Date: Wed,  4 Oct 2023 14:04:07 +0200
Message-ID: <20231004120407.12251-1-nirmoy.das@intel.com>
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

v2: remove unused var, flags.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_tlb.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
index 139608c30d97..0ad905df4a98 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.c
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
@@ -52,15 +52,13 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	struct intel_engine_cs *engine;
 	intel_engine_mask_t awake, tmp;
 	enum intel_engine_id id;
-	unsigned long flags;
 
 	if (GRAPHICS_VER(i915) < 8)
 		return;
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 
-	intel_gt_mcr_lock(gt, &flags);
-	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
+	mutex_lock(&gt->reset.mutex);/* serialise invalidate with GT reset */
 
 	awake = 0;
 	for_each_engine(engine, gt, id) {
@@ -68,9 +66,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
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
@@ -90,8 +88,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	     IS_ALDERLAKE_P(i915)))
 		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
 
-	spin_unlock(&uncore->lock);
-	intel_gt_mcr_unlock(gt, flags);
+	mutex_unlock(&gt->reset.mutex);
 
 	for_each_engine_masked(engine, gt, awake, tmp) {
 		if (wait_for_invalidate(engine))
-- 
2.41.0

