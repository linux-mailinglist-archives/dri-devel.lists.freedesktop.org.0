Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C1662578
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 13:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4192810E40F;
	Mon,  9 Jan 2023 12:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAAA10E410;
 Mon,  9 Jan 2023 12:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673267094; x=1704803094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/aEF7fXBsVDAYeWVnttiUoa/f30ZOZempg9ET9wmVDU=;
 b=c/C4d8OsA5fhzXub7k6G1SPl/Zlh0ol6cP1znrqov0qvaC4eB1aR4k7n
 +vKBoHU7+0kppGsrADvhgL3dEuq1x4LT8P2zLL3Q0Wl7VBpccGObbD4CO
 5yoHjDVMXBCeGqko2BR1gMAwJKeLbAXe2MvJv5UULOEkcB0lsJbE6kGg4
 rf/zAKZyxNgAKJVs8xJaGxSAkSskFNxEHzXfcNlHD1deypeGTtShaBq1q
 0wcSKCy/h5ZkmFen8UDczY5kIanqVuXE9JhwS32wC6/k0QjS7co/mORsb
 ErfoqGvVG3fdORvZui/Ryj0DJpahDjfLu/VjBFvH/ebvjgs2tXntTPpb+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="322936238"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="322936238"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 04:24:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="687186033"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="687186033"
Received: from lherman-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.209.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 04:24:52 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Do not cover all future platforms in TLB
 invalidation
Date: Mon,  9 Jan 2023 12:24:42 +0000
Message-Id: <20230109122442.713861-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
References: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Revert to the original explicit approach and document the reasoning
behind it.

v2:
 * DG2 needs to be covered too. (Matt)

v3:
 * Full version check for Gen12 to avoid catching all future platforms.
   (Matt)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 7eeee5a7cb33..5521fa057aab 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1070,10 +1070,23 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	unsigned int num = 0;
 	unsigned long flags;
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+	/*
+	 * New platforms should not be added with catch-all-newer (>=)
+	 * condition so that any later platform added triggers the below warning
+	 * and in turn mandates a human cross-check of whether the invalidation
+	 * flows have compatible semantics.
+	 *
+	 * For instance with the 11.00 -> 12.00 transition three out of five
+	 * respective engine registers were moved to masked type. Then after the
+	 * 12.00 -> 12.50 transition multi cast handling is required too.
+	 */
+
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
+	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
 		regs = NULL;
 		num = ARRAY_SIZE(xehp_regs);
-	} else if (GRAPHICS_VER(i915) == 12) {
+	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
+		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
 		regs = gen12_regs;
 		num = ARRAY_SIZE(gen12_regs);
 	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
-- 
2.34.1

