Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D12133607
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528116E848;
	Tue,  7 Jan 2020 22:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8FD6E149
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:46:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e150a160001>; Tue, 07 Jan 2020 14:45:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 07 Jan 2020 14:46:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 14:46:00 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 22:45:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 22:45:59 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e150a270002>; Tue, 07 Jan 2020 14:45:59 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 00/22] mm/gup: prereqs to track dma-pinned pages: FOLL_PIN
Date: Tue, 7 Jan 2020 14:45:36 -0800
Message-ID: <20200107224558.2362728-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578437143; bh=e35VbuH+5Gvq6hzdX1wkd7Gwo0Ev1/RydrM5ojZBtqQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=q07jqBkOQ+8W+FWIGxHzDq9+K2aqK0l1baYh9tHJ5YgbVqzpzGrCVUbh8IIOz9ivr
 N8DeNKRxsksmaQmBj8DLUTfJNvVvliRP3A7UvdrQSBrUtqohAPvBbP6gW+d+uir7zj
 N71u+jUUFG3a29ne3zY3zxuWMeCOBJOlbx0/C+htFPSQNDX+WeFBXBUo/FQBTcKPK+
 fsKaVOXRA1UshywnsPhWCDuIhCymH6YPuMQwJ7/7x7UJimvasG4+G3pmoTyD3poYdy
 39n4NbY3ownCfiBLFE6x3ANsClgsjxgyIpUe1k8mz3p84SQo7eboSdCD6jky2z1c7L
 WmXHM0fQFkghw==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The "track FOLL_PIN pages" would have been the very next patch, but it is
not included here because I'm still debugging a bug report from Leon.
Let's get all of the prerequisite work (it's been reviewed) into the tree
so that future reviews are easier. It's clear that any fixes that are
required to the tracking patch, won't affect these patches here.

This implements an API naming change (put_user_page*() -->
unpin_user_page*()), and also adds FOLL_PIN page support, up to
*but not including* actually tracking FOLL_PIN pages. It extends
the FOLL_PIN support to a few select subsystems. More subsystems will
be added in follow up work.

Christoph Hellwig, a point of interest:

a) I've moved the bulk of the code out of the inline functions, as
   requested, for the devmap changes (patch 4: "mm: devmap: refactor
   1-based refcounting for ZONE_DEVICE pages").

Changes since v11: Fixes resulting from Kirill Shutemov's review, plus
a fix for a kbuild robot-reported warning.

* Only include the first 22 patches: up to, but not including, the "track
  FOLL_PIN pages" patch.

* Improved the efficiency of put_compound_head(), by avoiding get_page()
  entirely, and instead doing the mass subtraction on one less than
  refs, followed by a final put_page().

* Got rid of the forward declaration of __gup_longterm_locked(), by
  moving get_user_pages_remote() further down in gup.c

* Got rid of a redundant page_is_devmap_managed() call, and simplified
  put_devmap_managed_page() as part of that small cleanup.

* Changed put_devmap_managed_page() to do an early out if the page is
  not devmap managed. This saves an indentation level.

* Applied the same type of change to __unpin_devmap_managed_user_page(),
  which has the same checks.

* Changed release_pages() to handle the changed put_devmap_managed_page()
  API.

* Removed EXPORT_SYMBOL(free_devmap_managed_page), as it is not required,
  after the other refactoring.

* Fixed a kbuild robot sparse warning: added "static" to
  try_pin_compound_head()'s declaration.

There is a git repo and branch, for convenience:

    git@github.com:johnhubbard/linux.git pin_user_pages_tracking_v8

For the remaining list of "changes since version N", those are all in
v11, which is here:

  https://lore.kernel.org/r/20191216222537.491123-1-jhubbard@nvidia.com

============================================================
Overview:

This is a prerequisite to solving the problem of proper interactions
between file-backed pages, and [R]DMA activities, as discussed in [1],
[2], [3], and in a remarkable number of email threads since about
2017. :)

A new internal gup flag, FOLL_PIN is introduced, and thoroughly
documented in the last patch's Documentation/vm/pin_user_pages.rst.

I believe that this will provide a good starting point for doing the
layout lease work that Ira Weiny has been working on. That's because
these new wrapper functions provide a clean, constrained, systematically
named set of functionality that, again, is required in order to even
know if a page is "dma-pinned".

In contrast to earlier approaches, the page tracking can be
incrementally applied to the kernel call sites that, until now, have
been simply calling get_user_pages() ("gup"). In other words, opt-in by
changing from this:

    get_user_pages() (sets FOLL_GET)
    put_page()

to this:
    pin_user_pages() (sets FOLL_PIN)
    unpin_user_page()

============================================================
Testing:

