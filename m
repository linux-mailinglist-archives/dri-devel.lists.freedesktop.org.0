Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC892D1D1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D34A10E784;
	Wed, 10 Jul 2024 12:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dpH3Gp8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025ED10E782
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f40bso8484190a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615385; x=1721220185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4CxJJEdicDCb6IZeT3uMULK0SV5Cncp7AGUzQdXGY/s=;
 b=dpH3Gp8xXg27rBuT9ZO6fwUy1h+L/zlqW3cCzzrrNOJHuw0M7yUWk3xBplFD7+FL3f
 eMCH3VidrtvLqmq7rszs9hZh+81gHHgCVCQvn4Zgi5c7KJe2f5h2Nzu1TVcxc/fr67dr
 lWoJNK3s2FtqjjJqLH5MhtE7KFs6yviy9mTfSLUVXsiweYBYzcQyj9v6R3LUV+SvgyDv
 uV0hV/TTu06bG25yhBoMhM9/MJcdxtTNsmE9W0hXrdl395hC7PMzfcdT3gzOwM86Q0AC
 lvAxnU49wF/qKx6cpX2H9n31LxWTuKmPoitX8ED7qb5+Rm6dvyW5xlup+xSeRS1NLzrO
 DWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615385; x=1721220185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CxJJEdicDCb6IZeT3uMULK0SV5Cncp7AGUzQdXGY/s=;
 b=Qctxu5El8axvfBFcyBeZ7khDnsgJ2njiZrIUhTY0xJotH2xP/JB5IAqe8jc0NtM2KW
 vu3DlXW17H+BBG/CYstwOljkpIFvCu03tqr7+RuB/qhOVcNCS8EPSl0aMJ7/ZculnJTY
 7gtPjdl5cAwhbY1BLn4CBWkcYVlQb/ID6boNycpHQrXiy7wqeDbJW1FjHdQkOp2be9Vm
 KMgb2Aw7VY/cQcNNTMN3Y46o/xSpnkibhHBFzB6MoQb5rbMpfafFGlFQngro8t2bd7W2
 xBHfA+rsfpFuB96c+gNZ2p0V5VuRncp0FWUmQHzXoeE4C7jFBQ7PfuBzx9040jK48ApT
 6fbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7eOuWSMLSEAythkRWTd0icIK1cmGhdhZRHfdtwTVFWuDtHWg43HVSfmXe+TW1up28QeDvitY5+s4x/X2fxzA/abpYbFKLG5u9D3PpXN/M
X-Gm-Message-State: AOJu0Ywo96Nir3XmfqIB4JCxj+4phBMYPPNZvSxw17qlMx9X95XAMbvE
 0zy908Zo69NSA2XrvdZVn49E8pcFikRR14ee63zxc1iWvk2QA6+h
X-Google-Smtp-Source: AGHT+IE5etIXweaqq62z3jPiUqvyp41KQBN7iFif7bz5yhiAxsuI7UxbgemKOCShvKEwTUpd0fwezw==
X-Received: by 2002:aa7:c35a:0:b0:57a:858d:20ca with SMTP id
 4fb4d7f45d1cf-594bc7c7e77mr3355790a12.28.1720615384803; 
 Wed, 10 Jul 2024 05:43:04 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
Date: Wed, 10 Jul 2024 14:42:55 +0200
Message-Id: <20240710124301.1628-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710124301.1628-1-christian.koenig@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

For the drm_exec_trylock() functionality, there is a need to be able
to trylock a dma-resv object as part of a drm_exec transaction.
Therefore expose a variant of dma_resv_trylock that also takes
a struct ww_acquire_ctx parameter.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linaro-mm-sig@lists.linaro.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/dma-resv.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..68dae8f2a22c 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -405,6 +405,27 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
 	return ww_mutex_lock_slow_interruptible(&obj->lock, ctx);
 }
 
+/**
+ * dma_resv_trylock_ctx - trylock the reservation object
+ * @obj: the reservation object
+ * @ctx: The ww acquire context or NULL.
+ *
+ * Tries to lock the reservation object for exclusive access and modification.
+ * Note, that the lock is only against other writers, readers will run
+ * concurrently with a writer under RCU. The seqlock is used to notify readers
+ * if they overlap with a writer. The context parameter ensures that other
+ * ww transactions can perform deadlock backoff if necessary, and that
+ * subsequent attempts to dma_resv_lock() @obj for @ctx will return
+ * -EALREADY.
+ *
+ * Return: true if the lock was acquired, false otherwise.
+ */
+static inline bool __must_check
+dma_resv_trylock_ctx(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_trylock(&obj->lock, ctx);
+}
+
 /**
  * dma_resv_trylock - trylock the reservation object
  * @obj: the reservation object
@@ -421,7 +442,7 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
  */
 static inline bool __must_check dma_resv_trylock(struct dma_resv *obj)
 {
-	return ww_mutex_trylock(&obj->lock, NULL);
+	return dma_resv_trylock_ctx(obj, NULL);
 }
 
 /**
-- 
2.34.1

