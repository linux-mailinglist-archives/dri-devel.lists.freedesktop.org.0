Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35236B07AA4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19CC10E7D5;
	Wed, 16 Jul 2025 16:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FFaU0r4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A18710E667;
 Wed, 16 Jul 2025 16:06:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so793355e9.0; 
 Wed, 16 Jul 2025 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681961; x=1753286761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wxf5aXO+Hdd8Q820dvj7me7YwJHxQjmUHVvn7elrjmg=;
 b=FFaU0r4U0fAeEviXNPtMfyEgTNzmNPpuEikf0VjBZJfWWeWWcrqc4N1djkwP+4shjJ
 hd/y0SQKQkWNQQWbJJ+2XlJRL1MgqcUAsKjGi27P9tYTZLYgRWcNgeeJygCPV6soDhpB
 ZwB+gZU+95F2EeQB+bV1bjqhR2/JI3e4cKmpWxjQQUe7vDhhUqKjvo7ysH+koIDkSkpE
 wQBvBPZ7xXdvtaiyvJmJIPHxfmlPl+cZbvrLSK3HUoGHfuF3/0iDj98QPReq4uvG1sQD
 JU6NOmKXrmf0dhIdj5HnkXJFG0QXoEfm8mj7MLm4dRPJ1UJrpXhZeT4rm4STbzy1nSL1
 eI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681961; x=1753286761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wxf5aXO+Hdd8Q820dvj7me7YwJHxQjmUHVvn7elrjmg=;
 b=aX1G1UUmeY/mgmIUwrJY3shS+mlDzaiqHq0ljAeSdYJtUYYa4zWRnSBSL8/bz0xV4y
 gJVvI+3NLMtYN/bC5NfUR9gvmSep8+lhi4CrbU6iWOqko7nNL4wspWoQMfhlUn0lD7FE
 2sNpJSpASdRAUTDjd1WUJqlfIRiKfm8Irm7ygkFQvANPQDpH4myihaurCOJ6Z82jBDdx
 gfG5sMzrSCQaHKF+oOREzClPmVVvK7Crwi8mF5ydVuzs2ye50LGeHRLuK5Qtl0+LKz9h
 Ir1Gp2ZleLdQzCejU+T6L7iiat3toPmywRSS/7TZ8msqieBafuKeinFba/clo3D9pJj6
 kGRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiYQkuQ3/TllCoiV8yZJLPN2wUXXa8RxByECj3BONX+3w2VNVGo7/2iFroPVVCa6JxyoUqVNsOjRU=@lists.freedesktop.org,
 AJvYcCXwMRFcagaj+CT80iSje4Y2TgkzLjilOQ4ouTDTJFEQnXuxw9ZXTpPhObNNf40bD2rVPalOKdQcWf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUm1jWD/FQS+HgY6+yVYqQAZDqDq0/eiKd2oB0HhzKblutH8w+
 Wzuuhagtd7bo3o+eK0I+24bnz0ZjcU/Nk8PPuBiKqle0hNrh/vq1Ojh/
X-Gm-Gg: ASbGncvstLRY74m+1J6e2BFl3qgbJAdfcuYl5If0w22EDnmdCpEZw3symXnj4ZjP22o
 nUMq3BZkgh2QMToUU50hAIhrJ5amfDeqVgJKaUhSZ2ZoCFAKIcYZzb6kjk8pkqSe0Hz+tGjy3oQ
 jlMMzk0ltHXbnZ6pkWRZO6uLlfoTMugHVYgDaZuVsX7gKGhl2JUO2cZTIFq5K93Qk9CYeXupoVh
 +YTr08XRTMyJE78HJdamWktVTfJWxRlDcNfnr/uSerGtdF4pFSOZ2UArsiGiq6MCDwCil+71dip
 7LUd18p1ntsT3v2iddT3kq+6rD50YsL0KsYYkZAgmoeu2PwMTBCGNinG7n8Qc5fjVoOfFMV+P0c
 QETIaZKjiEnwYg0A5OcPrTcP01ska/PCu3OM=
