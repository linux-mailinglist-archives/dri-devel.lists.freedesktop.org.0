Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A681258230
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 22:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096836E369;
	Mon, 31 Aug 2020 20:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889E56E369
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:03:05 +0000 (UTC)
IronPort-SDR: R9Alr7kPQp5GuX7ydWNhaWZTEzDfjgMj/hBlz1NQpODVnOg18p2MwwaaefEsU2ChOLslTZCsi5
 Px9+RXsUTb+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="156308788"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="156308788"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 13:03:04 -0700
IronPort-SDR: 7ZH7YGA0ZsTzg/cMkFTLA0UDYlg9SOmGFawtzQgA4xvZEADZv/kbFgOef6QTZNFtGZTsG+q9LU
 ENh/bBpRBP3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="325054063"
Received: from sgovind3-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.255.86.92])
 by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2020 13:03:04 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v7 0/4] Add support for KeemBay DRM driver
Date: Mon, 31 Aug 2020 13:02:48 -0700
Message-Id: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: daniel.vetter@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a new DRM driver for Intel's KeemBay SOC.
The SoC couples an ARM Cortex A53 CPU with an Intel
Movidius VPU.

This driver is tested with the KMB EVM board which is the refernce baord
for Keem Bay SOC. The SOC's display pipeline is as follows

+--------------+    +---------+    +-----------------------+
|LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
+--------------+    +---------+    +-----------------------+

LCD controller and Mipi DSI transmitter are part of the SOC and
mipi to HDMI converter is ADV7535 for KMB EVM board.

The DRM driver is a basic KMS atomic modesetting display driver and
has no 2D or 3D graphics.It calls into the ADV bridge driver at
the connector level.

Only 1080p resolution and single plane is supported at this time.
The usecase is for debugging video and camera outputs.

Device tree patches are under review here
https://lore.kernel.org/linux-arm-kernel/20200708175020.194436-1-daniele.alessandrelli@linux.intel.com/T/

Changes since v1:
- Removed redundant license text, updated license
- Rearranged include blocks
- renamed global vars and removed extern in c
- Used upclassing for dev_private
- Used drm_dev_init in drm device create
- minor cleanups

Changes since v2:
- squashed all commits to a single commit
- logging changed to drm_info, drm_dbg etc.
- used devm_drm_dev_alloc()
- removed commented out sections and general cleanup

Changes since v3:
- renamed dev_p to kmb
- moved clocks under kmb_clock, consolidated clk initializations
- use drmm functions
- use DRM_GEM_CMA_DRIVER_OPS_VMAP
- more cleanups

Changes since v4:
- corrected spellings

Changes since v5:
- corrected checkpatch warnings/checks
   -Please ignore checkpatch checks on Camelcase - this is how it is
   named in the databook
   - Please ignore checkpatch warnings on misspelled for hsa, dout,
   widthn etc. - they are spelled as in the databook
   - Please ignore checkpatch checks on macro arguments reuse -
   its confirmed ok

Changes since v6:
- review changes Sam Ravnborg and Thomas Zimmerman
	split patch into 4 parts, part1 register definitions, part2 display
	driver files, part3 mipi dsi, part4 build files (Sam)
	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
	renamed mode_set, kmb_load, inlined unload (Thomas)
	moved remaining logging to drm_*(Thomas)
	re-orged driver initialization (Thomas)
	moved plane_status to drm_private (Sam)
	removed unnecessary logs and defines and ifdef codes (Sam)
	split dphy_init_sequence smaller (Sam)
	removed redundant checks in kmb_dsi (Sam)
	changed kmb_dsi_init to drm_bridge_connector_init and
	drm_connector_attach_encoder to bridge's connector (Sam)
	call helper_check in plane_atomic_check (Sam)
	renamed set to get for bpp and format functions(Sam)
	use drm helper functions for reset, duplicate/destroy state instead
	of kmb functions (Sam)
	removed kmb_priv from kmb_plane and removed kmb_plane_state (Sam)

Anitha Chrisanthus (4):
  drm/kmb: Keem Bay driver register definition
  drm/kmb: Add support for KeemBay Display
  drm/kmb: Mipi DSI part of the display driver
  drm/kmb: Build files for KeemBay Display driver

 drivers/gpu/drm/Kconfig         |    2 +
 drivers/gpu/drm/Makefile        |    1 +
 drivers/gpu/drm/kmb/Kconfig     |   13 +
 drivers/gpu/drm/kmb/Makefile    |    2 +
 drivers/gpu/drm/kmb/kmb_crtc.c  |  224 ++++++
 drivers/gpu/drm/kmb/kmb_drv.c   |  676 +++++++++++++++++
 drivers/gpu/drm/kmb/kmb_drv.h   |  170 +++++
 drivers/gpu/drm/kmb/kmb_dsi.c   | 1523 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.h   |  350 +++++++++
 drivers/gpu/drm/kmb/kmb_plane.c |  480 ++++++++++++
 drivers/gpu/drm/kmb/kmb_plane.h |  110 +++
 drivers/gpu/drm/kmb/kmb_regs.h  |  748 +++++++++++++++++++
 12 files changed, 4299 insertions(+)
 create mode 100644 drivers/gpu/drm/kmb/Kconfig
 create mode 100644 drivers/gpu/drm/kmb/Makefile
 create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
 create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.h
 create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
 create mode 100644 drivers/gpu/drm/kmb/kmb_regs.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
