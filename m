Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974AF3987D3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F5A6E3E3;
	Wed,  2 Jun 2021 11:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730796E3CE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 11:17:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w21so2341497edv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l4pSogmXrr1QfGx8sZLoGeTUykDMhAN7m5cUEpp5evE=;
 b=IoIRyky+bizrqwnFMJtyopjvsM+ktbPs7iz9e2R3GNzT5Chj9Yh0S4ZxsYLY50km2R
 6zhJXaRaQKZgPcruqur1LBHCPipJGogZa4Gh7+qKoh0RYHLIk3v1GTmqlv8BFijV+Ewu
 xKg3JAY3PlQpTm2xfaDbQJu+m+ScM/4wItSKA2YkymClWjjhloX4d7ixNxapO31XINAE
 R+F9ZkmC8Ce3Lktom8ADZlbNsbEiRSucmm/LqDZJtTN5MrBHYlpcUpjYRaBYnLFYx3pu
 L4vPymuP9e+NvR3pJXkVA/uC7Kuzf30rdhOnQnnecoQ8sj9qBF8fGzS1QKR2x68IEOIJ
 pdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4pSogmXrr1QfGx8sZLoGeTUykDMhAN7m5cUEpp5evE=;
 b=MZOAlx4rerelzaybK79zlwjczzA0JxbIOLxnL7OhefgTIPk47mNINXWpOrdTceogL8
 AROzC3dWPNfYQLt9DYGRPqFxGbce+DfUY02cfgp+tUTlNZcLWNvVqJiBaUr596li43yS
 fE98ds/4SXvztlBPQq6Th4rQRxZRhkWbVuSBtlWWCDrvqqjzo0e/j9IQ9fwMfc1mzGYA
 veDEde792oMWlaJ3gQsiiVtc520JvVfsOQyblmrHyGFB5hZx89J0xYrLYBvy/vVtzj4d
 rxu9MkO5t1pgo4bar4XfSjKAzjawJ1DZD3928YrGC8vdyE3JkBmstNdlvB5bjaPn0P5F
 h9EQ==
X-Gm-Message-State: AOAM531t/XKMDWHB8nhqquTwtPbAbwPPLqvgL1/rzYu5y/P+QmkEyoqc
 OAZfljNEAhi9dK4ScrbPiww=
X-Google-Smtp-Source: ABdhPJwXB/Ww0oYat6iD0SwgA7b99Lnun+3R+8hRo9uvkL4K9HCpcIOp6gg6nzMKa5QQEk2gdjOmwA==
X-Received: by 2002:a05:6402:3551:: with SMTP id
 f17mr37685249edd.313.1622632637226; 
 Wed, 02 Jun 2021 04:17:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id r2sm8310497ejc.78.2021.06.02.04.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 04:17:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	jason@jlekstrand.net,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] dma-buf: cleanup dma-resv shared fence debugging a bit
Date: Wed,  2 Jun 2021 13:17:10 +0200
Message-Id: <20210602111714.212426-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602111714.212426-1-christian.koenig@amd.com>
References: <20210602111714.212426-1-christian.koenig@amd.com>
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

