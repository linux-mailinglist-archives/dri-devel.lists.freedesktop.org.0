Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8AAD8D7A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1DE10E010;
	Fri, 13 Jun 2025 13:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DBA10E1F2;
 Fri, 13 Jun 2025 13:45:44 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 0/8] RFC enable IAF support on PVC.
Date: Fri, 13 Jun 2025 15:45:19 +0200
Message-ID: <20250613134520.2458175-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

A lot of this code is not new, it's mostly based on previous patches
by David Kershner.

A lot of this code is lifted from the backport/main branch in
https://github.com/intel-gpu/intel-gpu-i915-backports

With the recent patch series to enable MTD support, it's possible to
enable IAF support as well. This series applies on top of the
v12 MTD series by Alexander Usyskin.

Patch 1 enables the PSC region in MTD.
Patch 2 adds IAF define to i915-component.
Patch 3 adds MEI support from the backports repo. 
Patch 4 is a small modification of the backport of the IAF code.
Patch 5 enables loading of the fabric code in xe.
Patch 6 is a UAPI change.
Patch 7 is a small cleanup, should probably be sent separately.
Patch 8 enables mapping of DMA-BUF through IAF instead of through PCI-E.

I would like to have a discussion mostly on the last patch, I'm abusing
the DMA-BUF api, and would like to start a discussion if this way is
acceptable or not, or potentially ways to handle it.

In particular, I have been using the following (pseudo) code:

xe_dma_buf_map(...)
{
	if (dir == DMA_NONE) {
		/* Only allow DMA_NONE for xe <-> xe */
		if (attach->importer_ops != &xe_dma_buf_attach_ops)
			return ERR_PTR(-EOPNOTSUPP);

		iaf = true;
	}
}

bo_map_dma_buf(...)
{
	if (dmabuf->ops == &xe_dmabuf_ops) {
		struct xe_device *src = xe_bo_device(gem_to_xe_bo(dmabuf->priv));
		struct xe_device *dst = xe_bo_device(bo);

		if (iaf_possible(src, dst))
			sg = dma_buf_map_attachment(attach, DMA_NONE);

		if (!IS_ERR(sg)) {
			bo->flags |= XE_BO_FLAG_IAF;
			return sg;
		}

		/* fallback */
	}

	return dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
}

With of course:
bo_unmap_dma_buf(...)
{
	dma_buf_unmap_attachment(attach, sg,
				bo->flags & XE_BO_FLAG_IAF ?
				DMA_NONE : DMA_BIDIRECTIONAL);
}

