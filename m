Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA522100A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 16:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4846EA92;
	Wed, 15 Jul 2020 14:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A876E098
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:59:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A88B8AB89;
 Wed, 15 Jul 2020 14:59:11 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, lyude@redhat.com, krzk@kernel.org,
 john.p.donnelly@Oracle.com, rong.a.chen@intel.com, kraxel@redhat.com,
 eich@suse.com, tiwai@suse.de
Subject: [PATCH 0/8] drm/mgag200: Support desktop chips
Date: Wed, 15 Jul 2020 16:58:54 +0200
Message-Id: <20200715145902.13122-1-tzimmermann@suse.de>
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

The first 7 patches prepare the driver. Desktop chips would probably
work without them, but since we're at it we can also do it right.

Patch 1 enables cached page mappings GEM buffers. SHMEM supports
this well now and the MGA device does not access the buffer memory
directly. So now corrupt display output is to be expected.

Patches 2 to 6 fix the initialization of device registers. Several
fundamental registers were only done late during device initialization.
This was probably not a problem in practice, as the VGA BIOS does the
setup iduring POST anyway. These patches move the code to the beginning
of the device initialization. If we ever have to POST a MGA device from
the driver, the corect order of operations counts.

G200SEs store a unique id in the device structure. Patch 7 moves the
value to model-specific data area. This will be helpful for patch 8.

Patch 8 adds support for desktop chips' PCI ids. all the memory and
modesetting code continues to work as before. The PLL setup code gets
an additional helper for the new HW. PCI and DAC regsiters get a few
new default values. Most significantly, the driver parses the VGA BIOS
for clock settings. It's all separate from the server code, so no
regressions are to be expected.

The new HW support is based on an earlier patch the was posted in July
2017. [1]

Tested on G200EW and G200 AGP hardware by running the fbdev console,
Weston and Gnome on Xorg.

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
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 213 +++++++++++++++++++++++--
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 ++-
 drivers/gpu/drm/mgag200/mgag200_mm.c   |   8 +
 drivers/gpu/drm/mgag200/mgag200_mode.c | 153 +++++++++++-------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |   4 +
 7 files changed, 328 insertions(+), 83 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
