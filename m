Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6A362102
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 15:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD0C6EA3C;
	Fri, 16 Apr 2021 13:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141E46E50C;
 Fri, 16 Apr 2021 13:31:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 731BDAF23;
 Fri, 16 Apr 2021 13:31:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Subject: [PATCH v3 0/7] drm: Clean up mmap for TTM-based GEM drivers
Date: Fri, 16 Apr 2021 15:31:39 +0200
Message-Id: <20210416133146.24825-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement mmap via struct drm_gem_object_functions.mmap in amdgpu,
radeon and nouveau. This allows for using common DRM helpers for
the mmap-related callbacks in struct file_operations and struct
drm_driver. The drivers have their own vm_ops, which are now set
automatically by the DRM core functions. The code in each driver's
verify_access becomes part of the driver's new mmap implementation.

With the GEM drivers converted, vmwgfx is the only user of
ttm_bo_mmap() and related infrastructure. So move everything into
vmwgfx and delete the rsp code from TTM.

This touches several drivers. Preferably everything would be merged
at once via drm-misc-next.

v3:
	* tidy up the new mmap functions in amdgpu and radeon (Christian)
v2:
	* removal of amdgpu fbdev mmap already merged (Christian)
	* rebase on top of amdgpu fixes [1] (Felix)
	* replace pr_err() with drm_err() in vmwgfx patch (Zack)
	* several typos

[1] https://patchwork.freedesktop.org/series/88822/

Thomas Zimmermann (7):
  drm/ttm: Don't override vm_ops callbacks, if set
  drm/amdgpu: Implement mmap as GEM object function
  drm/radeon: Implement mmap as GEM object function
  drm/nouveau: Implement mmap as GEM object function
  drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
  drm/vmwgfx: Inline vmw_verify_access()
  drm/ttm: Remove ttm_bo_mmap() and friends

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 ---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 44 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 64 --------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c        | 10 ----
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 36 ++++++++++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c       | 49 ----------------
 drivers/gpu/drm/nouveau/nouveau_ttm.h       |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c         |  3 +-
 drivers/gpu/drm/radeon/radeon_gem.c         | 49 ++++++++++++++++
 drivers/gpu/drm/radeon/radeon_ttm.c         | 65 ---------------------
 drivers/gpu/drm/radeon/radeon_ttm.h         |  1 -
 drivers/gpu/drm/ttm/ttm_bo_vm.c             | 60 ++-----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  9 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 53 ++++++++++++++++-
 include/drm/ttm/ttm_bo_api.h                | 13 -----
 include/drm/ttm/ttm_device.h                | 15 -----
 20 files changed, 191 insertions(+), 337 deletions(-)

--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
