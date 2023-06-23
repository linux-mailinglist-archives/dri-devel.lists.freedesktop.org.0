Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B876373C2B0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768A310E6BF;
	Fri, 23 Jun 2023 21:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jun 2023 21:22:22 UTC
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD0610E6BA;
 Fri, 23 Jun 2023 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yokMEiNdELJzyHFQdE73QSq1qzFaQMznhY0/hFJPXdI=;
 b=PQ1b0Em2N9AUVeD/LpbU+ZN+rhktTH+Y6Q7VDw8Cf3pNA0l+BtcyhZxn
 ojeRsFjGxDD8u0+Y/YOKGSuPFSO6phFB8O6SWqeWn+vMMRvPryqL5bt/o
 lImhNqRZeaTWVm1/g7h+gT/Zhi5gA6YeaCo8RJpx27aob7O1b3mfST+O1 0=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,153,1684792800"; d="scan'208";a="59686157"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 23:15:09 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-staging@lists.linux.dev
Subject: [PATCH 00/26] use array_size
Date: Fri, 23 Jun 2023 23:14:31 +0200
Message-Id: <20230623211457.102544-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, John Stultz <jstultz@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 kasan-dev@googlegroups.com, iommu@lists.linux.dev,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-sgx@vger.kernel.org,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 keescook@chromium.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krishna Reddy <vdumpa@nvidia.com>, Shailend Chand <shailend@google.com>,
 linux-tegra@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Laura Abbott <labbott@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 mhi@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use array_size to protect against multiplication overflows.

This follows up on the following patches by Kees Cook from 2018.

42bc47b35320 ("treewide: Use array_size() in vmalloc()")
fad953ce0b22 ("treewide: Use array_size() in vzalloc()")

The changes were done using the following Coccinelle semantic patch,
adapted from the one posted by Kees.

// Drop single-byte sizes and redundant parens.
@@
    expression COUNT;
    typedef u8;
    typedef __u8;
    type t = {u8,__u8,char,unsigned char};
    identifier alloc = {vmalloc,vzalloc};
@@
      alloc(
-           (sizeof(t)) * (COUNT)
+           COUNT
      , ...)

// 3-factor product with 2 sizeof(variable), with redundant parens removed.
@@
    expression COUNT;
    size_t e1, e2, e3;
    identifier alloc = {vmalloc,vzalloc};
@@

(    
      alloc(
-           (e1) * (e2) * (e3)
+           array3_size(e1, e2, e3)
      ,...)
|
      alloc(
-           (e1) * (e2) * (COUNT)
+           array3_size(COUNT, e1, e2)
      ,...)
)

// 3-factor product with 1 sizeof(type) or sizeof(expression), with
// redundant parens removed.
@@
    expression STRIDE, COUNT;
    size_t e;
    identifier alloc = {vmalloc,vzalloc};
@@

      alloc(
-           (e) * (COUNT) * (STRIDE)
+           array3_size(COUNT, STRIDE, e)
      ,...)

// Any remaining multi-factor products, first at least 3-factor products
// when they're not all constants...
@@
    expression E1, E2, E3;
    constant C1, C2, C3;
    identifier alloc = {vmalloc,vzalloc};
@@
    
(
      alloc(C1 * C2 * C3,...)
|
      alloc(
-           (E1) * (E2) * (E3)
+           array3_size(E1, E2, E3)
      ,...)
)

// 2-factor product with sizeof(type/expression) and identifier or constant.
@@
    size_t e1,e2;
    expression COUNT;
    identifier alloc = {vmalloc,vzalloc};
@@

(
      alloc(
-           (e1) * (e2)
+           array_size(e1, e2)
      ,...)
|
      alloc(
-           (e1) * (COUNT)
+           array_size(COUNT, e1)
      ,...)
)
    
// And then all remaining 2 factors products when they're not all constants.
@@
    expression E1, E2;
    constant C1, C2;
    identifier alloc = {vmalloc,vzalloc};
@@
    
(
      alloc(C1 * C2,...)
|
      alloc(
-           (E1) * (E2)
+           array_size(E1, E2)
      ,...)
)


---

 arch/x86/kernel/cpu/sgx/main.c                    |    3 ++-
 drivers/accel/habanalabs/common/device.c          |    3 ++-
 drivers/accel/habanalabs/common/state_dump.c      |    6 +++---
 drivers/bus/mhi/host/init.c                       |    4 ++--
 drivers/comedi/comedi_buf.c                       |    4 ++--
 drivers/dma-buf/heaps/system_heap.c               |    2 +-
 drivers/gpu/drm/gud/gud_pipe.c                    |    2 +-
 drivers/gpu/drm/i915/gvt/gtt.c                    |    6 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c           |    2 +-
 drivers/infiniband/hw/bnxt_re/qplib_res.c         |    4 ++--
 drivers/infiniband/hw/erdma/erdma_verbs.c         |    4 ++--
 drivers/infiniband/sw/siw/siw_qp.c                |    4 ++--
 drivers/infiniband/sw/siw/siw_verbs.c             |    6 +++---
 drivers/iommu/tegra-gart.c                        |    4 ++--
 drivers/net/ethernet/amd/pds_core/core.c          |    4 ++--
 drivers/net/ethernet/freescale/enetc/enetc.c      |    4 ++--
 drivers/net/ethernet/google/gve/gve_tx.c          |    2 +-
 drivers/net/ethernet/marvell/octeon_ep/octep_rx.c |    2 +-
 drivers/net/ethernet/microsoft/mana/hw_channel.c  |    2 +-
 drivers/net/ethernet/pensando/ionic/ionic_lif.c   |    4 ++--
 drivers/scsi/fnic/fnic_trace.c                    |    2 +-
 drivers/scsi/qla2xxx/qla_init.c                   |    4 ++--
 drivers/staging/media/ipu3/ipu3-mmu.c             |    2 +-
 drivers/vdpa/vdpa_user/iova_domain.c              |    3 +--
 drivers/virtio/virtio_mem.c                       |    6 +++---
 fs/btrfs/zoned.c                                  |    5 +++--
 kernel/kcov.c                                     |    2 +-
 lib/test_vmalloc.c                                |   12 ++++++------
 28 files changed, 56 insertions(+), 52 deletions(-)
