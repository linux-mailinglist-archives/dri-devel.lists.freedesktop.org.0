Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AD1CEFCC
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 10:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFF76E893;
	Tue, 12 May 2020 08:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57A76E893
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:57:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512085722euoutp011f71a0cccbd44bf6c6bdc58a40e81c3d~OPCPD38Bu2132121321euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:57:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512085722euoutp011f71a0cccbd44bf6c6bdc58a40e81c3d~OPCPD38Bu2132121321euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589273842;
 bh=MXURRBK33XuZuGQC15bomjU/50LbRX6sZzxnM4phfmw=;
 h=From:To:Cc:Subject:Date:References:From;
 b=rUNR4zlrEhWwEEmNCDOsZXgeKvJU4SsGKCA9vjHM7x8Or5MU5W2QVUYj4PImM6BAP
 yRIydbpzEv9z5SWgW49W/x7jaeQz2FXxrCAMlrMVGgmVyZfErXbhg8+JjbJ/WxA9vg
 pXdJx/GW1J53VRjBwivFhltJJhzSKK1ATwQUJyyM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512085722eucas1p118c81c2e907205932f8db1bc3de83ab6~OPCO0Od5U0929709297eucas1p1K;
 Tue, 12 May 2020 08:57:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AD.AA.60698.2F46ABE5; Tue, 12
 May 2020 09:57:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512085722eucas1p2fbaab30e49c9ddadc64b27db856e5921~OPCOXuBQ90706907069eucas1p2w;
 Tue, 12 May 2020 08:57:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512085722eusmtrp2548ffcc6b97981fdcb35d23d84f48cea~OPCOW9hyI0207602076eusmtrp2I;
 Tue, 12 May 2020 08:57:22 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-86-5eba64f2d767
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F1.32.07950.1F46ABE5; Tue, 12
 May 2020 09:57:22 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200512085721eusmtip2ef3392596a7ed9db78764520aa0ba461~OPCN5xrAT1441014410eusmtip2S;
 Tue, 12 May 2020 08:57:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/38] DRM: fix struct sg_table nents vs. orig_nents misuse
Date: Tue, 12 May 2020 10:57:10 +0200
Message-Id: <20200512085710.14688-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djPc7qfUnbFGexpl7foPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgiuKySUnN
 ySxLLdK3S+DK+LZzG1vBXt+KU6vuszUwHrbuYuTkkBAwkbgwaxVbFyMXh5DACkaJdxf+MkM4
 Xxgl3r+8wAThfGaUWNB8iBmm5fi0dYwQieWMEjMaW5ngWiZe6mUCqWITMJToetvFBmKLCLQy
 Spzo5QGxmQVmMEkcfV0KYgsLBEgs23iJpYuRg4NFQFViVi8HSJhXwFbiwO45TBDL5CVWbzgA
 dpKEwGR2iWVrZzNCJFwkLt/7wgZhC0u8Or6FHcKWkfi/cz4TREMzo8TDc2vZIZweRonLTTOg
 uq0l7pz7xQaymVlAU2L9Ln2IsKPE9wP7mUDCEgJ8EjfeCkLczCcxadt0Zogwr0RHmxBEtZrE
 rOPr4NYevHAJGkAeElvftoLZQgKxEnvPv2efwCg3C2HXAkbGVYziqaXFuempxcZ5qeV6xYm5
 xaV56XrJ+bmbGIEp5vS/4193MO77k3SIUYCDUYmHt8NoZ5wQa2JZcWXuIUYJDmYlEd6WTKAQ
 b0piZVVqUX58UWlOavEhRmkOFiVxXuNFL2OFBNITS1KzU1MLUotgskwcnFINjPX9X0vnWHlZ
 N+2wu/i+vlg2R+lnzIYH74JmrnhSvvbu0td3rm18zc6ZIfDmbHjxjRUOF1urYo79f+Ct2DfL
 Vaqj89u8z4ZdL1giuDrdQx7xOwre99RhUvzJuSjXtKCmcrqT5NLffgZ+Z89kWXWKP9GOeRnM
 Ka60pOevtEFp1dPkZsNji9IPK7EUZyQaajEXFScCADFnKEItAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsVy+t/xe7qfUnbFGVw5xmTRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGF14PZYM28N
 o8febwtYPLZ/e8Dqcb/7OJPH5iX1Hrf/PWb2mHxjOaPH7psNbB59W1YxenzeJBfAFaVnU5Rf
 WpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8W3nNraCvb4V
 p1bdZ2tgPGzdxcjJISFgInF82jpGEFtIYCmjxN5mNoi4jMTJaQ2sELawxJ9rXUBxLqCaT4wS
 jxaeBkuwCRhKdL2FSIgIdDJKTOv+yA7iMAvMY5JY9PAQkMPBISzgJ7HsiBWIySKgKjGrlwOk
 l1fAVuLA7jlMEAvkJVZvOMA8gZFnASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDA3nbs
 55YdjF3vgg8xCnAwKvHwdhjtjBNiTSwrrsw9xCjBwawkwtuSCRTiTUmsrEotyo8vKs1JLT7E
 aAq0eyKzlGhyPjDq8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
 ME67I6ddHfPmeIlZ3GPhIvUXU9/9FasIe/zJqeXMPqft4R56tY9Tgm0+1+9YwT7Fyf6dqfny
 OoG5E4/rXDpa8fKo95OECfJ7i1yvXrv2mN3N9JSy1gbTfOXa6/whklk5Kr+LFsx/dXbtWtXF
 KgfWvl1S//qCpWX/k5Y7h59HW6w/21M54+eqM11KLMUZiYZazEXFiQD7wsNDggIAAA==
