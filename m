Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197CB240F2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 08:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DAF10E4B7;
	Wed, 13 Aug 2025 06:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VqGLQqjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAFE10E4AE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:04:11 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so10767909a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 23:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755065050; x=1755669850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMyd1M5LZgFUuwfgUjsWaWr5cxJRx+F31yZrIJB0d8c=;
 b=VqGLQqjdFknYgXU1vQ8P/KUEArEKwygBYEVrHdpVqSu/gL3bWyRNAl78+Y9Rrus/nH
 ivApsRbQg04O0aCoRscHBtluovxDICay3NiOEN+ysHaxWZIoSMUi80W9eJr27FK6MoGY
 vd/SsuDA3UJV7qcO9XK/jAX70TRV1vuvPcqd65qu+G25t+ocGne1NfueEzmSTAzqFSlZ
 Bp1Ee6frCm09L7+T1SXKSBx7n6jlDkMq1MEKx0boo+5LJcTJXP+wePrdc+bll+wPx77z
 L2wwMaDK4NgGwyNEOIHVwkbAT1T+4+R+X1QMbW+Z8EqNviJOTX7sJbMrImqN0hJLIXco
 kUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755065050; x=1755669850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMyd1M5LZgFUuwfgUjsWaWr5cxJRx+F31yZrIJB0d8c=;
 b=Bgc3MStO1L3Bv4CXBBoPi20bhBgutLfaggGd9/W0RX6xwP3POc2c1e5Q0DTu/TkYvz
 6OmSPJTe2NWbeaiNUaz5F+W3OgsP2ws78t2OGToSD/74CcrUp9NNWf0rWd0cqxIJVrnT
 3PeZsWOc1VR8nj4KDonS2cf13uLWeXTvUTImuW3vM5wmkIz+Nuil/cZjE7telymaOo4c
 AVmj+LGooe1HPwt7SF3mY1WuOJ+jgbdCVHC0XReng5iMsa4Ob7JbnOKVMwvWYFxsGCS0
 3B2L5nSx4OF9ABRh/raA9ngFqff6lSFyekuEhdFaVmZHttFxJ9M3/eCsk3RyaZu4ETp1
 LIJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQpRIgqXYuDeSRACXjiASwx6KfolyN9+FnP4iQW9OHipmtmY6Swppp/MoNmBRrkBdkN/+r9vnJDb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ6bru/RAwvy+lgZlKnP8ePR5FVCfrdtK+l9DqM+P4mE3BzrU2
 TWm3GaEhHN6mx+OGw4yRjJVHLmw7vnNhN77V/SbrNNy1hqVKyvAOu5TvYaa/KqtKbbM=
X-Gm-Gg: ASbGnctfEWq/EeW/3Bp+h2gfjO0ZtTIf6/unDdFjG9lWZnSTCKPGzgc92S/RJp99NHW
 yQs2gj7wahrFHpOroYDDRH5wyOpMG6w2p2ZsXiN6DeI3LqPqyTwVm7UkXRk0nBXHOdKzdhI/XoG
 CRWss4fdcOsF2hJo+FWThmTManC9VbhXb01KPxJ7S5S3Wu9gjEc9v+vHUcEtOUg5hc3HmYUO8ms
 nVgXkyzwu4Yb4zW2eYp96TJcD5AxMXL/KSk7RrkCCWvgKYuoZqUW7ylfRj2Mlg1fj8tQOwlHSRk
 V9nu7UqYjpauOd2TXhBullkBIMO+B6gr76p/VOAqnJiicRkJEPH+eysRCftVbBaujkUg4zBBzsW
 WRNvvK8QOrEefeR9SiXnJxTEf2fpFJ7pUT+WZEqD/uj/e232cb8R7e/f3TjMRpoMyQ3NHF9V+AI
 Y=
X-Google-Smtp-Source: AGHT+IGl+zk2kZ7dGtXoXvUAogPksLb/KD4WUBLmDCFuz3Yjsb2gUsdZ4PxNJjaVjkahgiQaR0qEBw==
X-Received: by 2002:a05:6402:2753:b0:615:38e6:b739 with SMTP id
 4fb4d7f45d1cf-6186bb8e5damr1297264a12.10.1755065049472; 
 Tue, 12 Aug 2025 23:04:09 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se.
 [37.123.177.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 23:04:08 -0700 (PDT)
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
Subject: [PATCH v11 9/9] optee: smc abi: dynamic protected memory allocation
Date: Wed, 13 Aug 2025 08:02:58 +0200
Message-ID: <20250813060339.2977604-10-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index b4c007ed3b94..0be663fcd52b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u32 *mem_attrs, unsigned int ma_count,
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
@@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1627,14 +1693,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
 	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
-	int rc;
+	int rc = -EINVAL;
 
-	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+	if (!protm && !dyn_protm)
 		return 0;
 
-	pool = static_protmem_pool_init(optee);
+	if (protm)
+		pool = static_protmem_pool_init(optee);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
 	if (IS_ERR(pool))
 		return PTR_ERR(pool);
 
-- 
2.43.0

