Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B65F308793
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 10:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874D26EAB3;
	Fri, 29 Jan 2021 09:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFC46EAB2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:56:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 207E2AE61;
 Fri, 29 Jan 2021 09:56:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/5] drm/gma500: Remove Moorestown/Medfield
Date: Fri, 29 Jan 2021 10:55:59 +0100
Message-Id: <20210129095604.32423-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support for Moorestown and Medfield platforms is being removed from
the kernel. So here's a patch to remove the related code from the
gma500 driver. On top of that I also cleaned up the configuration
a bit.

Note that Poulsbo and Cedartrail is still there and will remain. With
the MID platforms gone, there's actually a chance of cleaning up the
code for the desktop chips.

I smoke tested the patchset by running Xorg and Weston on a Cedartrail
system.

Thomas Zimmermann (5):
  drm/gma500: Remove Medfield support
  drm/gma500: Remove Moorestown support
  drm/gma500: Drop DRM_GMA3600 config option
  drm/gma500: Remove CONFIG_X86 conditionals from source files
  drm/gma500: Remove dependency on TTM

 drivers/gpu/drm/gma500/Kconfig                |   28 +-
 drivers/gpu/drm/gma500/Makefile               |   43 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |    4 -
 drivers/gpu/drm/gma500/framebuffer.c          |    2 +-
 drivers/gpu/drm/gma500/intel_gmbus.c          |    5 +-
 drivers/gpu/drm/gma500/mdfld_device.c         |  564 ---------
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c        | 1017 -----------------
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.h        |   79 --
 drivers/gpu/drm/gma500/mdfld_dsi_output.c     |  603 ----------
 drivers/gpu/drm/gma500/mdfld_dsi_output.h     |  377 ------
 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c |  679 -----------
 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.h |   80 --
 drivers/gpu/drm/gma500/mdfld_intel_display.c  |  966 ----------------
 drivers/gpu/drm/gma500/mdfld_output.c         |   74 --
 drivers/gpu/drm/gma500/mdfld_output.h         |   76 --
 drivers/gpu/drm/gma500/mdfld_tmd_vid.c        |  197 ----
 drivers/gpu/drm/gma500/mdfld_tpo_vid.c        |   83 --
 drivers/gpu/drm/gma500/mid_bios.c             |  333 ------
 drivers/gpu/drm/gma500/mid_bios.h             |   10 -
 drivers/gpu/drm/gma500/mmu.c                  |   21 -
 drivers/gpu/drm/gma500/oaktrail.h             |  247 ----
 drivers/gpu/drm/gma500/oaktrail_crtc.c        |  663 -----------
 drivers/gpu/drm/gma500/oaktrail_device.c      |  567 ---------
 drivers/gpu/drm/gma500/oaktrail_hdmi.c        |  840 --------------
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c    |  331 ------
 drivers/gpu/drm/gma500/oaktrail_lvds.c        |  423 -------
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c    |  169 ---
 drivers/gpu/drm/gma500/psb_drv.c              |   82 +-
 drivers/gpu/drm/gma500/psb_drv.h              |  108 --
 drivers/gpu/drm/gma500/psb_intel_drv.h        |    6 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |   14 +-
 drivers/gpu/drm/gma500/psb_intel_reg.h        |   28 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |   20 +-
 drivers/gpu/drm/gma500/psb_irq.c              |   72 +-
 drivers/gpu/drm/gma500/psb_irq.h              |    2 -
 drivers/gpu/drm/gma500/psb_reg.h              |   14 -
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c    |  805 -------------
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.h    |   38 -
 38 files changed, 31 insertions(+), 9639 deletions(-)
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_device.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_dpi.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_output.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_output.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_intel_display.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_output.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_output.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_tmd_vid.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_tpo_vid.c
 delete mode 100644 drivers/gpu/drm/gma500/mid_bios.c
 delete mode 100644 drivers/gpu/drm/gma500/mid_bios.h
 delete mode 100644 drivers/gpu/drm/gma500/oaktrail.h
 delete mode 100644 drivers/gpu/drm/gma500/oaktrail_crtc.c
 delete mode 100644 drivers/gpu/drm/gma500/oaktrail_device.c
 delete mode 100644 drivers/gpu/drm/gma500/oaktrail_hdmi.c
 delete mode 100644 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
 delete mode 100644 drivers/gpu/drm/gma500/oaktrail_lvds.c
 delete mode 100644 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
 delete mode 100644 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
 delete mode 100644 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.h

--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
