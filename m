Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD72B5345D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ACA10EB33;
	Thu, 11 Sep 2025 13:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pPnFgjT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2895C10EB33
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:50:54 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-72ce9790ab3so5377797b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757598653; x=1758203453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vA8l0L1pnbhQj/VVM6tv+d6BLx7uJN5MQdkMqAYWy2o=;
 b=pPnFgjT/yQgwRVhPl5rfuWiBuiigzWm5Ik4zs3RkInzZo95up7n6F3wumjninc2K8M
 YX9SO6y9F0PS9/PFjSs+aiOtmWdNGP6+bSyyonPS7UAKN28DpPyddzb6qL70TElQWkMX
 vzUuHz5VvPMhWgzwaha5BwCLQZnFmhUZ7k8cqisxV6bOtAoZBw6f1iFkgBd0OzouZYId
 7BEOwiGyu5rIddUBBWh/Al3rMIi76vQQDv4/JqHX+7MCbbhc6yyHuv0upnGuJa7g3XPa
 +dmvXnm2ooefqnkG2rylvDb6/Ic+afNB2NipIQhkts1EspGp8l7nzuXon+411moswzjG
 nkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757598653; x=1758203453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vA8l0L1pnbhQj/VVM6tv+d6BLx7uJN5MQdkMqAYWy2o=;
 b=AgRNK/i5c5wV8w0B41aFqccSG0EWyg/v0CBqzSqMpqQxCjuMOqSasDtYhhUsT9rn7V
 4YY50NxPpp3hhlC48vd20IGht8+xEFq6xaojUWI0VfUQaPi8CRrH3uYBzzOt7CvMf2qC
 pov3FtZcIYEOpmYh5N6UiGoUgzRmvtdrJJrr+hdW41hozR1HRgNfpZ7OBQZBGAXH/Z/h
 j9IZKGKQVqmnT75Vh6K65zScoou7DJET8HggEi9N0o82ySbbJgU5f6sSQ8J3X2oL2sYs
 /jT1zKIrzfbfdZIMYt5UVhiasOhZixBoAV/T2DiCCBpjortb6pygO5Pf2sRXFKiVFkCh
 tp4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwEzOjTuVIg1sfYaVr2gbmw3Ul28N6IVAIbWtYNTwdrDJKR4h1xYcUhXf8OJX65dR3x4mn+SH8O1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXqvrfa/bGfQ4Tyn0/c15SWAisFqKmdVnklL78K+rXwNY92L3+
 e+4SAmlGxyPndYi+tzID9LdFCBa63MnETCm32dpZ+NF6LxYspWqh6AHnQBSpSG+xgho=
X-Gm-Gg: ASbGncuNDyOenYW2un3Fa4F3rklV/64Ir9kxQFtB8KWpJSFmzIVAtoaU137Vc1jJ7Wc
 s+snIC3Cu3LzW4LOh21Qm51QKt7CqlZGZ7DWM105DcvGXOat7g4wts0nwrnpTILyzMv9VZRau3y
 bTf5nPnmfl5TTTNHrOO9IjuSn0mXAF3KuF3HC4RgGoThx0FBL85ZSgVw1smYwboeh+AMnavcH5a
 67MRKx8aveWSeT0gBpyGhffzEzqxLW0C/CQASKX3mQY96iDqhJ76khceUgM1K5nJSRWvVCFgu3v
 /OF9NiTmNSMSwZXUDBo/llaExYsKeu6oZGcICgXcT/9nXfINZvaFYFovUvQhg+XYq5NV2t70h2D
 7LY/zF9Ht7VMccPAdCKikDnlpIwazmV5CH+pqGijCkl5/WLblNkQj9KhQUjPbu8Zy/KUEseZAbk
 E=
X-Google-Smtp-Source: AGHT+IFmdm+Po0P1++N5LtyQw+r4rWBFNbbkWpZkWUC8+P6AqlV0PH43L8/Dr0h9kNUYe7HQBV7meg==
X-Received: by 2002:a05:690c:9692:b0:724:bd2d:ac97 with SMTP id
 00721157ae682-727f4d6270amr177781537b3.32.1757598652962; 
 Thu, 11 Sep 2025 06:50:52 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se.
 [37.123.177.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:50:51 -0700 (PDT)
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
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v12 7/9] optee: support protected memory allocation
Date: Thu, 11 Sep 2025 15:49:48 +0200
Message-ID: <20250911135007.1275833-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/Kconfig         |  5 +++
 drivers/tee/optee/core.c          |  7 ++++
 drivers/tee/optee/optee_private.h |  2 +
 drivers/tee/optee/smc_abi.c       | 69 ++++++++++++++++++++++++++++++-
 4 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 7bb7990d0b07..50d2051f7f20 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
 
 	  Additional documentation on kernel security risks are at
 	  Documentation/tee/op-tee.rst.
+
+config OPTEE_STATIC_PROTMEM_POOL
+	bool
+	depends on HAS_IOMEM && TEE_DMABUF_HEAPS
+	default y
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..49ccfe6f6583 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -56,6 +56,13 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
 	return 0;
 }
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width)
+{
+	u64 mask = DMA_BIT_MASK(min(64, pa_width));
+
+	return dma_coerce_mask_and_coherent(&optee->teedev->dev, mask);
+}
+
 static void optee_bus_scan(struct work_struct *work)
 {
 	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 9526087f0e68..4969b83a9851 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -274,6 +274,8 @@ struct optee_call_ctx {
 
 extern struct blocking_notifier_head optee_rpmb_intf_added;
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width);
+
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
 int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 26f8f7bbbe56..b4c007ed3b94 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1583,6 +1583,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
+{
+#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
+	union {
+		struct arm_smccc_res smccc;
+		struct optee_smc_get_protmem_config_result result;
+	} res;
+	struct tee_protmem_pool *pool;
+	void *p;
+	int rc;
+
+	optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+			     0, 0, 0, &res.smccc);
+	if (res.result.status != OPTEE_SMC_RETURN_OK)
+		return ERR_PTR(-EINVAL);
+
+	rc = optee_set_dma_mask(optee, res.result.pa_width);
+	if (rc)
+		return ERR_PTR(rc);
+
+	/*
+	 * Map the memory as uncached to make sure the kernel can work with
+	 * __pfn_to_page() and friends since that's needed when passing the
+	 * protected DMA-buf to a device. The memory should otherwise not
+	 * be touched by the kernel since it's likely to cause an external
+	 * abort due to the protection status.
+	 */
+	p = devm_memremap(&optee->teedev->dev, res.result.start,
+			  res.result.size, MEMREMAP_WC);
+	if (IS_ERR(p))
+		return p;
+
+	pool = tee_protmem_static_pool_alloc(res.result.start, res.result.size);
+	if (IS_ERR(pool))
+		devm_memunmap(&optee->teedev->dev, p);
+
+	return pool;
+#else
+	return ERR_PTR(-EINVAL);
+#endif
+}
+
+static int optee_protmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc;
+
+	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+		return 0;
+
+	pool = static_protmem_pool_init(optee);
+	if (IS_ERR(pool))
+		return PTR_ERR(pool);
+
+	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+	if (rc)
+		pool->ops->destroy_pool(pool);
+
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1678,7 +1740,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1751,6 +1813,9 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1802,7 +1867,7 @@ static int optee_probe(struct platform_device *pdev)
 	tee_device_unregister(optee->teedev);
 err_free_optee:
 	kfree(optee);
-err_free_pool:
+err_free_shm_pool:
 	tee_shm_pool_free(pool);
 	if (memremaped_shm)
 		memunmap(memremaped_shm);
-- 
2.43.0

