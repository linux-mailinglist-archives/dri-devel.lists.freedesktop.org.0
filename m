Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4171785F74
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 20:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63AA10E0A8;
	Wed, 23 Aug 2023 18:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB90E10E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692814672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IpGOgmUhWVtfg8Jy3IQADlYUp+uCywa6wHJzm22n/zo=;
 b=J6SpqVphlJQzK908oAzpz/Pm1BD4V18CtuQp7tiiUWhqp4gxGlQl8ETsX3WjTcAbG+Y8cd
 dcHvwwD9R8j0BGlKJ1Vx1xmk5mZTXw5emxxQ0GmI/P4DjWi0E3lgg7w6BP0ge6y61Khn5k
 3+eP1gJLYncMujUp6dDRWOLHIOk8lRQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-GAmrnbjsNhWFEqXPahVczQ-1; Wed, 23 Aug 2023 14:17:51 -0400
X-MC-Unique: GAmrnbjsNhWFEqXPahVczQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2bcc03ed694so37200181fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 11:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692814669; x=1693419469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IpGOgmUhWVtfg8Jy3IQADlYUp+uCywa6wHJzm22n/zo=;
 b=dAZyhxVLtKFFOCH4rGGYmvFdWktfXYliXFMSj8Ao5/+ZfVlLXnbvRZBJsUWC3I1EPq
 vQscmi7Ul/atdT9DANzWBr/re4DQjV51qpnLtvSCZxFVhOI7tNP4E33CElFavYNdwvn8
 JhvhQjp7sT6sjoADEC8BURqtFHyxvK8i3GaBSAe0B5OoEU4T9v+yRL0YWy2c2npeb9UU
 KvUx6V2XiJly3ic/6oDPxqgjDjfCwUz4rAhYvX+02AuwIGwHl6bRTt9siVoqGqKcXRor
 bruqxfm3FVruF1SOsuHW5EIDTOQMKWcjF7OXb0rTzmWLoApXkxed8+t1DlRlvRETYpGe
 ibZQ==
X-Gm-Message-State: AOJu0YwSsHCQ8rxOKjzs8H4XTb19aDWabZrBcXOtQeNqxq4Z36pjs186
 Wk7835NuToEpAbPxXuzWJeTfHC7QdmDRP1w0k2VpQsCcsL/gFEn1hvK+BhrXAb2oiUtrH7Il5dM
 nyNqIyX6r03y1usq9hQnPvLxg23dh
X-Received: by 2002:a05:6512:114d:b0:4fe:551:3d3c with SMTP id
 m13-20020a056512114d00b004fe05513d3cmr12961865lfg.36.1692814669707; 
 Wed, 23 Aug 2023 11:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6JGjGQ3uz1IK5zG2DuJQq8IbLQzB40mEuCaXuWP4QnqW0uNlzYwWYYNGFOkZYRVm3DCtwBg==
X-Received: by 2002:a05:6512:114d:b0:4fe:551:3d3c with SMTP id
 m13-20020a056512114d00b004fe05513d3cmr12961845lfg.36.1692814669303; 
 Wed, 23 Aug 2023 11:17:49 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a50fb8e000000b00523653295f9sm9652314edq.94.2023.08.23.11.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 11:17:48 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v2] drm/nouveau: uapi: don't pass NO_PREFETCH
 flag implicitly
Date: Wed, 23 Aug 2023 20:15:34 +0200
Message-ID: <20230823181746.3446-1-dakr@redhat.com>
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

Currently, NO_PREFETCH is passed implicitly through
drm_nouveau_gem_pushbuf_push::length and drm_nouveau_exec_push::va_len.

Since this is a direct representation of how the HW is programmed it
isn't really future proof for a uAPI. Hence, fix this up for the new
uAPI and split up the va_len field of struct drm_nouveau_exec_push,
such that we keep 32bit for va_len and 32bit for flags.

For drm_nouveau_gem_pushbuf_push::length at least provide
NOUVEAU_GEM_PUSHBUF_NO_PREFETCH to indicate the bit shift.

While at it, fix up nv50_dma_push() as well, such that the caller
doesn't need to encode the NO_PREFETCH flag into the length parameter.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Changes in v2:
  - dma: rename prefetch to no_prefetch in nv50_dma_push() (Faith)
  - exec: print error message when pushbuf size larger max pushbuf size (Faith)
---
 drivers/gpu/drm/nouveau/nouveau_dma.c  |  7 +++++--
 drivers/gpu/drm/nouveau/nouveau_dma.h  |  8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_exec.c | 19 ++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_gem.c  |  6 ++++--
 include/uapi/drm/nouveau_drm.h         |  8 +++++++-
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index b90cac6d5772..b01c029f3a90 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -69,16 +69,19 @@ READ_GET(struct nouveau_channel *chan, uint64_t *prev_get, int *timeout)
 }
 
 void
