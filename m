Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC1408C67
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881B96ECA6;
	Mon, 13 Sep 2021 13:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173C36EC8D;
 Mon, 13 Sep 2021 13:17:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u16so14660277wrn.5;
 Mon, 13 Sep 2021 06:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FH+1Y8etpSt7hl5BvOARvtVNTQnEKf9GJ8OSstB4GW0=;
 b=IRBEB/Z+uCUNNkQZrfkgIhbJIwP2pgNtoD3UDZYc9GFrjVoQemzgAWzQdNEiefvCsz
 m+RqoK9rB+6LydBB1G3ol89TFYhzaY7Bb4sa64uo8qbrvDefpdvIsxUzX3ZIEfsThCA5
 ek5ExJ2wiqx56JaMtXcPYSTx/Aw4FNMYlT0j5MryEIkdVskf5OJfvtRNYw44LkB8l42t
 7XV3py4qEvmh+Y0Jgzrp887rBfbHzMqPUPHHqZqofhp113bYW6ArPbRTfgWGfoL2weGh
 cohH5f3H0eB9Amw5/roZlGNzi7lIWlKHktTiOqbBZB2OaTE0gVdDa81MH8PvGeYLgdKP
 02Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FH+1Y8etpSt7hl5BvOARvtVNTQnEKf9GJ8OSstB4GW0=;
 b=QWF0V5P0SHQYpCyA0slqiqqM71xKWmGm65rJsG0xD5kopNXMCCJLm//1PtXZCUA9u9
 Y1tNpUNZ0pay7cg3Uptqte6+qdpnDT4LU3REdmJKRd6R2gHtcuYPUKPwQzmjSzrV7C86
 0kQBr6h2xRZC0HMvA2VyzvJBYK2kbDeWnv/lnDhZPvxpBGvD+/0ln/PgEoIwx3YEHFZ5
 HQ8RDPlmuIp6W44YoZx2HjerVKO0VO2qwdlR6yZ4jsD5v9ElY+2i8jeNfNbAT/HAvyL0
 FTDTCvf9Yu9ARTfMXSFKizrWRyxBxI7OSdEkIjcvMXzbUBCVrABnrRoxmL3fLXIj0Eqf
 TibQ==
X-Gm-Message-State: AOAM531mAOLqAEy7y12u4ZR2hpgs+ZYiDeVHIAKSWvOBcYOrQ2rd+jr4
 brpqQzkACROndQIMFpr/x3o=
X-Google-Smtp-Source: ABdhPJzDBDz9n7p6FviVglwiX9to5ht8Ev+V3kXammh1L6gotOGiN99UxVy/CWUMpe7mH0cAtrMT0A==
X-Received: by 2002:adf:8b52:: with SMTP id v18mr7251297wra.1.1631539065006;
 Mon, 13 Sep 2021 06:17:45 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date: Mon, 13 Sep 2021 15:17:07 +0200
Message-Id: <20210913131707.45639-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
index 6f9bb7e4c538..90c15cbe7d92 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -370,32 +370,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
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

