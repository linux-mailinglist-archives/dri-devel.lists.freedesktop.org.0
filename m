Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C724EA7BF5A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CBD10EBDC;
	Fri,  4 Apr 2025 14:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RiMMmbW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF5E10EBDF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:32:41 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5f0c8448f99so1201054a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743777160; x=1744381960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5qo2YyNIySD0VmMNIZFqRKusBLbWYGLyvGHeWkP+bg=;
 b=RiMMmbW9CVsy1n/Zg059Z7Mw8Df6RU3zdCmx2HZ9W8GsEog2ldSKMajm4dINy3a/8E
 aq0zONNSS8TRFguQRkIZQtgFy0XH1O2eiMbB62CgD2BDkAe+UsRua9O2buX4iJFI+mpK
 idqkEXK5C7GpnQeCzXEbnBam4PDVExDFPSSbjUCE5ir5klr451vZnAynKr679AfpNztv
 iDamt9aHSwvg/1tZRXPhtjjTBs+flk+KFwrkVY2dXVAXj7Mq7D+hmoj791EfS3Q1fNOR
 bQLyx4BVUWuxRNlDdP5yJZA08+p5W1/MVh7AnmX5F7rNWL+QxjGHzF5urV0+j5XF5FZz
 92FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743777160; x=1744381960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5qo2YyNIySD0VmMNIZFqRKusBLbWYGLyvGHeWkP+bg=;
 b=GcFTz6N9oaF0viTBhu1MfmbByhkAtknIV32HK2HZG1kmyu6cWXDLZOurfwKuSgVQYs
 f6DxZB2V9kz7jI4Qgg/2ivGH6sPK1GvUiJhtd+hu3G22SlAvvPpMnUhuJ20PpkkloRLf
 rT+RZ4L+U3LkQZPnFclE9hq13YA7ZVn82uYYMPBVZBGn5rUg45zaMX5EnE478dPJdZNU
 +zqC6VI3I3iLM+SWVmxIaVuzSecQ3uqi8Y77Kz/SGnI7V2XvDbKoPiJPgpkSw5R5lJPQ
 PwRsl2awdTtRhy9hkYf1aKZ5LpV1zTFTtlxPOpRieMPJRe6YpQ7UTd2nzrbhVPLQWoCz
 ZpBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9FWtTTP97AnF3ITdxfk9rptK9xJsymzAakC7FfPymZaNcfB07zSoqHsotr+Z8ALWr4E5Q7uBby94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3XI8KjkwEyNw8ofj+crRa2+sCecwiBM7rbhDYlUdOZdbizLad
 K4d80vfzvBbno4Z9yrmsJk8w85uN5CrhKyeem4eO2mGdGaamStc6+Elz5AKGGBI=
X-Gm-Gg: ASbGncuS6UGRAZB826yjYM3Srd3CmwVuxtUsQXju6eCrVgyMB+MGvbHxaOobtuJrch9
 Kp+siCeNj5JfgrO0eVHGrHZoxIbSrgiKp7xq3xyjo1fSmBKJ8a5o7qsQa0uITR6CCSim9UrmhRH
 1C2IhseMPLY48nEPGHFTRroG3y8XoKLrYUmFjziR5b49Ey+wROY1z78sNBxjUqQaLbgDz5k2Fks
 T7fzSG7cbyxfs5NeWSw5EpPPyypYoko3eIKhMf28a4EfZB3cuXljea0QVLDVbo+3aI0b8Dkfqrn
 uQoDmdkEu4gq+O0SKlJM8HKm2G8Q+ar44YDuiCPD0k9NaxeUUQsZja69XXJXWZnKsJdmCWtLO2g
 jul5SqRGcaC+CzYikUrluyg==
X-Google-Smtp-Source: AGHT+IEM2hKGK5BPtUOQZ2C93jlWGXwVhi6Jdx1BijC2kUctXxlRef+Ez6JQ6wrB5PbeK6VU5VkWDQ==
X-Received: by 2002:a05:6402:2347:b0:5e4:be64:b562 with SMTP id
 4fb4d7f45d1cf-5f0b3b658ecmr2441621a12.1.1743777159861; 
 Fri, 04 Apr 2025 07:32:39 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:32:39 -0700 (PDT)
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
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 08/11] tee: add tee_shm_alloc_cma_phys_mem()
Date: Fri,  4 Apr 2025 16:31:31 +0200
Message-ID: <20250404143215.2281034-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
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
 drivers/tee/Kconfig      |  5 ++++
 drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  4 +++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 084bd794374d..53514cccd1c9 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -16,6 +16,11 @@ config TEE_DMABUF_HEAP
 	depends on TEE = y && DMABUF_HEAPS
 	default y
 
+config TEE_CMA
+	bool
+	depends on TEE = y && CMA
+	default y
+
 if TEE
 
 source "drivers/tee/optee/Kconfig"
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..d6b310b4a5fc 100644
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
+#if IS_ENABLED(CONFIG_TEE_CMA)
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
+#if IS_ENABLED(CONFIG_TEE_CMA)
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

