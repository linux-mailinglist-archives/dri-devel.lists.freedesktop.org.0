Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BD139AB7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 21:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1E489A9F;
	Mon, 13 Jan 2020 20:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA8F89A9F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 20:27:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c14so10000357wrn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 12:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DOCcGnYv3boQkklz+BzJry8B9W3rIEusERkOCzL8nnM=;
 b=jGioRc1qSsQqYt4dK/w1IsKYydGP1kUqksfRrotueuB8EWqw9ky08gPwd2KROAwV5r
 xmN1kzfn1DTVU9p5q1FVGOm3d3mHcMr6aZfUmud8uz6CLLxt97bCkZit6NFAMNP4HDVc
 IwKFZtVZZTsagnbc7nvyDZEJOv1Yeqxbrx8+7p1riiQysQyyNSuPh4/PXz1+bkaE9Aeo
 9szkRYd5tC/jU8rA02UXgOBAjxw/wbzIhv1GOUazjkTd5VKJfrptpqsIxsHDwmmdux7H
 JiiS6fMzj8uFQv2CaGddFZkH2lBMg+epdY1F8/ApGzzN1sOhrJx3/7qiO6bIvXjvth2W
 E7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DOCcGnYv3boQkklz+BzJry8B9W3rIEusERkOCzL8nnM=;
 b=JcDj7xYvtOlvdLEfbTktFFBquEL2PQocGyjp35Nszt727rKVFMdxN8I1Z1MsDmk2At
 DZ7PdRrd/s1j+D0vzdWAr3J54VOkBvnGJgZ3Mprfg2iZW//MvYFDqC/KDzqTCJ+CAjLI
 LhBEZ+JMbN4RSi35C3Bigs5uBp09Cu3vlIx+uRac/K4ITkygvsdrFYE/zwBqYL+HVkb4
 I8NFosKdi+/vuT+30q6gJe4sHOaKrA7uiNgw1FNTqGdtsoJwZIAFOqTUgv6WUU/PH0XA
 WPol+1z5a8ivsnQfPEldnvkmtbH+39iFBoS+OvAoyPA1sQu8arOLmWgzHI9N7bX4Y0K5
 bmOg==
X-Gm-Message-State: APjAAAVbY/Ifye2ZPNDYZabYg8Rw4wf0VKKNI8W3zvWdMbIi6GRjsAho
 NBuUDAAi09z6Dfeizebg/hosag==
X-Google-Smtp-Source: APXvYqwU3VMAddzL2aAC4VozuK5LRtcofMbVc9NhmeTQrvf+DCpA4dlMkgIcHUXtmuvE0CmVxDOgPg==
X-Received: by 2002:adf:e683:: with SMTP id r3mr20587497wrm.38.1578947264742; 
 Mon, 13 Jan 2020 12:27:44 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:7285:c2ff:fe4e:b21b])
 by smtp.gmail.com with ESMTPSA id a16sm16716091wrt.37.2020.01.13.12.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 12:27:44 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add syncobj support.
Date: Mon, 13 Jan 2020 21:25:57 +0100
Message-Id: <20200113202557.110095-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.24.1
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org
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

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---

Userspace code in 

https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2769

 drivers/gpu/drm/msm/msm_drv.c        |   6 +-
 drivers/gpu/drm/msm/msm_gem_submit.c | 241 ++++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h           |  22 ++-
 3 files changed, 265 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8b3f2c..ca36d6b21d8f 100644
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
+				DRIVER_MODESET|
+				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose           = msm_postclose,
 	.lastclose          = drm_fb_helper_lastclose,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index be5327af16fa..9085229f88e0 100644
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
@@ -394,6 +396,196 @@ static void submit_cleanup(struct msm_gem_submit *submit)
 	ww_acquire_fini(&submit->ticket);
 }
 
