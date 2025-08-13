Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE8B240EE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 08:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA6010E4AA;
	Wed, 13 Aug 2025 06:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBwXbIOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869BC10E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:04:05 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6153a19dddfso9253876a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755065044; x=1755669844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mlsk/bAk7ySrKDp6zbKeV5kpDxvVSbwlV8t4Q8Bml4k=;
 b=gBwXbIOgglJ4gG0RCdw0iQ40+7UYAn33SXo524ebJJdJQuBScPUjU+riaiOHSbgGDP
 obBmLmJT33RXzsXu976PN/e/PfZGtEDNtQOysY9Xd4I2oA8ffPqLjljlM388abwC/TCs
 C9AN2Ir1JMmRUnb54lK7mY72SUbknIHyU4N6vBY/sGpJCNY6jZkmUu4DoQRCa4omYJnU
 UMQeZiH8CsmnykdP7H5+chyAQDpVQwVUHB+gXTldHwoSfw59fr1t39lO2sLlrCWC/K0b
 pDG7ICxM3lu5J8NDcNCyR2/GShT7KK5nPQYrrKEYYmJvGcTEeNqvEDK5Fjrjy3xsELPQ
 h12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755065044; x=1755669844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mlsk/bAk7ySrKDp6zbKeV5kpDxvVSbwlV8t4Q8Bml4k=;
 b=AbVZw7aCOG01P+MbZ+WjxGl9ld3RNtuYIsosOISu5Oe5EtDvGgjUj2JeJF/LpjtY3r
 /rY2tA9rZeh0ymcZEOAIa5GXiurrZR5F9cRW6SSj+6s+vjZdLuJU9voEuZwLAyJ5hq+e
 v1t2nzuKYrzLZRC3HKsWCN4fiAwUBo82TKLX8cbUHddJDVHZArdjjwu73vfPbdzYcDCg
 W+QyT50Htse+j25NSsrP+bXu5yIGDHeWfnOfOLRr/vm7Bn4cySssAv8ulUxPODeoHweP
 +QG6Ul+vl05DnNXE+yeFn3XmA1UXlriBzONWpJULRXAUQ7xIH9Bwxt6Hy1gh0qkvMWqZ
 gdxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzrSgPc23d/EcvEPV+o7zWXLBZ3IyTM0b2G5oZbw0D1k00v084zW3KlSb5ENRwaZjeY9QhabwR+gY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/cZdVQikogxoxwEWje8EVrTDNMbRD0Pel12IECc+v8kep+xZp
 NuotqLDcABVBgjnwMiKPjYaI5u4g7yTmGGMltA+YTfSIsfqFdbe/R33YUGesrcDXBmU=
X-Gm-Gg: ASbGncuKmcoNDhl6Jz/bm5Jv77sAnSiXLJR8Qd1mSTNGVtSSH7VS3Cf7k8a3poocfsB
 MMLDi4GxrFBLvN0izoheRwmJ8zBj0i0ZHGfDHQJviqdS2/IDhIwvg4PYaHsb2CPzn31XJljrEGW
 bdTrBnL8Jn8wCZr3fb3LJe0oZgQDF+ApoJvd/y3366shLVzVM2ng5ZJSX+8btTIwJuF3cascTa2
 bvDp0c4UIcEEuaq5g538szgrt+T42cAL2Iu7jlKPcWn42aeyfxUn7op9U9IAD5Ps/zvuyjIV/tG
 mrEyD+ONzQfgh3tWyyHJAxAgmNKHWypH5TEPTb2/8JiSb+AeL2GXtts3D6efuW7RcdoEkUb3cCN
 PCoCOicg669OjsMhfE7AP3eyj4WGSmTwwUKnWaxr7SPJ+bfsX+2Tlof/2O12RT6A9N9SkaVap8R
 M=
X-Google-Smtp-Source: AGHT+IGPP3R6N4Dt8iwgkksibZ5tUqdsMY5R2I3knc3e7zzNRFbaVSRs5R96bdCj/pA/8Zc73+XZ0w==
X-Received: by 2002:a50:8710:0:b0:608:50ab:7e38 with SMTP id
 4fb4d7f45d1cf-6186bf92a89mr984962a12.14.1755065043966; 
 Tue, 12 Aug 2025 23:04:03 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se.
 [37.123.177.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 23:04:03 -0700 (PDT)
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
Subject: [PATCH v11 7/9] optee: support protected memory allocation
Date: Wed, 13 Aug 2025 08:02:56 +0200
Message-ID: <20250813060339.2977604-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
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
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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

