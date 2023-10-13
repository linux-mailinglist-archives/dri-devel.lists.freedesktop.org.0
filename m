Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3897C87FF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764010E05C;
	Fri, 13 Oct 2023 14:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD1910E184
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:20 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
 by michel.telenet-ops.be with bizsmtp
 id xSjH2A00C56FAx306SjJx3; Fri, 13 Oct 2023 16:43:18 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNi-006Gwc-Cs;
 Fri, 13 Oct 2023 16:43:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNl-002Vp9-Pl;
 Fri, 13 Oct 2023 16:43:17 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 0/9] util,
 modetest: add support for low-color frame buffer formats
Date: Fri, 13 Oct 2023 16:43:02 +0200
Message-Id: <cover.1697207862.git.geert@linux-m68k.org>
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

A long outstanding issue with the DRM subsystem has been the lack of
support for low-color displays, as used typically on older desktop
systems, and on small embedded displays.

This patch series adds support for color-indexed frame buffer formats
with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
work-in-progress Atari DRM driver.

Changes compared to v3[1]:
  - Rename util_smpte_index_gamma() to util_smpte_fill_lut(), and its
    first parameter from size to ncolors,
  - Move smpte_color_lut[] down,
  - Kill FILL_COLOR() macro,
  - Add and use EXPAND_COLOR() macro,
  - Replace FILL_COLOR() use by bw_color_lut[],
  - Replace FILL_COLOR() use by pentile_color_lut[],
  - Add missing C[12] to oneline-summary,
  - Do not remove memset() of full lut, else some entries may stay
    uninitialized.

Changes compared to v2[2]:
  - Add Acked-by,
  - Add Wikipedia link,
  - Dropped "[RFC] drm_fourcc: Add DRM_FORMAT_C[124]", as these were
    added in commit 329eebcf32793361 ("drm_fourcc: sync drm_fourcc with
    latest drm-next kernel") in libdrm-2.4.115.

Changes compared to v1[3]:
  - SMPTE color LUT accuracy,
  - Factor out smpte color LUT,
  - Restructure patches,
  - Improve descriptions.
  - Store number of colors for indexed formats,
  - Add SMPTE pattern support for the C1 and C2 formats.

I have also updated the merge request at [4].

Thanks for your comments!

[1] https://lore.kernel.org/r/cover.1690537375.git.geert@linux-m68k.org
[2] https://lore.kernel.org/r/cover.1657302034.git.geert@linux-m68k.org/
[3] https://lore.kernel.org/r/cover.1646683737.git.geert@linux-m68k.org/
[4] https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/314

Geert Uytterhoeven (9):
  util: improve SMPTE color LUT accuracy
  util: factor out and optimize C8 SMPTE color LUT
  util: add support for DRM_FORMAT_C[124]
  util: store number of colors for indexed formats
  util: add SMPTE pattern support for C4 format
  util: add SMPTE pattern support for C1 format
  util: add SMPTE pattern support for C2 format
  modetest: add support for DRM_FORMAT_C[124]
  modetest: add SMPTE pattern support for C[124] formats

 tests/modetest/buffers.c  |  15 ++
 tests/modetest/modetest.c |   9 +-
 tests/util/format.c       |   5 +-
 tests/util/format.h       |   1 +
 tests/util/pattern.c      | 430 ++++++++++++++++++++++++++++++++++----
 tests/util/pattern.h      |   2 +-
 6 files changed, 415 insertions(+), 47 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
