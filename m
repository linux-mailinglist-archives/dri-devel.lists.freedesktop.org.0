Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455B6D2EA9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 08:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B8E10F3B7;
	Sat,  1 Apr 2023 06:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E434910E130;
 Sat,  1 Apr 2023 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680331022; x=1711867022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AVZVgBdCwTnOerGH9xTkhr4j96mYigzWdIGQmA4T8e0=;
 b=UJECGUKxdljw++uiintNmoFLrcpWZw4Bo/TAz3FzTy9MZM0MQDh8X1N5
 Z6DF0Cak2KnVCU+x6kwOvoDhlDgOaVa5RFBd6vFtJ/BGNCGK9f8EE2n1G
 5gmywgrnD3trCBA1M2/VM37rK5JGCM9i0ma+Ur2lK9y8Q5O942MZpxpH7
 i1txh6pwbqwiEbehNlXfU4u2zx1FyNQm6kJvwcTZ/rHI+gzReFPhX9Kal
 GW3JNexMclFPpukEdsIfN4XS1ReXbW5KfP+E13iKLnQQuRGuVscOvh0x/
 l/v67FLC/IERsbGGpPxufaItqMb2+Td9jZi0f72VLNp4FUkOH/EHfjlrD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340349511"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="340349511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 23:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="635539636"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="635539636"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 23:37:00 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915: make sure correct pte encode is used
Date: Fri, 31 Mar 2023 23:38:29 -0700
Message-Id: <20230401063830.438127-7-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230401063830.438127-1-fei.yang@intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
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
Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
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

