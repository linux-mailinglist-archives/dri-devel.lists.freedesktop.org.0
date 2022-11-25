Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780746390BA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 21:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECCB10E797;
	Fri, 25 Nov 2022 20:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DB610E797
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 20:31:20 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d898:271f:7512:e47f])
 by albert.telenet-ops.be with bizsmtp
 id okXG280064su47u06kXGQe; Fri, 25 Nov 2022 21:31:18 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLv-001aQt-Q7; Fri, 25 Nov 2022 21:31:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLv-003Kyn-9h; Fri, 25 Nov 2022 21:31:15 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH/RFC 0/3] Atari DRM driver
Date: Fri, 25 Nov 2022 21:31:07 +0100
Message-Id: <cover.1669406380.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This RFC patch series adds a DRM driver for the good old Atari
ST/TT/Falcon hardware.  It was developed and tested (only) on the ARAnyM
emulator.

Supported formats:
  - C[1248],
  - RG16 (both standard DRM (little-endian) and native (big-endian)),
  - XR24.

Patch overview:
  1. The first patch adds two new helper functions for chunky-to-planar
     conversion,
  2. The second patch, posted by Thomas Zimmermann a long time ago,
     introduces a mode_fixup simple kms helper function (more helpers
     from his fbdev conversion helper function series have been included
     (partially) in the Atari DRM driver itself),
  3. The third patch is the actual Atari DRM driver.  The patch was
     created with "git format-patch -C", to avoid spamming you with code
     that is identical to the existing Atari fbdev driver.

The driver is definitely not yet ready for upstream inclusion.
While mode switching usually works, it is far from optimal, and may
suffer from hick-ups.  Hence the main objective for posting this
preliminary version is to receive feedback about the (wrong) helper
functions and callbacks I am using, and about what/how to improve.

Dependencies:
  - drm-next
  - Patch series [1] and [2],
  - For running modetest, you want to apply patch series [3], [4], and
    [5] to libdrm.

For your testing convenience, I have pushed this series and its
dependencies to [6].

Thanks for your comments!

P.S. If you are more interested in the journey than in the destination,
     perhaps you are interested in the presentation I gave at last
     ELC-E?[7]

[1] "[PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
    RGB565 formats"
    https://lore.kernel.org/r/3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org
[2] "[PATCH v3 0/2] drm/modes: Command line mode selection improvements"
    https://lore.kernel.org/r/cover.1669405382.git.geert@linux-m68k.org

[3] "[PATCH libdrm v2 00/10] Add support for low-color frame buffer
    formats"
    https://lore.kernel.org/r/cover.1657302034.git.geert@linux-m68k.org
[4] "[PATCH libdrm v2 00/10] Big-endian fixes"
    https://lore.kernel.org/r/cover.1657302103.git.geert@linux-m68k.org
[5] "[PATCH libdrm] modetest: Add support for named modes containing
    dashes"
[6] https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=atari-drm-wip-v1
[7] https://osseu2022.sched.com/event/15z6T/trading-fbdev-for-drm-no-returns-accepted-geert-uytterhoeven-glider-bv

Geert Uytterhoeven (2):
  video: fbdev: c2p: Add transp2() and transp2x()
  drm: atari: Add a DRM driver for Atari graphics hardware

Thomas Zimmermann (1):
  drm/simple-kms-helper: Add mode_fixup() to simple display pipe

 drivers/gpu/drm/drm_simple_kms_helper.c       |   15 +
 drivers/gpu/drm/tiny/Kconfig                  |    8 +
 drivers/gpu/drm/tiny/Makefile                 |    1 +
 .../atafb.c => gpu/drm/tiny/atari_drm.c}      | 2536 +++++++++++++----
 drivers/video/fbdev/c2p_core.h                |   38 +
 include/drm/drm_simple_kms_helper.h           |   43 +
 6 files changed, 2113 insertions(+), 528 deletions(-)
 copy drivers/{video/fbdev/atafb.c => gpu/drm/tiny/atari_drm.c} (57%)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
