Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E41390B31
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F916EB46;
	Tue, 25 May 2021 21:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04446EB49
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:10 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id z4so14840106plg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aVRWHUdIShQi1nsSzSKZUPU5qNRn//26RDAX0L399dc=;
 b=My6+y+nJzz50Iyxuc4xCyjJoOEy50Z47yu3tVntkp8cHx8geMn/VP7UA4B/wIUx7qM
 rQSfJcJxoadYt7Y18TakvxExwWMZJIizfL59AnHiSzt8ZqYOSMi9iOkkvPegFREKp18o
 WIw9scla1s6XmVU2j26QiYDrwMh8e0OqEgopS9abSkPxc6UQG01tzXDEQxIlonTkWzIb
 1z44pSNyM4R8jE+XhtN4T9PHgHVtpCvdPB4YoSD9N3paiVpj6c8ow4WWfJpbOYvWuTeV
 DNKI2Rqd3Mo6/xFzjYt5Vt/Iki9UHOLV99qH/68JjmXefXVy/jgXDQVB0P+84g/yxNIc
 GT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVRWHUdIShQi1nsSzSKZUPU5qNRn//26RDAX0L399dc=;
 b=arZaYiVfjH1w3MMUeSHhM2nMOe8M4J+9fXNvRSgbfv8YSmpxn+pQsU1sXl2IYjSP4T
 gJdUp4vXlabyEEMGpBoNgo/FCL54KpQs8kNOLFj7as6tHiCf51K0EdboBKxh6jqE7/aN
 3t7QcHcZbcun/9+ZyxHrYQ9dhFYoB20dl+57ipSNNC1LARuVjgXCMcT1eStayUGiCDWO
 w2X4S0yDA2OWPDdatDb20mPkPLCSHr7lJYh44yfz2ucC24Rb9kS8vhJwlGR58ELwm0GM
 61IJhMJuNpRtklnE2lfmazrkla6Lsjv1KSbELK0ixq40ktnDYAmjcxWK9g13d+vQcSU2
 ZqjA==
X-Gm-Message-State: AOAM53002XP9TAcCwhAUmGpBRYc1dAAff/2lZn0mzfdw9VkxBLPPm8O+
 kS2y11Sjd2n0bBFV/e5yEYqJE1EY7Cg1yg==
X-Google-Smtp-Source: ABdhPJwCB9VBuDNuH2qw9I1VG0qkdO3HU+K/LR3AH5yUvGtVrQeZw4SdEMtOd2oOL+wll/50afRLSg==
X-Received: by 2002:a17:90a:4105:: with SMTP id
 u5mr31251452pjf.45.1621977489868; 
 Tue, 25 May 2021 14:18:09 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:18:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] dma-buf: Add an API for exporting sync files (v11)
Date: Tue, 25 May 2021 16:17:51 -0500
Message-Id: <20210525211753.1086069-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525211753.1086069-1-jason@jlekstrand.net>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
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

v11 (Daniel Vetter):
 - Go back to dma_buf_export_sync_file as the ioctl struct name
 - Better kerneldoc describing what the read/write flags do

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Simon Ser <contact@emersion.fr>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c    | 67 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ed6451d55d663..65a9574ee04ed 100644
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
@@ -191,6 +192,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
  * Note that this only signals the completion of the respective fences, i.e. the
  * DMA transfers are complete. Cache flushing and any other necessary
  * preparations before CPU access can begin still need to happen.
+ *
+ * As an alternative to poll(), the set of fences on DMA buffer can be
+ * exported as a &sync_file using &dma_buf_sync_file_export.
  */
 
 static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
@@ -362,6 +366,64 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_SYNC_FILE)
+static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
+				     void __user *user_data)
+{
+	struct dma_buf_export_sync_file arg;
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
+		fence = dma_resv_get_singleton_unlocked(dmabuf->resv);
+		if (IS_ERR(fence)) {
+			ret = PTR_ERR(fence);
+			goto err_put_fd;
+		}
+	} else if (arg.flags & DMA_BUF_SYNC_READ) {
+		fence = dma_resv_get_excl_unlocked(dmabuf->resv);
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
@@ -405,6 +467,11 @@ static long dma_buf_ioctl(struct file *file,
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
index 1f67ced853b14..aeba45180b028 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -67,6 +67,40 @@ struct dma_buf_sync {
 
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
+struct dma_buf_export_sync_file {
+	/**
+	 * @flags: Read/write flags
+	 *
+	 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
+	 *
+	 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
+	 * the returned sync file waits on any writers of the dma-buf to
+	 * complete.  Waiting on the returned sync file is equivalent to
+	 * poll() with POLLIN.
+	 *
+	 * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
+	 * any users of the dma-buf (read or write) to complete.  Waiting
+	 * on the returned sync file is equivalent to poll() with POLLOUT.
+	 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
+	 * is equivalent to just DMA_BUF_SYNC_WRITE.
+	 */
+	__u32 flags;
+	/** @fd: Returned sync file descriptor */
+	__s32 fd;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -76,5 +110,6 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
+#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
 
 #endif
-- 
2.31.1

