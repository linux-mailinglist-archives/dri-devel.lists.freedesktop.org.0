Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144ABB40979
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4809110E7CA;
	Tue,  2 Sep 2025 15:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EAhWgBaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD5D10E7CA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:46:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3d965477dc0so951955f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828016; x=1757432816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90kZ9DvIdtL4dz9/qc/WVjEQ+mFVkPoHnP8T9TIhe7A=;
 b=EAhWgBaAuRbS0VCa9IjyfbncgrsDZUgprwQTXRFHye/hUbEe4REQ+h3RcO3K/w0ywV
 7gU5T9KhtYNxXVJYhlV/+Qnx8sJXW2AmYFkHkiFAgvdyDUlHm5nKZJKfEpG13/qo+U5L
 V7XzJ/GmyztkgQ+kjPu+su1F7TD8dPDTYc+CMVWSUaqqZSXgYdApHxhswb0TCdNIFskw
 bRMY6NCHL4JU1Tqtb+0a0UfjGt8LKz69yA9/CPPPiSbA87bYSE8eaONI5XCPcPe6/jaw
 3cyXrfK5DHFHvxIvarq5NgWdZWqcdb+ao2+6y00wl+Vq3gzFUrik6SRtbmXZCysdUa3g
 vKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828016; x=1757432816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=90kZ9DvIdtL4dz9/qc/WVjEQ+mFVkPoHnP8T9TIhe7A=;
 b=TGz/0j33i0HvhyvfLQtcwYiVdNHjddfFYp/mFcCvvVQrG+xylafHIrA1xKjq1BG4db
 K6YL/EC+NAGjydz/+oLAFIn/cLqhXMQ7n977Ada7KGBthzacD3HwL9rguluNuShHbBj3
 Duy4wVuF2nk4lzCVBhNYQbSkd7sT/VLwXr5W9ydd8iSDW3kmzZl+wlIVSCcjPVLJ4iuy
 uPdLjOapdiDRDYTDgKIDKJ8BdN81ppP+8qEdoMTGxAhl2XKL7AxZniDS9eJjTZmD4g9x
 iRngtPGMcf0h6lO0NvdfbnunxY9BAh2ENqOeoG7cssjZPJpIXV64rRnF1w/ObxTorhNz
 4e8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf15/BaIGbXh9zSCdHejpbxOIvbZSiZWj2B228Q83EUbmnnyI6rzMmEoH4ZPxk+dTfnzMJwrh3Uz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6RU9ClSK1XxlXBKY9W1lwRAhe+66X5/5O0MgxZNnwfcPVa/Kz
 Eg3ZY5pzkSb4dLUntBP0OmrNIU+7i48XJHVntkOWv4LxSWf0AQ2D5BKS
X-Gm-Gg: ASbGncsFyrDOXTuMuVkm9nAH9aRT2FFR4LiIQqdA0c2f82j1XGBW5NIYuxIqauLRpkn
 01a1hdEu1jJCtyzDw7OoZqqTEEISgRaFTH3iARd1xf7wza1UX6BpjLEF1Xb1HG14UqKW8tce9cQ
 OaCccPfUzmyOZsFXz+xWIE+8mVwCyEI1xxux4L8Bf+tT/+BJLRQna4QfyrbjU7/KqnsYWzYSaYw
 9HIz0zy8k3l1t09QiYq6HYnZH/F1KfHiG2JFLON6x+UNjEaLEcnifePEUm9fri3+k9HjC+G+kDl
 0DYKJDChMPoC/4/8T99AhuqdaYDAUuacVZi8FnK+H4iuOOmg9pSUfemGndX9R7OTB+vB7Va0ebj
 fmJ8VYMYVKn0UB3Wd1Sjc9IPizjUVvrr4wlNDqHx2tRVOIpmDihIL0hxOMeTTVFVXyQz+253Lkt
 ytw3qt40pwQ/Iq7Of4LGKdzIsg
X-Google-Smtp-Source: AGHT+IGEFJ9YebDpQzKgxpYDB/nK1gBHr48wi1ywTJ9aVMyk17MTQGdJjc1ZEGueQXcFUAhwJrBA9A==
X-Received: by 2002:a05:6000:2f86:b0:3d0:64c1:1a39 with SMTP id
 ffacd0b85a97d-3d1dea894eamr9700405f8f.35.1756828016192; 
 Tue, 02 Sep 2025 08:46:56 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d95df59e50sm4845738f8f.23.2025.09.02.08.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:46:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
Subject: [PATCH 4/9] dma-buf: heaps: Add debugfs support
Date: Tue,  2 Sep 2025 17:46:24 +0200
Message-ID: <20250902154630.4032984-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Add a callback to struct dma_heap_ops that heap providers can implement
to show information about the state of the heap in debugfs. A top-level
directory named "dma_heap" is created in debugfs and individual files
will be named after the heaps.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/dma-buf/dma-heap.c | 56 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-heap.h   |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index cdddf0e24dce..f062f88365a5 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cdev.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
@@ -217,6 +218,46 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 }
 EXPORT_SYMBOL(dma_heap_get_name);
 
+#ifdef CONFIG_DEBUG_FS
+static int dma_heap_debug_show(struct seq_file *s, void *unused)
+{
+	struct dma_heap *heap = s->private;
+	int err = 0;
+
+	if (heap->ops && heap->ops->show)
+		err = heap->ops->show(s, heap);
+
+	return err;
+}
+DEFINE_SHOW_ATTRIBUTE(dma_heap_debug);
+
+static struct dentry *dma_heap_debugfs_dir;
+
+static void dma_heap_init_debugfs(void)
+{
+	struct dentry *dir;
+
+	dir = debugfs_create_dir("dma_heap", NULL);
+	if (IS_ERR(dir))
+		return;
+
+	dma_heap_debugfs_dir = dir;
+}
+
+static void dma_heap_exit_debugfs(void)
+{
+	debugfs_remove_recursive(dma_heap_debugfs_dir);
+}
+#else
+static void dma_heap_init_debugfs(void)
+{
+}
+
+static void dma_heap_exit_debugfs(void)
+{
+}
+#endif
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info: information needed to register this heap
@@ -291,6 +332,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 
 	/* Add heap to the list */
 	list_add(&heap->list, &heap_list);
+
+#ifdef CONFIG_DEBUG_FS
+	if (heap->ops && heap->ops->show)
+		debugfs_create_file(heap->name, 0444, dma_heap_debugfs_dir,
+				    heap, &dma_heap_debug_fops);
+#endif
+
 	mutex_unlock(&heap_list_lock);
 
 	return heap;
@@ -327,6 +375,14 @@ static int dma_heap_init(void)
 	}
 	dma_heap_class->devnode = dma_heap_devnode;
 
+	dma_heap_init_debugfs();
+
 	return 0;
 }
 subsys_initcall(dma_heap_init);
+
+static void __exit dma_heap_exit(void)
+{
+	dma_heap_exit_debugfs();
+}
+__exitcall(dma_heap_exit);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 27d15f60950a..065f537177af 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 
 struct dma_heap;
+struct seq_file;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
@@ -24,6 +25,7 @@ struct dma_heap_ops {
 				    unsigned long len,
 				    u32 fd_flags,
 				    u64 heap_flags);
+	int (*show)(struct seq_file *s, struct dma_heap *heap);
 };
 
 /**
-- 
2.50.0

