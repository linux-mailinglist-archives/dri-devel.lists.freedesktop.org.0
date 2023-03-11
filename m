Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29536B5F0D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 18:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E603F10E2AD;
	Sat, 11 Mar 2023 17:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8169110E29C;
 Sat, 11 Mar 2023 17:35:21 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so13000605pjg.4; 
 Sat, 11 Mar 2023 09:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678556121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hNSHVjc/0wTeCW3nY6/+a9GNb2nn01SoihN24q763w=;
 b=qozX8RZWE3nHsqGuYQWSGXKqdwuAcYURpfSiPFM9IP29zTKQOtipy8O/GmxSMJd7GU
 G2eiwcoB+mZyXyLDDUXpvQ7FntLF34u0AGf6oVPRNvrgFPSQwnLthOpkXclgCkzIqykt
 XsFgRCjAXEqj4EvvpW6GGf+KBFrVNZHFygWILrctRWcxZJnKTE9DyEZcwP1YvleOa+DC
 2VgJC3j67jilPpeIrAebn3TD7PpNA+M808wXx+2MqDd0zqNtlM6oAtz198FTC6Q43b3b
 YUVGwybEQz8Kyf3aPaizKZdRKVASFecfZMRWiPpeNxvucRWy6vbAyz/rshPX/NcgukYy
 vGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hNSHVjc/0wTeCW3nY6/+a9GNb2nn01SoihN24q763w=;
 b=3f67cznu7R2/9xxr9ybJDWq9sJK6mo88sr/AZhPgfl+95jyO5gCzIUfO0OlU9TRcy+
 /6bbGU62hI+XmiDJ55HI+kWzKw6mdoca53EZI16+Rofb+NKac6/Ft+P/bBn+uTP9Ldb/
 +Er6NvBWj8oyjohaonpg2nqYXusP70tp2YlK4CLe1pELX/rsUHkUNOqmUs0DzDhcESXd
 X/YF97IS+CGxXRkr3sImcFDlRndmfS6HoFfk1MvUBcmzzQJfCdQxhgeyXggVuRiq92oU
 UPnlzpwR/uUYKNGEqcyHNC+iYi9SXuRtxnIutILB7uRmki9aq5Mg6YnsaGnU6B9JXixk
 PrNA==
X-Gm-Message-State: AO0yUKW473NYGRqRfQE2H7NYXcSAMMh4MUAqvxswIfpOkJlDL/tte1vB
 Ey8ymWUaWw3ZcDwIykRrD4DaE3Gn6s0=
X-Google-Smtp-Source: AK7set/92Kp+D6kfQAUn3G1hZMxs+D8jdl0o6Nhu2rBS+JMWAaAnTBNrnC1jHmBus8UctLlXZ2k6Xw==
X-Received: by 2002:a05:6a20:1589:b0:cc:3f87:a80c with SMTP id
 h9-20020a056a20158900b000cc3f87a80cmr33316270pzj.3.1678556120656; 
 Sat, 11 Mar 2023 09:35:20 -0800 (PST)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 d26-20020aa7815a000000b005d72e54a7e1sm1702285pfn.215.2023.03.11.09.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 09:35:20 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dma-buf/dma-fence: Add dma_fence_init_noref()
Date: Sat, 11 Mar 2023 09:35:11 -0800
Message-Id: <20230311173513.1080397-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311173513.1080397-1-robdclark@gmail.com>
References: <20230311173513.1080397-1-robdclark@gmail.com>
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
 Gustavo Padovan <gustavo@padovan.org>, freedreno@lists.freedesktop.org,
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
index 74e36f6d05b0..97c05a465cb4 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -989,28 +989,27 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
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
@@ -1021,4 +1020,28 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 
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
index d54b595a0fe0..f617c78a2e0a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -279,6 +279,8 @@ struct dma_fence_ops {
 	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
 };
 
+void dma_fence_init_noref(struct dma_fence *fence, const struct dma_fence_ops *ops,
+			  spinlock_t *lock, u64 context, u64 seqno);
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		    spinlock_t *lock, u64 context, u64 seqno);
 
-- 
2.39.2

