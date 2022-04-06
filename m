Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C80BD4F56F4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9975D10F3A6;
	Wed,  6 Apr 2022 07:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0029A10F39C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id k2so1577345edj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=++1jVizcvHmOgbF39nCmTgx8csIzrlfkMcf5vnq8LKE=;
 b=fcAui09hg2UkLCPe6uLTaAMz1pN89NQOac6X5ZEYs3O41L2rAdwTnM2djgDcGsyZL1
 wG7LuRJJ5Nml5/AWnS0rC8n+8ra/QkCOHIXL6ZFgEgxYe8qj+Vnk0UWS7+xdYrukHoU0
 cmY7mDOYi66EhSp9x+1ootrocF+Ok9xDLNGs9EBDJFS8g8OBmbMCGWo10Tr8GWqemjIL
 JPA/umabR7vwv1Eai3YgfqoQSsNtCr3uhNeGxfZ2yeSwU0/UWpZg/PTaAflT36s0Xo3p
 eXwuenXfmB8o/Q43yOlbxC9l4rb8F0OCpHRmI2RjCeFwA4pFS2JpS1PyVNz4wtQjJVfC
 j8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=++1jVizcvHmOgbF39nCmTgx8csIzrlfkMcf5vnq8LKE=;
 b=6komgOCzOV0kDdkOms+ehyyQeMbQCo1/9opi9MCm8O8dbwlYtqhlkCN3eEWrKQGlUJ
 t/rWkB3jo57fd/JoSnjI7YKCjznL54EWMBmkZ2HBMsTX7KM2YkTvmI0MxDwU+0Hs32DA
 7dxSOlKC1ziOaipLfk7F4aJ5I7snjGZjCDRgRhUMeRTDvVtUseByZiXVECJ+5KCVayeY
 OpADHzOO0psyxJZ0/6+GIgvLjIcorZeqlIEdP51Aiu2e/avr6LMVmAZBSoCP2XvCt5xg
 VyqVS/R11PhCrhF49TCxgF2lRN6wychT6U16pRgwdRwdDPHfysj+pS90/yKy/1CQMYi+
 05GA==
X-Gm-Message-State: AOAM533ffNB/HICOQzz8v5se7EowL50iVGVro4INXkMQEvph0s2PlgwH
 h2+oZe5ztXsaAcdD4+7zykk=
X-Google-Smtp-Source: ABdhPJyhRY/py8JPz1zgxwqOZ6P8AOirAEfncXUYe331mK5ZH6kiXwgjd9MFGuWbIuAxTNdWLLQORw==
X-Received: by 2002:a50:fe07:0:b0:419:323:baee with SMTP id
 f7-20020a50fe07000000b004190323baeemr7434329edt.221.1649231518553; 
 Wed, 06 Apr 2022 00:51:58 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/16] dma-buf: drop seq count based update
Date: Wed,  6 Apr 2022 09:51:32 +0200
Message-Id: <20220406075132.3263-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
References: <20220406075132.3263-1-christian.koenig@amd.com>
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
Reply-To: DMA-resv@freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should be possible now since we don't have the distinction
between exclusive and shared fences any more.

The only possible pitfall is that a dma_fence would be reused during the
RCU grace period, but even that could be handled with a single extra check.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c    | 33 ++++++++++++---------------------
 drivers/dma-buf/st-dma-resv.c |  2 +-
 include/linux/dma-resv.h      | 12 ------------
 3 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5b64aa554c36..0cce6e4ec946 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -133,7 +133,6 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 void dma_resv_init(struct dma_resv *obj)
 {
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
-	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
 
 	RCU_INIT_POINTER(obj->fences, NULL);
 }
@@ -292,28 +291,24 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	fobj = dma_resv_fences_list(obj);
 	count = fobj->num_fences;
 
-	write_seqcount_begin(&obj->seq);
-
 	for (i = 0; i < count; ++i) {
 		enum dma_resv_usage old_usage;
 
 		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
 		if ((old->context == fence->context && old_usage >= usage) ||
-		    dma_fence_is_signaled(old))
-			goto replace;
+		    dma_fence_is_signaled(old)) {
+			dma_resv_list_set(fobj, i, fence, usage);
+			dma_fence_put(old);
+			return;
+		}
 	}
 
 	BUG_ON(fobj->num_fences >= fobj->max_fences);
