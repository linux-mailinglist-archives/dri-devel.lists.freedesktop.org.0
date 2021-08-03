Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D8F3DF7A3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAC66E17E;
	Tue,  3 Aug 2021 22:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D374D6E904;
 Tue,  3 Aug 2021 22:11:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193393485"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="193393485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512738"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 38/46] drm/i915: Only track object dependencies on first
 request
Date: Tue,  3 Aug 2021 15:29:35 -0700
Message-Id: <20210803222943.27686-39-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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

Only track object dependencies on the first request generated from the
execbuf, this help with the upcoming multi-bb execbuf extension.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 2835ef8734e5..b224b28530d1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2239,7 +2239,7 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
 	return err;
 }
 
-static int eb_move_to_gpu(struct i915_execbuffer *eb)
+static int eb_move_to_gpu(struct i915_execbuffer *eb, bool first)
 {
 	const unsigned int count = eb->buffer_count;
 	unsigned int i = count;
@@ -2281,7 +2281,7 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 				flags &= ~EXEC_OBJECT_ASYNC;
 		}
 
-		if (err == 0 && !(flags & EXEC_OBJECT_ASYNC)) {
+		if (err == 0 && first && !(flags & EXEC_OBJECT_ASYNC)) {
 			err = i915_request_await_object
 				(eb->request, obj, flags & EXEC_OBJECT_WRITE);
 		}
@@ -2525,14 +2525,15 @@ static int eb_parse(struct i915_execbuffer *eb)
 	return err;
 }
 
-static int eb_submit(struct i915_execbuffer *eb, struct i915_vma *batch)
+static int eb_submit(struct i915_execbuffer *eb, struct i915_vma *batch,
+		     bool first)
 {
 	int err;
 
 	if (intel_context_nopreempt(eb->context))
 		__set_bit(I915_FENCE_FLAG_NOPREEMPT, &eb->request->fence.flags);
 
-	err = eb_move_to_gpu(eb);
+	err = eb_move_to_gpu(eb, first);
 	if (err)
 		return err;
 
@@ -3304,7 +3305,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		intel_gt_buffer_pool_mark_active(eb.batch_pool, eb.request);
 
 	trace_i915_request_queue(eb.request, eb.batch_flags);
-	err = eb_submit(&eb, batch);
+	err = eb_submit(&eb, batch, true);
 
 err_request:
 	i915_request_get(eb.request);
-- 
2.28.0