X-Google-Smtp-Source: AGHT+IHcJ9dGqqUnGd6lH5Is7kadjKFRoiFdnX6iqhFX5x8wbuDwp7hQ41x4Eg28UNxDiT68H8VtHw==
X-Received: by 2002:a05:600c:3582:b0:456:21f4:a0a3 with SMTP id
 5b1f17b1804b1-45634533d98mr469695e9.5.1752681960790; 
 Wed, 16 Jul 2025 09:06:00 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:06:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/7] drm/ttm: remove ttm_lru_walk_ops
Date: Wed, 16 Jul 2025 18:04:21 +0200
Message-ID: <20250716160555.20217-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716160555.20217-1-christian.koenig@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
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

It's just another layer of indirection.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 12 ++---------
 drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +-
 include/drm/ttm/ttm_bo.h          | 34 +++++++++++++------------------
 3 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d456be1d6e1e..ea963dc43b62 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -554,10 +554,6 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
 	return lret;
 }
 
-static const struct ttm_lru_walk_ops ttm_evict_walk_ops = {
-	.process_bo = ttm_bo_evict_cb,
-};
-
 static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 			      struct ttm_resource_manager *man,
 			      const struct ttm_place *place,
@@ -569,7 +565,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 {
 	struct ttm_bo_evict_walk evict_walk = {
 		.walk = {
-			.ops = &ttm_evict_walk_ops,
+			.process_bo = ttm_bo_evict_cb,
 			.arg = {
 				.ctx = ctx,
 				.ticket = ticket,
@@ -1197,10 +1193,6 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	return ret;
 }
 
-const struct ttm_lru_walk_ops ttm_swap_ops = {
-	.process_bo = ttm_bo_swapout_cb,
-};
-
 /**
  * ttm_bo_swapout() - Swap out buffer objects on the LRU list to shmem.
  * @bdev: The ttm device.
@@ -1219,7 +1211,7 @@ s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 {
 	struct ttm_bo_swapout_walk swapout_walk = {
 		.walk = {
-			.ops = &ttm_swap_ops,
+			.process_bo = ttm_bo_swapout_cb,
 			.arg = {
 				.ctx = ctx,
 				.trylock_only = true,
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ef1e42e005af..dec60a41185d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -888,7 +888,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 	s64 lret;
 
 	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &walk->arg, bo) {
-		lret = walk->ops->process_bo(walk, bo);
+		lret = walk->process_bo(walk, bo);
 		if (lret == -EBUSY || lret == -EALREADY)
 			lret = 0;
 		progress = (lret < 0) ? lret : progress + lret;
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5a16d304a849..63331a4b37f9 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -179,24 +179,6 @@ struct ttm_operation_ctx {
 	uint64_t bytes_moved;
 };
 
-struct ttm_lru_walk;
-
-/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
-struct ttm_lru_walk_ops {
-	/**
-	 * process_bo - Process this bo.
-	 * @walk: struct ttm_lru_walk describing the walk.
-	 * @bo: A locked and referenced buffer object.
-	 *
-	 * Return: Negative error code on error, User-defined positive value
-	 * (typically, but not always, size of the processed bo) on success.
-	 * On success, the returned values are summed by the walk and the
-	 * walk exits when its target is met.
-	 * 0 also indicates success, -EBUSY means this bo was skipped.
-	 */
-	s64 (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
-};
-
 /**
  * struct ttm_lru_walk_arg - Common part for the variants of BO LRU walk.
  */
@@ -213,8 +195,20 @@ struct ttm_lru_walk_arg {
  * struct ttm_lru_walk - Structure describing a LRU walk.
  */
 struct ttm_lru_walk {
-	/** @ops: Pointer to the ops structure. */
-	const struct ttm_lru_walk_ops *ops;
+	/**
+	 * process_bo - Process this bo.
+	 * @walk: struct ttm_lru_walk describing the walk.
+	 * @bo: A locked and referenced buffer object.
+	 *
+	 * Return: Negative error code on error, User-defined positive value
+	 * (typically, but not always, size of the processed bo) on success.
+	 * On success, the returned values are summed by the walk and the
+	 * walk exits when its target is met.
+	 * 0 also indicates success, -EBUSY means this bo was skipped.
+	 */
+	s64 (*process_bo)(struct ttm_lru_walk *walk,
+			  struct ttm_buffer_object *bo);
+
 	/** @arg: Common bo LRU walk arguments. */
 	struct ttm_lru_walk_arg arg;
 };
-- 
2.43.0

