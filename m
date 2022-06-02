Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD5653BBB6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBCD112FDF;
	Thu,  2 Jun 2022 15:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAC4112FDF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:42:57 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id CB838335E45;
 Thu,  2 Jun 2022 16:42:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1654184575; bh=Ruc3ND0Kw01OSDTutmhd27nHaODmnRLbuYnZZEpO69E=;
 h=From:To:Cc:Subject:Date:From;
 b=gSr7vJJkJtT0SloR7lY3B/r26Cy+TyByd20s8vTQwV/KBUXqDCxQa092g0Ea7NW4g
 lp8APHSbAUVvkpibR573gBmELRbumNvqul0TAMKM174sbZRdQskxi1qSJ4g6h+FU4f
 SL06wnYc0BBC2jncSdINwuIc8QERac+S2x/bdWNkuyr0EAf0MsCbWyZHuq0RMFTDTO
 YDqswZnXFA9uQW4YfWuNQptDRA7o7OvSMKCFfebJc0hLjIlaAezxU/niGbar5HZPYo
 YrhvhTD6HHkZN5Xd5HiSkEQgd2muZW2n++CUZ6Wk0JI+WGyghc7CjhL30u4xBmk8Z+
 Q4XdlL2RZ1i4Q==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Date: Thu,  2 Jun 2022 11:42:37 -0400
Message-Id: <20220602154243.1015688-1-zack@kde.org>
X-Mailer: git-send-email 2.34.1
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 mombasawalam@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Support for setting mouse cursor hotspot never made the transition from
the legacy kms to atomic. This left virtualized drivers, all which
are atomic, in a weird spot because all userspace compositors put
those drivers on deny-lists for atomic kms due to the fact that mouse
clicks were incorrectly routed, e.g:
https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/meta-kms-impl-device-atomic.c#L1188
https://invent.kde.org/plasma/kwin/-/blob/master/src/backends/drm/drm_gpu.cpp#L156

So even though all the virtualized drm drivers are atomic, none of them
could be used with atomic kms because of the missing mouse cursor hotspot
support.

The first change adds support for mouse cursor hotspots to drm core atomic
via the HOTSPOT_X and HOTSPOT_Y properties and implements it in the
legacy paths. The next few changes add support for the mouse hotspot
properties to all the drivers which required hotspots. And the final
change removes the legacy hotspot code because it's unused.

A sample mutter patch which makes gnome-shell work with all the
virtualized drivers with atomic kms is here:
https://gitlab.gnome.org/zackr/mutter/-/commit/2aa61b50507a24f34d514fa65b7bcf07e910f459
I'll have a similar patch for kwin.

This gets virtualized drivers working correctly with atomic kms, but the
hotspot codepaths aren't fool proof, e.g.:
- there's no way of currently validating that the drm drivers actually
did anything with the information and no way of testing it via igt,
- all userspace code needs to hardcore a list of drivers which require
hotspots because there's no way to query from drm "does this driver
require hotspot"

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>

Zack Rusin (6):
  drm/atomic: Add support for mouse hotspots
  drm/vmwgfx: Create mouse hotspot properties on cursor planes
  drm/qxl: Create mouse hotspot properties on cursor planes
  drm/vboxvideo: Create mouse hotspot properties on cursor planes
  drm/virtio: Create mouse hotspot properties on cursor planes
  drm: Remove legacy cursor hotspot code

 drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++++
 drivers/gpu/drm/drm_plane.c               | 44 +++++++++++++++++++++--
 drivers/gpu/drm/qxl/qxl_display.c         | 13 +++----
 drivers/gpu/drm/vboxvideo/vbox_mode.c     |  5 +--
 drivers/gpu/drm/virtio/virtgpu_display.c  |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c    |  8 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c       | 11 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c       |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c      |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c      |  2 ++
 include/drm/drm_framebuffer.h             | 12 -------
 include/drm/drm_plane.h                   | 15 ++++++++
 13 files changed, 113 insertions(+), 35 deletions(-)

-- 
2.34.1

