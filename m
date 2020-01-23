Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E943147522
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 00:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C3B6E17E;
	Thu, 23 Jan 2020 23:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C676E178
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 23:58:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so5310702wrh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 15:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Myx0ylhVODnhnxewA7QLsuWIoyc8am0f1slLKxo8VaU=;
 b=yR5+McHzEoM+ohSVnQ85fTeeivb3Alirqm4+v4IhYd+qll68+k9eavk1sqib+sucLB
 PgNivyAQpBOu/Y3TmAvPLisayEYOnv/YlvXcBW4AA0AnKp7Lr6XUv3zKNGQIXiN9wjUi
 Kl0IDaDaGB5x2iuQqmcEgEdTY2XClgVE+s0FOkpusQY16nAW8gh6UjzM+yAbEHdkxLJq
 LPHvZKV9IJafeoQY1/VeoxdJMHS7oY4eoNSPEjK76xVbwSnqLWjPib2X7AGencpxN60z
 wi8NEiiYUTzpqjIyrfX6C9aYascZD2b/a6RuVZS99gpveu54N1I5eKC1ll0s2kCf0Ak1
 +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Myx0ylhVODnhnxewA7QLsuWIoyc8am0f1slLKxo8VaU=;
 b=XblgfyICZPJmhDDU9pqm/Ji06oAhhRigwfREqtW8VS5LWv0DMMXVRcNJWEzYTIXEkX
 D7WChn7myERZghTagRKtjFhIYXjqDXcVy5DaWladBusTKVVoJVfVwXyuoW46YLr8rXkb
 eUIGCBI9u1EsMPmps7la1YC5L0/s/tCVK1+gX3J8nFCiB3pKcDr6Y+vMSj+NEs9MuH1q
 w3JGJjJ73LiCzNjYCM1f2p2Z2+803GXQykEWP8y9xdOkB8jN3ykTtNpwJTijh3LW59oO
 jbuxOeeau5H7jKkNzwwgSWMJbTEqiK45IRQL9qSe0Drju3m0Ar0v4W8y/SofRwBmeOT0
 93FQ==
X-Gm-Message-State: APjAAAWMMTpwhqTFjvovdtjl50cYlxrrSpzV54qkTkLXpFVwDOVIEY0l
 1QgEMpna0eLSYYcGZlU1+tMENw==
X-Google-Smtp-Source: APXvYqx3FjjhDlRBs6LguuKcIiJuTfjQZhLJ7Sl3eNP1Np9EFs/jqVD5vrXjD+DA8U217V4RkczGEg==
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr639987wrn.28.1579823938122;
 Thu, 23 Jan 2020 15:58:58 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:7285:c2ff:fe4e:b21b])
 by smtp.gmail.com with ESMTPSA id e18sm4888192wrw.70.2020.01.23.15.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 15:58:57 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3] drm/msm: Add syncobj support.
Date: Fri, 24 Jan 2020 00:57:10 +0100
Message-Id: <20200123235710.28673-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This

1) Enables core DRM syncobj support.
2) Adds options to the submission ioctl to wait/signal syncobjs.

Just like the wait fence fd, this does inline waits. Using the
scheduler would be nice but I believe it is out of scope for
this work.

Support for timeline syncobjs is implemented and the interface
is ready for it, but I'm not enabling it yet until there is
some code for turnip to use it.

The reset is mostly in there because in the presence of waiting
and signalling the same semaphores, resetting them after
signalling can become very annoying.

v2:
  - Fixed style issues
  - Removed a cleanup issue in a failure case
  - Moved to a copy_from_user per syncobj

v3:
 - Fixed a missing declaration introduced in v2
 - Reworked to use ERR_PTR/PTR_ERR
 - Simplified failure gotos.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/msm/msm_drv.c        |   6 +-
 drivers/gpu/drm/msm/msm_gem_submit.c | 232 ++++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h           |  24 ++-
 3 files changed, 258 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8b3f2c..5246b41798df 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -37,9 +37,10 @@
  * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
