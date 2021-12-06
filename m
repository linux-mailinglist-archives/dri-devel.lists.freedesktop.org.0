Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1292746A2BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2762873A6F;
	Mon,  6 Dec 2021 17:26:36 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC4A73A3E
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:34 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id DEDB829F497;
 Mon,  6 Dec 2021 17:26:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811593; bh=zHcc8RvkJZfR/IDVH7MVCKD1e9MlE9qnKfICmZMZHoc=;
 h=From:To:Cc:Subject:Date:From;
 b=Hm+Gn/LdqdZpX2F6fhX5xZzrn3UlMzHtb48FJ6ljk3EfQgvslN0R6XUwCZF9FFqRm
 xOm3enPsIOx1zl0nlNzqGlv5G9Xb7ROwZaMBNP32PBlJt9G/0HY5czueYF0FzLd9n9
 wgZXjeQYCbM3As/yNvA/bJARMh08ERPVHABSHrXAzYso0fPPupGvE9p3TO71BZenIP
 JBzHAyT68w9C9tgq8nIHpPCqB8weTfo5ekRnHhRP5Myjnb4FsR7ByXQj9WlbcNzw9f
 BhUBsplPoqvuSiKZ6GmmwYUpiS19r6CZJstXUAMTsrY6k6NXV68YGH06UXcB9kmD73
 znzeXdCWY03LQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 00/12] Implement DRIVER_GEM and GL 4.3
Date: Mon,  6 Dec 2021 12:26:08 -0500
Message-Id: <20211206172620.3139754-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

This series lays the groundwork for adding GEM support across vmwgfx an
implements features missing for GL4.3.
                                                                           
It fixes a lot of broken userspace code which was assuming GEM objects
coming via the "dumb" entrypoints and fixes a lot of bugs in our code by
letting DRM helpers use the standard GEM paths resulting in hundreds
more passing IGT tests.
                                                                           
There's more work to be done on the GEM side - in particular the driver
should start using the DRM fb/kms helpers which depend on GEM. They're
blocked by surfaces which are currently still opaque TTM handles.
Switching surfaces to GEM objects without breaking userspace is a little
more complicated but we'll get there.

Roland Scheidegger (2):
  drm/vmwgfx: support SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2 command
  drm/vmwgfx: add support for updating only offsets of constant buffers

Zack Rusin (10):
  drm/vmwgfx: Remove the dedicated memory accounting
  drm/vmwgfx: Add a debug callback to mobid resource manager
  drm/vmwgfx: Stop hardcoding the PCI ID
  drm/vmwgfx: Implement DRIVER_GEM
  drm/vmwgfx: Implement create_handle on drm_framebuffer_funcs
  drm/vmwgfx: Update device headers for GL43
  drm/vmwgfx: support 64 UAVs
  drm/vmwgfx: Allow checking for gl43 contexts
  drm/vmwgfx: Remove usage of MOBFMT_RANGE
  drm/vmwgfx: Bump the major version

 drivers/gpu/drm/vmwgfx/Kconfig                |   1 +
 drivers/gpu/drm/vmwgfx/Makefile               |   3 +-
 .../drm/vmwgfx/device_include/svga3d_cmd.h    |   6 +-
 .../vmwgfx/device_include/svga3d_devcaps.h    |  10 +-
 .../gpu/drm/vmwgfx/device_include/svga3d_dx.h |  12 +-
 .../drm/vmwgfx/device_include/svga3d_limits.h |   8 +-
 .../drm/vmwgfx/device_include/svga3d_reg.h    |   6 +-
 .../drm/vmwgfx/device_include/svga3d_types.h  |   7 +-
 .../drm/vmwgfx/device_include/svga_escape.h   |   6 +-
 .../drm/vmwgfx/device_include/svga_overlay.h  |   6 +-
 .../gpu/drm/vmwgfx/device_include/svga_reg.h  |  14 +-
 drivers/gpu/drm/vmwgfx/ttm_memory.c           | 586 ------------------
 drivers/gpu/drm/vmwgfx/ttm_memory.h           |  92 ---
 drivers/gpu/drm/vmwgfx/ttm_object.c           | 150 +----
 drivers/gpu/drm/vmwgfx/ttm_object.h           |  56 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c       |  45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.h       |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 580 ++++-------------
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c    |  19 -
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |  30 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  47 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 130 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |  82 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c            |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  43 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           | 294 +++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c           |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c         |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |  91 +--
 .../gpu/drm/vmwgfx/vmwgfx_simple_resource.c   |  29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |  21 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.h            |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c  |  21 -
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 158 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |  77 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c      |  74 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_va.c            |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    |  46 --
 include/uapi/drm/vmwgfx_drm.h                 |   1 +
 50 files changed, 820 insertions(+), 2125 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_memory.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_memory.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c

-- 
2.32.0

