Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46CC8FB86F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D6E10E1D9;
	Tue,  4 Jun 2024 16:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lNesMdz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8910E0CF;
 Tue,  4 Jun 2024 16:05:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42147970772so7796355e9.0; 
 Tue, 04 Jun 2024 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717517108; x=1718121908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHxeKnQ2f1oDQioghZ3Qjfp5SfNlRx4NYZEzuEzE94o=;
 b=lNesMdz85IKJQmleCcWVXJ3lrdXFE1i/zBQ6NXvWSV/m0Za0P3oUD5nN0EX+MFzGgT
 gaAfK3x+BJZd6G5SRng651P/1NSNwBbC1FvYUTcFCXC/7OPM+k1eSSLM/JiL7+/oWQ5C
 8gmexaN5K3nYimznaV38rvX6ozV2fvOguvIlhiFL0fBZjf3o6BfILq2tg3P56lyKix5/
 8rKUbqHsXAK8bEFsbIYnMZapWKD9Zya8sMKt1ggs5HIpAzf1oy1VpvCeiSv3G3rnJRaa
 Oujn+8Jr6sbL5cXruG57sg35SB51BR+F3pSHk1N6+OTemDLPAj98wHnPABQyF/FnOpCq
 Yjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517108; x=1718121908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHxeKnQ2f1oDQioghZ3Qjfp5SfNlRx4NYZEzuEzE94o=;
 b=j78WzYCOlMcsj+koz1TDxjJX4dtN1xGarF8xg/z4Mh0frw99hLR6fT4IVZRIYqM845
 lZaNnBdsCDfX2E9d06FNbY/sKbZiUFqacfCR1os9KSrmA9aSzcivsh3KFla/irS3ESch
 X++0GokeZWrbmMSMu1KJ7GYKUkOQaDNQz5mPW2B9FJyX+lqJKoEeavAkvy8+M7gRPT99
 ZCKYM8/4QmwYjgBvm+jZ8Sz0yRovtUx02G1QSHyKSFInKjykhLpmoCU9gpkOaV5laYc/
 fodj0zOiZ6/ny78mKMaDCD5BUQvMgVeLJnE6jhQnknnn7+tfGSbAh6F8QAqNfNZ/WzSc
 jaxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxaaM0BoRTFUb27IINxVxpLHnjMuz3lLr7SKJhG7OCKJMv4YkiwlAHzR+7fAJ4Hx2upndE8rIMqjPHLXO13GiYK+IYJf6zdAyU/etryA==
X-Gm-Message-State: AOJu0Yy+ktCj38ANON7ka3teC1hOs64O+rYjY079mVAcZovRC2E4KKjK
 LTtq3VMNf9FxQrlbwt7cs7lKKrDKGIbBIhYuZAFWgDoYiO1KWiCw
X-Google-Smtp-Source: AGHT+IF8nC1GVrzK4cgpF1Cj6d61cI4iYX0+Rl/QVO6SAWz/gX04PXs3AIgjSBUCCoxM7c7av4rP9w==
X-Received: by 2002:a05:600c:5487:b0:420:2cbe:7efd with SMTP id
 5b1f17b1804b1-42156338a6bmr383055e9.31.1717517108167; 
 Tue, 04 Jun 2024 09:05:08 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157b:4500:3a1f:103c:c5a9:7f90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e7e07d7besm2388082f8f.18.2024.06.04.09.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:05:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/amdgpu: cleanup MES command submission
Date: Tue,  4 Jun 2024 18:04:58 +0200
Message-Id: <20240604160503.43359-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604160503.43359-1-christian.koenig@amd.com>
References: <20240604160503.43359-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The approach of having a separate WB slot for each submission doesn't
really work well and for example breaks GPU reset.

Use a status query packet for the fence update instead since those
should always succeed we can use the fence of the original packet to
signal the state of the operation.

Only compile tested.

While at it cleanup the coding style.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 76 ++++++++++++++++----------
 1 file changed, 48 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 0d1407f25005..32d4519541c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -154,18 +154,18 @@ static int mes_v11_0_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
 						    void *pkt, int size,
 						    int api_status_off)
 {
-	int ndw = size / 4;
-	signed long r;
-	union MESAPI__MISC *x_pkt = pkt;
-	struct MES_API_STATUS *api_status;
+	union MESAPI__QUERY_MES_STATUS mes_status_pkt;
+	signed long timeout = 3000000; /* 3000 ms */
 	struct amdgpu_device *adev = mes->adev;
 	struct amdgpu_ring *ring = &mes->ring;
-	unsigned long flags;
-	signed long timeout = 3000000; /* 3000 ms */
+	struct MES_API_STATUS *api_status;
+	union MESAPI__MISC *x_pkt = pkt;
 	const char *op_str, *misc_op_str;
-	u32 fence_offset;
-	u64 fence_gpu_addr;
-	u64 *fence_ptr;
+	unsigned long flags;
+	u64 status_gpu_addr;
+	u32 status_offset;
+	u64 *status_ptr;
+	signed long r;
 	int ret;
 
 	if (x_pkt->header.opcode >= MES_SCH_API_MAX)
@@ -177,28 +177,38 @@ static int mes_v11_0_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
 		/* Worst case in sriov where all other 15 VF timeout, each VF needs about 600ms */
 		timeout = 15 * 600 * 1000;
 	}