+ * - 1.6.0 - Syncobj support
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	5
+#define MSM_VERSION_MINOR	6
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
@@ -988,7 +989,8 @@ static struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
-				DRIVER_MODESET,
+				DRIVER_MODESET |
+				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose           = msm_postclose,
 	.lastclose          = drm_fb_helper_lastclose,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index be5327af16fa..11045f56b815 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -8,7 +8,9 @@
 #include <linux/sync_file.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_syncobj.h>
 
 #include "msm_drv.h"
 #include "msm_gpu.h"
@@ -394,6 +396,186 @@ static void submit_cleanup(struct msm_gem_submit *submit)
 	ww_acquire_fini(&submit->ticket);
 }
 
+
+struct msm_submit_post_dep {
+	struct drm_syncobj *syncobj;
+	uint64_t point;
+	struct dma_fence_chain *chain;
+};
+
+static struct drm_syncobj **msm_wait_deps(struct drm_device *dev,
+                                          struct drm_file *file,
+                                          uint64_t in_syncobjs_addr,
+                                          uint32_t nr_in_syncobjs,
+                                          size_t syncobj_stride,
+                                          struct msm_ringbuffer *ring)
+{
+	struct drm_syncobj **syncobjs = NULL;
+	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
+	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!syncobjs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_in_syncobjs; ++i) {
+		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
+		struct dma_fence *fence;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (syncobj_desc.point &&
+		    !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
+			ret = -EOPNOTSUPP;
+			break;
+		}
+
+		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
+			ret = -EINVAL;
+			break;
+		}
+
+		ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
+		                             syncobj_desc.point, 0, &fence);
+		if (ret)
+			break;
+
+		if (!dma_fence_match_context(fence, ring->fctx->context))
+			ret = dma_fence_wait(fence, true);
+
+		dma_fence_put(fence);
+		if (ret)
+			break;
+
+		if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
+			syncobjs[i] =
+				drm_syncobj_find(file, syncobj_desc.handle);
+			if (!syncobjs[i]) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			if (syncobjs[j])
+				drm_syncobj_put(syncobjs[j]);
+		}
+		kfree(syncobjs);
+		return ERR_PTR(ret);
+	}
+	return syncobjs;
+}
+
+static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
+                               uint32_t nr_syncobjs)
+{
+	uint32_t i;
+
+	for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
+		if (syncobjs[i])
+			drm_syncobj_replace_fence(syncobjs[i], NULL);
+	}
+}
+
+static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
+                                                       struct drm_file *file,
+                                                       uint64_t syncobjs_addr,
+                                                       uint32_t nr_syncobjs,
+                                                       size_t syncobj_stride)
+{
+	struct msm_submit_post_dep *post_deps;
+	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	post_deps = kmalloc_array(nr_syncobjs, sizeof(*post_deps),
+	                          GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!post_deps)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_syncobjs; ++i) {
+		uint64_t address = syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		post_deps[i].point = syncobj_desc.point;
+		post_deps[i].chain = NULL;
+
+		if (syncobj_desc.flags) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (syncobj_desc.point) {
+			if (!drm_core_check_feature(dev,
+			                            DRIVER_SYNCOBJ_TIMELINE)) {
+				ret = -EOPNOTSUPP;
+				break;
+			}
+
+			post_deps[i].chain =
+				kmalloc(sizeof(*post_deps[i].chain),
+				        GFP_KERNEL);
+			if (!post_deps[i].chain) {
+				ret = -ENOMEM;
+				break;
+			}
+		}
+
+		post_deps[i].syncobj =
+			drm_syncobj_find(file, syncobj_desc.handle);
+		if (!post_deps[i].syncobj) {
+			ret = -EINVAL;
+			break;
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			kfree(post_deps[j].chain);
+			if (post_deps[j].syncobj)
+				drm_syncobj_put(post_deps[j].syncobj);
+		}
+
+		kfree(post_deps);
+		return ERR_PTR(ret);
+	}
+
+	return post_deps;
+}
+
+static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
+                                  uint32_t count, struct dma_fence *fence)
+{
+	uint32_t i;
+
+	for (i = 0; post_deps && i < count; ++i) {
+		if (post_deps[i].chain) {
+			drm_syncobj_add_point(post_deps[i].syncobj,
+			                      post_deps[i].chain,
+			                      fence, post_deps[i].point);
+			post_deps[i].chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(post_deps[i].syncobj,
+			                          fence);
+		}
+	}
+}
+
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -406,6 +588,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct sync_file *sync_file = NULL;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
+	struct msm_submit_post_dep *post_deps = NULL;
+	struct drm_syncobj **syncobjs_to_reset = NULL;
 	int out_fence_fd = -1;
 	struct pid *pid = get_pid(task_pid(current));
 	unsigned i;
