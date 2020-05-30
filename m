Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5901E8D5C
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D906E99C;
	Sat, 30 May 2020 03:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104846E99B
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:36 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6D292A3;
 Sat, 30 May 2020 05:10:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808234;
 bh=w7g/o9cGruQn1LqaGQKxdOPMUf/mL6dXdBReAARQSKQ=;
 h=From:To:Cc:Subject:Date:From;
 b=WVP03OEKzjmg47zObWtxh5QXfVBRelaZVacS+ky0ECeGTxIMbcjVUDVhBWlhXyARx
 0ggxcHQW9zk3J1ibiV/yRPkQEgQyNC2LsMLnlq59uudUR8s5nZRgG3Qbv4Q6l9Gbj4
 WIKkKlCkucaMg59EPRD73B0lBrvy+gtgfpn1Qxic=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/22] drm: mxsfb: Add i.MX7 support
Date: Sat, 30 May 2020 06:09:53 +0300
Message-Id: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series adds i.MX7 support to the mxsfb driver. The eLCDIF
instance found in the i.MX7 is backward-compatible with the already
supported LCDC v4, but has extended features amongst which the most
notable one is a second plane.

The first 10 patches (01/22 to 10/22) contain miscellaneous cleanups and
refactoring to prepare for what is to come. Patch 11/22 starts the real
work with removal of the DRM simple display pipeline helper, as it
doesn't support multiple planes. The next patch (12/22) is an additional
cleanup.

Patches 13/22 to 15/22 fix vblank handling that I found to be broken
when testing on my device. Patch 16/22 then performs an additional small
cleanup, and patch 17/22 starts official support for i.MX7 by mentioning
it in Kconfig.

Patch 18/22 adds a new device model for the i.MX6SX and i.MX7 eLCDIF.
After three additional cleanups in patches 19/22 to 21/22, patch 22/22
finally adds support for the second plane.

The second plane suffers from an issue whose root cause hasn't been
found, which results in the first 64 bytes of the first line to contain
data of unknown origin. Help from NXP to diagnose this issue would be
useful and appreciated.

Compared to v1, the patches incorporate various review feedback, without
major modifications. See individual changelogs for details.

The code is based on v5.7-rc7 and has been tested on an i.MX7D platform
with a DPI panel. There is no conflict between v5.7-rc7 and
drm-misc-next for the mxsfb driver.

Laurent Pinchart (22):
  drm: mxsfb: Remove fbdev leftovers
  drm: mxsfb: Use drm_panel_bridge
  drm: mxsfb: Use BIT() macro to define register bitfields
  drm: mxsfb: Remove unused macros from mxsfb_regs.h
  drm: mxsfb: Clarify format and bus width configuration
  drm: mxsfb: Pass mxsfb_drm_private pointer to mxsfb_reset_block()
  drm: mxsfb: Use LCDC_CTRL register name explicitly
  drm: mxsfb: Remove register definitions from mxsfb_crtc.c
  drm: mxsfb: Remove unneeded includes
  drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
  drm: mxsfb: Stop using DRM simple display pipeline helper
  drm: mxsfb: Move vblank event arm to CRTC .atomic_flush()
  drm: mxsfb: Don't touch AXI clock in IRQ context
  drm: mxsfb: Enable vblank handling
  drm: mxsfb: Remove mxsfb_devdata unused fields
  drm: mxsfb: Add i.MX7 and i.MX8M to the list of supported SoCs in
    Kconfig
  drm: mxsfb: Update internal IP version number for i.MX6SX
  drm: mxsfb: Drop non-OF support
  drm: mxsfb: Turn mxsfb_set_pixel_fmt() into a void function
  drm: mxsfb: Merge mxsfb_set_pixel_fmt() and mxsfb_set_bus_fmt()
  drm: mxsfb: Remove unnecessary spaces after tab
  drm: mxsfb: Support the alpha plane

 drivers/gpu/drm/mxsfb/Kconfig      |   8 +-
 drivers/gpu/drm/mxsfb/Makefile     |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 343 -----------------
 drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 248 ++++---------
 drivers/gpu/drm/mxsfb/mxsfb_drv.h  |  42 ++-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 565 +++++++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_out.c  |  99 -----
 drivers/gpu/drm/mxsfb/mxsfb_regs.h | 103 +++---
 8 files changed, 732 insertions(+), 678 deletions(-)
 delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_crtc.c
 create mode 100644 drivers/gpu/drm/mxsfb/mxsfb_kms.c
 delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_out.c

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
