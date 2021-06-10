Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D93A2820
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248C76EC96;
	Thu, 10 Jun 2021 09:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506AC6EC8F;
 Thu, 10 Jun 2021 09:18:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id d184so5751071wmd.0;
 Thu, 10 Jun 2021 02:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aaolijyugYqAPONoYOVqT/KLAiIcbucJAKzm3KDrBEw=;
 b=o/nqni2asHVXq8nA4TTUiW8AlQOQPln30pWALiGgm3VkJIlMy/Auu4MJqCgj3e+1ch
 xiV68rxHzks99uv1m5ctBNzJYCzx2QQhNti0koInTDYijwXagCTtKXQLmuuiojQFTDxM
 N12fR+UayyyWHrLD3UTsYQAltL8irY2RMRlBhDiYX333s9L7L4aEEpJsO93valL/fnQq
 ETFmPS1jqrhLrp0bHiB+0fiOdLZGitWCSHf62CeLnb084llwKUHyx6vv8PKdL4mqqrQi
 n0bxGUf7SBAoEiGyrwpkmjt/Z7bYqqth8sb6Yix5eqOL4lkF4E/1rJ9PJeMGMYU68qRj
 iJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aaolijyugYqAPONoYOVqT/KLAiIcbucJAKzm3KDrBEw=;
 b=e6XVxHxotHkTxfg2nVc+ByNQMRZUFQGkPgFaFztAz+thDIvjbaBJ+P7eJmga8zCV0Q
 tnlHtpdhmdPTO6E79N2tbN11tbcSgGkaUjBgRk5kYLPNvJEteZl1ADhHp6XKHmIX7eF4
 J9klyoiHZ6RI9DChoMXG7pNmy2HGv4QmnQMmm9+7NK898kjShhfE+zoCFZ/S2aIZSHOE
 rYK1TYxeJyRWCpuLPajRHwfTl/uyq4CRlSoe56JjWmu6R85m8LiIypF7P5Fsmfy8l8MR
 4hyrhqN15DrR1/Oqcwm0+ilqsz6IYykhzTZ6EqVCTo0IM2a/YoZL/pGLa8PuSFtbZZDa
 HFvA==
X-Gm-Message-State: AOAM5324QKjWHz5Axam7B7QePlvh8BuUbieOdZd2XgWsJ2CIG9bAq+/Q
 JNrE5d/YYKpqxbuDUg0t9aw=
X-Google-Smtp-Source: ABdhPJzjeKKNPCp88Dyvh6gco61DWIb4JOonuqd4TMGlAv+C30VoTSdZHYtvJeN/w0u+WN7RITqAjg==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr4047229wmc.110.1623316683759; 
 Thu, 10 Jun 2021 02:18:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] dma-buf: add dma_fence_chain_alloc/free
Date: Thu, 10 Jun 2021 11:17:55 +0200
Message-Id: <20210610091800.1833-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a common allocation helper. Cleaning up the mix of kzalloc/kmalloc
and some unused code in the selftest.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-chain.c          | 16 ++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 ++--
 drivers/gpu/drm/drm_syncobj.c                 |  6 ++---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++---
 drivers/gpu/drm/msm/msm_gem_submit.c          |  6 ++---
 include/linux/dma-fence-chain.h               | 22 +++++++++++++++++++
 6 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 9525f7f56119..8ce1ea59d31b 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -58,28 +58,20 @@ static struct dma_fence *mock_fence(void)
 	return &f->base;
 }
 
