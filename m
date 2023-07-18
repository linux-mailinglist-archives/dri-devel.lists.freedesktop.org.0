Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BABEB757701
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092CD10E300;
	Tue, 18 Jul 2023 08:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01F910E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689670019; x=1721206019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VBDSDrMzkUOfhSe9ZcFP2Hr+jGGs8FvQAYuqRh7Sfbw=;
 b=hv0hYY/oy8Vg5xfjQ73J0gV3siJingSv/LJUKn3PGvxEI2z0+20NTrBS
 J69XRMKZ8/X5tIMCEo26WQuFS390r5qVuunbXCjY9/cq1mhnjhUMRVvBR
 /kjfN8soZrS71lfoCfZ5EWJaQcbJROP+fsoXPqoQP68Tbsqt5nvHYMv1+
 OixLygaWiNobcYA7aJPoaqJIeJdZJ4nZT4iXZ5FZAq0DaE1SCR5TeNoPR
 42kNjK6FMtIZf0VOH3gI/xQ3Mz6jW9O1uLUbYPg8KJQbfrY3qjCbmAmAc
 1E5zeyvvZxN53Jk7un1S9qlDV9XIV+HY1yHi+EUxyQW6P918S3w6XPXAK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="366191283"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="366191283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723532666"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="723532666"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:46:58 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v2 0/2] udmabuf: Add back support for mapping hugetlb pages
 (v2)
Date: Tue, 18 Jul 2023 01:26:03 -0700
Message-Id: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
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

The first patch ensures that the mappings needed for handling mmap
operation would be managed by using the pfn instead of struct page.
The second patch restores support for mapping hugetlb pages where
subpages of a hugepage are not directly used anymore (main reason
for revert) and instead the hugetlb pages and the relevant offsets
are used to populate the scatterlist for dma-buf export and for
mmap operation.

Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500 options
were passed to the Host kernel and Qemu was launched with these
relevant options: qemu-system-x86_64 -m 4096m....
-device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
-display gtk,gl=on
-object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
-machine memory-backend=mem1

Replacing -display gtk,gl=on with -display gtk,gl=off above would
exercise the mmap handler.

v2: Updated the second patch to manually populate the scatterlist

Cc: David Hildenbrand <david@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>`
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Vivek Kasireddy (2):
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages (v2)

 drivers/dma-buf/udmabuf.c | 92 ++++++++++++++++++++++++++++++++-------
 1 file changed, 76 insertions(+), 16 deletions(-)

-- 
2.39.2

