Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14562200668
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D8D6EC5E;
	Fri, 19 Jun 2020 10:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955386EC5E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103653euoutp025039416c566e22cec80352171067ce78~Z65_GG6ri2242222422euoutp02D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200619103653euoutp025039416c566e22cec80352171067ce78~Z65_GG6ri2242222422euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563013;
 bh=SKmcGUCViOC20fHTGIMMJj/oBeMFgbmVpPgDVEHrvrs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SQmjtNLJB6wzAmOZt0C464LUZhO/TfBmCXW6rJ4GZpBKEMV2AaSYkI+HiUSzQOj+Q
 MvYcqoN6OPs4ZDAifqY8i3BXCdecXr9dCXwOZfsFjmHaax9MclsQ3p37CSofnghhjK
 5eUq8U99uAd/xIPFp3oNJ94XZotTmyk20BsZkw5E=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103653eucas1p15e2da5fba6245c7cb0aed4b4ed2aade8~Z659wd_KI0550605506eucas1p1h;
 Fri, 19 Jun 2020 10:36:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 18.9C.06456.5459CEE5; Fri, 19
 Jun 2020 11:36:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103652eucas1p203d684adff0faa672ff5c8d383b52f23~Z659cTudX1674116741eucas1p2-;
 Fri, 19 Jun 2020 10:36:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103652eusmtrp16b89551ec49170119b569cbd10702833~Z659blL8v0949709497eusmtrp10;
 Fri, 19 Jun 2020 10:36:52 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-31-5eec9545484b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 68.DA.06314.4459CEE5; Fri, 19
 Jun 2020 11:36:52 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103652eusmtip288440462357bc10b314b7e4863160759~Z6585twsR0244902449eusmtip2j;
 Fri, 19 Jun 2020 10:36:52 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/36] DRM: fix struct sg_table nents vs. orig_nents misuse
Date: Fri, 19 Jun 2020 12:36:00 +0200
Message-Id: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjl3b3brqtr1yn4YGk1UFJLG/rjgmVmFhfpQyEIDGdTL2q5abtq
 KYGSKLU0KtFshkkFzqn5kR+hWTn8WtYMv7JclGmiqRXNJIus5tXy33nOc857zgMvgUl7hC5E
 gjqF1aiViTKRBG/qWuzbsb9wVrHzQp89nW82Cei64hoh/bvpKkYPfvssoisqOwV02eMAen5w
 TEDXjw8L6YGWmyK6uuONmG7/MiEMWsdUlVYhpm2hDGeaF94JmbeXugXM/buZzOjSOMYUjJQj
 pvVVloi53GBAjLXeLUwSIdkVyyYmpLEa38ATknj9qCTZeuTsUN9TQRay7NEiOwIofxg3VeJa
 JCGklB6BxagX88M8gpyXhSsbK4LGsULhqkU//XpFVY5g7vsaS8lULW5TiSg5aOe0Iht2onIQ
 9OSvt2GMKhZA50yqDTtSYXCruWVZj1Pu0KUzYlpEECS1G/qeufJhm6Gy9glmwyTlAKYbEzj/
 zGbIbizBbLlAmcXQMzmF84YQmMgfEPPYET52N6zgTdBbkIfzhmwEY+ZqMT/kIRg4X4x4VQBY
 zD9EthYY5Qk1Lb48vRcK339YpoGyh5E5B76EPVxruo7xNAkXcqW82gN03ff+xba/6F+RMDB6
 MdJGS6lIGDYUC66gLbo1l+nWXKb7X6EMYQbkzKZyqjiWk6vZMz6cUsWlquN8YpJU9ejv/+pd
 6v76AH3rjzYiikCy9WTQsRmFVKhM49JVRgQEJnMig5/3KqRkrDI9g9UkRWlSE1nOiDYSuMyZ
 9Ls9HSml4pQp7CmWTWY1q1sBYeeShYK39iz9UmyPNx1Qz7p5Hg4nxdE+HQ/dTB1YdsmPTaHu
 RxeIR0Vyc6j59OJQZSupsbZ5FDlIw7yavPUx/vkR5zhXs98Ggphs7PDeZlFnaNpmSMXBuop6
 i9vPO/LMUkMu+nS8pDo8XVxxReEcFHhor8+tEFUdFWU9aT/imLjPSYZz8Uq5F6bhlH8AZ5Mi
 IVsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7ouU9/EGfz4aGbRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGF14PZYM28N
 o8febwtYPLZ/e8Dqcb/7OJPH5iX1Hrf/PWb2mHxjOaPH7psNbB59W1YxenzeJBfAFaVnU5Rf
 WpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXseI2V8Fn/4qr
 508xNTDese9i5OSQEDCRWPHyFnsXIxeHkMBSRokjU26wQSRkJE5Oa2CFsIUl/lzrYoMo+sQo
 0TvvLRNIgk3AUKLrLURCRKCTUWJa90ewUcwC85gkFj08xA5SJSzgJ/H+814WEJtFQFXi2KxD
 zF2MHBy8ArYS58/IQmyQl1i94QAziM0rIChxcuYTFpASZgF1ifXzhEDCzEAlzVtnM09g5J+F
 pGoWQtUsJFULGJlXMYqklhbnpucWG+oVJ+YWl+al6yXn525iBMbZtmM/N+9gvLQx+BCjAAej
 Eg/vi5DXcUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgK9MFEZinR5Hxg
 CsgriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cBovHGh2peHl+V3
 xeZej0lgzM+QEDLvaP/AkiDtskXM7kqUQfz2ydu32LH0rZxgU3t2ftJ/jkr/kNbjFosPOAiW
 7Fjl8v/ftHKrl5fffeMJmnZwmve0MI7LhS7dC14wzX+36vvxF7E3NecwpESeDIo4OTd4rebi
 G97LWUwU7dxtGBr3NC+qOs2uxFKckWioxVxUnAgAOKjywckCAAA=
