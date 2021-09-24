Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E6416CA8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 09:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C53A6EDF9;
	Fri, 24 Sep 2021 07:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCB26EDF9;
 Fri, 24 Sep 2021 07:18:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i23so24431940wrb.2;
 Fri, 24 Sep 2021 00:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CV/9mi9uteLuWVq9Kj9QRPmNqPHDt+M2/XdEbBVbpko=;
 b=XSlFWfM60+Q0dxzzRauhgrG8cg1+/vgxeSpdmBrnfYoaLQ1muwXC9j+73Gp0aodDNI
 KPQo6BkE52aw0+d7Tc8Sh+RPdJCtvB/ts10tU+CjDxqt9sjd74a7s+40+J0+D4pDxyky
 kjx3FPqgnJ2fyInrN14PA5oZviatMPu2alrtQ2uj9qelfowm9xili2XqUSFxJT9Nam/W
 TiJJ+JQrbxkRhlX6QOqt5LtdWBa5ckrCBiSLtKkfJzx5ljGZC+YRKo6YAOxqgGDuenAL
 4Dffn+qQY/yx4TFIMpDOgfB1cIlcpPmpoWnRabg9r+gCq5rUgWkY7sm/Vv8kgTwNXtd1
 ZwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CV/9mi9uteLuWVq9Kj9QRPmNqPHDt+M2/XdEbBVbpko=;
 b=E/OIvu8u/q4lh+vdKAz/8NNi34i/S4OpAY8Tfal3Kg77zirUih1nwkJcG/T4HcqKll
 I4pOFGezy68YAar3Rycwp48WGE/E0UBRsmo/bClmZ7To43z7VVMwlLiRaFSUYHlatShi
 EJY1zV4KAmh7kvnXQbK10LxzTktf6180vcvx84Yh9lXQjSN8/LyyRQ+BwNxvCxY+5Xyp
 mGz5oh8xHfdM1wF85b14M0gT6ifMUWdDV4diUvGMF34mWmPpnhsS5fk9kaWUegvFTOBR
 zzmgVrlMyGonmrocjr5LR7FK2EU/kM76uJzn2ZL/LY/rCDkEL7L7MWq/dCGPFV36k3Tu
 8isw==
X-Gm-Message-State: AOAM531rFa5zUUNnq2xvTjnJSeO7wbViyqAtz6YflecCNUh/69uC4daf
 EBkdKv0pffa0SalJ8xQirvso/Xj6eqM=
X-Google-Smtp-Source: ABdhPJyG0gAB4wSfjtppxcJR/M6I6ToAkPgteRQM02KJpVdcOahsN3BWZmPXZWv0nwE4d/F8d/N8zA==
X-Received: by 2002:adf:e88d:: with SMTP id d13mr9451231wrm.91.1632467881845; 
 Fri, 24 Sep 2021 00:18:01 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 b7sm9200070wrm.9.2021.09.24.00.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 00:18:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 linux+etnaviv@armlinux.org.uk, robdclark@gmail.com, sean@poorly.run
Subject: [PATCH 1/4] dma-buf: add dma_fence_describe and dma_resv_describe
Date: Fri, 24 Sep 2021 09:17:56 +0200
Message-Id: <20210924071759.22659-1-christian.koenig@amd.com>
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
---
 drivers/dma-buf/dma-buf.c   | 11 +----------
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++++++
 drivers/dma-buf/dma-resv.c  | 23 +++++++++++++++++++++++
 include/linux/dma-fence.h   |  1 +
 include/linux/dma-resv.h    |  1 +
 5 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d35c71743ccb..4975c9289b02 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1368,8 +1368,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	int count = 0, attach_count;
 	size_t size = 0;
 	int ret;
@@ -1397,14 +1395,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
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
index 266ec9e3caef..6bb25d53e702 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -38,6 +38,7 @@
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_notifier.h>
+#include <linux/seq_file.h>
 
 /**
  * DOC: Reservation Object Overview
@@ -654,6 +655,28 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
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
index d4b4cd43f0f1..49c0152073fd 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -486,5 +486,6 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
+void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
 
 #endif /* _LINUX_RESERVATION_H */
-- 
2.25.1

