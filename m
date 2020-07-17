Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFC2245BE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 23:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8496E260;
	Fri, 17 Jul 2020 21:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87D26E24B;
 Fri, 17 Jul 2020 21:16:13 +0000 (UTC)
IronPort-SDR: 1MFJJ1P+qPyBLGZX5FRcZe+CK8AM+h9gDEHQFqP/8UcBwt9qDLtZuTxm0pV7ZgO1KzL9xdwbHM
 vLDsKTJ0M+Ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="129758791"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="129758791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:16:13 -0700
IronPort-SDR: uUm16KqF2ruRZr6jyNK9+SVPGlpTsAXGeQZKpLDxDZYGgTtTGUi2TXwqSulTinKXg4iyChm9gm
 RIEjiFrslU0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="300687838"
Received: from duffjusx-mobl1.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.156.115])
 by orsmga002.jf.intel.com with ESMTP; 17 Jul 2020 14:16:12 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v3] Add support for KeemBay DRM driver
Date: Fri, 17 Jul 2020 14:15:50 -0700
Message-Id: <1595020551-30768-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
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

Anitha Chrisanthus (1):
  drm/kmb: Add support for KeemBay Display

 drivers/gpu/drm/Kconfig         |    2 +
 drivers/gpu/drm/Makefile        |    1 +
 drivers/gpu/drm/kmb/Kconfig     |   12 +
 drivers/gpu/drm/kmb/Makefile    |    2 +
 drivers/gpu/drm/kmb/kmb_crtc.c  |  219 +++++
 drivers/gpu/drm/kmb/kmb_crtc.h  |   41 +
 drivers/gpu/drm/kmb/kmb_drv.c   |  759 ++++++++++++++++
 drivers/gpu/drm/kmb/kmb_drv.h   |  165 ++++
 drivers/gpu/drm/kmb/kmb_dsi.c   | 1833 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.h   |  370 ++++++++
 drivers/gpu/drm/kmb/kmb_plane.c |  515 +++++++++++
 drivers/gpu/drm/kmb/kmb_plane.h |  124 +++
 drivers/gpu/drm/kmb/kmb_regs.h  |  738 ++++++++++++++++
 13 files changed, 4781 insertions(+)
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
