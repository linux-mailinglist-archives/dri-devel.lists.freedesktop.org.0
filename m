Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7E178290
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 20:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F3789C08;
	Tue,  3 Mar 2020 19:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C7989C08
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 19:03:38 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y26so549992pfn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 11:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZcNjNR9eap06LKLBmYe4Bn+IxnxQJa41GvGAvg2pHUo=;
 b=wypGM/Sf6QDidpinJcsOgBV3n4OJ+udQJKWhNcW5mW0+HnsAVCsYlTmlTNye7dOAFt
 Vx+Wlb1EMDGYSSbG1eb11BP1Y3qJOxz8mq3H7GdPUPHs4SkcRYCdVyXo5tgXzpTnm4TL
 lsRIWjSLwkHBnPtmN9XnYceW+qGwJbN8acHQ72DHa8YRiiLkDf4IajMVzh0ICw6ODtGA
 fJ+0FPrRemh9PRURdc/pwyKZToTJnfiFrkj/2/2h3/bIku4iXH2zf8XL+9KMP/nEuGGo
 KGYe2MuDICD3f6U5uwTSJUtI7qgk8FK2yoSiN7y2ld/A4Y80NCg94Ca3Xk0Fq5oNXL9u
 uIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZcNjNR9eap06LKLBmYe4Bn+IxnxQJa41GvGAvg2pHUo=;
 b=ttu0+ZmcnLFMaoIyibRVG2nR+u+RzOkoiT28b5VV/DR5BR3reArkViVkd2faLjvB2c
 pQjCCAFxri85JN2xnWbeAvy7sWpKTc4p+LN1JSoPdxOqDoNsxZx376fZth9p7j8+9pz4
 d2IKZOblz8g07i7xKQQXf0o8ZVg+WXtZBiRxqEN4+/xDEHqUP6FjIZW3wvzzWfa+qiSp
 fIxtQYTVDFtpmPY5QMxa/HSEPH1ppdCNOvnCPrEVsGXvc50Rg4FmZ0wggd0WsMsm2PDj
 BtItgSzeZWL1NjfE3UfiY8HvN2qCBDn6D9JSgI1zS+IUhwHN/BoxaA1ymCYGHr7jDpOD
 espQ==
X-Gm-Message-State: ANhLgQ0G2V0nCKwQ2v2tOuJYLcgJV2f2suFOgAE5y/1dQXwIT2goSF6r
 Wg3s7sfwLeKThNRkCMQyQpCx7gBw8V7m0Q==
X-Google-Smtp-Source: ADFU+vvva4bHtyoXKpEMnmYH5AvGg9vla+sal5g4PwgWDeli6nHCQocQ6ABV1JODStdxy4jxHqMSiA==
X-Received: by 2002:aa7:8426:: with SMTP id q6mr5387748pfn.221.1583262217581; 
 Tue, 03 Mar 2020 11:03:37 -0800 (PST)
Received: from omlet.com ([2605:6000:1026:c273::faf])
 by smtp.gmail.com with ESMTPSA id x3sm8034pjq.5.2020.03.03.11.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 11:03:36 -0800 (PST)
From: Jason Ekstrand <jason@jlekstrand.net>
To: 
Subject: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files (v3)
Date: Tue,  3 Mar 2020 13:03:16 -0600
Message-Id: <20200303190318.522103-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226180937.106875-1-jason@jlekstrand.net>
References: <20200226180937.106875-1-jason@jlekstrand.net>
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/dma-buf/dma-buf.c    | 164 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  13 ++-
 2 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..2c4608bae3c2 100644
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
@@ -348,6 +349,163 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return ret;
 }
 
+/* This function takes a ref to add_fence on success.  The caller still
+ * owns its ref and has to dma_fence_put it.
+ */
+static struct dma_fence *dma_buf_get_unified_fence(struct dma_buf *dmabuf,
+						   struct dma_fence *add_fence)
+{
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *array;
+	unsigned i, num_fences = 0;
+	int ret;
+
+	ret = dma_resv_get_fences_rcu(dmabuf->resv, NULL,
+				      &num_fences, &fences);
+	if (ret)
+		return NULL; /* ret can only be 0 or -ENOMEM */
+
+	if (num_fences == 0) {
+		if (add_fence) {
+			return add_fence;
+		} else {
+			return dma_fence_get_stub();
+		}
+	} else if (num_fences == 1 && (!add_fence || add_fence == fences[0])) {
+		struct dma_fence *fence = fences[0];
+		kfree(fences);
+		return fence;
+	}
+
+	if (add_fence) {
+		struct dma_fence **nfences;
+		size_t sz;
+
+		/* Get a ref to add_fence so that we have a ref to every
+		 * fence we are going to put in the array.
+		 */
+		dma_fence_get(add_fence);
+
+		sz = (num_fences + 1) * sizeof(*fences);
+		nfences = krealloc(fences, sz, GFP_NOWAIT | __GFP_NOWARN);
+		if (!nfences)
+			goto err_put_fences;
+
+		nfences[num_fences++] = add_fence;
+	}
+
+	array = dma_fence_array_create(num_fences, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (!array)
+		goto err_put_fences;
+
+	/* The fence array now owns fences_arr and our references to each
+	 * of the individual fences.  We only own a reference to the one
+	 * array fence.
+	 */
+
+	return &array->base;
+
+err_put_fences:
+	for (i = 0; i < num_fences; i++)
+		dma_fence_put(fences[0]);
+	dma_fence_put(add_fence);
+	kfree(fences);
+	return NULL;
+}
+
+static long dma_buf_wait_sync_file(struct dma_buf *dmabuf,
+				   const void __user *user_data)
+{
+	struct dma_buf_sync_file arg;
+	struct dma_fence *fence, *unified_fence;
+	int ret = 0;
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
+	dma_resv_lock(dmabuf->resv, NULL);
+
+	if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
+		unified_fence = dma_buf_get_unified_fence(dmabuf, fence);
+		if (unified_fence)
+			dma_resv_add_excl_fence(dmabuf->resv, fence);
+		else
+			ret = -ENOMEM;
+	} else {
+		dma_resv_add_shared_fence(dmabuf->resv, fence);
+	}
+
+	dma_resv_unlock(dmabuf->resv);
+
+	dma_fence_put(fence);
+
+	return ret;
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
+		fence = dma_buf_get_unified_fence(dmabuf, NULL);
+		if (!fence) {
+			ret = -ENOMEM;
+			goto err_put_fd;
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
@@ -390,6 +548,12 @@ static long dma_buf_ioctl(struct file *file,
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
index dbc7092e04b5..86e07acca90c 100644
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
+#define DMA_BUF_IOCTL_SIGNAL_SYNC_FILE	_IOWR(DMA_BUF_BASE, 3, struct dma_buf_sync)
 
 #endif
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
