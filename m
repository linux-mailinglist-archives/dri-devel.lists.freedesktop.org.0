Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E1340B85D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182906E5AE;
	Tue, 14 Sep 2021 19:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545E36E5AE;
 Tue, 14 Sep 2021 19:52:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="285805008"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="285805008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 12:52:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="516082450"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 12:52:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/i915/guc/slpc: remove unneeded clflush calls
Date: Tue, 14 Sep 2021 12:51:51 -0700
Message-Id: <20210914195151.560793-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clflush calls here aren't doing anything since we are not writting
something and flushing the cache lines to be visible to GuC. Here the
intention seems to be to make sure whatever GuC has written is visible
to the CPU before we read them. However a clflush from the CPU side is
the wrong instruction to use.

From code inspection on the other clflush() calls in i915/gt/uc/ these
are the only ones with this behavrior. The others are apparently making
sure what we write is visible to GuC.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 65a3e7fdb2b2..2e996b77df80 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -108,7 +108,6 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
 
 	GEM_BUG_ON(!slpc->vma);
 
-	drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
 	data = slpc->vaddr;
 
 	return data->header.global_state;
@@ -172,8 +171,6 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
 		drm_err(&i915->drm, "Failed to query task state (%pe)\n",
 			ERR_PTR(ret));
 
-	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
-
 	return ret;
 }
 
-- 
2.32.0

