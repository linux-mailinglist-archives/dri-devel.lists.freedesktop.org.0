Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F38D30FB9A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E8A6E09A;
	Thu,  4 Feb 2021 18:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983916EE30
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:35:59 +0000 (UTC)
IronPort-SDR: 5U11yezPMrfH7IK895lSlOcIF3OuXP7E2zFtbjklEcfM8Y5sKGj+xg0Sh0LQrBNPJw+Vm1QkgD
 0F38pq2r0vRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="180528985"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="180528985"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 10:35:59 -0800
IronPort-SDR: j+dRb9PLVBUoh7FJsx0k36EEdQpWEK4QSHXT5iXFkllthevnVUzE+rPT7HKT8lJd0w1ViNuWHs
 B5VKeC0bLPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="580383232"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga006.fm.intel.com with ESMTP; 04 Feb 2021 10:35:58 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core 1/3] verbs: Fix gcc warnings when building for 32bit
 systems
Date: Thu,  4 Feb 2021 10:50:49 -0800
Message-Id: <1612464651-54073-2-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612464651-54073-1-git-send-email-jianxin.xiong@intel.com>
References: <1612464651-54073-1-git-send-email-jianxin.xiong@intel.com>
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
 John Hubbard <jhubbard@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gal Pressman <galpress@amazon.com>,
 Ali Alnubani <alialnu@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 6b0a3238289f ("verbs: Support dma-buf based memory region") caused
a build failure when building for 32b systems with gcc:

$ mkdir build && cd build && CFLAGS="-m32" cmake -GNinja .. \
  -DIOCTL_MODE=both -DNO_PYVERBS=1 -DENABLE_WERROR=1 && ninja
...
../libibverbs/cmd_mr.c: In function 'ibv_cmd_reg_dmabuf_mr':
../libibverbs/cmd_mr.c:152:21: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
  vmr->ibv_mr.addr = (void *)offset;
...
../libibverbs/verbs.c: In function 'ibv_reg_dmabuf_mr':
../libibverbs/verbs.c:387:13: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
  mr->addr = (void *)offset;
...

Reported-by: Ali Alnubani <alialnu@nvidia.com>
Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 libibverbs/cmd_mr.c | 2 +-
 libibverbs/verbs.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libibverbs/cmd_mr.c b/libibverbs/cmd_mr.c
index af0fad7..736fce0 100644
--- a/libibverbs/cmd_mr.c
+++ b/libibverbs/cmd_mr.c
@@ -149,7 +149,7 @@ int ibv_cmd_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
 	vmr->ibv_mr.lkey = lkey;
 	vmr->ibv_mr.rkey = rkey;
 	vmr->ibv_mr.pd = pd;
-	vmr->ibv_mr.addr = (void *)offset;
+	vmr->ibv_mr.addr = (void *)(uintptr_t)offset;
 	vmr->ibv_mr.length = length;
 	vmr->mr_type = IBV_MR_TYPE_DMABUF_MR;
 	return 0;
diff --git a/libibverbs/verbs.c b/libibverbs/verbs.c
index b93046a..f666695 100644
--- a/libibverbs/verbs.c
+++ b/libibverbs/verbs.c
@@ -384,7 +384,7 @@ struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
 
 	mr->context = pd->context;
 	mr->pd = pd;
-	mr->addr = (void *)offset;
+	mr->addr = (void *)(uintptr_t)offset;
 	mr->length = length;
 	return mr;
 }
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
