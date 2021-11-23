Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072DE45A53D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39646E52D;
	Tue, 23 Nov 2021 14:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FC56E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:22 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a9so39242441wrr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsZbCHHc39IwzipI/I2HHPgu845k5tKZQFQyhwuStgA=;
 b=IX0TjWXBUPhObIl0cCO8dd0jzSFtS894HIT0F0Z2KMoXPbPouWGDfaIF9A90NJvHIG
 pG8AReYdr0nH8qXNW/1LkNgroSUdWQMSCqVKUr9tE9juMhxaCvlmJd2UxRqUpqScC4a3
 S5j+/n4i1Lvpo7g4EnUHWXWwoh3sn3FfYbFoc5QVtysddljxokR8se+z2dnur3rJsO5P
 rMQ+sv8zYIOURRTl97xDQkAb9syxslZW+OSAwCQaDzg5ZIxDxD18wbhNTF6sjoZzLd4a
 QSifb5ykd7eS9CdVSflB/q5lkoLI7s9FUfLrX0uy0bkAbrrufZq4PiQjJWfUIBXHnwuf
 eeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsZbCHHc39IwzipI/I2HHPgu845k5tKZQFQyhwuStgA=;
 b=KDM+BEcg6CW558/pvd/CkF8DhIfuJdhbky/yCHVe7XFQrmV92D6+PqqKhjV0GlRiSb
 8byV5np7C9jdpq9Z8GHRBsvKtVaGK1Lugrbeoi+MKTWDwIVEGcpzmhZxkS/wLfI2c3Um
 V8WBKhpKXXesYRZEd1Xq2OqnCs8EHg8TcPONKCAITwebp3ScPYTgRfVVw13LLHTGJrAA
 0tkW9g7DZIaZT6DBhoGWx4pTTeqY96ZDnCFF41t/sEY1JZ0tg/Qi0dH2TKq2dvWVRaNT
 +3E7FcObw3BTdq7OvNRruqPIoW6axxY8iYBhlxxZybE2T6tLkZuXaF4q5JxVUDs6fRfX
 uFwA==
X-Gm-Message-State: AOAM533CsWmG6u/mBIJlRBr3pT0GXlU2cCDLx4wFLV83AJSVDoKQMiS6
 je3mn1N3/D39TGUs5WNqqlc=
X-Google-Smtp-Source: ABdhPJz/nc1WFMdvHu4CFDHPlz97bSqoSpO6wUDq9ZW9KJvprUNgLFbMxPH8+ZwGrMQkSi2yRX9w9A==
X-Received: by 2002:a5d:58f9:: with SMTP id f25mr7948234wrd.206.1637677281357; 
 Tue, 23 Nov 2021 06:21:21 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:21 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 03/26] dma-buf: make fence mandatory for
 dma_resv_add_excl_fence
Date: Tue, 23 Nov 2021 15:20:48 +0100
Message-Id: <20211123142111.3885-4-christian.koenig@amd.com>
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

Calling dma_resv_add_excl_fence() with the fence as NULL and expecting
that that this frees up the fences is simply abuse of the internals of
the dma_resv object.

Rework how pruning fences works and make the fence parameter mandatory.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 39 ++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f6499e87963c..e627a4274ff6 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -96,6 +96,34 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 	kfree_rcu(list, rcu);
 }
 
+/**
+ * dma_resv_list_prune - drop all signaled fences
+ * @list: list to check for signaled fences
+ * @obj: dma_resv object for lockdep
+ *
+ * Replace all the signaled fences with the stub fence to free them up.
+ */
+static void dma_resv_list_prune(struct dma_resv_list *list,
+				struct dma_resv *obj)
+{
+	unsigned int i;
+
+	if (!list)
+		return;
+
+	for (i = 0; i < list->shared_count; ++i) {
+		struct dma_fence *fence;
+
+		fence = rcu_dereference_protected(list->shared[i],
+						  dma_resv_held(obj));
+		if (!dma_fence_is_signaled(fence))
+			continue;
+
+		RCU_INIT_POINTER(list->shared[i], dma_fence_get_stub());
+		dma_fence_put(fence);
+	}
+}
+
 /**
  * dma_resv_init - initialize a reservation object
  * @obj: the reservation object
@@ -305,8 +333,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 	if (old)
 		i = old->shared_count;
 
-	if (fence)
-		dma_fence_get(fence);
+	dma_fence_get(fence);
 
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
@@ -334,8 +361,12 @@ void dma_resv_prune(struct dma_resv *obj)
 {
 	dma_resv_assert_held(obj);
 
-	if (dma_resv_test_signaled(obj, true))
-		dma_resv_add_excl_fence(obj, NULL);
+	write_seqcount_begin(&obj->seq);
+	if (obj->fence_excl && dma_fence_is_signaled(obj->fence_excl))
+		dma_fence_put(rcu_replace_pointer(obj->fence_excl, NULL,
+						  dma_resv_held(obj)));
+	dma_resv_list_prune(dma_resv_shared_list(obj), obj);
+	write_seqcount_end(&obj->seq);
 }
 EXPORT_SYMBOL(dma_resv_prune_unlocked);
 
-- 
2.25.1

