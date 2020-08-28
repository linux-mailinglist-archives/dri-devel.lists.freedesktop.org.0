Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E32558AD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF2E6E488;
	Fri, 28 Aug 2020 10:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41756E488;
 Fri, 28 Aug 2020 10:40:27 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id bo3so854964ejb.11;
 Fri, 28 Aug 2020 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2sl6Y/YjHCrgRvOATWUMNP6OZZPyw4i1M6z54OUqRY=;
 b=RoQdXYNHk13SBBM9O9+L1VjpViP7K4a0efDItQPeYu8yMcbbRI8Kk2EbgivwGMfqSv
 ExqlPbijGfjt+7nyGXhov8ZRSnL2UCLi9mU59KPfh5d11+dufIzAb1f0niNEPTNR+zVE
 eVVMjBx8POoXqZnY+0ps/Ttr3QSJk2q9lLL39l5WXgRD1bUAf665Rlijll2cL/80ETY3
 VtBOEon0uqx0mUZcZ5o0zExSGA1SEQ0cMqFJKF80gPA1DKWmIyOe0Wkp7BjCUw/VgQTj
 RyglKHkBbCZShhQjKnblvuwxTzMi8LY0WoQ5sPUFqCclm+sz6AyJrndBUAem1u+QIh9+
 Fwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2sl6Y/YjHCrgRvOATWUMNP6OZZPyw4i1M6z54OUqRY=;
 b=mfbnFvDMPwiYcA7nievKnO9a7U+oBXJLCHZ4v7Zf931VjwPRke7IPlvptr4BPaSxGD
 MtIhN58iq8snaj7xX7XudFpsuuMcEEIpJvY9JapJvq9eBq2f7HXbUIhajZ3eiH2MOnAb
 zGE4w7sq38lxCtIBczbpaNprON94hy6kRH6hIAu3dsOqfod9G+iQSBODPy6lkmCPnG+i
 SxJA0UXzBR/ZeTwVpiAR0W1a7EQrOgUVr5q9z7tDeFNEfGo05A9VKugxz5SIsJbVCp8f
 Uzxv+23XIevH0tB4r+lxZAmvyBwBep34DcbwX32yFeZA0Wk43D/o9Mq4lKGMaIj24VVW
 RymA==
X-Gm-Message-State: AOAM531CPwxDHqOKK/0HoCmrVnlWK/lRqM4hTvIiKC/t17GaP0dYHaAR
 S0BNATEqalwWc4kopV2hzSM=
X-Google-Smtp-Source: ABdhPJzgviaWEz2Je727xSa17dqtVdUE+Voo1+8JCVdYkFMc5811DE9JaGdtlC8Af6T0KcgMNjC3rw==
X-Received: by 2002:a17:906:f897:: with SMTP id
 lg23mr1108899ejb.124.1598611226267; 
 Fri, 28 Aug 2020 03:40:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id d20sm566827ejj.10.2020.08.28.03.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:40:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 1/6] drm/nouveau: Split nouveau_fence_sync()
Date: Fri, 28 Aug 2020 12:40:11 +0200
Message-Id: <20200828104016.1672195-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828104016.1672195-1-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Turn nouveau_fence_sync() into a low-level helper that adds fence waits
to the channel command stream. The new nouveau_bo_sync() helper replaces
the previous nouveau_fence_sync() implementation. It passes each of the
buffer object's fences to nouveau_fence_sync() in turn.

This provides more fine-grained control over fences which is needed by
subsequent patches for sync fd support.

Heavily based on work by Lauri Peltonen <lpeltonen@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 38 +++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |  2 +
 drivers/gpu/drm/nouveau/nouveau_fence.c | 68 +++++--------------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   |  2 +-
 6 files changed, 57 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 6416b6907aeb..4af702d0d6bf 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1117,7 +1117,7 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 
 	/* Synchronize with the old framebuffer */
-	ret = nouveau_fence_sync(old_bo, chan, false, false);
+	ret = nouveau_bo_sync(old_bo, chan, false, false);
 	if (ret)
 		goto fail;
 
@@ -1183,7 +1183,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		goto fail_unpin;
 
 	/* synchronise rendering channel with the kernel's channel */
-	ret = nouveau_fence_sync(new_bo, chan, false, true);
+	ret = nouveau_bo_sync(new_bo, chan, false, true);
 	if (ret) {
 		ttm_bo_unreserve(&new_bo->bo);
 		goto fail_unpin;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 9140387f30dc..25ceabfa741c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -574,6 +574,42 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 					PAGE_SIZE, DMA_FROM_DEVICE);
 }
 
