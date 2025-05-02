Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CEDAA6EA4
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578BE10E8EE;
	Fri,  2 May 2025 10:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QzOff37S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521C910E8ED
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:01:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so422117666b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180074; x=1746784874; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHc/i2uVCttA+F6G/pvXVydhhQiLzwlzjcfTEmJaCtI=;
 b=QzOff37SaY7rUmbR71rB/39rP5axQxqS/A0h+20bxeeaNMDZU0UfQgEBSxtE1rfqJq
 yWNpxhZR1NKnR6xPeVTqAiAdvthEfehg/D1hCvMv5KB2NU+PsJF3BZJPYs0suYZyfSvr
 E3kTegsKZLKiiGilr7g4TFvMVBZt14j0fieQBMfUtMEKSwdDv9pJF6t2v6mwgz/UWqWG
 4JNEptu9hvEd7WM4XBJ4e5j9W/il1MRY4lIej28dUMXpYEx7ypzrJTt+lJH94JHV9ZY8
 ylxlxCacQwfDazDCLfc9/u6kwm1/MwGwQ+fpu00uehOej2Mvo9PpCkK4HjbVa5ds2s3i
 fj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180074; x=1746784874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHc/i2uVCttA+F6G/pvXVydhhQiLzwlzjcfTEmJaCtI=;
 b=kWxiizwlPEs/VHgMd8yqKhrjjs0GbYKK6pv8TAYWnoL70XmbzKukDJuVCaAuw3k+eG
 PJAedoMiblwAyIGcaojjJYVSVZlt3IHNVm1y6FxdWwCjYhTBvUXYYaIyGiJyVCc26dBF
 9a8KlEPLOyuCad57DnYTZdfzeZNVr91JlwZPFeb2+gf/7Y/FB1y7lVeQtMn7xpTDgJFr
 7Q2Ln16TK6V4PpODUInUoG2D3Yok4Sr/rK0MMLsps95paz8iEZ5M5kFGfdRmOVvuJFQZ
 rNI1L/eXl7prqGQghH7adUZfiCTY+lMIQy4+WgC5IgkHIns36IUsuwcc7dstUMTCSF1y
 PXDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo/cNMof1yYiB/a5C/iDa/HKGjfwxH+VAzWmy/TU9J8GbQd7Wh5NvZ//5aexE1hHgfDk9xyCnWqRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGVetya+a+vhUELJdp9CCfrTRH9lmaFHZGC0VdeVi8K22QlwJA
 tfxCrLYAaHBSYxKsmhOCugtriOB9iQwKowd/OWT9/XvM7RWj4b7xpXjLrmG+z2c=
X-Gm-Gg: ASbGncuJEr4on+r7Tg82JQDsqRWeSkSsg0Qoiq9dqPiOzFpZeoMpBK1nDfIXMYl5K2q
 M+owZvfcZgvZbP5Mbba5PSf6p9d0BjY/6CH0klf9VMMZlTm2tcoOmHLkR4+DvlsTZF5Oh/gS6RB
 b+QoHYoKRasqPbS02tyjOUL+5z7/tWxVeJaITjufhtslbLXOORYxwbhaFSPtNHTLp5sX5bHGEUH
 bHldC185B0uFAC0yoFq3r9Ap/rT57PAOXh0Omz2IFp62Uy6v2mKe212h0feFQ1GDppwSE5IUV3X
 bztAp6gWM/YMLzI4barEzG4yt7rEI8gJJHZedaGsecgEDE6qb/5zTNQToGz9i0k6S9DMqYjrkR1
 QsrwjPUsIzFnl2vy/eg==
X-Google-Smtp-Source: AGHT+IFOsgLF6Acl3Dnu+kY+8WzAAhOB09Jk1srS30TZnn+BAtVaux5M4/L7RxPQOkhdypP2FHq2bw==
X-Received: by 2002:a17:907:da7:b0:abf:749f:f719 with SMTP id
 a640c23a62f3a-ad17ad17aa7mr211271466b.7.1746180073795; 
 Fri, 02 May 2025 03:01:13 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:01:13 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 11/14] tee: add tee_shm_alloc_cma_phys_mem()
Date: Fri,  2 May 2025 11:59:25 +0200
Message-ID: <20250502100049.1746335-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
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

Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
from the default CMA pool. The memory is represented by a tee_shm object
using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
from CMA.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  4 +++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..faaa0a87bb18 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -3,8 +3,11 @@
  * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
  */
 #include <linux/anon_inodes.h>
+#include <linux/cma.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
+#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -13,7 +16,6 @@
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
-#include <linux/highmem.h>
 #include "tee_private.h"
 
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
@@ -49,7 +51,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_CMA_BUF) {
+#if IS_ENABLED(CONFIG_CMA)
+		struct page *page = phys_to_page(shm->paddr);
+		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
+
+		cma_release(cma, page, shm->size / PAGE_SIZE);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -306,6 +315,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align)
+{
+#if IS_ENABLED(CONFIG_CMA)
+	struct tee_device *teedev = ctx->teedev;
+	struct cma *cma = dev_get_cma_area(&teedev->dev);
+	struct tee_shm *shm;
+	struct page *page;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	page = cma_alloc(cma, page_count, align, true/*no_warn*/);
+	if (!page)
+		goto err_put_teedev;
+
+	shm = kzalloc(sizeof(*shm), GFP_KERNEL);
+	if (!shm)
+		goto err_cma_crelease;
+
+	refcount_set(&shm->refcount, 1);
+	shm->ctx = ctx;
+	shm->paddr = page_to_phys(page);
+	shm->size = page_count * PAGE_SIZE;
+	shm->flags = TEE_SHM_CMA_BUF;
+
+	teedev_ctx_get(ctx);
+
+	return shm;
+
+err_cma_crelease:
+	cma_release(cma, page, page_count);
+err_put_teedev:
+	tee_device_put(teedev);
+
+	return ERR_PTR(-ENOMEM);
+#else
+	return ERR_PTR(-EINVAL);
+#endif
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 02c07f661349..3a4e1b00fcc7 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,7 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -310,6 +311,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
  */
 struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
-- 
2.43.0

