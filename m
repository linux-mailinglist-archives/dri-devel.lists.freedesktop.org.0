Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A803B27C3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7C06EA19;
	Thu, 24 Jun 2021 06:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1C46E9FB;
 Thu, 24 Jun 2021 06:47:30 +0000 (UTC)
IronPort-SDR: 6ITdXdFCnYqwlfweMTVgkdOFnDfKbvu1Ce6IrynpcioRlItODC0i5oZVA7AcSb7qcyjmkZpG5P
 Gu9X+kVS2mFA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346756"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346756"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
IronPort-SDR: cWdNjx6p9ZAe1RZcqr+K+4eexy8DpxEISIHFI6uLXckZKYp0tQTXrsfAim44j+PMybJb6K931X
 4mkogXO6sSiw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390911"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/47] drm/i915/guc: Disable engine barriers with GuC during
 unpin
Date: Thu, 24 Jun 2021 00:04:45 -0700
Message-Id: <20210624070516.21893-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable engine barriers for unpinning with GuC. This feature isn't
needed with the GuC as it disables context scheduling before unpinning
which guarantees the HW will not reference the context. Hence it is
not necessary to defer unpinning until a kernel context request
completes on each engine in the context engine mask.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
 drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 1499b8aace2a..7f97753ab164 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -80,7 +80,7 @@ static int intel_context_active_acquire(struct intel_context *ce)
 
 	__i915_active_acquire(&ce->active);
 
-	if (intel_context_is_barrier(ce))
+	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
 		return 0;
 
 	/* Preallocate tracking nodes */
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 8a7199afbe61..a592a9605dc8 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -16,6 +16,7 @@
 #include "intel_engine_types.h"
 #include "intel_ring_types.h"
 #include "intel_timeline_types.h"
+#include "uc/intel_guc_submission.h"
 
 #define CE_TRACE(ce, fmt, ...) do {					\
 	const struct intel_context *ce__ = (ce);			\
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 26685b927169..fa7b99a671dd 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -209,7 +209,13 @@ static int __live_active_context(struct intel_engine_cs *engine)
 	 * This test makes sure that the context is kept alive until a
 	 * subsequent idle-barrier (emitted when the engine wakeref hits 0
 	 * with no more outstanding requests).
+	 *
+	 * In GuC submission mode we don't use idle barriers and we instead
+	 * get a message from the GuC to signal that it is safe to unpin the
+	 * context from memory.
 	 */
+	if (intel_engine_uses_guc(engine))
+		return 0;
 
 	if (intel_engine_pm_is_awake(engine)) {
 		pr_err("%s is awake before starting %s!\n",
@@ -357,7 +363,11 @@ static int __live_remote_context(struct intel_engine_cs *engine)
 	 * on the context image remotely (intel_context_prepare_remote_request),
 	 * which inserts foreign fences into intel_context.active, does not
 	 * clobber the idle-barrier.
+	 *
+	 * In GuC submission mode we don't use idle barriers.
 	 */
+	if (intel_engine_uses_guc(engine))
+		return 0;
 
 	if (intel_engine_pm_is_awake(engine)) {
 		pr_err("%s is awake before starting %s!\n",
-- 
2.28.0

