Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC301D4830
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979726EC16;
	Fri, 15 May 2020 08:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B04C6E402
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68E13AFEF;
 Fri, 15 May 2020 08:32:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 00/15] drm/mgag200: Convert to atomic modesetting
Date: Fri, 15 May 2020 10:32:18 +0200
Message-Id: <20200515083233.32036-1-tzimmermann@suse.de>
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

This patchset converts mgag200 to atomic modesetting. It uses simple
KMS helpers and SHMEM. I'm posting v3 mostly for reference. These patches
will land soon if no one objects.

Patch 1 removes cursor support. The HW cursor is not usable with the
way universal planes work.

Patches 2 to 11 untangle the existing modesetting code into smaller
functions. Specifically, mode setting and plane updates are being
separated from each other.

Patch 12 to 14 convert mgag200 to simple KMS helpers and enables atomic
mode setting.

Atomically switching plane framebuffers, requires either source or target
buffer to be located at a non-0 offet. As some HW revisions seem to require
a framebuffer offset of 0 within the video memory, they do not work with
atomic modesetting. To resolve this problem, patch 15 converts mgag200
from VRAM helpers to SHMEM helpers. During plane updates, the content of
the SHMEM BO is memcpy'd to VRAM. From my observation, performance is not
nuch different from the original code.

The patchset has been tested on MGA G200EH hardware.

v3:
	* update commit messages
	* remove unused defines
v2:
	* rebase patchset
	* replace uint{8,32}_t with u{8,32} through-out patchset
	* define additional register constants
	* use helper functions around bpp-shift computations
	* split conversion patch
	* keep busy-waiting in DPMS code
	* cleanups

Thomas Zimmermann (15):
  drm/mgag200: Remove HW cursor
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
  drm/mgag200: Remove out-commented suspend/resume helpers
  drm/mgag200: Use simple-display data structures
  drm/mgag200: Convert to simple KMS helper
  drm/mgag200: Replace VRAM helpers with SHMEM helpers

 drivers/gpu/drm/mgag200/Kconfig        |   4 +-
 drivers/gpu/drm/mgag200/Makefile       |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c  |  51 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  45 +-
 drivers/gpu/drm/mgag200/mgag200_main.c |   5 -
 drivers/gpu/drm/mgag200/mgag200_mode.c | 871 ++++++++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  11 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c  |  28 +-
 8 files changed, 528 insertions(+), 489 deletions(-)

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
