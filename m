Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D080F2C329D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 22:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB43989FE8;
	Tue, 24 Nov 2020 21:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9806E045
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 21:24:56 +0000 (UTC)
IronPort-SDR: EU0qharRBpbKla3a1ErWJPdDWpU8xEUFb+r5HIMgwLY/KgzB427ofhVvSHufV8qJEmMLzG2zIb
 aqzK1Bddarsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151278739"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="151278739"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 13:24:56 -0800
IronPort-SDR: 4TOuOP6yYJ3slrMDycvNmdirD2qd/Ew7jKq+kGuSol4JUBPm8kCgtHZDguvaAQGgbHGFkB3DbE
 6V6BQxvNkXPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="332701576"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga006.jf.intel.com with ESMTP; 24 Nov 2020 13:24:56 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v2 0/6] Add user space dma-buf support
Date: Tue, 24 Nov 2020 13:38:48 -0800
Message-Id: <1606253934-67181-1-git-send-email-jianxin.xiong@intel.com>
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

This is the user space counter-part of the kernel patch set to add
dma-buf support to the RDMA subsystem.

This is the second version of the patch series. Most of the issues found
so far in v1 are addressed except for the use of /dev/dri/card* and
dumb_buf for allocating dma-buf object. The current implementation at
least provides a testing setup that works for most GPUs. Alternatives
are being investigated.

Change log:

v2:
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

This series consists of six patches. The first patch updates the
kernel headers for dma-buf support. Patch 2 adds the new API function
and updates the man pages. Patch 3 implements the new API in the mlx5
provider. Patch 3 adds new class definitions to pyverbs for the new API.
Patch 4 adds a set of new tests for the new API. Patch 5 fixes bug in
the utility code of the tests.

Pull request at github: https://github.com/linux-rdma/rdma-core/pull/895

Jianxin Xiong (6):
  Update kernel headers
  verbs: Support dma-buf based memory region
  mlx5: Support dma-buf based memory region
  pyverbs: Add dma-buf based MR support
  tests: Add tests for dma-buf based memory regions
  tests: Bug fix for get_access_flags()

 debian/libibverbs1.symbols               |   2 +
 kernel-headers/rdma/ib_user_ioctl_cmds.h |  14 ++++
 kernel-headers/rdma/ib_user_verbs.h      |  14 ----
 libibverbs/CMakeLists.txt                |   2 +-
 libibverbs/cmd_mr.c                      |  38 +++++++++
 libibverbs/driver.h                      |   7 ++
 libibverbs/dummy_ops.c                   |  11 +++
 libibverbs/libibverbs.map.in             |   6 ++
 libibverbs/man/ibv_reg_mr.3              |  21 ++++-
 libibverbs/verbs.c                       |  17 ++++
 libibverbs/verbs.h                       |  11 +++
 providers/mlx5/mlx5.c                    |   2 +
 providers/mlx5/mlx5.h                    |   3 +
 providers/mlx5/verbs.c                   |  22 ++++++
 pyverbs/CMakeLists.txt                   |   2 +
 pyverbs/dmabuf.pxd                       |  13 ++++
 pyverbs/dmabuf.pyx                       |  85 ++++++++++++++++++++
 pyverbs/libibverbs.pxd                   |   2 +
 pyverbs/mr.pxd                           |   5 ++
 pyverbs/mr.pyx                           |  77 +++++++++++++++++-
 tests/test_mr.py                         | 130 ++++++++++++++++++++++++++++++-
 tests/utils.py                           |  29 ++++++-
 22 files changed, 491 insertions(+), 22 deletions(-)
 create mode 100644 pyverbs/dmabuf.pxd
 create mode 100644 pyverbs/dmabuf.pyx

-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
