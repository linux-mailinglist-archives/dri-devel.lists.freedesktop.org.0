Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A717373F311
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 05:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9B310E27E;
	Tue, 27 Jun 2023 03:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838C310E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:58:46 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B8A9D323EE6;
 Tue, 27 Jun 2023 04:58:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687838322; bh=5LaIrjXtr5CVgEsmfPg+U5UbhS4ygTD5cO+D9EWIxBI=;
 h=From:To:Cc:Subject:Date:From;
 b=nZJ9C8qIgTmMUBug0a2qTA7SfrHjwQgRvG8zsCGdy3V3QHebOy7G75jMFSg8QdNtC
 jJQiZaEzXcpNRDIKHrmlQ4hHCd9T/LfQ6AtdoNjAjG5TuIFV0aDC7xDtE5jbZuiaVS
 UgD6nYS3wE1+cF3ixQm2oE9TUlxxICs3KKPm7n1Q3roZPMPMQQuFkS/AyWSa+STo8S
 6Wm/QPKL9JQmUK+D3nUfKIxAqkeaeSrC22cesszsj1NdU9/UB5uCl/mQjqcEUNLD/G
 wuaKbb7tXdekO1h2n5jdu4vEbDWCILeEMt1WLDQHvAdWI4SUnPpmdpG5pxspOl6uUg
 uqkrJUrZrEw6g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/8] Fix cursor planes with virtualized drivers
Date: Mon, 26 Jun 2023 23:58:31 -0400
Message-Id: <20230627035839.496399-1-zack@kde.org>
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

Zack Rusin (8):
  drm: Disable the cursor plane on atomic contexts with virtualized
    drivers
  drm/atomic: Add support for mouse hotspots
  drm/vmwgfx: Use the hotspot properties from cursor planes
  drm/qxl: Use the hotspot properties from cursor planes
  drm/vboxvideo: Use the hotspot properties from cursor planes
  drm/virtio: Use the hotspot properties from cursor planes
  drm: Remove legacy cursor hotspot code
  drm: Introduce DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE

 drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++
 drivers/gpu/drm/drm_ioctl.c               |  9 ++++
 drivers/gpu/drm/drm_plane.c               | 65 ++++++++++++++++++++++-
 drivers/gpu/drm/qxl/qxl_display.c         | 14 +++--
 drivers/gpu/drm/qxl/qxl_drv.c             |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c      |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c     |  4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c      |  2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c    |  8 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c       |  9 +---
 include/drm/drm_drv.h                     |  9 ++++
 include/drm/drm_file.h                    | 12 +++++
 include/drm/drm_framebuffer.h             | 12 -----
 include/drm/drm_plane.h                   | 15 ++++++
 include/uapi/drm/drm.h                    | 26 +++++++++
 17 files changed, 186 insertions(+), 39 deletions(-)

-- 
2.39.2

