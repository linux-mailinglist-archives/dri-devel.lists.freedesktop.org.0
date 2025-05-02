Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A02AA6EA7
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21DA10E8F1;
	Fri,  2 May 2025 10:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ygacUEMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4626910E8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:01:21 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-acbb48bad09so323449366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180080; x=1746784880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlmCXINH+dafzBgYNqgq0wXLz20MQsNU7TGuhsodLww=;
 b=ygacUEMUvlocIWGOI1WcWxbO9fb6hJcANAfvGZYG2xHrp0I5kYCj902wTZEBYnFQlx
 EhRKLdO4GxV7yaSRGEtmAPUc7GTWazTE4hUo82gCYkMiFT71m6UhUnLqwUuruhScDNUj
 hyd8qsJWgy/YJyilxvOAcuQMkS6H/ewgdlUSbGFUpAChSo9uuifd+kh7Os4B3lc2WOGH
 uu3h7LcI6u1fY8aM4BhVA8sWLTZpqD3k070UOdJKmP83bYuMEwrSvSAErdxrCoqruNuw
 jtxpmKfuWXR1OzDSsg2d8r0CVeeX0j8VSPAziK89HikE10UFZ79H4b7ufYsLu+8m7U9z
 3xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180080; x=1746784880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlmCXINH+dafzBgYNqgq0wXLz20MQsNU7TGuhsodLww=;
 b=X4gKCGe9CQesz4q85I97iEgGGi+QjIDk3YQnGY9T9/nyp38/vCPYHzOejmlqZ0tXb8
 AkFtzWwl6L9J69lZj0XD8VW0A29XuvKuLtbjAou5ndR55qHpPACnG6TTBAYBoC2uYGvO
 YzWxKUuOG7+Z5rPZ0VjFplYltsBlDbeb+dZu0lrjuz2x4QEZWfOt8iab6VKIo3tTlD3T
 Dbs3MdCY4jN/3VUKJENbSZxznWeaM0QPNJNktxroQy6I998rLlXxe6Pr1gee7r3F9vo7
 F+5qjBIXO0UHafdhs+TbS6Ffzar+sWT9UR7EPPATrjeueJSd+n1Ux9rRAagbJ/qeT5co
 FUww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0NgDV3zXoO49sPMSVx3abKAdsflRACCLNhwmdCKsj6RaDq43vFvYf56Gtw+Jxquiv7aSk8eaZHEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4PonzbBiGcTVAh0RO5Rm76rjfTZzoBv9E11bnTcFSrmH3ekmN
 D4GogDDD+kFUhjoQnXLcYt/GHy3E2Hwf9id9VLUOzL6FPrx4Vb0gZ8kIe2dLqEU=
X-Gm-Gg: ASbGncsa38ahXyAzU/McHy9/MXHN+PV2CM5g1SfNYWXE5C01wUN5uC/a3qekDX7vJ74
 AsEhQ0Ly9t+lRNXKTtdvMmQ3RTYA2prydAWAHrfguF0q+ehGQ92xG5R3aDQzJvl9nGyRilkso66
 ZG7KppHMKJHOLYA/Ql0sLuBQLFvrTmdS+BX+upT6ny0rUkJvOXrk2P6+5lYl2ohkVX2GzEY+esV
 ZjQKfrXl+fvcVpQbL4NRJd2oYR5Lwof7Ri2rB+LShTok6EHCJbuUu+PUXYRwIeo89u00m01eJuF
 d8dgQh150WLUFmztB/RQ13BMIgOCszoutju9RSKZmf7EnFYQIqq2/ipwIYmhZ1c/9Rtj920yTos
 b7XkTF8C/idX8PL+VlA==
X-Google-Smtp-Source: AGHT+IEYfv3P+wsN6CjsHEtvD+7RxYmI0A0Zuh0sF27ecW7PLXPxnJ4H/XpyhrWak3QZy6czVPn/hg==
X-Received: by 2002:a17:907:728a:b0:ace:5461:81dd with SMTP id
 a640c23a62f3a-ad17acfda03mr249587766b.3.1746180079442; 
 Fri, 02 May 2025 03:01:19 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:01:18 -0700 (PDT)
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
Subject: [PATCH v8 14/14] optee: smc abi: dynamic protected memory allocation
Date: Fri,  2 May 2025 11:59:28 +0200
Message-ID: <20250502100049.1746335-15-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 103 +++++++++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 18 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 7acb43852c4b..766e7f5a3953 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u16 *end_points, unsigned int ep_count,
+				  u32 use_case)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = use_case;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = protmem->paddr;
+	msg_arg->params[1].u.tmem.size = protmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+	protmem->sec_world_id = (u_long)protmem;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_protmem(struct optee *optee,
+				     struct tee_shm *protmem)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS)
+		rc = -EINVAL;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
 /*
  * 5. Asynchronous notification
  */
@@ -1252,6 +1316,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1622,11 +1688,14 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
-	struct tee_protmem_pool *pool;
-	int rc;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc = -EINVAL;
 
-	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+	if (protm) {
 		union {
 			struct arm_smccc_res smccc;
 			struct optee_smc_get_protmem_config_result result;
@@ -1634,25 +1703,24 @@ static int optee_protmem_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
 				     0, 0, 0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			pool = tee_protmem_static_pool_alloc(res.result.start,
+							     res.result.size);
+	}
 
-		pool = tee_protmem_static_pool_alloc(res.result.start,
-						     res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_cma_pool(optee, heap_id);
 
+	if (!IS_ERR(pool)) {
 		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
 		if (rc)
-			goto err;
+			pool->ops->destroy_pool(pool);
 	}
 
+	if (protm || dyn_protm)
+		return rc;
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
@@ -1823,9 +1891,8 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
-	rc = optee_protmem_pool_init(optee);
-	if (rc)
-		goto err_notif_uninit;
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
 
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
-- 
2.43.0

