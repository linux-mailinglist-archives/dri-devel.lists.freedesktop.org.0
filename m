Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689B3653F8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF5889DB8;
	Tue, 20 Apr 2021 08:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPTOSEGREL01.sonyericsson.com (jptosegrel01.sonyericsson.com
 [124.215.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78D989DB8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:22:46 +0000 (UTC)
From: Peter Enderborg <peter.enderborg@sony.com>
To: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, Muchun Song <songmuchun@bytedance.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>, Michal
 Hocko <mhocko@suse.com>, NeilBrown <neilb@suse.de>, Sami Tolvanen
 <samitolvanen@google.com>, Mike Rapoport <rppt@kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Matthew Wilcox <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees
 Cook <keescook@chromium.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Alexey Gladkov <gladkov.alexey@gmail.com>, Feng
 Tang <feng.tang@intel.com>, <linux-doc@vger.kernel.org>
Subject: [PATCH 1/2 V6] dma-buf: Add DmaBufTotal counter in meminfo
Date: Tue, 20 Apr 2021 10:22:19 +0200
Message-ID: <20210420082220.7402-2-peter.enderborg@sony.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210420082220.7402-1-peter.enderborg@sony.com>
References: <20210420082220.7402-1-peter.enderborg@sony.com>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DLnxHBFb c=1 sm=1 tr=0
 a=fZcToFWbXLKijqHhjJ02CA==:117 a=3YhXtTcJ-WEA:10 a=z6gsHLkEAAAA:8
 a=fP8K2EeM0gxrUVMbi_0A:9 a=d-OLMTCWyvARjPbQ-enb:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-SEG-SpamProfiler-Score: 0
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
Cc: Peter Enderborg <peter.enderborg@sony.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a total used dma-buf memory. Details
can be found in debugfs, however it is not for everyone
and not always available. dma-buf are indirect allocated by
userspace. So with this value we can monitor and detect
userspace applications that have problems. Typical usage
is to see that system does not do to much pre-allocations,
finding memory leaks in userspace, such as not all clients
close down the reference to the buffer.

Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
---
 Documentation/filesystems/proc.rst |  5 +++++
 drivers/dma-buf/dma-buf.c          | 12 ++++++++++++
 fs/proc/meminfo.c                  |  5 ++++-
 include/linux/dma-buf.h            |  1 +
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 48fbfc336ebf..a85df9490810 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -973,6 +973,7 @@ varies by architecture and compile options.  The following is from a
     AnonHugePages:   49152 kB
     ShmemHugePages:      0 kB
     ShmemPmdMapped:      0 kB
+    DmaBufTotal          0 kB
 
 MemTotal
               Total usable RAM (i.e. physical RAM minus a few reserved
@@ -1102,6 +1103,10 @@ VmallocChunk
 Percpu
               Memory allocated to the percpu allocator used to back percpu
               allocations. This stat excludes the cost of metadata.
+DmaBufTotal
+              Memory allocated by dma-buf driver.What memory is used
+	      is  arbitrary. (It might be kernel, local or even hardware vram).
+	      Details on buffers are found in debugfs if enabled.
 
 vmallocinfo
 ~~~~~~~~~~~
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383e..4dc37cd4293b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -37,6 +37,7 @@ struct dma_buf_list {
 };
 
 static struct dma_buf_list db_list;
+static atomic_long_t dma_buf_global_allocated;
 
 static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
@@ -79,6 +80,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
 		dma_resv_fini(dmabuf->resv);
 
+	atomic_long_sub(dmabuf->size, &dma_buf_global_allocated);
 	module_put(dmabuf->owner);
 	kfree(dmabuf->name);
 	kfree(dmabuf);
@@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	mutex_lock(&db_list.lock);
 	list_add(&dmabuf->list_node, &db_list.head);
 	mutex_unlock(&db_list.lock);
+	atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
 
 	return dmabuf;
 
@@ -1346,6 +1349,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
+/**
+ * dma_buf_allocated_pages - Return the used nr of pages
+ * allocated for dma-buf
+ */
+long dma_buf_allocated_pages(void)
+{
+	return atomic_long_read(&dma_buf_global_allocated) >> PAGE_SHIFT;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
index 6fa761c9cc78..ccc7c40c8db7 100644
--- a/fs/proc/meminfo.c
+++ b/fs/proc/meminfo.c
@@ -16,6 +16,7 @@
 #ifdef CONFIG_CMA
 #include <linux/cma.h>
 #endif
+#include <linux/dma-buf.h>
 #include <asm/page.h>
 #include "internal.h"
 
@@ -145,7 +146,9 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
 	show_val_kb(m, "CmaFree:        ",
 		    global_zone_page_state(NR_FREE_CMA_PAGES));
 #endif
-
+#ifdef CONFIG_DMA_SHARED_BUFFER
+	show_val_kb(m, "DmaBufTotal:    ", dma_buf_allocated_pages());
+#endif
 	hugetlb_report_meminfo(m);
 
 	arch_report_meminfo(m);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..5b05816bd2cd 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
+long dma_buf_allocated_pages(void);
 #endif /* __DMA_BUF_H__ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
