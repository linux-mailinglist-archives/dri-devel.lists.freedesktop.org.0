Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7AAC28AFB
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 09:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BC210E1C2;
	Sun,  2 Nov 2025 08:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GeQrdtgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B2710E1C2
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 08:01:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F50444792;
 Sun,  2 Nov 2025 08:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DD8C116B1;
 Sun,  2 Nov 2025 08:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762070501;
 bh=YEj7lVMjG/2/HYFIZSu2/o74kulmj1G6rnGXJYyVmnc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GeQrdtgqOBrp3SSL7bb5BM8UNhWStBmhQNvnJTJpY6b87guzPaUbYr977bcX7Pcys
 Yxc87/WEOCpr6+I0a7aOihy/M040Q6oJAKt57MOitktMdBkKYSmRvVAAGUFmu4cRLb
 GiF0K3SKuEWa1PiQpGez3mj2ynIUSgJZxBoWSI1HJOfm04/lnNUCVZWvEW4UjqNf4s
 jjzG8Y+HrfUFjn/1FmYPnjRoCfkF/8U5zQ5n8a4lLbMq7qhZ1JrKOuODyBz90mBK/0
 RitZslKa0LprpIxm9rOwwbV/sDXoBPlF9joy4PQkCxYROfGTF3sOOrE20g3w3riJVo
 h/0R1XRSwONlw==
From: Leon Romanovsky <leon@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Jens Axboe <axboe@kernel.dk>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v6 05/11] PCI/P2PDMA: Document DMABUF model
Date: Sun,  2 Nov 2025 10:00:53 +0200
Message-ID: <20251102-dmabuf-vfio-v6-5-d773cff0db9f@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
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

From: Jason Gunthorpe <jgg@nvidia.com>

Reflect latest changes in p2p implementation to support DMABUF lifecycle.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 Documentation/driver-api/pci/p2pdma.rst | 95 +++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 23 deletions(-)

diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
index d0b241628cf1..c43ec1356471 100644
--- a/Documentation/driver-api/pci/p2pdma.rst
+++ b/Documentation/driver-api/pci/p2pdma.rst
@@ -9,22 +9,47 @@ between two devices on the bus. This type of transaction is henceforth
 called Peer-to-Peer (or P2P). However, there are a number of issues that
 make P2P transactions tricky to do in a perfectly safe way.
 
-One of the biggest issues is that PCI doesn't require forwarding
-transactions between hierarchy domains, and in PCIe, each Root Port
-defines a separate hierarchy domain. To make things worse, there is no
-simple way to determine if a given Root Complex supports this or not.
-(See PCIe r4.0, sec 1.3.1). Therefore, as of this writing, the kernel
-only supports doing P2P when the endpoints involved are all behind the
-same PCI bridge, as such devices are all in the same PCI hierarchy
-domain, and the spec guarantees that all transactions within the
-hierarchy will be routable, but it does not require routing
-between hierarchies.
-
-The second issue is that to make use of existing interfaces in Linux,
-memory that is used for P2P transactions needs to be backed by struct
-pages. However, PCI BARs are not typically cache coherent so there are
-a few corner case gotchas with these pages so developers need to
-be careful about what they do with them.
+For PCIe the routing of TLPs is well defined up until they reach a host bridge
+or root port. If the path includes PCIe switches then based on the ACS settings
+the transaction can route entirely within the PCIe hierarchy and never reach the
+root port. The kernel will evaluate the PCIe topology and always permit P2P
+in these well defined cases.
+
+However, if the P2P transaction reaches the host bridge then it might have to
+hairpin back out the same root port, be routed inside the CPU SOC to another
+PCIe root port, or routed internally to the SOC.
+
+As this is not well defined or well supported in real HW the kernel defaults to
+blocking such routing. There is an allow list to allow detecting known-good HW,
+in which case P2P between any two PCIe devices will be permitted.
+
+Since P2P inherently is doing transactions between two devices it requires two
+drivers to be co-operating inside the kernel. The providing driver has to convay
+its MMIO to the consuming driver. To meet the driver model lifecycle rules the
+MMIO must have all DMA mapping removed, all CPU accesses prevented, all page
+table mappings undone before the providing driver completes remove().
+
+This requires the providing and consuming driver to actively work together to
+guarentee that the consuming driver has stopped using the MMIO during a removal
+cycle. This is done by either a synchronous invalidation shutdown or waiting
+for all usage refcounts to reach zero.
+
+At the lowest level the P2P subsystem offers a naked struct p2p_provider that
+delegates lifecycle management to the providing driver. It is expected that
+drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
+to provide an invalidation shutdown. These MMIO pages have no struct page, and
+if are used with mmap() must create special PTEs. As such there are very few
+kernel uAPIs that can accept pointers to them, in particular they cannot be used
+with read()/write(), including O_DIRECT.
+
+Building on this, the subsystem offers a layer to wrap the MMIO in a ZONE_DEVICE
+pggmap of MEMORY_DEVICE_PCI_P2PDMA to create struct pages. The lifecylce of
+pgmap ensures that when the pgmap is destroyed all other drivers have stopped
+using the MMIO. This option works with O_DIRECT flows, in some cases, if the
+underlying subsystem supports handling MEMORY_DEVICE_PCI_P2PDMA through
+FOLL_PCI_P2PDMA. The use of FOLL_LONGTERM is prevented. As this relies on pgmap
+it also relies on architecture support along with alignment and minimum size
+limitations.
 
 
 Driver Writer's Guide
@@ -114,14 +139,38 @@ allocating scatter-gather lists with P2P memory.
 Struct Page Caveats
 -------------------
 
-Driver writers should be very careful about not passing these special
-struct pages to code that isn't prepared for it. At this time, the kernel
-interfaces do not have any checks for ensuring this. This obviously
-precludes passing these pages to userspace.
+While the MEMORY_DEVICE_PCI_P2PDMA pages can be installed in VMAs,
+pin_user_pages() and related will not return them unless FOLL_PCI_P2PDMA is set.
 
-P2P memory is also technically IO memory but should never have any side
-effects behind it. Thus, the order of loads and stores should not be important
-and ioreadX(), iowriteX() and friends should not be necessary.
+The MEMORY_DEVICE_PCI_P2PDMA pages require care to support in the kernel. The
+KVA is still MMIO and must still be accessed through the normal
+readX()/writeX()/etc helpers. Direct CPU access (e.g. memcpy) is forbidden, just
+like any other MMIO mapping. While this will actually work on some
+architectures, others will experiance corruption or just crash in the kernel.
+Supporting FOLL_PCI_P2PDMA in a subsystem requires scrubbing it to ensure no CPU
+access happens.
+
+
+Usage With DMABUF
+=================
+
+DMABUF provides an alternative to the above struct page based
+client/provider/orchestrator system. In this mode the exporting driver will wrap
+some of its MMIO in a DMABUF and give the DMABUF FD to userspace.
+
+Userspace can then pass the FD to an importing driver which will ask the
+exporting driver to map it.
+
+In this case the initator and target pci_devices are known and the P2P subsystem
+is used to determine the mapping type. The phys_addr_t based DMA API is used to
+establish the dma_addr_t.
+
+Lifecycle is controlled by DMABUF move_notify(), when the exporting driver wants
+to remove() it must deliver an invalidation shutdown to all DMABUF importing
+drivers through move_notify() and synchronously DMA unmap all the MMIO.
+
+No importing driver can continue to have a DMA map to the MMIO after the
+exporting driver has destroyed it's p2p_provider.
 
 
 P2P DMA Support Library

-- 
2.51.0

