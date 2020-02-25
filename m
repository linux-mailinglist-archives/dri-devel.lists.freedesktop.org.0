Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF216F405
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 00:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FAA890C5;
	Tue, 25 Feb 2020 23:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE5D890C5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 23:59:08 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ep11so453687pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 15:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AF4yId+y/TfljEnxGOV4fCMRwsfaIal7EqJaU81pYYw=;
 b=uh/33vTQP+CF+n38KTauF2k2uBHZqxp8SnnNcBSRoRZX/gQ3o0rdcAYdUzw4HPkWGR
 39YqylYPPNc8n/zdAzMqETA+F2vLwSR/MIMkOFfx2M4Aucz5qFquRZJ2QMIyE+ZzNCXq
 mYV7d6JH3e23j+QqLFAD1PhCm8c1QHkz6PxBRfBxIs2JpbHw9NWeo14B3v+W5s51E/n/
 ngD2N0zbmXYJTCiuiykcrb5/0Pc0B3rCcdcBpiAZwwxoOsKoLY7v68ZAfraqUmgUCT5N
 JWzvd84LRlIzYA1QNK2UyXZxXY4EmZh8c3UafeF7oUHItNOBO34cvDbj6JcXiUpypxkF
 bOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AF4yId+y/TfljEnxGOV4fCMRwsfaIal7EqJaU81pYYw=;
 b=PG9nFe8IwjKgZJKytR75Z4PZ8qBi0oZF8XZqvqUOPnUtnCVaACkm4iYBZ815EU0suC
 vS89Aws4zrI2f1oo0bvD86asU34anu8M/20t1PjpJPfS87x3TWA9zsIVlz9WoYmxXlQl
 LpZ+ZV0rnvkTl/zGpztWk6vEHAg4EsEyFZ8SYAomsBMh05SbGGEe3nqm+Brk03UFpgS1
 iLBSvF0MXflJ859DPZcgu2pSexRhxN3QR6X66HjmNQFysgUbgxaLsIebBBwM2s5HQfF+
 4ttkVo1Csq3HpugnZ+ygpmHBjNmwX9Am4T6QZn4FR5YLy+WtWS5dWyB46J7RMoXN2Gsq
 fO8g==
X-Gm-Message-State: APjAAAWcmlnzL4XMOJNohLmJlk3WCVxi1iQjqg9DoMHp91Wk0EDKLrCV
 cLNbypVP612xV3h09S9rmaJtmQ==
X-Google-Smtp-Source: APXvYqyaHbelULqZTMmN5KRFJiybbwwtp/zlDU+4paYLXPdoByk2DmIr7ueSCRJEhZcykFH/Cj08IQ==
X-Received: by 2002:a17:902:8b89:: with SMTP id
 ay9mr1002292plb.309.1582675148262; 
 Tue, 25 Feb 2020 15:59:08 -0800 (PST)
Received: from omlet.com ([2605:6000:1026:c273::594])
 by smtp.gmail.com with ESMTPSA id b15sm213974pft.58.2020.02.25.15.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 15:59:07 -0800 (PST)
From: Jason Ekstrand <jason@jlekstrand.net>
To: 
Subject: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
Date: Tue, 25 Feb 2020 17:58:55 -0600
Message-Id: <20200225235856.975366-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.24.1
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
 Jason Ekstrand <jason@jlekstrand.net>, airlied@redhat.com,
 jessehall@google.com, christian.koenig@amd.com, linux-media@vger.kernel.org
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---

This is marked as an RFC because I intend it to start a discussion about
how to solve a problem.  The current patch compiles but that's it for now.
I'll be writing IGT tests and Vulkan driver patches which exercise it over
the next couple of days.  In the mean time, feel free to tell me why you
think this is a great and/or terrible idea. :-)

--Jason


 drivers/dma-buf/dma-buf.c    | 115 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  13 +++-
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..3845b87e209e 100644
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
@@ -348,6 +349,114 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return ret;
 }
 
+static long dma_buf_wait_sync_file(struct dma_buf *dmabuf,
+				   const void __user *user_data)
+{
+	struct dma_buf_sync_file arg;
+	struct dma_fence *fence;
+
+	if (copy_from_user(&arg, user_data, sizeof(arg)))
+		return -EFAULT;
+
+	if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(arg.fd);
+	if (!fence)
+		return -EINVAL;
+
+	if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
+		dma_resv_add_excl_fence(dmabuf->resv, fence);
+	} else {
+		dma_resv_add_shared_fence(dmabuf->resv, fence);
+	}
+
+	return 0;
+}
+
+static long dma_buf_signal_sync_file(struct dma_buf *dmabuf,
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
+	if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
+		return -EINVAL;
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0)
+		return fd;
+
+	if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
+		/* We need to include both the exclusive fence and all of
+		 * the shared fences in our fence.
+		 */
+		struct dma_fence **fences = NULL;
+		unsigned i, num_fences = 0;
+
+		ret = dma_resv_get_fences_rcu(dmabuf->resv, NULL,
+					      &num_fences, &fences);
+		if (ret)
+			goto err_put_fd;
+
+		if (num_fences == 0) {
+			fence = dma_fence_get_stub();
+		} else if (num_fences == 1) {
+			fence = fences[0];
+			kfree(fences);
+		} else {
+			struct dma_fence_array *fence_arr;
+
+			fence_arr = dma_fence_array_create(num_fences, fences,
+							   dma_fence_context_alloc(1),
+							   1, false);
+			if (!fence_arr) {
+				for (i = 0; i < num_fences; i++)
+					dma_fence_put(fences[i]);
+				kfree(fences);
+				ret = -ENOMEM;
+				goto err_put_fd;
+			}
+
+			/* The fence array now owns fences_arr and our
+			 * references to each of the individual fences.  We
+			 * only own a reference to the one array fence.
+			 */
+			fence = &fence_arr->base;
+		}
+	} else {
+		fence = dma_resv_get_excl_rcu(dmabuf->resv);
+		if (!fence)
+			fence = dma_fence_get_stub();
+	}
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
@@ -390,6 +499,12 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_SET_NAME:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
+	case DMA_BUF_IOCTL_WAIT_SYNC_FILE:
+		return dma_buf_wait_sync_file(dmabuf, (const void __user *)arg);
+
+	case DMA_BUF_IOCTL_SIGNAL_SYNC_FILE:
+		return dma_buf_signal_sync_file(dmabuf, (void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index dbc7092e04b5..825b9a913c89 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -37,8 +37,17 @@ struct dma_buf_sync {
 
 #define DMA_BUF_NAME_LEN	32
 
+struct dma_buf_sync_file {
+	__u32 flags;
+	__s32 fd;
+};
+
+#define DMA_BUF_SYNC_FILE_SYNC_WRITE	(1 << 0)
+
 #define DMA_BUF_BASE		'b'
-#define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
-#define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
+#define DMA_BUF_IOCTL_SYNC	    _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
+#define DMA_BUF_SET_NAME	    _IOW(DMA_BUF_BASE, 1, const char *)
+#define DMA_BUF_IOCTL_WAIT_SYNC_FILE	_IOW(DMA_BUF_BASE, 2, struct dma_buf_sync)
+#define DMA_BUF_IOCTL_SIGNAL_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_sync)
 
 #endif
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
