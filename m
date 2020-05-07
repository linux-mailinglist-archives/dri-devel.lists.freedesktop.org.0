Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6E1C991B
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 20:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3A46E181;
	Thu,  7 May 2020 18:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B1C6E181
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 18:17:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CBE422003E;
 Thu,  7 May 2020 20:17:27 +0200 (CEST)
Date: Thu, 7 May 2020 20:17:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 00/36] drm: Fareless gem_free_object
Message-ID: <20200507181726.GE13247@ravnborg.org>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=L6BKwSAmEh9COuXoG9EA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.
On Thu, May 07, 2020 at 04:07:46PM +0100, Emil Velikov wrote:
> Hi all,
> 
> Recently I had a look at the new dmabuf AMDGPU implementation.
> 
> Seemingly it was using the wrong drm_gem_object_put API. Namely the
> locked one, even though the driver is struct_mutex free.
> 
> Upon checking with the documentation, I've noticed it's a bit misleading
> so I've went ahead and:
> 
>  - tweaked the drm_gem_object_put/struct_mutex references in the docs
>  - fixed up the AMDGPU caller
>  - removed the gem_free_object driver hook - \o/
>  - fold drm_gem_object_put_unlocked and __drm_gem_object_put
>  - drm_gem_object_put - add _locked suffix
>  - drm_gem_object_put_unlocked - remove _unlocked suffix
> 
> Although the rename patches are a handful, it does make sense to have a
> consistent and obviously named API.
> 
> Input and reviews are highly appreciated.
All patches I did not comment are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I see why you introduced _unlocked, and remove it again.
So you could ask the compiler to help you.

But I see this as something that should not be committed and only
part of your own tree.
But thats not something I feel too strong about - let's just say it
confused me a lttle.

The driver patches was only skimmed, as they were mechanical anyway.


	Sam

