Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E76D230C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84DC10F281;
	Fri, 31 Mar 2023 14:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D26310F285
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:52:41 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by albert.telenet-ops.be with bizsmtp
 id f2se2900P1C8whw062sej4; Fri, 31 Mar 2023 16:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG2N-00FUga-4H;
 Fri, 31 Mar 2023 16:48:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG36-008fIP-Gz;
 Fri, 31 Mar 2023 16:48:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/5] drm: shmobile: Fixes and enhancements
Date: Fri, 31 Mar 2023 16:48:06 +0200
Message-Id: <cover.1680273039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

Currently, there are two drivers for the LCD controller on Renesas
SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
  1. sh_mobile_lcdcfb, using the fbdev framework,
  2. shmob_drm, using the DRM framework.
However, only the former driver can be used, as all platform support
integrates the former.  None of these drivers support DT-based systems.

This patch series is a first step to enable the SH-Mobile DRM driver for
Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned is
to add DT support.

This has been tested on the R-Mobile A1-based Atmark Techno
Armadillo-800-EVA development board, using a temporary
platform-enablement patch[1].

Thanks for your comments!

[1] https://lore.kernel.org/r/c03d4edbd650836bf6a96504df82338ec6d800ff.1680272980.git.geert+renesas@glider.be

Geert Uytterhoeven (5):
  drm: shmobile: Use %p4cc to print fourcc codes
  drm: shmobile: Add support for DRM_FORMAT_XRGB8888
  drm: shmobile: Switch to drm_crtc_init_with_planes()
  drm: shmobile: Add missing call to drm_fbdev_generic_setup()
  drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC platforms

 drivers/gpu/drm/shmobile/Kconfig           |  2 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 35 +++++++++++++++++++---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c   |  3 ++
 drivers/gpu/drm/shmobile/shmob_drm_kms.c   |  9 ++++--
 drivers/gpu/drm/shmobile/shmob_drm_plane.c |  5 ++++
 5 files changed, 47 insertions(+), 7 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
