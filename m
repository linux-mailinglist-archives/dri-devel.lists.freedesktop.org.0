Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC409784D6C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 01:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C81D10E078;
	Tue, 22 Aug 2023 23:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FFB10E078
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 23:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692747705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nsnxJk65dFpflCIpKgOgUQnHPy3UkHdJC4ely2iIRmI=;
 b=eLCL2o1jPiEsta08Wm+ZnzjEtIwyzqtP44s9/beenrbdOKw6PnwNuPkdkduVFuLNcQCmWL
 SOjQoUfw3GAj/8UEFsn1EPyz+DSJspbn5fen/vC9VfCWJm9TqaCUG/6u8ERzxR2psclOLb
 j0ush99u7oRAtGaH8Z2p8ZJRvO8KXbk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-9JaHs2JYMUa5hfLuraDtwA-1; Tue, 22 Aug 2023 19:41:44 -0400
X-MC-Unique: 9JaHs2JYMUa5hfLuraDtwA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9a0955ac1dcso322576666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692747703; x=1693352503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nsnxJk65dFpflCIpKgOgUQnHPy3UkHdJC4ely2iIRmI=;
 b=Y9WOK0S6wpwfGLKQyhzYl6chYDDg2Wx6AMkHIO+u0KtJfg1MpVLJlwzC9HXwCPbPeu
 5JadTEHdjGZxhxPUI8XHzLe222qjGbAqsJKG9uE6WJYCkGxSUy6CkLYkadF2qNmDvXJE
 PHlKxWymJQxcvs7JApW8wte/oROu8OAgssYFQjf4AZY6Xv6KNRQbKjoUNxEoTq4dVJeu
 P0KSjISsqKIf8qFu+9jLy/YPbmC9XiBvJqqndG7gxcxzWvpcgdVevTmdsQKYBAlQBJzJ
 oHya5vXQ5AYsuQHoaommqJgxe7y/lfxAqLde63rgzREMPxcy5lvNiVfOzJhyNxPY8WZE
 AfKQ==
X-Gm-Message-State: AOJu0YytY++nGvp9tVIb+wrudjc4++uM4GhkOyuC2u+NyfxnnNv7y7Yp
 gweisxsrYSSLAa7UdQL9Bcef9MJZOo9uvx7oeVqg8vrnG4haOseCfFL66hyIl0Kbbl9rtgpLdzj
 YUVNItS3O6p33WNGkEl6yFEKgoF0H
X-Received: by 2002:a17:906:3187:b0:9a1:8812:a8a6 with SMTP id
 7-20020a170906318700b009a18812a8a6mr3915015ejy.73.1692747703217; 
 Tue, 22 Aug 2023 16:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTK0EjRJ9Yi8oW74L8VpAZuHS3eGC1iNYy3R9uNrDphgrWEnm2dsd/M85riAnQThkGZg2rhw==
X-Received: by 2002:a17:906:3187:b0:9a1:8812:a8a6 with SMTP id
 7-20020a170906318700b009a18812a8a6mr3915007ejy.73.1692747702887; 
 Tue, 22 Aug 2023 16:41:42 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a170906409600b009929ab17be0sm8947280ejj.162.2023.08.22.16.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 16:41:42 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next] drm/nouveau: uapi: don't pass NO_PREFETCH flag
 implicitly
Date: Wed, 23 Aug 2023 01:41:36 +0200
Message-ID: <20230822234139.11185-1-dakr@redhat.com>
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
 drivers/gpu/drm/nouveau/nouveau_dma.c  |  7 +++++--
 drivers/gpu/drm/nouveau/nouveau_dma.h  |  8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_exec.c | 15 ++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_gem.c  |  6 ++++--
 include/uapi/drm/nouveau_drm.h         |  8 +++++++-
 5 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index b90cac6d5772..059925e5db6a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -69,16 +69,19 @@ READ_GET(struct nouveau_channel *chan, uint64_t *prev_get, int *timeout)
 }
 
 void
-nv50_dma_push(struct nouveau_channel *chan, u64 offset, int length)
+nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
+	      bool prefetch)
 {
 	struct nvif_user *user = &chan->drm->client.device.user;
 	struct nouveau_bo *pb = chan->push.buffer;
 	int ip = (chan->dma.ib_put * 2) + chan->dma.ib_base;
 
 	BUG_ON(chan->dma.ib_free < 1);
+	WARN_ON(length > NV50_DMA_PUSH_MAX_LENGTH);
 
 	nouveau_bo_wr32(pb, ip++, lower_32_bits(offset));
-	nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8);
+	nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8 |
+			(prefetch ? 0 : (1 << 31)));
 
 	chan->dma.ib_put = (chan->dma.ib_put + 1) & chan->dma.ib_max;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 035a709c7be1..fb471c357336 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -31,7 +31,8 @@
 #include "nouveau_chan.h"
 
 int nouveau_dma_wait(struct nouveau_channel *, int slots, int size);
-void nv50_dma_push(struct nouveau_channel *, u64 addr, int length);
+void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,
+		   bool prefetch);
 
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
+			      (chan->dma.cur - chan->dma.put) << 2, true);
 	} else {
 		WRITE_PUT(chan->dma.cur);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 0f927adda4ed..a123b07b2adf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -164,8 +164,10 @@ nouveau_exec_job_run(struct nouveau_job *job)
 	}
 
 	for (i = 0; i < exec_job->push.count; i++) {
-		nv50_dma_push(chan, exec_job->push.s[i].va,
-			      exec_job->push.s[i].va_len);
+		struct drm_nouveau_exec_push *p = &exec_job->push.s[i];
+		bool prefetch = !(p->flags & DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH);
+
+		nv50_dma_push(chan, p->va, p->va_len, prefetch);
 	}
 
 	ret = nouveau_fence_emit(fence, chan);
@@ -223,7 +225,14 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
 {
 	struct nouveau_exec_job *job;
 	struct nouveau_job_args args = {};
-	int ret;
+	int i, ret;
+
+	for (i = 0; i < __args->push.count; i++) {
+		struct drm_nouveau_exec_push *p = &__args->push.s[i];
+
+		if (p->va_len > NV50_DMA_PUSH_MAX_LENGTH)
+			return -EINVAL;
+	}
 
 	job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
 	if (!job)
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f39360870c70..2f3dc4d71657 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -856,9 +856,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		for (i = 0; i < req->nr_push; i++) {
 			struct nouveau_vma *vma = (void *)(unsigned long)
 				bo[push[i].bo_index].user_priv;
+			u64 addr = vma->addr + push[i].offset;
+			u32 length = push[i].length & ~NOUVEAU_GEM_PUSHBUF_NO_PREFETCH;
+			bool prefetch = !(push[i].length & NOUVEAU_GEM_PUSHBUF_NO_PREFETCH);
 
-			nv50_dma_push(chan, vma->addr + push[i].offset,
-				      push[i].length);
+			nv50_dma_push(chan, addr, length, prefetch);
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

base-commit: ad1367f831f8743746a1f49705c28e36a7c95525
-- 
2.41.0

