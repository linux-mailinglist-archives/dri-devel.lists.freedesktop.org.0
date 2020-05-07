Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD11C93E1
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7276E9F0;
	Thu,  7 May 2020 15:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8547A6E9F0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:10:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r26so7253130wmh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T5uO7lym9qjiVPjlZVzDhCN+YbtBjxOLhVy8aZM2+No=;
 b=ZMSCyughG53XTPGz5nPputhGVzCmg83zplHFM05L4EhDAkBZYQ59mFfi7xTVCyB/hz
 WQ5Mj9YK+qzM+JR/JUVn7LUa+QhKBIYn6n5O7nGmQ3339279cqy0j+rWZzwubxv/EYqW
 rgLcGRwFCXbNZiKGvGiEQonhx4pU8Ru10yXTRnKrVigdGHriajYq5czqYn4UO1DIRa4f
 /0D1d+c8qJpbzLNo2mnT6Ps5FrAY2Y0/l6nldEl48HDkZyX4FCfIsLPo4B1wFf6NvIjS
 Af4YD+Eo3KZBtbHzyonxHE5+1ziWRhpK5VJnBoat4S5KCIw8JVJPUJKYo2oqTpj7Psm2
 BFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T5uO7lym9qjiVPjlZVzDhCN+YbtBjxOLhVy8aZM2+No=;
 b=mcrZ5fFd7xAMKAekxeT+A/Ofyw2+PIIeAafoxpGhOS8lkFNr+oUEucXVWefwKv2faO
 gV2XCpl8Nsnccti8S+ox2qpyyC4R/H24ev+T3mafQfpmgljdLBWBifn0ZotTXd0BGfPw
 S24i3+MVoo64WPlRd6+henqgk2irlTfqrWS/lOHV4bQrPM6QEBY7QKKd57zlDv/uMJDJ
 xsc2k5pmVSyHXsJfshsYueNXy4fHV33iX8l+tAmwh9VNFX4dMJv+PvTZV8Dldljm10f0
 JaaRyacTIRIE4mzZ++vQBo28Ap/Y31ysKRLgo4drJHI7xNPdRXczf429gB8W3AuHBXYs
 3IKQ==
X-Gm-Message-State: AGi0PuY70/LvlFmrYkqitgTbCfGsxUQbLiSzDiLZlIvx48w1hDu45bMu
 ro1gyhUUdbgjiROxhiSEETAzxcd1
X-Google-Smtp-Source: APiQypLnM6uLSz7Kvgqr2HGhxduuJS4eDzseuWMYpu1hc1mk+BMWTRNncj5OLKSL4zRPx9wl3iHpXw==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr3773602wmc.53.1588864250529; 
 Thu, 07 May 2020 08:10:50 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:49 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/36] drm: Fareless gem_free_object
Date: Thu,  7 May 2020 16:07:46 +0100
Message-Id: <20200507150822.114464-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Recently I had a look at the new dmabuf AMDGPU implementation.

Seemingly it was using the wrong drm_gem_object_put API. Namely the
locked one, even though the driver is struct_mutex free.

Upon checking with the documentation, I've noticed it's a bit misleading
so I've went ahead and:

 - tweaked the drm_gem_object_put/struct_mutex references in the docs
 - fixed up the AMDGPU caller
 - removed the gem_free_object driver hook - \o/
 - fold drm_gem_object_put_unlocked and __drm_gem_object_put
 - drm_gem_object_put - add _locked suffix
 - drm_gem_object_put_unlocked - remove _unlocked suffix

Although the rename patches are a handful, it does make sense to have a
consistent and obviously named API.

Input and reviews are highly appreciated.
Emil

Cc: Daniel Vetter <daniel@ffwll.ch>

