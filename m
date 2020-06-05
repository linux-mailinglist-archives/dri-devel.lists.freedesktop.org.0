Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861FE1EF9BA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A9F6E8EC;
	Fri,  5 Jun 2020 13:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766F56E8EC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67E96AAD0;
 Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 00/14] drm/mgag200: Use managed interfaces for auto-cleanup
Date: Fri,  5 Jun 2020 15:57:49 +0200
Message-Id: <20200605135803.19811-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
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

This patchset cleans up mgag200 device initialization, embeds the
DRM device instance in struct mga_device and finally converts device
initialization to managed interfaces.

Patches 1 and 2 are actually unrelated. Both remove artifacts that got
lost from earlier patch series. We're fixing this before introducing new
changes.

Patches 3 to 7 cleanup the memory management code and convert it to
managed. Specifically, all MM code is being moved into a the same file.
That makes it more obvious what's going on and will allow for further
cleanups later on.

Modesetting is already cleaned up automatically, so there's nothing
to do here.

With modesetting and MM done, patches 8 to 14 convert the device
initialization to managed interfaces. The allocation is split among
several functions and we move it to the same place in patches 11 and
12. That is also a good opportunity to embed the DRM device instance
in struct mga_device in patch 13. Patch 14 adds managed release of the
device structure.

Tested on Matrox G200SE HW.

Thomas Zimmermann (14):
  drm/mgag200: Remove declaration of mgag200_mmap() from header file
  drm/mgag200: Remove mgag200_cursor.c
  drm/mgag200: Use pcim_enable_device()
  drm/mgag200: Rename mgag200_ttm.c to mgag200_mm.c
  drm/mgag200: Lookup VRAM PCI BAR start and length only once
  drm/mgag200: Merge VRAM setup into MM initialization
  drm/mgag200: Switch to managed MM
  drm/mgag200: Separate DRM and PCI functionality from each other
  drm/mgag200: Prefix global names in mgag200_drv.c with mgag200_
  drm/mgag200: Move device init and cleanup to mgag200_drv.c
  drm/mgag200: Separate device initialization into allocation
  drm/mgag200: Allocate device structures in mgag200_driver_load()
  drm/mgag200: Embed instance of struct drm_device in struct mga_device
  drm/mgag200: Use managed device initialization

 drivers/gpu/drm/mgag200/Makefile              |   3 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c      | 319 ------------------
 drivers/gpu/drm/mgag200/mgag200_drv.c         | 161 ++++++---
 drivers/gpu/drm/mgag200/mgag200_drv.h         |  11 +-
 drivers/gpu/drm/mgag200/mgag200_main.c        | 155 ---------
 .../mgag200/{mgag200_ttm.c => mgag200_mm.c}   |  99 ++++--
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  12 +-
 7 files changed, 195 insertions(+), 565 deletions(-)
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_main.c
 rename drivers/gpu/drm/mgag200/{mgag200_ttm.c => mgag200_mm.c} (51%)

--
2.26.2


Thomas Zimmermann (14):
  drm/mgag200: Remove declaration of mgag200_mmap() from header file
  drm/mgag200: Remove mgag200_cursor.c
  drm/mgag200: Use pcim_enable_device()
  drm/mgag200: Rename mgag200_ttm.c to mgag200_mm.c
  drm/mgag200: Lookup VRAM PCI BAR start and length only once
  drm/mgag200: Merge VRAM setup into MM initialization
  drm/mgag200: Switch to managed MM
  drm/mgag200: Separate DRM and PCI functionality from each other
  drm/mgag200: Prefix global names in mgag200_drv.c with mgag200_
  drm/mgag200: Move device init and cleanup to mgag200_drv.c
  drm/mgag200: Separate device initialization into allocation
  drm/mgag200: Allocate device structures in mgag200_driver_load()
  drm/mgag200: Embed instance of struct drm_device in struct mga_device
  drm/mgag200: Use managed device initialization

 drivers/gpu/drm/mgag200/Makefile              |   3 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c      | 319 ------------------
 drivers/gpu/drm/mgag200/mgag200_drv.c         | 161 ++++++---
 drivers/gpu/drm/mgag200/mgag200_drv.h         |  11 +-
 drivers/gpu/drm/mgag200/mgag200_main.c        | 155 ---------
 .../mgag200/{mgag200_ttm.c => mgag200_mm.c}   |  99 ++++--
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  12 +-
 7 files changed, 195 insertions(+), 565 deletions(-)
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_main.c
 rename drivers/gpu/drm/mgag200/{mgag200_ttm.c => mgag200_mm.c} (51%)

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