@@ -413,6 +597,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!gpu)
 		return -ENXIO;
 
+	if (args->pad)
+		return -EINVAL;
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
@@ -460,9 +647,29 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return ret;
 	}
 
+	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
+		syncobjs_to_reset = msm_wait_deps(dev, file,
+		                                  args->in_syncobjs,
+		                                  args->nr_in_syncobjs,
+		                                  args->syncobj_stride, ring);
+		if (IS_ERR(syncobjs_to_reset))
+			return PTR_ERR(syncobjs_to_reset);
+	}
+
+	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
+		post_deps = msm_parse_post_deps(dev, file,
+		                                args->out_syncobjs,
+		                                args->nr_out_syncobjs,
+		                                args->syncobj_stride);
+		if (IS_ERR(post_deps)) {
+			ret = PTR_ERR(post_deps);
+			goto out_post_unlock;
+		}
+	}
+
 	ret = mutex_lock_interruptible(&dev->struct_mutex);
 	if (ret)
-		return ret;
+		goto out_post_unlock;
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
@@ -586,6 +793,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		args->fence_fd = out_fence_fd;
 	}
 
+	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
+	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
+	                      submit->fence);
+
+
 out:
 	submit_cleanup(submit);
 	if (ret)
@@ -594,5 +806,23 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
 	mutex_unlock(&dev->struct_mutex);
+
+out_post_unlock:
+	if (!IS_ERR_OR_NULL(post_deps)) {
+		for (i = 0; i < args->nr_out_syncobjs; ++i) {
+			kfree(post_deps[i].chain);
+			drm_syncobj_put(post_deps[i].syncobj);
+		}
+		kfree(post_deps);
+	}
+
+	if (!IS_ERR_OR_NULL(syncobjs_to_reset)) {
+		for (i = 0; i < args->nr_in_syncobjs; ++i) {
+			if (syncobjs_to_reset[i])
+				drm_syncobj_put(syncobjs_to_reset[i]);
+		}
+		kfree(syncobjs_to_reset);
+	}
+
 	return ret;
 }
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 0b85ed6a3710..19806eb3a8e8 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -217,13 +217,28 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_FENCE_FD_IN   0x40000000 /* enable input fence_fd */
 #define MSM_SUBMIT_FENCE_FD_OUT  0x20000000 /* enable output fence_fd */
 #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB */
+#define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
+#define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
 #define MSM_SUBMIT_FLAGS                ( \
 		MSM_SUBMIT_NO_IMPLICIT   | \
 		MSM_SUBMIT_FENCE_FD_IN   | \
 		MSM_SUBMIT_FENCE_FD_OUT  | \
 		MSM_SUBMIT_SUDO          | \
+		MSM_SUBMIT_SYNCOBJ_IN    | \
+		MSM_SUBMIT_SYNCOBJ_OUT   | \
 		0)
 
+#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
+		MSM_SUBMIT_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_gem_submit_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -236,7 +251,14 @@ struct drm_msm_gem_submit {
 	__u64 bos;            /* in, ptr to array of submit_bo's */
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
-	__u32 queueid;         /* in, submitqueue id */
+	__u32 queueid;        /* in, submitqueue id */
+	__u64 in_syncobjs;    /* in, ptr to to array of drm_msm_gem_submit_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to to array of drm_msm_gem_submit_syncobj */
+	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
+	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
+	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
+	__u32 pad;            /*in, reserved for future use, always 0. */
+
 };
 
 /* The normal way to synchronize with the GPU is just to CPU_PREP on
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
