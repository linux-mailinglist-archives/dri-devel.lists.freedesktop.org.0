Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71C846BB47
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5AC7B7F3;
	Tue,  7 Dec 2021 12:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C6172E42
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t18so5248611wrg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
 b=lFiBNhuCOTWa1JmB8pVxFfIV376b05LFMBtL6k6esixehcvwxOYwCSY1wJ531gxsyI
 1ODDU3bSOCvguGl0n25Wk1Y9Y+URe1PfTrAJ36ANqQLiKDiQUCPhipWUOhrg5Vlr4QqD
 4GrCjm0c5zOlcifmlWUpe9oKRrhdUJ7TH/D4q+OEbzojeVJcX67JZ4vu/mbVzKbhQBLL
 yj2EjbuTupYL0cAGLjzhzO8iOENJfKXjWkDyoFwAfi8N8M4y4YhIaVg/4aAhlzRaBe94
 qwtAOgetxq+4DIcrFm9Nfqzpvht+T2lKmrVo/CLMoWmj6dcMkCUNOug2fcx2ttcpXVqA
 StSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
 b=BMFRdxzn65xK/PCLReEWP6UxpCxA0r6VYuwQxLtDGHAn54ENLD7a86WkfgqSEAwbab
 e5zkrg+OxKInwCzv+WjAbxaNJn9cwfC5dWdI9KN8dHs84FwEIlJzOfRSeZdLzjcWiv/2
 ewEYcsd6OP8oBakf7sTugazMYu3LACXeCmJgqi+tguKJWy4jgdIXhqMX6DxhquKhbm1u
 f/gPnfCZJb+CaOcWo8EdiRGG+mT0rkBGFRXyGXAB2s6IHhoY75pzFNFiyDu8GHoS4GqB
 9GuZT/NDdamBduLPILgUBmVPWz+cW6rWi0ENcFnOjPBzo6wZTOkWJ4YtRYLSjJVZQbMn
 shqw==
X-Gm-Message-State: AOAM531D44oWNAdGOCKaPQt2jpoJgpSYK5f12SMraAkvCRw2f7zPh+2t
 I6J0eVpyN/+TpDvxcy+bTysjreaozCAk2Q==
X-Google-Smtp-Source: ABdhPJzQ5FO8Kp/E6suVibkttAQSH1UhF+nOw1hpGKlA3Yx/YaL++9C1S6lYcCLgs2UJf88YOoKUaw==
X-Received: by 2002:adf:f990:: with SMTP id f16mr48996757wrr.128.1638880467050; 
 Tue, 07 Dec 2021 04:34:27 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/24] dma-buf: finally make dma_resv_excl_fence private
Date: Tue,  7 Dec 2021 13:33:59 +0100
Message-Id: <20211207123411.167006-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

Drivers should never touch this directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 17 +++++++++++++++++
 include/linux/dma-resv.h   | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 694716a3d66d..9acceabc9399 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -147,6 +147,23 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+/**
+ * dma_resv_excl_fence - return the object's exclusive fence
+ * @obj: the reservation object
+ *
+ * Returns the exclusive fence (if any). Caller must either hold the objects
+ * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
+ * or one of the variants of each
+ *
+ * RETURNS
+ * The exclusive fence or NULL
+ */
+static inline struct dma_fence *
+dma_resv_excl_fence(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
+}
+
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index cdfbbda6f600..40ac9d486f8f 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -412,23 +412,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 	ww_mutex_unlock(&obj->lock);
 }
 
-/**
- * dma_resv_excl_fence - return the object's exclusive fence
- * @obj: the reservation object
- *
- * Returns the exclusive fence (if any). Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- *
- * RETURNS
- * The exclusive fence or NULL
- */
-static inline struct dma_fence *
-dma_resv_excl_fence(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
-}
-
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

