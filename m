Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF0382EE4
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363736E978;
	Mon, 17 May 2021 14:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42356E979
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:35 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v5so7064910edc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l4pSogmXrr1QfGx8sZLoGeTUykDMhAN7m5cUEpp5evE=;
 b=Ssxbaphk7IvZ0aGPx73MRiv0gYgzwY4nM6bKH4M8yoZ6avURhi1r4+zHoQ86bwVFTC
 CnnOLqF96R67wcWnoS6JrkqXyapvOj4Feet3uSxVxz6HpdLug2EZcgtYWRyCxD/Fn2Me
 Cy1RicUMUzvHrhz36raQd+/nKBYbc49+6vb7ueC7hM9em6uQJIu9qsgaymObsTCoR3c7
 spUZUTyxiGC5H0E7v7uIi7aazyBB9RiW6ea5Aeef8uqHo+0sBfwQWBuYfFcG+4Nm8qOe
 RwNpxiqhrb/ERkLyUnbb9zUR4f1cXc7ZSMWSqLgUG6NazKc8YJx1oHPsVCUt9mIo6SaD
 hvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4pSogmXrr1QfGx8sZLoGeTUykDMhAN7m5cUEpp5evE=;
 b=qV2WLaR6fScxWwryUxuG3R4M+Tr5IzUo/78Ul83KqkZ5KSH67sKq/kVlZ2x5AMLEzk
 mAb3BB2h6vyyxWSVhPT+4jkoWsECjKxAYYu/J0+xhlADix7ev9pl7oPmBE95znqawjAf
 x3Xk98r+pYZ9aC76lNId/A8zgIE3bD2+kAAtOcDUQN0tPiPUxUg+Nz2Oa7pn+r/U0UdP
 xuvbYYLrh7h1FL1nmNOAnfzPZAc4XN5lbcP1CJrXmlOQF1AFcWRUFgo6C/bg8XnAeWzq
 6RQPGF7Yza8HYw1R5wn9AyUjrD26Jietp20rlpDAqBe4pXgT/JLiLTMn1fO5uUhgkwxP
 Ot2Q==
X-Gm-Message-State: AOAM530fkLrSJzSk/Pvo/rI63U9geVLg2ZCvZpZRvnJRfv1tBAHGI3aP
 9vJ5PWXG/+oR2BiesGfPvJtsUOV+/Hk=
X-Google-Smtp-Source: ABdhPJyFvybgqXNsHfHGdqDea96ArpVoArpj7dNe2OIgNCnJxxSoYAlTxioXAxkAWIzumgd28fxGlw==
X-Received: by 2002:aa7:c782:: with SMTP id n2mr245257eds.77.1621260694282;
 Mon, 17 May 2021 07:11:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/11] dma-buf: cleanup dma-resv shared fence debugging a bit
Date: Mon, 17 May 2021 16:11:21 +0200
Message-Id: <20210517141129.2225-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

Make that a function instead of inline.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 18 ++++++++++++++++++
 include/linux/dma-resv.h   | 15 +++++++--------
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 87f5d82d992a..6c6195315e9f 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -208,6 +208,24 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 }
 EXPORT_SYMBOL(dma_resv_reserve_shared);
 
+#ifdef CONFIG_DEBUG_MUTEXES
+/**
+ * dma_resv_reset_shared_max - reset shared fences for debugging
+ * @obj: the dma_resv object to reset
+ *
+ * Reset the shared_max to test if drivers do correct slot allocation.
+ */
+void dma_resv_reset_shared_max(struct dma_resv *obj)
+{
+	/* Test shared fence slot reservation */
+	if (rcu_access_pointer(obj->fence)) {
+		struct dma_resv_list *fence = dma_resv_get_list(obj);
+
+		fence->shared_max = fence->shared_count;
+	}
+}
+#endif
+
 /**
  * dma_resv_add_shared_fence - Add a fence to a shared slot
  * @obj: the reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index d44a77e8a7e3..f32a3d176513 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -92,6 +92,12 @@ static inline struct dma_resv_list *dma_resv_get_list(struct dma_resv *obj)
 					 dma_resv_held(obj));
 }
 
+#ifdef CONFIG_DEBUG_MUTEXES
+void dma_resv_reset_shared_max(struct dma_resv *obj);
+#else
+static inline void dma_resv_reset_shared_max(struct dma_resv *obj) {}
+#endif
+
 /**
  * dma_resv_lock - lock the reservation object
  * @obj: the reservation object
@@ -215,14 +221,7 @@ static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_resv *obj)
  */
 static inline void dma_resv_unlock(struct dma_resv *obj)
 {
-#ifdef CONFIG_DEBUG_MUTEXES
-	/* Test shared fence slot reservation */
-	if (rcu_access_pointer(obj->fence)) {
-		struct dma_resv_list *fence = dma_resv_get_list(obj);
-
-		fence->shared_max = fence->shared_count;
-	}
-#endif
+	dma_resv_reset_shared_max(obj);
 	ww_mutex_unlock(&obj->lock);
 }
 
-- 
2.25.1

