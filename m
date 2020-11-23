Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF662C1212
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 18:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D4E6E081;
	Mon, 23 Nov 2020 17:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9B56E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 17:39:10 +0000 (UTC)
IronPort-SDR: ONYxlOsMpjDRTkeqO5xjTNAYRPEPzmrWLOAqr1FQMn0hVh3aSpH/v06wmi8oMz8bwTMEjH96NZ
 JYu/6p7CyYug==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="233421233"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="233421233"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 09:39:09 -0800
IronPort-SDR: 2wG7QKoMyGBALxz/acAfvDTXdakVXq3fhePyU7hjISktsLLcaiNJqzPZvOp2t9K67gr6DQNXj8
 pPbPANBvJVUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="361525786"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 23 Nov 2020 09:39:09 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core 0/5] Add user space dma-buf support
Date: Mon, 23 Nov 2020 09:52:59 -0800
Message-Id: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
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
dma-buf support to the RDMA subsystem. This patch series adds user
space API for registering dma-buf based memory regions, updates
pyverbs with the new API, and adds new tests.

This series consists of five patches. The first patch adds the new API
function and updates the man pages. Patch 2 implements the new API in
the mlx5 provider. Patch 3 adds new class definitions to pyverbs for
the new API. Patch 4 adds new tests for the new API. Patch 5 fixes bug
in the utility code of the tests.

Jianxin Xiong (5):
  verbs: Support dma-buf based memory region
  mlx5: Support dma-buf based memory region
  pyverbs: Add dma-buf based MR support
  tests: Add tests for dma-buf based memory regions
  tests: Bug fix for get_access_flags()

 kernel-headers/rdma/ib_user_ioctl_cmds.h |  14 ++++
 libibverbs/cmd_mr.c                      |  38 +++++++++
 libibverbs/driver.h                      |   7 ++
 libibverbs/dummy_ops.c                   |  11 +++
 libibverbs/libibverbs.map.in             |   6 ++
 libibverbs/man/ibv_reg_mr.3              |  21 ++++-
 libibverbs/verbs.c                       |  19 +++++
 libibverbs/verbs.h                       |  10 +++
 providers/mlx5/mlx5.c                    |   2 +
 providers/mlx5/mlx5.h                    |   3 +
 providers/mlx5/verbs.c                   |  23 ++++++
 pyverbs/CMakeLists.txt                   |   2 +
 pyverbs/dmabuf.pxd                       |  13 ++++
 pyverbs/dmabuf.pyx                       |  58 ++++++++++++++
 pyverbs/libibverbs.pxd                   |   2 +
 pyverbs/mr.pxd                           |   5 ++
 pyverbs/mr.pyx                           |  77 +++++++++++++++++-
 tests/test_mr.py                         | 130 ++++++++++++++++++++++++++++++-
 tests/utils.py                           |  31 +++++++-
 19 files changed, 464 insertions(+), 8 deletions(-)
 create mode 100644 pyverbs/dmabuf.pxd
 create mode 100644 pyverbs/dmabuf.pyx

-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
