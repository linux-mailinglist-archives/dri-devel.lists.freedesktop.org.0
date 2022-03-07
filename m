Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57B4D08D0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528DB10E217;
	Mon,  7 Mar 2022 20:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B7B10E217
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:52:59 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by andre.telenet-ops.be with bizsmtp
 id 3Ysu270081Yj8bA01Ysuv6; Mon, 07 Mar 2022 21:52:57 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLY-0036Qc-Ct; Mon, 07 Mar 2022 21:52:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLX-0034hC-RC; Mon, 07 Mar 2022 21:52:47 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 00/10] drm: Add support for low-color frame buffer formats
Date: Mon,  7 Mar 2022 21:52:35 +0100
Message-Id: <cover.1646683502.git.geert@linux-m68k.org>
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
systems, and on small embedded displays.

This patch series adds support for color-indexed frame buffer formats
with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
work-in-progress Atari DRM driver supporting 2, 4, 16, and 256 colors,
with text console operation, fbtest, and modetest.

Overview:
  - Patch 1 introduces a helper, to be used by later patches in the
    series,
  - Patch 2 introduces a flag to indicate color-indexed formats,
  - Patches 3 and 4 correct calculations of bits per pixel for sub-byte
    pixel formats,
  - Patches 5 and 6 introduce the new C[124] formats,
  - Patch 7 fixes an untested code path,
  - Patch 8 documents the use of "red" for light-on-dark displays,
  - Patches 9 and 10 add more fourcc codes for light-on-dark and
    dark-on-light frame buffer formats, which may be useful for e.g. the
    ssd130x and repaper drivers.

Changes compared to v1[1]:
  - Reshuffle patches,
  - New patch "[PATCH v2 02/10] drm/fourcc: Add
    drm_format_info.is_color_indexed flag",
  - Improve pixel descriptions,
  - Require depth to match bpp in drm_mode_legacy_fb_format(),
  - Set .is_color_indexed flag.
  - Use drm_format_info_bpp() helper instead of deprecated .depth field
    or format-dependent calculations,
  - Use new .is_color_indexed field instead of checking against a list
    of formats,
  - Add Acked-by,
  - Replace FIXME by TODO comment,
  - New patch "[PATCH v2 08/10] [RFC] drm/fourcc: Document that
    single-channel "red" can be any color",
  - Add rationale for adding new formats,
  - Add D[248] for completeness.

Notes:
  - Using modetest with the C4 formats requires [2].
  - Using modetest with the default XR24 format requires [3].
  - As this was used on emulated hardware only, and I do not have Atari
    hardware, I do not have performance figures to compare with fbdev.
    I hope to do proper measuring with an Amiga DRM driver, eventually.

Thanks for your comments!

[1] "[PATCH 0/8] drm: Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/20220215165226.2738568-1-geert@linux-m68k.org/
[2] "[PATCH libdrm 0/3] Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1646683737.git.geert@linux-m68k.org
[3] "[PATCH RFC libdrm 0/2] Big-endian fixes"
    https://lore.kernel.org/r/cover.1646684158.git.geert@linux-m68k.org

Geert Uytterhoeven (10):
  drm/fourcc: Add drm_format_info_bpp() helper
  drm/fourcc: Add drm_format_info.is_color_indexed flag
  drm/client: Use actual bpp when allocating frame buffers
  drm/framebuffer: Use actual bpp for DRM_IOCTL_MODE_GETFB
  drm/fourcc: Add DRM_FORMAT_C[124]
  drm/fb-helper: Add support for DRM_FORMAT_C[124]
  [RFC] drm/gem-fb-helper: Use actual bpp for size calculations
  [RFC] drm/fourcc: Document that single-channel "red" can be any color
  [RFC] drm/fourcc: Add DRM_FORMAT_R[124]
  [RFC] drm/fourcc: Add DRM_FORMAT_D[1248]

 drivers/gpu/drm/drm_client.c                 |   4 +-
 drivers/gpu/drm/drm_fb_helper.c              | 101 ++++++++++++++-----
 drivers/gpu/drm/drm_fourcc.c                 |  55 +++++++++-
 drivers/gpu/drm/drm_framebuffer.c            |   2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  12 +--
 include/drm/drm_fourcc.h                     |   4 +
 include/uapi/drm/drm_fourcc.h                |  36 +++++--
 7 files changed, 169 insertions(+), 45 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
