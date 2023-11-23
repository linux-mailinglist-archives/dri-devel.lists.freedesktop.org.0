Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20E7F58D7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 08:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169FD10E6CE;
	Thu, 23 Nov 2023 07:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B132F10E6CE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700723307; x=1732259307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=59vrc5NDkw8wvYj2LEIRQerTqRUGFz+PrpmpY5i0pgo=;
 b=TBcf69CFdM+WL+F4doaC4/04+umemEv/y4wKUnmVsn4udIu39EGvENyX
 px7e1boFFbRnNyUMmVHo0VqnA6jMD9fHd7AvRtt2FltJj8GBTkMZVCW52
 oxE75KO0bAgctE6vrQYgWgNWECLTULNkWbQ8Lph8QdsPNK/mfer6ge6GG
 XBS3S4rDcZxCpMIFz4+EJLLz9MiKH+YeRsrbZhBnZO4qj6vh5oKVm8eln
 41WEQf6/WCfVFvHUGE5vqFWnXMzpoTmo/ziyDd0x2t2XhuAoWmLb4fiij
 h5LEZ/3mgmwmgNv/51+6H4S0BhkSje1gwhtItZ8hr7ZQxNG9QrZg57AOE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382612314"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="382612314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 23:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8757711"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 23:08:23 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v5 0/5] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v5)
Date: Wed, 22 Nov 2023 22:44:38 -0800
Message-Id: <20231123064443.1035709-1-vivek.kasireddy@intel.com>
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

The first two patches were previously reviewed but not yet merged.
These ones need to be merged first as the fourth patch depends on
the changes introduced in them and they also fix bugs seen in
very specific scenarios (running Qemu with hugetlb=on, blob=true
and rebooting guest VM).

The third patch introduces pin_user_pages_fd() API and the fourth
patch shows how the udmabuf driver can make use of it to
longterm-pin the the pages. The last patch adds two new udmabuf
selftests to verify data coherency after potential page migration.

v2:
- Updated the first patch to include review feedback from David and
  Jason. The main change in this series is the allocation of page
  in the case of hugetlbfs if it is not found in the page cache.

v3:
- Made changes to include review feedback from David to improve the
  comments and readability of code
- Enclosed the hugepage alloc code with #ifdef CONFIG_HUGETLB_PAGE

v4:
- Augmented the commit message of the udmabuf patch that uses
  pin_user_pages_fd()
- Added previously reviewed but unmerged udmabuf patches to this
  series

v5:
- Updated the patch that adds pin_user_pages_fd() to include feedback
  from David to handle simultaneous users trying to add a huge page
  to the mapping
- Replaced find_get_page_flags() with __filemap_get_folio() in the
  second and third patches to ensure that we only obtain head pages
  from the mapping

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Vivek Kasireddy (5):
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages (v4)
  mm/gup: Introduce pin_user_pages_fd() for pinning shmem/hugetlbfs file
    pages (v5)
  udmabuf: Pin the pages using pin_user_pages_fd() API (v3)
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     |  96 ++++++++---
 include/linux/mm.h                            |   2 +
 mm/gup.c                                      | 114 +++++++++++++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++++-
 4 files changed, 334 insertions(+), 29 deletions(-)

-- 
2.39.2