X-CMS-MailID: 20200512085722eucas1p2fbaab30e49c9ddadc64b27db856e5921
X-Msg-Generator: CA
X-RootMTR: 20200512085722eucas1p2fbaab30e49c9ddadc64b27db856e5921
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512085722eucas1p2fbaab30e49c9ddadc64b27db856e5921
References: <CGME20200512085722eucas1p2fbaab30e49c9ddadc64b27db856e5921@eucas1p2.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear All,

During the Exynos DRM GEM rework and fixing the issues in the.
drm_prime_sg_to_page_addr_arrays() function [1] I've noticed that most
drivers in DRM framework incorrectly use nents and orig_nents entries of
the struct sg_table.

In case of the most DMA-mapping implementations exchanging those two
entries or using nents for all loops on the scatterlist is harmless,
because they both have the same value. There exists however a DMA-mapping
implementations, for which such incorrect usage breaks things. The nents
returned by dma_map_sg() might be lower than the nents passed as its
parameter and this is perfectly fine. DMA framework or IOMMU is allowed
to join consecutive chunks while mapping if such operation is supported
by the underlying HW (bus, bridge, IOMMU, etc). Example of the case
where dma_map_sg() might return 1 'DMA' chunk for the 4 'physical' pages
is described here [2]

The DMA-mapping framework documentation [3] states that dma_map_sg()
returns the numer of the created entries in the DMA address space.
However the subsequent calls to dma_sync_sg_for_{device,cpu} and
dma_unmap_sg must be called with the original number of entries passed to
dma_map_sg. The common pattern in DRM drivers were to assign the
dma_map_sg() return value to sg_table->nents and use that value for
the subsequent calls to dma_sync_sg_* or dma_unmap_sg functions. Also
the code iterated over nents times to access the pages stored in the
processed scatterlist, while it should use orig_nents as the numer of
the page entries.

I've tried to identify all such incorrect usage of sg_table->nents and
this is a result of my research. It looks that the incorrect pattern has
been copied over the many drivers mainly in the DRM subsystem. Too bad in
most cases it even worked correctly if the system used a simple, linear
DMA-mapping implementation, for which swapping nents and orig_nents
doesn't make any difference. To avoid similar issues in the future, I've
introduced a common wrappers for DMA-mapping calls, which operate directly
on the sg_table objects. I've also added wrappers for iterating over the
scatterlists stored in the sg_table objects and applied them where
possible. This, together with some common DRM prime helpers, allowed me
to almost get rid of all nents/orig_nents usage in the drivers. I hope
that such change makes the code robust, easier to follow and copy/paste
safe.

The biggest TODO is DRM/i915 driver and I don't feel brave enough to fix
it fully. The driver creatively uses sg_table->orig_nents to store the
size of the allocate scatterlist and ignores the number of the entries
returned by dma_map_sg function. In this patchset I only fixed the
sg_table objects exported by dmabuf related functions. I hope that I
didn't break anything there.

Patches are based on top of Linux next-20200511.

Best regards,
Marek Szyprowski


References:

[1] https://lkml.org/lkml/2020/3/27/555.
[2] https://lkml.org/lkml/2020/3/29/65
[3] Documentation/DMA-API-HOWTO.txt


Changelog:

v4:
- added for_each_sgtable_* wrappers and applied where possible
- added drm_prime_get_contiguous_size() and applied where possible
- applied drm_prime_sg_to_page_addr_arrays() where possible to remove page
  extraction from sg_table objects
- added documentation for the introduced wrappers
- improved patches description a bit

v3: https://lore.kernel.org/dri-devel/20200505083926.28503-1-m.szyprowski@samsung.com/
- introduce dma_*_sgtable_* wrappers and use them in all patches

v2: https://lore.kernel.org/linux-iommu/c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com/T/
- dropped most of the changes to drm/i915
- added fixes for rcar-du, xen, media and ion
- fixed a few issues pointed by kbuild test robot
- added wide cc: list for each patch

v1: https://lore.kernel.org/linux-iommu/c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com/T/
- initial version


Patch summary:

