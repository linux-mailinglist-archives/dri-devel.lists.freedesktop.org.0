Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6AA7BF5F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D95210EBE3;
	Fri,  4 Apr 2025 14:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eyIJsHF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4188710EBE3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:32:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so4138227a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743777166; x=1744381966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPfYhkbEaDQyvItBPqD6f0Sef9tTAM/sN3gZBFbfI4Q=;
 b=eyIJsHF9JG3ZqPG1CKDqzTADk4EFpd9iD2xNyguv02Mxg4OTTmUnEVuIjbGW+1wBNu
 9nwRXlZEcHh3cYdXbmHUtgY01yTCFt/Ssixc+/1cIh5t97CY9iMeyRgNBvnsccX/Ry4L
 PXzqgtyWdbOMiQXbEX7KWOg0j0Gmw85wPFtFtA9EKSAhy9PxQ8ZSTEBaCoO868TFj+vw
 D/AJ/EGgV5syUQZRO+uY24UZZID3yVIcJfFetyRTtu+0EzCBXFtbKqio/pI1CJksY7LA
 EmF8zcS8PiQbFmhInT3JumDH1bzWbPrhv555tn1F9w6gzB4iS60m1SOZ/AXQDML6HpOs
 jZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743777166; x=1744381966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vPfYhkbEaDQyvItBPqD6f0Sef9tTAM/sN3gZBFbfI4Q=;
 b=Z61jo6ySm8xLHlrlKwP+kRRAOBo9KHf2l/7isnovDrM7GFBHP+kavI7qf+X9fQRo6J
 LH9Hz95Lvm9b/ZiVQznPRTqSZidentHHGlwOKQcSiNQICpyDa1ISIRYS0s5ch107vYZu
 3c0+/jjdKuQdCq546C1hpB6WEPkqYZB35T2VXt7zF9ei416XImT8zJob2htNWfQSOjhf
 z2xfm9ijQpb0hxdtzPbd0BiilwfugjOxulqQzPhcrYIdnrG6tdAD3XO9vv9PAcCtHY9n
 p2u57qvWKRoco8GLgUcCviqMCwnMz6pXVgPgkS0duJoJFGCXRh7INvmDMth6RQCQ1o+Y
 SOag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs2YzJLBGDe9VH7Sirc/Lms8QW2EYziD2NaiJP3AOA0zadnaOins2KUP65ZAHSlbN8/JNBL+eDQEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoCfbR3PAu2oA3jDPzvx5udosPdMS53FECA8AIj4Po6BVv8IVz
 ij/19qiIixFvo3bFDY0nsQHx18IW8vzUuWeP9vbHF4WAC11EzHUhUI1mK7059kI=
X-Gm-Gg: ASbGncvZCx/kXrRIj8MB7GfXVVliAkPKq0VHSkdL3CFrm8GNIQ2Etqzp9IkECVkzlkG
 z0nSw98XTIfV6AlcyBncRI/fR662oJASY015mwQKvECTSYTO5Jgbg4FrTj7Q343YhZUYG2Mctj8
 6/GGgPlzGqnLVO7Tk/PcVyVs8mZ0cHehnRPvENyDL2u1vBZbuozotVeSXeZtmhy/Moy2qi2gW/N
 JuMVqgITEJak7WW0127afgQZKuR/fjeE35ctSpy9Qr6iTbtC4oebVcOCKKu4/wf2D65H1VPArP7
 BVRTyb7YoxovYyB+UtXDBJifqAAg8+PwjgHUsKzkIVDHRAlH66rBMKjnmYu5cam2c0WKPpbiUhA
 nkmI72aq2fnawsB6v2EbsPw==
X-Google-Smtp-Source: AGHT+IExyXHbOf2taNxw2yz+3CcX0NYoBCdJtwB6sr0Vv5nuFXnktNWKFMtHaLzI32Tb9SdvBjUavw==
X-Received: by 2002:a05:6402:380c:b0:5f0:8551:9790 with SMTP id
 4fb4d7f45d1cf-5f0b3bcd2c0mr2481680a12.16.1743777165747; 
 Fri, 04 Apr 2025 07:32:45 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:32:45 -0700 (PDT)
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
Subject: [PATCH v7 11/11] optee: smc abi: dynamic protected memory allocation
Date: Fri,  4 Apr 2025 16:31:34 +0200
Message-ID: <20250404143215.2281034-12-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index c10b38b23586..dd9887826590 100644
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
@@ -1620,13 +1686,16 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
-static int optee_rstmem_pool_init(struct optee *optee)
+static int optee_protmem_pool_init(struct optee *optee)
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
@@ -1634,25 +1703,24 @@ static int optee_rstmem_pool_init(struct optee *optee)
 
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
 
+	if (rc && (protm || dyn_protm))
+		pr_info("Protected memory service not available\n");
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
@@ -1823,7 +1891,7 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
-	rc = optee_rstmem_pool_init(optee);
+	rc = optee_protmem_pool_init(optee);
 	if (rc)
 		goto err_notif_uninit;
 
-- 
2.43.0

