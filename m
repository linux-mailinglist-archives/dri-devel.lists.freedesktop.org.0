Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842346BB4B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CF9EAFE0;
	Tue,  7 Dec 2021 12:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2478A859
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o13so29094273wrs.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
 b=SxJ7tS4I1VTI2d4zhEUvqgOILQy0taj+7D7MmoHKpCS8+4okA/O+5vjLlK2c6TOAFT
 DrkAUHTWvy6B7Bl/0aBcd6nZN/KOR8x8oVXuWD0hxPbzaxymNKsZ/XdqdMq30XtfprNa
 BxAiiNfuLB3h+VeJZVNQx0M+ARNB0xuxFoCZbQYQVv9hiYpMdsAXGhC+n6WifzJdn5DY
 1XeX7iP0VawOxGPzmK4oVpoOYicJOkpBWqnvxyOoLAAOe3Zw/Mj5P+RM+w1NhRuG3nrO
 eYWmxoI+it8kor1aTUbwlUy1IMTfE4B+LkIMiZTG33qDeFLa4vqlF/5+l3Iv5zNQ64op
 FSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
 b=j/fQgdyvfe1iOnTdUUz2ONufO9UfAPZesjSiA+3czxc5v27nZzbs/bxYMoYY1z/iGy
 xBkvUzr3nmfAtvy8Yzs0GKyaLwA6TpQMsEfj5E4IDFNxonJR5BQO15cFTf7f4PUyfs2M
 /k5MQuTY7y3rfvOnGYckYKBceHEvBAGCwL3XNiSu5WLvO7YUSuQBjzrRopKdEe6js7cd
 84cUaPAYMLVpW3RrQU3KnHuVKNxpcvYhIzhe5qs8VxsHCjTsUGxWNkPS5MddDSLqruxm
 +Lro7xwpmEqAkiivzF1J0FNq5pkfB0vCgaOMynSmbMTMQrXN1Eixri7j899CAAkubR12
 NKRw==
X-Gm-Message-State: AOAM533Ms6Yspc3H94dJy+Vuvi3pscutM9ro/F7/bDtX4y9vvb7mNmkG
 Ci6UujTBWpTL+PYVJ/ogW68=
X-Google-Smtp-Source: ABdhPJxRw3zErjp8Aco3pgx884gSt+EaYwT69bA1R5ukSSnQByQldt7mClxcQJ260RUMNdkZg02oyA==
X-Received: by 2002:a5d:5272:: with SMTP id l18mr50688259wrc.208.1638880468281; 
 Tue, 07 Dec 2021 04:34:28 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 13/24] dma-buf: drop the DAG approach for the dma_resv object
Date: Tue,  7 Dec 2021 13:34:00 +0100
Message-Id: <20211207123411.167006-14-christian.koenig@amd.com>
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

