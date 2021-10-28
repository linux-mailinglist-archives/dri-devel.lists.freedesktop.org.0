Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598D43DD4C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 10:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7436E936;
	Thu, 28 Oct 2021 08:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EE96E5BB;
 Thu, 28 Oct 2021 08:58:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso4258386wmc.1; 
 Thu, 28 Oct 2021 01:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8pRnJQmmB+/kCdjQaACOoqogylSvktqG3v7tsX861XU=;
 b=hQr+RlB7nQ0kBfkch66CVzLGjeTDfB3+Y0hgwSAS2sIF7Etfjcn1XcPfLlpIGUHMg2
 ypErUzIrTp2LgbVFx1p0RhBKHqX4iSF0rouLa5lDo9WLKNJu5AZk0uauZWo/LjxYVWAW
 aSMx3vpPwRqidL6Xl4o1ByaNIE8eaf8bv2KzlC0APlc21nIIu6d5wba1ZN3krvZY4MD1
 gggPyRk+vDHQ5Y+S265L1eTwGOQaVUykfdsVPiEXgwTGPROcAdj3Q3kpqW4RqfMEDxcq
 vt9x97Bck2Zw8CGbRYDnZp3YcQgWD0+At0VlfPOEj8Pjs6MGvRQUd0a3A+7SmC4qCIFU
 DPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8pRnJQmmB+/kCdjQaACOoqogylSvktqG3v7tsX861XU=;
 b=IMn1AiorXzJThs357Kw727fLOIg4u5ExtDzUeDB52H5cITFdQqmSEh9/TDxDEatD7b
 QGFpq82XmeIIcislsTGy4vVEUJcg1ZNrROdszJvMejTPiWR56Y+wF6kMqVxd8zdHHEYr
 ppPR7rU9kilQu5OkPFAnBQK2Jm05NBcOxSSOoy2SNqu0Os1QUmKMM27gCXyHH5hlS34Q
 fzZ7UbwtpfDhWgsxwY9xALFevtbr1kgDGo0xH0Hp0HDVsyXpJrgJxzKvu/vBx7KpoO2+
 bs6AZzukbfAEgqIsm6YdPUoI8BsXRJYWTbQ/g7AITX/Byvm4lkzBWT9+omkGHXZhvryd
 paog==
X-Gm-Message-State: AOAM53170Kjd2WTkg7SSRpeJPgHuKrOVSqz9kNM5JZSmNVOLcWMnM7ws
 syAmDsKCo4g361MK64QXMwp+VcIJeEQ=
X-Google-Smtp-Source: ABdhPJz8YhMDtgUIgGgUYWl+alCbM4WTONsbnjfCXo4Ut5lcjRZxATOVrz1OmZRT4kcVrUlDv3UamA==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr11110448wmj.107.1635411511382; 
 Thu, 28 Oct 2021 01:58:31 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k22sm2412143wrd.59.2021.10.28.01.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 01:58:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Cc: etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Subject: [PATCH 1/4] dma-buf: add dma_fence_describe and dma_resv_describe
Date: Thu, 28 Oct 2021 10:58:26 +0200
Message-Id: <20211028085829.1726-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Add functions to dump dma_fence and dma_resv objects into a seq_file and
use them for printing the debugfs informations.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/dma-buf/dma-buf.c   | 11 +----------
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++++++
 drivers/dma-buf/dma-resv.c  | 23 +++++++++++++++++++++++
 include/linux/dma-fence.h   |  1 +
 include/linux/dma-resv.h    |  1 +
 5 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 7b619998f03a..1d6f6c6a0b09 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1332,8 +1332,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	int count = 0, attach_count;
 	size_t size = 0;
 	int ret;
@@ -1361,14 +1359,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				file_inode(buf_obj->file)->i_ino,
 				buf_obj->name ?: "");
 
-		dma_resv_for_each_fence(&cursor, buf_obj->resv, true, fence) {
-			seq_printf(s, "\t%s fence: %s %s %ssignalled\n",
-				   dma_resv_iter_is_exclusive(&cursor) ?
-					"Exclusive" : "Shared",
-				   fence->ops->get_driver_name(fence),
-				   fence->ops->get_timeline_name(fence),
-				   dma_fence_is_signaled(fence) ? "" : "un");
-		}
+		dma_resv_describe(buf_obj->resv, s);
 
 		seq_puts(s, "\tAttached Devices:\n");
 		attach_count = 0;
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1e82ecd443fa..5175adf58644 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -907,6 +907,22 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 }
 EXPORT_SYMBOL(dma_fence_wait_any_timeout);
 
+/**
+ * dma_fence_describe - Dump fence describtion into seq_file
+ * @fence: the 6fence to describe
+ * @seq: the seq_file to put the textual description into
+ *
+ * Dump a textual description of the fence and it's state into the seq_file.
+ */
+void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
+{
+	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence), fence->seqno,
+		   dma_fence_is_signaled(fence) ? "" : "un");
+}
+EXPORT_SYMBOL(dma_fence_describe);
+
 /**
  * dma_fence_init - Initialize a custom fence.
  * @fence: the fence to initialize
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9eb2baa387d4..ff3c0558b3b8 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -38,6 +38,7 @@
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_notifier.h>
+#include <linux/seq_file.h>
 
 /**
  * DOC: Reservation Object Overview
@@ -666,6 +667,28 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
+/**
+ * dma_resv_describe - Dump description of the resv object into seq_file
+ * @obj: the reservation object
+ * @seq: the seq_file to dump the description into
+ *
+ * Dump a textual description of the fences inside an dma_resv object into the
+ * seq_file.
+ */
+void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+
+	dma_resv_for_each_fence(&cursor, obj, true, fence) {
+		seq_printf(seq, "\t%s fence:",
+			   dma_resv_iter_is_exclusive(&cursor) ?
+				"Exclusive" : "Shared");
+		dma_fence_describe(fence, seq);
+	}
+}
+EXPORT_SYMBOL_GPL(dma_resv_describe);
+
 #if IS_ENABLED(CONFIG_LOCKDEP)
 static int __init dma_resv_lockdep(void)
 {
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index a706b7bf51d7..1ea691753bd3 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -264,6 +264,7 @@ void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 
 void dma_fence_release(struct kref *kref);
 void dma_fence_free(struct dma_fence *fence);
+void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
 
 /**
  * dma_fence_put - decreases refcount of the fence
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index dbd235ab447f..09c6063b199a 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -490,5 +490,6 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
+void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
 
 #endif /* _LINUX_RESERVATION_H */
-- 
2.25.1