Maarten Lankhorst (8):
  drm/xe: Add PSC region for PVC
  include/drm/i915_component: Add IAF type.
  mei: Add IAF mei component
  drm/xe: Add fabric code from i915 backport repository.
  drm/xe: Add support for IAF devices.
  drm/xe/uapi: Add query ioctl for fabric connectivity
  drm/xe: Remove unused XE_DEFAULT_GTT_SIZE_MB definition.
  drm/xe: Allow mapping DMA-BUF buffer objects connected through IAF

 drivers/gpu/drm/xe/Kconfig                    |    2 +
 drivers/gpu/drm/xe/Makefile                   |    2 +
 drivers/gpu/drm/xe/fabric/Kconfig             |   53 +
 drivers/gpu/drm/xe/fabric/Makefile            |   42 +
 drivers/gpu/drm/xe/fabric/csr.h               |  497 ++++
 drivers/gpu/drm/xe/fabric/debugfs.c           |  112 +
 drivers/gpu/drm/xe/fabric/debugfs.h           |   26 +
 drivers/gpu/drm/xe/fabric/dev_diag.c          |  723 ++++++
 drivers/gpu/drm/xe/fabric/dev_diag.h          |   15 +
 drivers/gpu/drm/xe/fabric/error.c             | 1490 ++++++++++++
 drivers/gpu/drm/xe/fabric/error.h             |   15 +
 drivers/gpu/drm/xe/fabric/fw.c                | 2089 +++++++++++++++++
 drivers/gpu/drm/xe/fabric/fw.h                |   21 +
 drivers/gpu/drm/xe/fabric/iaf_drv.h           | 1341 +++++++++++
 drivers/gpu/drm/xe/fabric/iaf_netlink.h       |  208 ++
 drivers/gpu/drm/xe/fabric/io.h                |   82 +
 drivers/gpu/drm/xe/fabric/main.c              | 1098 +++++++++
 drivers/gpu/drm/xe/fabric/mbdb.c              | 1173 +++++++++
 drivers/gpu/drm/xe/fabric/mbdb.h              |  171 ++
 drivers/gpu/drm/xe/fabric/mbox.c              |  440 ++++
 drivers/gpu/drm/xe/fabric/mbox.h              |   18 +
 drivers/gpu/drm/xe/fabric/mei_iaf_user.c      |  440 ++++
 drivers/gpu/drm/xe/fabric/mei_iaf_user.h      |   19 +
 drivers/gpu/drm/xe/fabric/netlink.c           | 1532 ++++++++++++
 drivers/gpu/drm/xe/fabric/netlink.h           |   15 +
 drivers/gpu/drm/xe/fabric/ops.c               | 1476 ++++++++++++
 drivers/gpu/drm/xe/fabric/ops.h               |  525 +++++
 drivers/gpu/drm/xe/fabric/parallel.c          |   96 +
 drivers/gpu/drm/xe/fabric/parallel.h          |   33 +
 drivers/gpu/drm/xe/fabric/port.c              | 1884 +++++++++++++++
 drivers/gpu/drm/xe/fabric/port.h              |   41 +
 drivers/gpu/drm/xe/fabric/port_diag.c         | 1892 +++++++++++++++
 drivers/gpu/drm/xe/fabric/port_diag.h         |   19 +
 drivers/gpu/drm/xe/fabric/routing_debug.c     |  484 ++++
 drivers/gpu/drm/xe/fabric/routing_debug.h     |   16 +
 drivers/gpu/drm/xe/fabric/routing_engine.c    |  565 +++++
 drivers/gpu/drm/xe/fabric/routing_engine.h    |   25 +
 drivers/gpu/drm/xe/fabric/routing_event.c     |  249 ++
 drivers/gpu/drm/xe/fabric/routing_event.h     |   19 +
 drivers/gpu/drm/xe/fabric/routing_io.c        |  496 ++++
 drivers/gpu/drm/xe/fabric/routing_io.h        |   15 +
 drivers/gpu/drm/xe/fabric/routing_logic.c     |  934 ++++++++
 drivers/gpu/drm/xe/fabric/routing_logic.h     |   16 +
 drivers/gpu/drm/xe/fabric/routing_p2p.c       |  883 +++++++
 drivers/gpu/drm/xe/fabric/routing_p2p.h       |   22 +
 drivers/gpu/drm/xe/fabric/routing_pause.c     |  282 +++
 drivers/gpu/drm/xe/fabric/routing_pause.h     |   16 +
 drivers/gpu/drm/xe/fabric/routing_topology.c  |  200 ++
 drivers/gpu/drm/xe/fabric/routing_topology.h  |  376 +++
 .../drm/xe/fabric/selftests/routing_mock.c    |  291 +++
 .../drm/xe/fabric/selftests/routing_mock.h    |   22 +
 .../xe/fabric/selftests/routing_selftest.c    |  424 ++++
 .../xe/fabric/selftests/routing_selftest.h    |   12 +
 .../gpu/drm/xe/fabric/selftests/selftest.c    |   73 +
 .../gpu/drm/xe/fabric/selftests/selftest.h    |   34 +
 drivers/gpu/drm/xe/fabric/statedump.c         |  283 +++
 drivers/gpu/drm/xe/fabric/statedump.h         |   32 +
 drivers/gpu/drm/xe/fabric/sysfs.c             |  327 +++
 drivers/gpu/drm/xe/fabric/sysfs.h             |   16 +
 drivers/gpu/drm/xe/fabric/trace.c             |    8 +
 drivers/gpu/drm/xe/fabric/trace.h             |   11 +
 drivers/gpu/drm/xe/fabric/trace_mbx.h         |   99 +
 drivers/gpu/drm/xe/fabric/trace_nl.h          |   54 +
 drivers/gpu/drm/xe/fabric/trace_pm.h          |  102 +
 drivers/gpu/drm/xe/fabric/trace_rt.h          |  110 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   23 +
 drivers/gpu/drm/xe/xe_bo.c                    |   85 +-
 drivers/gpu/drm/xe/xe_bo.h                    |    4 +-
 drivers/gpu/drm/xe/xe_device.c                |   12 +-
 drivers/gpu/drm/xe/xe_device_types.h          |    3 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |   27 +-
 drivers/gpu/drm/xe/xe_dma_buf.h               |    1 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |    4 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |    3 +
 drivers/gpu/drm/xe/xe_iaf.c                   |  460 ++++
 drivers/gpu/drm/xe/xe_iaf.h                   |   82 +
 drivers/gpu/drm/xe/xe_irq.c                   |   16 +-
 drivers/gpu/drm/xe/xe_nvm.c                   |    1 +
 drivers/gpu/drm/xe/xe_pt.c                    |    4 +
 drivers/gpu/drm/xe/xe_query.c                 |   58 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   23 +-
 drivers/gpu/drm/xe/xe_vm.c                    |    2 +-
 drivers/gpu/drm/xe/xe_vram.c                  |    4 +-
 drivers/misc/mei/Kconfig                      |    1 +
 drivers/misc/mei/Makefile                     |    1 +
 drivers/misc/mei/iaf/Kconfig                  |   12 +
 drivers/misc/mei/iaf/Makefile                 |    7 +
 drivers/misc/mei/iaf/mei_iaf.c                |  292 +++
 drivers/misc/mei/mkhi.h                       |    2 +
 include/drm/intel/i915_component.h            |    1 +
 include/drm/intel/i915_mei_iaf_interface.h    |   25 +
 include/drm/intel/intel_iaf_platform.h        |  145 ++
 include/linux/intel_dg_nvm_aux.h              |    2 +-
 include/uapi/drm/xe_drm.h                     |   32 +
 94 files changed, 25389 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/fabric/Kconfig
 create mode 100644 drivers/gpu/drm/xe/fabric/Makefile
 create mode 100644 drivers/gpu/drm/xe/fabric/csr.h
 create mode 100644 drivers/gpu/drm/xe/fabric/debugfs.c
 create mode 100644 drivers/gpu/drm/xe/fabric/debugfs.h
 create mode 100644 drivers/gpu/drm/xe/fabric/dev_diag.c
 create mode 100644 drivers/gpu/drm/xe/fabric/dev_diag.h
 create mode 100644 drivers/gpu/drm/xe/fabric/error.c
 create mode 100644 drivers/gpu/drm/xe/fabric/error.h
 create mode 100644 drivers/gpu/drm/xe/fabric/fw.c
 create mode 100644 drivers/gpu/drm/xe/fabric/fw.h
 create mode 100644 drivers/gpu/drm/xe/fabric/iaf_drv.h
 create mode 100644 drivers/gpu/drm/xe/fabric/iaf_netlink.h
 create mode 100644 drivers/gpu/drm/xe/fabric/io.h
 create mode 100644 drivers/gpu/drm/xe/fabric/main.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mbdb.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mbdb.h
 create mode 100644 drivers/gpu/drm/xe/fabric/mbox.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mbox.h
 create mode 100644 drivers/gpu/drm/xe/fabric/mei_iaf_user.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mei_iaf_user.h
 create mode 100644 drivers/gpu/drm/xe/fabric/netlink.c
 create mode 100644 drivers/gpu/drm/xe/fabric/netlink.h
 create mode 100644 drivers/gpu/drm/xe/fabric/ops.c
 create mode 100644 drivers/gpu/drm/xe/fabric/ops.h
 create mode 100644 drivers/gpu/drm/xe/fabric/parallel.c
 create mode 100644 drivers/gpu/drm/xe/fabric/parallel.h
 create mode 100644 drivers/gpu/drm/xe/fabric/port.c
 create mode 100644 drivers/gpu/drm/xe/fabric/port.h
 create mode 100644 drivers/gpu/drm/xe/fabric/port_diag.c
 create mode 100644 drivers/gpu/drm/xe/fabric/port_diag.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_debug.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_debug.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_engine.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_engine.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_event.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_event.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_io.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_io.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_logic.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_logic.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_p2p.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_p2p.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_pause.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_pause.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_topology.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_topology.h
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_mock.c
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_mock.h
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_selftest.c
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_selftest.h
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/selftest.c
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/selftest.h
 create mode 100644 drivers/gpu/drm/xe/fabric/statedump.c
 create mode 100644 drivers/gpu/drm/xe/fabric/statedump.h
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.c
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace.c
 create mode 100644 drivers/gpu/drm/xe/fabric/trace.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_mbx.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_nl.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_pm.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_rt.h
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.c
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.h
 create mode 100644 drivers/misc/mei/iaf/Kconfig
 create mode 100644 drivers/misc/mei/iaf/Makefile
 create mode 100644 drivers/misc/mei/iaf/mei_iaf.c
 create mode 100644 include/drm/intel/i915_mei_iaf_interface.h
 create mode 100644 include/drm/intel/intel_iaf_platform.h

-- 
2.45.2

