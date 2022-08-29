Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B935A5399
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D228710EBA6;
	Mon, 29 Aug 2022 17:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDDE10EAB7;
 Mon, 29 Aug 2022 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661795690; x=1693331690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xmxv+Pu0Imb/F5VhPn4tJRxhmiEbcsBbBEpzCtxCAo=;
 b=jOYBbIlsGO6csjN7eHgDpDdaugEqABXThYz3nl+h9HP6wS4PnjXYQOKm
 Q1md/TrXPE6IRH/5DO4Xu7KeeLlCaz00C3gLq89bcf6xg1sDvhtZUwAs2
 ikciiGeUJRACDAGFOinMfZ5+N6unAleBH6mh/7Tp5w6gSsynCB9nh9v4U
 js5GBKeDe/h4C5fwF+l7O0CoaKOE7QQFwvFUmvb5rdFik3WATuvJ+Ls+H
 OxEz5KP1p+BO/TUvk+qqK55yBklA0DE8R6epwFgOVqpNH1aulcKq4/nfv
 IRikGYhAIkbwqPFh+4C4uYqtuYxzF/sqSMegXMmEo5/c9Y28eD3PcAfVa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381246660"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; d="scan'208";a="381246660"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="562297212"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/i915: Use managed allocations for extra uncore objects
Date: Mon, 29 Aug 2022 10:02:33 -0700
Message-Id: <20220829170238.969875-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829170238.969875-1-matthew.d.roper@intel.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're slowly transitioning the init-time kzalloc's of the driver over to
DRM-managed allocations; let's make sure the uncore objects allocated
for non-root GTs are thus allocated.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index a82b5e2e0d83..cf7aab7adb30 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -783,7 +783,7 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
 	if (!gt_is_root(gt)) {
 		struct intel_uncore *uncore;
 
-		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
+		uncore = drmm_kzalloc(&gt->i915->drm, sizeof(*uncore), GFP_KERNEL);
 		if (!uncore)
 			return -ENOMEM;
 
@@ -808,10 +808,8 @@ intel_gt_tile_cleanup(struct intel_gt *gt)
 {
 	intel_uncore_cleanup_mmio(gt->uncore);
 
-	if (!gt_is_root(gt)) {
-		kfree(gt->uncore);
+	if (!gt_is_root(gt))
 		kfree(gt);
-	}
 }
 
 int intel_gt_probe_all(struct drm_i915_private *i915)
-- 
2.37.2

