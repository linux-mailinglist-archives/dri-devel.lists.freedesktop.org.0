Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3809D090F5
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 12:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D174810E8A4;
	Fri,  9 Jan 2026 11:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJMBWb0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5ED10E156
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 11:54:20 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7aab061e7cbso4309481b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 03:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767959660; x=1768564460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JauvZBqo6Cva8p0R8RkbxSWRYj4m+D5povLuy9EeYqI=;
 b=PJMBWb0rv/269OOvKuEt0mx1JIRck/fvT0EmtrGI7yrycIqcnMhxDHIFTKpsxbHSc5
 0fjXGTdVjZSnKTUJADXoiiTRw7VL4mLBdU7zoBDvK1ZFElf2RrneH12m8QYsB8OfT3V3
 B+o1I3tqmo2obCq3yXMWYtLicWcwdA48DsOITbBd+lhd5STFtTSq8ho8hfBYL9wvjj8S
 nj6CIHKMDj5W7zUI/cAUP+hX6b22O9vd3FAcSkwbY0oF3ebEEQyvQ5qVdqv6ESAVPWzC
 H+AagCpcQY1eGeRkPkbyWO9ZQUtRZ35ZVEBt5LWgPm6DxYmRmyxQyotY/hrVNGWkCx0y
 goBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767959660; x=1768564460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JauvZBqo6Cva8p0R8RkbxSWRYj4m+D5povLuy9EeYqI=;
 b=vePyeSjptFW7M8kECASh7rQTE9OFXbBcshXo7GiIbieFPZnK5XUD34ezEJKsE5JMH7
 5DpwyyA2a+vyfZaUds6SGb8j05qDusjzS03JMjjeIvW2lZxMu6li319OGd7QabmyWX8l
 m4jmgw0oTzdwLhTTeV68FSq7HG9V6kmLJJG1HLsYGPh4Y+P0DJkxZxbg94+PN2ZL6IQm
 Fr0zBn/Py8y+xmY5AWFenBHsb+5kvpS7uIlMCE+NpHRN/pcQXsJyTujBTpLH6rksqmzW
 uv9jDOts4gA5UQvsHod6wXEx6f1fOFYarL+QX2y6TPx2lkz15LQrujqobVJ85PxWp+A2
 ihnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCnKvQVOLpTQVsgZoIsrYYXPFd56A7OKnqo70higPrv9fxiJcx1tEf0ncKw2ioIJplZ49XtilOA9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwABBEUQ55+ri5zyoN3WYYWui5jg2AtaU5rXXgnBLQDs48IHUCw
 doMHhCRRgdu8VMZ4Aft/a6mcPtKAozazDUmrvjr6UQlTto6h+fpBxSvl
X-Gm-Gg: AY/fxX6qRsBzOj/HMxWdUzWpcQnudx5LMG5yoG2aDBFHAEjofDxOljIPzBC4ZfyxmI9
 /FVGQ+jmsi0xEhlP4Ho58qLCdKJR9evIatSGl/QYWAWVYgT6/MEZinkA30qXG3+2P0h1VPiEi8l
 sfRp/kRxjkxuYb9RrvWI5SE8hT4s1ptBvfi+bhX6MK7n5/8lp0hphnEL8OYRaP0C/W5JeHt18DF
 JIoG6J3XLWapg0SR4qgSLDT19Wm5jzV+75zx8HV/UN118cv3q3wXZa7zp9ZnArFwJDZqv07e8ey
 2xSVpHsJt7GhFlJR7GEn9TpvD6wodjIyYtwm3N0xU0zieVk/c9s4iQiasEL2mQyCVQmXwT6kwlb
 I0pbWa6JPf2M+zTQpZZe4sfoHDpMHjlkgBqBtYI+oZidVSXNEdTecmPWKlcgoVWAt3LRwZc8F79
 EL3ki51vqTLKe40okGE/1F
X-Google-Smtp-Source: AGHT+IGJsJDUNZxvJK6DcdFcbMt6f0ivnHHKsdAWaZ5McyHBHiarLs2CuBwbrEcuofVCQILi6kXTFw==
X-Received: by 2002:a05:6a00:4c0b:b0:7ae:fea:e928 with SMTP id
 d2e1a72fcca58-81b7de5d195mr8325201b3a.18.1767959660179; 
 Fri, 09 Jan 2026 03:54:20 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81dab89f2a5sm2757485b3a.56.2026.01.09.03.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 03:54:19 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, rostedt@goodmis.org,
 mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH v13] dma-buf: add some tracepoints to debug.
Date: Fri,  9 Jan 2026 19:54:11 +0800
Message-Id: <20260109115411.115270-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7e126504-1966-4c63-8db5-dfe57e206169@amd.com/>
References: <7e126504-1966-4c63-8db5-dfe57e206169@amd.com/>
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

Since we can only inspect dmabuf by iterating over process FDs or the
dmabuf_list, we need to add our own tracepoints to track its status in
real time in production.

For example:
   binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
   binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
   binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
     kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
    RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
    RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
    RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---

Changes since v12: https://lore.kernel.org/all/20251229031547.59272-1-gxxa03070307@gmail.com/
- list history changes

Changes since v11: https://lore.kernel.org/all/20251225121119.2194228-1-gxxa03070307@gmail.com/
- Lined up the backslashes nicely for the macro DMA_BUF_TRACE.
- Used DEFINE_EVENT_CONDITION() to move the condition branch into the tracepoint.

Changes since v10: https://lore.kernel.org/all/20251224013455.1649879-1-gxxa03070307@gmail.com/
- Always expose dmabuf->name_lock if lockdep is enabled.

Changes since v9: https://lore.kernel.org/all/20251223032749.1371913-1-gxxa03070307@gmail.com/
- Fixed some whitespace issues with the macro DMA_BUF_TRACE again.

