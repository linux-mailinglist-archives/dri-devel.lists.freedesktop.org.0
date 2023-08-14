Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423377BFBF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 20:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899AC10E22B;
	Mon, 14 Aug 2023 18:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CFA10E227;
 Mon, 14 Aug 2023 18:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692037490; x=1723573490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6/VZE0QiZRg3maE1DBF7zUid/KLNXtFeml20jQbumhM=;
 b=hdEdfELygFxNouzEJ9XEliFbI//nb95VEmfj83Z1f34EZqwA8TXsjbN3
 g1/pbPMKZMSifQofp7sevYgW58Ch+CzQ1g0BEFgMQJ/4necGYgsy4dPVL
 AdLTAASqWvSJ4r93ycHK6ORggxYn4DvQ5t9JSIcLiCBSyJVvMnYIpJO5l
 1xO01nSvWYYsJqVv2iyNNXcEnkOoN9yANtZDMpFO3smY9S3JqgnuOC1KG
 Vzc3g16qvNGtVqRHQGOBxHOgeR0ouKANWpWYj79nvtreCqTC5COa487g/
 qSS+C2En5xzgwv7WxD7hGCMnMEWi/U9DBOaNHuV0x/xBBPgrCbXzT72Nl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369581296"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="369581296"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 11:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="857163312"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="857163312"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 14 Aug 2023 11:24:49 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1] drm/i915: Fix TLB-Invalidation seqno store
Date: Mon, 14 Aug 2023 11:24:49 -0700
Message-Id: <20230814182449.1060747-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When getting the next gt's seqno to be stored into an
objects mm.tlb[gt_id] array, fix the retrieval code
to get it from the correct gt instead of the same one.

Fixes: d6c531ab4820 ("drm/i915: Invalidate the TLBs on each GT")
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index e52089564d79..6f180ee13853 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1356,7 +1356,7 @@ void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb)
 	 */
 	for_each_gt(gt, vm->i915, id)
 		WRITE_ONCE(tlb[id],
-			   intel_gt_next_invalidate_tlb_full(vm->gt));
+			   intel_gt_next_invalidate_tlb_full(gt));
 }
 
 static void __vma_put_pages(struct i915_vma *vma, unsigned int count)

base-commit: 85f20fb339f05ec4221bb295c13e46061c5c566f
-- 
2.39.0

