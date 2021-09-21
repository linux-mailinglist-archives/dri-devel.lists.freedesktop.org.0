Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F44138A9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9786B6E9DD;
	Tue, 21 Sep 2021 17:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744EB6E9CE;
 Tue, 21 Sep 2021 17:37:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g16so41544975wrb.3;
 Tue, 21 Sep 2021 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yn0dGzK8VwWATbg/MRLaeJ+EViGvUvAidNc2i9iKcqg=;
 b=BXp4vBPHgyMt4mphaz8OlmhLC0Sy42FigPpS5Xtaglzg8jnncZVb0WYrLRp7PkG67y
 EHAOzQG6va2BUIy7jCQSOuZEWwJpuKQuZRbs9aiRHWiKMfyJLCORDDkTJCPgIWFSrAv1
 JOnT7ZOgGjBpz2DR2WIg/inxZkW0h7LqShC5fkRQ02Bw8sv5HKrgCbsYomF+jFmAfdEx
 YMpr+i/ZdI2ZB/cXzb0XpsmqLoe38hF2I8tVtgvzfCzVMacaKtA2nHV6EJB63hYBAxxD
 xaJ7r5LREA2u9InAvND2j+55speamLkaFXslzhZ1T750nN/2aswO71LMSDEk/KX3HTC+
 Ri4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yn0dGzK8VwWATbg/MRLaeJ+EViGvUvAidNc2i9iKcqg=;
 b=5PbNVbv9CoWjVEeyB1rry27x/M7HW3C1Yo9aOW+G4w95tvkFLCU2MHI1XiDcYbOtmx
 y0OWCQSYgSj+62WRmAeV7AsE0/CNwWmFk5U4gWJ/UVZj5rellzeaIks5caQ+b54pa0Al
 TzLkbt4QtDKqHWKm1B6ac+CC3h5Su2t4CBqp8XWmbMWprGO0YO7Lxs8RTim29iD52Tv3
 Lh/IdBm2KKsm5gMMCbMjQ1s2afrdfL1z3uE5pkvlrhL/g7qcB5ythGpixDM6TIw+JuLE
 e1a0XYriY+4iIYEkMluMGWy3EAGin0Ii1FSqxOf+BCvRcMqUJ94Rbb+esozOmFfnZSG1
 3VyQ==
X-Gm-Message-State: AOAM531NWiHWzM9uVYLkpRrjyz3DMZ23VbBiFMCgKfq2FG1j0gRggO+n
 zhuDgA/Rx4oidy5WL92G6s4=
X-Google-Smtp-Source: ABdhPJzffrVmg63SpfjQoBj+8p0lFtYH9jgDg4ojsj/wafQkZwiDlftx4b0n0/O0NMeTyr9ebaN9Xg==
X-Received: by 2002:adf:f187:: with SMTP id h7mr18547361wro.115.1632245847038; 
 Tue, 21 Sep 2021 10:37:27 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date: Tue, 21 Sep 2021 19:36:59 +0200
Message-Id: <20210921173659.246165-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

Heureka, that's finally not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-resv.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 72e7ebaa675f..42ea6f667120 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -436,32 +436,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
 	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
 }
 
-/**
- * dma_resv_get_excl_unlocked - get the reservation object's
- * exclusive fence, without lock held.
- * @obj: the reservation object
- *
- * If there is an exclusive fence, this atomically increments it's
- * reference count and returns it.
- *
- * RETURNS
- * The exclusive fence or NULL if none
- */
-static inline struct dma_fence *
-dma_resv_get_excl_unlocked(struct dma_resv *obj)
-{
-	struct dma_fence *fence;
-
-	if (!rcu_access_pointer(obj->fence_excl))
-		return NULL;
-
-	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
-	rcu_read_unlock();
-
-	return fence;
-}
-
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
-- 
2.25.1

