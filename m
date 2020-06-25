Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C89209DFF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 14:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BA06EBBC;
	Thu, 25 Jun 2020 12:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7586EB42
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 12:00:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41C9BAC85;
 Thu, 25 Jun 2020 12:00:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, sam@ravnborg.org,
 emil.l.velikov@gmail.com, noralf@tronnes.org, geert+renesas@glider.be,
 hdegoede@redhat.com
Subject: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and firmware
 fbs
Date: Thu, 25 Jun 2020 14:00:02 +0200
Message-Id: <20200625120011.16168-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds support for simple-framebuffer platform devices and
a handover mechanism for native drivers to take-over control of the
hardware.

The new driver, called simplekms, binds to a simple-frambuffer platform
device. The kernel's boot code creates such devices for firmware-provided
framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
loader sets up the framebuffers. Description via device tree is also an
option.

Simplekms is small enough to be linked into the kernel. The driver's main
purpose is to provide graphical output during the early phases of the boot
process, before the native DRM drivers are available. Native drivers are
typically loaded from an initrd ram disk. Occationally simplekms can also
serve as interim solution on graphics hardware without native DRM driver.

So far distributions rely on fbdev drivers, such as efifb, vesafb or
simplefb, for early-boot graphical output. However fbdev is deprecated and
the drivers do not provide DRM interfaces for modern userspace.

Patches 1 and 2 prepare the DRM format helpers for simplekms.

Patches 3 to 7 add the simplekms driver. It's build on simple DRM helpers
and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
pageflips, SHMEM buffers are copied into the framebuffer memory, similar
to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
regulators. It's based on the simplefb drivers, but has been modified for
DRM.

Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
framebuffer's I/O-memory range and provides a callback function to be
removed by a native driver. The native driver will remove simplekms before
taking over the hardware. The removal is integrated into existing helpers,
so drivers use it automatically.

I tested simplekms with x86 EFI and VESA framebuffers, which both work
reliably. The fbdev console and Weston work automatically. Xorg requires
manual configuration of the device. Xorgs current modesetting driver does
not work with both, platform and PCI device, for the same physical
hardware. Once configured, X11 works.

One cosmetical issue is that simplekms's device file is card0 and the
native driver's device file is card1. After simplekms has been kicked out,
only card1 is left. This does not seem to be a practical problem however.

TODO/IDEAS:

	* provide deferred takeover
	* provide bootsplash DRM client
	* make simplekms usable with ARM-EFI fbs

Thomas Zimmermann (9):
  drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
  drm/format-helper: Add blitter functions
  drm: Add simplekms driver
  drm/simplekms: Add fbdev emulation
  drm/simplekms: Initialize framebuffer data from device-tree node
  drm/simplekms: Acquire clocks from DT device node
  drm/simplekms: Acquire regulators from DT device node
  drm: Add infrastructure for platform devices
  drm/simplekms: Acquire memory aperture for framebuffer

 MAINTAINERS                            |   6 +
 drivers/gpu/drm/Kconfig                |   6 +
 drivers/gpu/drm/Makefile               |   1 +
 drivers/gpu/drm/drm_format_helper.c    |  96 ++-
 drivers/gpu/drm/drm_platform.c         | 118 ++++
 drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
 drivers/gpu/drm/tiny/Kconfig           |  17 +
 drivers/gpu/drm/tiny/Makefile          |   1 +
 drivers/gpu/drm/tiny/cirrus.c          |   2 +-
 drivers/gpu/drm/tiny/simplekms.c       | 906 +++++++++++++++++++++++++
 include/drm/drm_fb_helper.h            |  18 +-
 include/drm/drm_format_helper.h        |  10 +-
 include/drm/drm_platform.h             |  42 ++
 13 files changed, 1217 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_platform.c
 create mode 100644 drivers/gpu/drm/tiny/simplekms.c
 create mode 100644 include/drm/drm_platform.h

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
