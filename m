Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C6553012
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8814210FBDC;
	Tue, 21 Jun 2022 10:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B7D10FBDC;
 Tue, 21 Jun 2022 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808413; x=1687344413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBSDP90ckR8VRw0Pvhy1R6rqRgl/3m77HaTxtbiIdPA=;
 b=HxBqDrJb2QLB9yE1b63V43wa5eTIIbHNOTWJH83bd1bs23ftUJlQXkV0
 AkXwvolHJLIrsPs/hsoDWo3f1QiWX+obbgRcHbKkMopRaRy6RTnUS02Gd
 JZ2Kf8dQ1iocOAHPt22iPlxeexNYyVRMHRLT8Bn/y7WLO9AqdfNllAHmq
 QzbrUN3keNo17ai9ZSYpTU7P6iEy0Mb1yHo9jFIfdHyDmkZALSS6cFUJC
 fnnjeNHItj0awg9tilQFBy1V4oANdSeeJm1b74zCpU9HYMBTWGdwx1vbo
 rKf58Tmqn6/xZk7ZpcIJVlclT3if4t4mPX9TRSZgi+RfN+zyDEpetdYD8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121952"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121952"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327128"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/12] drm/i915/uapi: tweak error capture on recoverable
 contexts
Date: Tue, 21 Jun 2022 11:44:30 +0100
Message-Id: <20220621104434.190962-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621104434.190962-1-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A non-recoverable context must be used if the user wants proper error
capture on discrete platforms. In the future the kernel may want to blit
the contents of some objects when later doing the capture stage. Also
extend to newer integrated platforms.

v2(Thomas):
- Also extend to newer integrated platforms, for capture buffer memory
  allocation purposes.

Testcase: igt@gem_exec_capture@capture-recoverable
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 30fe847c6664..6ac88e2193f1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1951,7 +1951,7 @@ eb_find_first_request_added(struct i915_execbuffer *eb)
 #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
 
 /* Stage with GFP_KERNEL allocations before we enter the signaling critical path */
-static void eb_capture_stage(struct i915_execbuffer *eb)
+static int eb_capture_stage(struct i915_execbuffer *eb)
 {
 	const unsigned int count = eb->buffer_count;
 	unsigned int i = count, j;
@@ -1964,6 +1964,10 @@ static void eb_capture_stage(struct i915_execbuffer *eb)
 		if (!(flags & EXEC_OBJECT_CAPTURE))
 			continue;
 
+		if (i915_gem_context_is_recoverable(eb->gem_context) &&
+		    (IS_DGFX(eb->i915) || GRAPHICS_VER_FULL(eb->i915) > IP_VER(12, 0)))
+			return -EINVAL;
+
 		for_each_batch_create_order(eb, j) {
 			struct i915_capture_list *capture;
 
@@ -1976,6 +1980,8 @@ static void eb_capture_stage(struct i915_execbuffer *eb)
 			eb->capture_lists[j] = capture;
 		}
 	}
+
+	return 0;
 }
 
 /* Commit once we're in the critical path */
@@ -2017,7 +2023,7 @@ static void eb_capture_list_clear(struct i915_execbuffer *eb)
 
 #else
 
-static void eb_capture_stage(struct i915_execbuffer *eb)
+static int eb_capture_stage(struct i915_execbuffer *eb)
 {
 }
 
@@ -3410,7 +3416,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	}
 
 	ww_acquire_done(&eb.ww.ctx);
-	eb_capture_stage(&eb);
+	err = eb_capture_stage(&eb);
+	if (err)
+		goto err_vma;
 
 	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
 	if (IS_ERR(out_fence)) {
-- 
2.36.1

