Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43700766964
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC7710E6CA;
	Fri, 28 Jul 2023 09:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5910E6C9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:52:48 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
 by laurent.telenet-ops.be with bizsmtp
 id SZsm2A00M0d1nm801Zsmsa; Fri, 28 Jul 2023 11:52:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPK9B-002m52-FX;
 Fri, 28 Jul 2023 11:52:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPK9O-00ApUU-K7;
 Fri, 28 Jul 2023 11:52:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v3 0/9] util,
 modetest: Add support for low-color frame buffer formats
Date: Fri, 28 Jul 2023 11:52:31 +0200
Message-Id: <cover.1690537375.git.geert@linux-m68k.org>
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

Changes compared to v2[1]:
  - Add Acked-by,
  - Add Wikipedia link,
  - Dropped "[RFC] drm_fourcc: Add DRM_FORMAT_C[124]", as these were
    added in commit 329eebcf32793361 ("drm_fourcc: sync drm_fourcc with
    latest drm-next kernel") in libdrm-2.4.115.

Changes compared to v1[2]:
  - SMPTE color LUT accuracy,
  - Factor out smpte color LUT,
  - Restructure patches,
  - Improve descriptions.
  - Store number of colors for indexed formats,
  - Add SMPTE pattern support for the C1 and C2 formats.

I have also opened a merge request at [3].

Thanks for your comments!

[1] https://lore.kernel.org/r/cover.1657302034.git.geert@linux-m68k.org/
[2] https://lore.kernel.org/r/cover.1646683737.git.geert@linux-m68k.org/
[3] https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/314

Geert Uytterhoeven (9):
  util: Improve SMPTE color LUT accuracy
  util: Factor out and optimize C8 SMPTE color LUT
  util: Add support for DRM_FORMAT_C[124]
  util: Store number of colors for indexed formats
  util: Add SMPTE pattern support for C4 format
  util: Add SMPTE pattern support for C1 format
  util: Add SMPTE pattern support for C2 format
  modetest: Add support for DRM_FORMAT_C[124]
  modetest: Add SMPTE pattern support for C4 format

 tests/modetest/buffers.c  |  15 ++
 tests/modetest/modetest.c |   9 +-
 tests/util/format.c       |   5 +-
 tests/util/format.h       |   1 +
 tests/util/pattern.c      | 416 ++++++++++++++++++++++++++++++++++----
 tests/util/pattern.h      |   2 +-
 6 files changed, 405 insertions(+), 43 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
