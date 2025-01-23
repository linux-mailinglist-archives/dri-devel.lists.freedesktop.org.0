Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9509A1A7F2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 17:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3463410E882;
	Thu, 23 Jan 2025 16:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ll9sBj50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2421510E882
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 16:36:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E8F41A40ECD;
 Thu, 23 Jan 2025 16:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9274EC4CED3;
 Thu, 23 Jan 2025 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737650182;
 bh=BmaC/9qjSSFndeU5m4xN9uF9+Xs0FMsPpR2NDKgxvGU=;
 h=Date:From:To:Subject:From;
 b=Ll9sBj50C3HME3Gu9su6uoNaCtWK9GDmLnPMmOStb2gCnt/mg3alCNlzFn/geTuwA
 nrsK/hp9N0UsPGfZRFUtHZJ0BBzwgLpZcf+p5cKIiMcS2tWEjoncyAsKF8QKPKs1Ao
 EfUzrgw9KQtTYd1/EbaH910ywv2jKATLeJBCcWcc6YW4IUjmxYhuTbHDEjMXxRj4ii
 FlOX8MhXawiu6Ht6bysAXRD9RqebNOYZTUtceAsBWGWiWXUIViZXbgGelJH+YrI1sB
 SNAtipgn/auAE4/PNUJGt+Lh3XtiHDk5BAXcFKzKivJme+WJTT/kMFJngwk58698oX
 U8oUs9wAfa/Rw==
Date: Thu, 23 Jan 2025 17:36:17 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.14-rc1
Message-ID: <Z5JwASMQjjTjEncJ@carbonx1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
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

Hi Linus,

please pull three fixes and 9 cleanup patches for fbdev for this merge window.

This series prevents a possible crash and one memory leak in omapfb
and fixes possible misbehaviour in vga16fb.

Thanks,
Helge

----------------------------------------------------------------
The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.14-rc1

for you to fetch changes up to d08e78362a5f5e156b6a1dae90c28ed48c0a8357:

  fbdev: lcdcfb: Use backlight helper (2025-01-21 14:16:39 +0100)

----------------------------------------------------------------
fbdev fixes and updates for 6.14-rc1:

Fixes:
- omap: use threaded IRQ for LCD DMA
- omapfb: Fix an OF node leak in dss_of_port_get_parent_device()
- vga16fb: fix orig_video_isVGA confusion

Updates & cleanups:
- hdmi: Remove unused hdmi_infoframe_check
- omapfb: Remove unused hdmi5_core_handle_irqs
- omapfb: Use of_property_present() to test existence of DT property
- omapfb: Use syscon_regmap_lookup_by_phandle_args
- efifb: Change the return value type to void
- lcdcfb: Use backlight helper
- udlfb: Use const 'struct bin_attribute' callback
- radeon: Use const 'struct bin_attribute' callbacks
- sm501fb: Use str_enabled_disabled() helper in sm501fb_init_fb()

----------------------------------------------------------------
Aaro Koskinen (1):
      fbdev: omap: use threaded IRQ for LCD DMA

Dr. David Alan Gilbert (2):
      video: hdmi: Remove unused hdmi_infoframe_check
      fbdev: omapfb: Remove unused hdmi5_core_handle_irqs

Joe Hattori (1):
      fbdev: omapfb: Fix an OF node leak in dss_of_port_get_parent_device()

Krzysztof Kozlowski (2):
      fbdev: omapfb: Use of_property_present() to test existence of DT property
      fbdev: omapfb: Use syscon_regmap_lookup_by_phandle_args

Shixiong Ou (2):
      fbdev: efifb: Change the return value type to void
      fbdev: lcdcfb: Use backlight helper

Thomas Weiﬂschuh (2):
      fbdev: udlfb: Use const 'struct bin_attribute' callback
      fbdev: radeon: Use const 'struct bin_attribute' callbacks

Thorsten Blum (1):
      fbdev: sm501fb: Use str_enabled_disabled() helper in sm501fb_init_fb()

Zsolt Kajtar (1):
      fbdev: vga16fb: fix orig_video_isVGA confusion

 drivers/video/fbdev/aty/radeon_base.c             |  8 +++----
 drivers/video/fbdev/efifb.c                       |  4 +---
 drivers/video/fbdev/omap/lcd_dma.c                |  4 ++--
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c      | 11 +++------
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c     |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 17 --------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h |  1 -
 drivers/video/fbdev/sh_mobile_lcdcfb.c            |  6 +----
 drivers/video/fbdev/sm501fb.c                     |  5 ++--
 drivers/video/fbdev/udlfb.c                       |  8 +++----
 drivers/video/fbdev/vga16fb.c                     |  7 +++---
 drivers/video/hdmi.c                              | 28 -----------------------
 include/linux/hdmi.h                              |  1 -
 13 files changed, 23 insertions(+), 78 deletions(-)
