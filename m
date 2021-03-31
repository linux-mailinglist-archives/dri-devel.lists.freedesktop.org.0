Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF234FDE9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FB96EA41;
	Wed, 31 Mar 2021 10:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431D46EA3F;
 Wed, 31 Mar 2021 10:18:59 +0000 (UTC)
IronPort-SDR: DmR3bRjAvosPEQPQjGNkAg+jHRVzD0bvsqnqJxNVokqNgxgUiHAG1XtTdi976CQrLz4WFD2/sT
 tvtPfMqMnUzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179513098"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="179513098"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:18:58 -0700
IronPort-SDR: nPc79oCqF14vZIrI0lHZKX9CilJjpjC4uRpu3LS8zVcSAvg9QQ3/s+JcRaHPQW61vIBkEyRk82
 rTcFY48cqEeg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418602187"
Received: from jlowe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.201.218])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:18:57 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pmu: Check actual RC6 status
Date: Wed, 31 Mar 2021 11:18:50 +0100
Message-Id: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Eero T Tamminen <eero.t.tamminen@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

RC6 support cannot be simply established by looking at the static device
HAS_RC6() flag. There are cases which disable RC6 at driver load time so
use the status of those check when deciding whether to enumerate the rc6
counter.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 41651ac255fa..a75cd1db320b 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -476,6 +476,8 @@ engine_event_status(struct intel_engine_cs *engine,
 static int
 config_status(struct drm_i915_private *i915, u64 config)
 {
+	struct intel_gt *gt = &i915->gt;
+
 	switch (config) {
 	case I915_PMU_ACTUAL_FREQUENCY:
 		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
@@ -489,7 +491,7 @@ config_status(struct drm_i915_private *i915, u64 config)
 	case I915_PMU_INTERRUPTS:
 		break;
 	case I915_PMU_RC6_RESIDENCY:
-		if (!HAS_RC6(i915))
+		if (!gt->rc6.supported)
 			return -ENODEV;
 		break;
 	case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
