Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8A4D08E9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0E110E28D;
	Mon,  7 Mar 2022 20:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7E10E282
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by albert.telenet-ops.be with bizsmtp
 id 3Ytm270091Yj8bA06Ytmfh; Mon, 07 Mar 2022 21:53:46 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKMU-0036UW-1I; Mon, 07 Mar 2022 21:53:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKMT-0034nx-F4; Mon, 07 Mar 2022 21:53:45 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC libdrm 0/2] Big-endian fixes
Date: Mon,  7 Mar 2022 21:53:40 +0100
Message-Id: <cover.1646684158.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

When starting to use modetest, I was a bit surprised to discover the
default XR24 format wasn't displayed correctly on my work-in-progress
Atari DRM driver, which runs on a big-endian system.

This RFC patch series fixes some endianness issues in libdrm.
It has been tested on ARAnyM using a work-in-progress Atari DRM driver,
which can now display the XR24 format by converting XRGB8888 to RGB332.

Overview:
  - Patch 1 improves the existing endianness checks in a header file for
    the Intel driver,
  - Patch 2 fixes the display of 32 bpp patterns on big-endian systems.

Futher endian fixes may be needed.  Note that I also have a variant of
patch 2 for 16 bpp, which works with the Atari DRM driver converting
RGB565 to RGB332.  But I want to get real 16 bpp working in the Atari
DRM driver first, as that uses a 16-bit big endian format.
And what about 24 bpp?

Please refer to [1] for more information.

Thanks for your comments!

[1] "[PATCH v2 00/10] drm: Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1646683502.git.geert@linux-m68k.org

Geert Uytterhoeven (2):
  intel: Improve checks for big-endian
  util: Fix 32 bpp patterns on big-endian

 intel/uthash.h       |  2 +-
 tests/util/pattern.c | 30 +++++++++++++++++++++---------
 2 files changed, 22 insertions(+), 10 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
