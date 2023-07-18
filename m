Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1747576FF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DA610E189;
	Tue, 18 Jul 2023 08:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C041E10E300
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689670019; x=1721206019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBC94lrie8PzdotV65iT7IktTjrsFKLJMPmD1wjnkfY=;
 b=ZChVBoXipFuj99wKItZQubC5hAzPVcst43QGzc/PuV2uGmyNjor6r25V
 qlF+xclCB5OjCvZm613WTTk1ywTJdYthRMOk8GodzoCNU9JjlWDT2mEro
 1aokg1+sIqifcFshH8C3eW2pyZWMSwHyPusAD0FHA0b3gmqv+iNxyG7xF
 98SKPi4/x2Tyrij5pNUE11x4vMEPvWPxpphn8xrboKvSkWuKlt6Fae0Al
 46PoE1gm1O7rR9ooox2v0oXL1A/yqIptTYiOEVzIT6V4UN7zjsOdt8nbz
 LnHuGSWf/3m2V3NK8Y/+Zre0qQ/1vVk2dSlPzXjXqU3dL709JmGaz9PYA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="366191290"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="366191290"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723532670"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="723532670"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:46:58 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/2] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling
 mmap
Date: Tue, 18 Jul 2023 01:26:04 -0700
Message-Id: <20230718082605.1570740-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
References: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add VM_PFNMAP to vm_flags in the mmap handler to ensure that
the mappings would be managed without using struct page.

And, in the vm_fault handler, use vmf_insert_pfn to share the
page's pfn to userspace instead of directly sharing the page
(via struct page *).

Cc: David Hildenbrand <david@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: David Hildenbrand <david@redhat.com>
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
2.39.2

