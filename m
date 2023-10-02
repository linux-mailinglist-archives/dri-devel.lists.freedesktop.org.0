Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EAE7B5453
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 15:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BC110E2BC;
	Mon,  2 Oct 2023 13:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AB010E2BA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696254640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=warhHSXgI/t+KTjVUeI2wXVbI9QG6djeQc29DPD2B7U=;
 b=Dhva7rE6oQwPPovGLZEMKPjp/NamD8reRHo2ZSEbr9Y15+tybR/k57MQ+aRhxLt2LjxTMI
 dQ7HxjTUDUtcNdrRfoF2uGT3UbkPbyuxlJ1ZkiT3z0gHNPPygGJ3H/0r4AbN6Kf0rCsY+N
 dvynvOXOio4gOTAcbLb8Z8215T1ysgM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-Hl6CeI2AOIKkYVsg8lP3Ig-1; Mon, 02 Oct 2023 09:50:24 -0400
X-MC-Unique: Hl6CeI2AOIKkYVsg8lP3Ig-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-533d8a785a5so11157278a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 06:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696254623; x=1696859423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=warhHSXgI/t+KTjVUeI2wXVbI9QG6djeQc29DPD2B7U=;
 b=FTFa5IWNcDQCuPzd8RcyRgn4LQ+Z0f6L3ZpvToienRW6hCqVzqUK4YnrUayEQq3y+8
 Hr/tVzBDgx1MnVDmC4kQ6188htQvb6twwzDmkhxw6cHJIq1QPYzYTY0VFddR2OuXkKrr
 rdsWdq32iOOAjKK0PlJgLP4cF7frruAZQkOB8gsHJO7ybrwHiVWRKuJOnK10mufa0HDj
 sMj/BFtR/vuLT7aSFa4a7KpGSm4MVWjk66znioLDgB3FruwlTAkF2XMb5aokdNBFc7Y3
 lGzSC7ASV0fhyrU2WIJM2vFZmWhOZagg3vd6Z/klBPjUR4F4d96Q/L9lcwp4LohsjeS7
 mjzQ==
X-Gm-Message-State: AOJu0YyxlY/8zCjt/CgZY+d0pNKdDBSvY/4IREGJkzIgncbfAUP2/fXm
 WpA6Vxtj9ilAhbhHf2BKWY5390xApnK7UasAUbxWLZ6hetmSLhPHi9qqDlibE9wcfH71WPR6LAV
 bYrDXZzFZn7lHZeLjnLvO3Lu2nX6p
X-Received: by 2002:a17:906:8472:b0:9b2:ccd8:2d42 with SMTP id
 hx18-20020a170906847200b009b2ccd82d42mr7760062ejc.32.1696254623065; 
 Mon, 02 Oct 2023 06:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYfCckFQAOMGzbEEzF3NniKUhh+9sq4q4srOCNaltqKEjSIX7WQqxZQ6OtR9QO6fwgoZ4evA==
X-Received: by 2002:a17:906:8472:b0:9b2:ccd8:2d42 with SMTP id
 hx18-20020a170906847200b009b2ccd82d42mr7760043ejc.32.1696254622702; 
 Mon, 02 Oct 2023 06:50:22 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a170906278b00b00977eec7b7e8sm17159249ejc.68.2023.10.02.06.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 06:50:21 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith@gfxstrand.net
Subject: [PATCH v2 3/3] drm/nouveau: exec: report max pushs through getparam
Date: Mon,  2 Oct 2023 15:46:48 +0200
Message-ID: <20231002135008.10651-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002135008.10651-1-dakr@redhat.com>
References: <20231002135008.10651-1-dakr@redhat.com>
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
Cc: kherbst@redhat.com, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Report the maximum number of IBs that can be pushed with a single
DRM_IOCTL_NOUVEAU_EXEC through DRM_IOCTL_NOUVEAU_GETPARAM.

While the maximum number of IBs per ring might vary between chipsets,
the kernel will make sure that userspace can only push a fraction of the
maximum number of IBs per ring per job, such that we avoid a situation
where there's only a single job occupying the ring, which could
potentially lead to the ring run dry.

Using DRM_IOCTL_NOUVEAU_GETPARAM to report the maximum number of IBs
that can be pushed with a single DRM_IOCTL_NOUVEAU_EXEC implies that
all channels of a given device have the same ring size.

