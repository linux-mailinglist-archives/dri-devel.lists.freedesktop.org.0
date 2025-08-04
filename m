Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64835B1AB84
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 01:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2B10E5C5;
	Mon,  4 Aug 2025 23:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 04 Aug 2025 14:17:40 UTC
Received: from kanga.kvack.org (kanga.kvack.org [205.233.56.17])
 by gabe.freedesktop.org (Postfix) with ESMTP id 433CB10E0C5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:17:40 +0000 (UTC)
Received: by kanga.kvack.org (Postfix, from userid 63042)
 id 8AB4F6B009F; Mon,  4 Aug 2025 10:10:32 -0400 (EDT)
Date: Mon, 4 Aug 2025 10:10:32 -0400
From: Benjamin LaHaise <bcrl@kvack.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 00/10] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20250804141032.GA30056@kvack.org>
References: <cover.1754311439.git.leon@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1754311439.git.leon@kernel.org>
User-Agent: Mutt/1.4.2.2i
X-Mailman-Approved-At: Mon, 04 Aug 2025 23:43:20 +0000
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

FYI: this entire patch series was rejected as spam by large numbers of
linux-mm subscribers using @gmail.com email addresses.

		-ben (owner-linux-mm)

On Mon, Aug 04, 2025 at 04:00:35PM +0300, Leon Romanovsky wrote:
> Changelog:
> v1:
>  * Changed commit messages.
>  * Reused DMA_ATTR_MMIO attribute.
>  * Returned support for multiple DMA ranges per-dMABUF.
> v0: https://lore.kernel.org/all/cover.1753274085.git.leonro@nvidia.com
> 
> ---------------------------------------------------------------------------
> Based on "[PATCH v1 00/16] dma-mapping: migrate to physical address-based API"
> https://lore.kernel.org/all/cover.1754292567.git.leon@kernel.org series.
> ---------------------------------------------------------------------------
> 
> This series extends the VFIO PCI subsystem to support exporting MMIO regions
> from PCI device BARs as dma-buf objects, enabling safe sharing of non-struct
> page memory with controlled lifetime management. This allows RDMA and other
> subsystems to import dma-buf FDs and build them into memory regions for PCI
> P2P operations.
> 
> The series supports a use case for SPDK where a NVMe device will be owned
> by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> may directly access the NVMe CMB or directly manipulate the NVMe device's
> doorbell using PCI P2P.
> 
> However, as a general mechanism, it can support many other scenarios with
> VFIO. This dmabuf approach can be usable by iommufd as well for generic
> and safe P2P mappings.
> 
> In addition to the SPDK use-case mentioned above, the capability added
> in this patch series can also be useful when a buffer (located in device
> memory such as VRAM) needs to be shared between any two dGPU devices or
> instances (assuming one of them is bound to VFIO PCI) as long as they
> are P2P DMA compatible.
> 
> The implementation provides a revocable attachment mechanism using dma-buf
> move operations. MMIO regions are normally pinned as BARs don't change
> physical addresses, but access is revoked when the VFIO device is closed
> or a PCI reset is issued. This ensures kernel self-defense against
> potentially hostile userspace.
> 
> The series includes significant refactoring of the PCI P2PDMA subsystem
> to separate core P2P functionality from memory allocation features,
> making it more modular and suitable for VFIO use cases that don't need
> struct page support.
> 
> -----------------------------------------------------------------------
> The series is based originally on
> https://lore.kernel.org/all/20250307052248.405803-1-vivek.kasireddy@intel.com/
> but heavily rewritten to be based on DMA physical API.
> -----------------------------------------------------------------------
> The WIP branch can be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio-v1
> 
> Thanks
> 
> Leon Romanovsky (8):
>   PCI/P2PDMA: Remove redundant bus_offset from map state
>   PCI/P2PDMA: Separate the mmap() support from the core logic
>   PCI/P2PDMA: Simplify bus address mapping API
>   PCI/P2PDMA: Refactor to separate core P2P functionality from memory
>     allocation
>   PCI/P2PDMA: Export pci_p2pdma_map_type() function
>   types: move phys_vec definition to common header
>   vfio/pci: Enable peer-to-peer DMA transactions by default
>   vfio/pci: Add dma-buf export support for MMIO regions
> 
> Vivek Kasireddy (2):
>   vfio: Export vfio device get and put registration helpers
>   vfio/pci: Share the core device pointer while invoking feature
>     functions
> 
>  block/blk-mq-dma.c                 |   7 +-
>  drivers/iommu/dma-iommu.c          |   4 +-
>  drivers/pci/p2pdma.c               | 154 ++++++++----
>  drivers/vfio/pci/Kconfig           |  20 ++
>  drivers/vfio/pci/Makefile          |   2 +
>  drivers/vfio/pci/vfio_pci_config.c |  22 +-
>  drivers/vfio/pci/vfio_pci_core.c   |  59 +++--
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 390 +++++++++++++++++++++++++++++
>  drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
>  drivers/vfio/vfio_main.c           |   2 +
>  include/linux/dma-buf.h            |   1 +
>  include/linux/pci-p2pdma.h         | 114 +++++----
>  include/linux/types.h              |   5 +
>  include/linux/vfio.h               |   2 +
>  include/linux/vfio_pci_core.h      |   4 +
>  include/uapi/linux/vfio.h          |  25 ++
>  kernel/dma/direct.c                |   4 +-
>  mm/hmm.c                           |   2 +-
>  18 files changed, 715 insertions(+), 125 deletions(-)
>  create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c
> 
> -- 
> 2.50.1
> 

-- 
"Thought is the essence of where you are now."
