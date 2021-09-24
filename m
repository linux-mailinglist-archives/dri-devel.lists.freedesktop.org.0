Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334354177CD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A566EE58;
	Fri, 24 Sep 2021 15:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F726EE33;
 Fri, 24 Sep 2021 15:31:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w29so28587324wra.8;
 Fri, 24 Sep 2021 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
 b=XVCAHX80yj7fOOVhGmDrldDzQ+tZU1P01Ey6y5LZO1bhqLritw4vRboSKw9v1ZiVkJ
 +Qq+Im9zUJGVqrUWGXSAA9IcemqPtfIo/wr7WwzzeRFMun+hksrMaP7yBhACzRkr0q1L
 egGSvjFbf21ceOxwJWa+XiU6iUda0TyWJZsf3rLkzV0VznYvWfe8uDzuQO+dMPQe7fQ4
 ttTwD8bIXQTG9D5hbaNC92Nmi1nT54rn/RbHFH4CvhxiR546Lxo1jSzsooQoQzggRUXC
 hYKln3uM44d2NgLl0u8LlqS79zw1VeOXTkn+7LUEddNRZVB8Wze6nUkK+ZnFZlEl03c+
 xinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
 b=KrDQKvJ0fj5KQ7uyh30LvP7Hvs3KhVCvJB/eY7ZhDEiF4K2NS2QpheFYNFKT+sEFvx
 8pUAsUbS1Kz74F1zShKyPPOCqv75ljS+76ZprMnLP9VXBb1ByT05OspoIcobldKskFmm
 WBqbJ/8AtvwgIM0TpxfCxlIn8+o59hVNGaK9dpGrZt5i/px1Qxd14aQsg3Ed686ZQ1Ln
 HceLBUvSEKsUbC4Gf4c62rdtXWYqe3j7QBHIry6HieT1gz8ijcAqTAhhdv1WGBQ6+p8B
 M8NNAcjWjrg58ifHo6G6BmZGkKDV5zJZnHybOt5mVbmYZ1yyAGlvOS5o0nIdkNFqdXtV
 ybAw==
X-Gm-Message-State: AOAM533bDWbLYaxEE9N+D2jMJYSuJSdwtpGfECAd3D6RVhHU8bzcbfqL
 Pp6GQHux0niXyUfcIo+G8vE=
X-Google-Smtp-Source: ABdhPJxfVU2ZRGajuHbNqSwwhLNc1V+itYxHz7cNctZZYqzXr+vVdmnmCGw1zqkJ6hJhq4Oo9BoeSg==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr2680834wmd.189.1632497483876; 
 Fri, 24 Sep 2021 08:31:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/27] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Fri, 24 Sep 2021 17:30:55 +0200
Message-Id: <20210924153113.2159-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b22c0013dbf..301b0b4b082e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,23 +269,15 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
 
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 /**
-- 
2.25.1

