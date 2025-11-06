Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC27C3BA17
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82D310E8F9;
	Thu,  6 Nov 2025 14:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nCbgfcJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B24310E8F2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:17:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C4148404CD;
 Thu,  6 Nov 2025 14:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03904C116C6;
 Thu,  6 Nov 2025 14:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762438624;
 bh=ZavZy68UqW1iEHt3XxoVBWkpiyDI0Ett9ka52Qq65eI=;
 h=From:To:Cc:Subject:Date:From;
 b=nCbgfcJJVAgp+47hn67gndUHr6jEkmDHYevSsgdB5u5pebS46j/IfiyAve50aSXBu
 aE2CpvHtBtgp9TYWeQB60v7v8aRp13S181ShG8FUfQm0nstDguR221Vb7BHMPQbpIs
 egK4YhZbKb2yklQGRma1CORzcRTPN2v4cpKPf/hy5ca1rFZywrLH5IPrUHSmWl4qQv
 +l2Zjq3BoFBbOZCfoc90fijvuepqQT7tFLnc1Nz76CuWE2FH8bdQraHWWHdp/0/bcB
 gRpfVwIYMmpMY+6eqM7EkWVLT6tUZ34cKVrMY7m/bLt3v6xx0uKDgyPb7fgUXscM6r
 5e5y+vSnehUtw==
From: Leon Romanovsky <leon@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Jens Axboe <axboe@kernel.dk>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v7 00/11] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Date: Thu,  6 Nov 2025 16:16:45 +0200
Message-ID: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251016-dmabuf-vfio-6cef732adf5a
X-Mailer: b4 0.15-dev-3ae27
Content-Transfer-Encoding: quoted-printable
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

Changelog:=0D
v7:=0D
 * Dropped restore_revoke flag and added vfio_pci_dma_buf_move=0D
   to reverse loop.=0D
 * Fixed spelling errors in documentation patch.=0D
 * Rebased on top of v6.18-rc3.=0D
 * Added include to stddef.h to vfio.h, to keep uapi header file independen=
t.=0D
v6: https://patch.msgid.link/20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.=
com=0D
 * Fixed wrong error check from pcim_p2pdma_init().=0D
 * Documented pcim_p2pdma_provider() function.=0D
 * Improved commit messages.=0D
 * Added VFIO DMA-BUF selftest, not sent yet.=0D
 * Added __counted_by(nr_ranges) annotation to struct vfio_device_feature_d=
ma_buf.=0D
 * Fixed error unwind when dma_buf_fd() fails.=0D
 * Document latest changes to p2pmem.=0D
 * Removed EXPORT_SYMBOL_GPL from pci_p2pdma_map_type.=0D
 * Moved DMA mapping logic to DMA-BUF.=0D
 * Removed types patch to avoid dependencies between subsystems.=0D
 * Moved vfio_pci_dma_buf_move() in err_undo block.=0D
 * Added nvgrace patch.=0D
v5: https://lore.kernel.org/all/cover.1760368250.git.leon@kernel.org=0D
 * Rebased on top of v6.18-rc1.=0D
 * Added more validation logic to make sure that DMA-BUF length doesn't=0D
   overflow in various scenarios.=0D
 * Hide kernel config from the users.=0D
 * Fixed type conversion issue. DMA ranges are exposed with u64 length,=0D
   but DMA-BUF uses "unsigned int" as a length for SG entries.=0D
 * Added check to prevent from VFIO drivers which reports BAR size=0D
   different from PCI, do not use DMA-BUF functionality.=0D
v4: https://lore.kernel.org/all/cover.1759070796.git.leon@kernel.org=0D
 * Split pcim_p2pdma_provider() to two functions, one that initializes=0D
   array of providers and another to return right provider pointer.=0D
v3: https://lore.kernel.org/all/cover.1758804980.git.leon@kernel.org=0D
 * Changed pcim_p2pdma_enable() to be pcim_p2pdma_provider().=0D
 * Cache provider in vfio_pci_dma_buf struct instead of BAR index.=0D
 * Removed misleading comment from pcim_p2pdma_provider().=0D
 * Moved MMIO check to be in pcim_p2pdma_provider().=0D
v2: https://lore.kernel.org/all/cover.1757589589.git.leon@kernel.org/=0D
 * Added extra patch which adds new CONFIG, so next patches can reuse=0D
 * it.=0D
 * Squashed "PCI/P2PDMA: Remove redundant bus_offset from map state"=0D
   into the other patch.=0D
 * Fixed revoke calls to be aligned with true->false semantics.=0D
 * Extended p2pdma_providers to be per-BAR and not global to whole=0D
 * device.=0D
 * Fixed possible race between dmabuf states and revoke.=0D
 * Moved revoke to PCI BAR zap block.=0D
v1: https://lore.kernel.org/all/cover.1754311439.git.leon@kernel.org=0D
 * Changed commit messages.=0D
 * Reused DMA_ATTR_MMIO attribute.=0D
 * Returned support for multiple DMA ranges per-dMABUF.=0D
