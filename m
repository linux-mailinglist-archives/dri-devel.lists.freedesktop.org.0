Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76123D82D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 10:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE756E89B;
	Thu,  6 Aug 2020 08:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DC96E899
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 08:52:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F518ABE9;
 Thu,  6 Aug 2020 08:53:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, emil.l.velikov@gmail.com,
 lyude@redhat.com, noralf@tronnes.org, zou_wei@huawei.com
Subject: [RFC][PATCH v2 0/4] Support GEM object mappings from I/O memory
Date: Thu,  6 Aug 2020 10:52:35 +0200
Message-Id: <20200806085239.4606-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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

DRM's fbdev console uses regular load and store operations to update
framebuffer memory. The bochs driver on sparc64 requires the use of
I/O-specific load and store operations. We have a workaround, but need
a long-term solution to the problem. Previous attempts to resolve the
issue returned an extra is_iomem flag from vmap(), or added a separate
vmap_iomem() callback to GEM objects.

This patchset is yet another iteration with a different idea. Instead
of a raw pointer, vmap() interfaces now return a structure that contains
the buffer address in system or I/O memory, plus a flag that signals
which location the address is in.

Patch #1 updates the vboxvideo driver to match the latest VRAM helpers.
This simplifies the other patches and should be merged in any case.

Patch #2 adds struct drm_gem_membuf, which contains the pointer and flag,
and converts the generic GEM interfaces to use it.

Patch #3 converts vmap/vunmap in GEM object functions and updates most
GEM backends. A few drivers are still missing, but the patch should be
acceptable for an RFC.

Patch #4 changes fbdev helpers to access framebuffer memory either with
system or I/O memcpy functions.

Thomas Zimmermann (4):
  drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
  drm/gem: Update client API to use struct drm_gem_membuf
  drm/gem: Use struct drm_gem_membuf in vmap op and convert GEM backends
  drm/fb_helper: Access framebuffer as I/O memory, if required

 drivers/gpu/drm/ast/ast_cursor.c       |  29 ++-
 drivers/gpu/drm/ast/ast_drv.h          |   2 +-
 drivers/gpu/drm/bochs/bochs_kms.c      |   1 -
 drivers/gpu/drm/drm_client.c           |  25 ++-
 drivers/gpu/drm/drm_fb_helper.c        | 246 ++++++++++++++++++++++---
 drivers/gpu/drm/drm_gem.c              |  28 +--
 drivers/gpu/drm/drm_gem_cma_helper.c   |  15 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c |  31 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c  | 142 +++++---------
 drivers/gpu/drm/drm_internal.h         |   5 +-
 drivers/gpu/drm/drm_prime.c            |  16 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c |  11 +-
 drivers/gpu/drm/qxl/qxl_display.c      |  12 +-
 drivers/gpu/drm/qxl/qxl_draw.c         |  14 +-
 drivers/gpu/drm/qxl/qxl_drv.h          |   6 +-
 drivers/gpu/drm/qxl/qxl_object.c       |  19 +-
 drivers/gpu/drm/qxl/qxl_object.h       |   2 +-
 drivers/gpu/drm/qxl/qxl_prime.c        |  12 +-
 drivers/gpu/drm/tiny/cirrus.c          |  15 +-
 drivers/gpu/drm/tiny/gm12u320.c        |  12 +-
 drivers/gpu/drm/udl/udl_modeset.c      |  10 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c  |  17 +-
 include/drm/drm_client.h               |   7 +-
 include/drm/drm_device.h               |  26 +++
 include/drm/drm_gem.h                  |   5 +-
 include/drm/drm_gem_cma_helper.h       |   4 +-
 include/drm/drm_gem_shmem_helper.h     |   4 +-
 include/drm/drm_gem_vram_helper.h      |   9 +-
 include/drm/drm_mode_config.h          |  12 --
 29 files changed, 464 insertions(+), 273 deletions(-)

--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
