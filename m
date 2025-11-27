Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E84C8C72A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 01:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927D010E0AC;
	Thu, 27 Nov 2025 00:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MwH/Xmo6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA9B10E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 00:44:01 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7a9cdf62d31so331094b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764204241; x=1764809041; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X7D/SOi2ecN39BhKBlvFMFvS97PTD1c0CHuxKvuCC8A=;
 b=MwH/Xmo6jDkkGKMAENa9zGgb4r9WPM4s8iil2PfA5RzhIVu+NJfmk/KmPbIy0u4+/R
 tVG7K+3XH04ldtnIgNe4Rwu/5veEobaKGBZ1SjoHUQqcewJpAnoj7fCEnS1FN12quhZw
 r4xuFykpzMNqmO3lLwugk+Uguaf4QW8KMVTSiot69V6A2hX4WZ9l69j1hnbkl5sErJvI
 rvZMB1N1qMI1XCFK3Wq2m3otDLzWJVKhP0R1/GtJaCUeYs1OUPNyuUCPb9av2V9Da3dU
 nWC7TkKRaKc2iHVv6waRyXgJ9u8DE/ErHJEhGGFpDFgZ3fl+YglWBi4TWPQTy9TYWaoo
 RSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764204241; x=1764809041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7D/SOi2ecN39BhKBlvFMFvS97PTD1c0CHuxKvuCC8A=;
 b=ImIQDCtdeghmoX0UPvos9uERn6FN3eSbV06xaUm/4JjMAIpljOFBezT3Jm55wm5fsX
 VD7tanPL8/nQZKI6R6nLAw1MX/QWfAlX8oj9AfCT8ycbP2uY95hiwOXfdfOKzbBfdbyp
 P2EPN41nIBZf4i2lBNXBWt0J7UiJr3wRsItOZRM3iV6KuCmPQxVN9wMCEzbTu5aN3fci
 D2tFPp43WzXrpCiW38ZU+3qlDw0AdVtZtOci5sYO2nGgX6IuyFEO+0TwgeR/SCD6tFUa
 jtXrRWs9C4K5c41PLhLxqm1j2xbXQ9CxREtNhC1pNa/PUE1GbAabfpwUHENb2ddM6fll
 QqKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2+IXVZgOWHS6+UwF1TC34DhX0v4pNduqTDFKaYnSgZNKG6SIXAIwxHzbXE3T5vtpG5TF7Zs+DfJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2FjMkQB5gnmZxKlH1EMaxgUKmzV7hzvqNt7Gb0s1ltYD3ktfN
 QCCidnHO2J5vbjQCsTk9BxguE3T8DhhCDRhn27aBMy9soSNubZiVtO+p
X-Gm-Gg: ASbGncskvNPN8V0VQBrG01lTZO97jyCKSBMAnlnEpPq7sI56L2ztxMDXJWnWxLzTZfo
 pxI2qFG1BbPlTlmMq/Oweo3gnWCfoXFwddxb+rc34XSnJfMIWTTnJCCwQvcyax9Pso7TzEkuPFl
 y+jcQxT7L1qzCtphdKy0rDYo743Me0Iri1y4InrGK1cLDxlvQwzxc4pFXkQPfwiJUZly06W/t14
 m+sW8kSHgNpnrjJ/PajXugSNCpi+i6O7NsISVSqRkBqAPuU3NC9tyxSRIqLgJtnx/pMGQb/OLUW
 EX8HQXMDly4UuqfzCOQsjeQbfNrjnE/UDCvsGlDUrbktpCVPLXAnsmdV9ibAUA+Bm5+3J8sXhnp
 fKutQnEqv6ryqL8pEOqad7ZOswP52Tud2diV7MQlMqywDPbCjcVZrVPtAfJstJp3YCvNGQpGZd1
 BkOPvPINfxGuIvvVNQiLtu+Ehs1sXmFas=
X-Google-Smtp-Source: AGHT+IF5sxqeF7/QZTdBnTq4C94IH3X+/gRFD/p3Uasr8vrMeNSwp8x1kirv9w3cIWg+fZmvWcZx3g==
X-Received: by 2002:a05:6a21:3392:b0:35d:8881:e6ba with SMTP id
 adf61e73a8af0-3614ee3889dmr25218508637.49.1764204240986; 
 Wed, 26 Nov 2025 16:44:00 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-be508bfd8ffsm23902a12.17.2025.11.26.16.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 16:44:00 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, rostedt@goodmis.org,
 mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH v3] dma-buf: add some tracepoints to debug.
