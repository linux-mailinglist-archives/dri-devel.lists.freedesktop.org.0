Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9E38B671
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71C86F4D0;
	Thu, 20 May 2021 19:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B936F4E2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:00:21 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id v14so9787705pgi.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EijqU4vKaEwOanah8sEhHunOk/n8wpvfzSKHsUrLRyg=;
 b=LHDvajHgGhgzHxkawyun0RowBsMW4UP+EvJv+tPoi6Nwsybldqe4GZU46HAOCyvC+Z
 s1ArQJpNfiiGFQUVtCfll5uh7+Jf9hpbURT2xaM9XiJyrrHXXGqMkxzEmag/Ss5i7zGI
 KEPPHwClRlyb20AIp7P6zBcEIneu82RKPzNTmkmJK7ELOxs8302Tzg7SYfspDwb8KM1+
 aIU5fSjI+21R5qOJFXtl6gv1GD6Pby7Og350YYQC6H+HV4Kp3rBF1EE/z9DB6yKHk1vK
 WayOiIFqJvVjB9FMKrx7If4bWv/pbTxIVw9sxxVorZ2OyedC+coB89g0eIDzFLuf8q3F
 WKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EijqU4vKaEwOanah8sEhHunOk/n8wpvfzSKHsUrLRyg=;
 b=JWYgoQHf+pyBWu8+1YOCS9mAr1sMLPqo4I0x4rzbI40I8e5AVzOSM7rqYQE7qAJNqd
 /+HzN0I6k57HdQSCgWE/zO+qu7XMNbiM54SUw1tKAEqfsZmGIjtvOG2BFMmd33OMSv0H
 zv0ASv8LnEzxwj6SG7fXQnhBrZsjJI3aZpm5o+YNLDaZ94gUAZbn2Z92Ht1TqC2etCXN
 NC7pXEPLL1NDvhmNxG+HwhxWXedeZnAnouvEiUuubKV1PdF+PRA2jbrpzSaWSU50FGR6
 250NL3mBgT3yEoLHe5l8c9Ar/RiPl4Ul9c2UbOHKLpkers5dxCYHJzgI7Zzm709DtUEl
 VYNw==
X-Gm-Message-State: AOAM532DvMjXTSQhJppMppKwNW+x6PabQPDKgZrxF42qNdjXkN7XPHgh
 ScNv0brzHXCU2TAG0b0RqhiQssF0qbUFVw==
X-Google-Smtp-Source: ABdhPJw5WPyzBomzvJhlgcDhNa+uJOUAgea7ZljG+7ROpcbjp8p5nwqwBmmtA4HCVyINnzM61a53ZA==
X-Received: by 2002:a62:e908:0:b029:2db:8791:c217 with SMTP id
 j8-20020a62e9080000b02902db8791c217mr5941561pfh.28.1621537220231; 
 Thu, 20 May 2021 12:00:20 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id v2sm2455072pfm.134.2021.05.20.12.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:00:19 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
Date: Thu, 20 May 2021 14:00:07 -0500
Message-Id: <20210520190007.534046-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190007.534046-1-jason@jlekstrand.net>
References: <20210520190007.534046-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
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

v5 (Jason Ekstrand):
 - Split import and export into separate patches
 - New commit message

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/dma-buf/dma-buf.c    | 32 ++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 7679562b57bfc..c9d6b9195c00c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -417,6 +417,36 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
 	put_unused_fd(fd);
 	return ret;
 }
+
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
+	if (arg.flags != DMA_BUF_SYNC_RW)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(arg.fd);
+	if (!fence)
+		return -EINVAL;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+
+	ret = dma_resv_get_singleton_rcu(dmabuf->resv, fence, &singleton);
+	if (!ret && singleton)
+		dma_resv_add_excl_fence(dmabuf->resv, singleton);
+
+	dma_resv_unlock(dmabuf->resv);
+
+	dma_fence_put(fence);
+
+	return ret;
+}
 #endif
 
 static long dma_buf_ioctl(struct file *file,
@@ -465,6 +495,8 @@ static long dma_buf_ioctl(struct file *file,
 #if IS_ENABLED(CONFIG_SYNC_FILE)
 	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
 		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
+		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
 	default:
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index f902cadcbdb56..75fdde4800267 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -70,5 +70,6 @@ struct dma_buf_sync_file {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
+#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_sync)
 
 #endif
-- 
2.31.1

