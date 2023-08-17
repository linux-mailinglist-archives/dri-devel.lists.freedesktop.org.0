Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE177F0E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFC610E1AD;
	Thu, 17 Aug 2023 07:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69BA10E135
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692256062; x=1723792062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AYQerLR/X/IZ6Z/nENPeMrAhM6+yQUwckeympg8jWbw=;
 b=kfErd0qtBwNAOfzoSglJI7XogEPvvjCYqMRJMStIjS8Sc5WhpR0ySuie
 X8Z3nkVeojp3Qh8D3IMxJOSBpSgIqp/nfgjz0NJNNIGmW+NfgQ2gWihD1
 hCKPTYl3hzMv5c5mXt1wPYcfsVX878F9aduVD8lJHEqPy+zkNCNv1NOGO
 1uCHJ+tzvmAn7AJ6b1JpKJy5Eb9W+BBCLOxT5eXCJJf2j0cLcRCdilnd7
 16Nw96Xu4FIdQbPtXandgphtWA5TJbBoLIn/iMmjXLiX08wbyFfaUWWJe
 iizcpNo51Yi9/h1aCKmUli4ihaUtZKqtJ+WObjiFa0JzJEMXZyf/c7gY6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357697942"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="357697942"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799913423"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="799913423"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:07:41 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v3 0/2] udmabuf: Add back support for mapping hugetlb pages
 (v3)
Date: Wed, 16 Aug 2023 23:46:21 -0700
Message-Id: <20230817064623.3424348-1-vivek.kasireddy@intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
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

v2: Updated the second patch to manually populate the scatterlist.

v3: Replaced the fields offsets with subpgoff and hpoff with mapidx
    in the second patch. This should not cause any functional changes.

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>`
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Vivek Kasireddy (2):
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages (v3)

 drivers/dma-buf/udmabuf.c | 93 ++++++++++++++++++++++++++++++++-------
 1 file changed, 77 insertions(+), 16 deletions(-)

-- 
2.39.2

