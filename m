Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B6494EF7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D9110E800;
	Thu, 20 Jan 2022 13:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD28610E7FD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:55 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso7413594wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ghsh9/gm33rniIPEwr7l+FWRFmTMwqMlUglC1RcFNYM=;
 b=l9bMzzsltwI9qHdtR3h1sE2seoLlRX+iS78U8FCM5kfNIzk3VpvzRl8E0OmKV8tqDV
 NBiM7ZQVyCCglQ9+zO/JjqCw+y/n0WztmO0SmCejd/lcoALSAMZ1RJRo9B/xFZ/URSde
 J/8qLgvCjtjh9YEer9VMfIA4sx2vKgg77xBfCW6xf7tElFFsI4dkLced3Aj+pkGFDQA6
 Gv7ju3dVonZi/eXjUb0p/bghR1o0DDYX5B3AuwNppeGYjcuU0k9S+aW7KgS/AVZxHtxq
 orw0Z9T0ku9Rv1khXRgVMHEXjSwSJWl08exwEHLcnS36pLsKlUQXuEg20exeBOERpYFR
 Wq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ghsh9/gm33rniIPEwr7l+FWRFmTMwqMlUglC1RcFNYM=;
 b=xw8fROmR04xQ/EpezAdIuaNGy4U9b4BISE0Ww4bmBbfaQgWJEG8fKeO5Q0W1x4q3EU
 TZo40Lw1PmimcmFs1DTz0Od7M6jASNG/lOiEkgxDF8os3u4n9wPknwhVchPXDrvYYJq8
 VNSVF25kO/SWovH2frtxam/0sgnS2WPkboG0lRoKJHvs0a0Ap90+nmPs+9FHVBu6XyhU
 FWI17CjdmBjcOkpi1J4azTSYSPOew4a36wtNdgVUP7tEGeIvlLxIDPqpz7uz3EbnXG6I
 KrcTf7jA2ga77NPRaJWgqBlpK8WZz7TTm67Fs8okwkzYxANZCz3X3BoOOBdNVRLsdkEv
 3XWA==
X-Gm-Message-State: AOAM531SH27wQPs9ifsy/xf0KRyBFVDxMdANJ7h87xiUV75ylxyhWo5X
 +J8O5JtVBDIrv7uJOLJ2A9I=
X-Google-Smtp-Source: ABdhPJwXUxckT/W7J0tLFbMv8MZBiii1SASzIMTUKx/rLqxRPLSuyHNljTcZjW00hHa7S/75UwnYcQ==
X-Received: by 2002:a1c:9ace:: with SMTP id c197mr8899037wme.163.1642685274323; 
 Thu, 20 Jan 2022 05:27:54 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:53 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6/9] dma-buf: add dma_fence_chain_contained helper
Date: Thu, 20 Jan 2022 14:27:44 +0100
Message-Id: <20220120132747.2348-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
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
index fa33f6b7f77b..2f497ffb70d8 100644
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

