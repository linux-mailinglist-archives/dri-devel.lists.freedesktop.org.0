Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C213E59611A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 19:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310D310FDE4;
	Tue, 16 Aug 2022 17:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0E0110E6D0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:28:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A20D113E;
 Tue, 16 Aug 2022 10:28:14 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54B573F67D;
 Tue, 16 Aug 2022 10:28:11 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH 1/3] iommu/dma: Clean up Kconfig
Date: Tue, 16 Aug 2022 18:28:03 +0100
Message-Id: <2e33c8bc2b1bb478157b7964bfed976cb7466139.1660668998.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
In-Reply-To: <cover.1660668998.git.robin.murphy@arm.com>
References: <cover.1660668998.git.robin.murphy@arm.com>
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

Although iommu-dma is a per-architecture chonce, that is currently
implemented in a rather haphazard way. Selecting from the arch Kconfig
was the original logical approach, but is complicated by having to
manage dependencies; conversely, selecting from drivers ends up hiding
the architecture dependency *too* well. Instead, let's just have it
enable itself automatically when IOMMU API support is enabled for the
relevant architectures. It can't get much clearer than that.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/Kconfig          | 1 -
 drivers/iommu/Kconfig       | 3 +--
 drivers/iommu/amd/Kconfig   | 1 -
 drivers/iommu/intel/Kconfig | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 571cc234d0b3..59af600445c2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -209,7 +209,6 @@ config ARM64
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
-	select IOMMU_DMA if IOMMU_SUPPORT
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 5c5cb5bee8b6..1d99c2d984fb 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -137,7 +137,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	bool
+	def_bool ARM64 || IA64 || X86
 	select DMA_OPS
 	select IOMMU_API
 	select IOMMU_IOVA
@@ -476,7 +476,6 @@ config VIRTIO_IOMMU
 	depends on VIRTIO
 	depends on (ARM64 || X86)
 	select IOMMU_API
-	select IOMMU_DMA
 	select INTERVAL_TREE
 	select ACPI_VIOT if ACPI
 	help
diff --git a/drivers/iommu/amd/Kconfig b/drivers/iommu/amd/Kconfig
index a3cbafb603f5..9b5fc3356bf2 100644
--- a/drivers/iommu/amd/Kconfig
+++ b/drivers/iommu/amd/Kconfig
@@ -9,7 +9,6 @@ config AMD_IOMMU
 	select PCI_PASID
 	select IOMMU_API
 	select IOMMU_IOVA
-	select IOMMU_DMA
 	select IOMMU_IO_PGTABLE
 	depends on X86_64 && PCI && ACPI && HAVE_CMPXCHG_DOUBLE
 	help
diff --git a/drivers/iommu/intel/Kconfig b/drivers/iommu/intel/Kconfig
index 39a06d245f12..c48005147ac5 100644
--- a/drivers/iommu/intel/Kconfig
+++ b/drivers/iommu/intel/Kconfig
@@ -19,7 +19,6 @@ config INTEL_IOMMU
 	select DMAR_TABLE
 	select SWIOTLB
 	select IOASID
-	select IOMMU_DMA
 	select PCI_ATS
 	help
 	  DMA remapping (DMAR) devices support enables independent address
-- 
2.36.1.dirty

