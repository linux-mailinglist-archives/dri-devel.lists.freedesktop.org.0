Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A584979B2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 08:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E210E77D;
	Mon, 24 Jan 2022 07:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522710E170
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:40:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i2so11829625wrb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 23:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
 b=dH5sM5ldW3QMoO003IFYaAB598warM4tFOgMpkiy7HjUkEiLWT661aYTZvtyjFvlIC
 p2tArPmx5Ku4JKfUH15rUgXfqFJJdviqXadBtxmEZXL5WABRHkGmZpWA/sPYG8USXPDK
 ahuVcKfjH122XozbZodfY9LBAEVak5BlTNvw7aWIG4WRH5WPx0AI6PqeC41KuBChN1Cy
 tMOs/9Vx1vVBR/xXanhtVaSWvHaBH8s/qbFFC8FhnzfjuG36j0Vw0GFYLt2KqsT1Xf9u
 emO9f+DHsWSaCK7cvOc77OVcweaX+2VUaAymv5LDat8bf9t/6v6jEIHneYIs01tpGDn+
 nbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
 b=LmVWqFhG+g3gZKSzTIX19qgi2kxktY/q17ue3zDwKGLcHt7Ov1ODAAtCuet6alAFpH
 tTnV5hhvVyny4OcWmwmF9kGQloI1GKw4g4c9q9dESlHWd3guvmM0wcjKd6WA7k9JU32z
 Of+4xR4T0wAgFCTcGXaJ+pLNNEU96iZfRn5zDm3b94X+p51hfZo+67BNIHvb7zSXb1JJ
 1GKYdnGBpMEj/WmmggHGvr4UQ7xChfHvy8olvvhyvSikCn2NdWUnr+8+KPlLOyf0iEbs
 JEE+9heIjtxaAnD8m1ahPJsptmW7niNuEKiMIYzRYD37OXPHEzHElHk8Qg2vVSYzqHR0
 nyVA==
X-Gm-Message-State: AOAM532uEdORcZnnJKnjle4noGhS6SCVnYZqOEW2XCs9Fgff0lwqrOab
 iMKGP0u1ChA9JCZgrzhEAgI=
X-Google-Smtp-Source: ABdhPJzUXuu+U7lDxd6QtCBjJhL/Nn1issoTdOPgnREM6UtyKIt6NhHGaoe1OvEjjHrM5pUcUipgkA==
X-Received: by 2002:adf:f5c2:: with SMTP id k2mr13012175wrp.669.1643010051987; 
 Sun, 23 Jan 2022 23:40:51 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:40:51 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6/9] dma-buf: add dma_fence_chain_contained helper
Date: Mon, 24 Jan 2022 08:40:43 +0100
Message-Id: <20220124074046.4865-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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

It's a reoccurring pattern that we need to extract the fence
from a dma_fence_chain object. Add a helper for this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c |  6 ++----
 include/linux/dma-fence-chain.h   | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 084c6927b735..06f8ef97c6e8 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -148,8 +148,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 
 	dma_fence_get(&head->base);
 	dma_fence_chain_for_each(fence, &head->base) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
-		struct dma_fence *f = chain ? chain->fence : fence;
+		struct dma_fence *f = dma_fence_chain_contained(fence);
 
 		dma_fence_get(f);
 		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
@@ -165,8 +164,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_chain_signaled(struct dma_fence *fence)
 {
 	dma_fence_chain_for_each(fence, fence) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
-		struct dma_fence *f = chain ? chain->fence : fence;
+		struct dma_fence *f = dma_fence_chain_contained(fence);
 
 		if (!dma_fence_is_signaled(f)) {
 			dma_fence_put(fence);
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index ee906b659694..10d51bcdf7b7 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -66,6 +66,21 @@ to_dma_fence_chain(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_chain, base);
 }
 
+/**
+ * dma_fence_chain_contained - return the contained fence
+ * @fence: the fence to test
+ *
+ * If the fence is a dma_fence_chain the function returns the fence contained
+ * inside the chain object, otherwise it returns the fence itself.
+ */
+static inline struct dma_fence *
+dma_fence_chain_contained(struct dma_fence *fence)
+{
+	struct dma_fence_chain *chain = to_dma_fence_chain(fence);
+
+	return chain ? chain->fence : fence;
+}
+
 /**
  * dma_fence_chain_alloc
  *
-- 
2.25.1