> Emil
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> Emil Velikov (36):
>   drm: remove unused drm_gem.h include
>   drm/gem: use _unlocked reference in drm_gem_objects_lookup docs
>   drm/todo: mention i915 in the struct_mutex section
>   drm/doc: drop struct_mutex references
>   drm/doc: drop struct_mutex refernce for drm_gem_object_free
>   drm/amdgpu: use the unlocked drm_gem_object_put
>   drm/gma500: Use lockless gem BO free callback
>   drm: remove drm_driver::gem_free_object
>   drm/gem: fold drm_gem_object_put_unlocked and __drm_gem_object_put()
>   drm/gem: add _locked suffix to drm_object_put
>   drm/gem: add drm_object_put helper
>   drm/amd: remove _unlocked suffix in drm_object_put_unlocked
>   drm/arm: remove _unlocked suffix in drm_object_put_unlocked
>   drm/armada: remove _unlocked suffix in drm_object_put_unlocked
>   drm/etnaviv: remove _unlocked suffix in drm_object_put_unlocked
>   drm/exynos: remove _unlocked suffix in drm_object_put_unlocked
>   drm/gma500: remove _unlocked suffix in drm_object_put_unlocked
>   drm/i915: remove _unlocked suffix in drm_object_put_unlocked
>   drm/lima: remove _unlocked suffix in drm_object_put_unlocked
>   drm/mediatek: remove _unlocked suffix in drm_object_put_unlocked
>   drm/mgag200: remove _unlocked suffix in drm_object_put_unlocked
>   drm/msm: remove _unlocked suffix in drm_object_put_unlocked
>   drm/nouveau: remove _unlocked suffix in drm_object_put_unlocked
>   drm/omapdrm: remove _unlocked suffix in drm_object_put_unlocked
>   drm/panfrost: remove _unlocked suffix in drm_object_put_unlocked
>   drm/qxl: remove _unlocked suffix in drm_object_put_unlocked
>   drm/radeon: remove _unlocked suffix in drm_object_put_unlocked
>   drm/rockchip: remove _unlocked suffix in drm_object_put_unlocked
>   drm/tegra: remove _unlocked suffix in drm_object_put_unlocked
>   drm/v3d: remove _unlocked suffix in drm_object_put_unlocked
>   drm/vc4: remove _unlocked suffix in drm_object_put_unlocked
>   drm/vgem: remove _unlocked suffix in drm_object_put_unlocked
>   drm/virtio: remove _unlocked suffix in drm_object_put_unlocked
>   drm/vkms: remove _unlocked suffix in drm_object_put_unlocked
>   drm/xen: remove _unlocked suffix in drm_object_put_unlocked
>   drm/gem: remove _unlocked suffix in drm_object_put_unlocked
> 
>  Documentation/gpu/drm-mm.rst                  |  5 +-
>  Documentation/gpu/todo.rst                    |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 20 +++---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  6 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  6 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  6 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  6 +-
>  .../arm/display/komeda/komeda_framebuffer.c   |  6 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
>  drivers/gpu/drm/armada/armada_crtc.c          |  8 +--
>  drivers/gpu/drm/armada/armada_fb.c            |  4 +-
>  drivers/gpu/drm/armada/armada_fbdev.c         |  6 +-
>  drivers/gpu/drm/armada/armada_gem.c           | 10 +--
>  drivers/gpu/drm/drm_client.c                  |  2 +-
>  drivers/gpu/drm/drm_gem.c                     | 70 +++++--------------
>  drivers/gpu/drm/drm_gem_cma_helper.c          |  8 +--
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  6 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  4 +-
>  drivers/gpu/drm/drm_gem_ttm_helper.c          |  2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c         | 10 +--
>  drivers/gpu/drm/drm_prime.c                   |  6 +-
>  drivers/gpu/drm/drm_vm.c                      |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  8 +--
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  6 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c       |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.h       |  2 +-
>  drivers/gpu/drm/gma500/framebuffer.c          |  2 +-
>  drivers/gpu/drm/gma500/gem.c                  |  2 +-
>  drivers/gpu/drm/gma500/gma_display.c          |  6 +-
>  drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
>  drivers/gpu/drm/lima/lima_gem.c               | 10 +--
>  drivers/gpu/drm/lima/lima_sched.c             |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c      |  8 +--
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c            |  2 +-
>  drivers/gpu/drm/msm/msm_drv.c                 |  8 +--
>  drivers/gpu/drm/msm/msm_fb.c                  |  4 +-
>  drivers/gpu/drm/msm/msm_gem.c                 | 18 ++---
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c                 |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  8 +--
>  drivers/gpu/drm/nouveau/nouveau_gem.c         | 14 ++--
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
>  drivers/gpu/drm/omapdrm/omap_fb.c             |  2 +-
>  drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c            |  4 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 10 +--
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  4 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  4 +-
>  drivers/gpu/drm/qxl/qxl_cmd.c                 |  2 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  6 +-
>  drivers/gpu/drm/qxl/qxl_dumb.c                |  2 +-
>  drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
>  drivers/gpu/drm/qxl/qxl_ioctl.c               |  4 +-
>  drivers/gpu/drm/qxl/qxl_object.c              |  4 +-
>  drivers/gpu/drm/radeon/radeon_cs.c            |  2 +-
>  drivers/gpu/drm/radeon/radeon_cursor.c        |  6 +-
>  drivers/gpu/drm/radeon/radeon_display.c       |  8 +--
>  drivers/gpu/drm/radeon/radeon_fb.c            |  4 +-
>  drivers/gpu/drm/radeon/radeon_gem.c           | 30 ++++----
>  drivers/gpu/drm/radeon/radeon_object.c        |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
>  drivers/gpu/drm/tegra/drm.c                   | 12 ++--
>  drivers/gpu/drm/tegra/fb.c                    |  6 +-
>  drivers/gpu/drm/tegra/gem.c                   |  4 +-
>  drivers/gpu/drm/v3d/v3d_bo.c                  |  6 +-
>  drivers/gpu/drm/v3d/v3d_gem.c                 |  4 +-
>  drivers/gpu/drm/v3d/v3d_irq.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                  | 14 ++--
>  drivers/gpu/drm/vc4/vc4_gem.c                 | 14 ++--
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 +-
>  drivers/gpu/drm/vgem/vgem_drv.c               |  6 +-
>  drivers/gpu/drm/vgem/vgem_fence.c             |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_gem.c          |  6 +-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  6 +-
>  drivers/gpu/drm/vkms/vkms_gem.c               |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front.c           |  4 +-
>  include/drm/drm_drv.h                         |  8 ---
>  include/drm/drm_gem.h                         | 28 +++-----
>  99 files changed, 269 insertions(+), 325 deletions(-)
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
