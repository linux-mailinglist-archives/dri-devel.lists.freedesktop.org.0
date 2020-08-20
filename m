Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D958F24C13F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EA16E372;
	Thu, 20 Aug 2020 15:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B70056E372
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:08:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA18331B;
 Thu, 20 Aug 2020 08:08:53 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FDC83F6CF;
 Thu, 20 Aug 2020 08:08:50 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 00/18] Convert arch/arm to use iommu-dma
Date: Thu, 20 Aug 2020 16:08:19 +0100
Message-Id: <cover.1597931875.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

After 5 years or so of intending to get round to this, finally the
time comes! The changes themselves actualy turn out to be relatively
mechanical; the bigger concern appears to be how to get everything
merged across about 5 diffferent trees given the dependencies.

I've lightly boot-tested things on Rockchip RK3288 and Exynos 4412
(Odroid-U3), to the degree that their display drivers should be using
IOMMU-backed buffers and don't explode (the Odroid doesn't manage to
send a working HDMI signal to the one monitor I have that it actually
detects, but that's a pre-existing condition...) Confirmation that the
Mediatek, OMAP and Tegra changes work will be most welcome.

Patches are based on 5.9-rc1, branch available here:

  git://linux-arm.org/linux-rm arm/dma


Robin.


Robin Murphy (18):
  ARM/dma-mapping: Drop .dma_supported for IOMMU ops
  ARM/dma-mapping: Consolidate IOMMU ops callbacks
  ARM/dma-mapping: Merge IOMMU ops
  iommu/dma: Add temporary hacks for arch/arm
  ARM/dma-mapping: Switch to iommu_dma_ops
  ARM/dma-mapping: Support IOMMU default domains
  iommu/arm-smmu: Remove arch/arm workaround
  iommu/renesas: Remove arch/arm workaround
  iommu/mediatek-v1: Add IOMMU_DOMAIN_DMA support
  iommu/msm: Add IOMMU_DOMAIN_DMA support
  iommu/omap: Add IOMMU_DOMAIN_DMA support
  iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
  iommu/tegra: Add IOMMU_DOMAIN_DMA support
  drm/exynos: Consolidate IOMMU mapping code
  drm/nouveau/tegra: Clean up IOMMU workaround
  staging/media/tegra-vde: Clean up IOMMU workaround
  media/omap3isp: Clean up IOMMU workaround
  ARM/dma-mapping: Remove legacy dma-iommu API

 arch/arm/Kconfig                              |   28 +-
 arch/arm/common/dmabounce.c                   |    1 -
 arch/arm/include/asm/device.h                 |    9 -
 arch/arm/include/asm/dma-iommu.h              |   37 -
 arch/arm/mm/dma-mapping.c                     | 1198 +----------------
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |    5 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c       |   61 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |    6 +-
 drivers/gpu/drm/exynos/exynos_mixer.c         |    7 +-
 .../drm/nouveau/nvkm/engine/device/tegra.c    |   13 -
 drivers/iommu/Kconfig                         |    8 -
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |   10 -
 drivers/iommu/ipmmu-vmsa.c                    |   69 -
 drivers/iommu/msm_iommu.c                     |    7 +-
 drivers/iommu/mtk_iommu.h                     |    2 -
 drivers/iommu/mtk_iommu_v1.c                  |  153 +--
 drivers/iommu/omap-iommu.c                    |   22 +-
 drivers/iommu/tegra-gart.c                    |   17 +-
 drivers/iommu/tegra-smmu.c                    |   37 +-
 drivers/media/platform/Kconfig                |    1 -
 drivers/media/platform/omap3isp/isp.c         |   68 +-
 drivers/media/platform/omap3isp/isp.h         |    3 -
 drivers/staging/media/tegra-vde/iommu.c       |   12 -
 30 files changed, 150 insertions(+), 1660 deletions(-)
 delete mode 100644 arch/arm/include/asm/dma-iommu.h

-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