-nv50_dma_push(struct nouveau_channel *chan, u64 offset, int length)
+nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
+	      bool no_prefetch)
 {
 	struct nvif_user *user = &chan->drm->client.device.user;
 	struct nouveau_bo *pb = chan->push.buffer;
 	int ip = (chan->dma.ib_put * 2) + chan->dma.ib_base;
 
 	BUG_ON(chan->dma.ib_free < 1);
+	WARN_ON(length > NV50_DMA_PUSH_MAX_LENGTH);
 
 	nouveau_bo_wr32(pb, ip++, lower_32_bits(offset));
-	nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8);
+	nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8 |
+			(no_prefetch ? (1 << 31) : 0));
 
 	chan->dma.ib_put = (chan->dma.ib_put + 1) & chan->dma.ib_max;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 035a709c7be1..1744d95b233e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -31,7 +31,8 @@
 #include "nouveau_chan.h"
 
 int nouveau_dma_wait(struct nouveau_channel *, int slots, int size);
-void nv50_dma_push(struct nouveau_channel *, u64 addr, int length);
+void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,
+		   bool no_prefetch);
 
 /*
  * There's a hw race condition where you can't jump to your PUT offset,
@@ -45,6 +46,9 @@ void nv50_dma_push(struct nouveau_channel *, u64 addr, int length);
  */
 #define NOUVEAU_DMA_SKIPS (128 / 4)
 
+/* Maximum push buffer size. */
+#define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
+
 /* Object handles - for stuff that's doesn't use handle == oclass. */
 enum {
 	NvDmaFB		= 0x80000002,
@@ -89,7 +93,7 @@ FIRE_RING(struct nouveau_channel *chan)
 
 	if (chan->dma.ib_max) {
 		nv50_dma_push(chan, chan->push.addr + (chan->dma.put << 2),
-			      (chan->dma.cur - chan->dma.put) << 2);
+			      (chan->dma.cur - chan->dma.put) << 2, false);
 	} else {
 		WRITE_PUT(chan->dma.cur);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 0f927adda4ed..a90c4cd8cbb2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -164,8 +164,10 @@ nouveau_exec_job_run(struct nouveau_job *job)
 	}
 
 	for (i = 0; i < exec_job->push.count; i++) {
-		nv50_dma_push(chan, exec_job->push.s[i].va,
-			      exec_job->push.s[i].va_len);
+		struct drm_nouveau_exec_push *p = &exec_job->push.s[i];
+		bool no_prefetch = p->flags & DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH;
+
+		nv50_dma_push(chan, p->va, p->va_len, no_prefetch);
 	}
 
 	ret = nouveau_fence_emit(fence, chan);
@@ -223,7 +225,18 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
 {
 	struct nouveau_exec_job *job;
 	struct nouveau_job_args args = {};
-	int ret;
+	int i, ret;
+
+	for (i = 0; i < __args->push.count; i++) {
+		struct drm_nouveau_exec_push *p = &__args->push.s[i];
+
+		if (unlikely(p->va_len > NV50_DMA_PUSH_MAX_LENGTH)) {
+			NV_PRINTK(err, nouveau_cli(__args->file_priv),
+				  "pushbuf size exceeds limit: 0x%x max 0x%x\n",
+				  p->va_len, NV50_DMA_PUSH_MAX_LENGTH);
+			return -EINVAL;
+		}
+	}
 
 	job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
 	if (!job)
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f39360870c70..c0b10d8d3d03 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -856,9 +856,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		for (i = 0; i < req->nr_push; i++) {
 			struct nouveau_vma *vma = (void *)(unsigned long)
 				bo[push[i].bo_index].user_priv;
+			u64 addr = vma->addr + push[i].offset;
+			u32 length = push[i].length & ~NOUVEAU_GEM_PUSHBUF_NO_PREFETCH;
+			bool no_prefetch = push[i].length & NOUVEAU_GEM_PUSHBUF_NO_PREFETCH;
 
-			nv50_dma_push(chan, vma->addr + push[i].offset,
-				      push[i].length);
+			nv50_dma_push(chan, addr, length, no_prefetch);
 		}
 	} else
 	if (drm->client.device.info.chipset >= 0x25) {
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index b1ad9d5ffce8..8f16724b5d05 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -138,6 +138,7 @@ struct drm_nouveau_gem_pushbuf_push {
 	__u32 pad;
 	__u64 offset;
 	__u64 length;
+#define NOUVEAU_GEM_PUSHBUF_NO_PREFETCH (1 << 23)
 };
 
 struct drm_nouveau_gem_pushbuf {
@@ -338,7 +339,12 @@ struct drm_nouveau_exec_push {
 	/**
 	 * @va_len: the length of the push buffer mapping
 	 */
-	__u64 va_len;
+	__u32 va_len;
+	/**
+	 * flags: the flags for this push buffer mapping
+	 */
+	__u32 flags;
+#define DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH 0x1
 };
 
 /**

base-commit: b4e9fa933551e51459c634dc4396171dc65284a6
-- 
2.41.0

