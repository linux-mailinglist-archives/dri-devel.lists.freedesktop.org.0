Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E673FE97
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C84E10E2F6;
	Tue, 27 Jun 2023 14:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606DD88EFF;
 Tue, 27 Jun 2023 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lz+eaKXjltZfgC96+KOEH+DiV357kqzsKaP1ME9j9JM=;
 b=YpuufV72ER5dSm9wrYSnJ+nyISX1oQx33v1s2pGZoMDoTbTZApc/Qnr+
 jWRuBVmLvwZwmibFQ5jrR1vtZ5noOKi7DSKRNrP0U1BZ9FCltFGcibx6p
 ck1ThN0OMstSb7PrPLh1Mq91rYGjkQ4mlVR9Zej3KEIn+kL4eNkAXPzxE c=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="114936315"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:43:51 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v2 00/24] use vmalloc_array and vcalloc
Date: Tue, 27 Jun 2023 16:43:15 +0200
Message-Id: <20230627144339.144478-1-Julia.Lawall@inria.fr>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-sgx@vger.kernel.org, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 kasan-dev@googlegroups.com, iommu@lists.linux.dev, kuba@kernel.org,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 keescook@chromium.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krishna Reddy <vdumpa@nvidia.com>, Shailend Chand <shailend@google.com>,
 christophe.jaillet@wanadoo.fr, linux-tegra@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 mhi@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The functions vmalloc_array and vcalloc were introduced in

commit a8749a35c399 ("mm: vmalloc: introduce array allocation functions")

but are not used much yet.  This series introduces uses of
these functions, to protect against multiplication overflows.

The changes were done using the following Coccinelle semantic
patch.

@initialize:ocaml@
@@

let rename alloc =
  match alloc with
    "vmalloc" -> "vmalloc_array"
  | "vzalloc" -> "vcalloc"
  | _ -> failwith "unknown"

@@
    size_t e1,e2;
    constant C1, C2;
    expression E1, E2, COUNT, x1, x2, x3;
    typedef u8;
    typedef __u8;
    type t = {u8,__u8,char,unsigned char};
    identifier alloc = {vmalloc,vzalloc};
    fresh identifier realloc = script:ocaml(alloc) { rename alloc };
@@

(
      alloc(x1*x2*x3)
|
      alloc(C1 * C2)
|
      alloc((sizeof(t)) * (COUNT), ...)
|
-     alloc((e1) * (e2))
+     realloc(e1, e2)
|
-     alloc((e1) * (COUNT))
+     realloc(COUNT, e1)
|
-     alloc((E1) * (E2))
+     realloc(E1, E2)
)

v2: This series uses vmalloc_array and vcalloc instead of
array_size.  It also leaves a multiplication of a constant by a
sizeof as is.  Two patches are thus dropped from the series.

---

 arch/x86/kernel/cpu/sgx/main.c                    |    2 +-
 drivers/accel/habanalabs/common/device.c          |    3 ++-
 drivers/accel/habanalabs/common/state_dump.c      |    7 ++++---
 drivers/bus/mhi/host/init.c                       |    2 +-
 drivers/comedi/comedi_buf.c                       |    4 ++--
 drivers/dma-buf/heaps/system_heap.c               |    2 +-
 drivers/gpu/drm/gud/gud_pipe.c                    |    2 +-
 drivers/gpu/drm/i915/gvt/gtt.c                    |    6 ++++--
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
 drivers/vdpa/vdpa_user/iova_domain.c              |    4 ++--
 drivers/virtio/virtio_mem.c                       |    6 +++---
 fs/btrfs/zoned.c                                  |    4 ++--
 kernel/kcov.c                                     |    2 +-
 lib/test_vmalloc.c                                |    9 +++++----
 26 files changed, 52 insertions(+), 47 deletions(-)
