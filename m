Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B137EA4FF8B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372B510E779;
	Wed,  5 Mar 2025 13:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EypjspN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC82D10E768
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:07:00 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5e4ce6e3b8cso1311683a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 05:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741180019; x=1741784819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6L88VawgT5clB6S0hOB/yQKL6Af309OnWxwlD6cmBU=;
 b=EypjspN7ahomBnrQhR9/QYpDp4Bkve/P8de0w0XW2CeJPulXJweWSQkjh87+hR37jI
 WaDl7a6WvNmIJsJdAhyrtXuGXmoanKwUlnLV7rCi6Fgi7111My+2Hq4MFVm0XWOBOK8D
 a0h+EUxu8FfzGNMxLGfYcRK0nimQ7JbZrXEFpJpmP58OoAWPMTtUvutTq26SpafqSF0+
 yhbYyDs6ef2cwNc4n58hqLb45HsEq+3Cl8/ROfVqtDthqHVcmtT5/Sm9D7nLF+/ISaFE
 IkWyfzwtm1fJz23f+RGwsX+yea57N3njnT75NPANU/zRvWWIlDt1TKrTohUnzKi1ot8y
 4ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741180019; x=1741784819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6L88VawgT5clB6S0hOB/yQKL6Af309OnWxwlD6cmBU=;
 b=XxsnnROr8n22V5LEOA9pNDLKFcouavqNf1MD7IhtT7ojLoHKU8cpH0PdrS5XHX0LLz
 rupb4zJJimeEmZ0A0v+iF/GxR2rRjcVL6Fp+xiU998V1OeoDTxMZ1v9xqI3ifXOYQmgI
 KyABcac/Sn2jum3Z/hj4aD2Qr/Yz7EZX5g6u89YRSQWWif0d4Ma4qsloSWu4Kfkbk1I4
 iq25FvKIyjVHbwSj08A/JRn/+y3UBnPHeCyZbgYUOG3fAVTTdWte/H1xg4htmhlBs1An
 1J3NFG0iYpFyOcMUP0MBkolfq2YW1znGo3Gd3ntRoQEm7HNSflt1DWQ2AzZJJMeJg76e
 TF9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCP9lg3yiibvp72Vx+yRgxexvTggUCfZqPgutnHj/UOU3w0UfyktKvqRfPQk5fHZ5V8oIyu46EN4Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeuaiYH/vWnLkb4v8NCLpMpse7Bc848K+t7f9CpHMOh0Zsv+6V
 pvMEQS+fVz4u27hVZrVEM406xdiSJ4JP86yK3FveXY33Ul0kft47FoKVAJwDu38=
X-Gm-Gg: ASbGncs8ESMaUr9677ZraVluPN6diHoqamQL1ZEA4x8A2UovVic3d8oNgNwuH2kR+Gh
 rLsXNhlziRECnqK0vkGPp42ykTwAiNiqMu+r10Ey1dBnutrktHW+jGsva50fWKC12AA6vYPEZgQ
 4uDV7lJ4Fvyz7VWvfJCVbsd00m2v8JOxNNqxvHH1TrXHp524LuC1dmzJpsh+7fao00+uq0InsXP
 HhpWUEutuBBxhORgOxMXbzfCz+V0ROKEu/wloPyLxxilXPF4lLVgPt4scAAWcNu7Fdm7cowOWYj
 +JfYJmsJuYynPsHAfm+dF1crrjDIhpDfmOz0uCrCN8WBxZ0iE083YRsRshZ2HlkSw3gQAsCDpu7
 H3wK2l7RLSPtYqxHpKw3LsQ==
X-Google-Smtp-Source: AGHT+IEAmgkcE8RyjO1pJJHrKqdAmUGw9vFkZJI7+m0/4SoKqcFz7yQm/3SS6AjKMMHXW07x446SxQ==
X-Received: by 2002:a05:6402:4309:b0:5e4:d52b:78a2 with SMTP id
 4fb4d7f45d1cf-5e584f51077mr7080244a12.15.1741180019316; 
 Wed, 05 Mar 2025 05:06:59 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 05:06:57 -0800 (PST)
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
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 07/10] tee: add tee_shm_alloc_cma_phys_mem()
Date: Wed,  5 Mar 2025 14:04:13 +0100
Message-ID: <20250305130634.1850178-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
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
index 8b79918468b5..8d8341f8ebd7 100644
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
 
 /* extra references appended to shm object for registered shared memory */
@@ -59,7 +61,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_CMA_BUF) {
+#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)
+		struct page *page = phys_to_page(shm->paddr);
+		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
+
+		cma_release(cma, page, shm->size / PAGE_SIZE);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -341,6 +350,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align)
+{
+#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)
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
index 6bd833b6d0e1..b6727d9a3556 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,7 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -307,6 +308,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
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

