Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D635120EC1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43146E5CE;
	Mon, 16 Dec 2019 16:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481136E5CE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:04:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGDYJce071612;
 Mon, 16 Dec 2019 07:34:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576503259;
 bh=+/oGZ+/f9SPMMplYl/8mVzzpf0nexWVjfKIgWDByfHA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=c5wBY5o390mSG8bdfaxNl3tO3vnXjEV7v6hw4eKT4ysFie17OWAym3v+jR9G2AAmz
 DrzKHrWrdfnWVhufuTioUjcgJ4Kz38DXsC+dQb4ePl+F8FUE66maIwZTp2L5d4DsxG
 Ylzhcbt10UFBBX+5yQdBQX/AesMzxIRQ8MAC2Y7s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGDYJ8h015426
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Dec 2019 07:34:19 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 07:34:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 07:34:18 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
 [128.247.22.53])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGDYILP089514;
 Mon, 16 Dec 2019 07:34:18 -0600
Received: from localhost ([10.250.79.55])
 by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBGDYHu29103; 
 Mon, 16 Dec 2019 07:34:17 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, John Stultz
 <john.stultz@linaro.org>
Subject: [PATCH 1/2] dma-buf: heaps: Use _IOCTL_ for userspace IOCTL identifier
Date: Mon, 16 Dec 2019 08:34:04 -0500
Message-ID: <20191216133405.1001-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216133405.1001-1-afd@ti.com>
References: <20191216133405.1001-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is more consistent with the DMA and DRM frameworks convention. This
patch is only a name change, no logic is changed.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/dma-buf/dma-heap.c                         | 4 ++--
 include/uapi/linux/dma-heap.h                      | 4 ++--
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 4f04d104ae61..a24721496114 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -107,7 +107,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 }
 
 unsigned int dma_heap_ioctl_cmds[] = {
-	DMA_HEAP_IOC_ALLOC,
+	DMA_HEAP_IOCTL_ALLOC,
 };
 
 static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
@@ -153,7 +153,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		memset(kdata + in_size, 0, ksize - in_size);
 
 	switch (kcmd) {
-	case DMA_HEAP_IOC_ALLOC:
+	case DMA_HEAP_IOCTL_ALLOC:
 		ret = dma_heap_ioctl_allocate(file, kdata);
 		break;
 	default:
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index 73e7f66c1cae..6f84fa08e074 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -42,12 +42,12 @@ struct dma_heap_allocation_data {
 #define DMA_HEAP_IOC_MAGIC		'H'
 
 /**
- * DOC: DMA_HEAP_IOC_ALLOC - allocate memory from pool
+ * DOC: DMA_HEAP_IOCTL_ALLOC - allocate memory from pool
  *
  * Takes a dma_heap_allocation_data struct and returns it with the fd field
  * populated with the dmabuf handle of the allocation.
  */
-#define DMA_HEAP_IOC_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
+#define DMA_HEAP_IOCTL_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
 				      struct dma_heap_allocation_data)
 
 #endif /* _UAPI_LINUX_DMABUF_POOL_H */
diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index 3e53ad331bdc..cd5e1f602ac9 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -116,7 +116,7 @@ static int dmabuf_heap_alloc_fdflags(int fd, size_t len, unsigned int fd_flags,
 	if (!dmabuf_fd)
 		return -EINVAL;
 
-	ret = ioctl(fd, DMA_HEAP_IOC_ALLOC, &data);
+	ret = ioctl(fd, DMA_HEAP_IOCTL_ALLOC, &data);
 	if (ret < 0)
 		return ret;
 	*dmabuf_fd = (int)data.fd;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
