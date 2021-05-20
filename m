Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C3738B673
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9B26F4D1;
	Thu, 20 May 2021 19:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010F66F4E3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:00:19 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id m124so12486976pgm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UThv679NozXWJshwHYjkuIEU/sPIWa9HDECkhUEO01c=;
 b=QxntvnLkRFR11eQx9GemueGyjuPUUiFDKHRo99/0GB3eu2X2k49jXNboB9nsqr5QZh
 /iYEgYHzm31bKPQB/VbPQHOc70is1bHmPU537gY/lOFsZZ3hrSTqE5UjIeszlVvhJSD9
 kp2dKmRhl8EQ7BF7J/8SFKY2VpmKyvifa+wXR/lgd0WxkPMHxUBSBew2pkzZVxF1JL5t
 VAqupaeNrooY+4vl1iSlcJUgVIKTYYnxfWjP/qfXlIUyYO32yZypAvwAdVUsNyM3mSXt
 mJYU11vraIRC3AqpfZs3G4fsYkR2W2RT7zZupzufjlpQXisRAqVw3L40DbqRcRMBggKX
 nOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UThv679NozXWJshwHYjkuIEU/sPIWa9HDECkhUEO01c=;
 b=XDxMvpSbMiH+onFBdVvKRczGVcSBArq/6kaZvcwXyHzydrRIbdfHkbS6vK8W0SlSHV
 UvmdruzgFdS0MK/8ROqaENlrsIeR/kIp25EmjjEIYOUX6sCObialrhOlmchy5v3kY6L7
 Q2wGxrBQSUXmzqfk9qaIv0EJ79LeaOJ9YK9i1gxmaRfjrqypkz+8nHF9OjmdJLxCHlfN
 txdwrFDQHpre8YLDaYMjNRgyHtK8BwPRRBy9TpVbqBpGLaK+rpfnvvfiO9d7INlJt6xy
 mZOsHxxKWfUusYqMKKCWDOXPfznQak0v+bPo95n6cj2bZ886myTKLdxmDtEH34rW6Y3Z
 xm1A==
X-Gm-Message-State: AOAM532DW4ShpPzsl8heLEtsJ9N6zc1nnzrtoodFsIsurvr2YzsBJMUW
 zoH5oiAy0Sv1MahKzIIbzvTIodZMHpdGxw==
X-Google-Smtp-Source: ABdhPJziiEfqHYjSyi3HBZ1DsBQM0ntbrWiyMj1QLUBX26FrLJaboZovD4/kFtiLr3f+YC3C7foe5g==
X-Received: by 2002:aa7:8809:0:b029:2de:3b94:487e with SMTP id
 c9-20020aa788090000b02902de3b94487emr5806927pfo.33.1621537218525; 
 Thu, 20 May 2021 12:00:18 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id v2sm2455072pfm.134.2021.05.20.12.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:00:17 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] dma-buf: Add an API for exporting sync files (v9)
Date: Thu, 20 May 2021 14:00:06 -0500
Message-Id: <20210520190007.534046-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190007.534046-1-jason@jlekstrand.net>
References: <20210520190007.534046-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modern userspace APIs like Vulkan are built on an explicit
synchronization model.  This doesn't always play nicely with the
implicit synchronization used in the kernel and assumed by X11 and
Wayland.  The client -> compositor half of the synchronization isn't too
bad, at least on intel, because we can control whether or not i915
synchronizes on the buffer and whether or not it's considered written.

The harder part is the compositor -> client synchronization when we get
the buffer back from the compositor.  We're required to be able to
provide the client with a VkSemaphore and VkFence representing the point
in time where the window system (compositor and/or display) finished
using the buffer.  With current APIs, it's very hard to do this in such
a way that we don't get confused by the Vulkan driver's access of the
buffer.  In particular, once we tell the kernel that we're rendering to
the buffer again, any CPU waits on the buffer or GPU dependencies will
wait on some of the client rendering and not just the compositor.

This new IOCTL solves this problem by allowing us to get a snapshot of
the implicit synchronization state of a given dma-buf in the form of a
sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
instead of CPU waiting directly, it encapsulates the wait operation, at
the current moment in time, in a sync_file so we can check/wait on it
later.  As long as the Vulkan driver does the sync_file export from the
dma-buf before we re-introduce it for rendering, it will only contain
fences from the compositor or display.  This allows to accurately turn
it into a VkFence or VkSemaphore without any over- synchronization.

