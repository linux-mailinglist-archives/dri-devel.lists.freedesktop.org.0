Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D286F1172
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 07:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3D010EC58;
	Fri, 28 Apr 2023 05:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6491110EC30;
 Fri, 28 Apr 2023 05:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682660793; x=1714196793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I8bBOBE2tRibyZSoE0eVxxJLlRgeLjMj4rXll4Vn914=;
 b=TKEkeG0ksERkWNnmKQed9J5FLsXn/hWtQIz/5m6En2/8JMJwpYxAjg90
 qtWRpZ4anf9CUs+Z2c8+LoYiiN601+0TNxUo14mJHfaKuNSQVc6ZDFk+H
 IqPUI4GjqjmnwOA7mHsSnLtIRoUmZFNBJEyZ358ef9GOEA9ba5Szycr63
 ssfnCba0pPz6Bf2h2Mub+YBlnJYxKZPel/BWaCOwSINqdMhAzqxovGRub
 3rbYnOvyrfH1cpOjG94C1lOYJFCNu/JfJp0eWMyFQs8N0GpPRze3EV3DA
 OqWG+4vew6/i71r/oj3sWLJx3BsE0jDkhKQeZzx+t0nWfCsZatlMHT50q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413040414"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="413040414"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806251814"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="806251814"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:46:32 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/i915: make sure correct pte encode is used
Date: Thu, 27 Apr 2023 22:47:35 -0700
Message-Id: <20230428054737.1765778-4-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428054737.1765778-1-fei.yang@intel.com>
References: <20230428054737.1765778-1-fei.yang@intel.com>
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
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index ee52e5833c50..81b7725812ce 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -55,9 +55,9 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 	return pte;
 }
 
-static u64 mtl_pte_encode(dma_addr_t addr,
-			  unsigned int pat_index,
-			  u32 flags)
+static u64 gen12_pte_encode(dma_addr_t addr,
+			    unsigned int pat_index,
+			    u32 flags)
 {
 	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
 
@@ -994,8 +994,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
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

