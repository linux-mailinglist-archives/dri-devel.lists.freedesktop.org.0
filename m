Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D44144CB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDDA6EB48;
	Wed, 22 Sep 2021 09:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B276EB27;
 Wed, 22 Sep 2021 09:11:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d21so4551863wra.12;
 Wed, 22 Sep 2021 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yn0dGzK8VwWATbg/MRLaeJ+EViGvUvAidNc2i9iKcqg=;
 b=bAI4QNHT6vZca+VmFCOr8IcuGXzG39ykF9NW3OCQnREbvSP4HdtVYbDCDCvnpb0uwp
 kiQDOiUHYuerHcdO0clz0n8em/ntx/m9ZEoC+SPuawsAbuNU+G8VjJkshFDctQafV8b7
 kWI+27wdOqFJW/b3CKnzoMtaCfk+MJOsq9QIfLaZ3phScwnLtxV3TX0aGtVcqoGCY1Ro
 yz0ThFDp5Cfc2O28+YF/58t8Licv5AKPUWZMGap6ksAZS+Xns9oL/4DoFbvpqTKGygEo
 KoyYl25NDtQWDpwd2GG+gXQh5hE56wBf5l6O3dtZ2AMl3LiFdWRlr+mQX+cUVIzDz87Y
 tMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yn0dGzK8VwWATbg/MRLaeJ+EViGvUvAidNc2i9iKcqg=;
 b=Xb85+LvZM6cvufc85Psv8MQCdMoaxLM5XV8/+u/1XGJ9qFb6mSLd0qSatGjSxLnMLW
 HSjyJsxwgDiJ2OAngnK3u6bffodh285dArX+gXVAPozss/ZqxbuKnBRjOARVq6rP/F53
 g+if/RRVl8mUw8Lp0he7wklmYmEmmyzgHBnc8137vTtPGp84eePPgOV/+L4lqDuzwcU8
 sZpG/nu66ljAJuaY+/QifgwRhgvAne+Bzo5sVZGnnW4v0z+KRlQdEyzNyZ6hHdKmosMn
 I4AZPVpMnzNTuF6xOE/CXNOMRZakxErFwuDlvfDE1HJSg3vLmGbezoTpVY+OCAUaye7F
 xwWw==
X-Gm-Message-State: AOAM533OJkZk9x43uHa+FUQbjfxcwLwjAOaf8cnBDKFkw7Ia6v8ZnXcD
 KNR2gdIgs0Ey5Iabzi99HVU=
X-Google-Smtp-Source: ABdhPJx1e4IYSS2hUCc44tdiMviIyop+wkXx3UxTQUXZN8BLtELRRtnSwV5mF7dKgP+yM4dDjp6h0Q==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr40573442wro.418.1632301871941; 
 Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date: Wed, 22 Sep 2021 11:10:44 +0200
Message-Id: <20210922091044.2612-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

