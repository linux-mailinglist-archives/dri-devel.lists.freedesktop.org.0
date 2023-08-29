Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDAF78CF92
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 00:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA51A10E0C0;
	Tue, 29 Aug 2023 22:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA9910E093
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693348734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r98DhWYn76bXbFV0MugObewM9t30mn4sNMCX/GrL7K4=;
 b=PlR+ivWcot3WY2ELhJgWFLYH1Rn/bwaifuY41FjhOSQ6lW6Uy0FJAMhhAZ5vW9Ku6+Oc5U
 IbogFRJLWQbX3M49Tl9bKnpC5UotutDsDRIX7drdmsQYBaI6G/tjHN1uL3qOYQP6d5gOTs
 7pV4tzH3mSYsoITaokPCke8+X79m8xQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-Gc8tWgOVOuafIgOouPPkwQ-1; Tue, 29 Aug 2023 18:38:53 -0400
X-MC-Unique: Gc8tWgOVOuafIgOouPPkwQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-52a0f5f74d7so3890759a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 15:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693348732; x=1693953532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r98DhWYn76bXbFV0MugObewM9t30mn4sNMCX/GrL7K4=;
 b=ZT5vAIJd9pn904qt+zLxsWShSBREsKbsvLY7bLZLCZ3qfNiY2kJAO6cz+XAmWwDVy0
 Pqw91qQk6buq/QAE7Ux4XtyQpSw8VkIaFge9cbJGiZBW/3F/TXXWiO1yvlhej/DC/ipv
 OJHHctiu2jueu620PLpsVmK4k4oNrRoGtsJIMhIvfMMb+IXNOsV3OZEMMO5yTiQYfJOF
 7z+vdSzDooIW5hf/0/engc+zxZg4X38ypKX9PceM2yy9uBqw52XxTK9HRhFn877gtVZ3
 psvQwyo0Us6SAscBvQYmZhLTDSoQABRoc5ewcxitEMiBW6MxL+dXBXHQ7o+lNVUG3xd0
 NX/A==
X-Gm-Message-State: AOJu0YyOfr98pYGwfXGui+ZVan1Itp7IK9YZG6IOeAMhirFi9qIRWknD
 n6rmERwQ3X3dDDDBmPwiQSyzaB8uhWtpG2ujsL7bp9pTasL4/ND8+pJZfKZdslU73MfB52BwTug
 r2yTlWUtsd/qFUoXiEF6Xq2w4M4AJ7uXKgr8I
X-Received: by 2002:aa7:d80f:0:b0:52b:ce21:ad12 with SMTP id
 v15-20020aa7d80f000000b0052bce21ad12mr401600edq.4.1693348732023; 
 Tue, 29 Aug 2023 15:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjk0lfDvgy72T8NbBJtAHGtGkXRpnUhNw5ZQn26Vg9c92+znYwTPBHqjB14TaSsXNMGh67Zw==
X-Received: by 2002:aa7:d80f:0:b0:52b:ce21:ad12 with SMTP id
 v15-20020aa7d80f000000b0052bce21ad12mr401593edq.4.1693348731650; 
 Tue, 29 Aug 2023 15:38:51 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a50fa96000000b0052a3aa50d72sm6086104edr.40.2023.08.29.15.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 15:38:51 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com,
	kherbst@redhat.com,
	lyude@redhat.com
Subject: [PATCH drm-misc-next] drm/nouveau: fence: fix undefined fence state
 after emit
Date: Wed, 30 Aug 2023 00:38:02 +0200
Message-ID: <20230829223847.4406-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_fence_emit() can fail before and after initializing the
dma-fence and hence before and after initializing the dma-fence' kref.

In order to avoid nouveau_fence_emit() potentially failing before
dma-fence initialization pass the channel to nouveau_fence_new() already
and perform the required check before even allocating the fence.

While at it, restore the original behavior of nouveau_fence_new() and
add nouveau_fence_create() for separate (pre-)allocation instead. Always
splitting up allocation end emit wasn't a good idea in the first place.
Hence, limit it to the places where we actually need to pre-allocate.

Fixes: 7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  9 +------
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  8 +------
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  6 ++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  9 +++----
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 11 ++++++---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 32 ++++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_fence.h |  5 ++--
 drivers/gpu/drm/nouveau/nouveau_gem.c   |  5 +---
 8 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index a34924523133..a34917b048f9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1122,18 +1122,11 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 	PUSH_NVSQ(push, NV_SW, NV_SW_PAGE_FLIP, 0x00000000);
 	PUSH_KICK(push);
 
-	ret = nouveau_fence_new(pfence);
+	ret = nouveau_fence_new(pfence, chan);
 	if (ret)
 		goto fail;
 
-	ret = nouveau_fence_emit(*pfence, chan);
-	if (ret)
-		goto fail_fence_unref;
-
 	return 0;
-
-fail_fence_unref:
-	nouveau_fence_unref(pfence);
 fail:
 	spin_lock_irqsave(&dev->event_lock, flags);
 	list_del(&s->head);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 64f50adb2856..56427b6a00a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -875,16 +875,10 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 	if (ret)
 		goto out_unlock;
 
-	ret = nouveau_fence_new(&fence);
+	ret = nouveau_fence_new(&fence, chan);
 	if (ret)
 		goto out_unlock;
 
