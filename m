Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C5B9F7F6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A101E10E923;
	Thu, 25 Sep 2025 13:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nyyiardu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419C910E925
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:18:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B58F26058A;
 Thu, 25 Sep 2025 13:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDB3C4CEF7;
 Thu, 25 Sep 2025 13:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758806332;
 bh=J3JcsAko8zSIGuiXV9DflNw5AuJmzcXfJS1bY+J5d1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nyyiardu2Jm2P99Ky9DPkc45OpBK6VXC2cDJ2ntyOymvqcGgd7qxrLq7aOKcpmvrB
 5XtWc3qlZGvSsKGzKNx+xxbBh9eXebQcre8M4Bb/SEeFez1GqGCqP9IYRto9erX4mA
 xMbo23J/F/gS9OYPIVigsvaRVXoubU6we02xEUbwHPq2xk6hXv4kjVijzWspwlc1DQ
 i35RE92E6sbTQMb59F66xvBBp/vg5DYOswYfaxASsoGs62yrjSwe8ELTEJGw6PkZ4a
 C+Bv9QieZeKuF7wRH7Mb2kELbArKXalgOTpImh/q8etNoCarPsndtLwMReFQauTWd0
 bwvkCQ5iBtzuQ==
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 07/10] vfio/pci: Add dma-buf export config for MMIO regions
Date: Thu, 25 Sep 2025 16:14:35 +0300
Message-ID: <b3b718403b85e792ddc8a8a1c47ff214b416eb7b.1758804980.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758804980.git.leon@kernel.org>
References: <cover.1758804980.git.leon@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leon Romanovsky <leonro@nvidia.com>

Add new kernel config which indicates support for dma-buf export
of MMIO regions, which implementation is provided in next patches.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..55ae888bf26ae 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -55,6 +55,26 @@ config VFIO_PCI_ZDEV_KVM
 
 	  To enable s390x KVM vfio-pci extensions, say Y.
 
+config VFIO_PCI_DMABUF
+	bool "VFIO PCI extensions for DMA-BUF"
+	depends on VFIO_PCI_CORE
+	depends on PCI_P2PDMA && DMA_SHARED_BUFFER
+	default y
+	help
+	  Enable support for VFIO PCI extensions that allow exporting
+	  device MMIO regions as DMA-BUFs for peer devices to access via
+	  peer-to-peer (P2P) DMA.
+
+	  This feature enables a VFIO-managed PCI device to export a portion
+	  of its MMIO BAR as a DMA-BUF file descriptor, which can be passed
+	  to other userspace drivers or kernel subsystems capable of
+	  initiating DMA to that region.
+
+	  Say Y here if you want to enable VFIO DMABUF-based MMIO export
+	  support for peer-to-peer DMA use cases.
+
+	  If unsure, say N.
+
 source "drivers/vfio/pci/mlx5/Kconfig"
 
 source "drivers/vfio/pci/hisilicon/Kconfig"
-- 
2.51.0