Emil Velikov (36):
  drm: remove unused drm_gem.h include
  drm/gem: use _unlocked reference in drm_gem_objects_lookup docs
  drm/todo: mention i915 in the struct_mutex section
  drm/doc: drop struct_mutex references
  drm/doc: drop struct_mutex refernce for drm_gem_object_free
  drm/amdgpu: use the unlocked drm_gem_object_put
  drm/gma500: Use lockless gem BO free callback
  drm: remove drm_driver::gem_free_object
  drm/gem: fold drm_gem_object_put_unlocked and __drm_gem_object_put()
  drm/gem: add _locked suffix to drm_object_put
  drm/gem: add drm_object_put helper
  drm/amd: remove _unlocked suffix in drm_object_put_unlocked
  drm/arm: remove _unlocked suffix in drm_object_put_unlocked
  drm/armada: remove _unlocked suffix in drm_object_put_unlocked
  drm/etnaviv: remove _unlocked suffix in drm_object_put_unlocked
  drm/exynos: remove _unlocked suffix in drm_object_put_unlocked
  drm/gma500: remove _unlocked suffix in drm_object_put_unlocked
  drm/i915: remove _unlocked suffix in drm_object_put_unlocked
  drm/lima: remove _unlocked suffix in drm_object_put_unlocked
  drm/mediatek: remove _unlocked suffix in drm_object_put_unlocked
  drm/mgag200: remove _unlocked suffix in drm_object_put_unlocked
  drm/msm: remove _unlocked suffix in drm_object_put_unlocked
  drm/nouveau: remove _unlocked suffix in drm_object_put_unlocked
  drm/omapdrm: remove _unlocked suffix in drm_object_put_unlocked
  drm/panfrost: remove _unlocked suffix in drm_object_put_unlocked
  drm/qxl: remove _unlocked suffix in drm_object_put_unlocked
  drm/radeon: remove _unlocked suffix in drm_object_put_unlocked
  drm/rockchip: remove _unlocked suffix in drm_object_put_unlocked
  drm/tegra: remove _unlocked suffix in drm_object_put_unlocked
  drm/v3d: remove _unlocked suffix in drm_object_put_unlocked
  drm/vc4: remove _unlocked suffix in drm_object_put_unlocked
  drm/vgem: remove _unlocked suffix in drm_object_put_unlocked
  drm/virtio: remove _unlocked suffix in drm_object_put_unlocked
  drm/vkms: remove _unlocked suffix in drm_object_put_unlocked
  drm/xen: remove _unlocked suffix in drm_object_put_unlocked
  drm/gem: remove _unlocked suffix in drm_object_put_unlocked

 Documentation/gpu/drm-mm.rst                  |  5 +-
 Documentation/gpu/todo.rst                    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 20 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  6 +-
 .../arm/display/komeda/komeda_framebuffer.c   |  6 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
 drivers/gpu/drm/armada/armada_crtc.c          |  8 +--
 drivers/gpu/drm/armada/armada_fb.c            |  4 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |  6 +-
 drivers/gpu/drm/armada/armada_gem.c           | 10 +--
 drivers/gpu/drm/drm_client.c                  |  2 +-
 drivers/gpu/drm/drm_gem.c                     | 70 +++++--------------
 drivers/gpu/drm/drm_gem_cma_helper.c          |  8 +--
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  4 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c          |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         | 10 +--
 drivers/gpu/drm/drm_prime.c                   |  6 +-
 drivers/gpu/drm/drm_vm.c                      |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  8 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.h       |  2 +-
 drivers/gpu/drm/gma500/framebuffer.c          |  2 +-
 drivers/gpu/drm/gma500/gem.c                  |  2 +-
 drivers/gpu/drm/gma500/gma_display.c          |  6 +-
 drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
 drivers/gpu/drm/lima/lima_gem.c               | 10 +--
 drivers/gpu/drm/lima/lima_sched.c             |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c      |  8 +--
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  8 +--
 drivers/gpu/drm/msm/msm_fb.c                  |  4 +-
 drivers/gpu/drm/msm/msm_gem.c                 | 18 ++---
 drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  8 +--
 drivers/gpu/drm/nouveau/nouveau_gem.c         | 14 ++--
 drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
 drivers/gpu/drm/omapdrm/omap_fb.c             |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 10 +--
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  4 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  4 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                 |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  6 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                |  2 +-
 drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c               |  4 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  4 +-
 drivers/gpu/drm/radeon/radeon_cs.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_cursor.c        |  6 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  8 +--
 drivers/gpu/drm/radeon/radeon_fb.c            |  4 +-
 drivers/gpu/drm/radeon/radeon_gem.c           | 30 ++++----
 drivers/gpu/drm/radeon/radeon_object.c        |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
 drivers/gpu/drm/tegra/drm.c                   | 12 ++--
 drivers/gpu/drm/tegra/fb.c                    |  6 +-
 drivers/gpu/drm/tegra/gem.c                   |  4 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |  6 +-
 drivers/gpu/drm/v3d/v3d_gem.c                 |  4 +-
 drivers/gpu/drm/v3d/v3d_irq.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  | 14 ++--
 drivers/gpu/drm/vc4/vc4_gem.c                 | 14 ++--
 drivers/gpu/drm/vc4/vc4_kms.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 +-
 drivers/gpu/drm/vgem/vgem_drv.c               |  6 +-
 drivers/gpu/drm/vgem/vgem_fence.c             |  2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  6 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  6 +-
 drivers/gpu/drm/vkms/vkms_gem.c               |  2 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |  4 +-
 include/drm/drm_drv.h                         |  8 ---
 include/drm/drm_gem.h                         | 28 +++-----
 99 files changed, 269 insertions(+), 325 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
