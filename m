Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D122E70F257
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756EB10E5F2;
	Wed, 24 May 2023 09:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88D10E5C7;
 Wed, 24 May 2023 09:21:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0A1D22490;
 Wed, 24 May 2023 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684920113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kgjLMqrLBzhR2hNsQlia0YYpadV31biLJMb7B+8R+hM=;
 b=lh+cG2oyDJgKUGRrfCbMMcYIllL37HTBGeZ8PbecQuT0gAF0K1SZt3WMKI3l6fwsllCIxg
 h/Zue4dS8D8B1oSorFDEoQmpOm/5jAOxckulu52T9//fEelOFHDFwfOr3SbBGxvaNBrqx5
 Yt41Sspnahc2x4ke8fRWr0ulP1wSirA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684920113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kgjLMqrLBzhR2hNsQlia0YYpadV31biLJMb7B+8R+hM=;
 b=4q46w3w0JlfgjmM9ar69b00LchDBlqnbkZSCXY8+fKyKsBovCWKZ6KPO1Cb1UgIqgSMjqo
 jhQDZNlNty/XynCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E41913425;
 Wed, 24 May 2023 09:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /gwvFjHXbWTHewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 09:21:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Subject: [PATCH v4 00/13] drm/fbdev: Remove DRM's helpers for fbdev I/O
Date: Wed, 24 May 2023 11:21:37 +0200
Message-Id: <20230524092150.11776-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM provides a number of wrappers around fbdev cfb_() sys_(), fb_io_()
and fb_sys_() helpers. The DRM functions don't provide any additional
functionality for most DRM drivers. So remove them and call the fbdev
I/O helpers directly.

The DRM fbdev I/O wrappers were originally added because <linux/fb.h>
does not protect its content with CONFIG_FB. DRM fbdev emulation did
not build if the config option had been disabled. This has been
fixed. For fbdev-generic and i915, the wrappers added support for damage
handling. But this is better handled within the two callers, as each
is special in its damage handling.

Patch 1 adds several internal Kconfig options that DRM drivers (and
possibly other fbdev code) will use to select the correct set of I/O
helpers. Patch 2 adds initializers for struct fb_ops and generator
macros for the callback functions. These macros will simplify drivers.
This patchset applies the new options and macros to DRM fbdev emulation,
but regular fbdev drivers can use them as well.

Patches 3 to 10 replace the DRM wrappers in a number of fbdev emulations.
Patch 10 exports two helpers for damage handling. Patches 12 and 13
update fbdev-generic and i915 with the help of the exported functions.
The patches also remove DRM's fbdev I/O helpers, which are now unused.

DRM's fbdev helpers had to select fbdev I/O helpers for I/O and for
system memory. Each fbdev emulation now selects the correct helpers
for itself. Depending on the selected DRM drivers, kernel builds will
now only contain the necessary fbdev I/O helpers and might be slightly
smaller in size.

v4:
	* use initializer and generator macros for struct fb_ops
	* partially support damage handling in msm (Dmitri)
v3:
	* fix Kconfig options (Jingfeng)
	* minimize changes to exynos (Sam)
v2:
	* simplify Kconfig handling (Sam)

Thomas Zimmermann (13):
  fbdev: Add Kconfig options to select different fb_ops helpers
  fbdev: Add initializer macros for struct fb_ops
  drm/armada: Use regular fbdev I/O helpers
  drm/exynos: Use regular fbdev I/O helpers
  drm/gma500: Use regular fbdev I/O helpers
  drm/radeon: Use regular fbdev I/O helpers
  drm/fbdev-dma: Use regular fbdev I/O helpers
  drm/msm: Use regular fbdev I/O helpers
  drm/omapdrm: Use regular fbdev I/O helpers
  drm/tegra: Use regular fbdev I/O helpers
  drm/fb-helper: Export helpers for marking damage areas
  drm/fbdev-generic: Implement dedicated fbdev I/O helpers
  drm/i915: Implement dedicated fbdev I/O helpers

 drivers/gpu/drm/Kconfig                    |  10 +-
 drivers/gpu/drm/armada/Kconfig             |   1 +
 drivers/gpu/drm/armada/armada_fbdev.c      |   7 +-
 drivers/gpu/drm/drm_fb_helper.c            | 236 ++-------------------
 drivers/gpu/drm/drm_fbdev_dma.c            |  11 +-
 drivers/gpu/drm/drm_fbdev_generic.c        |  11 +-
 drivers/gpu/drm/exynos/Kconfig             |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |   9 +-
 drivers/gpu/drm/gma500/Kconfig             |   1 +
 drivers/gpu/drm/gma500/fbdev.c             |   8 +-
 drivers/gpu/drm/i915/Kconfig               |   1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c |  14 +-
 drivers/gpu/drm/msm/Kconfig                |   1 +
 drivers/gpu/drm/msm/msm_fbdev.c            |  17 +-
 drivers/gpu/drm/omapdrm/Kconfig            |   1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  11 +-
 drivers/gpu/drm/radeon/Kconfig             |   1 +
 drivers/gpu/drm/radeon/radeon_fbdev.c      |   9 +-
 drivers/gpu/drm/tegra/Kconfig              |   1 +
 drivers/gpu/drm/tegra/fbdev.c              |   8 +-
 drivers/video/fbdev/Kconfig                |  21 ++
 include/drm/drm_fb_helper.h                |  83 +-------
 include/linux/fb.h                         | 112 ++++++++++
 23 files changed, 212 insertions(+), 363 deletions(-)


base-commit: 216281f91018b24567e59ae46ce7e96fb92063cf
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
prerequisite-patch-id: 8bff2b12862e44027a25837ea7510f633d40839e
prerequisite-patch-id: 97ac107455aff4e0ec039d166ecdd2430d20f22e
-- 
2.40.1

