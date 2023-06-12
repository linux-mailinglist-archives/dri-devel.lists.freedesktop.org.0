Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9CE72C73F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491AA10E24A;
	Mon, 12 Jun 2023 14:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3143510E07C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:13:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72AD420106;
 Mon, 12 Jun 2023 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686579234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z7dGpkXmZ1MfbxtagH80qGavP+RHSS66/+CwDajBR0s=;
 b=YI33JDQ10YAljTnA8Tctm63UXvDy8q7QV4VcwbX+gZXqgDXmENsqzNKdeVOGPwlliJ10WI
 EN3X/MDkvbED3690RIyC3XHJMacel7AscvvIwG9/Hny83VsY4CrWGWyE3rMK3W4NlI4jSZ
 f818aW0YUWJ8GTqeQHP+gGQuwKnFHeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686579234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z7dGpkXmZ1MfbxtagH80qGavP+RHSS66/+CwDajBR0s=;
 b=UkPvNcz/xVjq0OitTWLLLKr4FMAKi3L9V3wwhZGP60EY0+JsR7NEjWm5AgsmqN15+H3Osz
 ZhSSspNSd+M9SUDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D17A1357F;
 Mon, 12 Jun 2023 14:13:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Mh8cAiIoh2RwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:13:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v2 00/38] fbdev: Make userspace interfaces optional
Date: Mon, 12 Jun 2023 16:07:38 +0200
Message-ID: <20230612141352.29939-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the new config option FB_DEVICE. If enabled, fbdev provides
traditional userspace interfaces in devfs, sysfs and procfs, such
as /dev/fb0 or /proc/fb.

Modern Linux distrobutions have adopted DRM drivers for graphics
output and use fbdev only for the kernel's framebuffer console.
Userspace has also moved on, with no new fbdev code being written
and existing support being removed.

