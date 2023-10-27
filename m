Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C571F7D9D57
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4691710E9F7;
	Fri, 27 Oct 2023 15:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6D710E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:48:16 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a11d:fe3:b715:706f])
 by xavier.telenet-ops.be with bizsmtp
 id 33oE2B00B2Q454m013oEy7; Fri, 27 Oct 2023 17:48:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4A-007cgP-7y;
 Fri, 27 Oct 2023 17:48:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4I-00HHmm-5v;
 Fri, 27 Oct 2023 17:48:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 0/9] Big-endian fixes
Date: Fri, 27 Oct 2023 17:48:03 +0200
Message-Id: <cover.1698416179.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series fixes some endianness issues in libdrm.
It has been tested on ARAnyM using a work-in-progress Atari DRM driver.
After this, the smpte and tiles modetest patterns and the pwetty markers
are rendered correctly using the XR24, RG16, and RG16BE formats on
big-endian systems.

Changes compared to v3[1]:
  - Replace explicit #ifdef checks by a define set by meson,
  - Use new HAVE_BIG_ENDIAN symbol,

Changes compared to v2[2]:
  - Increase indentation after definition of cpu_to_*() macros,
  - Update for suffix change from "be" to "_BE", cfr. commit
    ffb9375a505700ad ("xf86drm: handle DRM_FORMAT_BIG_ENDIAN in
    drmGetFormatName()"),
  - Replace hardcoded numbers in code by sizeof(),
  - Wrap byteswap_buffer{16,32}() implementation inside #if HAVE_CAIRO
    to avoid defined-but-not-used compiler warnings,
  - Drop "modetest: Fix printing of big-endian fourcc values", as it is
    no longer needed since commit ffb9375a505700ad ("xf86drm: handle
    DRM_FORMAT_BIG_ENDIAN in drmGetFormatName()").

Changes compared to v1[3]:
  - Consider arm, aarch64, microblaze, s390, and sh in endianness
    checks,
  - Add Acked-by,
  - Add swap32() intermediate helper,
  - Fix 16 bpp formats on big-endian,
  - Add support for big-endian XRGB1555 and RGB565,
  - Fix printing of big-endian fourcc values,
  - Fix pwetty on big-endian.

I have also updated the merge request at [4].

Thanks for your comments!

[1] "[PATCH libdrm v3 0/9] Big-endian fixes
    https://lore.kernel.org/r/cover.1698217235.git.geert@linux-m68k.org
[2] "[PATCH libdrm v2 00/10] Big-endian fixes"
    https://lore.kernel.org/r/cover.1657302103.git.geert@linux-m68k.org/#t
[3] "[PATCH RFC libdrm 0/2] Big-endian fixes"
    https://lore.kernel.org/r/cover.1646684158.git.geert@linux-m68k.org
[4] https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/331

Geert Uytterhoeven (9):
  intel: determine target endianness using meson
  util: fix 32 bpp patterns on big-endian
  util: fix 16 bpp patterns on big-endian
  util: add missing big-endian RGB16 frame buffer formats
  modetest: add support for parsing big-endian formats
  util: add test pattern support for big-endian XRGB1555/RGB565
  util: fix pwetty on big-endian
  util: add pwetty support for big-endian RGB565
  modetest: add support for big-endian XRGB1555/RGB565

 intel/uthash.h            |   4 +-
 meson.build               |   5 ++
 tests/modetest/buffers.c  |   4 ++
 tests/modetest/modetest.c |  15 +++--
 tests/util/format.c       |   3 +
 tests/util/pattern.c      | 117 +++++++++++++++++++++++++++++++-------
 6 files changed, 120 insertions(+), 28 deletions(-)

-- 
2.34.1

