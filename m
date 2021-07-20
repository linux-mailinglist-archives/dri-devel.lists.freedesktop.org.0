Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0E3D030D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A6B6E5B6;
	Tue, 20 Jul 2021 20:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49506E512;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190909015"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="190909015"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906093"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 33/42] drm/i915: Return output fence from
 i915_gem_do_execbuffer
Date: Tue, 20 Jul 2021 13:57:53 -0700
Message-Id: <20210720205802.39610-34-matthew.brost@intel.com>
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

Move the job of creating a new sync fence and installing it onto a file
descriptor to i915_gem_execbuffer2.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 39 +++++++++----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 66f1819fcebc..40311583f03d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3149,11 +3149,10 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		       struct drm_i915_gem_exec_object2 *exec,
 		       struct dma_fence *in_fence,
 		       struct dma_fence *exec_fence,
-		       int out_fence_fd)
+		       struct dma_fence **out_fence)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct i915_execbuffer eb;
-	struct sync_file *out_fence = NULL;
 	struct i915_vma *batch;
 	int err;
 
@@ -3277,14 +3276,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 			goto err_request;
 	}
 
-	if (out_fence_fd >= 0) {
-		out_fence = sync_file_create(&eb.request->fence);
-		if (!out_fence) {
-			err = -ENOMEM;
-			goto err_request;
-		}
-	}
-
 	/*
 	 * Whilst this request exists, batch_obj will be on the
 	 * active_list, and so will hold the active reference. Only when this
@@ -3306,12 +3297,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (eb.fences)
 		signal_fence_array(&eb);
 
-	if (out_fence) {
-		if (err == 0)
-			fd_install(out_fence_fd, out_fence->file);
-		else
-			fput(out_fence->file);
-	}
+	if (!err && out_fence)
+		*out_fence = dma_fence_get(&eb.request->fence);
 
 	if (unlikely(eb.gem_context->syncobj)) {
 		drm_syncobj_replace_fence(eb.gem_context->syncobj,
@@ -3369,6 +3356,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_execbuffer2 *args = data;
 	struct drm_i915_gem_exec_object2 *exec2_list;
+	struct dma_fence **out_fence_p = NULL;
+	struct dma_fence *out_fence = NULL;
 	struct dma_fence *in_fence = NULL;
 	struct dma_fence *exec_fence = NULL;
 	int out_fence_fd = -1;
@@ -3421,6 +3410,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			err = out_fence_fd;
 			goto err_out_fence;
 		}
+		out_fence_p = &out_fence;
 	}
 
 	/* Allocate extra slots for use by the command parser */
@@ -3441,7 +3431,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	}
 
 	err = i915_gem_do_execbuffer(dev, file, args, exec2_list, in_fence,
-				     exec_fence, out_fence_fd);
+				     exec_fence, out_fence_p);
 
 	/*
 	 * Now that we have begun execution of the batchbuffer, we ignore
@@ -3482,9 +3472,18 @@ end:;
 	}
 
 	if (!err && out_fence_fd >= 0) {
-		args->rsvd2 &= GENMASK_ULL(31, 0); /* keep in-fence */
-		args->rsvd2 |= (u64)out_fence_fd << 32;
-		out_fence_fd = -1;
+		struct sync_file *sync_fence;
+
+		sync_fence = sync_file_create(out_fence);
+		if (sync_fence) {
+			fd_install(out_fence_fd, sync_fence->file);
+			args->rsvd2 &= GENMASK_ULL(31, 0); /* keep in-fence */
+			args->rsvd2 |= (u64)out_fence_fd << 32;
+			out_fence_fd = -1;
+		}
+		dma_fence_put(out_fence);
+	} else if (out_fence) {
+		dma_fence_put(out_fence);
 	}
 
 	args->flags &= ~__I915_EXEC_UNKNOWN_FLAGS;
-- 
2.28.0

