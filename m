Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A0596119
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 19:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A0110E6D0;
	Tue, 16 Aug 2022 17:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5D1610E6D0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:28:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8497106F;
 Tue, 16 Aug 2022 10:28:11 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C37E3F67D;
 Tue, 16 Aug 2022 10:28:08 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH 0/3] iommu/dma: Some housekeeping
Date: Tue, 16 Aug 2022 18:28:02 +0100
Message-Id: <cover.1660668998.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
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
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 catalin.marinas@arm.com, cohuck@redhat.com, sw0312.kim@samsung.com,
 alex.williamson@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 kyungmin.park@samsung.com, maz@kernel.org, tglx@linutronix.de, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

It's been a while now since iommu-dma grew from a library of DMA ops
helpers for arch code into something more abstracted and closely coupled
to the IOMMU API core, so it seemed about time to do some housekeeping
in the more neglected areas to reflect that.

The header reorganisation does touch a range of areas (a couple of which
seemingly had no reason to be involved anyway), but hopefully these are
all low-impact changes that nobody minds going through the IOMMU tree.

Now for the build-bots to tell me what I've missed...

Thanks,
Robin.


Robin Murphy (3):
  iommu/dma: Clean up Kconfig
  iommu/dma: Move public interfaces to linux/iommu.h
  iommu/dma: Make header private

 arch/arm64/Kconfig                          |  1 -
 arch/arm64/mm/dma-mapping.c                 |  2 +-
 drivers/acpi/viot.c                         |  1 -
 drivers/gpu/drm/exynos/exynos_drm_dma.c     |  1 -
 drivers/iommu/Kconfig                       |  3 +-
 drivers/iommu/amd/Kconfig                   |  1 -
 drivers/iommu/amd/iommu.c                   |  2 +-
 drivers/iommu/apple-dart.c                  |  3 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  2 +-
 drivers/iommu/dma-iommu.c                   | 18 +++-
 drivers/iommu/dma-iommu.h                   | 38 +++++++++
 drivers/iommu/intel/Kconfig                 |  1 -
 drivers/iommu/intel/iommu.c                 |  2 +-
 drivers/iommu/iommu.c                       |  3 +-
 drivers/iommu/virtio-iommu.c                |  3 +-
 drivers/irqchip/irq-gic-v2m.c               |  2 +-
 drivers/irqchip/irq-gic-v3-its.c            |  2 +-
 drivers/irqchip/irq-gic-v3-mbi.c            |  2 +-
 drivers/irqchip/irq-ls-scfg-msi.c           |  2 +-
 drivers/vfio/vfio_iommu_type1.c             |  1 -
 include/linux/dma-iommu.h                   | 93 ---------------------
 include/linux/iommu.h                       | 36 ++++++++
 23 files changed, 105 insertions(+), 116 deletions(-)
 create mode 100644 drivers/iommu/dma-iommu.h
 delete mode 100644 include/linux/dma-iommu.h

-- 
2.36.1.dirty

