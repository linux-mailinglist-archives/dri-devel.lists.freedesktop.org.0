Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46E6DA940
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 09:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284AC10ED9E;
	Fri,  7 Apr 2023 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D6510E28C;
 Fri,  7 Apr 2023 07:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680851484; x=1712387484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A4naRANSjsjYeplPa1kg1NbWiOttPOmgtjWLrvvRLew=;
 b=ZMaR3IA+lizOJ3JEDBYQ9Xb0iU/dfGth2UL2ySFe4FLRfpaYAJRoTNr2
 TKojxKqrSuT8SjG7aweYxPDGTKHbmWPg5WVohqPe/cd7UrHbmYdH0Lmp3
 2NZUe9dL8hKGBypEccJPQdfZJxlQH5tLM01jpkikuTdWGoyT+uT9QLz2k
 M6ggog3RO/T0H19qDg/+EYy4S6DfPeh6We0hcXegDWJM40CQtzH6oAsLQ
 jhzaFmWFwmDVCorKWasGuMuo4lz/4TdZqkJn/PG1Racv/R1vD5D6fwzcT
 3maq6ESbyh8O8+DkXAt13H57rfK8nXhILI5Pb660mp3SrCuO1cZF8q6EY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344711197"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="344711197"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 00:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680953431"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="680953431"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 00:11:12 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915: making mtl pte encode generic for gen12
Date: Fri,  7 Apr 2023 00:12:35 -0700
Message-Id: <20230407071236.1960642-8-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407071236.1960642-1-fei.yang@intel.com>
References: <20230407071236.1960642-1-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

PTE encode is platform dependent. After replacing cache_level with
pat_index, the newly introduced mtl_pte_encode is actually generic
for all gen12 platforms, thus rename it to gen12_pte_encode and
apply it to all gen12 platforms.

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index f76ec2cb29ef..e393e20b5894 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -60,7 +60,7 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 	return pte;
 }
 
-static u64 mtl_pte_encode(dma_addr_t addr,
+static u64 gen12_pte_encode(dma_addr_t addr,
 			  unsigned int pat_index,
 			  u32 flags)
 {
@@ -999,8 +999,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
 	 */
 	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
-	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
-		ppgtt->vm.pte_encode = mtl_pte_encode;
+	if (GRAPHICS_VER(gt->i915) >= 12)
+		ppgtt->vm.pte_encode = gen12_pte_encode;
 	else
 		ppgtt->vm.pte_encode = gen8_pte_encode;
 
-- 
2.25.1

