Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20956BEA2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B82910EBDA;
	Fri,  8 Jul 2022 18:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE9B10EBD0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:46 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siMm2700L4C55Sk06iMmkz; Fri, 08 Jul 2022 20:21:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-002fMA-Cx; Fri, 08 Jul 2022 20:21:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbp-00BtSF-Vs; Fri, 08 Jul 2022 20:21:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 00/10] Add support for low-color frame buffer formats
Date: Fri,  8 Jul 2022 20:21:30 +0200
Message-Id: <cover.1657302034.git.geert@linux-m68k.org>
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
work-in-progress Atari DRM driver.

Changes compared to v1:
  - SMPTE color LUT accuracy,
  - Factor out smpte color LUT,
  - Restructure patches,
  - Improve descriptions.
  - Store number of colors for indexed formats,
  - Add SMPTE pattern support for the C1 and C2 formats.

Please refer to [2] for related Linux DRM patches and background
information.

Thanks for your comments!

[1] "[PATCH libdrm 0/3] Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1646683737.git.geert@linux-m68k.org
[2] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org

Geert Uytterhoeven (10):
  util: Improve SMPTE color LUT accuracy
  util: Factor out and optimize C8 SMPTE color LUT
  [RFC] drm_fourcc: Add DRM_FORMAT_C[124]
  util: Add support for DRM_FORMAT_C[124]
  util: Store number of colors for indexed formats
  util: Add SMPTE pattern support for C4 format
  util: Add SMPTE pattern support for C1 format
  util: Add SMPTE pattern support for C2 format
  modetest: Add support for DRM_FORMAT_C[124]
  modetest: Add SMPTE pattern support for C4 format

 include/drm/drm_fourcc.h  |   5 +-
 tests/modetest/buffers.c  |  15 ++
 tests/modetest/modetest.c |   9 +-
 tests/util/format.c       |   5 +-
 tests/util/format.h       |   1 +
 tests/util/pattern.c      | 416 ++++++++++++++++++++++++++++++++++----
 tests/util/pattern.h      |   2 +-
 7 files changed, 409 insertions(+), 44 deletions(-)

-- 
2.25.1

