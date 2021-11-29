Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B369046149A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD5C6FA78;
	Mon, 29 Nov 2021 12:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC956FA5F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v11so36246252wrw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
 b=hFZQ7Wf2ThMK4Kov/Dv2SnYi3D7u4kzKzjSQ8AX2QU/GCquzNtMp18zmHP+23uIuUm
 bBOQnWWzKIsi4FrnfRYuiU5EKe8/LQ6hh5HuOzzFHXL0Df1F/J8fYDNbhFrlmrEM8mFz
 bjV0OOU6B2elOAHI9IJeJKJnwi275xqKpK0RbCt19TH6pR9Si9Uz7RWn23WO4+t73z/G
 KuIYYfemWIC9ZMvqsr+QXQGuSOuvoniVnD8R7A8iurUuV26MHDn1Vu8e0nnZqD89pLXZ
 lhy62fcQwH6Aq9t1tHORVZq6hTPp55/pgRkSlRN1PQIGzAM5htuTFqj4Uyx/cXo7Dnrn
 bWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
 b=R4Hup8iX46YzRcqhuErFP6l68+qn67aU3tNNJ6fpjsAq+jRgalQUNjbOWjVeFn/SUj
 yANrWdOTsLlG9jPzCzaQiod5J1Fnj1TKNGfu9rThD4LYL1rEH8IHKePGE3hhohkQZg+P
 eNOPLplT+TI7A7/Jq6JL+wa3skFhRLdfjSEAwigm4/SNMinELl500kMcGi467g6AuM8A
 Ti5v0krl3M+6+JjGUWt+otZl+oCb9vHtm8IcJu8dbCClxQha/hY1ki4z8k7Qt4WgHVyN
 BLk4W9FnYhzAHsh5Nfo/spZie1UJTOiA2Ofc8rPyn+LNww0xqFQoZUPPqfeWpS6Lq57L
 Z9Ng==
X-Gm-Message-State: AOAM530LSmCifDsS+03vaqrEDPy24h0ULBheQWgiYi+vO5CrE1TcGngv
 smD29o2RUm5wOrr6g2AVxK4ONXeAAhg=
X-Google-Smtp-Source: ABdhPJz962doMvhn03X+ZY/g+6uiiAPD6K5IJ8HZjvKQ5sMZE8sDlV5ApFT8d9w3VQFXWjIQq19wSw==
X-Received: by 2002:adf:d22a:: with SMTP id k10mr34329840wrh.80.1638187644851; 
 Mon, 29 Nov 2021 04:07:24 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:24 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 17/28] dma-buf: drop the DAG approach for the dma_resv object
Date: Mon, 29 Nov 2021 13:06:48 +0100
Message-Id: <20211129120659.1815-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9acceabc9399..ecb2ff606bac 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -383,29 +383,16 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
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

