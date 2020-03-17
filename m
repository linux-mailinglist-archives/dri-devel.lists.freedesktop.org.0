Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB66189040
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 22:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B506E25D;
	Tue, 17 Mar 2020 21:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454626E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 21:21:39 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id f206so1643555pfa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 14:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcoY8Zv5ldWOcQg9c9S82nSPUSBzSFSRHAdLvHZUCvo=;
 b=YU13BVIrZ5/2E7dWu6Deuj2TkAksebpqKYWjq03Q2pwGLx5YETjkI/keI2njmjVtb9
 6De3yh3kHxDzh59pqgVS89EJSJOQhF9bJqgt9idcLYtInaMyQmDZGJHT1RPNlIxkop5z
 UhL3NYjCRf2Jd+Rrj/z1iZCG1Fz30todcoluOEGyzpb8PIIdwl0VLL0ujhvtXDnK6xCP
 eT6ochriC7LKAzwYOB9kTIo79oAK/Xo3wZgZ1J3oNb7exyFiT09QUqIes1PBubRc+HQd
 W63UWQ4g0NMcGgSL9iScCHBDtEv+mh7FL24/CyraNr/BmxoN9jkDU0+6EvnedPcHPmv4
 x/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcoY8Zv5ldWOcQg9c9S82nSPUSBzSFSRHAdLvHZUCvo=;
 b=uYq3BxSPJTCrsNSH4wjZL/frcbHsCk0u5mPhf0v/8XCxgp+OZZfkoXa9uygFR9Il7x
 AbvFMxdfgFqJ+IiQseP8xM1bASoWLUGOLvpLVRD59Ht69LBd9XR5hjbJ4XJmCbbTGb7s
 2d1I2j0wkr9R6spCOZDTLBMChCOXDqnIxmX7k4ekB2KFnqIhzhoyaWw4HTAPUsuD5Pmj
 DRf28Un1XKrM4D3XzSO9SaRS5kaaWm+kbaoEEVyFIs9shgYzjw/RpafyB7pEoMkU4o5w
 xtDYkTYPxYhfyZzVQnpW3JPR/M97l9AyPY80+8NOXZGFcbc5NYxPlNvBmQZS9OaBD0mn
 RQgA==
X-Gm-Message-State: ANhLgQ1zkzjf5ezxdrU0ZuwBgPAzBqLeKrTqmzwumo6urmxqNFhld9Va
 mvGr77JF3xf2kShEHsqppGmnWw==
X-Google-Smtp-Source: ADFU+vtDMmPsTS80Fu9wPKROmr6woIdo1fBvmrAYDGmH5X8K6c6182n05bvtuifFjC6i93SF3P28DQ==
X-Received: by 2002:a63:c445:: with SMTP id m5mr1150883pgg.194.1584480098604; 
 Tue, 17 Mar 2020 14:21:38 -0700 (PDT)
Received: from omlet.com ([2605:6000:1026:c273::ce4])
 by smtp.gmail.com with ESMTPSA id u5sm4185087pfb.153.2020.03.17.14.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 14:21:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: 
Subject: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting sync
 files (v5)
Date: Tue, 17 Mar 2020 16:21:14 -0500
Message-Id: <20200317212115.419358-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200311034351.1275197-3-jason@jlekstrand.net>
References: <20200311034351.1275197-3-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Chenbo Feng <fengc@google.com>, daniels@collabora.com,
 daniel.vetter@ffwll.ch, jajones@nvidia.com, linux-kernel@vger.kernel.org,
 Greg Hackmann <ghackmann@google.com>, linaro-mm-sig@lists.linaro.org,
 hoegsberg@google.com, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, jessehall@google.com,
 airlied@redhat.com, christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explicit synchronization is the future.  At least, that seems to be what
most userspace APIs are agreeing on at this point.  However, most of our
Linux APIs (both userspace and kernel UAPI) are currently built around
implicit synchronization with dma-buf.  While work is ongoing to change
many of the userspace APIs and protocols to an explicit synchronization
model, switching over piecemeal is difficult due to the number of
potential components involved.  On the kernel side, many drivers use
dma-buf including GPU (3D/compute), display, v4l, and others.  In
userspace, we have X11, several Wayland compositors, 3D drivers, compute
drivers (OpenCL etc.), media encode/decode, and the list goes on.

