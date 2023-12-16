Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1052815809
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 07:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD30D10E296;
	Sat, 16 Dec 2023 06:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F9F10E06F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702708135; x=1734244135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LAUQJgirBbVoAgA51mnGR2BuxxwiV8llGq6SORxHtq4=;
 b=JrJvITRCKnnl+K9rxQOnvkupOKgxY1sTntEQ7qDBQzC3LXPuS1xZe9RL
 NimNwm//A0pkyOYTbYmaipDcDh3VuUuSGrbsM1evE7TOjacVAvd+BR3O5
 QKHtN4mbjoieD17bjkk7a7mUe8sQZvljt4XX04og2rdWXBUu3/XNYgOUm
 u6qpjTbO/j2wT9/+nabyyhXRWBBR2FiLNMv0KyzndS/+P3HU6XG3SnE9c
 bpYtyvk/dcyUc53eh6aonr/MfdAOw4zUlQASU+K9Or/ZopxRZDRVTAHGy
 qYoboX1a3I4S/771ZJweO1ym6VHfEdeHras9pL0uVPv6OIe6UrVsHAc6l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2186004"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2186004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 22:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="751178895"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="751178895"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 22:28:54 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v8 0/6] mm/gup: Introduce memfd_pin_folios() for pinning memfd
 folios (v8)
Date: Fri, 15 Dec 2023 22:05:30 -0800
Message-Id: <20231216060536.3716466-1-vivek.kasireddy@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first two patches were previously reviewed but not yet merged.
These ones need to be merged first as the fourth patch depends on
the changes introduced in them and they also fix bugs seen in
very specific scenarios (running Qemu with hugetlb=on, blob=true
and rebooting guest VM).

The third patch introduces memfd_pin_folios() API and the fourth
patch converts udmabuf driver to use folios. The fifth patch shows
how the udmabuf driver can make use of the new API to longterm-pin
the folios. The last patch adds two new udmabuf selftests to verify
data coherency after potential page migration.

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

v6: (Christoph)
- Renamed the new API to memfd_pin_user_pages()
- Improved the page cache lookup efficiency by using
  filemap_get_folios_contig() which uses batches

v7:
- Rename the new API to memfd_pin_folios() and make it return folios
  and offsets (David)
- Added a new preparatory patch to this series to convert udmabuf
  driver to use folios

v8:
- Addressed review comments from Matthew in patches 4 and 5
- Included David's suggestions to have the caller of memfd_pin_folios()
  pass a range [stard, end], max_folios instead of start, nr_pages
- Ensured that a folio is pinned and unpinned only once (David)

This series is tested using following methods:
- Run the subtests added in the fifth patch
- Run Qemu (master) with the following options and a few additional
  patches to Spice:
  qemu-system-x86_64 -m 4096m....
  -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
  -spice port=3001,gl=on,disable-ticketing=on,preferred-codec=gstreamer:h264
  -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
  -machine memory-backend=mem1

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Vivek Kasireddy (6):
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages (v6)
  mm/gup: Introduce memfd_pin_folios() for pinning memfd folios (v8)
  udmabuf: Convert udmabuf driver to use folios (v2)
  udmabuf: Pin the pages using memfd_pin_folios() API (v6)
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     | 202 ++++++++++++------
 include/linux/memfd.h                         |   5 +
 include/linux/mm.h                            |   3 +
 mm/gup.c                                      | 149 +++++++++++++
 mm/memfd.c                                    |  34 +++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 ++++++++++++-
 6 files changed, 480 insertions(+), 64 deletions(-)

-- 
2.39.2

