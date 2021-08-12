Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4553EA547
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 15:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE066E3FC;
	Thu, 12 Aug 2021 13:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38696E3F7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:14:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso4547794wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmErGBV7VXck18Gc2qFrnojMPrzyI2EPrDXNv3U1XmY=;
 b=CYOg+LUjp256t2um90jzwNbIMAWQqkmOEyFN5EaBp2h4O1nKvX8H8o+CpGJVu0cvra
 Bi59H593zFqTO0Tjipd0y7gxXb6Ue/uv7MOnvMvMSbigvqtdo3oKpION6K2wkaAQM/Ot
 psaWaQkhb4+YONaercPJtRtGxTcp9kDY4zUv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmErGBV7VXck18Gc2qFrnojMPrzyI2EPrDXNv3U1XmY=;
 b=C+fi/U0KccTGFpSmLC1+P9yYQFpRomaHnVHlM4ZNgGp5uID3BoEBuYgSg3IkIOJbHd
 VH6HCr/Ny7n1+wGj+C5ooyZFKbHJs5qPg3IoD/qZaI59TzEfbvIZWt1MfkB10wNMt5Q9
 CaX3ibIDTeYXo29OcOELkoP897h6Al+u2PmK4Gtvy/U1tmMqHEC0qcOB7wIuTg4Wm1Hi
 ycyO331Xt6wt7zYPuxYd6RgstB0fpgrtJM2cAA9sqe2LwsJl0Uqf4yfDnYnEsF7JIUj6
 D7AOmWgdnlr8eK8ZeNOfaSaAYrmwYSK0ePGGCpGlaGEk/CnsteV0TxMAfj6rwCs0MDhY
 djrw==
X-Gm-Message-State: AOAM531ZMUA0VrKkE7PwDNEVy2GiXirKKGCs0a2nr9kKpauVu8byfdHJ
 P1YqcNnFr9OR/HdMR3ivJnpzu+/JSw4BAw==
X-Google-Smtp-Source: ABdhPJwkvxrgUNLDCUG2WS460z2SKSCQl05C+7mRo54qZ58QNtO0XiYEVEgB1vN4eNSqQUwqOsYJGA==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr15899917wmh.150.1628774059127; 
 Thu, 12 Aug 2021 06:14:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h4sm2914957wru.2.2021.08.12.06.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:14:18 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Suren Baghdasaryan <surenb@google.com>,
 Matthew Wilcox <willy@infradead.org>, John Stultz <john.stultz@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/4] dma-buf: Require VM_PFNMAP vma for mmap
Date: Thu, 12 Aug 2021 15:14:09 +0200
Message-Id: <20210812131412.2487363-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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

v3: Change to WARN_ON_ONCE (Thomas Zimmermann)

References: https://lore.kernel.org/lkml/CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com/
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
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
Resending this so I can test the next patches for vgem/shmem in
intel-gfx-ci.

No immediate plans to merge this patch here since ttm isn't addressed
yet (and there we have the hugepte issue, for which I don't think we
have a clear consensus yet).
-Daniel
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 63d32261b63f..d19b1cf6c34f 100644
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
+	WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
+
+	return ret;
 }
 
 static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
@@ -1260,6 +1265,8 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
+	int ret;
+
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1280,7 +1287,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	return dmabuf->ops->mmap(dmabuf, vma);
+	ret = dmabuf->ops->mmap(dmabuf, vma);
+
+	WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_buf_mmap);
 
-- 
2.32.0

