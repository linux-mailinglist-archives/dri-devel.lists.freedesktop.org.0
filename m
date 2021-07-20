Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0553D0316
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F216E5C6;
	Tue, 20 Jul 2021 20:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658C26E529;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209421889"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209421889"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906091"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 32/42] drm/i915: Move output fence handling to
 i915_gem_execbuffer2
Date: Tue, 20 Jul 2021 13:57:52 -0700
Message-Id: <20210720205802.39610-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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

Move the job of creating a new file descriptor and passing it back to
userspace to i915_gem_execbuffer2.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 45 ++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 0416bcb551b0..66f1819fcebc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3148,13 +3148,13 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		       struct drm_i915_gem_execbuffer2 *args,
 		       struct drm_i915_gem_exec_object2 *exec,
 		       struct dma_fence *in_fence,
-		       struct dma_fence *exec_fence)
+		       struct dma_fence *exec_fence,
+		       int out_fence_fd)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct i915_execbuffer eb;
 	struct sync_file *out_fence = NULL;
 	struct i915_vma *batch;
-	int out_fence_fd = -1;
 	int err;
 
 	BUILD_BUG_ON(__EXEC_INTERNAL_FLAGS & ~__I915_EXEC_ILLEGAL_FLAGS);
@@ -3198,15 +3198,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (err)
 		goto err_ext;
 
-	if (args->flags & I915_EXEC_FENCE_OUT) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
-		if (out_fence_fd < 0)
-			goto err_ext;
-	}
-
 	err = eb_create(&eb);
 	if (err)
-		goto err_out_fence;
+		goto err_ext;
 
 	GEM_BUG_ON(!eb.lut_size);
 
@@ -3283,7 +3277,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 			goto err_request;
 	}
 
-	if (out_fence_fd != -1) {
+	if (out_fence_fd >= 0) {
 		out_fence = sync_file_create(&eb.request->fence);
 		if (!out_fence) {
 			err = -ENOMEM;
@@ -3313,14 +3307,10 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		signal_fence_array(&eb);
 
 	if (out_fence) {
-		if (err == 0) {
+		if (err == 0)
 			fd_install(out_fence_fd, out_fence->file);
-			args->rsvd2 &= GENMASK_ULL(31, 0); /* keep in-fence */
-			args->rsvd2 |= (u64)out_fence_fd << 32;
-			out_fence_fd = -1;
-		} else {
+		else
 			fput(out_fence->file);
-		}
 	}
 
 	if (unlikely(eb.gem_context->syncobj)) {
@@ -3349,9 +3339,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	i915_gem_context_put(eb.gem_context);
 err_destroy:
 	eb_destroy(&eb);
-err_out_fence:
-	if (out_fence_fd != -1)
-		put_unused_fd(out_fence_fd);
 err_ext:
 	put_fence_array(eb.fences, eb.num_fences);
 	return err;
@@ -3384,6 +3371,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_exec_object2 *exec2_list;
 	struct dma_fence *in_fence = NULL;
 	struct dma_fence *exec_fence = NULL;
+	int out_fence_fd = -1;
 	const size_t count = args->buffer_count;
 	int err;
 
@@ -3427,6 +3415,14 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (args->flags & I915_EXEC_FENCE_OUT) {
+		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+		if (out_fence_fd < 0) {
+			err = out_fence_fd;
+			goto err_out_fence;
+		}
+	}
+
 	/* Allocate extra slots for use by the command parser */
 	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
 				    __GFP_NOWARN | GFP_KERNEL);
@@ -3445,7 +3441,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	}
 
 	err = i915_gem_do_execbuffer(dev, file, args, exec2_list, in_fence,
-				     exec_fence);
+				     exec_fence, out_fence_fd);
 
 	/*
 	 * Now that we have begun execution of the batchbuffer, we ignore
@@ -3485,11 +3481,20 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 end:;
 	}
 
+	if (!err && out_fence_fd >= 0) {
+		args->rsvd2 &= GENMASK_ULL(31, 0); /* keep in-fence */
+		args->rsvd2 |= (u64)out_fence_fd << 32;
+		out_fence_fd = -1;
+	}
+
 	args->flags &= ~__I915_EXEC_UNKNOWN_FLAGS;
 
 err_copy:
 	kvfree(exec2_list);
 err_alloc:
+	if (out_fence_fd >= 0)
+		put_unused_fd(out_fence_fd);
+err_out_fence:
 	dma_fence_put(exec_fence);
 err_exec_fence:
 	dma_fence_put(in_fence);
-- 
2.28.0

