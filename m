Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F524129A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 23:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A10A6E040;
	Mon, 10 Aug 2020 21:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDDE6E040;
 Mon, 10 Aug 2020 21:54:06 +0000 (UTC)
IronPort-SDR: k/L7Cc/3zxwzWl/vFzmL6ZfRTBQ3ve8MgtJErSxpikN+5VVruYd9FuPc7lkSr+cUwUVgXMWC6V
 i3uedcOtzMpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="133167702"
X-IronPort-AV: E=Sophos;i="5.75,458,1589266800"; d="scan'208";a="133167702"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 14:54:06 -0700
IronPort-SDR: PuvagK85VG6fywXATMNutSXGiNgPCrpyuAV6p4allL5dEhZxl3FrpCiV64+d43ovMl9SRb3Iz4
 MgD2F6ZeOUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,458,1589266800"; d="scan'208";a="326644067"
Received: from caezeany-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.61.211])
 by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2020 14:54:05 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v6] Add support for KeemBay DRM driver
Date: Mon, 10 Aug 2020 14:53:37 -0700
Message-Id: <1597096418-28937-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org, sam@ravnborg.org
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

Anitha Chrisanthus (1):
  drm/kmb: Add support for KeemBay Display

 drivers/gpu/drm/Kconfig         |    2 +
 drivers/gpu/drm/Makefile        |    1 +
 drivers/gpu/drm/kmb/Kconfig     |   13 +
 drivers/gpu/drm/kmb/Makefile    |    2 +
 drivers/gpu/drm/kmb/kmb_crtc.c  |  217 +++++
 drivers/gpu/drm/kmb/kmb_crtc.h  |   36 +
 drivers/gpu/drm/kmb/kmb_drv.c   |  725 ++++++++++++++++
 drivers/gpu/drm/kmb/kmb_drv.h   |  172 ++++
 drivers/gpu/drm/kmb/kmb_dsi.c   | 1828 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.h   |  370 ++++++++
 drivers/gpu/drm/kmb/kmb_plane.c |  519 +++++++++++
 drivers/gpu/drm/kmb/kmb_plane.h |  124 +++
 drivers/gpu/drm/kmb/kmb_regs.h  |  748 ++++++++++++++++
 13 files changed, 4757 insertions(+)
 create mode 100644 drivers/gpu/drm/kmb/Kconfig
 create mode 100644 drivers/gpu/drm/kmb/Makefile
 create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.h
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
