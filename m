Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7274A366
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 19:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802CD10E483;
	Thu,  6 Jul 2023 17:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E26510E483;
 Thu,  6 Jul 2023 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688665629; x=1720201629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8EKGoFB6J0u1Xl6F2YIO8B8EFDZjRzo8QrLCi4hvoO4=;
 b=bSwDKzI6qHJ2YvjWnh0GvNE9Trqu0UggFoFqLLI9EW0zdrriCBkMcCs9
 E5cWJAI9S/Cmjrfd3h8wjQS2kjNHoczfAYJmJYzcP0/o6bNXoQV4eHjD5
 hW/q1Oryf2XAkZPqH3/B4J2XwtCZd5VdR8+CPC4KWb6EnpvUbJk2V64+p
 ursgGKkwMRoRJX4KHdpWUKEx0luYj93uTNnYGztnn+6R5dc/VDm6A+/u6
 06K1lPQRWxas6AVZJICuwkom2IT405zW7OAskjl1Y4nTbd27enmNgQP+r
 AvDAo4IJXd8vMX/4gDOzAiPcKbpRexZZbgPUrKAvng8hRThN4v0LV6uWP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344005403"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="344005403"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 10:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="754835608"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="754835608"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by orsmga001.jf.intel.com with ESMTP; 06 Jul 2023 10:47:07 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Update cache coherency setting for context
 structure
Date: Thu,  6 Jul 2023 10:47:04 -0700
Message-Id: <20230706174704.177929-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As context structure is shared memory for CPU/GPU, Wa_22016122933 is
needed for this memory block as well.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
CC: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index a4ec20aaafe2..1b710102390b 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1092,8 +1092,15 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 
 	obj = i915_gem_object_create_lmem(engine->i915, context_size,
 					  I915_BO_ALLOC_PM_VOLATILE);
-	if (IS_ERR(obj))
+	if (IS_ERR(obj)) {
 		obj = i915_gem_object_create_shmem(engine->i915, context_size);
+		/*
+		 * Wa_22016122933: For MTL the shared memory needs to be mapped
+		 * as WC on CPU side and UC (PAT index 2) on GPU side
+		 */
+		if (IS_METEORLAKE(engine->i915))
+			i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+	}
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-- 
2.34.1

