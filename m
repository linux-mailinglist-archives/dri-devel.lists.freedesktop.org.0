Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E903DF7A9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CB06E961;
	Tue,  3 Aug 2021 22:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8FF6E8E9;
 Tue,  3 Aug 2021 22:11:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193393489"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="193393489"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512744"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 42/46] drm/i915: Hold all parallel requests until last request,
 properly handle error
Date: Tue,  3 Aug 2021 15:29:39 -0700
Message-Id: <20210803222943.27686-43-matthew.brost@intel.com>
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

Hold all parallel requests, via a submit fence, until the last request
is generated. If an error occurs in the middle of generating the
requests, skip the requests signal the backend of the error via a
request flag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 40 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_request.h           |  9 +++++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 70784779872a..64af5c704ca7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3351,7 +3351,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	}
 
 	if (out_fence) {
-		/* Move ownership to caller (i915_gem_execbuffer2_ioctl) */
+		/*
+		 * Move ownership to caller (i915_gem_execbuffer2_ioctl), this
+		 * must be done before anything in this function can jump to the
+		 * 'err_request' label so the caller can safely cleanup any
+		 * errors.
+		 */
 		out_fence[batch_number] = dma_fence_get(&eb.request->fence);
 
 		/*
@@ -3402,10 +3407,21 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	err = eb_submit(&eb, batch, first, last);
 
 err_request:
-	if (last)
+	if (last || err)
 		set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
 			&eb.request->fence.flags);
 
+	/*
+	 * If the execbuf IOCTL is generating more than 1 request, we hold all
+	 * the requests until the last request has been generated in case any of
+	 * the requests hit an error. If an error is hit the caller is
+	 * responsible for flaging all the requests generated with an error. The
+	 * caller is always responsible for releasing the fence on the first
+	 * request.
+	 */
+	if (intel_context_is_parallel(eb.context) && first)
+		i915_sw_fence_await(&eb.request->submit);
+
 	i915_request_get(eb.request);
 	err = eb_request_add(&eb, err);
 
@@ -3498,7 +3514,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	struct i915_gem_context *ctx;
 	struct i915_gem_ww_ctx ww;
 	struct intel_context *parent = NULL;
-	unsigned int num_batches = 1, i;
+	unsigned int num_batches = 1, i = 0, j;
 	bool is_parallel = false;
 
 	if (!check_buffer_count(count)) {
@@ -3637,8 +3653,24 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 					     out_fences,
 					     &ww);
 
-	if (is_parallel)
+	if (is_parallel) {
+		/*
+		 * Mark all requests generated with an error if any of the
+		 * requests encountered an error.
+		 */
+		for (j = 0; err && j < i; ++j)
+			if (out_fences[j]) {
+				__i915_request_skip(to_request(out_fences[j]));
+				set_bit(I915_FENCE_FLAG_SKIP_PARALLEL,
+					&out_fences[j]->flags);
+			}
+
+		/* Release fence on first request generated */
+		if (out_fences[0])
+			i915_sw_fence_complete(&to_request(out_fences[0])->submit);
+
 		mutex_unlock(&parent->parallel_submit);
+	}
 
 	/*
 	 * Now that we have begun execution of the batchbuffer, we ignore
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index d6d5bf0a5eb5..7f3f66ddf21b 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -153,6 +153,15 @@ enum {
 	 * tail.
 	 */
 	I915_FENCE_FLAG_SUBMIT_PARALLEL,
+
+	/*
+	 * I915_FENCE_FLAG_SKIP_PARALLEL - request with a context in a
+	 * parent-child relationship (parallel submission, multi-lrc) that
+	 * hit an error while generating requests in the execbuf IOCTL.
+	 * Indicates this request should be skipped as another request in
+	 * submission / relationship encoutered an error.
+	 */
+	I915_FENCE_FLAG_SKIP_PARALLEL,
 };
 
 /**
-- 
2.28.0

