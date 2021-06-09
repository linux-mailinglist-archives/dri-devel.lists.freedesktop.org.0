Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543A3A1BA8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106A6E12A;
	Wed,  9 Jun 2021 17:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796376E12A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:23:09 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 9 Jun 2021 10:23:05 -0700
Received: from vertex.localdomain (unknown [10.21.244.178])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 38E402024D;
 Wed,  9 Jun 2021 10:23:08 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/9] Adding support for mks-stats and some cleanups/fixes
Date: Wed, 9 Jun 2021 13:22:58 -0400
Message-ID: <20210609172307.131929-1-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our GL driver added support for mks-stats (a count/time based profiling
that can combine guest/host stats into a singular profile) a while
back but it was only used on windows. This set adds support for
mks-stats to the kernel driver. The stats are reported in the host
side logs. With time we'll be expanding the list of kernel side stats,
currently only execbuf is being measured. The GL driver already
has all the relevant entrypoints measured.

There's also a bunch of cleanups and fixes.

Martin Krastev (2):
  drm/vmwgfx: Introduce VMware mks-guest-stats
  drm/vmwgfx: Refactor vmw_mksstat_remove_ioctl to expect pgid match
    with vmw_mksstat_add_ioctl to authorise removal.

Zack Rusin (7):
  drm/vmwgfx: Simplify devcaps code
  drm/vmwgfx: Fix subresource updates with new contexts
  drm/vmwgfx: Fix some static checker warnings
  drm/vmwgfx: remove code that was using physical page addresses
  drm/vmwgfx: inline access to the pages from the piter
  drm/vmwgfx: Remove vmw_chipset
  drm/vmwgfx: Fix implicit declaration error

 drivers/gpu/drm/vmwgfx/Kconfig                |   7 +
 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 .../drm/vmwgfx/device_include/svga_types.h    |  92 ++-
 .../vmwgfx/device_include/vm_basic_types.h    |  22 -
 drivers/gpu/drm/vmwgfx/ttm_memory.c           |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c       |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c    |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c       | 142 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.h       |  50 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  58 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  38 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         | 109 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h       | 144 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c           |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c           | 579 +++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |  35 --
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |   4 +-
 include/uapi/drm/vmwgfx_drm.h                 |  41 ++
 24 files changed, 1175 insertions(+), 217 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/vm_basic_types.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h

-- 
2.30.2

