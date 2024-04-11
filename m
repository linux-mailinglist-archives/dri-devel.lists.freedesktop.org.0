Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693268A09B8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D31210EF64;
	Thu, 11 Apr 2024 07:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn11pwhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AC210EF09
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712820381; x=1744356381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4juM3xfivhaGo2McCt1eiAUdmharbNFcAc8goqvqufM=;
 b=Nn11pwhMCqEOrhXqlae2COPZ0P6NaEPT+SARW2bKyRTEN6FIsN+/IriE
 cG4C3fZbU0Tp2Dvhoi0DUs2qaNZyawCHazrM3o4Kwt2qpO4+zlessH0SW
 Lbo2ycwLZcVeXsKpinydIJiYyY1HBa63R8ifkVQL2WQrsK/GhRKXGukLP
 J6pcwzNWEx6wCtRG9SUYjCkV0dzumGeNQVuX3a58RNCpTZ3VIK9oBi6ld
 Aqgf+OzsLFMTG3+FlFRRXs6xhNYm7g7AWEVO4K+d9fAe61YTk441ks1u2
 GbS/htcudKb0+LwQjeHhwwSWBtgzfTw/vxEXP5oTRbngp8oPhxfYiz8eC A==;
X-CSE-ConnectionGUID: DePjmAIPR9eBbPXRtSsINg==
X-CSE-MsgGUID: hxvG6NyLTxCW3Pyf1exbuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8074364"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8074364"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 00:26:03 -0700
X-CSE-ConnectionGUID: HbYAmvT8SDy6an56H48FKw==
X-CSE-MsgGUID: laxu6XeDR0Cq6Dz9keXnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="20848543"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 00:26:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>
Subject: [PATCH v14 4/8] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for
 handling mmap
Date: Wed, 10 Apr 2024 23:59:40 -0700
Message-ID: <20240411070157.3318425-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
References: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add VM_PFNMAP to vm_flags in the mmap handler to ensure that
the mappings would be managed without using struct page.

And, in the vm_fault handler, use vmf_insert_pfn to share the
page's pfn to userspace instead of directly sharing the page
(via struct page *).

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c40645999648..820c993c8659 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -35,12 +35,13 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct udmabuf *ubuf = vma->vm_private_data;
 	pgoff_t pgoff = vmf->pgoff;
+	unsigned long pfn;
 
 	if (pgoff >= ubuf->pagecount)
 		return VM_FAULT_SIGBUS;
-	vmf->page = ubuf->pages[pgoff];
-	get_page(vmf->page);
-	return 0;
+
+	pfn = page_to_pfn(ubuf->pages[pgoff]);
+	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
 static const struct vm_operations_struct udmabuf_vm_ops = {
@@ -56,6 +57,7 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 
 	vma->vm_ops = &udmabuf_vm_ops;
 	vma->vm_private_data = ubuf;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	return 0;
 }
 
-- 
2.43.0