v0: https://lore.kernel.org/all/cover.1753274085.git.leonro@nvidia.com=0D
=0D
---------------------------------------------------------------------------=
=0D
Based on "[PATCH v6 00/16] dma-mapping: migrate to physical address-based A=
PI"=0D
https://lore.kernel.org/all/cover.1757423202.git.leonro@nvidia.com/ series.=
=0D
---------------------------------------------------------------------------=
=0D
=0D
This series extends the VFIO PCI subsystem to support exporting MMIO=0D
regions from PCI device BARs as dma-buf objects, enabling safe sharing of=0D
non-struct page memory with controlled lifetime management. This allows RDM=
A=0D
and other subsystems to import dma-buf FDs and build them into memory regio=
ns=0D
for PCI P2P operations.=0D
=0D
The series supports a use case for SPDK where a NVMe device will be=0D
owned by SPDK through VFIO but interacting with a RDMA device. The RDMA=0D
device may directly access the NVMe CMB or directly manipulate the NVMe=0D
device's doorbell using PCI P2P.=0D
=0D
However, as a general mechanism, it can support many other scenarios with=0D
VFIO. This dmabuf approach can be usable by iommufd as well for generic=0D
and safe P2P mappings.=0D
=0D
In addition to the SPDK use-case mentioned above, the capability added=0D
in this patch series can also be useful when a buffer (located in device=0D
memory such as VRAM) needs to be shared between any two dGPU devices or=0D
instances (assuming one of them is bound to VFIO PCI) as long as they=0D
are P2P DMA compatible.=0D
=0D
The implementation provides a revocable attachment mechanism using dma-buf=
=0D
move operations. MMIO regions are normally pinned as BARs don't change=0D
physical addresses, but access is revoked when the VFIO device is closed=0D
or a PCI reset is issued. This ensures kernel self-defense against=0D
potentially hostile userspace.=0D
=0D
The series includes significant refactoring of the PCI P2PDMA subsystem=0D
to separate core P2P functionality from memory allocation features,=0D
making it more modular and suitable for VFIO use cases that don't need=0D
struct page support.=0D
=0D
-----------------------------------------------------------------------=0D
The series is based originally on=0D
https://lore.kernel.org/all/20250307052248.405803-1-vivek.kasireddy@intel.c=
om/=0D
but heavily rewritten to be based on DMA physical API.=0D
-----------------------------------------------------------------------=0D
The WIP branch can be found here:=0D
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=
=3Ddmabuf-vfio-v7=0D
=0D
Thanks=0D
=0D
---=0D
Jason Gunthorpe (2):=0D
      PCI/P2PDMA: Document DMABUF model=0D
      vfio/nvgrace: Support get_dmabuf_phys=0D
=0D
Leon Romanovsky (7):=0D
      PCI/P2PDMA: Separate the mmap() support from the core logic=0D
      PCI/P2PDMA: Simplify bus address mapping API=0D
      PCI/P2PDMA: Refactor to separate core P2P functionality from memory a=
llocation=0D
      PCI/P2PDMA: Provide an access to pci_p2pdma_map_type() function=0D
      dma-buf: provide phys_vec to scatter-gather mapping routine=0D
      vfio/pci: Enable peer-to-peer DMA transactions by default=0D
      vfio/pci: Add dma-buf export support for MMIO regions=0D
=0D
Vivek Kasireddy (2):=0D
      vfio: Export vfio device get and put registration helpers=0D
      vfio/pci: Share the core device pointer while invoking feature functi=
ons=0D
=0D
 Documentation/driver-api/pci/p2pdma.rst |  95 +++++++---=0D
 block/blk-mq-dma.c                      |   2 +-=0D
 drivers/dma-buf/dma-buf.c               | 235 ++++++++++++++++++++++++=0D
 drivers/iommu/dma-iommu.c               |   4 +-=0D
 drivers/pci/p2pdma.c                    | 182 +++++++++++++-----=0D
 drivers/vfio/pci/Kconfig                |   3 +=0D
 drivers/vfio/pci/Makefile               |   1 +=0D
 drivers/vfio/pci/nvgrace-gpu/main.c     |  56 ++++++=0D
 drivers/vfio/pci/vfio_pci.c             |   5 +=0D
 drivers/vfio/pci/vfio_pci_config.c      |  22 ++-=0D
 drivers/vfio/pci/vfio_pci_core.c        |  53 ++++--=0D
 drivers/vfio/pci/vfio_pci_dmabuf.c      | 315 ++++++++++++++++++++++++++++=
++++=0D
 drivers/vfio/pci/vfio_pci_priv.h        |  23 +++=0D
 drivers/vfio/vfio_main.c                |   2 +=0D
 include/linux/dma-buf.h                 |  18 ++=0D
 include/linux/pci-p2pdma.h              | 120 +++++++-----=0D
 include/linux/vfio.h                    |   2 +=0D
 include/linux/vfio_pci_core.h           |  42 +++++=0D
 include/uapi/linux/vfio.h               |  28 +++=0D
 kernel/dma/direct.c                     |   4 +-=0D
 mm/hmm.c                                |   2 +-=0D
 21 files changed, 1074 insertions(+), 140 deletions(-)=0D
---=0D
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa=0D
change-id: 20251016-dmabuf-vfio-6cef732adf5a=0D
=0D
Best regards,=0D
--  =0D
Leon Romanovsky <leonro@nvidia.com>=0D
=0D
