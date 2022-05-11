Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0551522C50
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0758D10EA03;
	Wed, 11 May 2022 06:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C9210EC83;
 Wed, 11 May 2022 00:58:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="251594241"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="251594241"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:58:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="565919919"
Received: from ymmonter-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:58:29 -0700
From: Andi Shyti <andi.shyti@studenti.polito.it>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 3/3] drm/i915/gt: Skip TLB invalidation if the engine is
 not awake
Date: Wed, 11 May 2022 02:57:56 +0200
Message-Id: <20220511005756.113245-4-andi.shyti@studenti.polito.it>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511005756.113245-1-andi.shyti@studenti.polito.it>
References: <20220511005756.113245-1-andi.shyti@studenti.polito.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 May 2022 06:30:33 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andi Shyti <andi.shyti@linux.intel.com>

We want to check if the engine is awake first before invalidating
its cache.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 034182f85501b..a1dc9f4203c2b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -12,6 +12,7 @@
 #include "i915_drv.h"
 #include "intel_context.h"
 #include "intel_engine_regs.h"
+#include "intel_engine_pm.h"
 #include "intel_gt.h"
 #include "intel_gt_buffer_pool.h"
 #include "intel_gt_clock_utils.h"
@@ -1219,6 +1220,9 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 		const unsigned int timeout_ms = 4;
 		struct reg_and_bit rb;
 
+		if (!intel_engine_pm_is_awake(engine))
+			continue;
+
 		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
 		if (!i915_mmio_reg_offset(rb.reg))
 			continue;
-- 
2.36.1

