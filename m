Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF43752960
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4586F10E71D;
	Thu, 13 Jul 2023 17:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC40310E73D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgxfk7UZeray3y05yq1+nzs2/x42gYLAHbNBvbFNbko=;
 b=cJBmYcWqzh8JKywaaAQRGBBHyJAO0/0D9XzC/PFKCxG2RLmvzp2v46qtzt3Q9fI2WBpiA7
 KYfZF5mOzdEy+FX4EOKZ7x7iyMqWmJhdVPsBEbzd46dQEcfceGgozTr4beSaV4w/nrdO9x
 VVAD2+TPqqTjUcxhtSGgjhS9pQf2Nz0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-mB7vzMR2OsaEIuEeHB5dfg-1; Thu, 13 Jul 2023 13:05:09 -0400
X-MC-Unique: mB7vzMR2OsaEIuEeHB5dfg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-51e0d7c6293so565926a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267908; x=1691859908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgxfk7UZeray3y05yq1+nzs2/x42gYLAHbNBvbFNbko=;
 b=N47o87UQrqs7JBmm95srWLZAVNQJwUKQ4CNunYaV9zU5EPrLNqK4T7/6qN47zHLbNE
 ZNvrc1mLYFe058mjwqQUVfckZch+6YQrYu4vtk3RemdMFoMJoOEgD1p9+gqAltibP6j5
 MriYxEBMAYund+lqtu5lnCdjyOjBLqXRX7QVSYuuUTyeMvhqrp5KwqAzM7J+14mYPVw6
 bzS3E0BQxVvYwLkANobvFoxvhxLDqwnb83q1BecuZr9BWZBuJcXbUluNWY4bgd906gyi
 hJOIF2AF5jQV96azOU8a7QlGR/B81a2NCevTUyOZs/OR5ZRPJ4+zqTBltPr25VLZTJvj
 QMuQ==
X-Gm-Message-State: ABy/qLYLw/h92fG3ACVqc2U5auHJy3QwQtgesZtcyXN/M6W8oSDDQXi5
 ZyiMvhJ/CNGT5WAeW4S9nlTok9aJBnWGbXRlyNO3wBSe+Mtr/2TLvVfnPrCMQm9N3rQWzckrvnP
 QGtjUInu9y8EcNWJ4hg4ihOyjrbkb
X-Received: by 2002:a50:fa8a:0:b0:51e:3c2:9881 with SMTP id
 w10-20020a50fa8a000000b0051e03c29881mr2134760edr.33.1689267908442; 
 Thu, 13 Jul 2023 10:05:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFKlj1nQnTVSEbPLnp4fvAz4gdvDgrGHOKJqeBPZCtKeL/SVmh0ErB35KNdn/PK1qY2Lffiyw==
X-Received: by 2002:a50:fa8a:0:b0:51e:3c2:9881 with SMTP id
 w10-20020a50fa8a000000b0051e03c29881mr2134729edr.33.1689267908146; 
 Thu, 13 Jul 2023 10:05:08 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7cf8e000000b0051e0f100c48sm4482170edx.22.2023.07.13.10.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:05:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-next v7 08/13] drm/nouveau: fence: separate fence alloc
 and emit
Date: Thu, 13 Jul 2023 19:04:03 +0200
Message-ID: <20230713170429.2964-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new (VM_BIND) UAPI exports DMA fences through DRM syncobjs. Hence,
in order to emit fences within DMA fence signalling critical sections
(e.g. as typically done in the DRM GPU schedulers run_job() callback) we
need to separate fence allocation and fence emitting.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  9 ++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 52 +++++++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  6 ++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  9 +++--
 drivers/gpu/drm/nouveau/nouveau_fence.c | 16 +++-----
 drivers/gpu/drm/nouveau/nouveau_fence.h |  3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   |  5 ++-
 7 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index a6f2e681bde9..a34924523133 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1122,11 +1122,18 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 	PUSH_NVSQ(push, NV_SW, NV_SW_PAGE_FLIP, 0x00000000);
 	PUSH_KICK(push);
 
-	ret = nouveau_fence_new(chan, false, pfence);
+	ret = nouveau_fence_new(pfence);
 	if (ret)
 		goto fail;
 
+	ret = nouveau_fence_emit(*pfence, chan);
+	if (ret)
+		goto fail_fence_unref;
+
 	return 0;
+
+fail_fence_unref:
+	nouveau_fence_unref(pfence);
 fail:
 	spin_lock_irqsave(&dev->event_lock, flags);
 	list_del(&s->head);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 057bc995f19b..e9cbbf594e6f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -820,29 +820,39 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 		mutex_lock(&cli->mutex);
 	else
 		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
