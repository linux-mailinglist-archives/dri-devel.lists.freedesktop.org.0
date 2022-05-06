Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA1851E747
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 15:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0221132BE;
	Sat,  7 May 2022 13:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854D910EFA8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 18:02:23 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id e189so8275212oia.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1VQkoK/Xz58zI7Vgq0M9qXohq3zBglD3BOlY+KmjbuQ=;
 b=GyqH6CpxTZpWoT2/Brw+j2DlBYzcHVHV/R1m9XZ0mhBlXME9wRompiO+0Kn3rJeAtO
 xEtrjIRDphumD2WahjswF3HwwXfJ/Ozr+nu8bDiPt2ex71mJg9NpH1vTD8PKP3LKZN73
 RnPH9M+qXDbqggvRqKRt5Uvl1ACV83b1MdkaP50sEURWc4yGvmTz1g9ORHimfeHqPDSV
 oM+15LOPVilsHF05WE2QNgwvbgij5sv+NBv4Y5u4SH/cWlwLowgCCZ87ekGZb4A95hvf
 4ask1wqjURjWV/hPe00swrjX6p3PCRuVy9B+fQv59W0picNVOzWHh3Fz0LEZ2ZXa/TJX
 uByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1VQkoK/Xz58zI7Vgq0M9qXohq3zBglD3BOlY+KmjbuQ=;
 b=II6vtDj50p2SeMDqOd26ziGLtGlLS+i1uvdlQn6J/ETsefOGKHQXpQ8yok+pVmGHjb
 sUYZZa0AmyckWRW2bbCWjB/NWpyTBsAjTYXSo9BqKzPva2eqbL/ilRhyFNmRE6Ke4jXj
 bblJq/rcjB6baEj/ZV1Xy5Hzi712vYc6/D1JbNachlw4urHIl+s0H1gb21k588KJNlby
 cNoViiIf37wOcZEWS5Y0iFJFCDZc39FZ/aelZzOgIcxDpayRt+Q4PkEUzPS0J5VhrQnN
 mXLdxaLGmIO5imcfODS8/yQNEuT0bbXYcQkb+dBGwiQL5FHyaQ6DezAbKpHPvZnIffRy
 RA0Q==
X-Gm-Message-State: AOAM531WN3sGdKy3DdJa59kCGXGalTW+qIFR0tkL0dR1Spc3JvB1THMP
 4yFH+gjKMcr3FVBW5HrDO7jToLKBTijhyQ==
X-Google-Smtp-Source: ABdhPJwi1cJ8uCdtVTee+Ixh++tSTRw3h5+GGect6Tm2VIugpg1ZW61hxdPEXke4MoRoi18VvBs6Sg==
X-Received: by 2002:aca:428a:0:b0:326:4b9d:7272 with SMTP id
 p132-20020aca428a000000b003264b9d7272mr5453471oia.30.1651860142406; 
 Fri, 06 May 2022 11:02:22 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 a32-20020a9d2623000000b006060322123csm1840998otb.12.2022.05.06.11.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:21 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] dma-buf: Add an API for importing sync files (v9)
Date: Fri,  6 May 2022 13:02:16 -0500
Message-Id: <20220506180216.2095060-3-jason@jlekstrand.net>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
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

v9 (Daniel Vetter):
 - Fix -EINVAL checks for the flags parameter
 - Add documentation about read/write fences
 - Add documentation about the expected usage of import/export and
   specifically call out the possible userspace race.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c    | 39 ++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h | 49 ++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 6ff54f7e6119..f23f1482eb38 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -386,6 +386,43 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
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
+	if (arg.flags & ~DMA_BUF_SYNC_RW)
+		return -EINVAL;
+
+	if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
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
@@ -434,6 +471,8 @@ static long dma_buf_ioctl(struct file *file,
 #if IS_ENABLED(CONFIG_SYNC_FILE)
 	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
 		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
+		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
 	default:
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 46f1e3e98b02..70e213a0d7d9 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -96,6 +96,24 @@ struct dma_buf_sync {
  * dma-buf for waiting later instead of waiting immediately.  This is
  * useful for modern graphics APIs such as Vulkan which assume an explicit
  * synchronization model but still need to inter-operate with dma-buf.
+ *
+ * The intended usage pattern is the following:
+ *
+ *  1. Export a sync_file with flags corresponding to the expected GPU usage
+ *     via DMA_BUF_IOCTL_EXPORT_SYNC_FILE.
+ *
+ *  2. Submit rendering work which uses the dma-buf.  The work should wait on
+ *     the exported sync file before rendering and produce another sync_file
+ *     when complete.
+ *
+ *  3. Import the rendering-complete sync_file into the dma-buf with flags
+ *     corresponding to the GPU usage via DMA_BUF_IOCTL_EXPORT_SYNC_FILE.
+ *
+ * Unlike doing implicit synchronization via a GPU kernel driver's exec ioctl,
+ * the above is not a single atomic operation.  If userspace wants to ensure
+ * ordering via these fences, it is the respnosibility of userspace to use
+ * locks or other mechanisms to ensure that no other context adds fences or
+ * submits work between steps 1 and 3 above.
  */
 struct dma_buf_export_sync_file {
 	/**
@@ -119,6 +137,36 @@ struct dma_buf_export_sync_file {
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
+	 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
+	 *
+	 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
+	 * this inserts the sync_file as a read-only fence.  Any subsequent
+	 * implicitly synchronized writes to this dma-buf will wait on this
+	 * fence but reads will not.
+	 *
+	 * If DMA_BUF_SYNC_WRITE is set, this inserts the sync_file as a
+	 * write fence.  All subsequent implicitly synchronized access to
+	 * this dma-buf will wait on this fence.
+	 */
+	__u32 flags;
+	/** @fd: Sync file descriptor */
+	__s32 fd;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -129,5 +177,6 @@ struct dma_buf_export_sync_file {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
+#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
 
 #endif
-- 
2.36.0

