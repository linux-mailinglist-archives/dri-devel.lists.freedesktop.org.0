Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2570AAD38A1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBCA10E550;
	Tue, 10 Jun 2025 13:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pwSBDTVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7979A10E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:16:22 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ade4679fba7so486756566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749561381; x=1750166181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/zrQKrz1ZdcacJlKYkPsE2jrLvANF9CRh8hMHgIKxo=;
 b=pwSBDTVuEVubcQaUtMbeS8R63/iUsns1XPdB8qxXlpm9OnIhYeE6ihNdS1CexZcpt3
 6gkUtVqecBTFLYbBR5Vzyu1QcZIR8IFOfuM/0uKN3bkdysvQl8sdjWU5oF01qRtUB+aK
 LZKiVExr26IfxtaTK2H0s6UPUEweAtr4AYlilPWTUzi0nTKdm+GibaXYlyUOc4znybkb
 tMpxrKcrAQaUeb4koBpz34FASKYQGt2wXxUpiP9wPIgu/gtUXOgOKPdkLf9dpD99FUJH
 x3UKJ86HXezEblL9uvo8UX/YGLeUHwdhmdg8P9ahoRcQNmIySP3zNet3oDEAZ/UC4cKu
 EKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561381; x=1750166181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/zrQKrz1ZdcacJlKYkPsE2jrLvANF9CRh8hMHgIKxo=;
 b=siOpQR4NNIZD7Kxbw1vqrlgY8FIZeziVWIvJlmfA8bvJi1pqV0mMMxbLQZi9pEWFHw
 se646XnsicOFAN1vwD+x/b1apP5I7FDgGm9rEBdslj/WSwAfj1VQ5fbaz0+y4csbDxIM
 7muj5rvagqEoQLwOd4BB+8U8NV7EqdXHEARyR+xwQJyS7i9dilq5+QRYxhbLRwYencjy
 oZCxJiUfVMXXg2fHumkzqivygX/xu4mdQYJP6hC8MwxVhqKsNTUpYDhsar9shQz6uJQY
 PZQ8r0tjug5054dMQ4mdge2BMSRd8FV9XEXMbIprO3snUqXa+OOEdXmoz8u4JahcJl/j
 stAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYylkx8V1fOE4JKeWOpWPkix33fkek1VFBkn0BmbzNJvTA42NYgHgQLU0xRhCRvC/msD5fz0dl9+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9S1sW/aPAEjWmmiOWnvQwUqutmcv7hbZ0lHyhG3k17a7P/Ogq
 StDIo8r2SXSF2xIFECYp0zkv9gkL3dXw+wYLP7CmWlC+vp+aNSeoQnoA0uZUFf+lzwo=
X-Gm-Gg: ASbGnctdBiHfCZ4Nx44fEBKOtKHsQK3u0Lpiem3/zsi+vJqcxBtiV5syFzKXqoHphsA
 jgM1XsZ6frgQCRwSf8gVkWpWbQwJcMiH/nkjh359aiTLGn/AS1/QCa4GVE66NHi57i8BO1As4VJ
 9SEn5sad9T771pUIq6gg76HJjAy0L1QBuvC/IU6OInY2LWI3uX7jsHsT/QTMtPVInM0T64bkh/L
 isucR9wbK8/KBM0aGlsjPtlN59/f+R4cvofqFzov+3Pbh4TFWsm1a0z7h09ABVJcrmNnvAJjDMv
 ZtbGJZMjuFyIljptP/k479MwE6luVNvGbxfDE62kwIYNZ2e4PgO78fPCSiumRLvO6EoX+m7cTZ0
 NsGWfGfc79MpHeMTrujiYbpimDcrOkobD5ONE/g0=
X-Google-Smtp-Source: AGHT+IGBftzOQtLPgzGHNeXG6c2zhp6CTLR8q3dJgPSZSp1EfRa2hlxKgikylIdO9cmYC3sLXz6TCQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id
 a640c23a62f3a-ade1aa0fbdbmr1346254066b.9.1749561380962; 
 Tue, 10 Jun 2025 06:16:20 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:16:20 -0700 (PDT)
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Tue, 10 Jun 2025 15:13:50 +0200
Message-ID: <20250610131600.2972232-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
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

Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
identify it as DMA memory. The allocated memory will later be lent to
the TEE to be used as protected memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
 include/linux/tee_core.h |  5 +++
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e63095e84644..60b0f3932cee 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -5,6 +5,8 @@
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -13,9 +15,14 @@
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
-#include <linux/highmem.h>
 #include "tee_private.h"
 
+struct tee_shm_dma_mem {
+	struct tee_shm shm;
+	dma_addr_t dma_addr;
+	struct page *page;
+};
+
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 {
 	size_t n;
@@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 {
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_DMA_MEM) {
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+		struct tee_shm_dma_mem *dma_mem;
+
+		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
+		p = dma_mem;
+		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
+			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+/**
+ * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory object
+ * @ctx:	Context that allocates the shared memory
+ * @page_count:	Number of pages
+ *
+ * The allocated memory is expected to be lent (made inaccessible to the
+ * kernel) to the TEE while it's used and returned (accessible to the
+ * kernel again) before it's freed.
+ *
+ * This function should normally only be used internally in the TEE
+ * drivers.
+ *
+ * @returns a pointer to 'struct tee_shm'
+ */
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	struct tee_device *teedev = ctx->teedev;
+	struct tee_shm_dma_mem *dma_mem;
+	dma_addr_t dma_addr;
+	struct page *page;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	page = dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
+			       &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
+	if (!page)
+		goto err_put_teedev;
+
+	dma_mem = kzalloc(sizeof(*dma_mem), GFP_KERNEL);
+	if (!dma_mem)
+		goto err_free_pages;
+
+	refcount_set(&dma_mem->shm.refcount, 1);
+	dma_mem->shm.ctx = ctx;
+	dma_mem->shm.paddr = page_to_phys(page);
+	dma_mem->dma_addr = dma_addr;
+	dma_mem->page = page;
+	dma_mem->shm.size = page_count * PAGE_SIZE;
+	dma_mem->shm.flags = TEE_SHM_DMA_MEM;
+
+	teedev_ctx_get(ctx);
+
+	return &dma_mem->shm;
+
+err_free_pages:
+	dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
+		       DMA_BIDIRECTIONAL);
+err_put_teedev:
+	tee_device_put(teedev);
+
+	return ERR_PTR(-ENOMEM);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#else
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#endif
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index f17710196c4c..e46a53e753af 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,8 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_DMA_MEM		BIT(5)	/* Memory allocated with */
+					/* dma_alloc_pages() */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
  */
 struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
 
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
-- 
2.43.0