This patch provides a path forward by allowing userspace to manually
manage the fences attached to a dma-buf.  Alternatively, one can think
of this as making dma-buf's implicit synchronization simply a carrier
for an explicit fence.  This is accomplished by adding two IOCTLs to
dma-buf for importing and exporting a sync file to/from the dma-buf.
This way a userspace component which is uses explicit synchronization,
such as a Vulkan driver, can manually set the write fence on a buffer
before handing it off to an implicitly synchronized component such as a
Wayland compositor or video encoder.  In this way, each of the different
components can be upgraded to an explicit synchronization model one at a
time as long as the userspace pieces connecting them are aware of it and
import/export fences at the right times.

There is a potential race condition with this API if userspace is not
careful.  A typical use case for implicit synchronization is to wait for
the dma-buf to be ready, use it, and then signal it for some other
component.  Because a sync_file cannot be created until it is guaranteed
to complete in finite time, userspace can only signal the dma-buf after
it has already submitted the work which uses it to the kernel and has
received a sync_file back.  There is no way to atomically submit a
wait-use-signal operation.  This is not, however, really a problem with
this API so much as it is a problem with explicit synchronization
itself.  The way this is typically handled is to have very explicit
ownership transfer points in the API or protocol which ensure that only
one component is using it at any given time.  Both X11 (via the PRESENT
extension) and Wayland provide such ownership transfer points via
explicit present and idle messages.

The decision was intentionally made in this patch to make the import and
export operations IOCTLs on the dma-buf itself rather than as a DRM
IOCTL.  This makes it the import/export operation universal across all
components which use dma-buf including GPU, display, v4l, and others.
It also means that a userspace component can do the import/export
without access to the DRM fd which may be tricky to get in cases where
the client communicates with DRM via a userspace API such as OpenGL or
Vulkan.  At a future date we may choose to add direct import/export APIs
to components such as drm_syncobj to avoid allocating a file descriptor
and going through two ioctls.  However, that seems to be something of a
micro-optimization as import/export operations are likely to happen at a
rate of a few per frame of rendered or decoded video.

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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/dma-buf/dma-buf.c    | 84 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h | 11 ++++-
 2 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..d34d27aa3077 100644
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
@@ -348,6 +349,83 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return ret;
 }
 
+static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
+				     const void __user *user_data)
+{
+	struct dma_buf_sync_file arg;
+	struct dma_fence *fence, *singleton = NULL;
+	int ret = 0;
+
+	if (copy_from_user(&arg, user_data, sizeof(arg)))
+		return -EFAULT;
+
+	if (arg.flags != 0)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(arg.fd);
+	if (!fence)
+		return -EINVAL;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+
+	ret = dma_resv_get_singleton(dmabuf->resv, fence, &singleton);
+	if (!ret && singleton)
+		dma_resv_add_excl_fence(dmabuf->resv, singleton);
+
+	dma_resv_unlock(dmabuf->resv);
+
+	dma_fence_put(fence);
+
+	return ret;
+}
+
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
+	if (arg.flags != 0)
+		return -EINVAL;
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0)
+		return fd;
+
+	ret = dma_resv_get_singleton(dmabuf->resv, NULL, &fence);
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
+		ret = -EINVAL;
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
+
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -390,6 +468,12 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_SET_NAME:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
+	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
+		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
+
+	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
+		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index dbc7092e04b5..b746c6459e24 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -37,8 +37,15 @@ struct dma_buf_sync {
 
 #define DMA_BUF_NAME_LEN	32
 
+struct dma_buf_sync_file {
+	__u32 flags;
+	__s32 fd;
+};
+
 #define DMA_BUF_BASE		'b'
-#define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
-#define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
+#define DMA_BUF_IOCTL_SYNC	    _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
+#define DMA_BUF_SET_NAME	    _IOW(DMA_BUF_BASE, 1, const char *)
+#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 2, struct dma_buf_sync)
+#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 3, struct dma_buf_sync)
 
 #endif
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
