Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49733CCD3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 06:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8226E6E1F5;
	Tue, 16 Mar 2021 05:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DCE6E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 05:01:37 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id z9so11562354iln.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 22:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=074iEiZZhKRUAMbXMplvFHK8p3PMtccyfos3PpqzgSQ=;
 b=JskXgfao01yeqFoAau01czUE504gmlXn+ZlCSzxKzajWkGgxhu9MfqnvUFGX0ELMNQ
 WIDYk8FREfhHUYD1H1RVXF9nRXu9jsevD9InS9PTjch03bAHRAAjsziZo2CGcxtN5boh
 uNu9rVLCh7Q/xSl5i2SGrDOh2kxmAixDy+5Va4SFfTM5St1mybqF3BSK/AZFoWSkPEXz
 lIcwwCI4w2aFRDr/7e7vQ4z9UXwY/Qj/1/BxnPfvuENS4pTs/6FwXwGTHVj8s2/fPQQh
 /WLv5pDnzqeFNBpToxIr/XOCOi05pk+9XoExKE1Pux2dcOAfpBQov4gnRDu2IqwIkXiS
 VxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=074iEiZZhKRUAMbXMplvFHK8p3PMtccyfos3PpqzgSQ=;
 b=nVRi/48pT30a2kdBvABPCDEbnFFLz8CG1bngWdhyJECIII2GfFovdM2SV8b+GxENfh
 6FMEDXOJKL2auPGUVik4zgwCy6ywP/JAhRW8cO3k6q2zLgxlcqZJBBAx6tB7TpFtltCa
 aX5UOb7+EvFuf3qMc9FnsYMwp0kIdShsDBqttRcROd3TwyJgV2YdMucxVZW3SEmNRPkF
 qLOrBRnWYvc/+0Ef2dUKE4/WMQnYEI2Iu3uKr3BmVVsuQ0EzbFxyu9xCaUtz+yfeX5h9
 YDtrEzux0k4lIZVdH6Qi8atqhnqEyPxbrUZ9Yi0SB6XIW6JHkwQeD3ppCk4EA7ptx8Lj
 10oQ==
X-Gm-Message-State: AOAM532VLeofdlMiZlO4Nv2rKjOUaM2SEb7I8/TLtS19inOudY2jfuDA
 8/zahbq/09PRqzIQ8dY4mc37RqH8FgPzgg==
X-Google-Smtp-Source: ABdhPJypW6vJltLP8xEen1ngwqRXtv0/bxLpS8RmvOISuHhFQO6OCgMDQgOQIsMChOdhSEHz800BGA==
X-Received: by 2002:a63:d618:: with SMTP id q24mr2201565pgg.283.1615870412753; 
 Mon, 15 Mar 2021 21:53:32 -0700 (PDT)
Received: from omlet.com (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id w128sm15147785pfw.86.2021.03.15.21.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 21:53:32 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] dma-buf: Add an API for exporting sync files (v7)
Date: Mon, 15 Mar 2021 23:53:22 -0500
Message-Id: <20210316045322.2020294-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316045322.2020294-1-jason@jlekstrand.net>
References: <20210315210453.1667925-1-jason@jlekstrand.net>
 <20210316045322.2020294-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/dma-buf/dma-buf.c    | 58 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  6 ++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383eb..69200d019ac90 100644
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
@@ -362,6 +363,60 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	return ret;
 }
 
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
+		ret = dma_resv_get_singleton_rcu(dmabuf->resv, &fence);
+		if (ret)
+			goto err_put_fd;
+	} else if (arg.flags & DMA_BUF_SYNC_READ) {
+		fence = dma_resv_get_excl_rcu(dmabuf->resv);
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
@@ -405,6 +460,9 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
+	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
+		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 7f30393b92c3b..9bce1e8bd31d3 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -37,6 +37,11 @@ struct dma_buf_sync {
 
 #define DMA_BUF_NAME_LEN	32
 
+struct dma_buf_sync_file {
+	__u32 flags;
+	__s32 fd;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -46,5 +51,6 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
+#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
 
 #endif
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
