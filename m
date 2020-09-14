Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C395E2689F4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 13:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869CB6E48C;
	Mon, 14 Sep 2020 11:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3048F6E442;
 Mon, 14 Sep 2020 11:25:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E010B0EA;
 Mon, 14 Sep 2020 11:25:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, daniel@ffwll.ch,
 airlied@linux.ie, sam@ravnborg.org, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com, davem@davemloft.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com, tfiga@chromium.org,
 mchehab@kernel.org, chris@chris-wilson.co.uk, matthew.auld@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
Date: Mon, 14 Sep 2020 13:25:18 +0200
Message-Id: <20200914112521.1327-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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
Cc: intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 sparclinux@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dma-buf provides vmap() and vunmap() for retrieving and releasing mappings
of dma-buf memory in kernel address space. The functions operate with plain
addresses and the assumption is that the memory can be accessed with load
and store operations. This is not the case on some architectures (e.g.,
sparc64) where I/O memory can only be accessed with dedicated instructions.

This patchset introduces struct dma_buf_map, which contains the address of
a buffer and a flag that tells whether system- or I/O-memory instructions
are required.

Some background: updating the DRM framebuffer console on sparc64 makes the
kernel panic. This is because the framebuffer memory cannot be accessed with
system-memory instructions. We currently employ a workaround in DRM to
address this specific problem. [1]

To resolve the problem, we'd like to address it at the most common point,
which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
instructions are required and exports this information to it's users. The
new structure struct dma_buf_map stores the buffer address and a flag that
signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
can then access the memory accordingly.

This patchset only introduces struct dma_buf_map, and updates struct dma_buf
and it's interfaces. Further patches can update dma-buf users. For example,
there's a prototype patchset for DRM that fixes the framebuffer problem. [2]

Further work: TTM, one of DRM's memory managers, already exports an
is_iomem flag of its own. It could later be switched over to exporting struct
dma_buf_map, thus simplifying some code. Several DRM drivers expect their
fbdev console to operate on I/O memory. These could possibly be switched over
to the generic fbdev emulation, as soon as the generic code uses struct
dma_buf_map.

[1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
[2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/

Thomas Zimmermann (3):
  dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
  dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
  dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces

 Documentation/driver-api/dma-buf.rst          |   3 +
 drivers/dma-buf/dma-buf.c                     |  40 +++---
 drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
 drivers/gpu/drm/drm_prime.c                   |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
 drivers/gpu/drm/tegra/gem.c                   |  23 ++--
 .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
 .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
 include/drm/drm_prime.h                       |   5 +-
 include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
 include/linux/dma-buf.h                       |  11 +-
 15 files changed, 274 insertions(+), 82 deletions(-)
 create mode 100644 include/linux/dma-buf-map.h

--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
