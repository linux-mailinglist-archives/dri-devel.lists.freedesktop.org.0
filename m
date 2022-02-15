Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098DF4B73EA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 17:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C545B10E53D;
	Tue, 15 Feb 2022 16:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E027F10E557
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 16:52:33 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7534:e0be:5adf:2691])
 by albert.telenet-ops.be with bizsmtp
 id vUsV2600718GbK106UsVLq; Tue, 15 Feb 2022 17:52:31 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nK140-000tUj-RY; Tue, 15 Feb 2022 17:52:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nK13z-00BURL-Tk; Tue, 15 Feb 2022 17:52:27 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH 0/8] drm: Add support for low-color frame buffer formats
Date: Tue, 15 Feb 2022 17:52:18 +0100
Message-Id: <20220215165226.2738568-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

A long outstanding issue with the DRM subsystem has been the lack of
support for low-color displays, as used typically on older desktop
systems and small embedded displays.

This patch series adds support for color-indexed frame buffer formats
with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
work-in-progress Atari DRM driver, with text console operation and
fbtest.

Overview:
  - Patches 1 and 2 give a working system, albeit with a too large pitch
    (line length),
  - Patches 3 and 4 reduce memory consumption by correcting the pitch
    in case bpp < 8,
  - Patches 5 and 6 are untested, but may become useful with DRM
    userspace,
  - Patches 7 and 8 add more fourcc codes for grayscale and monochrome
    frame buffer formats, which may be useful for e.g. the ssd130x and
    repaper drivers.

Notes:
  - I haven't looked yet into making modetest draw a correct image.
  - As this was used on emulated hardware only, and I do not have Atari
    hardware, I do not have performance figures to compare with fbdev.
    I hope to do proper measuring with an Amiga DRM driver, eventually.

Thanks for your comments!

Geert Uytterhoeven (8):
  drm/fourcc: Add DRM_FORMAT_C[124]
  drm/fb-helper: Add support for DRM_FORMAT_C[124]
  drm/fourcc: Add drm_format_info_bpp() helper
  drm/client: Use actual bpp when allocating frame buffers
  drm/framebuffer: Use actual bpp for DRM_IOCTL_MODE_GETFB
  drm/gem-fb-helper: Use actual bpp for size calculations
  drm/fourcc: Add DRM_FORMAT_R[124]
  drm/fourcc: Add DRM_FORMAT_D1

 drivers/gpu/drm/drm_client.c                 |   4 +-
 drivers/gpu/drm/drm_fb_helper.c              | 120 ++++++++++++++-----
 drivers/gpu/drm/drm_fourcc.c                 |  45 +++++++
 drivers/gpu/drm/drm_framebuffer.c            |   2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  12 +-
 include/drm/drm_fourcc.h                     |   1 +
 include/uapi/drm/drm_fourcc.h                |  15 +++
 7 files changed, 160 insertions(+), 39 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
