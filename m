Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D645A566
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A796C6E872;
	Tue, 23 Nov 2021 14:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21A56E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a18so2698162wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0m5E3AR75LeGECS5IYeG+cVquPxCmS2lBy6eXY5PgkM=;
 b=HUA7qtJj+ZTsIM+Q0l+p/sj0hiFdpqRUzm96MTGPVdFim7sLKlNlrGNBX7+z2Si3w8
 W8HIBSxSgd4tjVbWP+oOjAi9pXrMfh66OkJAy8gyOFI8kMGazPUGLV89Rgdh33xY3EMK
 0lORdbgAbIb+zb/sll7Ty1fjKmOLZvfN5Zu5fBWx3BpMHMnOTomfr7t7Ehd2d4dRz0Kl
 V0VlNeCL6t5/BKnycoi21iMekOGg8o4l9Pk42FJ+qPN1xZPXKTF6ZN08vB6h9KrW0csK
 UwZsdvjweAH3FvzHTNQHRPHnJjlqdVAmefSLKt/6JROAMV+npNkSFNc4Nqoh+106MCvl
 dioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0m5E3AR75LeGECS5IYeG+cVquPxCmS2lBy6eXY5PgkM=;
 b=KyMmchEguAh01hbTfR6WuiH/M7e/rPq9gVS6iOP85jyK0jr4KtL7ElU4gh6vXjLFR7
 iRbS02x64EA1Lr3FdcOjuu1fIWPRiQjfPdv1LOkhH29mOy+nxEFSzv7lLU8adjgoIPKU
 CvmSapzH8WCVdfa4Rw5Of7ycMeYe2QluTWNZ/EB9FLxF+nszfWjmoYtyRAjK6b5adCP+
 /d5tQh4cANWMgQzd6y5pz8Qog8OJ3JLCYzgH5kpU4U/j94tElHKtVHA9A9gG/C4ACTML
 xID2sGfOicOn1aArKcN7RGUV8Oqr1FWpIE8NyJdxtgZRxREI6jssuW0FqWImlG9FG4Pt
 nfdw==
X-Gm-Message-State: AOAM532LNfu949IOQvSEJBe9bLME6wsOeITZTRyQp69bMqiIZDL3wV4S
 7IgMLZ57AQ56vdmj/vlmM9Y=
X-Google-Smtp-Source: ABdhPJxFodcSQdq8IIGizebR8zbNcFO3Pr22YZuFiZsgi8Yi6eRNaaAPNxYIGsFqGL0V/ZOQmIRetg==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr7662667wrr.184.1637677304304; 
 Tue, 23 Nov 2021 06:21:44 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 17/26] dma-buf: drop the DAG approach for the dma_resv object
Date: Tue, 23 Nov 2021 15:21:02 +0100
Message-Id: <20211123142111.3885-18-christian.koenig@amd.com>
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

So far we had the approach of using a directed acyclic
graph with the dma_resv obj.

This turned out to have many downsides, especially it means
that every single driver and user of this interface needs
to be aware of this restriction when adding fences. If the
rules for the DAG are not followed then we end up with
potential hard to debug memory corruption, information
leaks or even elephant big security holes because we allow
userspace to access freed up memory.

Since we already took a step back from that by always
looking at all fences we now go a step further and stop
dropping the shared fences when a new exclusive one is
added.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 539b9b1df640..3b0001c5ff3a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -411,29 +411,17 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
 	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
-	struct dma_resv_list *old;
-	u32 i = 0;
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_shared_list(obj);
-	if (old)
-		i = old->shared_count;
-
 	dma_fence_get(fence);
 
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
-	if (old)
-		old->shared_count = 0;
+	dma_resv_list_prune(dma_resv_shared_list(obj), obj);
 	write_seqcount_end(&obj->seq);
 
-	/* inplace update, no shared fences */
-	while (i--)
-		dma_fence_put(rcu_dereference_protected(old->shared[i],
-						dma_resv_held(obj)));
-
 	dma_fence_put(old_fence);
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
-- 
2.25.1