Date: Thu, 27 Nov 2025 08:43:52 +0800
Message-Id: <20251127004352.376307-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: gaoxiang17 <gaoxiang17@xiaomi.com>

I want to track the status of dmabuf in real time in the production environment.
But now we can only check it by traversing the fd in the process or dmabuf_list.

For example:
   binder:2962_2-2962    [005] ...1.   208.453940: dma_buf_export: exp_name=qcom,system name=(null) size=28672 ino=2580 f_refcnt=2
   binder:2962_2-2962    [005] ...1.   208.453943: dma_buf_fd: exp_name=qcom,system name=(null) size=28672 ino=2580 fd=9 f_refcnt=2
   binder:2962_2-2962    [005] ...1.   208.453977: dma_buf_mmap_internal: exp_name=qcom,system name=qcom,system size=28672 ino=2580 f_refcnt=4
     kworker/5:2-194     [005] ...1.   208.460580: dma_buf_put: exp_name=qcom,system name=ab pid [8176] size=28672 ino=2580 f_refcnt=3
    RenderThread-11305   [007] ...1.   208.599094: dma_buf_get: exp_name=qcom,system name=ab pid [8176] size=217088 ino=2579 fd=1114 f_refcnt=7
    RenderThread-11305   [007] ...1.   208.599098: dma_buf_attach: dev_name=kgsl-3d0 exp_name=qcom,system name=ab pid [8176] size=217088 ino=2579 f_refcnt=7
           <...>-14      [001] ...1.   208.726359: dma_buf_detach: dev_name=kgsl-3d0 exp_name=qcom,system name=ab pid [3317] size=217088 ino=2581 f_refcnt=3

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  57 ++++++++++-
 include/trace/events/dma_buf.h | 166 +++++++++++++++++++++++++++++++++
 2 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..7cef816ddcac 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,18 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_export);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_mmap_internal);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_mmap);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_put);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_attach);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_detach);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_fd);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_get);
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +232,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	if (trace_dma_buf_mmap_internal_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_mmap_internal(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +762,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	if (trace_dma_buf_export_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_export(dmabuf);
+	}
+
 	return dmabuf;
 
 err_dmabuf:
@@ -779,6 +801,11 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	if (trace_dma_buf_fd_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_fd(dmabuf, fd);
+	}
+
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
@@ -794,6 +821,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -805,7 +833,14 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+
+	if (trace_dma_buf_get_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_get(dmabuf, fd);
+	}
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
 
@@ -825,6 +860,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	if (trace_dma_buf_put_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_put(dmabuf);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -998,6 +1038,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev)
 {
+	if (trace_dma_buf_attach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_attach(dmabuf, dev);
+	}
+
 	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
@@ -1023,6 +1068,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	if (trace_dma_buf_detach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_detach(dmabuf, attach->dev);
+	}
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1488,6 +1538,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	if (trace_dma_buf_mmap_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_mmap(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..fe9da89bacd0
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dma_buf
+
+#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DMA_BUF_H
+
+#include <linux/dma-buf.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(dma_buf,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf),
+
+	TP_STRUCT__entry(
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+DECLARE_EVENT_CLASS(dma_buf_attach_dev,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
+
+	TP_ARGS(dmabuf, dev),
+
+	TP_STRUCT__entry(
+		__string(dname, dev_name(dev))
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(dname);
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(dname),
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+DECLARE_EVENT_CLASS(dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd),
+
+	TP_STRUCT__entry(
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(int, fd)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->fd = fd;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd,
+		  __entry->f_refcnt)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_export,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_mmap_internal,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_mmap,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_put,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_attach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
+
+	TP_ARGS(dmabuf, dev)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
+
+	TP_ARGS(dmabuf, dev)
+);
+
+DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd)
+);
+
+DEFINE_EVENT(dma_buf_fd, dma_buf_get,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd)
+);
+
+#endif /* _TRACE_DMA_BUF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1

