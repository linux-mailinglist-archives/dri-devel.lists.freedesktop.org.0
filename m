Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F351BE105
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CDB6E0C6;
	Wed, 29 Apr 2020 14:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAC46E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 187A6ABCC;
 Wed, 29 Apr 2020 14:32:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
Date: Wed, 29 Apr 2020 16:32:21 +0200
Message-Id: <20200429143238.10115-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
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

This patchset converts mgag200 to atomic modesetting. It uses simple
KMS helpers and SHMEM.

Patches 1 to 4 simplifies the driver before the conversion. For example,
the HW cursor is not usable with the way universal planes work. A few
data structures can be cleaned up.

Patches 5 to 15 untangle the existing modesetting code into smaller
functions. Specifically, mode setting and plane updates are being
separated from each other.

Patch 16 converts mgag200 to simple KMS helpers and enables atomic
mode setting.

As some HW seems to require a framebuffer offset of 0 within the video
memory, it does not work with atomic modesetting. Atomically switching
plane framebuffers, requires either source or target buffer to be located
at a non-0 offet. To resolve this problem, patch 17 converts mgag200 from
VRAM helpers to SHMEM helpers. During plane updates, the content of the
SHMEM BO is memcpy'd to VRAM. From my subjective obersation, performance
is not nuch different from the original code.

The patchset has been tested on MGA G200EH hardware.

Thomas Zimmermann (17):
  drm/mgag200: Remove HW cursor
  drm/mgag200: Remove unused fields from struct mga_device
  drm/mgag200: Embed connector instance in struct mga_device
  drm/mgag200: Use managed mode-config initialization
  drm/mgag200: Clean up mga_set_start_address()
  drm/mgag200: Clean up mga_crtc_do_set_base()
  drm/mgag200: Move mode-setting code into separate helper function
  drm/mgag200: Split MISC register update into PLL selection, SYNC and
    I/O
  drm/mgag200: Update mode registers after plane registers
  drm/mgag200: Set pitch in a separate helper function
  drm/mgag200: Set primary plane's format in separate helper function
  drm/mgag200: Move TAGFIFO reset into separate function
  drm/mgag200: Move hiprilvl setting into separate functions
  drm/mgag200: Move register initialization into separate function
  drm/mgag200: Remove waiting from DPMS code
  drm/mgag200: Convert to simple KMS helper
  drm/mgag200: Replace VRAM helpers with SHMEM helpers

 drivers/gpu/drm/mgag200/Kconfig          |   4 +-
 drivers/gpu/drm/mgag200/Makefile         |   2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 319 --------
 drivers/gpu/drm/mgag200/mgag200_drv.c    |  51 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  43 +-
 drivers/gpu/drm/mgag200/mgag200_main.c   |  28 -
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 948 ++++++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_reg.h    |   5 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c    |  35 +-
 9 files changed, 563 insertions(+), 872 deletions(-)
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c

--
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
