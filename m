Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75E51E74C
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 15:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970651132C1;
	Sat,  7 May 2022 13:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450AE10EFA8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 18:02:22 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so5401735otq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0GafE1B3wr5Ikp0fS5Y0kwV7xWfDBxwxYUGA3q3Xjsg=;
 b=Pb2EBNvwUtyMX+gT7AfB8qT8Nh5aMqjVg4Wq+6zYabDURQm4J0TtAqFXaPfZhb5eIN
 mmCdDFLwdJLQJnSkvmYxuUkLKx6vxB3fuOdX2glGTvLLlpsxhvhSQfhO3FpQvkTwSLJL
 K2IbNAvyu4+k9qUp6bqSdcors2LssyKnu+8zD9zjYxQGpiH3ftd312cS/zAGUReS+AeU
 HshoOqlxs51/2+PCINKK67rfIb7kxUauUzYft/kS9H1UbrwsB7KXw/r9bNnq2HaLcnWw
 1TlSuaQ6axBusbgTs3yDYJ8Os5eVuj8NIyzD7ulKioWaVIhnH6ngmAanRxUQYowDCzFi
 UAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0GafE1B3wr5Ikp0fS5Y0kwV7xWfDBxwxYUGA3q3Xjsg=;
 b=zKxZxJopfrDZUhmHRGP+AwZ7ixvEZ13uOGdhcTfGFg6adbHLA8dwVQWdUjf6pFoTdD
 H35Zqu9/CiIUVHk8ThUtqDjw+tlNyM9a19pPKysyx3ftL6SRAdHuKTFcvrWvgpnDFY78
 6kVnBPDxJsLJRrD5xqI3UFrmFAYVU168kfZrnlc2T5HPNBI5M2yLJhIa7nMQa/Qfh422
 CeM4Jd0w+nVE4tOH7NzlEFDe4Njhl8s6hvwUfEuYLTp3xpWjawGVJdRTOgKF8+xsFaEn
 1GWnjhtJ+EE5fcH7/NVWoZmNIv7rq8lj3FnfuB8MtgJsoexyftzYgsDnxsKtZtuDoXNj
 2KjA==
X-Gm-Message-State: AOAM533ZdRwLxIuWzkNEOr6jjCun5NxZdTv5CSMhDVydAl+Uh1vYR4al
 IiC3EL9Hian/2GnIONXudE8bYXM3CzvSAA==
X-Google-Smtp-Source: ABdhPJxdQ8fsM10Lj1LzXwj1T5A+Q+OEKMMt7Bh74h6sd9uhxT42qUXCVaiyfgD7SZyRurYhafPsfQ==
X-Received: by 2002:a9d:3b5:0:b0:603:f8ac:a780 with SMTP id
 f50-20020a9d03b5000000b00603f8aca780mr1419426otf.26.1651860141070; 
 Fri, 06 May 2022 11:02:21 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 a32-20020a9d2623000000b006060322123csm1840998otb.12.2022.05.06.11.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
Date: Fri,  6 May 2022 13:02:15 -0500
Message-Id: <20220506180216.2095060-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506180216.2095060-1-jason@jlekstrand.net>
References: <20220506180216.2095060-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 07 May 2022 13:18:19 +0000
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
it into a VkFence or VkSemaphore without any over-synchronization.

By making this an ioctl on the dma-buf itself, it allows this new
functionality to be used in an entirely driver-agnostic way without
having access to a DRM fd. This makes it ideal for use in driver-generic
code in Mesa or in a client such as a compositor where the DRM fd may be
hard to reach.

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

v12 (Christian König):
 - Document why we chose to make it an ioctl on dma-buf

v13 (Jason Ekstrand):
 - Rebase on Christian König's fence rework

v14 (Daniel Vetter & Christian König):
 - Use dma_rev_usage_rw to get the properly inverted usage to pass to
   dma_resv_get_singleton()
 - Clean up the sync_file and fd if copy_to_user() fails

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
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
index 79795857be3e..6ff54f7e6119 100644
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
@@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
  * Note that this only signals the completion of the respective fences, i.e. the
  * DMA transfers are complete. Cache flushing and any other necessary
  * preparations before CPU access can begin still need to happen.
+ *
+ * As an alternative to poll(), the set of fences on DMA buffer can be
+ * exported as a &sync_file using &dma_buf_sync_file_export.
  */
 
 static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
@@ -326,6 +330,64 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SYNC_FILE)
+static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
+				     void __user *user_data)
+{
+	struct dma_buf_export_sync_file arg;
+	enum dma_resv_usage usage;
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
+	usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
+	ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
+	if (ret)
+		goto err_put_fd;
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
+	arg.fd = fd;
+	if (copy_to_user(user_data, &arg, sizeof(arg))) {
+		ret = -EFAULT;
+		goto err_put_file;
+	}
+
+	fd_install(fd, sync_file->file);
+
+	return 0;
+
+err_put_file:
+	fput(sync_file->file);
+err_put_fd:
+	put_unused_fd(fd);
+	return ret;
+}
+#endif
+
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -369,6 +431,11 @@ static long dma_buf_ioctl(struct file *file,
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
index 8e4a2ca0bcbf..46f1e3e98b02 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -85,6 +85,40 @@ struct dma_buf_sync {
 
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
 
@@ -94,5 +128,6 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
+#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
 
 #endif
-- 
2.36.0

