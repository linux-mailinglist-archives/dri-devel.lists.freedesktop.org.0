Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58131CD53
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 16:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C8B89DB8;
	Tue, 16 Feb 2021 15:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E719789CD9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 15:57:26 +0000 (UTC)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
 by hillosipuli.retiisi.eu (Postfix) with ESMTP id 288D3634CBF;
 Tue, 16 Feb 2021 17:56:20 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 0/4] Add %p4cc printk modifier for V4L2 and DRM fourcc codes
Date: Tue, 16 Feb 2021 17:57:19 +0200
Message-Id: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 laurent.pinchart@ideasonboard.com, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

	On merging --- it would seem everyone is happy with merging this
	through the drm-misc tree. The last patch should wait until all
	users are gone for sure, probably to the next kernel release.
	There are no users of drm_get_format_name() in linux-next
	currently after the 3rd patch.

This set adds support for %p4cc printk modifier for printing V4L2 and DRM
fourcc codes. The codes are cumbersome to print manually and by adding the
modifier, this task is saved from the V4L2 and DRM frameworks as well as
related drivers. DRM actually had it handled in a way (see 3rd patch) but
the printk modifier makes printing the format easier even there. On V4L2
side it saves quite a few lines of repeating different implementations of
printing the 4cc codes.

Further work will include converting the V4L2 drivers doing the same. I
left these out from this version since individual drivers are easier
changed without dealing with multiple trees.

Since v8:

- Reduce ternary conditionals in intel_plane_uapi_info().

- Wrap a long line in intel_plane_hw_info().

Since v7:

- Add more examples, one with big endian and another with a space.

- Add Y10 test format.

- Use "0123" in the size string for temporary buffer.

- Added acks.

- Split the 3rd patch into two: driver changes and removal of
  drm_get_format_name().

Since v6:

- Don't drop spaces in fourcc codes.

- Print unprintable characters as dot ('.') instead of hexadecimal number
  in parentheses.

- Convert DRM from drm_get_format_name() to %p4cc. I wonder if this should
  be merged through the DRM tree, albeit it's probably unlikely to
  conflict with other changes. Further use of the function could be a
  problem.

- Make tests more realistic.

Since v5:

- Added V4L2 core conversion to %p4cc, as well as change the DRM
  fourcc printing function to use %p4cc.

- Add missing checkpatch.pl checks for %p4cc modifier.

Sakari Ailus (4):
  lib/vsprintf: Add support for printing V4L2 and DRM fourccs
  v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
  drm: Switch to %p4cc format modifier
  drm: Remove drm_get_format_name()

 Documentation/core-api/printk-formats.rst     | 18 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +-
 .../arm/display/komeda/komeda_format_caps.h   | 11 ---
 .../arm/display/komeda/komeda_framebuffer.c   |  4 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  7 +-
 drivers/gpu/drm/drm_atomic.c                  |  8 +-
 drivers/gpu/drm/drm_crtc.c                    |  7 +-
 drivers/gpu/drm/drm_fourcc.c                  | 25 ------
 drivers/gpu/drm/drm_framebuffer.c             | 11 +--
 drivers/gpu/drm/drm_mipi_dbi.c                |  5 +-
 drivers/gpu/drm/drm_plane.c                   |  8 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 14 +--
 .../drm/i915/display/intel_display_debugfs.c  | 19 ++---
 drivers/gpu/drm/i915/display/intel_sprite.c   |  6 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +--
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 ++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 85 +++++--------------
 include/drm/drm_fourcc.h                      |  1 -
 lib/test_printf.c                             | 18 ++++
 lib/vsprintf.c                                | 39 +++++++++
 scripts/checkpatch.pl                         |  6 +-
 32 files changed, 164 insertions(+), 223 deletions(-)

-- 
2.29.2

*** BLURB HERE ***

Sakari Ailus (4):
  lib/vsprintf: Add support for printing V4L2 and DRM fourccs
  v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
  drm: Switch to %p4cc format modifier
  drm: Remove drm_get_format_name()

 Documentation/core-api/printk-formats.rst     | 18 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +-
 .../arm/display/komeda/komeda_format_caps.h   | 11 ---
 .../arm/display/komeda/komeda_framebuffer.c   |  4 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  7 +-
 drivers/gpu/drm/drm_atomic.c                  |  8 +-
 drivers/gpu/drm/drm_crtc.c                    |  7 +-
 drivers/gpu/drm/drm_fourcc.c                  | 25 ------
 drivers/gpu/drm/drm_framebuffer.c             | 11 +--
 drivers/gpu/drm/drm_mipi_dbi.c                |  5 +-
 drivers/gpu/drm/drm_plane.c                   |  8 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 14 +--
 .../drm/i915/display/intel_display_debugfs.c  | 30 +++----
 drivers/gpu/drm/i915/display/intel_sprite.c   |  6 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +--
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 ++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 85 +++++--------------
 include/drm/drm_fourcc.h                      |  1 -
 lib/test_printf.c                             | 18 ++++
 lib/vsprintf.c                                | 39 +++++++++
 scripts/checkpatch.pl                         |  6 +-
 32 files changed, 169 insertions(+), 229 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
