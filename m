Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97111A1AC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 03:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5CB6EA4B;
	Wed, 11 Dec 2019 02:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8F6EA4A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 02:53:23 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df05a1b0000>; Tue, 10 Dec 2019 18:53:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 18:53:22 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 10 Dec 2019 18:53:22 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 02:53:21 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:53:20 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df05a1f0001>; Tue, 10 Dec 2019 18:53:20 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
Date: Tue, 10 Dec 2019 18:52:53 -0800
Message-ID: <20191211025318.457113-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576032796; bh=/WTOHnB7CdtD0f3PohhiCno24zNn42F7wC221pdIYa8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=jvF78ikFtZ+2LRb6zlzvhEFYdNllf3T6MCCl8UlevyvsbIciGEno8wF/kma4/WFif
 dQim8EanlpiHsyr9dogEGRSxTr7tYNQ+0HjzLSOGoD17EJ2t0C+8qAEVEKWuV/eN8p
 xNezGZi8gOvg08O1UKz4NNlfI5nTe9X8pTu+C8wzXyPqENZUQ/R5S8TZKutIiwrahw
 EeJKU8x8wI2WBWRbFGYJ4uhxKduqy3xOQqovjS2vHXgesmV7rdQ9CWb4p13vEioix2
 +ONu8pCLF5rf5eTew/56/JIMCv4YA+zc3jWOFdsnb8Bd8VQBJqWEZPj6ykYVbtCwyz
 oBuY0ZX4UHRVQ==
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
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
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

This implements an API naming change (put_user_page*() -->
unpin_user_page*()), and also implements tracking of FOLL_PIN pages. It
extends that tracking to a few select subsystems. More subsystems will
be added in follow up work.

Christoph Hellwig, a point of interest:

a) I've moved the bulk of the code out of the inline functions, as
   requested, for the devmap changes (patch 4: "mm: devmap: refactor
   1-based refcounting for ZONE_DEVICE pages").

Changes since v8:

* Merged the "mm/gup: pass flags arg to __gup_device_* functions" patch
  into the "mm/gup: track FOLL_PIN pages" patch, as requested by
  Christoph and Jan.

* Changed void grab_page() to bool try_grab_page(), and handled errors
  at the call sites. (From Jan's review comments.) try_grab_page()
  attempts to avoid page refcount overflows, even when counting up with
  GUP_PIN_COUNTING_BIAS increments.

* Fixed a bug that I'd introduced, when changing a BUG() to a WARN().

* Added Jan's reviewed-by tag to the " mm/gup: allow FOLL_FORCE for
  get_user_pages_fast()" patch.

* Documentation: pin_user_pages.rst: fixed an incorrect gup_benchmark
  invocation, left over from the pin_longterm days, spotted while preparing
  this version.

* Rebased onto today's linux.git (-rc1), and re-tested.

Changes since v7:

* Rebased onto Linux 5.5-rc1

* Reworked the grab_page() and try_grab_compound_head(), for API
  consistency and less diffs (thanks to Jan Kara's reviews).

* Added Leon Romanovsky's reviewed-by tags for two of the IB-related
  patches.

* patch 4 refactoring changes, as mentioned above.

There is a git repo and branch, for convenience:

    git@github.com:johnhubbard/linux.git pin_user_pages_tracking_v8

For the remaining list of "changes since version N", those are all in
v7, which is here:

  https://lore.kernel.org/r/20191121071354.456618-1-jhubbard@nvidia.com

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
    * infiniband: ran "ib_write_bw", which exercises the umem.c changes,
                  but not the other changes.
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

John Hubbard (24):
  mm/gup: factor out duplicate code from four routines
  mm/gup: move try_get_compound_head() to top, fix minor issues
  mm: devmap: refactor 1-based refcounting for ZONE_DEVICE pages
  goldish_pipe: rename local pin_user_pages() routine
  mm: fix get_user_pages_remote()'s handling of FOLL_LONGTERM
  vfio: fix FOLL_LONGTERM use, simplify get_user_pages_remote() call
  mm/gup: allow FOLL_FORCE for get_user_pages_fast()
  IB/umem: use get_user_pages_fast() to pin DMA pages
  mm/gup: introduce pin_user_pages*() and FOLL_PIN
  goldish_pipe: convert to pin_user_pages() and put_user_page()
  IB/{core,hw,umem}: set FOLL_PIN via pin_user_pages*(), fix up ODP
  mm/process_vm_access: set FOLL_PIN via pin_user_pages_remote()
  drm/via: set FOLL_PIN via pin_user_pages_fast()
  fs/io_uring: set FOLL_PIN via pin_user_pages()
  net/xdp: set FOLL_PIN via pin_user_pages()
  media/v4l2-core: set pages dirty upon releasing DMA buffers
  media/v4l2-core: pin_user_pages (FOLL_PIN) and put_user_page()
    conversion
  vfio, mm: pin_user_pages (FOLL_PIN) and put_user_page() conversion
  powerpc: book3s64: convert to pin_user_pages() and put_user_page()
  mm/gup_benchmark: use proper FOLL_WRITE flags instead of hard-coding
    "1"
  mm, tree-wide: rename put_user_page*() to unpin_user_page*()
  mm/gup: track FOLL_PIN pages
  mm/gup_benchmark: support pin_user_pages() and related calls
  selftests/vm: run_vmtests: invoke gup_benchmark with basic FOLL_PIN
    coverage

 Documentation/core-api/index.rst            |   1 +
 Documentation/core-api/pin_user_pages.rst   | 232 ++++++++
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
 include/linux/mm.h                          | 149 ++++-
 include/linux/mmzone.h                      |   2 +
 include/linux/page_ref.h                    |  10 +
 mm/gup.c                                    | 598 +++++++++++++++-----
 mm/gup_benchmark.c                          |  74 ++-
 mm/huge_memory.c                            |  26 +-
 mm/hugetlb.c                                |  25 +-
 mm/memremap.c                               |  76 ++-
 mm/process_vm_access.c                      |  28 +-
 mm/swap.c                                   |  24 +
 mm/vmstat.c                                 |   2 +
 net/xdp/xdp_umem.c                          |   4 +-
 tools/testing/selftests/vm/gup_benchmark.c  |  21 +-
 tools/testing/selftests/vm/run_vmtests      |  22 +
 31 files changed, 1109 insertions(+), 355 deletions(-)
 create mode 100644 Documentation/core-api/pin_user_pages.rst

-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
