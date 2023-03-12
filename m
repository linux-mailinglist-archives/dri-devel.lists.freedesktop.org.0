Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF796B6B2F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6F10E1D1;
	Sun, 12 Mar 2023 20:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB3110E142
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 20:42:25 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id d13so1345pjh.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G9ZzGCWyiNAeiv6c+goQOhdGUM/VAx8Q7uPqMr39xR4=;
 b=eYXdz/2BUZ1QrGdWq7Ygaino1s5nWdnFRQ3haZ30fb0XJx3n5xWw9lT7CW3VAsiE2Q
 PSqm1FfR9rwv46O0vsC9QyQ1jbZW2BHVHt8eze/jQuHn3r1vmxhd0rBrVlq7Ubxb55PZ
 M7c/ihFaD4rSYWFbD8VTvQk1Y3OzdhDYg5xxw9pOHoxCm0q3u1NQ1ac08YmNuTa7US4t
 BlOuXlIx3qG6Be3XdAafUxXouSY27fQ3Dxh3c/Xo2cZNYxqTVpssVX7mYMT2C4rGbX3R
 x3nGqJDuvIAJayagyc+aYoMUYiqNB52DUJvVtFDG8aXjpxQrxXbnJj5c8JkAoRfYhCY8
 +6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9ZzGCWyiNAeiv6c+goQOhdGUM/VAx8Q7uPqMr39xR4=;
 b=LHCjOOX4+r0aCRSIQfUBudgEvKbevfbCz5O/GMVQxRScoa+V6D3uKZZSlTFh4pSHe0
 YWTOKYluPP1s5KnOKzySFWy5SN6UUJgBpGKVJFXceeh8JxzkxwTfQADjmfqr+pourbvn
 xtv+vbD4kQnM2bDwoxxiQIkCbn+AMI9GvEeBUapfwLARA9lSlkTvvyEsADZ3oMAkweBU
 L6H3DqCGkVCNmYLBVspcMNp6heXTB3BWiyAo3UlbdXcktZe5WRV9TTstTH+uj7tBvccD
 apGTb90SSiF6JiSDZymNjz9W+ppBenNQtMA2PvMoaDZGNdLk7wxBM8EQRPRoBmTr9nf3
 XTwg==
X-Gm-Message-State: AO0yUKW8CC2Q9bnCrxi5nrPipDYgeahckUqqtO2jY1AlFpPk8DjjTQE7
 DQEJJH4vEcoDX9/JmOgFf7c7y1JJ70I=
X-Google-Smtp-Source: AK7set9qQEs+ySobSlkG+OTM0pmExlrMP7uEMdAFDvg80bkouP5hTrTWPm8MBsIdzKZouyvCoPcA8A==
X-Received: by 2002:a17:902:ab57:b0:1a0:4ebd:15da with SMTP id
 ij23-20020a170902ab5700b001a04ebd15damr373019plb.66.1678653744449; 
 Sun, 12 Mar 2023 13:42:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090341c900b0019a593e45f1sm3160569ple.261.2023.03.12.13.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/13] dma-buf/dma-fence: Add dma_fence_init_noref()
Date: Sun, 12 Mar 2023 13:41:29 -0700
Message-Id: <20230312204150.1353517-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way to initialize a fence without touching the refcount.  This is
useful, for example, if the fence is embedded in a drm_sched_job.  In
this case the refcount will be initialized before the job is queued.
But the seqno of the hw_fence is not known until job_run().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence.c | 43 ++++++++++++++++++++++++++++---------
 include/linux/dma-fence.h   |  2 ++
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0de0482cd36e..3c55f946084c 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -929,28 +929,27 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 EXPORT_SYMBOL(dma_fence_describe);
 
 /**
- * dma_fence_init - Initialize a custom fence.
+ * dma_fence_init_noref - Initialize a custom fence without initializing refcount.
  * @fence: the fence to initialize
  * @ops: the dma_fence_ops for operations on this fence
  * @lock: the irqsafe spinlock to use for locking this fence
  * @context: the execution context this fence is run on
  * @seqno: a linear increasing sequence number for this context
  *
- * Initializes an allocated fence, the caller doesn't have to keep its
- * refcount after committing with this fence, but it will need to hold a
- * refcount again if &dma_fence_ops.enable_signaling gets called.
- *
- * context and seqno are used for easy comparison between fences, allowing
- * to check which fence is later by simply using dma_fence_later().
+ * Like &dma_fence_init but does not initialize the refcount.  Suitable
+ * for cases where the fence is embedded in another struct which has it's
+ * refcount initialized before the fence is initialized.  Such as embedding
+ * in a &drm_sched_job, where the job is created before knowing the seqno
+ * of the hw_fence.
  */
 void
-dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
-	       spinlock_t *lock, u64 context, u64 seqno)
+dma_fence_init_noref(struct dma_fence *fence, const struct dma_fence_ops *ops,
+		     spinlock_t *lock, u64 context, u64 seqno)
 {
 	BUG_ON(!lock);
 	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
+	BUG_ON(!kref_read(&fence->refcount));
 
-	kref_init(&fence->refcount);
 	fence->ops = ops;
 	INIT_LIST_HEAD(&fence->cb_list);
 	fence->lock = lock;
@@ -961,4 +960,28 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 
 	trace_dma_fence_init(fence);
 }
+EXPORT_SYMBOL(dma_fence_init_noref);
+
+/**
+ * dma_fence_init - Initialize a custom fence.
+ * @fence: the fence to initialize
+ * @ops: the dma_fence_ops for operations on this fence
+ * @lock: the irqsafe spinlock to use for locking this fence
+ * @context: the execution context this fence is run on
+ * @seqno: a linear increasing sequence number for this context
+ *
+ * Initializes an allocated fence, the caller doesn't have to keep its
+ * refcount after committing with this fence, but it will need to hold a
+ * refcount again if &dma_fence_ops.enable_signaling gets called.
+ *
+ * context and seqno are used for easy comparison between fences, allowing
+ * to check which fence is later by simply using dma_fence_later().
+ */
+void
+dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
+	       spinlock_t *lock, u64 context, u64 seqno)
+{
+	kref_init(&fence->refcount);
+	dma_fence_init_noref(fence, ops, lock, context, seqno);
+}
 EXPORT_SYMBOL(dma_fence_init);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..89d90a2b5f09 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -259,6 +259,8 @@ struct dma_fence_ops {
 				   char *str, int size);
 };
 
+void dma_fence_init_noref(struct dma_fence *fence, const struct dma_fence_ops *ops,
+			  spinlock_t *lock, u64 context, u64 seqno);
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		    spinlock_t *lock, u64 context, u64 seqno);
 
-- 
2.39.2

