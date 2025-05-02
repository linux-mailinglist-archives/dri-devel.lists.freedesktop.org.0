Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A67AA6EA5
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9AB10E8E5;
	Fri,  2 May 2025 10:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FJeNgND6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F86910E8ED
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:01:17 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so289653266b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180076; x=1746784876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
 b=FJeNgND6U5bDXq2KdOG/Aa6vXy8y1pH8fSCoMArK5veAJhHr6SMQ1iJtnaCvLzVu24
 LA7hRQs77c96V6T8UkPCXrIr4Dfwc52q91YLVF8Ao7jMrpoqCpZAYWFn5ek58kWx1ZlE
 uz4taK4CJlixGwAHllavJHU/M8Z4FSglEv3W12cvZycW8KOyFOMaSbh7V9DXK7PA5JUN
 KQwpOJYqP5UozvrKwCHWnLGfoUrO9N0tuiLcN6kWr1HXdtAX/sFR5aCIaSLV8mavyLsV
 RJeSq7OKBkR6wRacqqdUu2KVegvaCCXgHeq6t5qDSSE3CRdkBm4Yk1go2bSxuRiDiUb5
 XOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180076; x=1746784876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
 b=Cswul2ajrNT1obk8heDTV0MACeNlWVIy1LTHndsXmlfhtO+sPskPvBbbq/TVCPQ6Eq
 I9Z3imZKlmZBAQXfXMHup/sb/jsLdZERkI5irpYpAj02va4Zubn9GRk7VmRYC8Fzn0Wk
 lWL1g0DaxBvBpl+O1J4ws/YzXaIkD/LaeisZmSHrhAqQ4hIbL3We1u78LVcPeEPiYfg1
 mRJHzXT89RMgYfiWxyTg2aKrclAYr599ZnIMWfnv+Z1YgsLKYSyVWxGBDLte71fxbIJV
 8iH94/YUsM/un/VG2Gg99uT70GluHklH3NzeB/uvNz6/ywjgnKzasN5OA30RYWKUHowP
 NEgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+npbZNAHtvews43ZFD9z8ZmUv7wsRdrViWCoaO4LD1urmJSVBqMeHbV4ZtxMf80F8rLgiUwUorrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE0BeDIi52AQ12uUieBrhPlSkl0077S4avFiw8+9qmuelSX72n
 o3vll3zz3MxepC0LUr/Vr6fDnXRZMj7adCFKXbS+MwJIxgdqWnDmd4ftjdcaf9g=
X-Gm-Gg: ASbGncsMrVKeVo6bjuw5whz52rn0zI+WtJbgj2BGxdNNAD2RweaPBSbwspiGhLEpD6t
 I/RSlDhhzSFNNMrr//g/8F3p7hFhvkn0d1xXC/w++kr6mrLrAaMU+N/RiaxpnKEdiJVmhMaDeJD
 GlovPSlfnxBLhIs463xwOhnpHWNxpFA652Y7UlBirknsRg5jtBku5IzzNx2E1zSoegbEdxS44r7
 7NSQVe2nflRd+aGQSxLoVhX0g5o8EJ/2Bdtj/Lu8QIsO6eLPfBqUgAsbHnYiM1s7t7ra+DvbW+0
 VY017fcjedxSXvcQKwtNDmcvdVBHqmhCbvN7Oq/4JyU91x3X/tOmKUnV16INvvysjIh2hzLSVC6
 NFrAasXn2Sfj0WU4KWQ==
X-Google-Smtp-Source: AGHT+IFF9zknIP+dqaL1V+FMTT0LVPgHDeyr+aipRO30IcpUVrj2BVxgOIBN2MQg2BYB/rbfAelPxg==
X-Received: by 2002:a17:907:96a2:b0:ace:3c0b:1947 with SMTP id
 a640c23a62f3a-ad17ad39db1mr215652166b.4.1746180075654; 
 Fri, 02 May 2025 03:01:15 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:01:15 -0700 (PDT)
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
Subject: [PATCH v8 12/14] optee: support protected memory allocation
Date: Fri,  2 May 2025 11:59:26 +0200
Message-ID: <20250502100049.1746335-13-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/core.c    |  1 +
 drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..c7fd8040480e 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
 	tee_device_unregister(optee->supp_teedev);
 	tee_device_unregister(optee->teedev);
 
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 	tee_shm_pool_free(optee->pool);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index cfdae266548b..7acb43852c4b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_protmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool;
+	int rc;
+
+	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+		union {
+			struct arm_smccc_res smccc;
+			struct optee_smc_get_protmem_config_result result;
+		} res;
+
+		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+				     0, 0, 0, &res.smccc);
+		if (res.result.status != OPTEE_SMC_RETURN_OK) {
+			pr_err("Secure Data Path service not available\n");
+			return 0;
+		}
+
+		pool = tee_protmem_static_pool_alloc(res.result.start,
+						     res.result.size);
+		if (IS_ERR(pool))
+			return PTR_ERR(pool);
+
+		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+		if (rc)
+			goto err;
+	}
+
+	return 0;
+err:
+	pool->ops->destroy_pool(pool);
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	rc = optee_protmem_pool_init(optee);
+	if (rc)
+		goto err_notif_uninit;
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pdev)
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

