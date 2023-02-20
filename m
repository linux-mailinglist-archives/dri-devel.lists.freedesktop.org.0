Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672A69D4AE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426D210E790;
	Mon, 20 Feb 2023 20:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1210E790;
 Mon, 20 Feb 2023 20:19:24 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id x24so1263198pfn.7;
 Mon, 20 Feb 2023 12:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5If47abMxVvdOGe/2jH89dN5UVVTGLmcg6EQzMCdPac=;
 b=YzeOmopCn0gh++/gAGcFEfcXWPP1jVMzasozIMD7Gnkw8K3NyhlEHe1zc8el3aD0Vx
 CIjGOhfZLHb/eeQuNytwDrZu2MoSPDSzBx0NkJozDbP/hff1JNpcf2JBAIZfOu4xeUEk
 +zOyP81obkNmacqYNnkI/8yrUexPNt23g3fRPvuMaEXgoQIpCMGtdvsH2gFRg7OLk4HQ
 DlyJkIqao3kfB+qsI6mVx2PKcGPpW6oE1VQU/ZgJ4BErwqSEE0o8LhrAJChvdIFMFXmY
 FFXESxU7CgmFAJRaj8/2sXKYQmNzH+0DmG3t+TEr8o4FPil3h4k4nq2uUgFAqGXt3R3M
 6feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5If47abMxVvdOGe/2jH89dN5UVVTGLmcg6EQzMCdPac=;
 b=TSbzSvUX1FuQOT9AdMr3cAzXzvg6/2aLLZ3kgoQUXdGWrvTsJOSGP+ktv0VsWPl2Sm
 yHMN4dGO3W+zejmjKdQny4col38pUKuV7W2G+rjWvxjj9N+E/0nHE4B4B8gtMpxYyOY0
 ZraU7fTiVyN35hFUtBuUtP5nUv+BjoDBYEf42jxGmQ80pqz0Xi5OVKJy8dHnAFcoWP/Y
 UtrdxnfQEwEHccnKrzrbW/6fFqT6SwATKzS/nC8YOUipkhGLxdkv3gMy9cXiudPRwuO/
 qVy/V3WWyPZ8MSxzGPhbsFk/WCkpL5OPjdiAIK5Z1axNZJR6UZcPBKnsTS52ity31DdO
 CQog==
X-Gm-Message-State: AO0yUKVfpTKHBEOEFLx6H55MdDSKl6HsWfbBpU4Fyv6xokA6RwD4hqY3
 GFGaLs8FuR8sqByCwMx8B1Eh7+tM2zU=
X-Google-Smtp-Source: AK7set9GUlIkvZiMMJHbL1YlDHIQPYuqsE3eGFqhvDr4pSZzxB82JJDY+CxjmHJJWkP5dBcF/eD+Jw==
X-Received: by 2002:a62:7911:0:b0:5a9:c16f:b4ea with SMTP id
 u17-20020a627911000000b005a9c16fb4eamr1495085pfc.7.1676924363589; 
 Mon, 20 Feb 2023 12:19:23 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a62e806000000b00593e4e6516csm390202pfi.124.2023.02.20.12.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:23 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/14] dma-buf/fence-chain: Add fence deadline support
Date: Mon, 20 Feb 2023 12:18:50 -0800
Message-Id: <20230220201916.1822214-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Propagate the deadline to all the fences in the chain.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com> for this one.
---
 drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a0d920576ba6..4684874af612 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -206,6 +206,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+
+static void dma_fence_chain_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
+		struct dma_fence *f = chain ? chain->fence : fence;
+
+		dma_fence_set_deadline(f, deadline);
+	}
+}
+
 const struct dma_fence_ops dma_fence_chain_ops = {
 	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
@@ -213,6 +225,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.enable_signaling = dma_fence_chain_enable_signaling,
 	.signaled = dma_fence_chain_signaled,
 	.release = dma_fence_chain_release,
+	.set_deadline = dma_fence_chain_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_chain_ops);
 
-- 
2.39.1