-	old = NULL;
 	count++;
 
-replace:
 	dma_resv_list_set(fobj, i, fence, usage);
 	/* pointer update must be visible before we extend the num_fences */
 	smp_store_mb(fobj->num_fences, count);
-
-	write_seqcount_end(&obj->seq);
-	dma_fence_put(old);
 }
 EXPORT_SYMBOL(dma_resv_add_fence);
 
@@ -341,7 +336,6 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 	dma_resv_assert_held(obj);
 
 	list = dma_resv_fences_list(obj);
-	write_seqcount_begin(&obj->seq);
 	for (i = 0; list && i < list->num_fences; ++i) {
 		struct dma_fence *old;
 
@@ -352,14 +346,12 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 		dma_resv_list_set(list, i, replacement, usage);
 		dma_fence_put(old);
 	}
-	write_seqcount_end(&obj->seq);
 }
 EXPORT_SYMBOL(dma_resv_replace_fences);
 
 /* Restart the unlocked iteration by initializing the cursor object. */
 static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
 {
-	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
 	cursor->index = 0;
 	cursor->num_fences = 0;
 	cursor->fences = dma_resv_fences_list(cursor->obj);
@@ -388,8 +380,10 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
 				    cursor->obj, &cursor->fence,
 				    &cursor->fence_usage);
 		cursor->fence = dma_fence_get_rcu(cursor->fence);
-		if (!cursor->fence)
-			break;
+		if (!cursor->fence) {
+			dma_resv_iter_restart_unlocked(cursor);
+			continue;
+		}
 
 		if (!dma_fence_is_signaled(cursor->fence) &&
 		    cursor->usage >= cursor->fence_usage)
@@ -415,7 +409,7 @@ struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
 	do {
 		dma_resv_iter_restart_unlocked(cursor);
 		dma_resv_iter_walk_unlocked(cursor);
-	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
+	} while (dma_resv_fences_list(cursor->obj) != cursor->fences);
 	rcu_read_unlock();
 
 	return cursor->fence;
@@ -438,13 +432,13 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
 
 	rcu_read_lock();
 	cursor->is_restarted = false;
-	restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
+	restart = dma_resv_fences_list(cursor->obj) != cursor->fences;
 	do {
 		if (restart)
 			dma_resv_iter_restart_unlocked(cursor);
 		dma_resv_iter_walk_unlocked(cursor);
 		restart = true;
-	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
+	} while (dma_resv_fences_list(cursor->obj) != cursor->fences);
 	rcu_read_unlock();
 
 	return cursor->fence;
@@ -540,10 +534,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 	}
 	dma_resv_iter_end(&cursor);
 
-	write_seqcount_begin(&dst->seq);
 	list = rcu_replace_pointer(dst->fences, list, dma_resv_held(dst));
-	write_seqcount_end(&dst->seq);
-
 	dma_resv_list_free(list);
 	return 0;
 }
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 8ace9e84c845..813779e3c9be 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -217,7 +217,7 @@ static int test_for_each_unlocked(void *arg)
 		if (r == -ENOENT) {
 			r = -EINVAL;
 			/* That should trigger an restart */
-			cursor.seq--;
+			cursor.fences = (void*)~0;
 		} else if (r == -EINVAL) {
 			r = 0;
 		}
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 1db759eacc98..c8ccbc94d5d2 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -155,15 +155,6 @@ struct dma_resv {
 	 */
 	struct ww_mutex lock;
 
-	/**
-	 * @seq:
-	 *
-	 * Sequence count for managing RCU read-side synchronization, allows
-	 * read-only access to @fences while ensuring we take a consistent
-	 * snapshot.
-	 */
-	seqcount_ww_mutex_t seq;
-
 	/**
 	 * @fences:
 	 *
@@ -202,9 +193,6 @@ struct dma_resv_iter {
 	/** @fence_usage: the usage of the current fence */
 	enum dma_resv_usage fence_usage;
 
-	/** @seq: sequence number to check for modifications */
-	unsigned int seq;
-
 	/** @index: index into the shared fences */
 	unsigned int index;
 
-- 
2.25.1

