Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D11A3A004
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E332410E707;
	Tue, 18 Feb 2025 14:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mPiXGJr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C546510E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 14:35:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5452efeb87aso4241383e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739889352; x=1740494152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8kowqzBNNR30VBKvjQTsvLxpaN4SxkdbGASJgFBpcA=;
 b=mPiXGJr6h0251JHFgC/YKhw02f8DArET7e/HgB/yrMXOZStqIK1yVvmyijZAckWzJq
 /h38ZAIBNhGYzCMF4ipVFT50NXbOOOwYFBLBUPN3L69FpvQ9oNmNzfEMi/fuPPgZs+bk
 9WR6THEZF7CYeg0RL1qG8RdZPEFzCc5T0DTV8NbH5XsTBSpc4WoZz+4mY3dy1My8B7k1
 IU2i7PGg+SOUwoODdNVX2NyHlwL+o26MtkoM5Im8Iv6ZyEFDEpE3nAWcYAbwEpdL99+d
 2g6p00/MGP4TRY+7KWUs3Hei7CGVmb+cI0aUkgF6y33zt0FvVfFAIORjt9foSNCd63zD
 PjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739889352; x=1740494152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K8kowqzBNNR30VBKvjQTsvLxpaN4SxkdbGASJgFBpcA=;
 b=C6IQ3Q80J4KD1xWGROXk8kQFSZ8Lj0hEWKui7iujuZfPv4O+l6zCyzPzY3r5kIZGcF
 cdWMoxJDDMmx2vE02UJzsTbQcD00D8nH7j7+SHwLGnsSUdeHSbTJb164f5+XMd0E4TNL
 sFIn5XSvolBkZRLnCxDdKKdUjsdurtnj4p5OUIvf3Cv6Hz5emfJB3XXIBj/+cBhGYLkc
 yrTs4Ajx3FTSPxrn/DzVU6gOpiwP0EGZ4LIrwhRvbQmAqJNRR++fWjbb+fwZtWhFftAh
 Z99cqvKGWrenCxkOxj5o7km0ic9kvYMjkrU9M11mlGk/xGj8Iwtzz6YQrcfihn/bx6H6
 NSWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUal+XVecxHriIA+7Tlvke3Li/1z+OoqnVI8WKO2h5QYg9VS96CPPBSxCPcnPOZzBAD33tRKBpvx2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmIl5OOKVInjKNxENz4PGoHFN2wamxykMBmqlADa9brfXsnUQw
 josrqFL9LeZVMrj1t/1VyxaFUAxBl/GIXaswgTW1/EWI+V5a62V27/OK7Z31rxA=
X-Gm-Gg: ASbGnct0byxj6Z+C1OXwjlkcUTO//OSkw2e6LXnXmQ/zNx1NRjyvKlNsane6l5UZwOw
 OZCEGMmrXondSoKWs425puDe6igBMdlkHqupM2f4V/zLtaMM8hIc+Q3PrO4HFobZMlXtiT7n9hE
 rLqRIdUW5s3YobnqK8c2MfNCUdFFky6r6UjuvXn1YoZXdZ01sVJFe+T+SMmXGUlWyXIruSDKrDt
 ou/G7qrNO8aaLXjNorAfWa4Ar5hv6G9FLcJaqIafkj8SsnwuKjH73oCNNhEUYSpeZfAhfWBTw5j
 eBNIS+V+oSv3RJcakvuMXwM4+qZZ7pEfYWxCiWfqj6TuX9t/Kd7OnVvg7tIdfD5Q6JvJ
X-Google-Smtp-Source: AGHT+IG2QSia+pqq7pQb/RgZH7dPW4LfCNk4j/lwNSmjg+mmOj+PY1NlVhF5Eyeo9wfiKu01ckwckA==
X-Received: by 2002:a05:6512:ba6:b0:545:2fa7:5a8b with SMTP id
 2adb3069b0e04-5452fe3aaafmr5144347e87.27.1739889351902; 
 Tue, 18 Feb 2025 06:35:51 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:35:50 -0800 (PST)
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
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 7/7] optee: smc abi: dynamic restricted memory allocation
Date: Tue, 18 Feb 2025 15:34:56 +0100
Message-ID: <20250218143527.1236668-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
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
 drivers/tee/optee/smc_abi.c | 76 +++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 11589e5120c9..ca0cb5045f5b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,67 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count)
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
+	msg_arg->params[0].u.value.a = OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY;
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
@@ -1258,6 +1319,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_rstmem = optee_smc_lend_rstmem,
+	.reclaim_rstmem = optee_smc_reclaim_rstmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1628,6 +1691,9 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool dyn_sdp = (optee->smc.sec_caps &
+			OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM) &&
+		       IS_ENABLED(CONFIG_CMA) && !IS_MODULE(CONFIG_OPTEE);
 	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
 	struct tee_shm_pool *pool;
 	int rc;
@@ -1635,9 +1701,11 @@ static int optee_sdp_pool_init(struct optee *optee)
 	/*
 	 * optee_sdp_pools_init() must be called if secure world has any
 	 * SDP capability. If the static carvout is available initialize
-	 * and add a pool for that.
+	 * and add a pool for that. If there's an error from secure world
+	 * we complain but don't call optee_sdp_pools_uninit() unless we
+	 * know that there is no SDP capability left.
 	 */
-	if (!sdp)
+	if (!dyn_sdp && !sdp)
 		return 0;
 
 	rc = optee_rstmem_pools_init(optee);
@@ -1654,7 +1722,9 @@ static int optee_sdp_pool_init(struct optee *optee)
 				     0, &res.smccc);
 		if (res.result.status != OPTEE_SMC_RETURN_OK) {
 			pr_err("Secure Data Path service not available\n");
-			goto err;
+			if (!dyn_sdp)
+				goto err;
+			return 0;
 		}
 
 		pool = tee_rstmem_gen_pool_alloc(res.result.start,
-- 
2.43.0

