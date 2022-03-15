Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C274D99F8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 12:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E877510E374;
	Tue, 15 Mar 2022 11:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E06410E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 11:07:21 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1dc0:e57f:6975:ecb9])
 by michel.telenet-ops.be with bizsmtp
 id 6b7H2700C3jtd4z06b7H5P; Tue, 15 Mar 2022 12:07:19 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nU51I-004XNr-Pu; Tue, 15 Mar 2022 12:07:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nU51I-002dQx-8l; Tue, 15 Mar 2022 12:07:16 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 0/5] drm: Fix monochrome conversion for sdd130x
Date: Tue, 15 Mar 2022 12:07:02 +0100
Message-Id: <20220315110707.628166-1-geert@linux-m68k.org>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series contains fixes and improvements for the XRGB888 to
monochrome conversion in the DRM core, and for its users.

This has been tested on an Adafruit FeatherWing 128x32 OLED, connected
to an OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V
softcore, using a text console with 7x14 and 8x8 fonts.

Thanks for your comments!

Geert Uytterhoeven (5):
  drm/format-helper: Rename drm_fb_xrgb8888_to_mono_reversed()
  drm/format-helper: Fix XRGB888 to monochrome conversion
  drm: ssd130x: Fix rectangle updates
  drm: ssd130x: Reduce temporary buffer sizes
  drm/repaper: Reduce temporary buffer size in repaper_fb_dirty()

 drivers/gpu/drm/drm_format_helper.c | 74 +++++++++++------------------
 drivers/gpu/drm/solomon/ssd130x.c   | 24 +++++++---
 drivers/gpu/drm/tiny/repaper.c      |  4 +-
 include/drm/drm_format_helper.h     |  5 +-
 4 files changed, 48 insertions(+), 59 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
