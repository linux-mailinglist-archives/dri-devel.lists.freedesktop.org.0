Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9B9F4958
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4FC10E906;
	Tue, 17 Dec 2024 10:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="E8eooEj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9800610E57C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:16:32 +0000 (UTC)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG3qqT2028463
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 02:16:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=facebook; bh=sTfnkfxHXTxcB2wIt/fTc9u
 wkU0mLwrZp2zwSBHHzv0=; b=E8eooEj2YAxV1im+CgF4AVhgswNBim6sEmpdbzd
 8JolI0EZyuzu0q0w+TsLfprRxiIu8klOp4Ge5YPNKwTmwDV1ryhORzpNwdhg745A
 0uTe+FbQ1ycyAokkBx7pZs4Il77mlPujSq1fKn0oNoexZh+CI+xyO+cTKQlqSEGT
 RkXs=
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 43jcpkhee4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 02:16:31 -0800 (PST)
Received: from twshared60378.16.frc2.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.11; Mon, 16 Dec 2024 10:16:28 +0000
Received: by devvm12370.nha0.facebook.com (Postfix, from userid 624418)
 id D3AB310A1F003; Mon, 16 Dec 2024 01:55:55 -0800 (PST)
From: Wei Lin Guay <wguay@fb.com>
To: <alex.williamson@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <kvm@vger.kernel.org>, <linux-rdma@vger.kernel.org>
CC: <jgg@nvidia.com>, <vivek.kasireddy@intel.com>, <dagmoxnes@meta.com>,
 <kbusch@kernel.org>, <nviljoen@meta.com>,
 Wei Lin Guay <wguay@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Leon
 Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported through
 dmabuf
Date: Mon, 16 Dec 2024 01:54:14 -0800
Message-ID: <20241216095429.210792-1-wguay@fb.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-Proofpoint-GUID: pYL8sqGi9uHuNu6fpt1VFMN2cEN1wc4C
X-Proofpoint-ORIG-GUID: pYL8sqGi9uHuNu6fpt1VFMN2cEN1wc4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Mailman-Approved-At: Tue, 17 Dec 2024 10:55:20 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Lin Guay <wguay@meta.com>

This is another attempt to revive the patches posted by Jason
Gunthorpe and Vivek Kasireddy, at
https://patchwork.kernel.org/project/linux-media/cover/0-v2-472615b3877e+=
28f7-vfio_dma_buf_jgg@nvidia.com/
https://lwn.net/Articles/970751/

In addition to the initial proposal by Jason, another promising
application is exposing memory from an AI accelerator (bound to VFIO)
to an RDMA device. This would allow the RDMA device to directly access
the accelerator's memory, thereby facilitating direct data
transactions between the RDMA device and the accelerator.

Below is from the text/motivation from the orginal cover letter.

dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which allows for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

This series supports a use case for SPDK where a NVMe device will be owne=
d
by SPDK through VFIO but interacting with a RDMA device. The RDMA device
may directly access the NVMe CMB or directly manipulate the NVMe device's
doorbell using PCI P2P.

However, as a general mechanism, it can support many other scenarios with
VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
generic and safe P2P mappings.

This series goes after the "Break up ioctl dispatch functions to one
function per ioctl" series.

v2:
 - Name the new file dma_buf.c
 - Restore orig_nents before freeing
 - Fix reversed logic around priv->revoked
 - Set priv->index
 - Rebased on v2 "Break up ioctl dispatch functions"
v1: https://lore.kernel.org/r/0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvid=
ia.com
Cc: linux-rdma@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Maor Gottlieb <maorg@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (3):
  vfio: Add vfio_device_get()
  dma-buf: Add dma_buf_try_get()
  vfio/pci: Allow MMIO regions to be exported through dma-buf

Wei Lin Guay (1):
  vfio/pci: Allow export dmabuf without move_notify from importer

 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/dma_buf.c         | 291 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_config.c |   8 +-
 drivers/vfio/pci/vfio_pci_core.c   |  44 ++++-
 drivers/vfio/pci/vfio_pci_priv.h   |  30 +++
 drivers/vfio/vfio_main.c           |   1 +
 include/linux/dma-buf.h            |  13 ++
 include/linux/vfio.h               |   6 +
 include/linux/vfio_pci_core.h      |   1 +
 include/uapi/linux/vfio.h          |  18 ++
 10 files changed, 405 insertions(+), 8 deletions(-)
 create mode 100644 drivers/vfio/pci/dma_buf.c

--
2.43.5
