Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D749E8C91C1
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 19:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEAB10E161;
	Sat, 18 May 2024 17:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Gkmlorq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FA810E161
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 17:47:29 +0000 (UTC)
Received: from localhost.localdomain ([86.243.17.157])
 by smtp.orange.fr with ESMTPA
 id 8O9WsISRlQOWM8O9Wsvlrw; Sat, 18 May 2024 19:47:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1716054448;
 bh=UcEQtuE56kOs4tsCCaoGQju/nr916DkGkkvfsJQQWpE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Gkmlorq0ugnc3zwFK8MZXPXZN6UPrE4zoMggZlvYunBiE3Ya9e77/9iN42aea/llF
 i0xDwilOiIdEMFCvThSIkDJZ7QvIjr3McGuJW8B88QtXyrOCZLLarSyueStalElclH
 ZPGMZd+jIRp9PjU0eKNagNwvQE2vN5fDbpiXZ0vd1IlxWaj0dwmf3kcpb/efD4iFmo
 YsTFu+Nue9te4ci0k8UX/6yoEpqIg4gNQu5+YYtq7Yy4nawOlBpQ2zGKiKKyWcaXax
 7WUoKAeRShDUyHoWYIGECREk+9owyMgEcnQHJ8TOrDEzB46iYIDwhIPDQAcTRjiYCZ
 ohxtGOqC2C6DQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 May 2024 19:47:28 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org
Subject: [PATCH] dma-buf/fence-array: Add flex array to struct dma_fence_array
Date: Sat, 18 May 2024 19:47:02 +0200
Message-ID: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an effort to get rid of all multiplications from allocation
functions in order to prevent integer overflows [1][2].

The "struct dma_fence_array" can be refactored to add a flex array in order
to have the "callback structures allocated behind the array" be more
explicit.

Do so:
   - makes the code more readable and safer.
   - allows using __counted_by() for additional checks
   - avoids some pointer arithmetic in dma_fence_array_enable_signaling()

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
Link: https://github.com/KSPP/linux/issues/160 [2]
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Also, I don't think that 'cb' is a great name and the associated kernel-doc
description could certainly be improved.
Any proposal welcomed :)
---
 drivers/dma-buf/dma-fence-array.c | 10 ++++------
 include/linux/dma-fence-array.h   |  3 +++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 9b3ce8948351..9c55afaca607 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -70,7 +70,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
-	struct dma_fence_array_cb *cb = (void *)(&array[1]);
+	struct dma_fence_array_cb *cb = array->cb;
 	unsigned i;
 
 	for (i = 0; i < array->num_fences; ++i) {
@@ -168,22 +168,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       bool signal_on_any)
 {
 	struct dma_fence_array *array;
-	size_t size = sizeof(*array);
 
 	WARN_ON(!num_fences || !fences);
 
-	/* Allocate the callback structures behind the array. */
-	size += num_fences * sizeof(struct dma_fence_array_cb);
-	array = kzalloc(size, GFP_KERNEL);
+	array = kzalloc(struct_size(array, cb, num_fences), GFP_KERNEL);
 	if (!array)
 		return NULL;
 
+	array->num_fences = num_fences;
+
 	spin_lock_init(&array->lock);
 	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
 		       context, seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
-	array->num_fences = num_fences;
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
 	array->fences = fences;
 
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index ec7f25def392..a793f9d5c73b 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -33,6 +33,7 @@ struct dma_fence_array_cb {
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
  * @work: internal irq_work function
+ * @cb: array of callback helpers
  */
 struct dma_fence_array {
 	struct dma_fence base;
@@ -43,6 +44,8 @@ struct dma_fence_array {
 	struct dma_fence **fences;
 
 	struct irq_work work;
+
+	struct dma_fence_array_cb cb[] __counted_by(num_fences);
 };
 
 /**
-- 
2.45.1

