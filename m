Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E7A4FF8D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043DF10E1F1;
	Wed,  5 Mar 2025 13:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KhdAmGR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC43110E77A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:07:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5e50de0b5easo5933609a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 05:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741180021; x=1741784821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=;
 b=KhdAmGR4dwiLgVxn+wHtUlmfRf5fLeep5kW6+dOnl7u4h2D0NgYn2cHvCGwsaHXopD
 nLRlMYq2jg+NdM/8HaCZj35xJfN+bwpiA2e6rsfBQWj10kpOOowVNo+/O66IloK+TPBZ
 qJKM4TsZ+tMIhGN1emGHsQtkbeA9OoyU7fDmAUlkTcSi+ccRh18lMkB2pSL9MJbNgJ38
 L+Ivv3LL3YUxp2H0fSxHkxhbNxLqKxjjiNAsppGufmfYFEuZAs4HzgYpyytTeXSmET6V
 fJ2Wx+HEEtPnzChW4zcTOu+zw/QDBsYHW28edzuoUtLjZiHf748TrUl60U/PphNCuRZy
 KYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741180021; x=1741784821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=;
 b=bM3tG9iLoIeqCsoFZhjfNk4qBea5cGiKFnNSE2OpzY7QyWlkpxvIdIsvZj2ULIQVih
 Quw2Igm8o93L0fUQaCwjE3p6d2/7CoDDMvNP0knIcD9pJWoAvVA0OhlwAeGWwXjdN7Lp
 vl8KpafwV6hNWM4wTW0Tu+aug/6Df2/NYia1lcpRpguh418WKXe4Vs+bDd6iM+xiD/1+
 ZiUuNxp3g3tqVdMaz1whpLWPZjPBVv7Fr/tmyfyTocG7Fre0shn+/Xv7/Tre4Xg3KCFn
 cVaxMlj/QQk/dzLLp+pNCk7n8DgIl/SrkGPb1xWKKLoDEheDHrTfmnlzVKTFcWL332gn
 JrmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPj3ylmQeDHZ6iPZYKgOgxHLylUU3CgDFinklbL2wUOIshftpQrs+nJVcDb3dwH1Vm5KP13tevKyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNOzFsLRyk+TC0RwPpqeUP6LO6KdC3gS+mZnU4mC+RIbs+h/el
 1dAGUzZrJJMFzL+6G6nHL+2B9QHnQrDZ0J0ZWUJMjH18OBH1UldYOss4GGs8C18=
X-Gm-Gg: ASbGnct6uVzHHMuLmawwWfU1R0IHEivZ9uUMJeus0Ls0eqboZnjUrFAcdRoMgUr805J
 oj8IX/8SdtsBSWixQEOcWjJPt7TXvzHz6vYmFDxwFQGaKLmZuINr0LI5NDYxBxrih4JARblxSsp
 lQISOOxotG0FCJTDWCpuOTsyeHlhl2X+bxJB44UwHYOAYPHck+pTBUZYiXHMDDg33Hoc8I4iHXk
 xTqJYLrGHtpjTXF6Sop/NviRuUWMqS9hhiRHJXYhjpfgyV2IcTQPThexT4G/XvZFrfWZstCoqb5
 SJTGS7KT46+4JE3fzWApRYX1moEQEMUxxJLT1y5tvyi1bXOOvc4iWE438n5uqiMvpO8p2UjSfTm
 jc0OtF5kLhrXMCCNb30HQEA==
X-Google-Smtp-Source: AGHT+IFZCxWXYzGPaJ+Fpyr5pD44xJg3mO/vEGV3TFHnOgghMwA++b6wko/XdNnqusONUByGqiK4lg==
X-Received: by 2002:a05:6402:4302:b0:5de:dc08:9cc5 with SMTP id
 4fb4d7f45d1cf-5e59f35eab4mr2661989a12.7.1741180021272; 
 Wed, 05 Mar 2025 05:07:01 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 05:07:00 -0800 (PST)
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
Subject: [PATCH v6 08/10] optee: support restricted memory allocation
Date: Wed,  5 Mar 2025 14:04:14 +0100
Message-ID: <20250305130634.1850178-9-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for restricted memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of restricted physical memory and a
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
index cfdae266548b..a14ff0b7d3b3 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_sdp_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_rstmem_pool *pool;
+	int rc;
+
+	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
+		union {
+			struct arm_smccc_res smccc;
+			struct optee_smc_get_sdp_config_result result;
+		} res;
+
+		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
+				     0, &res.smccc);
+		if (res.result.status != OPTEE_SMC_RETURN_OK) {
+			pr_err("Secure Data Path service not available\n");
+			return 0;
+		}
+
+		pool = tee_rstmem_static_pool_alloc(res.result.start,
+						    res.result.size);
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
 
+	rc = optee_sdp_pool_init(optee);
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

