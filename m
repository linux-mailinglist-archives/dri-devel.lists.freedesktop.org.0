Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9F390B34
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319C789700;
	Tue, 25 May 2021 21:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0616EB46
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:14 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 n6-20020a17090ac686b029015d2f7aeea8so14023825pjt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Zomxth+WuiC0IHgmdncpOPr5o6JQyY+ikQtNjEMgrQ=;
 b=qJIec8BequFpbl+oVYyw7tmxYT3paf9hpAqm3gLAv1n/WrVrei8i5XHXMiKCPxPj3f
 btJElvhCBVGPqEQiOtssRGm/9bcf9N8StvYzJ6FdTHTdE4wkQqUXiuYCd3o/N3LV6NBK
 PwmkJZ+vK+dbGRgdbCOCG/rWqPrVFdvwnyyq1jQ+CVIvsB8wNzN+TsfryoDtebZxIQ4R
 QOpDA6qqC4f9+SZn5tugi236CXyFwKMo5PkzXOgew8TwjINaA8I79EryRchAzhFpHYKs
 Gk8FvGFE3dijjxDVT6B/KzdD0R/0myjEOXxfbnzTcSaQcmLfYYQtXTzRGruhG5Hy4tIP
 WZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Zomxth+WuiC0IHgmdncpOPr5o6JQyY+ikQtNjEMgrQ=;
 b=i54SRyoxFoeku/s6l5c9yGvdl1G11GGzUcXk10vpSkw+NIgbo3QyzJnlw4+1s+S9dC
 VrxOSZ2XFfGw1nmAwcaSxAiepcX7m0kL10mgWaSbbJRZXSL6jZHB60efLffpXFqdzsCi
 nXEzPs/YdtdTp7WYKPmd1sFIICXhuob4MCxS3JS3IgXsQaXpl6aUQSnt+fRQ0Buj9ndZ
 IkWc4VgNDLx2LrnvSM4boqj0N5M38eZ9id+E/lsa2ht96IKAci/gMk+P1X2KghV06cN4
 unA56g/+qU68aQkiYjeBHH++oibHbZr2iaHqB5MeNO69ZvauN6qaEyskzFhO/erZpuUC
 2jtg==
X-Gm-Message-State: AOAM530Npc8VDTgpdT9uJMfKL8pzV1QGgTwCEB+Mlmp8vEwh9+lDQgr8
 Y/QY+Bp3L8xJnmlsf/FC5b8/56/BgKH7Qw==
X-Google-Smtp-Source: ABdhPJzAPXz0yewfnqZlrDIupak3VBLdb4uKxv8DCVTUymb0HjVcU6+d0kC+y+rSxM53sVsqH18pnQ==
X-Received: by 2002:a17:90a:880c:: with SMTP id
 s12mr32796620pjn.66.1621977493521; 
 Tue, 25 May 2021 14:18:13 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:18:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] RFC: dma-buf: Add an API for importing sync files (v7)
Date: Tue, 25 May 2021 16:17:53 -0500
Message-Id: <20210525211753.1086069-8-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is analogous to the previous sync file export patch in that
it allows you to import a sync_file into a dma-buf.  Unlike the previous
patch, however, this does add genuinely new functionality to dma-buf.
Without this, the only way to attach a sync_file to a dma-buf is to
submit a batch to your driver of choice which waits on the sync_file and
claims to write to the dma-buf.  Even if said batch is a no-op, a submit
is typically way more overhead than just attaching a fence.  A submit
may also imply extra synchronization with other work because it happens
on a hardware queue.

In the Vulkan world, this is useful for dealing with the out-fence from
vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
those as an exclusive (write) fence on the dma-buf.  We handle it in
Mesa today with the above mentioned dummy submit trick.  This ioctl
would allow us to set it directly without the dummy submit.

This may also open up possibilities for GPU drivers to move away from
implicit sync for their kernel driver uAPI and instead provide sync
files and rely on dma-buf import/export for communicating with other
implicit sync clients.

