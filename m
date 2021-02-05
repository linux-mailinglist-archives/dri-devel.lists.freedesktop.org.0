Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23427310169
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 01:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CDE6EEB0;
	Fri,  5 Feb 2021 00:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A416EEB0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 00:14:15 +0000 (UTC)
IronPort-SDR: GyG6reuqTWUZS7BAI2dTnKYH0zY7KBXSvrv1ZIbuszjN6KlwSLyWmzK8drySr59VsGvaRWv6Oo
 yviDhSHJ74lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="266181543"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="266181543"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 16:14:14 -0800
IronPort-SDR: Em58YsvkWeHRtvoJS0C7LsMieIWhvViKA3Ys0SNYYfBhmrGjisR4YPcEK2IYInKVX9pWeWpATF
 gvbVX8hDo00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="508326481"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga004.jf.intel.com with ESMTP; 04 Feb 2021 16:14:14 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v2 0/3] Dma-buf related fixes
Date: Thu,  4 Feb 2021 16:29:11 -0800
Message-Id: <1612484954-75514-1-git-send-email-jianxin.xiong@intel.com>
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

This is the second version of the patch series. Change log:

v2:
* Use pgk_check_modules() to check libdrm configuration instead of calling
  pkg-config directly
* Put all the DRM header checking logic in CMakeLists.txt
* Use a seperate source file for dma-buf allocation stubs
* Remove the definition of HAVE_DRM_H from config.h
* Add space between the acronym and the full name

v1: https://www.spinics.net/lists/linux-rdma/msg99815.html
* Fix compilation warnings for 32bit builds
* Cosmetic improvement for dma-buf allocation routines
* Add check for DRM headers

This series fixes a few issues related to the dma-buf support. It consists
of three patches. The first patch fixes a compilation warning for 32-bit
builds. Patch 2 renames a function parameter and adds full name to an
acronym. Patch 3 adds check for DRM headers.

Pull request at github: https://github.com/linux-rdma/rdma-core/pull/942

Jianxin Xiong (3):
  verbs: Fix gcc warnings when building for 32bit systems
  pyverbs,tests: Cosmetic improvements for dma-buf allocation routines
  configure: Add check for the presence of DRM headers

 CMakeLists.txt              | 15 +++++++++
 libibverbs/cmd_mr.c         |  2 +-
 libibverbs/verbs.c          |  2 +-
 pyverbs/CMakeLists.txt      | 14 ++++++--
 pyverbs/dmabuf.pyx          | 12 +++----
 pyverbs/dmabuf_alloc.c      | 20 ++++++------
 pyverbs/dmabuf_alloc.h      |  2 +-
 pyverbs/dmabuf_alloc_stub.c | 39 +++++++++++++++++++++++
 pyverbs/mr.pyx              |  6 ++--
 tests/test_mr.py            | 78 ++++++++++++++++++++++-----------------------
 10 files changed, 127 insertions(+), 63 deletions(-)
 create mode 100644 pyverbs/dmabuf_alloc_stub.c

-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
