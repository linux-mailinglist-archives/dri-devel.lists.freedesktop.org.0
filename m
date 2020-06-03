Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86841ECEB4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 13:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396E189BAE;
	Wed,  3 Jun 2020 11:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D5389BAE;
 Wed,  3 Jun 2020 11:42:46 +0000 (UTC)
IronPort-SDR: SYb+WHNjpXwuHRWySl04B2Y6BYHE+h1eIddD/VlHns+Xs5LiCS3a3Ahw58NDFi0a61F7CBaKmI
 q0fmM8t8kGjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 04:42:46 -0700
IronPort-SDR: iyflii3yVus/ItveUg/MWhxiU0Nlxg448XpGmS24PcCiJQWLyNo/QCiJZpn+7H2GrMhC2A0IyW
 NvzkysSvdQvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="257985605"
Received: from gklab-125-110.igk.intel.com ([10.91.125.110])
 by orsmga007.jf.intel.com with ESMTP; 03 Jun 2020 04:42:36 -0700
From: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 00/15] Forward MSI-X vector enable error code in
 pci_alloc_irq_vectors_affinity()
Date: Wed,  3 Jun 2020 13:42:12 +0200
Message-Id: <20200603114212.12525-1-piotr.stankiewicz@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200602230608.GA868767@bjorn-Precision-5520>
References: <20200602230608.GA868767@bjorn-Precision-5520>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Igor Russkikh <irusskikh@marvell.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jim Gill <jgill@vmware.com>,
 netdev@vger.kernel.org, Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, linux-media@vger.kernel.org,
 Tom Lendacky <thomas.lendacky@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Antoine Tenart <antoine.tenart@bootlin.com>, linux-kernel@vger.kernel.org,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Salil Mehta <salil.mehta@huawei.com>, dmaengine@vger.kernel.org,
 Brian King <brking@us.ibm.com>, VMware PV-Drivers <pv-drivers@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Piotr Stankiewicz <piotr.stankiewicz@intel.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The primary objective of this patch series is to change the behaviour
of pci_alloc_irq_vectors_affinity() such that it forwards the MSI-X enable
error code when appropriate. In the process, though, it was pointed out
that there are multiple places in the kernel which check/ask for message
signalled interrupts (MSI or MSI-X), which spawned the first patch adding
PCI_IRQ_MSI_TYPES. Finally the rest of the chain converts all users to
take advantage of PCI_IRQ_MSI_TYPES or PCI_IRQ_ALL_TYPES, as
appropriate.

Piotr Stankiewicz (15):
  PCI/MSI: Forward MSI-X vector enable error code in
    pci_alloc_irq_vectors_affinity()
  PCI: Add shorthand define for message signalled interrupt types
  PCI: Use PCI_IRQ_MSI_TYPES where appropriate
  ahci: Use PCI_IRQ_MSI_TYPES where appropriate
  crypto: inside-secure - Use PCI_IRQ_MSI_TYPES where appropriate
  dmaengine: dw-edma: Use PCI_IRQ_MSI_TYPES  where appropriate
  drm/amdgpu: Use PCI_IRQ_MSI_TYPES where appropriate
  IB/qib: Use PCI_IRQ_MSI_TYPES where appropriate
  media: ddbridge: Use PCI_IRQ_MSI_TYPES where appropriate
  vmw_vmci: Use PCI_IRQ_ALL_TYPES where appropriate
  mmc: sdhci: Use PCI_IRQ_MSI_TYPES where appropriate
  amd-xgbe: Use PCI_IRQ_MSI_TYPES where appropriate
  aquantia: atlantic: Use PCI_IRQ_ALL_TYPES where appropriate
  net: hns3: Use PCI_IRQ_MSI_TYPES where appropriate
  scsi: Use PCI_IRQ_MSI_TYPES and PCI_IRQ_ALL_TYPES where appropriate

 Documentation/PCI/msi-howto.rst                          | 5 +++--
 drivers/ata/ahci.c                                       | 2 +-
 drivers/crypto/inside-secure/safexcel.c                  | 2 +-
 drivers/dma/dw-edma/dw-edma-pcie.c                       | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c                  | 9 ++-------
 drivers/infiniband/hw/qib/qib_pcie.c                     | 6 ++++--
 drivers/media/pci/ddbridge/ddbridge-main.c               | 2 +-
 drivers/misc/vmw_vmci/vmci_guest.c                       | 3 +--
 drivers/mmc/host/sdhci-pci-gli.c                         | 3 +--
 drivers/mmc/host/sdhci-pci-o2micro.c                     | 3 +--
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c                 | 2 +-
 drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c     | 4 +---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c  | 3 +--
 .../net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c    | 3 +--
 drivers/pci/msi.c                                        | 4 ++--
 drivers/pci/pcie/portdrv_core.c                          | 4 ++--
 drivers/pci/switch/switchtec.c                           | 3 +--
 drivers/scsi/ipr.c                                       | 5 +++--
 drivers/scsi/vmw_pvscsi.c                                | 2 +-
 include/linux/pci.h                                      | 4 ++--
 20 files changed, 31 insertions(+), 40 deletions(-)

-- 
2.17.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