+
 	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
-	if (ret == 0) {
-		ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
-		if (ret == 0) {
-			ret = nouveau_fence_new(chan, false, &fence);
-			if (ret == 0) {
-				/* TODO: figure out a better solution here
-				 *
-				 * wait on the fence here explicitly as going through
-				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
-				 *
-				 * Without this the operation can timeout and we'll fallback to a
-				 * software copy, which might take several minutes to finish.
-				 */
-				nouveau_fence_wait(fence, false, false);
-				ret = ttm_bo_move_accel_cleanup(bo,
-								&fence->base,
-								evict, false,
-								new_reg);
-				nouveau_fence_unref(&fence);
-			}
-		}
+	if (ret)
+		goto out_unlock;
+
+	ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
+	if (ret)
+		goto out_unlock;
+
+	ret = nouveau_fence_new(&fence);
+	if (ret)
+		goto out_unlock;
+
+	ret = nouveau_fence_emit(fence, chan);
+	if (ret) {
+		nouveau_fence_unref(&fence);
+		goto out_unlock;
 	}
+
+	/* TODO: figure out a better solution here
+	 *
+	 * wait on the fence here explicitly as going through
+	 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
+	 *
+	 * Without this the operation can timeout and we'll fallback to a
+	 * software copy, which might take several minutes to finish.
+	 */
+	nouveau_fence_wait(fence, false, false);
+	ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
+					new_reg);
+	nouveau_fence_unref(&fence);
+
+out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1068abe41024..f47c0363683c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -62,9 +62,11 @@ nouveau_channel_idle(struct nouveau_channel *chan)
 		struct nouveau_fence *fence = NULL;
 		int ret;
 
-		ret = nouveau_fence_new(chan, false, &fence);
+		ret = nouveau_fence_new(&fence);
 		if (!ret) {
-			ret = nouveau_fence_wait(fence, false, false);
+			ret = nouveau_fence_emit(fence, chan);
+			if (!ret)
+				ret = nouveau_fence_wait(fence, false, false);
 			nouveau_fence_unref(&fence);
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 789857faa048..4ad40e42cae1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -209,7 +209,8 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	nouveau_fence_new(dmem->migrate.chan, false, &fence);
+	if (!nouveau_fence_new(&fence))
+		nouveau_fence_emit(fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
 	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
@@ -402,7 +403,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 		}
 	}
 
-	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
+	if (!nouveau_fence_new(&fence))
+		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	nouveau_dmem_fence_done(&fence);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -675,7 +677,8 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		addr += PAGE_SIZE;
 	}
 
-	nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
+	if (!nouveau_fence_new(&fence))
+		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ee5e9d40c166..e946408f945b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -210,6 +210,9 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
 	int ret;
 
+	if (unlikely(!chan->fence))
+		return -ENODEV;
+
 	fence->channel  = chan;
 	fence->timeout  = jiffies + (15 * HZ);
 
@@ -396,25 +399,16 @@ nouveau_fence_unref(struct nouveau_fence **pfence)
 }
 
 int
-nouveau_fence_new(struct nouveau_channel *chan, bool sysmem,
-		  struct nouveau_fence **pfence)
+nouveau_fence_new(struct nouveau_fence **pfence)
 {
 	struct nouveau_fence *fence;
-	int ret = 0;
-
-	if (unlikely(!chan->fence))
-		return -ENODEV;
 
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
 	if (!fence)
 		return -ENOMEM;
 
-	ret = nouveau_fence_emit(fence, chan);
-	if (ret)
-		nouveau_fence_unref(&fence);
-
 	*pfence = fence;
-	return ret;
+	return 0;
 }
 
 static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 0ca2bc85adf6..7c73c7c9834a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -17,8 +17,7 @@ struct nouveau_fence {
 	unsigned long timeout;
 };
 
-int  nouveau_fence_new(struct nouveau_channel *, bool sysmem,
-		       struct nouveau_fence **);
+int  nouveau_fence_new(struct nouveau_fence **);
 void nouveau_fence_unref(struct nouveau_fence **);
 
 int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index a48f42aaeab9..9c8d1b911a01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -873,8 +873,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = nouveau_fence_new(chan, false, &fence);
+	ret = nouveau_fence_new(&fence);
+	if (!ret)
+		ret = nouveau_fence_emit(fence, chan);
 	if (ret) {
+		nouveau_fence_unref(&fence);
 		NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
 		goto out;
-- 
2.41.0