OTOH, fbdev provides userspace a way of accessing kernel or I/O
memory, which might compromise the system's security. See the recent
commit c8687694bb1f ("drm/fbdev-generic: prohibit potential
out-of-bounds access") for an example. Disabling fbdev userspace
interfaces is therefore a useful feature to limit unnecessary
exposure of fbdev code to processes of low privilegues.

Patches 1 to 31 fix various bugs and issues in fbdev-related code.
In most cases the code uses the fbdev device where it should use
the Linux hardware device or something else. Most of these patches
fix existing problems and should therefore be considered in any case.

Patches 32 to 37 refactor the fbdev core code. The patches move
support for backlights, sysfs, procfs and devfs into separate files
and hide it behind simple interfaces. These changes will allow to
easily build the userspace support conditionally.

Patch 38 introduces the config option FB_DEVICE and adapts the fbdev
core to support it. The field struct fb_info.dev is now optional,
hence the name of the config option.

Tested on simpledrm and i915, including the device handover.

Future directions: With the support for disabling fbdev userspace
interfaces in place, it will be possible to make most fbdev drivers'
file-I/O code in struct fb_ops optional as well. 

v2:
	* fix fsl-diu-fb and sh7760fb
	* split backlight patches
	* set 'default y' for FB_CONFIG
	* minor fixes and corrections

Thomas Zimmermann (38):
  backlight/bd6107: Compare against struct fb_info.device
  backlight/bd6107: Rename struct bd6107_platform_data.fbdev to 'dev'
  backlight/gpio_backlight: Compare against struct fb_info.device
  backlight/gpio_backlight: Rename field 'fbdev' to 'dev'
  backlight/lv5207lp: Compare against struct fb_info.device
  backlight/lv5207lp: Rename struct lv5207lp_platform_data.fbdev to
    'dev'
  fbdev/atyfb: Reorder backlight and framebuffer init/cleanup
  fbdev/atyfb: Use hardware device as backlight parent
  fbdev/aty128fb: Reorder backlight and framebuffer init/cleanup
  fbdev/aty128fb: Use hardware device as backlight parent
  fbdev/broadsheetfb: Call device_remove_file() with hardware device
  fbdev/ep93xx-fb: Alloc DMA memory from hardware device
  fbdev/ep93xx-fb: Output messages with fb_info() and fb_err()
  fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
  fbdev/fsl-diu-fb: Output messages with fb_*() helpers
  fbdev/mb862xxfb: Output messages with fb_dbg()
  fbdev/metronomefb: Use hardware device for dev_err()
  fbdev/nvidiafb: Reorder backlight and framebuffer init/cleanup
  fbdev/nvidiafb: Use hardware device as backlight parent
  fbdev/pxa168fb: Do not assign to struct fb_info.dev
  fbdev/radeonfb: Reorder backlight and framebuffer cleanup
  fbdev/radeonfb: Use hardware device as backlight parent
  fbdev/rivafb: Reorder backlight and framebuffer init/cleanup
  fbdev/rivafb: Use hardware device as backlight parent
  fbdev/sh7760fb: Use fb_dbg() in sh7760fb_get_color_info()
  fbdev/sh7760fb: Output messages with fb_dbg()
  fbdev/sh7760fb: Alloc DMA memory from hardware device
  fbdev/sh7760fb: Use hardware device with dev_() output during probe
  fbdev/sm501fb: Output message with fb_err()
  fbdev/smscufx: Detect registered fb_info from refcount
  fbdev/tdfxfb: Set i2c adapter parent to hardware device
  fbdev/core: Pass Linux device to pm_vt_switch_*() functions
  fbdev/core: Move framebuffer and backlight helpers into separate files
  fbdev/core: Add fb_device_{create,destroy}()
  fbdev/core: Move procfs code to separate file
  fbdev/core: Move file-I/O code into separate file
  fbdev/core: Rework fb init code
  fbdev: Make support for userspace interfaces configurable

 Documentation/gpu/todo.rst                   |  13 +
 arch/sh/boards/mach-ecovec24/setup.c         |   2 +-
 arch/sh/boards/mach-kfr2r09/setup.c          |   2 +-
 drivers/staging/fbtft/Kconfig                |   1 +
 drivers/video/backlight/bd6107.c             |   2 +-
 drivers/video/backlight/gpio_backlight.c     |   6 +-
 drivers/video/backlight/lv5207lp.c           |   2 +-
 drivers/video/fbdev/Kconfig                  |  13 +
 drivers/video/fbdev/aty/aty128fb.c           |  12 +-
 drivers/video/fbdev/aty/atyfb_base.c         |  18 +-
 drivers/video/fbdev/aty/radeon_backlight.c   |   2 +-
 drivers/video/fbdev/aty/radeon_base.c        |   3 +-
 drivers/video/fbdev/broadsheetfb.c           |   2 +-
 drivers/video/fbdev/core/Makefile            |   7 +-
 drivers/video/fbdev/core/fb_backlight.c      |  33 ++
 drivers/video/fbdev/core/fb_info.c           |  78 +++
 drivers/video/fbdev/core/fb_internal.h       |  67 +++
 drivers/video/fbdev/core/fb_procfs.c         |  62 ++
 drivers/video/fbdev/core/fbcon.c             |   1 +
 drivers/video/fbdev/core/fbmem.c             | 592 +------------------
 drivers/video/fbdev/core/fbsysfs.c           | 134 +----
 drivers/video/fbdev/ep93xx-fb.c              |  21 +-
 drivers/video/fbdev/fsl-diu-fb.c             |  26 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   |   9 +-
 drivers/video/fbdev/metronomefb.c            |   2 +-
 drivers/video/fbdev/nvidia/nv_backlight.c    |   2 +-
 drivers/video/fbdev/nvidia/nvidia.c          |   8 +-
 drivers/video/fbdev/omap2/omapfb/Kconfig     |   2 +-
 drivers/video/fbdev/pxa168fb.c               |   2 +-
 drivers/video/fbdev/riva/fbdev.c             |  10 +-
 drivers/video/fbdev/sh7760fb.c               |  50 +-
 drivers/video/fbdev/sm501fb.c                |   2 +-
 drivers/video/fbdev/smscufx.c                |   4 +-
 drivers/video/fbdev/tdfxfb.c                 |   4 +-
 include/linux/fb.h                           |   6 +-
 include/linux/platform_data/bd6107.h         |   2 +-
 include/linux/platform_data/gpio_backlight.h |   2 +-
 include/linux/platform_data/lv5207lp.h       |   2 +-
 38 files changed, 437 insertions(+), 769 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_backlight.c
 create mode 100644 drivers/video/fbdev/core/fb_info.c
 create mode 100644 drivers/video/fbdev/core/fb_internal.h
 create mode 100644 drivers/video/fbdev/core/fb_procfs.c


base-commit: 63a468ec7c7652afa80e3fa6ad203f9e64d04e83
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
prerequisite-patch-id: 7c401614cf55c033f742bced317575b9f5b77bb1
prerequisite-patch-id: d3145eae4b35a1290199af6ff6cd5abfebc82033
prerequisite-patch-id: 242b6bc45675f1f1a62572542d75c89d4864f15a
-- 
2.41.0