v2 (Jason Ekstrand):
 - Use a wrapper dma_fence_array of all fences including the new one
   when importing an exclusive fence.

v3 (Jason Ekstrand):
 - Lock around setting shared fences as well as exclusive
 - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
 - Initialize ret to 0 in dma_buf_wait_sync_file

v4 (Jason Ekstrand):
 - Use the new dma_resv_get_singleton helper

v5 (Jason Ekstrand):
 - Rename the IOCTLs to import/export rather than wait/signal
 - Drop the WRITE flag and always get/set the exclusive fence

v6 (Jason Ekstrand):
 - Drop the sync_file import as it was all-around sketchy and not nearly
   as useful as import.
 - Re-introduce READ/WRITE flag support for export
 - Rework the commit message

v7 (Jason Ekstrand):
 - Require at least one sync flag
 - Fix a refcounting bug: dma_resv_get_excl() doesn't take a reference
 - Use _rcu helpers since we're accessing the dma_resv read-only

v8 (Jason Ekstrand):
 - Return -ENOMEM if the sync_file_create fails
 - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)

v9 (Jason Ekstrand):
 - Add documentation for the new ioctl

v10 (Jason Ekstrand):
 - Go back to dma_buf_sync_file as the ioctl struct name

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Simon Ser <contact@emersion.fr>
---
 drivers/dma-buf/dma-buf.c    | 62 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h | 24 ++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383eb..7679562b57bfc 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -20,6 +20,7 @@
 #include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
+#include <linux/sync_file.h>
 #include <linux/poll.h>
 #include <linux/dma-resv.h>
 #include <linux/mm.h>
@@ -362,6 +363,62 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_SYNC_FILE)
+static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
+				     void __user *user_data)
+{
+	struct dma_buf_sync_file arg;
+	struct dma_fence *fence = NULL;
+	struct sync_file *sync_file;
+	int fd, ret;
+
+	if (copy_from_user(&arg, user_data, sizeof(arg)))
+		return -EFAULT;
+
+	if (arg.flags & ~DMA_BUF_SYNC_RW)
+		return -EINVAL;
+
+	if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
+		return -EINVAL;
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0)
+		return fd;
+
+	if (arg.flags & DMA_BUF_SYNC_WRITE) {
+		ret = dma_resv_get_singleton_rcu(dmabuf->resv, NULL, &fence);
+		if (ret)
+			goto err_put_fd;
+	} else if (arg.flags & DMA_BUF_SYNC_READ) {
+		fence = dma_resv_get_excl_rcu(dmabuf->resv);
+	}
+
+	if (!fence)
+		fence = dma_fence_get_stub();
+
+	sync_file = sync_file_create(fence);
+
+	dma_fence_put(fence);
+
+	if (!sync_file) {
+		ret = -ENOMEM;
+		goto err_put_fd;
+	}
+
+	fd_install(fd, sync_file->file);
+
+	arg.fd = fd;
+	if (copy_to_user(user_data, &arg, sizeof(arg)))
+		return -EFAULT;
+
+	return 0;
+
+err_put_fd:
+	put_unused_fd(fd);
+	return ret;
+}
+#endif
+
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -405,6 +462,11 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
+#if IS_ENABLED(CONFIG_SYNC_FILE)
+	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
+		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+#endif
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 7f30393b92c3b..f902cadcbdb56 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -37,6 +37,29 @@ struct dma_buf_sync {
 
 #define DMA_BUF_NAME_LEN	32
 
+/**
+ * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf
+ *
+ * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retrieve the
+ * current set of fences on a dma-buf file descriptor as a sync_file.  CPU
+ * waits via poll() or other driver-specific mechanisms typically wait on
+ * whatever fences are on the dma-buf at the time the wait begins.  This
+ * is similar except that it takes a snapshot of the current fences on the
+ * dma-buf for waiting later instead of waiting immediately.  This is
+ * useful for modern graphics APIs such as Vulkan which assume an explicit
+ * synchronization model but still need to inter-operate with dma-buf.
+ */
+struct dma_buf_sync_file {
+	/**
+	 * @flags: Read/write flags
+	 *
+	 * Must DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
+	 */
+	__u32 flags;
+	/** @fd: Sync file file descriptor */
+	__s32 fd;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -46,5 +69,6 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
+#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
 
 #endif
-- 
2.31.1

