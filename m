Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476C752335
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666E910E6D0;
	Thu, 13 Jul 2023 13:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1123C10E6D4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:17:26 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6264:77e5:42e2:477d])
 by laurent.telenet-ops.be with bizsmtp
 id LdHN2A00Q3wy6xv01dHNpZ; Thu, 13 Jul 2023 15:17:23 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwC3-001Gqn-0L;
 Thu, 13 Jul 2023 15:17:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwCA-00GWyS-LN;
 Thu, 13 Jul 2023 15:17:22 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1
Date: Thu, 13 Jul 2023 15:17:08 +0200
Message-Id: <cover.1689252746.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

The native display format of ssd1306 OLED displays is monochrome
light-on-dark (R1).  This patch series adds support for the R1 buffer
format to both the ssd130x DRM driver and the FB helpers, so monochrome
applications (including fbdev emulation and the text console) can avoid
the overhead of back-and-forth conversions between R1 and XR24.

This series is based on drm-misc/for-linux-next with [1] applied, and
consists of 4 parts:
  - Patches 1-3 contain miscellaneous fixes,
  - Patch 4 adds R1 support to the ssd130x DRM driver,
  - Patches 5-6 update the DRM client and FB helper code to avoid
    calling drm_mode_legacy_fb_format() where the exact buffer format is
    already known, to prepare for R1 support,
  - Patch 7 adds support for R1 to fbdev emulation and the text console,
  - Patch 8 switches ssd130x to R1 for fbdev emulation and the text
    console.

This has been tested on an Adafruit FeatherWing 128x32 OLED, connected
to an OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V
softcore, using the fbdev text console.

Thanks for your comments!

P.S. Note that the biggest hurdle was the copious use of the
     drm_mode_legacy_fb_format() helper in various places.  This helper
     cannot decide between C1 and R1 without knowledge of the
     capabilities of the full display pipeline.  Instead of
     special-casing its return value in three callers, I did so in only
     one place, and got rid of two of these calls in the call chain.
     I think Thomas' grand plan is to replace preferred_{bpp,depth} by a
     preferred fourcc format? That would simplify things a lot...

[1] "[PATCH] drm/ssd130x: Change pixel format used to compute the buffer
    size"
    https://lore.kernel.org/all/20230713085859.907127-1-javierm@redhat.com

Geert Uytterhoeven (8):
  drm/ssd130x: Fix pitch calculation in ssd130x_fb_blit_rect()
  drm/dumb-buffers: Fix drm_mode_create_dumb() for bpp < 8
  [RFC] drm/ssd130x: Bail out early if data_array is not yet available
  drm/ssd130x: Add support for DRM_FORMAT_R1
  drm/client: Convert drm_mode_create_dumb() to drm_mode_addfb2()
  drm/fb-helper: Pass buffer format via drm_fb_helper_surface_size
  drm/fb-helper: Add support for DRM_FORMAT_R1
  drm/ssd130x: Switch preferred_bpp/depth to 1

 drivers/gpu/drm/drm_client.c        | 13 +++---
 drivers/gpu/drm/drm_dumb_buffers.c  |  3 +-
 drivers/gpu/drm/drm_fb_helper.c     | 42 ++++++++++++++-----
 drivers/gpu/drm/drm_fbdev_generic.c |  9 ++---
 drivers/gpu/drm/solomon/ssd130x.c   | 62 ++++++++++++++++++++---------
 include/drm/drm_fb_helper.h         |  2 +
 6 files changed, 87 insertions(+), 44 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
