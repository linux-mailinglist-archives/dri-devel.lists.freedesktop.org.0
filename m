Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97229A7BF5B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E5D10EBE1;
	Fri,  4 Apr 2025 14:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q8DEcpev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8380410EBDC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:32:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso3911819a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743777162; x=1744381962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
 b=Q8DEcpevmtspH7n0RW+TIsqPGZuKlhNEvpXCCMZRG7H1+IFdqH4+HTykdK1TobS3Iy
 mA2c8Ig883kqtJk/9BNriUrPMlTkAgJ+YXUzr0D0RH5BMjR1zuK0KWM2dVhPdRqgcpWq
 2Xh2ToHYdXJD2mVqpsqX93CKlohGTgnOgbqoKL/E8cbUo5XXYEHRmIljEC4l7gQO2fcC
 8SLHafhKWMGzwqJ13Eli16pw5ee4SsYiYPhgzDqBPtHO5HWYJCBL/GFM39bcexqHv4tM
 +oLorcx1opJgEONehvUggyAffXKUE+qIl+TpKkEIGMgnbw/vgwkHw/XXanbD0tGbZ5xE
 efVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743777162; x=1744381962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
 b=UD1Xc7gWCCbxCLQnu/73t5+9tHWdrET2777yoZqDTHbg8d5OmyDSujZNoNeIRYqzWI
 KIdG0YHsdAec4Plw5YGkhU30mR7+6/XnuPyqXpfOuFY69SeqljvK1VK+qosphgjzf+le
 igQZ5Q73inZiOUJWcCWOCwrqJWKP/FFPcY/vQ3KH0F53P5PLjG5WvAB/bRkF3lM0wvyh
 8e8bONfXlGmFK/TE4FhLX3dcIyp0nSPVqpf7K80nvecSdFFxXVmTSCns/JXNGniqxkZ7
 La4xLybzffypE2V3s06OU2LSs2RYt+nO3BWWbvU3QYzZIt+ccp05QLHjf7sJsSUaoJwY
 UpWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3FXDPqp2hHc9jZXJPhXvVgSNMJhjYsxtKS/zYcYT4fk5pDpG+pMNGzhV8OzAr2GHpMlaCKM0Q6a4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHCFWeGCFpDVhF/xzydVPqTVWTBxxDCKNW91/6NnPvwl1uQeAx
 Sg4vJ/64vtZFSJivN7TRcVaPM6FELhPvkHizQiusUuFxXHdZGboULbVrQQz1z3k=
X-Gm-Gg: ASbGnct1VjdNhGjctoJw6Rl8aNRQoRdn/GpgLf/jLr4WV6Soi0woik4MszSM1mJvKlq
 b7KryhCrAIHcyCJ5lFvwzIMYhrSainjRpnUYGMd9v2hDymmAUKXtSckSnAzRprnGPbgOzoTBNxG
 uQUtoN0qiU3gh5R0OtI654tMbOt9FSOLHvPS//Qq5f4FY8iYMBtaARl45EpJV6QlZXMisLTjLYy
 LHO4J55+DCTbbh7tdWvgVVHsZH9p30r8aEgjA6VDPFPK2YAt+hFGosstF6x5nQDNXFIz+ulCuFm
 J6/nhCoVooZOjVWeGeX6ccJNKrbBCLkT7vlV9IGxgyid8QD/DKk2U/uWPt1Q9i858HxjKxuNF/B
 uEzHznSRbkxom6bNTc6WiEw==
X-Google-Smtp-Source: AGHT+IGI4VswEXbkr8wvPcpZqZzKqeC9kMo0saIbDftZfl+T9cBHd+BN83SFjwOfSSTztOoIdlkUdw==
X-Received: by 2002:a05:6402:5cb:b0:5ec:cc28:1a78 with SMTP id
 4fb4d7f45d1cf-5f0b657a59dmr2556677a12.20.1743777161950; 
 Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
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
Subject: [PATCH v7 09/11] optee: support protected memory allocation
Date: Fri,  4 Apr 2025 16:31:32 +0200
Message-ID: <20250404143215.2281034-10-jens.wiklander@linaro.org>
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
index cfdae266548b..c10b38b23586 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_rstmem_pool_init(struct optee *optee)
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
 
+	rc = optee_rstmem_pool_init(optee);
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