* I've done some overall kernel testing (LTP, and a few other goodies),
  and some directed testing to exercise some of the changes. And as you
  can see, gup_benchmark is enhanced to exercise this. Basically, I've
  been able to runtime test the core get_user_pages() and
  pin_user_pages() and related routines, but not so much on several of
  the call sites--but those are generally just a couple of lines
  changed, each.

  Not much of the kernel is actually using this, which on one hand
  reduces risk quite a lot. But on the other hand, testing coverage
  is low. So I'd love it if, in particular, the Infiniband and PowerPC
  folks could do a smoke test of this series for me.

  Runtime testing for the call sites so far is pretty light:

    * io_uring: Some directed tests from liburing exercise this, and
                they pass.
    * process_vm_access.c: A small directed test passes.
    * gup_benchmark: the enhanced version hits the new gup.c code, and
                     passes.
    * infiniband: Ran rdma-core tests: rdma-core/build/bin/run_tests.py
    * VFIO: compiles (I'm vowing to set up a run time test soon, but it's
                      not ready just yet)
    * powerpc: it compiles...
    * drm/via: compiles...
    * goldfish: compiles...
    * net/xdp: compiles...
    * media/v4l2: compiles...

[1] Some slow progress on get_user_pages() (Apr 2, 2019): https://lwn.net/Articles/784574/
[2] DMA and get_user_pages() (LPC: Dec 12, 2018): https://lwn.net/Articles/774411/
[3] The trouble with get_user_pages() (Apr 30, 2018): https://lwn.net/Articles/753027/


Dan Williams (1):
  mm: Cleanup __put_devmap_managed_page() vs ->page_free()

John Hubbard (21):
  mm/gup: factor out duplicate code from four routines
  mm/gup: move try_get_compound_head() to top, fix minor issues
  mm: devmap: refactor 1-based refcounting for ZONE_DEVICE pages
  goldish_pipe: rename local pin_user_pages() routine
  mm: fix get_user_pages_remote()'s handling of FOLL_LONGTERM
  vfio: fix FOLL_LONGTERM use, simplify get_user_pages_remote() call
  mm/gup: allow FOLL_FORCE for get_user_pages_fast()
  IB/umem: use get_user_pages_fast() to pin DMA pages
  media/v4l2-core: set pages dirty upon releasing DMA buffers
  mm/gup: introduce pin_user_pages*() and FOLL_PIN
  goldish_pipe: convert to pin_user_pages() and put_user_page()
  IB/{core,hw,umem}: set FOLL_PIN via pin_user_pages*(), fix up ODP
  mm/process_vm_access: set FOLL_PIN via pin_user_pages_remote()
  drm/via: set FOLL_PIN via pin_user_pages_fast()
  fs/io_uring: set FOLL_PIN via pin_user_pages()
  net/xdp: set FOLL_PIN via pin_user_pages()
  media/v4l2-core: pin_user_pages (FOLL_PIN) and put_user_page()
    conversion
  vfio, mm: pin_user_pages (FOLL_PIN) and put_user_page() conversion
  powerpc: book3s64: convert to pin_user_pages() and put_user_page()
  mm/gup_benchmark: use proper FOLL_WRITE flags instead of hard-coding
    "1"
  mm, tree-wide: rename put_user_page*() to unpin_user_page*()

 Documentation/core-api/index.rst            |   1 +
 Documentation/core-api/pin_user_pages.rst   | 232 +++++++++
 arch/powerpc/mm/book3s64/iommu_api.c        |  10 +-
 drivers/gpu/drm/via/via_dmablit.c           |   6 +-
 drivers/infiniband/core/umem.c              |  19 +-
 drivers/infiniband/core/umem_odp.c          |  13 +-
 drivers/infiniband/hw/hfi1/user_pages.c     |   4 +-
 drivers/infiniband/hw/mthca/mthca_memfree.c |   8 +-
 drivers/infiniband/hw/qib/qib_user_pages.c  |   4 +-
 drivers/infiniband/hw/qib/qib_user_sdma.c   |   8 +-
 drivers/infiniband/hw/usnic/usnic_uiom.c    |   4 +-
 drivers/infiniband/sw/siw/siw_mem.c         |   4 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c   |   8 +-
 drivers/nvdimm/pmem.c                       |   6 -
 drivers/platform/goldfish/goldfish_pipe.c   |  35 +-
 drivers/vfio/vfio_iommu_type1.c             |  35 +-
 fs/io_uring.c                               |   6 +-
 include/linux/mm.h                          |  95 +++-
 mm/gup.c                                    | 495 ++++++++++++--------
 mm/gup_benchmark.c                          |   9 +-
 mm/memremap.c                               |  75 ++-
 mm/process_vm_access.c                      |  28 +-
 mm/swap.c                                   |  27 +-
 net/xdp/xdp_umem.c                          |   4 +-
 tools/testing/selftests/vm/gup_benchmark.c  |   6 +-
 25 files changed, 762 insertions(+), 380 deletions(-)
 create mode 100644 Documentation/core-api/pin_user_pages.rst

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
