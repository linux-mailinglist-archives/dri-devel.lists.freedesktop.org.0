Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C8038F4A4
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B456E954;
	Mon, 24 May 2021 21:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6716E969
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:00:14 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so11897917pjv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 14:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hBjE51hh2X0XrOm9Ij4dQRpJSOYOJDHQ8jk5rVcWn2c=;
 b=jPcDhXBkyo544B+2zdtAFvZ3CIVqPcWwJQSBCGOrcTHzZp6xT3wGx4wZCmpB6bf8dd
 O8lfQ6f58dBuSfDVSi+fjrFf73IbZSJTO+wR88PiK+WMQjZJdHCqYp5Fa7GXf+AnIeo9
 Jj7I1jtBnIcPMLkIF8wWOvE+5eYZbn2c8K8ToBlkVT8vcPfEv1WF0tqHhkQRu4GboM7g
 9ZOLKy8gY9bBAJwrJ7xRkHNt9Y0eWajrcBtbKaIXQ7m89g1ydtsGWcsVTfVjYZ9pBQ3Y
 pilkvDgXg08o0A0dCt25wpD9mx0QqE+yJaJQv9ZQ959pivazNloKDpYkP8cuOJJAlHSZ
 8LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBjE51hh2X0XrOm9Ij4dQRpJSOYOJDHQ8jk5rVcWn2c=;
 b=d5G7ZaLi2jkX+SHVhwm2IE9Q+VywuEhkTGSh5bEKuuutnTVcpZPFTXeMYTnS9ig/oa
 ysFtrpJpY3pGPFH7LiGTPpJ5se7KbMiWr+M5RPYm0myjcG9UoODZQVx1pVA6UGVnbw+g
 vyFiif3VTh45yVgLqvjpFzDdkx6Xo/5LEAoJoKlSlOV9beMfY7KANKFpAXUPDaVlwnVg
 Bngy67XHjh0EuFQMW7YRd1bgpndZdnErc0YkA2DwIG2i8n/ZshnWNdF/DN/Aci9+PMKX
 tT+SWH20ReSYZWNthyZ87nSujWrAHeji9cksCpZzgJaEyAzpEbyAsU2E+ZzPSGhE2uc9
 oTZQ==
X-Gm-Message-State: AOAM5318vTnqOzdqjO6dzLWv8+r1CImZx4I8I4kEmi8d6eNghj6Ghvw1
 gjRo528nAnZ8scPNb2tbupMVq9GxoMYqPQ==
X-Google-Smtp-Source: ABdhPJxvkek8tGOq0xUm26RVjD24qGdZlePaFdm+JP9NR7F2k+OXj1wlI8wWv/URYfug+kL5t/JNrw==
X-Received: by 2002:a17:902:6905:b029:f0:d4b8:b90e with SMTP id
 j5-20020a1709026905b02900f0d4b8b90emr26968399plk.37.1621890013804; 
 Mon, 24 May 2021 14:00:13 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id c195sm12354958pfb.144.2021.05.24.14.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 14:00:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] RFC: dma-buf: Add an API for importing sync files (v6)
Date: Mon, 24 May 2021 15:59:54 -0500
Message-Id: <20210524205954.872814-7-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524205954.872814-1-jason@jlekstrand.net>
References: <20210524205954.872814-1-jason@jlekstrand.net>
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
 drivers/dma-buf/dma-buf.c    | 34 ++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f23d939e0e833..0a50c19dcf015 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -419,6 +419,38 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
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
+	singleton = dma_resv_get_singleton_unlocked(dmabuf->resv, fence);
+	if (IS_ERR(singleton))
+		ret = PTR_ERR(singleton);
+	else if (singleton)
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
@@ -467,6 +499,8 @@ static long dma_buf_ioctl(struct file *file,
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

