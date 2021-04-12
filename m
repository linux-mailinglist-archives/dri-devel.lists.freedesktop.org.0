Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4D35BE80
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EE589CBE;
	Mon, 12 Apr 2021 09:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7531789C99
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:00:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 133B3B15B;
 Mon, 12 Apr 2021 09:00:25 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH 0/3] drm: Add aperture helpers
Date: Mon, 12 Apr 2021 11:00:18 +0200
Message-Id: <20210412090021.23054-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds helpers for maintaining aperture ownership. Currently wraps
the infrastructure around fbdev's remove_conflicting_framebuffers().

For adding generic drivers to DRM, we need a hand-over mechanism
that unloads the generic driver before loading the hardware's native
driver. So far, this was supported for generic fbdev drivers, but
not for DRM drivers.

As a first step, this patchset provides a DRM interface to release
ownership of a framebuffer aperture. When called, all generic drivers
for framebuffers in the range are being unloaded. At this point
the functions wrap similar fbdev functionality. The old fbdev-based
interface is being inlined into the new functionsa and drivers are
converted.

The patchset is based on patches 3 and 4 of [1]. I incorporated the
review comments and kept the acked-bys.

All converted drivers have been built at least once on either x86-64,
aarch64 or arm.

[1] https://lore.kernel.org/dri-devel/20210318102921.21536-1-tzimmermann@suse.de/

Thomas Zimmermann (3):
  drm/aperture: Add infrastructure for aperture ownership
  drm/aperture: Convert drivers to aperture interfaces
  drm/aperture: Inline fbdev conflict helpers into aperture helpers

 Documentation/gpu/drm-internals.rst           |  12 ++
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   3 +-
 drivers/gpu/drm/armada/armada_drv.c           |   5 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  23 ++-
 drivers/gpu/drm/bochs/bochs_drv.c             |   3 +-
 drivers/gpu/drm/drm_aperture.c                | 131 ++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   4 +-
 drivers/gpu/drm/i915/i915_drv.c               |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |  27 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   5 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |   5 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   3 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   5 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |   3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   5 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   3 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   5 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   4 +-
 include/drm/drm_aperture.h                    |  31 +++++
 include/drm/drm_fb_helper.h                   |  51 -------
 24 files changed, 242 insertions(+), 108 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_aperture.c
 create mode 100644 include/drm/drm_aperture.h

--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
