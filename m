Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AB45A55F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1766E858;
	Tue, 23 Nov 2021 14:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CFA6E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so2734166wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EIK2Rv95IimliWtAgRf2dZ+cHmRPtVUYQaZZCSFa3qI=;
 b=qpAC6sKMWV77V3k95KiVNbdd0UySTnLgi0VzWZv9Q/1SL/ZWKpsllwduR/ovq5Dr+J
 ywTgHzTZoIJgyj3ewsHXUd52Lzq9vtLBHP65/iyTjILANi35OpUnB0MS7/X9n9qaluZR
 V0kgzextpuq/SrBT5VTOBXSVJ6PXmByAkcuOy8kCpggQO50erPELeetj7+40NrV9E1EG
 4i6dlCW0c9FlpKe6LZuT/Oe402StZL6CSZuYYEA70wv/UjDtfYYhi3guOwdcvU/NBEc6
 BgvMAjSmJn8fnuXa0Iruw4M5bYZo7qKRc+Xa13ro30whfFd0JJpb1O172tloOWZDQ92R
 7pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EIK2Rv95IimliWtAgRf2dZ+cHmRPtVUYQaZZCSFa3qI=;
 b=uf8p2ODkYOIPTwKDZHVDYPP4pUGvVUDRcM0TWLvRu2DBg1PlEtU7TANQRFhgn5jmxm
 T+cH0m79mZ04rHl2fo8o7JRuREZjfsZSuNUazOi1WNLSPzlDIJSEMZJ+MTc48xEG2HKL
 p9OxDwBLUoAUEw+jUYo8rjxkdvwPReZCzYs+rhBHBIUBueqCQtmNcWsPebh31fZteQBz
 sMkgsLkW0U6wNJQvLztcNGdic86ZevwB5oX+C4vXQ0/h0UML1n658hg0/DQC4M6ErBIy
 vV31jqbhJ0sks9Sllr9d2WcA9xgeBhtiE7rcxOrqgmX70WKqWUH7TedtEoeD1aY21wkE
 NcFQ==
X-Gm-Message-State: AOAM531xRVrgMd3SF4DBXnEapA8zn9QqFXf/0g1LRdqlVqVeFw1Vf3Xi
 F2i1tPPI+5H8LfWW4xQDwl4=
X-Google-Smtp-Source: ABdhPJwBWMzR4LY8DWWvZwbJbBOfuTy7fXUYMxmrzrxW3z5zk3L6f+uEC9yCYX+eJ8XMwLU9hUdRXg==
X-Received: by 2002:a05:600c:1f17:: with SMTP id
 bd23mr3678317wmb.57.1637677302713; 
 Tue, 23 Nov 2021 06:21:42 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 16/26] dma-buf: finally make dma_resv_excl_fence private
Date: Tue, 23 Nov 2021 15:21:01 +0100
Message-Id: <20211123142111.3885-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers should never touch this directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 17 +++++++++++++++++
 include/linux/dma-resv.h   | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f91ca023b550..539b9b1df640 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -175,6 +175,23 @@ void dma_resv_fini(struct dma_resv *obj)
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
index 082f77b7bc63..062571c04bca 100644
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

