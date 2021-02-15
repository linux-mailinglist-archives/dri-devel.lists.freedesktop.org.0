Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A432631B826
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 12:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACA76E10C;
	Mon, 15 Feb 2021 11:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu
 [IPv6:2a01:4f9:c010:4572::81:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE006E160
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 11:40:34 +0000 (UTC)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
 by hillosipuli.retiisi.eu (Postfix) with ESMTP id 270F5634C98;
 Mon, 15 Feb 2021 13:39:32 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] Add %p4cc printk modifier for V4L2 and DRM fourcc codes
Date: Mon, 15 Feb 2021 13:40:27 +0200
Message-Id: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This set adds support for %p4cc printk modifier for printing V4L2 and DRM
fourcc codes. The codes are cumbersome to print manually and by adding the
modifier, this task is saved from the V4L2 and DRM frameworks as well as
related drivers. DRM actually had it handled in a way (see 3rd patch) but
the printk modifier makes printing the format easier even there. On V4L2
side it saves quite a few lines of repeating different implementations of
printing the 4cc codes.

Further work will include converting the V4L2 drivers doing the same, as
well as converting DRM drivers from drm_get_format_name() to plain %p4cc.
I left these out from this version since individual drivers are easier
changed without dealing with multiple trees.

If DRM folks would prefer to convert drivers to %p4cc directly instead I
have no problem dropping the 3rd patch. Nearly all uses in DRM are in
printk family of functions that can readily use %p4cc instead of the
current arrangement that relies on caller-allocated temporary buffer.

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

Sakari Ailus (3):
  lib/vsprintf: Add support for printing V4L2 and DRM fourccs
  v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
  drm: Switch to %p4cc format modifier

 Documentation/core-api/printk-formats.rst     | 16 ++++
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
 lib/test_printf.c                             | 17 ++++
 lib/vsprintf.c                                | 39 +++++++++
 scripts/checkpatch.pl                         |  6 +-
 32 files changed, 161 insertions(+), 223 deletions(-)

-- 
2.29.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
