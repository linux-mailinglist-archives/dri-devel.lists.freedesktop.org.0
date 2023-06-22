Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BF739881
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559EC10E4E8;
	Thu, 22 Jun 2023 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787A810E4EE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687420384; x=1718956384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uDBd4/YsqUQQDyHVrKGd5PdP5Z3CATu2lZahmmVGji8=;
 b=RbqG0eTA5uCiLSm83fd87sgp8k/oyiWzr2A+PnMZdCH5BGrE3PiVGZDe
 d6E/A/ElS/W9SYuCmX1xP/8JigG67FLx2dLpL7X0mgKGjxJdf/WMWzFd7
 PyZtNCrHX8RzmDgk1hBTpQPiSB5913AwTdiYvyIOuVf+Vl2ZWBoe7rGrA
 KnK6CiaSveE9fwULgugBQrXkS2KzSz5ANfLXS1djsiQTdn/vxyz69nk96
 +Y5cME+nsmpboMdN6IZ4cQOS3MLL/tq4jWuOzeVSHzOUOBn6XGU3br2af
 nd/tOwHj6DgotOnNMkjPj4BKxsfiqbFKPu56yJdNg2gH9JjA1gGeHRnUB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357910357"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="357910357"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784801072"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="784801072"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:52:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 1/2] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling
 mmap
Date: Thu, 22 Jun 2023 00:27:09 -0700
Message-Id: <20230622072710.3707315-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Michal Hocko <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add VM_PFNMAP to vm_flags in the mmap handler to ensure that
the mappings would be managed without using struct page.

And, in the vm_fault handler, use vmf_insert_pfn to share the
page's pfn to userspace instead of directly sharing the page
(via struct page *).

Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: James Houghton <jthoughton@google.com>
Cc: Jerome Marchand <jmarchan@redhat.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 12cf6bb2e3ce..6de40c51d895 100644
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
@@ -58,6 +59,7 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 
 	vma->vm_ops = &udmabuf_vm_ops;
 	vma->vm_private_data = ubuf;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	return 0;
 }
 
-- 
2.39.2

