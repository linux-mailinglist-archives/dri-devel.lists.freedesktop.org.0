Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF947C01611
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 15:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3153010E0FC;
	Thu, 23 Oct 2025 13:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKxVrkX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F9810E0FC;
 Thu, 23 Oct 2025 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761226095; x=1792762095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4cqi1x4c41S6cW4GnZ0tACMSLTNxgntizPrRco8PXFA=;
 b=oKxVrkX1ec9QGOQfM0NAGE9AGgDRZAHbxAQPeBwA2mGgJJWk08OVDM4f
 Qlne2Mzi2vF6ZITP+zqRDLhzlUQgSxiM5jAtAAFiT5P0x6O7pg28Xaje0
 70eVgzSngHDlz4MZRzo44piJJTr8+Q0Xx+nem9IugzVFgI1MnwTlFZcCv
 UXF0LlF1LyF3t4hqfSum7/xI6XV7Wy6VO2QUauqPV6Pa26oi+b2re+NSx
 yW7pL5YPfSOydKGWs20vrYeet+Qz3fXpN0/Hu26/hMFxMSajLS0BLwNIa
 yOUui9G48Z6SID4NH79qrpBpjXd3LMBeUI9OThx4OWffF5zpu8H8pMEHa Q==;
X-CSE-ConnectionGUID: 2tD1xdtPRkaDjG1xj52dBw==
X-CSE-MsgGUID: GDKpJC9PRPOYQWKCHN/XAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63301455"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63301455"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:28:15 -0700
X-CSE-ConnectionGUID: oOhlcB89SH+z9+ZXGahWwA==
X-CSE-MsgGUID: 9141FoWRTz+KPNj4Yg4QIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="188213683"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:28:12 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Subject: [PATCH] drm/i915/gt: Use standard API for seqcount read in TLB
 invalidation
Date: Thu, 23 Oct 2025 15:28:02 +0200
Message-ID: <20251023132802.654061-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

seqprop_sequence() is not intended for use outside seqlock.h.
Although it is accessible as a macro, it is meant to be used only
internally within the header.

Replace it with its proper wrapper, raw_read_seqcount().

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Co-developed-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Christoph Lameter (Ampere) <cl@gentwo.org>
---
Hi,

this patch fixes an issue that came up during Christoph's
work[*], which made his series trickier to move forward.

I also added Jani to the chain of tags, since I later noticed he
had suggested the same thing. Joonas had some concerns about this
approach possibly introducing locking issues, so I ran a few
tests before posting to make sure everything behaves as
expected[**].

There could still be a more refined way to handle the seqcount
for TLB invalidation using raw_seqcount_try_begin() and
read_seqcount_retry(), but that would need a fair bit of
refactoring, and I am not sure it would bring enough benefit.

Thanks,
Andi

[*] https://lore.kernel.org/all/20240912-seq_optimize-v3-1-8ee25e04dffa@gentwo.org/
[**] https://patchwork.freedesktop.org/series/155638/

 drivers/gpu/drm/i915/gt/intel_tlb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.h b/drivers/gpu/drm/i915/gt/intel_tlb.h
index 337327af92ac..ec7612216248 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.h
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.h
@@ -18,7 +18,7 @@ void intel_gt_fini_tlb(struct intel_gt *gt);
 
 static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
 {
-	return seqprop_sequence(&gt->tlb.seqno);
+	return raw_read_seqcount(&gt->tlb.seqno);
 }
 
 static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
-- 
2.51.0

