Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047DD780E6F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 16:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CE410E537;
	Fri, 18 Aug 2023 14:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E314A10E537
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 14:59:45 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bdb7b0c8afso7361265ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692370785; x=1692975585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3cLEemZTaWpxY5Ud6JppKDD+KRnvXP8a0Q/gju7PB0=;
 b=ouDnn0AyYsSTb5kwn1zqGecGxkqk76B7ZzCQf8wDD7IUFCttgUZqkcKemEy506eST+
 9gOte6+cVVktahqA9lcFLWCzZD7ZFm8HUKEhcyizBfwzbWAmJjhdtE3++Ukp+eaksvK9
 a415y8s+AVZ7PO7J/fBQM2D2Ldtxbst0sbFRf8oL3PwcUgeWSlZAt7hbVFRBsdYNts0E
 iAD2yBLViw/8SzdbXwjngQYLu3mBX3DJNJKZKcLckQl8o/+36+gvbq1pFU6YZHDUg7XK
 7Bc3sYe2yb2WyEdx2EHrhIxYBsRiL1TFStghefTBqyGr543gEa/0Yo2ungfOcEpqcIpD
 TKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692370785; x=1692975585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q3cLEemZTaWpxY5Ud6JppKDD+KRnvXP8a0Q/gju7PB0=;
 b=hCulCSz1km3iYbOvR6IolVFNVhXLauhqqcS3UZocNUMvTstugEBURVr2GLxpAT0WHY
 EiQQclDjSqSr5OQZSSb4fYVHKmssvdBZDU9FPcwjqtLfh+ha+ETsLF+vTZR9MlxDeqiI
 JN+WKQjlV1eNYXlZ0rrR3Q2s30GhX/w8sjJePgTNsmSZy5lAbyyNgfpTfjQ40NYnLLeu
 EaB+cvvd2QAVt569MLf+5r1eaUsxkWOnZxOIs9U7gECjbfkyVSmcSI9OwvCNjuFIWMgI
 v/PTiPslM6jxKyNwHuATyqPB0WEtbjFWVIg4Px7wyqqd7q+PtzoYnuWaFv67TZeYLeNB
 VJjQ==
X-Gm-Message-State: AOJu0Yw1TGztdydA4YVfm/J64fJFivw8cYunVjla7dK3XQMYZTVLKTRL
 oe9+RuYJMleWs6Fg1OEowLTlctPqvlA=
X-Google-Smtp-Source: AGHT+IEx4dcYnmGUbiTQEAo39DjvTIO3+KAAitSZwJ3e8/xFi3fvDLd9aL7Rz1QuxXkeWG44aHO8Sg==
X-Received: by 2002:a17:902:bd45:b0:1be:e851:c070 with SMTP id
 b5-20020a170902bd4500b001bee851c070mr2236300plx.22.1692370784595; 
 Fri, 18 Aug 2023 07:59:44 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b001b8013ed362sm1874349plk.96.2023.08.18.07.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 07:59:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] dma-buf/sw_sync: Avoid recursive lock during fence signal
Date: Fri, 18 Aug 2023 07:59:38 -0700
Message-ID: <20230818145939.39697-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If a signal callback releases the sw_sync fence, that will trigger a
deadlock as the timeline_fence_release recurses onto the fence->lock
(used both for signaling and the the timeline tree).

To avoid that, temporarily hold an extra reference to the signalled
fences until after we drop the lock.

(This is an alternative implementation of https://patchwork.kernel.org/patch/11664717/
which avoids some potential UAF issues with the original patch.)

v2: Remove now obsolete comment, use list_move_tail() and
    list_del_init()

Reported-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Fixes: d3c6dd1fb30d ("dma-buf/sw_sync: Synchronize signal vs syncpt free")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sw_sync.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 63f0aeb66db6..f0a35277fd84 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -191,6 +191,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
  */
 static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 {
+	LIST_HEAD(signalled);
 	struct sync_pt *pt, *next;
 
 	trace_sync_timeline(obj);
@@ -203,21 +204,20 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;
 
-		list_del_init(&pt->link);
+		dma_fence_get(&pt->base);
+
+		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);
 
-		/*
-		 * A signal callback may release the last reference to this
-		 * fence, causing it to be freed. That operation has to be
-		 * last to avoid a use after free inside this loop, and must
-		 * be after we remove the fence from the timeline in order to
-		 * prevent deadlocking on timeline->lock inside
-		 * timeline_fence_release().
-		 */
 		dma_fence_signal_locked(&pt->base);
 	}
 
 	spin_unlock_irq(&obj->lock);
+
+	list_for_each_entry_safe(pt, next, &signalled, link) {
+		list_del_init(&pt->link);
+		dma_fence_put(&pt->base);
+	}
 }
 
 /**
-- 
2.41.0

