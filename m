Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC613FE6CE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8B06E422;
	Thu,  2 Sep 2021 00:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500A56E42A;
 Thu,  2 Sep 2021 00:52:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198468250"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="198468250"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030172"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 07/25] Revert "drm/i915/gt: Propagate change in error
 status to children on unhold"
Date: Wed,  1 Sep 2021 17:50:04 -0700
Message-Id: <20210902005022.711767-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
References: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Propagating errors to dependent fences is broken and can lead to
errors from one client ending up in another.  In 3761baae908a (Revert
"drm/i915: Propagate errors on awaiting already signaled fences"), we
attempted to get rid of fence error propagation but missed the case
added in 8e9f84cf5cac ("drm/i915/gt: Propagate change in error status
to children on unhold").  Revert that one too.  This error was found
by an up-and-coming selftest which triggers a reset during request
cancellation and verifies that subsequent requests complete
successfully.

v2:
 (Daniel Vetter)
  - Use revert
v3:
 (Jason)
  - Update commit message

References: '3761baae908a ("Revert "drm/i915: Propagate errors on awaiting already signaled fences"")'
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de5f9c86b9a4..cafb0608ffb4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2140,10 +2140,6 @@ static void __execlists_unhold(struct i915_request *rq)
 			if (p->flags & I915_DEPENDENCY_WEAK)
 				continue;
 
-			/* Propagate any change in error status */
-			if (rq->fence.error)
-				i915_request_set_error_once(w, rq->fence.error);
-
 			if (w->engine != rq->engine)
 				continue;
 
-- 
2.25.1

