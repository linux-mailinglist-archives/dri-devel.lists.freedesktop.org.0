Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C2A4FF8F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7092E10E771;
	Wed,  5 Mar 2025 13:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t06Zn+NE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9CF10E771
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:07:09 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5e5a346aeffso1092240a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 05:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741180028; x=1741784828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZWcwQgxJYl5xqresVhiMdi9+ZPx9Y4Kk8m/1lcEjeM=;
 b=t06Zn+NEf90I+uMTsAwKu6cS5JQ5DwnEw9JIXYwPjI6op25z4KDSeUyUIJuks+AuFn
 /tOENGlHykeaqtRoj/xEEWhwWvBs7kdfUxY3m4JG8OEAhsy6etee843XYucuf+3niUb6
 hsEPTagbmBymNSexdUpVmNbOUTjR30sGHrZ824/WQuH5N3lck5LYIqshdroTJP2swnvG
 aOsbHcv8X9awII7FRw6Q6RJlcDmviIb68E+UpPGFSSTSt8ORMT6NIUuGQULhbyPOB0FT
 QcrILiNfH9XCQgf/BFPAX/Dw1MqjRXixcFiqHLFFK/r23Z6Plo/gJgcuqvYE7rBDBSZZ
 Idjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741180028; x=1741784828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZWcwQgxJYl5xqresVhiMdi9+ZPx9Y4Kk8m/1lcEjeM=;
 b=i7sVfmH1JzIAuM566wWY6MR3HOMhpxRzVEFfZHHN2u6sx0KxASgsgcp2/VhXmviZ/1
 /TszTuiJpLL269VxCjVSjiKz6+0U9HVA8F/6T1N6T8ZJGNEsxh/nj7E/fUn55pJ16Wrk
 AgjWJpecXZlcEuZmKrUSVPoMpDSJjkuUMV/nb1OpufTtYyffQS8WSmBoOt881BuWxsaL
 x+SsH32k3Q8aBehEovbjIAud9z01DtwaJ58LaSuAuWQtDkC/MCM2NdAt+sUpg8Viot+j
 D8YRnmXwuJwqBhSYtZT8DABalcb0treFmck7pyTJrV2EvehVW5mJiWUaPnjRHqEa2OZr
 525A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGzrV9yGOZJLQsdA6Oy40nDWZS9fVHTsQEMbDobmTJOwrVQzaXzxSn9ZTagzRhNUdupFbJf1JaMXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIi/RYFcZjyxZAmyCODg2p9ipyViGZrt4pyUD/9AD3QW0tVtlE
 gpWTlxkor241HQD/8KzCscoOW1raFVCmomrKolPoYLFPArvZ6ykoXU8C7tPgK2Q=
X-Gm-Gg: ASbGncswgWH30Gi4k739KBAxMy5lq1TEOazkvZUhznkQ8zlaRgdO3MTcYatNsib6X9Y
 LW9CHtjzbvKdcAmXlIQgP3YhSG31Ic01H1UKDBLLDAYzGj9hscD7Unh0vOVmBEfmt3NYQEThu3I
 MT5YWj2Ms/76APDHDd3ueJUn6ofMn4RWh1J2IeGrF/t2PeW4DXEeC0G1VfBgfknDC+OTt8UY14E
 2mXe+ngtA2iCO5R0SgCFrKxR5ZhB6CXheeFz+Pvp+DYtobwRVnXylywy61yRw6qbXhEvJHRoAMe
 q64pVBOVn5fzCK4OAsMq7isUKBKU0ztAZH1iAusuVJIULS9ZRhU8AzU0lwTRuHp2LX6k7lJ5exK
 UGYd+LsIlftAA1LkUqzphYg==
X-Google-Smtp-Source: AGHT+IEU8qhj3jZr5pC33H3BKUPYoPOJwyx39WdATtL+5/RDhfCQ1+ckzcmgDPihiiWE9zWeUGcUMw==
X-Received: by 2002:a05:6402:13d1:b0:5e4:99af:b7c with SMTP id
 4fb4d7f45d1cf-5e59f384aebmr3091724a12.9.1741180027839; 
 Wed, 05 Mar 2025 05:07:07 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 05:07:06 -0800 (PST)
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
Subject: [PATCH v6 10/10] optee: smc abi: dynamic restricted memory allocation
Date: Wed,  5 Mar 2025 14:04:16 +0100
Message-ID: <20250305130634.1850178-11-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic restricted memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 96 +++++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 15 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index a14ff0b7d3b3..aa574ee6e277 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,69 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count,
+				 u32 use_case)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = use_case;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
+	msg_arg->params[1].u.tmem.size = rstmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+	rstmem->sec_world_id = (u_long)rstmem;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
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
@@ -1252,6 +1315,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_rstmem = optee_smc_lend_rstmem,
+	.reclaim_rstmem = optee_smc_reclaim_rstmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1622,11 +1687,13 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
+	bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
-	struct tee_rstmem_pool *pool;
-	int rc;
+	struct tee_rstmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc = -EINVAL;
 
-	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
+	if (sdp) {
 		union {
 			struct arm_smccc_res smccc;
 			struct optee_smc_get_sdp_config_result result;
@@ -1634,25 +1701,24 @@ static int optee_sdp_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
 				     0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			pool = tee_rstmem_static_pool_alloc(res.result.start,
+							    res.result.size);
+	}
 
-		pool = tee_rstmem_static_pool_alloc(res.result.start,
-						    res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	if (dyn_sdp && IS_ERR(pool))
+		pool = optee_rstmem_alloc_cma_pool(optee, heap_id);
 
+	if (!IS_ERR(pool)) {
 		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
 		if (rc)
-			goto err;
+			pool->ops->destroy_pool(pool);
 	}
 
+	if (rc && (sdp || dyn_sdp))
+		pr_err("Secure Data Path service not available\n");
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
-- 
2.43.0

