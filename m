Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C53D0315
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DA86E5CF;
	Tue, 20 Jul 2021 20:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4416E525;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885377"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885377"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906090"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 31/42] drm/i915: Move input/exec fence handling to
 i915_gem_execbuffer2
Date: Tue, 20 Jul 2021 13:57:51 -0700
Message-Id: <20210720205802.39610-32-matthew.brost@intel.com>
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

Move the job of creating an input/exec fences (from a file descriptor)
out of i915_gem_do_execbuffer.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 75 +++++++++++--------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 70d352fc543f..0416bcb551b0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3146,11 +3146,12 @@ static int
 i915_gem_do_execbuffer(struct drm_device *dev,
 		       struct drm_file *file,
 		       struct drm_i915_gem_execbuffer2 *args,
-		       struct drm_i915_gem_exec_object2 *exec)
+		       struct drm_i915_gem_exec_object2 *exec,
+		       struct dma_fence *in_fence,
+		       struct dma_fence *exec_fence)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct i915_execbuffer eb;
-	struct dma_fence *in_fence = NULL;
 	struct sync_file *out_fence = NULL;
 	struct i915_vma *batch;
 	int out_fence_fd = -1;
@@ -3197,25 +3198,10 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (err)
 		goto err_ext;
 
-#define IN_FENCES (I915_EXEC_FENCE_IN | I915_EXEC_FENCE_SUBMIT)
-	if (args->flags & IN_FENCES) {
-		if ((args->flags & IN_FENCES) == IN_FENCES)
-			return -EINVAL;
-
-		in_fence = sync_file_get_fence(lower_32_bits(args->rsvd2));
-		if (!in_fence) {
-			err = -EINVAL;
-			goto err_ext;
-		}
-	}
-#undef IN_FENCES
-
 	if (args->flags & I915_EXEC_FENCE_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
-		if (out_fence_fd < 0) {
-			err = out_fence_fd;
-			goto err_in_fence;
-		}
+		if (out_fence_fd < 0)
+			goto err_ext;
 	}
 
 	err = eb_create(&eb);
@@ -3277,13 +3263,16 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 			goto err_ext;
 	}
 
+	if (exec_fence) {
+		err = i915_request_await_execution(eb.request,
+						   exec_fence);
+		if (err < 0)
+			goto err_request;
+	}
+
 	if (in_fence) {
-		if (args->flags & I915_EXEC_FENCE_SUBMIT)
-			err = i915_request_await_execution(eb.request,
-							   in_fence);
-		else
-			err = i915_request_await_dma_fence(eb.request,
-							   in_fence);
+		err = i915_request_await_dma_fence(eb.request,
+						   in_fence);
 		if (err < 0)
 			goto err_request;
 	}
@@ -3363,8 +3352,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 err_out_fence:
 	if (out_fence_fd != -1)
 		put_unused_fd(out_fence_fd);
-err_in_fence:
-	dma_fence_put(in_fence);
 err_ext:
 	put_fence_array(eb.fences, eb.num_fences);
 	return err;
@@ -3395,6 +3382,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_execbuffer2 *args = data;
 	struct drm_i915_gem_exec_object2 *exec2_list;
+	struct dma_fence *in_fence = NULL;
+	struct dma_fence *exec_fence = NULL;
 	const size_t count = args->buffer_count;
 	int err;
 
@@ -3419,13 +3408,33 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		return err;
 
+	if (args->flags & I915_EXEC_FENCE_IN) {
+		in_fence = sync_file_get_fence(lower_32_bits(args->rsvd2));
+		if (!in_fence)
+			return -EINVAL;
+	}
+
+	if (args->flags & I915_EXEC_FENCE_SUBMIT) {
+		if (in_fence) {
+			err = -EINVAL;
+			goto err_exec_fence;
+		}
+
+		exec_fence = sync_file_get_fence(lower_32_bits(args->rsvd2));
+		if (!exec_fence) {
+			err = -EINVAL;
+			goto err_exec_fence;
+		}
+	}
+
 	/* Allocate extra slots for use by the command parser */
 	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
 				    __GFP_NOWARN | GFP_KERNEL);
 	if (exec2_list == NULL) {
 		drm_dbg(&i915->drm, "Failed to allocate exec list for %zd buffers\n",
 			count);
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto err_alloc;
 	}
 	if (copy_from_user(exec2_list,
 			   u64_to_user_ptr(args->buffers_ptr),
@@ -3435,7 +3444,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		goto err_copy;
 	}
 
-	err = i915_gem_do_execbuffer(dev, file, args, exec2_list);
+	err = i915_gem_do_execbuffer(dev, file, args, exec2_list, in_fence,
+				     exec_fence);
 
 	/*
 	 * Now that we have begun execution of the batchbuffer, we ignore
@@ -3476,12 +3486,13 @@ end:;
 	}
 
 	args->flags &= ~__I915_EXEC_UNKNOWN_FLAGS;
-	kvfree(exec2_list);
-
-	return err;
 
 err_copy:
 	kvfree(exec2_list);
+err_alloc:
+	dma_fence_put(exec_fence);
+err_exec_fence:
+	dma_fence_put(in_fence);
 
 	return err;
 }
-- 
2.28.0

