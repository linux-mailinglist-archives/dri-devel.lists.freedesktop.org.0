Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5083C783B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 22:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9637B6E139;
	Tue, 13 Jul 2021 20:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833C66E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 20:52:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a13so354680wrf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tb13L7U9dTCD6g70T53HTt4Zdsesm4ZnXBpaSFPW13w=;
 b=ZE05Y12a7V5jfYf3M4rfGrmXtIbZkpaEOKqRwBvqpdF6WVgvHYgmOlxZb0TrIWbDJg
 zJtba0xVTVEKWit7yauEX7Ll2j35Ys5tdQJsIFxi9ZsZiEHk2Byz55TIwiePzaPcddw0
 2Q5Tyc2jB7dne2ntzJAvdaLzFnvt6NyLoLavw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tb13L7U9dTCD6g70T53HTt4Zdsesm4ZnXBpaSFPW13w=;
 b=qoDbklLQc3hvQ24AH0ihg5htErVplfUXoXwyS46p2ObqOOOV/X7PmAdiMg2yUHFaMF
 Wtly56sHOP/DWbwlo8yf5rMtcSvrIKG4QXg2h0RzamSVsmxdgtcVMnYPO48/L5bbGQgP
 gKlrgjesZ6UOYXPi8RgXsN4hdWpGRwMBQ1D6GvP8WH5Jc0Yphv2qnFMhqtXB/io3CMgQ
 UHwV7m8e7UlHGFE+7cajMHwvPKRdLEyc7QlYntD4sm47keR7DkT0KRfZ7ZsXR9uA0Sdy
 cQghMlZ7tV5t5CEjZvc8dBkdr52AEvKzm83YL+l1ebuZpG3yiGpnb1FLCkW/LSN1qv2w
 fwGA==
X-Gm-Message-State: AOAM533abSihAbULhi9x17d2KO0EaOSx8hK90lENxl/FdxGQYCXc/q9y
 8iYGcBwccxjunvsvxkmBK0iPZQ==
X-Google-Smtp-Source: ABdhPJxGX+4VmTvtDaSQVeWu7iGnr3LK8JR8WmSYlC0KYNHOE/Vk7imGwykovjH8SkAWboZLaVyy7Q==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr8165252wrt.132.1626209520157; 
 Tue, 13 Jul 2021 13:52:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j10sm18642249wrt.35.2021.07.13.13.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 13:51:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 1/4] dma-buf: Require VM_PFNMAP vma for mmap
Date: Tue, 13 Jul 2021 22:51:50 +0200
Message-Id: <20210713205153.1896059-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
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
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tldr; DMA buffers aren't normal memory, expecting that you can use
them like that (like calling get_user_pages works, or that they're
accounting like any other normal memory) cannot be guaranteed.

Since some userspace only runs on integrated devices, where all
buffers are actually all resident system memory, there's a huge
temptation to assume that a struct page is always present and useable
like for any more pagecache backed mmap. This has the potential to
result in a uapi nightmare.

To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
blocks get_user_pages and all the other struct page based
infrastructure for everyone. In spirit this is the uapi counterpart to
the kernel-internal CONFIG_DMABUF_DEBUG.

Motivated by a recent patch which wanted to swich the system dma-buf
heap to vm_insert_page instead of vm_insert_pfn.

v2:

Jason brought up that we also want to guarantee that all ptes have the
pte_special flag set, to catch fast get_user_pages (on architectures
that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.

From auditing the various functions to insert pfn pte entires
(vm_insert_pfn_prot, remap_pfn_range and all it's callers like
dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
this should be the correct flag to check for.

References: https://lore.kernel.org/lkml/CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com/
Acked-by: Christian König <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
--
Resending this so I can test the next two patches for vgem/shmem in
intel-gfx-ci. Last round failed somehow, but I can't repro that at all
locally here.

No immediate plans to merge this patch here since ttm isn't addressed
yet (and there we have the hugepte issue, for which I don't think we
have a clear consensus yet).
-Daniel
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 510b42771974..65cbd7f0f16a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -130,6 +130,7 @@ static struct file_system_type dma_buf_fs_type = {
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
+	int ret;
 
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
@@ -145,7 +146,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+
+	WARN_ON(!(vma->vm_flags & VM_PFNMAP));
+
+	return ret;
 }
 
 static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
@@ -1276,6 +1281,8 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
+	int ret;
+
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1296,7 +1303,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+
+	WARN_ON(!(vma->vm_flags & VM_PFNMAP));
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_buf_mmap);
 
-- 
2.32.0

