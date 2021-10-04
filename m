Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB034219B9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828D46E233;
	Mon,  4 Oct 2021 22:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BDC6E223;
 Mon,  4 Oct 2021 22:11:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248854264"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="248854264"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735460"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 04/26] drm/i915/guc: Don't call switch_to_kernel_context with
 GuC submission
Date: Mon,  4 Oct 2021 15:06:15 -0700
Message-Id: <20211004220637.14746-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

Calling switch_to_kernel_context isn't needed if the engine PM reference
is taken while all user contexts are pinned as if don't have PM ref that
guarantees that all user contexts scheduling is disabled. By not calling
switch_to_kernel_context we save on issuing a request to the engine.

v2:
 (Daniel Vetter)
  - Add FIXME comment about pushing switch_to_kernel_context to backend
v3:
 (John Harrison)
  - Update commit message
  - Fix workding comment

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index dacd62773735..a1334b48dde7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -162,6 +162,19 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
 	unsigned long flags;
 	bool result = true;
 
+	/*
+	 * This is execlist specific behaviour intended to ensure the GPU is
+	 * idle by switching to a known 'safe' context. With GuC submission, the
+	 * same idle guarantee is achieved by other means (disabling
+	 * scheduling). Further, switching to a 'safe' context has no effect
+	 * with GuC submission as the scheduler can just switch back again.
+	 *
+	 * FIXME: Move this backend scheduler specific behaviour into the
+	 * scheduler backend.
+	 */
+	if (intel_engine_uses_guc(engine))
+		return true;
+
 	/* GPU is pointing to the void, as good as in the kernel context. */
 	if (intel_gt_is_wedged(engine->gt))
 		return true;
-- 
2.32.0