Acked-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Changes in V2
=============
- consider the extra slot required by a job's HW fence
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dma.h   |  3 +++
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  7 ++++---
 drivers/gpu/drm/nouveau/nouveau_exec.h  | 10 ++++++++++
 include/uapi/drm/nouveau_drm.h          | 10 ++++++++++
 6 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 30afbec9e3b1..2edd7bb13fae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -31,6 +31,7 @@
 
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
+#include "nouveau_exec.h"
 #include "nouveau_gem.h"
 #include "nouveau_chan.h"
 #include "nouveau_abi16.h"
@@ -183,6 +184,20 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 	cli->abi16 = NULL;
 }
 
+static inline int
+getparam_dma_ib_max(struct nvif_device *device)
+{
+	const struct nvif_mclass dmas[] = {
+		{ NV03_CHANNEL_DMA, 0 },
+		{ NV10_CHANNEL_DMA, 0 },
+		{ NV17_CHANNEL_DMA, 0 },
+		{ NV40_CHANNEL_DMA, 0 },
+		{}
+	};
+
+	return nvif_mclass(&device->object, dmas) < 0 ? NV50_DMA_IB_MAX : 0;
+}
+
 int
 nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 {
@@ -247,6 +262,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 	case NOUVEAU_GETPARAM_GRAPH_UNITS:
 		getparam->value = nvkm_gr_units(gr);
 		break;
+	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
+		int ib_max = getparam_dma_ib_max(device);
+
+		getparam->value = nouveau_exec_push_max_from_ib_max(ib_max);
+		break;
+	}
 	default:
 		NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index ac56f4689ee3..c3c2ab887978 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -456,7 +456,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		chan->user_get = 0x44;
 		chan->user_get_hi = 0x60;
 		chan->dma.ib_base =  0x10000 / 4;
-		chan->dma.ib_max  = (0x02000 / 8) - 1;
+		chan->dma.ib_max  = NV50_DMA_IB_MAX;
 		chan->dma.ib_put  = 0;
 		chan->dma.ib_free = chan->dma.ib_max - chan->dma.ib_put;
 		chan->dma.max = chan->dma.ib_base;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 1744d95b233e..c52cda82353e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -49,6 +49,9 @@ void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,
 /* Maximum push buffer size. */
 #define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
 
+/* Maximum IBs per ring. */
+#define NV50_DMA_IB_MAX ((0x02000 / 8) - 1)
+
 /* Object handles - for stuff that's doesn't use handle == oclass. */
 enum {
 	NvDmaFB		= 0x80000002,
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index ba6913a3efb6..7a40509fa7ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -346,7 +346,7 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	struct nouveau_channel *chan = NULL;
 	struct nouveau_exec_job_args args = {};
 	struct drm_nouveau_exec *req = data;
-	int ret = 0;
+	int push_max, ret = 0;
 
 	if (unlikely(!abi16))
 		return -ENOMEM;
@@ -371,9 +371,10 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	if (!chan->dma.ib_max)
 		return nouveau_abi16_put(abi16, -ENOSYS);
 
-	if (unlikely(req->push_count > NOUVEAU_GEM_MAX_PUSH)) {
+	push_max = nouveau_exec_push_max_from_ib_max(chan->dma.ib_max);
+	if (unlikely(req->push_count > push_max)) {
 		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
-			 req->push_count, NOUVEAU_GEM_MAX_PUSH);
+			  req->push_count, push_max);
 		return nouveau_abi16_put(abi16, -EINVAL);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
index b815de2428f3..5a8fe1208a44 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.h
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -47,4 +47,14 @@ int nouveau_exec_job_init(struct nouveau_exec_job **job,
 int nouveau_exec_ioctl_exec(struct drm_device *dev, void *data,
 			    struct drm_file *file_priv);
 
+static inline unsigned int
+nouveau_exec_push_max_from_ib_max(int ib_max)
+{
+	/* Limit the number of IBs per job to half the size of the ring in order
+	 * to avoid the ring running dry between submissions and preserve one
+	 * more slot for the job's HW fence.
+	 */
+	return ib_max > 1 ? ib_max / 2 - 1 : 0;
+}
+
 #endif
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 8d7402c13e56..eaf9f248619f 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -44,6 +44,16 @@ extern "C" {
 #define NOUVEAU_GETPARAM_PTIMER_TIME     14
 #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
 #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
+
+/**
+ * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
+ *
+ * Query the maximum amount of IBs that can be pushed through a single
+ * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
+ * ioctl().
+ */
+#define NOUVEAU_GETPARAM_EXEC_PUSH_MAX   17
+
 struct drm_nouveau_getparam {
 	__u64 param;
 	__u64 value;
-- 
2.41.0