-	ret = nouveau_fence_emit(fence, chan);
-	if (ret) {
-		nouveau_fence_unref(&fence);
-		goto out_unlock;
-	}
-
 	/* TODO: figure out a better solution here
 	 *
 	 * wait on the fence here explicitly as going through
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1fd5ccf41128..bb3d6e5c122f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -70,11 +70,9 @@ nouveau_channel_idle(struct nouveau_channel *chan)
 		struct nouveau_fence *fence = NULL;
 		int ret;
 
-		ret = nouveau_fence_new(&fence);
+		ret = nouveau_fence_new(&fence, chan);
 		if (!ret) {
-			ret = nouveau_fence_emit(fence, chan);
-			if (!ret)
-				ret = nouveau_fence_wait(fence, false, false);
+			ret = nouveau_fence_wait(fence, false, false);
 			nouveau_fence_unref(&fence);
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 61e84562094a..12feecf71e75 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -209,8 +209,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	if (!nouveau_fence_new(&fence))
-		nouveau_fence_emit(fence, dmem->migrate.chan);
+	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
 	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
@@ -403,8 +402,7 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 		}
 	}
 
-	if (!nouveau_fence_new(&fence))
-		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
+	nouveau_fence_new(&fence, chunk->drm->dmem->migrate.chan);
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	nouveau_dmem_fence_done(&fence);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -677,8 +675,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		addr += PAGE_SIZE;
 	}
 
-	if (!nouveau_fence_new(&fence))
-		nouveau_fence_emit(fence, drm->dmem->migrate.chan);
+	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 98a7a94cec5a..72f6543a0790 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -91,7 +91,8 @@ nouveau_exec_job_submit(struct nouveau_job *job)
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
 	int ret;
 
-	ret = nouveau_fence_new(&exec_job->fence);
+	/* Create a new fence, but do not emit yet. */
+	ret = nouveau_fence_create(&exec_job->fence, exec_job->chan);
 	if (ret)
 		return ret;
 
@@ -143,13 +144,17 @@ nouveau_exec_job_run(struct nouveau_job *job)
 		nv50_dma_push(chan, p->va, p->va_len, no_prefetch);
 	}
 
-	ret = nouveau_fence_emit(fence, chan);
+	ret = nouveau_fence_emit(fence);
 	if (ret) {
+		nouveau_fence_unref(&exec_job->fence);
 		NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
 		return ERR_PTR(ret);
 	}
 
+	/* The fence was emitted successfully, set the job's fence pointer to
+	 * NULL in order to avoid freeing it up when the job is cleaned up.
+	 */
 	exec_job->fence = NULL;
 
 	return &fence->base;
@@ -162,7 +167,7 @@ nouveau_exec_job_free(struct nouveau_job *job)
 
 	nouveau_job_free(job);
 
-	nouveau_fence_unref(&exec_job->fence);
+	kfree(exec_job->fence);
 	kfree(exec_job->push.s);
 	kfree(exec_job);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 77c739a55b19..61d9e70da9fd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -205,16 +205,13 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 }
 
 int
-nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
+nouveau_fence_emit(struct nouveau_fence *fence)
 {
+	struct nouveau_channel *chan = fence->channel;
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
 	int ret;
 
-	if (unlikely(!chan->fence))
-		return -ENODEV;
-
-	fence->channel  = chan;
 	fence->timeout  = jiffies + (15 * HZ);
 
 	if (priv->uevent)
@@ -406,18 +403,41 @@ nouveau_fence_unref(struct nouveau_fence **pfence)
 }
 
 int
-nouveau_fence_new(struct nouveau_fence **pfence)
+nouveau_fence_create(struct nouveau_fence **pfence,
+		     struct nouveau_channel *chan)
 {
 	struct nouveau_fence *fence;
 
+	if (unlikely(!chan->fence))
+		return -ENODEV;
+
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
 	if (!fence)
 		return -ENOMEM;
 
+	fence->channel = chan;
+
 	*pfence = fence;
 	return 0;
 }
 
+int
+nouveau_fence_new(struct nouveau_fence **pfence,
+		  struct nouveau_channel *chan)
+{
+	int ret = 0;
+
+	ret = nouveau_fence_create(pfence, chan);
+	if (ret)
+		return ret;
+
+	ret = nouveau_fence_emit(*pfence);
+	if (ret)
+		nouveau_fence_unref(pfence);
+
+	return ret;
+}
+
 static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
 {
 	return "nouveau";
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 2c72d96ef17d..64d33ae7f356 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -17,10 +17,11 @@ struct nouveau_fence {
 	unsigned long timeout;
 };
 
-int  nouveau_fence_new(struct nouveau_fence **);
+int  nouveau_fence_create(struct nouveau_fence **, struct nouveau_channel *);
+int  nouveau_fence_new(struct nouveau_fence **, struct nouveau_channel *);
 void nouveau_fence_unref(struct nouveau_fence **);
 
-int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
+int  nouveau_fence_emit(struct nouveau_fence *);
 bool nouveau_fence_done(struct nouveau_fence *);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
 int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index a03fe3e92059..254524fee4fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -914,11 +914,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = nouveau_fence_new(&fence);
-	if (!ret)
-		ret = nouveau_fence_emit(fence, chan);
+	ret = nouveau_fence_new(&fence, chan);
 	if (ret) {
-		nouveau_fence_unref(&fence);
 		NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
 		goto out;
-- 
2.41.0

