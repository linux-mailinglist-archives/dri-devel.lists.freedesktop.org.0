Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6D51B8AB
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FFE10E793;
	Thu,  5 May 2022 07:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DCA10E90C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 22:44:05 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q8so2648074oif.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 15:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0D9dnFIIbgTYLJo3tUEePcsdy15sKd3KBzbXQaHDdqw=;
 b=Rrb26IiFVtke+b+YKJiSZwOZ6L4mMyOHb3WOxTPjgJrjpoG2g5hyDpQFS6jK28yxCR
 6ItKw35/SRUv/WMa+jaGo+tQGCUDexUIL8wWHy6gvnTd5k1Q+wKzgvEpXWMUvzu1QDaW
 msy33MqmoiXiTCHKLxFPgBvzcho7g/aLxECzjiWQXL0fU6J5n4PdK2LZfKe15Zxsk8kZ
 3jwKblnIitrUp4LsmHFyYFhJXxHZrM8O58840dYLG3xY4K2WQeTZ51fNBVf+VtyNfGzT
 fqjJnll+XbE0ViLCj+/kQmGevlxa0QW4BYH5E2Ybtt+CGP6jaHRm2NQzjMlY0yG+ngAk
 0RpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0D9dnFIIbgTYLJo3tUEePcsdy15sKd3KBzbXQaHDdqw=;
 b=jXOV6FFwiSiDjYuAd9HgvVjFYCgliOpW5aUGjfp4nk7q6z02jJPu1wy/pxGbc7w1Ll
 +m0ZJhmiupt1D5AlYi0W5hLmszfvY7lZXwNH9WmxYPO1UjFGOBMeGqYQHDB5E6N19MqB
 QvjCA/a3Q1P9898iFbE8Io4kQuj/8lsyv035usjtz842oJHG33VWakJeg2yFqf5cSLJF
 ubrF71KDTnKaiQNR6bB5j1P73vGXpCtsTC4q3zxJLCK4gZOtrlS9n2HzSpSJr1TPotmA
 v9TRE9hxYO++2qwjZM0mdiGYKu6DTHfy0psHNil0O4d6iEB2H4b9lor4GlR6TJjhDECm
 wVaw==
X-Gm-Message-State: AOAM531vWH2AMZXuGsPzDanXJHOJlOkJg7sRaf/qAcqhcCITG/vrMYMk
 YFKspGaKK3sLiZrcc9x/IyXxPZ8BUjSV/Q==
X-Google-Smtp-Source: ABdhPJzJL/7sfCq0E6Pp/M8qkG5W0Y2AkpG9uWI1Z4YC2/K8f1QmKEedNJMlsRA8qC84G4sZqnJIZw==
X-Received: by 2002:aca:3e05:0:b0:322:7d2e:9ad8 with SMTP id
 l5-20020aca3e05000000b003227d2e9ad8mr912142oia.250.1651704244130; 
 Wed, 04 May 2022 15:44:04 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a54488c000000b00325cda1ffbasm54419oic.57.2022.05.04.15.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:44:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] dma-buf: Add an API for importing sync files (v8)
Date: Wed,  4 May 2022 17:43:49 -0500
Message-Id: <20220504224349.1499888-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504224349.1499888-1-jason@jlekstrand.net>
References: <20220504224349.1499888-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 May 2022 07:23:45 +0000
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
 Jason Ekstrand <jason@jlekstrand.net>, Sumit Semwal <sumit.semwal@linaro.org>
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

v8 (Jason Ekstrand):
 - Rebase on Christian König's fence rework

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
index 529e0611e53b..68aac6f694f9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -383,6 +383,40 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
 	put_unused_fd(fd);
 	return ret;
 }
+
+static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
+				     const void __user *user_data)
+{
+	struct dma_buf_import_sync_file arg;
+	struct dma_fence *fence;
+	enum dma_resv_usage usage;
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
+	usage = (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE :
+						   DMA_RESV_USAGE_READ;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+
+	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
+	if (!ret)
+		dma_resv_add_fence(dmabuf->resv, fence, usage);
+
+	dma_resv_unlock(dmabuf->resv);
+
+	dma_fence_put(fence);
+
+	return ret;
+}
 #endif
 
 static long dma_buf_ioctl(struct file *file,
@@ -431,6 +465,8 @@ static long dma_buf_ioctl(struct file *file,
 #if IS_ENABLED(CONFIG_SYNC_FILE)
 	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
 		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
+		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
 	default:
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 46f1e3e98b02..913119bf2201 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -119,6 +119,27 @@ struct dma_buf_export_sync_file {
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
 
@@ -129,5 +150,6 @@ struct dma_buf_export_sync_file {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
+#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
 
 #endif
-- 
2.36.0

