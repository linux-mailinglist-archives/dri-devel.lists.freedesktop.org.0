Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF33302BD4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED2D6E2B4;
	Mon, 25 Jan 2021 19:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAADE6E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:42:00 +0000 (UTC)
IronPort-SDR: LJ8+7wtPb1zxsdEBt7KXDR/c56WpSbiY0PJE3upxs2F/55K0m95rb4mGSSgm3/qWl1FEmM2CRB
 wTwFMBWM//bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="241322311"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="241322311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 11:41:57 -0800
IronPort-SDR: LHgW9zDZQv8Vb8dmgbEUIivzLWmzB/abhaOgt+PeIRK05FlJ5LLTD4Tm7W+qxqQGMK0UXya3/D
 8iKPIy1nh8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="402468936"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2021 11:41:55 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v7 0/6] Add user space dma-buf support
Date: Mon, 25 Jan 2021 11:56:56 -0800
Message-Id: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Edward Srouji <edwards@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the seventh version of the patch series. Change log:

v7:
* Rebase to the latest rdma-core master (commit a4885eda9addc4)
* Rerun kernel-headers/update against linux-rdma for-next so that the
  kernel commit id in the commit message is correct

v6: https://www.spinics.net/lists/linux-rdma/msg99221.html
* Rebase to the latest rdma-core master (commit 14006f2f841b0c)
* Update the ABI symbol version to match new package version; also bump
  the private ABI version because new function has been added to the
  provider interface
* Avoid changing 'struct ibv_context_ops' by replacing SET_OP() with
  SET_PRIV_OP_IC()
* Replace sprintf() with snprintf()
* Keep the ops in verbs_set_ops() sorted
* Fix some styling issues: extra spaces, struct 0-initialization, error
  checking control flow

v5: https://www.spinics.net/lists/linux-rdma/msg99015.html
* Use a different mr_type for dmabuf so that ibv_dofork_range() is not
  called inside ibv_dereg_mr() for dmabuf based mr

v4: https://www.spinics.net/lists/linux-rdma/msg98135.html
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
 libibverbs/CMakeLists.txt                |   2 +-
 libibverbs/cmd_mr.c                      |  38 +++++
 libibverbs/driver.h                      |   8 +
 libibverbs/dummy_ops.c                   |  11 ++
 libibverbs/libibverbs.map.in             |   6 +
 libibverbs/man/ibv_reg_mr.3              |  27 ++-
 libibverbs/verbs.c                       |  19 +++
 libibverbs/verbs.h                       |   7 +
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
 tests/test_mr.py                         | 266 ++++++++++++++++++++++++++++-
 tests/utils.py                           |  30 +++-
 25 files changed, 1012 insertions(+), 36 deletions(-)
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