X-CMS-MailID: 20200619103652eucas1p203d684adff0faa672ff5c8d383b52f23
X-Msg-Generator: CA
X-RootMTR: 20200619103652eucas1p203d684adff0faa672ff5c8d383b52f23
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103652eucas1p203d684adff0faa672ff5c8d383b52f23
References: <CGME20200619103652eucas1p203d684adff0faa672ff5c8d383b52f23@eucas1p2.samsung.com>
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

Patches are based on top of Linux next-20200618. The required changes to
DMA-mapping framework has been already merged to v5.8-rc1.

If possible I would like ask for merging most of the patches via DRM
tree.

Best regards,
Marek Szyprowski


References:

[1] https://lkml.org/lkml/2020/3/27/555
[2] https://lkml.org/lkml/2020/3/29/65
[3] Documentation/DMA-API-HOWTO.txt
[4] https://lore.kernel.org/linux-iommu/20200512121931.GD20393@lst.de/T/#ma18c958a48c3b241d5409517fa7d192eef87459b

Changelog:

v7:
- changed DMA page interators to standard DMA SG iterators in drm/prim and
  videobuf2-dma-contig as suggested by Robin Murphy
- fixed build issues

v6: https://lore.kernel.org/linux-iommu/20200618153956.29558-1-m.szyprowski@samsung.com/T/
- rebased onto Linux next-20200618, which is based on v5.8-rc1; fixed conflicts

v5: https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
- fixed some minor style issues and typos
- fixed lack of the attrs argument in ion, dmabuf, rapidio, fastrpc and
  vfio patches

v4: https://lore.kernel.org/linux-iommu/20200512121931.GD20393@lst.de/T/
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

Marek Szyprowski (36):
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
  drm: xen: fix common struct sg_table related issues
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

 drivers/dma-buf/heaps/heap-helpers.c          | 13 ++-
 drivers/dma-buf/udmabuf.c                     |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  8 +-
 drivers/gpu/drm/armada/armada_gem.c           | 12 +--
 drivers/gpu/drm/drm_cache.c                   |  2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c          | 23 +----
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 14 ++-
 drivers/gpu/drm/drm_prime.c                   | 91 +++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 12 +--
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c         | 13 +--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 10 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       | 23 +----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 11 +--
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  7 +-
 drivers/gpu/drm/lima/lima_gem.c               | 11 ++-
 drivers/gpu/drm/lima/lima_vm.c                |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 37 ++------
 drivers/gpu/drm/msm/msm_gem.c                 | 13 +--
 drivers/gpu/drm/msm/msm_gpummu.c              | 14 ++-
 drivers/gpu/drm/msm/msm_iommu.c               |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            | 20 ++--
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  4 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  7 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           | 11 +--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 42 +++------
 drivers/gpu/drm/tegra/gem.c                   | 27 ++----
 drivers/gpu/drm/tegra/plane.c                 | 15 +--
 drivers/gpu/drm/v3d/v3d_mmu.c                 | 13 ++-
 drivers/gpu/drm/virtio/virtgpu_object.c       | 36 +++++---
 drivers/gpu/drm/virtio/virtgpu_vq.c           | 12 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 17 +---
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
 drivers/gpu/host1x/job.c                      | 22 ++---
 .../common/videobuf2/videobuf2-dma-contig.c   | 34 +++----
 .../media/common/videobuf2/videobuf2-dma-sg.c | 32 +++----
 .../common/videobuf2/videobuf2-vmalloc.c      | 12 +--
 drivers/media/pci/cx23885/cx23885-alsa.c      |  2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c      |  2 +-
 drivers/media/pci/cx88/cx88-alsa.c            |  2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c      |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c        |  8 +-
 drivers/misc/fastrpc.c                        |  4 +-
 drivers/rapidio/devices/rio_mport_cdev.c      |  8 +-
 drivers/staging/android/ion/ion.c             | 25 +++--
 drivers/staging/android/ion/ion.h             |  1 -
 drivers/staging/android/ion/ion_heap.c        | 53 +++--------
 drivers/staging/android/ion/ion_system_heap.c |  2 +-
 drivers/staging/media/tegra-vde/iommu.c       |  4 +-
 drivers/xen/gntdev-dmabuf.c                   | 13 ++-
 include/drm/drm_prime.h                       |  2 +
 samples/vfio-mdev/mbochs.c                    |  3 +-
 54 files changed, 312 insertions(+), 471 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