+
+struct msm_submit_post_dep {
+	struct drm_syncobj *syncobj;
+	uint64_t point;
+	struct dma_fence_chain *chain;
+};
+
+static int msm_wait_deps(struct drm_device *dev,
+                         struct drm_file *file,
+                         uint64_t in_syncobjs_addr,
+                         uint32_t nr_in_syncobjs,
+                         struct msm_ringbuffer *ring,
+                         struct drm_syncobj ***syncobjs)
+{
+	struct drm_msm_gem_submit_syncobj *syncobj_descs;
+	int ret = 0;
+	uint32_t i, j;
+
+	syncobj_descs = kmalloc_array(nr_in_syncobjs, sizeof(*syncobj_descs),
+	                              GFP_KERNEL);
+	if (!syncobj_descs)
+		return -ENOMEM;
+
+	*syncobjs = kcalloc(nr_in_syncobjs, sizeof(**syncobjs), GFP_KERNEL);
+	if (!syncobjs) {
+		ret = -ENOMEM;
+		goto out_syncobjs;
+	}
+
+	if (copy_from_user(syncobj_descs, u64_to_user_ptr(in_syncobjs_addr),
+	                   nr_in_syncobjs * sizeof(*syncobj_descs))) {
+		ret = -EFAULT;
+		goto out_syncobjs;
+	}
+
+	for (i = 0; i < nr_in_syncobjs; ++i) {
+		struct dma_fence *fence;
+
+		if (syncobj_descs[i].point &&
+		    !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
+			ret = -EOPNOTSUPP;
+			goto out_syncobjs;
+		}
+
+		if (syncobj_descs[i].flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
+			ret = -EINVAL;
+			goto out_syncobjs;
+		}
+
+		ret = drm_syncobj_find_fence(file, syncobj_descs[i].handle,
+		                             syncobj_descs[i].point, 0, &fence);
+		if (ret)
+			goto out_syncobjs;
+
+		if (!dma_fence_match_context(fence, ring->fctx->context))
+			ret = dma_fence_wait(fence, true);
+
+		dma_fence_put(fence);
+		if (ret)
+			goto out_syncobjs;
+
+		if (syncobj_descs[i].flags & MSM_SUBMIT_SYNCOBJ_RESET) {
+			(*syncobjs)[i] =
+				drm_syncobj_find(file, syncobj_descs[i].handle);
+			if (!(*syncobjs)[i]) {
+				ret = -EINVAL;
+				goto out_syncobjs;
+			}
+		}
+	}
+
+out_syncobjs:
+	if (ret && *syncobjs) {
+		for (j = 0; j < i; ++j) {
+			if ((*syncobjs)[j])
+				drm_syncobj_put((*syncobjs)[j]);
+		}
+		kfree(*syncobjs);
+		*syncobjs = NULL;
+	}
+	kfree(syncobj_descs);
+	return ret;
+}
+
+static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
+                               uint32_t nr_syncobjs)
+{
+	uint32_t i;
+
+	for (i = 0; i < nr_syncobjs; ++i) {
+		if (syncobjs[i])
+			drm_syncobj_replace_fence(syncobjs[i], NULL);
+	}
+}
+
+static int msm_parse_post_deps(struct drm_device *dev,
+                               struct drm_file *file,
+                               uint64_t out_syncobjs_addr,
+                               uint32_t nr_out_syncobjs,
+                               struct msm_submit_post_dep **post_deps)
+{
+	struct drm_msm_gem_submit_syncobj *syncobjs;
+	int ret = 0;
+	uint32_t i, j;
+
+	syncobjs = kmalloc_array(nr_out_syncobjs,
+	                         sizeof(*syncobjs), GFP_KERNEL);
+	if (!syncobjs) {
+		return -ENOMEM;
+	}
+
+	if (copy_from_user(syncobjs, u64_to_user_ptr(out_syncobjs_addr),
+	                   nr_out_syncobjs * sizeof(*syncobjs))) {
+		ret = -EFAULT;
+		goto out_syncobjs;
+	}
+
+	*post_deps = kmalloc_array(nr_out_syncobjs, sizeof(**post_deps),
+	                           GFP_KERNEL);
+	if (!*post_deps) {
+		ret = -ENOMEM;
+		goto out_syncobjs;
+	}
+
+	for (i = 0; i < nr_out_syncobjs; ++i) {
+		(*post_deps)[i].point = syncobjs[i].point;
+		(*post_deps)[i].chain = NULL;
+
+		(*post_deps)[i].syncobj =
+			drm_syncobj_find(file, syncobjs[i].handle);
+		if (!(*post_deps)[i].syncobj) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (syncobjs[i].flags) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (syncobjs[i].point) {
+			if (!drm_core_check_feature(dev,
+			                            DRIVER_SYNCOBJ_TIMELINE)) {
+				ret = -EOPNOTSUPP;
+				break;
+			}
+
+			(*post_deps)[i].chain =
+				kmalloc(sizeof(*(*post_deps)[i].chain),
+				        GFP_KERNEL);
+			if (!(*post_deps)[i].chain) {
+				ret = -ENOMEM;
+				break;
+			}
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j < i; ++j) {
+			kfree((*post_deps)[j].chain);
+			drm_syncobj_put((*post_deps)[j].syncobj);
+		}
+
+		kfree(*post_deps);
+		*post_deps = NULL;
+	}
+
+out_syncobjs:
+	kfree(syncobjs);
+	return ret;
+}
+
+static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
+                                  uint32_t count, struct dma_fence *fence)
+{
+	uint32_t i;
+
+	for (i = 0; i < count; ++i) {
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
@@ -406,6 +598,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct sync_file *sync_file = NULL;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
+	struct msm_submit_post_dep *post_deps = NULL;
+	struct drm_syncobj **syncobjs_to_reset = NULL;
 	int out_fence_fd = -1;
 	struct pid *pid = get_pid(task_pid(current));
 	unsigned i;
@@ -460,9 +654,26 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return ret;
 	}
 
+	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
+		ret = msm_wait_deps(dev, file,
+		                    args->in_syncobjs, args->nr_in_syncobjs,
+		                    ring, &syncobjs_to_reset);
+		if (ret)
+			goto out_post_unlock;
+	}
+
+	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
+		ret = msm_parse_post_deps(dev, file,
+		                          args->out_syncobjs,
+		                          args->nr_out_syncobjs,
+		                          &post_deps);
+		if (ret)
+			goto out_post_unlock;
+	}
+
 	ret = mutex_lock_interruptible(&dev->struct_mutex);
 	if (ret)