+int
+nouveau_bo_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
+		bool exclusive, bool intr)
+{
+	struct dma_resv *resv = nvbo->bo.base.resv;
+	struct dma_resv_list *fobj;
+	struct dma_fence *fence;
+	int ret = 0, i;
+
+	if (!exclusive) {
+		ret = dma_resv_reserve_shared(resv, 1);
+		if (ret < 0)
+			return ret;
+	}
+
+	fobj = dma_resv_get_list(resv);
+	fence = dma_resv_get_excl(resv);
+
+	if (fence && (!exclusive || !fobj || !fobj->shared_count))
+		return nouveau_fence_sync(fence, chan, intr);
+
+	if (!exclusive || !fobj)
+		return ret;
+
+	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+		fence = rcu_dereference_protected(fobj->shared[i],
+						  dma_resv_held(resv));
+
+		ret = nouveau_fence_sync(fence, chan, intr);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
 int
 nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
 		    bool no_wait_gpu)
@@ -717,7 +753,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 	}
 
 	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
-	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
+	ret = nouveau_bo_sync(nouveau_bo(bo), chan, true, intr);
 	if (ret == 0) {
 		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
 		if (ret == 0) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index aecb7481df0d..93d1706619a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -96,6 +96,8 @@ int  nouveau_bo_validate(struct nouveau_bo *, bool interruptible,
 			 bool no_wait_gpu);
 void nouveau_bo_sync_for_device(struct nouveau_bo *nvbo);
 void nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo);
+int nouveau_bo_sync(struct nouveau_bo *nvbo, struct nouveau_channel *channel,
+		    bool exclusive, bool intr);
 
 /* TODO: submit equivalent to TTM generic API upstream? */
 static inline void __iomem *
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index e5dcbf67de7e..8e7550553584 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -339,66 +339,26 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 }
 
 int
-nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
+nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		   bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct dma_fence *fence;
-	struct dma_resv *resv = nvbo->bo.base.resv;
-	struct dma_resv_list *fobj;
+	struct nouveau_channel *prev = NULL;
 	struct nouveau_fence *f;
-	int ret = 0, i;
-
-	if (!exclusive) {
-		ret = dma_resv_reserve_shared(resv, 1);
+	bool must_wait = true;
+	int ret = 0;
 
-		if (ret)
-			return ret;
+	f = nouveau_local_fence(fence, chan->drm);
+	if (f) {
+		rcu_read_lock();
+		prev = rcu_dereference(f->channel);
+		if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
+			must_wait = false;
+		rcu_read_unlock();
 	}
 
-	fobj = dma_resv_get_list(resv);
-	fence = dma_resv_get_excl(resv);
-
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
-		struct nouveau_channel *prev = NULL;
-		bool must_wait = true;
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f) {
-			rcu_read_lock();
-			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
-				must_wait = false;
-			rcu_read_unlock();
-		}
-
-		if (must_wait)
-			ret = dma_fence_wait(fence, intr);
-
-		return ret;
-	}
-
-	if (!exclusive || !fobj)
-		return ret;
-
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
-		struct nouveau_channel *prev = NULL;
-		bool must_wait = true;
-
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f) {
-			rcu_read_lock();
-			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
-				must_wait = false;
-			rcu_read_unlock();
-		}
-
-		if (must_wait)
-			ret = dma_fence_wait(fence, intr);
-	}
+	if (must_wait)
+		ret = dma_fence_wait(fence, intr);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 4887caa69c65..76cbf0c27a30 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -24,7 +24,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
 int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
 bool nouveau_fence_done(struct nouveau_fence *);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
-int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
+int  nouveau_fence_sync(struct dma_fence *, struct nouveau_channel *, bool intr);
 
 struct nouveau_fence_chan {
 	spinlock_t lock;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 81f111ad3f4f..590e4c1d2e8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -513,7 +513,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 			return ret;
 		}
 
-		ret = nouveau_fence_sync(nvbo, chan, !!b->write_domains, true);
+		ret = nouveau_bo_sync(nvbo, chan, !!b->write_domains, true);
 		if (unlikely(ret)) {
 			if (ret != -ERESTARTSYS)
 				NV_PRINTK(err, cli, "fail post-validate sync\n");
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
