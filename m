Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E1233057
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 12:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB4E6E43A;
	Thu, 30 Jul 2020 10:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DA56E43A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 10:28:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20CB4ABE2;
 Thu, 30 Jul 2020 10:29:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, lyude@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, krzk@kernel.org, john.p.donnelly@Oracle.com,
 rong.a.chen@intel.com, kraxel@redhat.com, eich@suse.com, tiwai@suse.de
Subject: [PATCH v2 0/8] drm/mgag200: Support desktop chips
Date: Thu, 30 Jul 2020 12:28:36 +0200
Message-Id: <20200730102844.10995-1-tzimmermann@suse.de>
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

This patchset puts device initialization in the correct order and
adds support for G200 Desktop chips (PCI ids 0x520 and 0x521).

The patchset has already been reviewed. In v2 I changed the patch 8
to copy the BIOS ROM to system memory, which simplifies parsing.

The first 7 patches prepare the driver. Desktop chips would probably
work without them, but since we're at it we can also do it right.

Patch 1 enables cached page mappings GEM buffers. SHMEM supports
this well now and the MGA device does not access the buffer memory
directly. So no corrupt display output is to be expected.

Patches 2 to 6 fix the initialization of device registers. Several
fundamental registers were only set late during device initialization.
This was probably not a problem in practice, as the VGA BIOS does the
setup during POST anyway. These patches move the code to the beginning
of the device initialization. If we ever have to POST an MGA device from
the driver, the correct order of operations will matter.

G200SEs store a unique id in the device structure. Patch 7 moves the
value to model-specific data area. This will be helpful for patch 8.

Patch 8 adds support for desktop chips' PCI ids. All the memory and
modesetting code continues to work as before. The PLL setup code gets
an additional helper for the new HW. PCI and DAC registers get a few
new default values. Most significantly, the driver parses the VGA BIOS
for clock settings. It's all separate from the server code, so no
regressions are to be expected. The new HW support is based on an
earlier patch the was posted in July 2017. [1]

Tested on G200EW and G200 AGP hardware by running the fbdev console,
Weston and Gnome on Xorg.

v2:
       	* copy BIOS ROM to system memory; access with load/store
	* fix typos

[1] https://lists.freedesktop.org/archives/dri-devel/2017-July/147647.html

Thomas Zimmermann (8):
  drm/mgag200: Enable caching for SHMEM pages
  drm/mgag200: Move register initialization into helper function
  drm/mgag200: Initialize PCI registers early during device setup
  drm/mgag200: Enable MGA mode during device register initialization
  drm/mgag200: Set MISC memory flags in mm init code
  drm/mgag200: Clear <page> field during MM init
  drm/mgag200: Move G200SE's unique id into model-specific data
  drm/mgag200: Add support for G200 desktop cards

 MAINTAINERS                            |   2 +-
 drivers/gpu/drm/mgag200/Kconfig        |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 225 +++++++++++++++++++++++--
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 ++-
 drivers/gpu/drm/mgag200/mgag200_mm.c   |   8 +
 drivers/gpu/drm/mgag200/mgag200_mode.c | 153 ++++++++++-------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |   4 +
 7 files changed, 340 insertions(+), 83 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
