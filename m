Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD76D222E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DECE10F243;
	Fri, 31 Mar 2023 14:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A71A10F23F;
 Fri, 31 Mar 2023 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680272213; x=1711808213;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=+Gw96Y45VrA7zDyfXk2bjg7K7rgD+aCxxfZVw9eX3Uw=;
 b=T1MUh1lAGOW1vgWzdMFiAmYHjba75wonb7Olxl6uBdgsdCkW56Mlo5OC
 6aAKBAVvJLDrmiSwxl+Q2ey+UkcNa1uvVT91Zt8mifgP1a2npyFcFJQ1j
 vSpBedIGv8YxrDKK/BQaBEQVJSmmIi5E9BDn0I1eHrjB2J37RIr+XoTb0
 ycsvmsjwZtU9LFa9JfWVuZa8qHAxQQsSbuKEaqvXpBRQF7RqUyrdB2Eht
 yluKtFZS1c2RTlArgeIQ9tlMybUTZ02X3y7J+W0a/Eh+Y0wSrswTNeGPI
 BHF39sQy6oWjRFDA0wsNP08gLiErB+IDNMdz5Ha1qYJVXSRFcPePekOTe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321113029"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321113029"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 07:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717730409"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="717730409"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 07:16:48 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 31 Mar 2023 16:16:36 +0200
Subject: [PATCH v2] drm/i915/gt: Hold a wakeref for the active VM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
X-B4-Tracking: v=1; b=H4sIAETrJmQC/42OSw6DIBRFt2IYl4aP0dhR99EYgvgoL1UxQGgb4
 96LrqDDc2/uZyMRAkIkt2ojATJG9EsBcamIcXp5AsWxMBFMSCYlo85Po3rrFwSwyvqgtEmYQeWZ
 tpZxqeu6AytJKRh0BDoEvRh3VIxhpgnXw1lLGD/n7KMv7DAmH77ni8wP9a/BzCmngza65aLphG3
 uuCSYrsbPpN/3/QdPBHkC3gAAAA==
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

There may be a disconnect between the GT used by the engine and the GT
used for the VM, requiring us to hold a wakeref on both while the GPU is
active with this request.

v2: added explanation to __queue_and_release_pm

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
[ahajda: removed not-yet-upstremed wakeref tracking bits]
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20230330-hold_wakeref_for_active_vm-v1-1-baca712692f6@intel.com
---
 drivers/gpu/drm/i915/gt/intel_context.h   | 15 +++++++++++----
 drivers/gpu/drm/i915/gt/intel_engine_pm.c |  9 +++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 0a8d553da3f439..48f888c3da083b 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -14,6 +14,7 @@
 #include "i915_drv.h"
 #include "intel_context_types.h"
 #include "intel_engine_types.h"
+#include "intel_gt_pm.h"
 #include "intel_ring_types.h"
 #include "intel_timeline_types.h"
 #include "i915_trace.h"
@@ -207,8 +208,11 @@ void intel_context_exit_engine(struct intel_context *ce);
 static inline void intel_context_enter(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->timeline->mutex);
-	if (!ce->active_count++)
-		ce->ops->enter(ce);
+	if (ce->active_count++)
+		return;
+
+	ce->ops->enter(ce);
+	intel_gt_pm_get(ce->vm->gt);
 }
 
 static inline void intel_context_mark_active(struct intel_context *ce)
@@ -222,8 +226,11 @@ static inline void intel_context_exit(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->timeline->mutex);
 	GEM_BUG_ON(!ce->active_count);
-	if (!--ce->active_count)
-		ce->ops->exit(ce);
+	if (--ce->active_count)
+		return;
+
+	intel_gt_pm_put_async(ce->vm->gt);
+	ce->ops->exit(ce);
 }
 
 static inline struct intel_context *intel_context_get(struct intel_context *ce)
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index e971b153fda976..ee531a5c142c77 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -114,6 +114,15 @@ __queue_and_release_pm(struct i915_request *rq,
 
 	ENGINE_TRACE(engine, "parking\n");
 
+	/*
+	 * Open coded one half of intel_context_enter, which we have to omit
+	 * here (see the large comment below) and because the other part must
+	 * not be called due constructing directly with __i915_request_create
+	 * which increments active count via intel_context_mark_active.
+	 */
+	GEM_BUG_ON(rq->context->active_count != 1);
+	__intel_gt_pm_get(engine->gt);
+
 	/*
 	 * We have to serialise all potential retirement paths with our
 	 * submission, as we don't want to underflow either the

---
base-commit: 3385d6482cd60f2a0bbb0fa97b70ae7dbba4f95c
change-id: 20230330-hold_wakeref_for_active_vm-7f013a449ef3

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>
