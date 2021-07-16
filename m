Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42D3CBD0A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAC96E9E0;
	Fri, 16 Jul 2021 19:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B092C6E9D9;
 Fri, 16 Jul 2021 19:59:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596719"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596719"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238912"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/51] drm/i915/guc: Disable semaphores when using GuC
 scheduling
Date: Fri, 16 Jul 2021 13:16:46 -0700
Message-Id: <20210716201724.54804-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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

Semaphores are an optimization and not required for basic GuC submission
to work properly. Disable until we have time to do the implementation to
enable semaphores and tune them for performance. Also long direction is
just to delete semaphores from the i915 so another reason to not enable
these for GuC submission.

This patch fixes an existing bug where I915_ENGINE_HAS_SEMAPHORES was
not honored correctly.

v2: Reword commit message
v3:
 (John H)
  - Add text to commit indicating this also fixing an existing bug

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7d6f52d8a801..64659802d4df 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -799,7 +799,8 @@ static int intel_context_set_gem(struct intel_context *ce,
 	}
 
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
-	    intel_engine_has_timeslices(ce->engine))
+	    intel_engine_has_timeslices(ce->engine) &&
+	    intel_engine_has_semaphores(ce->engine))
 		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
 
 	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
@@ -1778,7 +1779,8 @@ static void __apply_priority(struct intel_context *ce, void *arg)
 	if (!intel_engine_has_timeslices(ce->engine))
 		return;
 
-	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
+	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
+	    intel_engine_has_semaphores(ce->engine))
 		intel_context_set_use_semaphores(ce);
 	else
 		intel_context_clear_use_semaphores(ce);
-- 
2.28.0

