Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F139A5F6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BBD6F4D2;
	Thu,  3 Jun 2021 16:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A756F4CB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 16:41:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f2so6491228wri.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2pe98/RoIUXzCDVRxl/xmCe1bCIiBUSFO5AAZsF4X4c=;
 b=W/cifPT7EZpt/9vHjGmYsuK0ro0zZT5FXpJklAznprHaeGKtvd6DvYDbQyzXHbdN3f
 p59wmn8/1vb+mfedSCf/Bryu9KWJcYmBZY4voTMuw55dIiic7YOsv2Grycgo6Ts8ggUx
 ZHAb0SaYd0CS0dvzPGL5P+J66BP4M0pYsm4bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2pe98/RoIUXzCDVRxl/xmCe1bCIiBUSFO5AAZsF4X4c=;
 b=CCEdqAF6tMPBpmnFi4q4c0YbRE7i0lN81n+0qR8JQYnh/z8iFNWu181MSrdZA8b/uI
 gepzGL5nG1U8bgZO4EeNYkf/B+uD5XirNnTc/OX4mKkkEScN1XZzncXfwheTMR+M/6Wf
 FlSLfzgS2iN96neChfclFHIz/iOoSCdwiXgQenKkyMQSP6Cg36fvEPFw1ARPJFSRsNtS
 +MbhchNCXBnW+WX4HHG401eiANCjZ8z2I9PYVIfAt9BWjPbS0oV4R6s3OEowfjSOu0H5
 1M+dok6KLzGBU3i2F+jb8pHXYiosPv8VqjBTUohpFKar+DNsH49f2xsLz8z14HQzjwtU
 zbBw==
X-Gm-Message-State: AOAM532jZ5xPAfGbU63A2RKVROp/awFye8Tp+wx0jnOZVNHseeeN3TrC
 xXY/pSHvHfVGevMh7oFmTZgHDg==
X-Google-Smtp-Source: ABdhPJzD/tlT71a+Zy3mCWcZmzUDwV8s7qYZLAtIZrQu7z9kQ184iUhM7haFAqZ1h4a5geonxQ7OFg==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr816579wro.187.1622738479941; 
 Thu, 03 Jun 2021 09:41:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s28sm4992683wra.54.2021.06.03.09.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:41:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/4] dma-buf: Require VM_PFNMAP vma for mmap
Date: Thu,  3 Jun 2021 18:41:10 +0200
Message-Id: <20210603164113.1433476-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210603164113.1433476-1-daniel.vetter@ffwll.ch>
References: <20210603164113.1433476-1-daniel.vetter@ffwll.ch>
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
index eadd1eaa2fb5..dda583fb1f03 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -127,6 +127,7 @@ static struct file_system_type dma_buf_fs_type = {
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
+	int ret;
 
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
@@ -142,7 +143,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
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
@@ -1244,6 +1249,8 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
+	int ret;
+
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1264,7 +1271,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
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
2.31.0