-static inline struct mock_chain {
-	struct dma_fence_chain base;
-} *to_mock_chain(struct dma_fence *f) {
-	return container_of(f, struct mock_chain, base.base);
-}
-
 static struct dma_fence *mock_chain(struct dma_fence *prev,
 				    struct dma_fence *fence,
 				    u64 seqno)
 {
-	struct mock_chain *f;
+	struct dma_fence_chain *f;
 
-	f = kmalloc(sizeof(*f), GFP_KERNEL);
+	f = dma_fence_chain_alloc();
 	if (!f)
 		return NULL;
 
-	dma_fence_chain_init(&f->base,
-			     dma_fence_get(prev),
-			     dma_fence_get(fence),
+	dma_fence_chain_init(f, dma_fence_get(prev), dma_fence_get(fence),
 			     seqno);
 
-	return &f->base.base;
+	return &f->base;
 }
 
 static int sanitycheck(void *arg)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 90136f9dedd6..325e82621467 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1124,7 +1124,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
 
 		dep->chain = NULL;
 		if (syncobj_deps[i].point) {
-			dep->chain = kmalloc(sizeof(*dep->chain), GFP_KERNEL);
+			dep->chain = dma_fence_chain_alloc();
 			if (!dep->chain)
 				return -ENOMEM;
 		}
@@ -1132,7 +1132,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
 		dep->syncobj = drm_syncobj_find(p->filp,
 						syncobj_deps[i].handle);
 		if (!dep->syncobj) {
-			kfree(dep->chain);
+			dma_fence_chain_free(dep->chain);
 			return -EINVAL;
 		}
 		dep->point = syncobj_deps[i].point;
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index fdd2ec87cdd1..1c5b9ef6da37 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -861,7 +861,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 				     &fence);
 	if (ret)
 		goto err;
-	chain = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
+	chain = dma_fence_chain_alloc();
 	if (!chain) {
 		ret = -ENOMEM;
 		goto err1;
@@ -1402,10 +1402,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		goto err_points;
 	}
 	for (i = 0; i < args->count_handles; i++) {
-		chains[i] = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
+		chains[i] = dma_fence_chain_alloc();
 		if (!chains[i]) {
 			for (j = 0; j < i; j++)
-				kfree(chains[j]);
+				dma_fence_chain_free(chains[j]);
 			ret = -ENOMEM;
 			goto err_chains;
 		}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 66789111a24b..a22cb86730b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2983,7 +2983,7 @@ __free_fence_array(struct eb_fence *fences, unsigned int n)
 	while (n--) {
 		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
 		dma_fence_put(fences[n].dma_fence);
-		kfree(fences[n].chain_fence);
+		dma_fence_chain_free(fences[n].chain_fence);
 	}
 	kvfree(fences);
 }
@@ -3097,9 +3097,7 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
 				return -EINVAL;
 			}
 
-			f->chain_fence =
-				kmalloc(sizeof(*f->chain_fence),
-					GFP_KERNEL);
+			f->chain_fence = dma_fence_chain_alloc();
 			if (!f->chain_fence) {
 				drm_syncobj_put(syncobj);
 				dma_fence_put(fence);
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5480852bdeda..6ff6df6c4791 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -586,9 +586,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 				break;
 			}
 
-			post_deps[i].chain =
-				kmalloc(sizeof(*post_deps[i].chain),
-				        GFP_KERNEL);
+			post_deps[i].chain = dma_fence_chain_alloc();
 			if (!post_deps[i].chain) {
 				ret = -ENOMEM;
 				break;
@@ -605,7 +603,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 
 	if (ret) {
 		for (j = 0; j <= i; ++j) {
-			kfree(post_deps[j].chain);
+			dma_fence_chain_free(post_deps[j].chain);
 			if (post_deps[j].syncobj)
 				drm_syncobj_put(post_deps[j].syncobj);
 		}
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 9d6a062be640..5f45689a6d2e 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -12,6 +12,7 @@
 
 #include <linux/dma-fence.h>
 #include <linux/irq_work.h>
+#include <linux/slab.h>
 
 /**
  * struct dma_fence_chain - fence to represent an node of a fence chain
@@ -53,6 +54,27 @@ to_dma_fence_chain(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_chain, base);
 }
 
+/**
+ * dma_fence_chain_alloc
+ *
+ * Returns a new dma_fence_chain object
+ */
+static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
+{
+	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
+};
+
+/**
+ * dma_fence_chain_free
+ * @chain: chain node to free
+ *
+ * Frees up an allocated but not used dma_fence_chain node.
+ */
+static inline void dma_fence_chain_free(struct dma_fence_chain *chain)
+{
+	kfree(chain);
+};
+
 /**
  * dma_fence_chain_for_each - iterate over all fences in chain
  * @iter: current fence
-- 
2.25.1

