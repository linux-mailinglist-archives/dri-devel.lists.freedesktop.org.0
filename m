Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316224D08E3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF3010E23A;
	Mon,  7 Mar 2022 20:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7468E10E235
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:32 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by laurent.telenet-ops.be with bizsmtp
 id 3YtW270081Yj8bA01YtW0V; Mon, 07 Mar 2022 21:53:30 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM9-0036SQ-2H; Mon, 07 Mar 2022 21:53:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM8-0034mE-JA; Mon, 07 Mar 2022 21:53:24 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 0/3] Add support for low-color frame buffer formats
Date: Mon,  7 Mar 2022 21:53:15 +0100
Message-Id: <cover.1646683737.git.geert@linux-m68k.org>
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

A long outstanding issue with the DRM subsystem has been the lack of
support for low-color displays, as used typically on older desktop
systems, and on small embedded displays.

This patch series adds support for color-indexed frame buffer formats
with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
work-in-progress Atari DRM driver supporting 2, 4, 16, and 256 colors.

Overview:
  - Patch 1 optimizes the C8 SMPTE color LUT, for reuse with formats
    providing less colors,
  - Patch 2 introduces the new C[124] formats,
  - Patch 3 adds SMPTE pattern support for the C4 format.

Note that so far there is no specific pattern support for the C1 and C2
formats.

Please refer to [1] for more information.

Thanks for your comments!

[1] "[PATCH v2 00/10] drm: Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1646683502.git.geert@linux-m68k.org

Geert Uytterhoeven (3):
  util: Optimize C8 SMPTE color LUT
  drm_fourcc: Add DRM_FORMAT_C[124]
  util: Add SMPTE pattern support for C4 format

 include/drm/drm_fourcc.h  |  5 ++-
 tests/modetest/buffers.c  | 15 +++++++
 tests/modetest/modetest.c | 13 ++++--
 tests/util/format.c       |  3 ++
 tests/util/pattern.c      | 93 +++++++++++++++++++++++++++++----------
 tests/util/pattern.h      |  2 +-
 6 files changed, 101 insertions(+), 30 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
