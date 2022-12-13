Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B964B549
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 13:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64CF10E1C1;
	Tue, 13 Dec 2022 12:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A07510E1C3;
 Tue, 13 Dec 2022 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670935168; x=1702471168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k7I6Dcl2sKHyS9GgzEXDkKJ0s/zPJV0OhvB6MFSO7zU=;
 b=O9w3eTOr/xcl64xgsMbTgT+CAoqtH5Hb0VQLNjc37SPWJnoRQnxDyap6
 1FvcveEnyp373oB6fmKCKHwK2skcimPxF7B+6NHDXjTwUcr5+gjlqQ/LV
 cm0G3Ltpcy6PRvKx4luYK/Y4xGhu0RvNcjVME8R22f/lnbkCKeXyeOiik
 Ax9cx97BRtB7wWVPNwuvmrC+LVWpe1bKqYmuW321TQDW7wWpJI9w75lLV
 qA5IES1XDrfO85m6L77EDfq2Pfun3GjUpu2NdTSlsrEmu3FdAw+q4zz7I
 J189V1CKHtvbZT0owbbGdyM7yTUJF8fU+amIOdo+Ks6Hnh1GDxSXjv0uh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="316822400"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="316822400"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:39:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="737375482"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="737375482"
Received: from lherman-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.234.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:39:26 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: fix TLB invalidation for Gen12.50 video and
 compute engines
Date: Tue, 13 Dec 2022 12:39:16 +0000
Message-Id: <20221213123917.4066375-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Hajda <andrzej.hajda@intel.com>

In case of Gen12.50 video and compute engines, TLB_INV registers are
masked - to modify one bit, corresponding bit in upper half of the register
must be enabled, otherwise nothing happens.

Fixes: 77fa9efc16a9 ("drm/i915/xehp: Create separate reg definitions for new MCR registers")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 63f95c5f3614..7eeee5a7cb33 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1100,9 +1100,15 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 			continue;
 
 		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+			u32 val = BIT(engine->instance);
+
+			if (engine->class == VIDEO_DECODE_CLASS ||
+			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
+			    engine->class == COMPUTE_CLASS)
+				val = _MASKED_BIT_ENABLE(val);
 			intel_gt_mcr_multicast_write_fw(gt,
 							xehp_regs[engine->class],
-							BIT(engine->instance));
+							val);
 		} else {
 			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
 			if (!i915_mmio_reg_offset(rb.reg))
-- 
2.34.1

