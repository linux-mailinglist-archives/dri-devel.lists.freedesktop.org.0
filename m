Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76F634233
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 18:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6520C10E41F;
	Tue, 22 Nov 2022 17:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BAD10E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 17:08:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b12so11899730wrn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ve9qToTAjko4Xn5/rlkROCfUSo37Rgk78oiOnmwUwAU=;
 b=UTgjIRpLOL/7otFlPM7wX91GWVEbyelUoIOfxeC6ZhL8WuxwL4Nb7rXb4HD1EytWRF
 fM6S4/NXWz/8WrAreoT9cPW/bjXslVl/BKUmEg5pyx6M4Uaclx3FjX7vn4vXq8ig0wzL
 rCBB7/W7XRNLC+tcLw3TAl4no/GdXkQLmuKTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ve9qToTAjko4Xn5/rlkROCfUSo37Rgk78oiOnmwUwAU=;
 b=5g5LhTIM2ZM1IEFyaqQ5128Fd5ArWqmLgijbMoyDJESgdlIem/y5ziTD3HJmP7UXAw
 NR/wymWr3kRkpa9GtQsLTe8mWGThvfc0ZNIB1/94cBXQZUYtxeAxf21IaqtkDzjAi+Il
 i379FWuuTMAqjd3j4XdheVhPgsphi46bt1BfPimhugWNw7eTAmPGrFwwA5hoagdO/Qix
 XvA0CziNJGgUaTBoquGqXjun7z0POUlHmMxqnJn3d+BHDbbnXwWuoO3RpLxuHFYfE+Py
 B0+d4vN4P7j97DymS+7kZYdhOCqt8YkXotEiWvXKipRK7LonCFPHq1TRrB0N60TktAp2
 0ZNQ==
X-Gm-Message-State: ANoB5pkTYY9SiAxQo+k0PVwlUCArQfRFvzsa10P06rRE4kCcc/jRRwn1
 Q8AK5Ogvch4uF/m3YZe0iEAYR7xU+QUK2g==
X-Google-Smtp-Source: AA0mqf74IZLJygrpyRzf5qHhhvP3A1tbMBtTE6ln+kXNQdMnkp0LHZho99MMNt+23oEZ2UGDXNYLyA==
X-Received: by 2002:a5d:6547:0:b0:241:e4cc:f044 with SMTP id
 z7-20020a5d6547000000b00241e4ccf044mr2164424wrv.457.1669136884287; 
 Tue, 22 Nov 2022 09:08:04 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 m42-20020a05600c3b2a00b003cf47556f21sm24861760wms.2.2022.11.22.09.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 09:08:03 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Date: Tue, 22 Nov 2022 18:08:00 +0100
Message-Id: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 John Stultz <john.stultz@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Ok I entirely forgot about this patch but stumbled over it and checked
what's up with it no. I think it's ready now for merging:
- shmem helper patches to fix up vgem landed
- ttm has been fixed since a while
- I don't think we've had any other open issues

Time to lock down this uapi contract for real?
-Daniel
---
 drivers/dma-buf/dma-buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b6c36914e7c6..88718665c3c3 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -150,6 +150,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	ret = dmabuf->ops->mmap(dmabuf, vma);
 	dma_resv_unlock(dmabuf->resv);
 
+	WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
+
 	return ret;
 }
 
@@ -1495,6 +1497,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	ret = dmabuf->ops->mmap(dmabuf, vma);
 	dma_resv_unlock(dmabuf->resv);
 
+	WARN_ON_ONCE(!(vma->vm_flags & VM_PFNMAP));
+
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
-- 
2.37.2

