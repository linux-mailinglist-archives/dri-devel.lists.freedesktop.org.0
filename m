Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D408907C3F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BB110EB7B;
	Thu, 13 Jun 2024 19:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694A10EB79
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:18:10 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4W0XHh4qwlz4x1Mn
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:18:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
 by laurent.telenet-ops.be with bizsmtp
 id b7J62C0083w30qz017J6YX; Thu, 13 Jun 2024 21:18:08 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpwS-00Ax6i-C0;
 Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpxW-00FL8Q-AI;
 Thu, 13 Jun 2024 21:18:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/7] drm/panic: Fixes and graphical logo
Date: Thu, 13 Jun 2024 21:17:58 +0200
Message-Id: <cover.1718305355.git.geert+renesas@glider.be>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

If drm/panic is enabled, a user-friendly message is shown on screen when
a kernel panic occurs, together with an ASCII art penguin logo.
Of course we can do better ;-)
Hence this patch series extends drm/panic to draw the monochrome
graphical boot logo, when available, preceded by the customary fixes.

Changes compared to v1:
  - Rebase against today's drm-misc-next, where drm_panic is broken on
    all current drivers due to an uninitialized pointer dereference.
    Presumably this was only tested with an out-of-tree driver change?
  - New fixes [1/7], [3/7], and [4/7],
  - New cleanup [5/7],
  - Inline trivial draw_logo_mono().

This has been tested with rcar-du.

Thanks for your comments!

Geert Uytterhoeven (7):
  drm/panic: Fix uninitialized drm_scanout_buffer.set_pixel() crash
  drm/panic: Fix off-by-one logo size checks
  lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if DRM_PANIC
  drm/panic: Spelling s/formater/formatter/
  drm/panic: Convert to drm_fb_clip_offset()
  drm/panic: Rename logo to logo_ascii
  drm/panic: Add support for drawing a monochrome graphical logo

 drivers/gpu/drm/Kconfig     |  2 +-
 drivers/gpu/drm/drm_panic.c | 74 +++++++++++++++++++++++++++++++------
 drivers/video/logo/Kconfig  |  2 +
 lib/fonts/Kconfig           |  6 ++-
 4 files changed, 70 insertions(+), 14 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
