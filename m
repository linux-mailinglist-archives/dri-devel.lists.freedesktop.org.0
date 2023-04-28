Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4636F1161
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 07:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB2810EC4D;
	Fri, 28 Apr 2023 05:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19B210E390;
 Fri, 28 Apr 2023 05:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682660295; x=1714196295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I8bBOBE2tRibyZSoE0eVxxJLlRgeLjMj4rXll4Vn914=;
 b=eJnYK7RLfdrOrXGofd2x2xLc7NubEgi3hcN8Jj79gBo33sqBvgYFUiR9
 y/nPPjHMX7P5V6fGKzT117qw2DA8mwZANwF2IKasQVwtlau7q5BdAlKWy
 xODw9NKsqUvNr+0lN371nSBYoYBoVucEh10TAMjxc+C+X0N33vLShAV/G
 rVfDXLUxyhJcZVDPHaR7VG08MyG8+nN0ICyuCMua3YEpd/+vIYpd89fNQ
 4StZuCgh4NedovuMW7qP6fzKdbWpLgXrOSXhV6egYmev7Oxqntef78v5M
 HcvCXWrtJyf8N4yDzTDa63OvQA8pS+a03lgdWpGc/T0GQs4pv6U0vTKBJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345109200"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="345109200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838732003"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="838732003"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:38:14 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/i915: make sure correct pte encode is used
Date: Thu, 27 Apr 2023 22:39:17 -0700
Message-Id: <20230428053917.1765521-4-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428053917.1765521-1-fei.yang@intel.com>
References: <20230428053917.1765521-1-fei.yang@intel.com>
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

