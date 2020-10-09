Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE0287FBE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 03:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2FB897D4;
	Fri,  9 Oct 2020 01:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9F6EB93
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 01:04:16 +0000 (UTC)
IronPort-SDR: 68r17Z3I0s/lR0RSUekQ9BNBEDNw6Su3OGERYp6XohOjo7cd+lAmA0E66sMJ4gxrhu165r6lKf
 pY0liJDH5cVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="162789779"
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; d="scan'208";a="162789779"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 18:04:16 -0700
IronPort-SDR: byJmTDvMZnwa61Tor7XDMFkFec+ewXRPYB50ZckEWd7+u4oWdW8VBwpUt4rWD+kFwWWdpUzTAO
 ve5/7Hu+65Wg==
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; d="scan'208";a="343626257"
Received: from mgleaso-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.146.83])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 08 Oct 2020 18:04:16 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 devicetree@vger.kernel.org
Subject: [PATCH v9 0/5] Add support for KeemBay DRM driver
Date: Thu,  8 Oct 2020 18:03:58 -0700
Message-Id: <1602205443-9036-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, edmund.j.dea@intel.com, sam@ravnborg.org
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

Changes since v7:
- tested with 5.9 kernel and made the following changes
        get clk_pll0 from display node in dt  
        call drm_bridge_attach with DRM_BRIDGE_ATTACH_NO_CONNECTOR
        Also added Maintainer entry	

Changes since v8:
	DT review changes (Rob)
	renamed kmb_dsi_hw_init to kmb_dsi_mode_set (Daniel V)
	moved csc_coef_lcd to plane.c (Daniel Vetter)
	call drm_atomic_helper_shutdown in remove (Daniel V)
	use drm_crtc_handle_vblank (Daniel V)
	renamed kmb_dsi_hw_init to kmb_dsi_mode_set (Daniel V)
	complimentary changes to device tree changes (Rob)
	removed redundant definitions in kmb_dsi.h

Anitha Chrisanthus (5):
  dt-bindings: display: Add support for Intel KeemBay Display
  drm/kmb: Keem Bay driver register definition
  drm/kmb: Add support for KeemBay Display
  drm/kmb: Mipi DSI part of the display driver
  drm/kmb: Build files for KeemBay Display driver

 .../bindings/display/intel,keembay-display.yaml    |   99 ++
 MAINTAINERS                                        |    7 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/kmb/Kconfig                        |   13 +
 drivers/gpu/drm/kmb/Makefile                       |    2 +
 drivers/gpu/drm/kmb/kmb_crtc.c                     |  224 +++
 drivers/gpu/drm/kmb/kmb_drv.c                      |  676 +++++++++
 drivers/gpu/drm/kmb/kmb_drv.h                      |  170 +++
 drivers/gpu/drm/kmb/kmb_dsi.c                      | 1524 ++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.h                      |  350 +++++
 drivers/gpu/drm/kmb/kmb_plane.c                    |  488 +++++++
 drivers/gpu/drm/kmb/kmb_plane.h                    |  102 ++
 drivers/gpu/drm/kmb/kmb_regs.h                     |  739 ++++++++++
 14 files changed, 4397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml
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
