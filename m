Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 638893A3585
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842CA6EDF2;
	Thu, 10 Jun 2021 21:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4A6EDF0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:09:51 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso4650926pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zag1g1rUMlRV4MyaiQra8XaNRaujpfFLBu8zwPN7xmE=;
 b=QwfJJvizvUz+gXDj5X2TolZRbEBttu0lce0OyUXbV+us1jblK18T0Ht0oj9kOCGPUj
 6tEhz5LySsrvuI5+a4VkeOKCS5pC3ffyFDKG4saWUL9+BT/cQb5xuLOx6o1Ky5d4mplX
 yV2pzR8+l8hQrlB+6SH7UTtXAbMvbnPyAv3FvUZ+Q5f06R1j9QVXkAhjEpZwvqVStYO1
 obe5G21BuDProTv+kA3Wzzdn9LfF4AuwqidNLufNZb3YAbUbN8xLHF9LuW7iu2Xz8atj
 0Xy9LHtrb8lNPYjAkfH5LI11jZWee1V/Ry59y1xCDakPlk4xcqIZF/OQDwNCiAvkoArF
 B+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zag1g1rUMlRV4MyaiQra8XaNRaujpfFLBu8zwPN7xmE=;
 b=rdsTDa46DHDE+uLcoHeKm13Oc+InnjMMgwjnsaQavE1floIojh6FwzcQ52GORzLctm
 IN7Z3PzbTQuPr5+cskgzlZElxO8R0shnIZpKgfpUbfaguxGe+7LXD4JviACE0XT54kL/
 Ysa13XbKYndHYFCxwHZMZOIyfBl2doRcusFFwR6hLtUa+SFGwWJGtJu0OAr9utgj9LTO
 sAGPSVoERNm/HsBAAzN4EU3858KdjOb3h2UuxyJMaKe2DgpMQ3U78XyhmJHSLVnK6ZXx
 CZ4i4WRf6/lFTpnjoH38VFD/Q3w7IQXI7UaMSt0OfJpbnqOIm5Ir8M/bLmVExeT4KIm6
 YDaQ==
X-Gm-Message-State: AOAM533cUb7uHsNMB+jI7eXl+V322UvRsB51wj0x7gNbrcvD4MWwOYq8
 X7iWpXm4COikKX/uAGyCDffv1rfu8GAVFg==
X-Google-Smtp-Source: ABdhPJyJ59rUdMqfTYTWE+WvHlgBmLAZaHY71mjg4VyECKT9Xms24tL7Lv2l62LOI4vY1plNacFcwQ==
X-Received: by 2002:a17:902:854a:b029:ef:3f99:91a7 with SMTP id
 d10-20020a170902854ab02900ef3f9991a7mr662398plo.74.1623359390258; 
 Thu, 10 Jun 2021 14:09:50 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id o16sm3145288pfu.75.2021.06.10.14.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:09:49 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] dma-buf: Add an API for exporting sync files (v12)
Date: Thu, 10 Jun 2021 16:09:23 -0500
Message-Id: <20210610210925.642582-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610210925.642582-1-jason@jlekstrand.net>
References: <20210610210925.642582-1-jason@jlekstrand.net>
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
index 511fe0d217a08..41b14b53cdda3 100644
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
+		fence = dma_resv_get_singleton(dmabuf->resv);
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
index 1c131002fe1ee..82f12a4640403 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -81,6 +81,40 @@ struct dma_buf_sync {
 
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
 
@@ -90,5 +124,6 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
+#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
 
 #endif
-- 
2.31.1