We make the explicit choice here to only allow setting RW fences which
translates to an exclusive fence on the dma_resv.  There's no use for
read-only fences for communicating with other implicit sync userspace
and any such attempts are likely to be racy at best.  When we got to
insert the RW fence, the actual fence we set as the new exclusive fence
is a combination of the sync_file provided by the user and all the other
fences on the dma_resv.  This ensures that the newly added exclusive
fence will never signal before the old one would have and ensures that
we don't break any dma_resv contracts.  We require userspace to specify
RW in the flags for symmetry with the export ioctl and in case we ever
want to support read fences in the future.

There is one downside here that's worth documenting:  If two clients
writing to the same dma-buf using this API race with each other, their
actions on the dma-buf may happen in parallel or in an undefined order.
Both with and without this API, the pattern is the same:  Collect all
the fences on dma-buf, submit work which depends on said fences, and
then set a new exclusive (write) fence on the dma-buf which depends on
said work.  The difference is that, when it's all handled by the GPU
driver's submit ioctl, the three operations happen atomically under the
dma_resv lock.  If two userspace submits race, one will happen before
the other.  You aren't guaranteed which but you are guaranteed that
they're strictly ordered.  If userspace manages the fences itself, then
these three operations happen separately and the two render operations
may happen genuinely in parallel or get interleaved.  However, this is a
case of userspace racing with itself.  As long as we ensure userspace
can't back the kernel into a corner, it should be fine.

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
 - Split import and export into separate patches
 - New commit message

v7 (Daniel Vetter):
 - Fix the uapi header to use the right struct in the ioctl
 - Use a separate dma_buf_import_sync_file struct
 - Add kerneldoc for dma_buf_import_sync_file

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c    | 36 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h | 22 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ea117de962903..098340222662b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -422,6 +422,40 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
 	put_unused_fd(fd);
 	return ret;
 }
+
+static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
+				     const void __user *user_data)
+{
+	struct dma_buf_import_sync_file arg;
+	struct dma_fence *fence, *singleton = NULL;
+	int ret = 0;
+
+	if (copy_from_user(&arg, user_data, sizeof(arg)))
+		return -EFAULT;
+
+	if (arg.flags != DMA_BUF_SYNC_RW)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(arg.fd);
+	if (!fence)
+		return -EINVAL;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+
+	singleton = dma_resv_get_singleton_unlocked(dmabuf->resv, fence);
+	if (IS_ERR(singleton)) {
+		ret = PTR_ERR(singleton);
+	} else if (singleton) {
+		dma_resv_add_excl_fence(dmabuf->resv, singleton);
+		dma_resv_add_shared_fence(dmabuf->resv, singleton);
+	}
+
+	dma_resv_unlock(dmabuf->resv);
+
+	dma_fence_put(fence);
+
+	return ret;
+}
 #endif
 
 static long dma_buf_ioctl(struct file *file,
@@ -470,6 +504,8 @@ static long dma_buf_ioctl(struct file *file,
 #if IS_ENABLED(CONFIG_SYNC_FILE)
 	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
 		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
+		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
 	default:
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index aeba45180b028..af53987db24be 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -101,6 +101,27 @@ struct dma_buf_export_sync_file {
 	__s32 fd;
 };
 
+/**
+ * struct dma_buf_import_sync_file - Insert a sync_file into a dma-buf
+ *
+ * Userspace can perform a DMA_BUF_IOCTL_IMPORT_SYNC_FILE to insert a
+ * sync_file into a dma-buf for the purposes of implicit synchronization
+ * with other dma-buf consumers.  This allows clients using explicitly
+ * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
+ * which expect implicit synchronization such as OpenGL or most media
+ * drivers/video.
+ */
+struct dma_buf_import_sync_file {
+	/**
+	 * @flags: Read/write flags
+	 *
+	 * Must be DMA_BUF_SYNC_RW.
+	 */
+	__u32 flags;
+	/** @fd: Sync file descriptor */
+	__s32 fd;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -111,5 +132,6 @@ struct dma_buf_export_sync_file {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
+#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
 
 #endif
-- 
2.31.1

