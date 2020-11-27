Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83B2C6CA5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33936F3F2;
	Fri, 27 Nov 2020 20:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B746E6EE8F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:41:46 +0000 (UTC)
IronPort-SDR: Sj6PY799NbLfspo64/TVeal28gLz4T/BlK/ALMiv0U86uUYRByp89H2EEEdyypmFqgW04SrGQH
 a090gumRM1ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="172587545"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="172587545"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 12:41:44 -0800
IronPort-SDR: SV/suYrGoIujcV0Ob+A9kC2cT8oMD8kbNr6ZQX5g4tZlIiM399naXfVfwca9M23NmYp/NjXaEv
 y5KGk8hitXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="537737677"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2020 12:41:44 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v3 0/6] Add user space dma-buf support
Date: Fri, 27 Nov 2020 12:55:37 -0800
Message-Id: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the third version of the patch series. Change log:

v3:
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

 buildlib/pyverbs_functions.cmake         |  52 ++++++
 debian/libibverbs1.symbols               |   2 +
 kernel-headers/rdma/ib_user_ioctl_cmds.h |  14 ++
 kernel-headers/rdma/ib_user_verbs.h      |  14 --
 libibverbs/CMakeLists.txt                |   2 +-
 libibverbs/cmd_mr.c                      |  38 ++++
 libibverbs/driver.h                      |   7 +
 libibverbs/dummy_ops.c                   |  11 ++
 libibverbs/libibverbs.map.in             |   6 +
 libibverbs/man/ibv_reg_mr.3              |  27 ++-
 libibverbs/verbs.c                       |  18 ++
 libibverbs/verbs.h                       |  11 ++
 providers/mlx5/mlx5.c                    |   2 +
 providers/mlx5/mlx5.h                    |   3 +
 providers/mlx5/verbs.c                   |  22 +++
 pyverbs/CMakeLists.txt                   |   7 +
 pyverbs/dmabuf.pxd                       |  15 ++
 pyverbs/dmabuf.pyx                       |  72 ++++++++
 pyverbs/dmabuf_alloc.c                   | 296 +++++++++++++++++++++++++++++++
 pyverbs/dmabuf_alloc.h                   |  19 ++
 pyverbs/libibverbs.pxd                   |   2 +
 pyverbs/mr.pxd                           |   6 +
 pyverbs/mr.pyx                           | 103 ++++++++++-
 tests/test_mr.py                         | 239 ++++++++++++++++++++++++-
 tests/utils.py                           |  30 +++-
 25 files changed, 996 insertions(+), 22 deletions(-)
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
