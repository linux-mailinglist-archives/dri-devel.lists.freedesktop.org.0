Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C4373410
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 05:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312266E40C;
	Wed,  5 May 2021 03:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F936E40A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 03:57:43 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 4 May 2021 20:57:39 -0700
Received: from vertex.localdomain (unknown [10.21.250.233])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id F3FF520486;
 Tue,  4 May 2021 20:57:40 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/6] drm/vmwgfx: SVGA v3 and arm64 support
Date: Tue, 4 May 2021 23:57:34 -0400
Message-ID: <20210505035740.286923-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: krastevm@vmware.com, sroland@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This set includes some lost fixes and adds SVGA v3 and arm64 support
to the driver. SVGA v3 is the next version of our virtual device,
it's largely about making the device a little easier and cleaner
to use (e.g. MMIO for register accesses instead of ioports, adding
MSI-X support, deprecating the FIFO MMIO and removing a lot of the
old and legacy functionality). We'll be able to get rid of some
of the locking as well, which improves the performance.

Our ARM64 support is only available in svga v3. Currently guest
memory objects are not supported on arm so 3D is not yet available
there.

Thomas Hellstrom (2):
  drm/vmwgfx: Mark a surface gpu-dirty after the SVGA3dCmdDXGenMips
    command
  drm/vmwgfx: Fix cpu updates of coherent multisample surfaces

Zack Rusin (4):
  drm/vmwgfx: Fix incorrect enum usage
  drm/vmwgfx: Remove the reservation semaphore
  drm/vmwgfx: Add basic support for SVGA3
  drm/vmwgfx: Port vmwgfx to arm64

 drivers/gpu/drm/vmwgfx/Kconfig                |   3 +-
 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 .../device_include/svga3d_surfacedefs.h       |   8 +-
 .../gpu/drm/vmwgfx/device_include/svga_reg.h  |  55 ++++-
 drivers/gpu/drm/vmwgfx/ttm_lock.c             | 194 ----------------
 drivers/gpu/drm/vmwgfx/ttm_lock.h             | 218 -----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  31 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           | 114 +++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 161 +++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 128 +++++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |  27 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c            |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h         |   2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |  60 +----
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c           |  75 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  30 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  36 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c           |  31 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.h           | 214 -----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h     | 130 +++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h       | 219 ++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_reg.h           |   4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |   6 -
 .../gpu/drm/vmwgfx/vmwgfx_simple_resource.c   |   5 -
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  30 ++-
 29 files changed, 783 insertions(+), 1043 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg.h
 create mode 100755 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
