Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A973A419D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 14:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD956EE86;
	Fri, 11 Jun 2021 12:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1F6EE7F;
 Fri, 11 Jun 2021 12:03:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso8510492wmh.4; 
 Fri, 11 Jun 2021 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=elKEAajOWarew9HukDqn77zp0r5BdekuHi3PJYLH9hE=;
 b=eKvIP5Mwx1pKqwwmgjbaRopaImqSls5aNmEvtdMOlYMuDvfNp/N3mENQy7au3Gdv2D
 OfK3YCjOLuPKbZUAm/4w5qBKqv9DMtP88h+f+1xZS1pQbscgacY0a0AKLwC1+k+DWZQ1
 mzhJKikqMrScjAMKywudPbMMAYssy6mcF9wsV6hb8UGBvT3InPI/dLnK6s7TId5N4Qgo
 tjs7KxBlfGphR+zTYOlN7/nVg9EcQB3wtkz9g6Dgh0GJbn6jOHHquMoYA298YJvlL3/A
 EMRF+fD3YxCj9/pwTk1yGOAm81P5dgSmpHoiKGcq/nIVB0TeN6RHBkIFcfXoEiuG/hsL
 L8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=elKEAajOWarew9HukDqn77zp0r5BdekuHi3PJYLH9hE=;
 b=PDeTBsPXTbrnOm7K9JOio1bLwv1uHa+HpCuujFV2x9pzgIqTa0McTg1T9EJXQIF5Yu
 IvS3ePSS1ieb1aDF3NW0nwXn8QIGso7xEeChO/WUoX55nh20FLMi/sKxcDdLgJyz9guM
 zgD6a/LdLZqMu73CL/WGsVBIirbDD6R1byUNuHhMkUJ3Hfz7zo0WlniAiL0zLZSnQFfs
 IAYWeDpCbYRP5Nxzlm+ZYd6IOx1g5iskrDK9JPrsuzQk/7OuEpy1CAh/j34UPP43XLdJ
 mYBBNWKMJNRKK3LpYcBuHm/Yh1tMWW57fQK/TgRd/NdyQGSi9DfSs41dJyDYrFPhTWY6
 Wgww==
X-Gm-Message-State: AOAM531lsFM9ssysPK9B48NjzgWrCSAC1rtdvDyhp5WjHHazokxiq+yD
 69ceW5+PhzqKEwRBemkMpgQ=
X-Google-Smtp-Source: ABdhPJxjZQnpjVtIgNRaxVTlWQBZj6BzKT+6PIlLweyrZgY+ygby+nu0oArQcpnG+tlE++/hG5NP7A==
X-Received: by 2002:a05:600c:4148:: with SMTP id
 h8mr19751988wmm.176.1623412983637; 
 Fri, 11 Jun 2021 05:03:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:657d:4ae8:def3:d96a])
 by smtp.gmail.com with ESMTPSA id f13sm6898361wrt.86.2021.06.11.05.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 05:03:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] dma-buf: add dma_fence_chain_alloc/free v2
Date: Fri, 11 Jun 2021 14:02:59 +0200
Message-Id: <20210611120301.10595-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611120301.10595-1-christian.koenig@amd.com>
References: <20210611120301.10595-1-christian.koenig@amd.com>
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

v2: polish kernel doc a bit

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/st-dma-fence-chain.c          | 16 ++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 ++--
 drivers/gpu/drm/drm_syncobj.c                 |  6 ++---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++---
 drivers/gpu/drm/msm/msm_gem_submit.c          |  6 ++---
 include/linux/dma-fence-chain.h               | 23 +++++++++++++++++++
 6 files changed, 36 insertions(+), 25 deletions(-)

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
index c6eb3aa45668..7ec36d850363 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -12,6 +12,7 @@
 
 #include <linux/dma-fence.h>
 #include <linux/irq_work.h>
+#include <linux/slab.h>
 
 /**
  * struct dma_fence_chain - fence to represent an node of a fence chain
@@ -66,6 +67,28 @@ to_dma_fence_chain(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_chain, base);
 }
 
+/**
+ * dma_fence_chain_alloc
+ *
+ * Returns a new dma_fence_chain object or NULL on failure.
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
+ * Frees up an allocated but not used dma_fence_chain node. This doesn't need
+ * an RCU grace period since the fence was never initialized nor published.
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

