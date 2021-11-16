Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28C452EF8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 11:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406306E3AA;
	Tue, 16 Nov 2021 10:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A3C6E1B5;
 Tue, 16 Nov 2021 10:24:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d24so36600502wra.0;
 Tue, 16 Nov 2021 02:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HEGpUo6vrxQTNQUpP+urhAJCyKmgX70ObR6Liot+zKA=;
 b=YSlaiSgZu8R7FWJr5N+13V4kFoqOp5L5K53VTVGRRoh78jw5j9rPC3Pw61Ud2KEAW7
 W+0GtNAjQWeodEOU9xqJnQYoKGKTi8QHbyYXs0ftEg0q+oWUsl78U0k4I0WYxevfutt0
 mzGmFRlcbcW5Kd1B6sAceZfFfNTWlBIgk6hbT7naTlXRSPPjvt2XkhD7WU79AnZZEWpz
 6SjKqFYIoG5RBg2kjtofZmoqpvyUn8LtmaEaGYPmP7BBxzUSBrX6aHyXZTIMloOuToLM
 vpYnUzR/p+cub6y7rogy1ygNR3jbQcXqNgh2ZhRzVgWvPZMmXeAyV2K8VQN652qYM+/M
 T6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEGpUo6vrxQTNQUpP+urhAJCyKmgX70ObR6Liot+zKA=;
 b=d5yuujeScHMdQZ1/9EzOo6lMUx6+w8GSBPtAxBbF1xaEGE7iP0r5yiklnKAPCUvwO7
 ty2lqAOHpsS7x77IWUGDqZJH14fOeBgjmaNhqBVSfYI7krveoR4HhLfV8gsVARBbkRcB
 YGFQXcTH+wqG3uZ/ZuFOKbxdwAhdK2rzIJRv3zE7CPCPYedVKC9ffw+TIc4Czgl8IsCq
 jeKN9epwBfuCg9RGnSrSOy99MDg5YwJpC4WmXhWYLb7neGzPXhqcPQmThBHwzlUUlEJ+
 RTLbypPzbtgB/nS07rk9KcihvKzUMHHw5gMiKGdRd/RUZlz9tC/1a5dkFRH/4Xg2oNJp
 OSaQ==
X-Gm-Message-State: AOAM531hOjCtvg6wVq3CIApLprPFoT/fvW/0GwogivbmOJkGWZKWevWx
 MMv5yuk+7Krz0OTJuN0MOCPljtoftbqfqw==
X-Google-Smtp-Source: ABdhPJwDUe5nG1AD/KQ32GgR6sI90Gd9RMpELbglo1cLe9X+4QY5wD/vqMqT/vPQL+7xDO30J4g89w==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr7899747wrv.120.1637058277767; 
 Tue, 16 Nov 2021 02:24:37 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 4sm22119334wrz.90.2021.11.16.02.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:24:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v3
Date: Tue, 16 Nov 2021 11:24:28 +0100
Message-Id: <20211116102431.198905-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116102431.198905-1-christian.koenig@amd.com>
References: <20211116102431.198905-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: use dma_resv_for_each_fence instead, according to Tvrtko the lock is
    held here anyway.
v3: back to using dma_resv_for_each_fence_unlocked.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 53 ++++++----------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..7ea0dbf81530 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -572,56 +572,25 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    unsigned long timeout,
 				    gfp_t gfp)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *f;
 	int ret = 0, pending;
 
 	debug_fence_assert(fence);
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			if (shared[i]->ops == exclude)
-				continue;
-
-			pending = i915_sw_fence_await_dma_fence(fence,
-								shared[i],
-								timeout,
-								gfp);
-			if (pending < 0) {
-				ret = pending;
-				break;
-			}
-
-			ret |= pending;
-		}
-
-		for (i = 0; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
-	}
-
-	if (ret >= 0 && excl && excl->ops != exclude) {
-		pending = i915_sw_fence_await_dma_fence(fence,
-							excl,
-							timeout,
+	dma_resv_iter_begin(&cursor, resv, write);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
+		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
-		if (pending < 0)
+		if (pending < 0) {
 			ret = pending;
-		else
-			ret |= pending;
-	}
-
-	dma_fence_put(excl);
+			break;
+		}
 
+		ret |= pending;
+	}
+	dma_resv_iter_end(&cursor);
 	return ret;
 }
 
-- 
2.25.1

