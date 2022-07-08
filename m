Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98356BEB0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19EC10EC11;
	Fri,  8 Jul 2022 18:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0D810EBD7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:53 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siMs2700M4C55Sk06iMslr; Fri, 08 Jul 2022 20:21:52 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-002fNc-Ev; Fri, 08 Jul 2022 20:21:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-00BtUp-10; Fri, 08 Jul 2022 20:21:52 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 00/10] Big-endian fixes
Date: Fri,  8 Jul 2022 20:21:39 +0200
Message-Id: <cover.1657302103.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series fixes some endianness issues in libdrm.
It has been tested on ARAnyM using a work-in-progress Atari DRM driver.

Changes compared to v1:
  - Consider arm, aarch64, microblaze, s390, and sh in endianness
    checks,
  - Add Acked-by,
  - Add swap32() intermediate helper,
  - Fix 16 bpp formats on big-endian,
  - Add support for big-endian XRGB1555 and RGB565,
  - Fix printing of big-endian fourcc values,
  - Fix pwetty on big-endian.

Please refer to [2] for related Linux DRM patches and background
information.

Thanks for your comments!

[1] "[PATCH RFC libdrm 0/2] Big-endian fixes"
    https://lore.kernel.org/r/cover.1646684158.git.geert@linux-m68k.org
[2] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org

Geert Uytterhoeven (11):
  intel: Improve checks for big-endian
  util: Fix 32 bpp patterns on big-endian
  util: Fix 16 bpp patterns on big-endian
  util: Add missing big-endian RGB16 frame buffer formats
  modetest: Fix printing of big-endian fourcc values
  modetest: Add support for parsing big-endian formats
  util: Add test pattern support for big-endian XRGB1555/RGB565
  util: Fix pwetty on big-endian
  util: Add pwetty support for big-endian RGB565
  modetest: Add support for big-endian XRGB1555/RGB565

 intel/uthash.h            |   2 +-
 tests/modetest/buffers.c  |   4 ++
 tests/modetest/modetest.c |  25 ++++---
 tests/util/format.c       |   3 +
 tests/util/pattern.c      | 115 +++++++++++++++++++++++++++++++-------
 5 files changed, 115 insertions(+), 29 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