-		return ret;
+		goto out_post_unlock;
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
@@ -586,6 +797,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		args->fence_fd = out_fence_fd;
 	}
 
+	if (syncobjs_to_reset) {
+		msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
+	}
+
+	if (post_deps) {
+		msm_process_post_deps(post_deps, args->nr_out_syncobjs,
+		                      submit->fence);
+	}
+
+
 out:
 	submit_cleanup(submit);
 	if (ret)
@@ -594,5 +815,23 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
 	mutex_unlock(&dev->struct_mutex);
+
+out_post_unlock:
+	if (post_deps) {
+		for (i = 0; i < args->nr_out_syncobjs; ++i) {
+			kfree(post_deps[i].chain);
+			drm_syncobj_put(post_deps[i].syncobj);
+		}
+		kfree(post_deps);
+	}
+
+	if (syncobjs_to_reset) {
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
index 0b85ed6a3710..ba9bdcc0016a 100644
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
@@ -236,7 +251,12 @@ struct drm_msm_gem_submit {
 	__u64 bos;            /* in, ptr to array of submit_bo's */
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
-	__u32 queueid;         /* in, submitqueue id */
+	__u32 queueid;        /* in, submitqueue id */
+	__u64 in_syncobjs;    /* in, ptr to to array of drm_msm_gem_submit_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to to array of drm_msm_gem_submit_syncobj */
+	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
+	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
+
 };
 
 /* The normal way to synchronize with the GPU is just to CPU_PREP on
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