Changes since v8: https://lore.kernel.org/all/20251218062853.819744-1-gxxa03070307@gmail.com/
- Expose dmabuf->name_lock when lockdep is enabled but trace event is not.

Changes since v7: https://lore.kernel.org/all/20251217105132.643300-1-gxxa03070307@gmail.com/
- Fixed some whitespace issues with the macro DMA_BUF_TRACE.

Changes since v6: https://lore.kernel.org/all/20251216063952.516364-1-gxxa03070307@gmail.com/
- Add a comment for the macro DMA_BUF_TRACE.

Changes since v5: https://lore.kernel.org/all/20251201112148.843572-1-gxxa03070307@gmail.com/
- Add the macro DMA_BUF_TRACE.
- Modify the commit message.

Changes since v4: https://lore.kernel.org/all/20251128085215.550100-1-gxxa03070307@gmail.com/
- Remove the tracepoints exporting.
- Remove the file refcount for the trace.
- Print the dev_name last.
- Add the parameter of whether dma_buf attachment is dynamic.

Changes since v3: https://lore.kernel.org/all/20251127004352.376307-1-gxxa03070307@gmail.com/
- Take the dmabuf->name_lock around the tracepoint call itself.
- Used DECLARE_EVENT_CLASS() and a DEFINE_EVENT().

Changes since v2: https://lore.kernel.org/all/20251125162949.220488-1-gxxa03070307@gmail.com/
- Add more explanation to the commit message.

 drivers/dma-buf/dma-buf.c      |  9 ++----
 include/trace/events/dma_buf.h | 50 ++++++++++++++++++----------------
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a4d8f2ff94e4..ac4238063ec1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -48,12 +48,10 @@
  */
 #define DMA_BUF_TRACE(FUNC, ...)					\
 	do {								\
-		if (FUNC##_enabled()) {					\
+		/* Always expose lock if lockdep is enabled */		\
+		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {	\
 			guard(spinlock)(&dmabuf->name_lock);		\
 			FUNC(__VA_ARGS__);				\
-		} else if (IS_ENABLED(CONFIG_LOCKDEP)) {		\
-			/* Expose this lock when lockdep is enabled */	\
-			guard(spinlock)(&dmabuf->name_lock);		\
 		}							\
 	} while (0)
 
@@ -806,8 +804,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 		return -EINVAL;
 
 	fd = FD_ADD(flags, dmabuf->file);
-	if (fd >= 0)
-		DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
 
 	return fd;
 }
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
index 35f8140095f4..3bb88d05bcc8 100644
--- a/include/trace/events/dma_buf.h
+++ b/include/trace/events/dma_buf.h
@@ -15,15 +15,15 @@ DECLARE_EVENT_CLASS(dma_buf,
 	TP_ARGS(dmabuf),
 
 	TP_STRUCT__entry(
-		__string(exp_name, dmabuf->exp_name)
-		__field(size_t, size)
-		__field(ino_t, ino)
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
 	),
 
 	TP_fast_assign(
 		__assign_str(exp_name);
-		__entry->size = dmabuf->size;
-		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
 	),
 
 	TP_printk("exp_name=%s size=%zu ino=%lu",
@@ -40,21 +40,21 @@ DECLARE_EVENT_CLASS(dma_buf_attach_dev,
 	TP_ARGS(dmabuf, attach, is_dynamic, dev),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name(dev))
-		__string(exp_name, dmabuf->exp_name)
-		__field(size_t, size)
-		__field(ino_t, ino)
-		__field(struct dma_buf_attachment *, attach)
-		__field(bool, is_dynamic)
+		__string(	dev_name,			dev_name(dev))
+		__string(	exp_name,			dmabuf->exp_name)
+		__field(	size_t,				size)
+		__field(	ino_t,				ino)
+		__field(	struct dma_buf_attachment *,	attach)
+		__field(	bool,				is_dynamic)
 	),
 
 	TP_fast_assign(
 		__assign_str(dev_name);
 		__assign_str(exp_name);
-		__entry->size = dmabuf->size;
-		__entry->ino = dmabuf->file->f_inode->i_ino;
-		__entry->is_dynamic = is_dynamic;
-		__entry->attach = attach;
+		__entry->size		= dmabuf->size;
+		__entry->ino		= dmabuf->file->f_inode->i_ino;
+		__entry->is_dynamic	= is_dynamic;
+		__entry->attach		= attach;
 	),
 
 	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
@@ -73,17 +73,17 @@ DECLARE_EVENT_CLASS(dma_buf_fd,
 	TP_ARGS(dmabuf, fd),
 
 	TP_STRUCT__entry(
-		__string(exp_name, dmabuf->exp_name)
-		__field(size_t, size)
-		__field(ino_t, ino)
-		__field(int, fd)
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
+		__field(	int,			fd)
 	),
 
 	TP_fast_assign(
 		__assign_str(exp_name);
-		__entry->size = dmabuf->size;
-		__entry->ino = dmabuf->file->f_inode->i_ino;
-		__entry->fd = fd;
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
+		__entry->fd	= fd;
 	),
 
 	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
@@ -137,11 +137,13 @@ DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
 	TP_ARGS(dmabuf, attach, is_dynamic, dev)
 );
 
-DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
+DEFINE_EVENT_CONDITION(dma_buf_fd, dma_buf_fd,
 
 	TP_PROTO(struct dma_buf *dmabuf, int fd),
 
-	TP_ARGS(dmabuf, fd)
+	TP_ARGS(dmabuf, fd),
+
+	TP_CONDITION(fd >= 0)
 );
 
 DEFINE_EVENT(dma_buf_fd, dma_buf_get,
-- 
2.34.1

