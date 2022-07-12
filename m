Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B688A5710E1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 05:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D2810F541;
	Tue, 12 Jul 2022 03:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B7410F4DA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 03:33:02 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 59309321F3B;
 Tue, 12 Jul 2022 04:32:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1657596780; bh=WKi+c7N11EophNOizOQVxyveEKOIAEoQMBqHM50Yr64=;
 h=From:To:Cc:Subject:Date:From;
 b=eqIeH//v31qF6zmffAR3mMvnAATT7Vu6G2w1F7KtAct/mj4AxTN7qe2At/ysgu04v
 4FDD+FZuF09az6CqWRPTtVLQKMGO2c0zq3IZ+8rh39bncEz6IvuD/5uadvs5zt4MAg
 JLT4DJXZdiC0cryPLaTra7SmRELNh/VAHGNAu0tzyVtPS/BfO2Kaj5K2Rlj7jqkgGz
 K08+mdoo3cC+PjIKVyeThzQUhiMokaj9ZBv1+th+MGUvpOrJSFYmKG75SL0rU9m+IS
 CpSiT9IzfKsGiWF8KI288zMzyuAOwCl5p8FXE6KbAQwMypOybFdB9cibr6aiqYOQZf
 vlPIHDhDTwyBg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/8] Fix cursor planes with virtualized drivers
Date: Mon, 11 Jul 2022 23:32:38 -0400
Message-Id: <20220712033246.1148476-1-zack@kde.org>
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
Cc: krastevm@vmware.com, ppaalanen@gmail.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Virtualized drivers have had a lot of issues with cursor support on top
of atomic modesetting. This set both fixes the long standing problems
with atomic kms and virtualized drivers and adds code to let userspace
use atomic kms on virtualized drivers while preserving functioning
seamless cursors between the host and guest.

The first change in the set is one that should be backported as far as
possible, likely 5.4 stable, because earlier stable kernels do not have
virtualbox driver. The change makes virtualized drivers stop exposing
a cursor plane for atomic clients, this fixes mouse cursor on all well
formed compositors which will automatically fallback to software cursor.

The rest of the changes until the last one ports the legacy hotspot code
to atomic plane properties.

Finally the last change introduces userspace API to let userspace
clients advertise the fact that they are aware of additional restrictions
placed upon the cursor plane by virtualized drivers and lets them use
atomic kms with virtualized drivers (the clients are expected to set
hotspots correctly when advertising support for virtual cursor plane).

Zack Rusin (8):
  drm: Disable the cursor plane on atomic contexts with virtualized
    drivers
  drm/atomic: Add support for mouse hotspots
  drm/vmwgfx: Use the hotspot properties from cursor planes
  drm/qxl: Use the hotspot properties from cursor planes
  drm/vboxvideo: Use the hotspot properties from cursor planes
  drm/virtio: Use the hotspot properties from cursor planes
  drm: Remove legacy cursor hotspot code
  drm: Introduce DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE

 drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 20 ++++++++
 drivers/gpu/drm/drm_ioctl.c               |  9 ++++
 drivers/gpu/drm/drm_plane.c               | 59 ++++++++++++++++++++++-
 drivers/gpu/drm/qxl/qxl_display.c         | 14 +++---
 drivers/gpu/drm/qxl/qxl_drv.c             |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c      |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c     |  4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c      |  3 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c    |  8 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c       |  9 +---
 include/drm/drm_drv.h                     | 10 ++++
 include/drm/drm_file.h                    | 12 +++++
 include/drm/drm_framebuffer.h             | 12 -----
 include/drm/drm_plane.h                   | 15 ++++++
 include/uapi/drm/drm.h                    | 17 +++++++
 17 files changed, 173 insertions(+), 39 deletions(-)

-- 
2.34.1

