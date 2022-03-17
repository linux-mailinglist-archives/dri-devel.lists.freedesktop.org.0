Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329054DC0CD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C47910F007;
	Thu, 17 Mar 2022 08:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145F10F004
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 08:18:38 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f500:58f9:d953:424b])
 by albert.telenet-ops.be with bizsmtp
 id 7LJa2700a0M4NNo06LJafd; Thu, 17 Mar 2022 09:18:36 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL8-004vC6-6p; Thu, 17 Mar 2022 09:18:34 +0100
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL7-00559Z-5V; Thu, 17 Mar 2022 09:18:33 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 0/5] drm: Fix monochrome conversion for sdd130x
Date: Thu, 17 Mar 2022 09:18:25 +0100
Message-Id: <20220317081830.1211400-1-geert@linux-m68k.org>
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
softcore, using a text console with 4x6, 7x14 and 8x8 fonts.

Thanks!

Geert Uytterhoeven (5):
  drm/format-helper: Rename drm_fb_xrgb8888_to_mono_reversed()
  drm/format-helper: Fix XRGB888 to monochrome conversion
  drm/ssd130x: Fix rectangle updates
  drm/ssd130x: Reduce temporary buffer sizes
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