Marek Szyprowski (38):
  dma-mapping: add generic helpers for mapping sgtable objects
  scatterlist: add generic wrappers for iterating over sgtable objects
  iommu: add generic helper for mapping sgtable objects
  drm: prime: add common helper to check scatterlist contiguity
  drm: prime: use sgtable iterators in
    drm_prime_sg_to_page_addr_arrays()
  drm: core: fix common struct sg_table related issues
  drm: amdgpu: fix common struct sg_table related issues
  drm: armada: fix common struct sg_table related issues
  drm: etnaviv: fix common struct sg_table related issues
  drm: exynos: use common helper for a scatterlist contiguity check
  drm: exynos: fix common struct sg_table related issues
  drm: i915: fix common struct sg_table related issues
  drm: lima: fix common struct sg_table related issues
  drm: mediatek: use common helper for a scatterlist contiguity check
  drm: mediatek: use common helper for extracting pages array
  drm: msm: fix common struct sg_table related issues
  drm: omapdrm: use common helper for extracting pages array
  drm: omapdrm: fix common struct sg_table related issues
  drm: panfrost: fix common struct sg_table related issues
  drm: radeon: fix common struct sg_table related issues
  drm: rockchip: use common helper for a scatterlist contiguity check
  drm: rockchip: fix common struct sg_table related issues
  drm: tegra: fix common struct sg_table related issues
  drm: v3d: fix common struct sg_table related issues
  drm: virtio: fix common struct sg_table related issues
  drm: vmwgfx: fix common struct sg_table related issues
  xen: gntdev: fix common struct sg_table related issues
  drm: host1x: fix common struct sg_table related issues
  drm: rcar-du: fix common struct sg_table related issues
  dmabuf: fix common struct sg_table related issues
  staging: ion: remove dead code
  staging: ion: fix common struct sg_table related issues
  staging: tegra-vde: fix common struct sg_table related issues
  misc: fastrpc: fix common struct sg_table related issues
  rapidio: fix common struct sg_table related issues
  samples: vfio-mdev/mbochs: fix common struct sg_table related issues
  media: pci: fix common ALSA DMA-mapping related codes
  videobuf2: use sgtable-based scatterlist wrappers

 drivers/dma-buf/heaps/heap-helpers.c               | 13 ++--
 drivers/dma-buf/udmabuf.c                          |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  9 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  8 +-
 drivers/gpu/drm/armada/armada_gem.c                | 12 +--
 drivers/gpu/drm/drm_cache.c                        |  2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               | 23 +-----
 drivers/gpu/drm/drm_gem_shmem_helper.c             | 14 ++--
 drivers/gpu/drm/drm_prime.c                        | 86 ++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              | 12 ++-
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              | 13 +---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            | 10 +--
 drivers/gpu/drm/exynos/exynos_drm_gem.c            | 23 +-----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         | 11 +--
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c   |  7 +-
 drivers/gpu/drm/lima/lima_gem.c                    | 11 ++-
 drivers/gpu/drm/lima/lima_vm.c                     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             | 34 ++-------
 drivers/gpu/drm/msm/msm_gem.c                      | 13 ++--
 drivers/gpu/drm/msm/msm_gpummu.c                   | 14 ++--
 drivers/gpu/drm/msm/msm_iommu.c                    |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 | 20 ++---
 drivers/gpu/drm/panfrost/panfrost_gem.c            |  4 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  7 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                | 11 ++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        | 42 +++--------
 drivers/gpu/drm/tegra/gem.c                        | 27 +++----
 drivers/gpu/drm/tegra/plane.c                      | 15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c                      | 17 ++---
 drivers/gpu/drm/virtio/virtgpu_object.c            | 36 +++++----
 drivers/gpu/drm/virtio/virtgpu_vq.c                | 12 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         | 17 +----
 drivers/gpu/host1x/job.c                           | 22 ++----
 .../media/common/videobuf2/videobuf2-dma-contig.c  | 41 +++++------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  | 32 +++-----
 drivers/media/common/videobuf2/videobuf2-vmalloc.c | 12 +--
 drivers/media/pci/cx23885/cx23885-alsa.c           |  2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c           |  2 +-
 drivers/media/pci/cx88/cx88-alsa.c                 |  2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c           |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c             |  8 +-
 drivers/misc/fastrpc.c                             |  4 +-
 drivers/rapidio/devices/rio_mport_cdev.c           |  8 +-
 drivers/staging/android/ion/ion.c                  | 25 +++----
 drivers/staging/android/ion/ion.h                  |  1 -
 drivers/staging/android/ion/ion_heap.c             | 53 ++++---------
 drivers/staging/android/ion/ion_system_heap.c      |  2 +-
 drivers/staging/media/tegra-vde/iommu.c            |  4 +-
 drivers/xen/gntdev-dmabuf.c                        | 13 ++--
 include/drm/drm_prime.h                            |  2 +
 include/linux/dma-mapping.h                        | 79 ++++++++++++++++++++
 include/linux/iommu.h                              | 16 ++++
 include/linux/scatterlist.h                        | 50 ++++++++++++-
 samples/vfio-mdev/mbochs.c                         |  3 +-
 56 files changed, 452 insertions(+), 477 deletions(-)

-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
