Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B7743B57
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E2910E460;
	Fri, 30 Jun 2023 12:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECAC10E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 12:00:45 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so2870364e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688126444; x=1690718444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jSNFkpy8X8q5snyPf0TnsjyEkjeDAOs/W3MviCQiKpU=;
 b=Xxi3GKFOMn8YBEkXLqhdEFnxWd1Ej5ISBBpYBDdXb59eNl8eGYY+rSz6IgcdbpL04J
 TkVyok5g7NKVknHW1N3tPOgbD5Y+vQjDO3W0F+tX5El/aREoDnWGspItca/ar9xKU2p8
 rmPNpS2qHSejDoqnQH9YDzxSUqr78bWa7d7+hRcWgI/KqSoPfNkuc5g02amfo8WDDPB1
 uBeNGvkGFFVTTTHNkR9uQgI/3k8UOBIlObnbBPxbuwb5Ig+x5mIqBkvm12KFahCkAzlC
 bc6lOGXkOG9gIpATIiSqQgx0/kAsDbR2FJm5DTNMtZ3lyxpPGbQTUNZlMjgNFWd5Sjd8
 0+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688126444; x=1690718444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jSNFkpy8X8q5snyPf0TnsjyEkjeDAOs/W3MviCQiKpU=;
 b=H/Lrq2BBRzHxkgVSeedaSh6rggMMTxTYexGdYjmlGY26YO22VDciUh3EZW0Cc8vlTX
 RyOaOsu8LahIR9VEFlcq9KZhit6h1QugMhVnyAUQH17hEU9Suj/FLeFGQHgUepzjU/Fx
 RHLzYgzGtWQ9QKLtcZQq1uvgSmp2J4pKSGzVVzXqhEx8RDPyaZ1yBsEssRdow1zRgJN+
 BZPmAcAMECPr3koFyqEkC/wgmtXsvMAvpPtW0Khce0iF7fpLKsun9vXDxhPANOuTY6l1
 8I0/BnR8yq0OPigjKN3K4L1z8ACjDfjVEgbu1XXv+yv3lEsbgxnWYQ1Rj4BOefunTRgU
 Aaug==
X-Gm-Message-State: ABy/qLbY1jJaGzyTdbZ9u2rKCE1shfp4Mkml6owrPc6gMH9steIyEBP1
 zFgjwjY9govpa0a70xulI82Pfcizfow=
X-Google-Smtp-Source: APBJJlHLTQtIh5wy1odEImBp4NBhZQpOXNit0DgkOBCgR91/K7HjB6DQ+dJBflLPAIVqaGzvjJVYKQ==
X-Received: by 2002:a05:6512:1196:b0:4fb:8cd1:1679 with SMTP id
 g22-20020a056512119600b004fb8cd11679mr2858437lfr.44.1688126443329; 
 Fri, 30 Jun 2023 05:00:43 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ba:200:6a19:78f9:5238:6b7e])
 by smtp.gmail.com with ESMTPSA id
 o6-20020aa7d3c6000000b0051a5177adeasm6544043edr.21.2023.06.30.05.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 05:00:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: juan.hao@nxp.com,
	dri-devel@lists.freedesktop.org,
	Luben.Tuikov@amd.com
Subject: [PATCH] dma-buf: keep the signaling time of merged fences v3
Date: Fri, 30 Jun 2023 14:00:41 +0200
Message-Id: <20230630120041.109216-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

Some Android CTS is testing if the signaling time keeps consistent
during merges.

v2: use the current time if the fence is still in the signaling path and
the timestamp not yet available.
v3: improve comment, fix one more case to use the correct timestamp

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 26 ++++++++++++++++++++++----
 drivers/dma-buf/dma-fence.c        |  5 +++--
 drivers/gpu/drm/drm_syncobj.c      |  2 +-
 include/linux/dma-fence.h          |  2 +-
 4 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 7002bca792ff..c625bb2b5d56 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -66,18 +66,36 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 {
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
+	ktime_t timestamp;
 	unsigned int i;
 	size_t count;
 
 	count = 0;
+	timestamp = ns_to_ktime(0);
 	for (i = 0; i < num_fences; ++i) {
-		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
-			if (!dma_fence_is_signaled(tmp))
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
+			if (!dma_fence_is_signaled(tmp)) {
 				++count;
+			} else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+					    &tmp->flags)) {
+				if (ktime_after(tmp->timestamp, timestamp))
+					timestamp = tmp->timestamp;
+			} else {
+				/*
+				 * Use the current time if the fence is
+				 * currently signaling.
+				 */
+				timestamp = ktime_get();
+			}
+		}
 	}
 
+	/*
+	 * If we couldn't find a pending fence just return a private signaled
+	 * fence with the timestamp of the last signaled one.
+	 */
 	if (count == 0)
-		return dma_fence_get_stub();
+		return dma_fence_allocate_private_stub(timestamp);
 
 	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
 	if (!array)
@@ -138,7 +156,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	} while (tmp);
 
 	if (count == 0) {
-		tmp = dma_fence_get_stub();
+		tmp = dma_fence_allocate_private_stub(ktime_get());
 		goto return_tmp;
 	}
 
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f177c56269bb..ad076f208760 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -150,10 +150,11 @@ EXPORT_SYMBOL(dma_fence_get_stub);
 
 /**
  * dma_fence_allocate_private_stub - return a private, signaled fence
+ * @timestamp: timestamp when the fence was signaled
  *
  * Return a newly allocated and signaled stub fence.
  */
-struct dma_fence *dma_fence_allocate_private_stub(void)
+struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 {
 	struct dma_fence *fence;
 
@@ -169,7 +170,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&fence->flags);
 
-	dma_fence_signal(fence);
+	dma_fence_signal_timestamp(fence, timestamp);
 
 	return fence;
 }
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..04589a35eb09 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -353,7 +353,7 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
  */
 static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
-	struct dma_fence *fence = dma_fence_allocate_private_stub();
+	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
 
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index d54b595a0fe0..0d678e9a7b24 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -606,7 +606,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
 
 struct dma_fence *dma_fence_get_stub(void);
-struct dma_fence *dma_fence_allocate_private_stub(void);
+struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
 u64 dma_fence_context_alloc(unsigned num);
 
 extern const struct dma_fence_ops dma_fence_array_ops;
-- 
2.34.1

