Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B72758AF4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 03:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6622310E0B8;
	Wed, 19 Jul 2023 01:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D5B10E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:42:28 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B9A0732629D;
 Wed, 19 Jul 2023 02:42:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1689730945; bh=ONIMRLVG7gruaEvCKxjP0Fte6HG0lhkY32OtQPuFauo=;
 h=From:To:Cc:Subject:Date:From;
 b=Bn1kkYMphO+bkk7/q8aVJTpAzCOQpYosNydBDYXkNSV3ADnsZ+BytyQ2I55Um1Ybl
 ZRUVbr8C6TEokBWtiayGQkFsTnFYkydR+t355ppE0mQ65f5wBWfBOn01/iJFpisTmV
 dYru317NeOTRUhRMO2+LyGJpgOpwZafl5K8ko/1C+boR3EnaHud+4nHIcWAYXkG4Iy
 dkDWYz4poglXRCQHB+KmDg0xJP74kC+9HOJFaMzwb+aicOfbpui7plcPW3JIiAmFH/
 X6jkQd6jw31wb7UJdjhlxlqjFGwAMGw3gByHstU1czg4Ccst3+gczQgzIimWRyLAG8
 vvT+OblkrySqw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/9] Fix cursor planes with virtualized drivers
Date: Tue, 18 Jul 2023 21:42:09 -0400
Message-Id: <20230719014218.1700057-1-zack@kde.org>
X-Mailer: git-send-email 2.39.2
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
Cc: javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

v5: Add a change with documentation from Michael, based on his discussion
with Pekka and bump the kernel version DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
might be introduced with to 6.6.

v4: Make drm_plane_create_hotspot_properties static, rename
DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE to DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
and some minor stylistic fixes for things found by Javier and Pekka
in v3.

v3: Renames, fixes and cleanups suggested by Daniel, Simon and Pekka
after v2. There's no major changes in functionality. Please let me know
if I missed anything, it's been a while since v2.

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

Michael Banack (1):
  drm: Introduce documentation for hotspot properties

Zack Rusin (8):
  drm: Disable the cursor plane on atomic contexts with virtualized
    drivers
  drm/atomic: Add support for mouse hotspots
  drm/vmwgfx: Use the hotspot properties from cursor planes
  drm/qxl: Use the hotspot properties from cursor planes
  drm/vboxvideo: Use the hotspot properties from cursor planes
  drm/virtio: Use the hotspot properties from cursor planes
  drm: Remove legacy cursor hotspot code
  drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT

 Documentation/gpu/drm-kms.rst             |   6 ++
 drivers/gpu/drm/drm_atomic_state_helper.c |  14 +++
 drivers/gpu/drm/drm_atomic_uapi.c         |  20 ++++
 drivers/gpu/drm/drm_ioctl.c               |   9 ++
 drivers/gpu/drm/drm_plane.c               | 120 +++++++++++++++++++++-
 drivers/gpu/drm/qxl/qxl_display.c         |  14 ++-
 drivers/gpu/drm/qxl/qxl_drv.c             |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c      |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c     |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c      |   3 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c    |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c       |   9 +-
 include/drm/drm_drv.h                     |   9 ++
 include/drm/drm_file.h                    |  12 +++
 include/drm/drm_framebuffer.h             |  12 ---
 include/drm/drm_plane.h                   |  14 +++
 include/uapi/drm/drm.h                    |  25 +++++
 18 files changed, 246 insertions(+), 39 deletions(-)

-- 
2.39.2

