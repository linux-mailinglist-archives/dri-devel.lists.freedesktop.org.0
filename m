Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D819730A9A7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC896E4A1;
	Mon,  1 Feb 2021 14:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579146E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:25:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3CC1AB92;
 Mon,  1 Feb 2021 14:25:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 0/4] drm/gma500: Remove Medfield
Date: Mon,  1 Feb 2021 15:25:30 +0100
Message-Id: <20210201142534.20364-1-tzimmermann@suse.de>
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

(was: drm/gma500: Remove Moorestown/Medfield)

Support for the Medfield platform is being removed fromthe kernel. So
here's a patch to remove the related code from the gma500 driver. On
top of that I also cleaned up the configuration a bit.

Note that Poulsbo, Oak Trail and Cedar Trail is still there and will
remain. With Medfield gone, there might be a chance of cleaning up
the remaining code.

I smoke tested the patchset by running Xorg and Weston on a Cedartrail
system.

v2:
	* restore Moorestown/Oak Trail in the patchset (Patrik)

Thomas Zimmermann (4):
  drm/gma500: Remove Medfield support
  drm/gma500: Drop DRM_GMA600 and DRM_GMA3600 config options
  drm/gma500: Remove CONFIG_X86 conditionals from source files
  drm/gma500: Remove dependency on TTM

 drivers/gpu/drm/gma500/Kconfig                |   28 +-
 drivers/gpu/drm/gma500/Makefile               |   50 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |    4 -
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
 drivers/gpu/drm/gma500/mmu.c                  |   21 -
 drivers/gpu/drm/gma500/psb_drv.c              |   19 +-
 drivers/gpu/drm/gma500/psb_drv.h              |   67 --
 drivers/gpu/drm/gma500/psb_intel_drv.h        |    4 -
 drivers/gpu/drm/gma500/psb_intel_reg.h        |   12 +-
 drivers/gpu/drm/gma500/psb_irq.c              |   72 +-
 drivers/gpu/drm/gma500/psb_irq.h              |    2 -
 drivers/gpu/drm/gma500/psb_reg.h              |   14 -
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c    |  805 -------------
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.h    |   38 -
 25 files changed, 27 insertions(+), 5904 deletions(-)
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
 delete mode 100644 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
 delete mode 100644 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.h


base-commit: f9173d6435c6a9bb0b0076ebf9122d876da208ae
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
