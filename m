Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE42CC801
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 21:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0C46EAC2;
	Wed,  2 Dec 2020 20:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312876EAC0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 20:43:25 +0000 (UTC)
IronPort-SDR: vd8WPhZ1U8I1CJBPWJTriwpiFDjqcr6fhFpRXgDcs1yutVALFxzjJhUPWXwMMaNRjSsf0ge+Er
 NsVlwp63dKfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="170518821"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; d="scan'208";a="170518821"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 12:43:24 -0800
IronPort-SDR: +4BAfJ5mg0Q0U8uw0mGcVOI6HrXJKQzkd9JiBEky2XEuWal1KlX7A8vjFQ2oabgsw+aYZHOgmo
 Ugd0AG8ufzqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; d="scan'208";a="365457414"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2020 12:43:23 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v4 0/6] Add user space dma-buf support
Date: Wed,  2 Dec 2020 12:57:15 -0800
Message-Id: <1606942641-47234-1-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Leon Romanovsky <leon@kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the fourth version of the patch series. Change log:

v4:
* Rework the cmake funciton rdma_cython_module to support both single
  source (.pyx) and multiple source (.pyx + [.c]*) scenarios instead
  of using two separate functions
* Rename 'dri_*' to 'drm_*' for the dmabuf allocation interface
* Add option to dmabuf allocation routine to allow allocation from GTT
  instead of VRAM
* Add proper CPU access flags when allocating dmabufs
* Remove 'radeon' driver support from the dmabuf allocation routines
* Add comand line arguments to the tests for selecting GPU unit and
  setting the option for allocating from GTT

v3: https://www.spinics.net/lists/linux-rdma/msg98059.html
* Add parameter 'iova' to the new ibv_reg_dmabuf_mr() API
* Change the way of allocating dma-buf object - use /dev/dri/renderD*
  instead of /dev/dri/card* and use GEM object instead of dumb buffer
* Add cmake function to allow building modules with mixed cython and C
  source files
* Add new tests that use dma-buf MRs for send/recv and rdma traffic
* Skip dma-buf tests on unsupported systems
* Remove some use of random values in the new tests
* Add dealloc() and close() methods to the new classes
* Replace string.format with f-string in python code
* Fix some coding style issues: spacing, indentation, typo, comments

v2: https://www.spinics.net/lists/linux-rdma/msg97936.html
* Put the kernel header updates into a separate commit
* Add comments for the data structure used in python ioctl calls
* Fix issues related to symbol versioning
* Fix styling issues: extra spaces, unncecessary variable, typo
* Fix an inproper error code usage
* Put the new op into ibv_context_ops instead if verbs_context

v1: https://www.spinics.net/lists/linux-rdma/msg97865.html
* Add user space API for registering dma-buf based memory regions
* Update pyverbs with the new API
* Add new tests

This is the user space counter-part of the kernel patch set to add
dma-buf support to the RDMA subsystem.

This series consists of six patches. The first patch updates the
kernel headers for dma-buf support. Patch 2 adds the new API function
and updates the man pages. Patch 3 implements the new API in the mlx5
provider. Patch 4 adds new class definitions to pyverbs for the new API.
Patch 5 adds a set of new tests for the new API. Patch 6 fixes bug in
the utility code of the tests.

Pull request at github: https://github.com/linux-rdma/rdma-core/pull/895

Jianxin Xiong (6):
  Update kernel headers
  verbs: Support dma-buf based memory region
  mlx5: Support dma-buf based memory region
  pyverbs: Add dma-buf based MR support
  tests: Add tests for dma-buf based memory regions
  tests: Bug fix for get_access_flags()

 buildlib/pyverbs_functions.cmake         |  78 ++++++---
 debian/libibverbs1.symbols               |   2 +
 kernel-headers/rdma/ib_user_ioctl_cmds.h |  14 ++
 kernel-headers/rdma/ib_user_verbs.h      |  14 --
 libibverbs/CMakeLists.txt                |   2 +-
 libibverbs/cmd_mr.c                      |  38 +++++
 libibverbs/driver.h                      |   7 +
 libibverbs/dummy_ops.c                   |  11 ++
 libibverbs/libibverbs.map.in             |   6 +
 libibverbs/man/ibv_reg_mr.3              |  27 ++-
 libibverbs/verbs.c                       |  18 ++
 libibverbs/verbs.h                       |  11 ++
 providers/mlx5/mlx5.c                    |   2 +
 providers/mlx5/mlx5.h                    |   3 +
 providers/mlx5/verbs.c                   |  22 +++
 pyverbs/CMakeLists.txt                   |  11 +-
 pyverbs/dmabuf.pxd                       |  15 ++
 pyverbs/dmabuf.pyx                       |  73 ++++++++
 pyverbs/dmabuf_alloc.c                   | 278 +++++++++++++++++++++++++++++++
 pyverbs/dmabuf_alloc.h                   |  19 +++
 pyverbs/libibverbs.pxd                   |   2 +
 pyverbs/mr.pxd                           |   6 +
 pyverbs/mr.pyx                           | 105 +++++++++++-
 tests/args_parser.py                     |   4 +
 tests/test_mr.py                         | 264 ++++++++++++++++++++++++++++-
 tests/utils.py                           |  30 +++-
 26 files changed, 1012 insertions(+), 50 deletions(-)
 create mode 100644 pyverbs/dmabuf.pxd
 create mode 100644 pyverbs/dmabuf.pyx
 create mode 100644 pyverbs/dmabuf_alloc.c
 create mode 100644 pyverbs/dmabuf_alloc.h

-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
