Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD402C83C5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC5989D49;
	Mon, 30 Nov 2020 12:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB16D89D49
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67588AB63;
 Mon, 30 Nov 2020 12:04:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 0/8] drm/vram-helper: Lock GEM BOs while they are mapped
Date: Mon, 30 Nov 2020 13:04:25 +0100
Message-Id: <20201130120433.7205-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GEM VRAM helpers used to pin the BO in their implementation of vmap, so
that they could not be relocated. In a recent discussion, [1] it became
clear that this is incorrect and that vmap should rather repend on the
reservation lock to prevent relocation. This patchset addresses the issue.
Besides the vram helpers, this affects ast, vboxvideo and the generic
fbdev emulation.

Patch 1 adds a few more rules to vmap internfaces. With VRAM, it is
necessary to keep the BO evictable, which requires soem care when mapping
the memory. Patch 2 changes ast's cursor code accordingly.

Patch 3 adds vram helpers that acquires the reservation lock and vmap the
memory buffer. Same for vunmap in reverse. Patches 4 and 5 convert ast
and vboxvideo to the new helper.

Patch 6 removes pinning and locking from VRAM helper's vmap and vunmap.
The affected users in ast and fbdev emulation acquire the reservation
locks of the GEM objects before vmapping BOs. VRAM helpers don't support
to export the buffer, so there are no other users of these functions.

The the pinning and locking removed, vmap can be simplified as done in
patches 7 and 8.

Tested on ast with GEM VRAM and also on mgag200 to verify that the fbdev
change does not interfere with GEM SHMEM.

Thomas Zimmermann (8):
  drm/gem: Write down some rules for vmap usage
  drm/ast: Only map cursor BOs during updates
  drm/vram-helper: Provide drm_gem_vram_vmap_unlocked()
  drm/ast: Use drm_gem_vram_vmap_unlocked() in ast_cursor_show()
  drm/vboxvideo: Use drm_gem_vram_vmap_unlocked() in cursor update
  drm/vram-helper: Remove pinning and locking from drm_gem_vram_vmap()
  drm/vram-helper: Remove vmap reference counting
  drm/vram-helper: Simplify vmap implementation

 drivers/gpu/drm/ast/ast_cursor.c      |  63 +++++++++-------
 drivers/gpu/drm/ast/ast_drv.h         |   2 -
 drivers/gpu/drm/drm_client.c          |  31 ++++++++
 drivers/gpu/drm/drm_fb_helper.c       |  10 ++-
 drivers/gpu/drm/drm_gem_vram_helper.c | 101 +++++++++++++-------------
 drivers/gpu/drm/drm_prime.c           |   6 ++
 drivers/gpu/drm/vboxvideo/vbox_mode.c |   7 +-
 include/drm/drm_client.h              |   2 +
 include/drm/drm_gem.h                 |  16 ++++
 include/drm/drm_gem_vram_helper.h     |  21 ++----
 10 files changed, 159 insertions(+), 100 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
