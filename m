Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8C3A358A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C016EDF4;
	Thu, 10 Jun 2021 21:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A596EDF4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:09:55 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso4555398pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yWmhw7bfclsQ5CVFScTlrmVG2O91WBKNTPNwOFrJ1o=;
 b=L6KdeureliCMvQhtyeN02FCJJEG7cHwiLgqZ5N+VEonjsWXjBcBBiK888WAqQfc84d
 yKLpq0IJcanTgLIzAImE8uK8rP9Nwth7kCdkTSSUNyq/7mQDbKi74dGKaOztkcMq+f0b
 qk6GpP+v8GleoVPuFam/tQHjQNFdJ9rICZIYDoubVGiovP8uB+Q2b+TCslJ1Ep6suApt
 JIgj7VxDqoFGUZXqgpVEeR8OwtWq+K9t/E/FXdm0DehpncU2ave2tceLOBxFEvjTGsKs
 MnzoQsv78IHJ/kXPESA4XQGJbzspvkTPak3rIgaCXaTxYUAAQlSNPfglQxotNhmOM0fT
 D3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yWmhw7bfclsQ5CVFScTlrmVG2O91WBKNTPNwOFrJ1o=;
 b=ct/RIkhekkUcPYGMA0lhLJeVYGwEiqouwPSROcPOL/oWOgEq09Hd4Q2AqKxpXk197w
 jM2hpHwhIgA/xSvvtzwMQi6qi7AeItmvP7zoA4ldWBRMWp3tD+hAnhybCxDnMK8dDkr0
 mIew0p7GUEqr1HT0Zax3dfB17D/BPnxzyz192g6G2QhFEDoh547/LCTJbzzEoCxQA5/P
 pRnJrylGJ88Wat5zpqpdf8T0w0BOrNJAf+SWPRCW0yuoesNWdJBJQWemPbwnrfYmYa6n
 nT9XPQNXaZ6iacgC5SWuocAultly1glsICvy5S+er297WP/udETgylD5HP+jvSKNnqmt
 0MEQ==
X-Gm-Message-State: AOAM531nBA8f7KCGVuPLXI8oVS8zAJ1FU/ZK8H6FyY+42o0wE8nKZ6HE
 060Ol6xy3RRV6IbKbH1L/kTTSGM0ogH23g==
X-Google-Smtp-Source: ABdhPJxqWJifYNVdJDKhA7H7SvWfZSXIf1uXYRF/24noAPPe3K5rp6Q/EgjoEr+xYQYMFlszMPi5Bg==
X-Received: by 2002:a17:902:8d92:b029:113:91e7:89d6 with SMTP id
 v18-20020a1709028d92b029011391e789d6mr629261plo.85.1623359394266; 
 Thu, 10 Jun 2021 14:09:54 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id o16sm3145288pfu.75.2021.06.10.14.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:09:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] RFC: dma-buf: Add an API for importing sync files (v7)
Date: Thu, 10 Jun 2021 16:09:25 -0500
Message-Id: <20210610210925.642582-7-jason@jlekstrand.net>
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
index 831828d71b646..88afd723015a2 100644
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
+	singleton = dma_resv_get_singleton(dmabuf->resv, fence);
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
index 82f12a4640403..7382fd67351ba 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -115,6 +115,27 @@ struct dma_buf_export_sync_file {
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
 
@@ -125,5 +146,6 @@ struct dma_buf_export_sync_file {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
+#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
 
 #endif
-- 
2.31.1