-	BUG_ON(size % 4 != 0);
 
-	ret = amdgpu_device_wb_get(adev, &fence_offset);
+	ret = amdgpu_device_wb_get(adev, &status_offset);
 	if (ret)
 		return ret;
-	fence_gpu_addr =
-		adev->wb.gpu_addr + (fence_offset * 4);
-	fence_ptr = (u64 *)&adev->wb.wb[fence_offset];
-	*fence_ptr = 0;
+
+	status_gpu_addr = adev->wb.gpu_addr + (status_offset * 4);
+	status_ptr = (u64 *)&adev->wb.wb[status_offset];
+	*status_ptr = 0;
 
 	spin_lock_irqsave(&mes->ring_lock, flags);
-	if (amdgpu_ring_alloc(ring, ndw)) {
-		spin_unlock_irqrestore(&mes->ring_lock, flags);
-		amdgpu_device_wb_free(adev, fence_offset);
-		return -ENOMEM;
-	}
+	r = amdgpu_ring_alloc(ring, (size + sizeof(mes_status_pkt)) / 4);
+	if (r)
+		goto error_unlock_free;
 
 	api_status = (struct MES_API_STATUS *)((char *)pkt + api_status_off);
-	api_status->api_completion_fence_addr = fence_gpu_addr;
+	api_status->api_completion_fence_addr = status_gpu_addr;
 	api_status->api_completion_fence_value = 1;
 
-	amdgpu_ring_write_multiple(ring, pkt, ndw);
+	amdgpu_ring_write_multiple(ring, pkt, size / 4);
+
+	memset(&mes_status_pkt, 0, sizeof(mes_status_pkt));
+	mes_status_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	mes_status_pkt.header.opcode = MES_SCH_API_QUERY_SCHEDULER_STATUS;
+	mes_status_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+	mes_status_pkt.api_status.api_completion_fence_addr =
+		ring->fence_drv.gpu_addr;
+	mes_status_pkt.api_status.api_completion_fence_value =
+		++ring->fence_drv.sync_seq;
+
+	amdgpu_ring_write_multiple(ring, &mes_status_pkt,
+				   sizeof(mes_status_pkt) / 4);
+
 	amdgpu_ring_commit(ring);
 	spin_unlock_irqrestore(&mes->ring_lock, flags);
 
@@ -206,15 +216,16 @@ static int mes_v11_0_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
 	misc_op_str = mes_v11_0_get_misc_op_string(x_pkt);
 
 	if (misc_op_str)
-		dev_dbg(adev->dev, "MES msg=%s (%s) was emitted\n", op_str, misc_op_str);
+		dev_dbg(adev->dev, "MES msg=%s (%s) was emitted\n", op_str,
+			misc_op_str);
 	else if (op_str)
 		dev_dbg(adev->dev, "MES msg=%s was emitted\n", op_str);
 	else
-		dev_dbg(adev->dev, "MES msg=%d was emitted\n", x_pkt->header.opcode);
+		dev_dbg(adev->dev, "MES msg=%d was emitted\n",
+			x_pkt->header.opcode);
 
-	r = amdgpu_mes_fence_wait_polling(fence_ptr, (u64)1, timeout);
-	amdgpu_device_wb_free(adev, fence_offset);
-	if (r < 1) {
+	r = amdgpu_fence_wait_polling(ring, ring->fence_drv.sync_seq, timeout);
+	if (r < 1 || !*status_ptr) {
 
 		if (misc_op_str)
 			dev_err(adev->dev, "MES failed to respond to msg=%s (%s)\n",
@@ -229,10 +240,19 @@ static int mes_v11_0_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
 		while (halt_if_hws_hang)
 			schedule();
 
-		return -ETIMEDOUT;
+		r = -ETIMEDOUT;
+		goto error_wb_free;
 	}
 
+	amdgpu_device_wb_free(adev, status_offset);
 	return 0;
+
+error_unlock_free:
+	spin_unlock_irqrestore(&mes->ring_lock, flags);
+
+error_wb_free:
+	amdgpu_device_wb_free(adev, status_offset);
+	return r;
 }
 
 static int convert_to_mes_queue_type(int queue_type)
-- 
2.34.1

