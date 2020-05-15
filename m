Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6C1D49F4
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D19E6E10F;
	Fri, 15 May 2020 09:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049F89798
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z72so1960277wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j5jqVb/usfqIIwgS1OhpGJWzUGGavn5y4+PROSrzWzE=;
 b=SB2dEdnaCyfUgfySk7SDNmDaKIjHKAI/V2Xy2oU6YsodRm2vE62vXmtnMJJQ+r+GLr
 Xh4/ShKDxCOwQU3k6ftcVw5Kn6+zmtlQX18r73LTZp7Uwpwh5TF3Z/kgowAiMN69MPz0
 QKn+LZ+KeQDK4QRYHhoao0b4HC0FjpsLrFZsf2xpnbbUQJw7HvJl9LnH3SzdOkRhYf5g
 bbK/tFlGCWbHSKSnsdWLJQBApUxNMYuyE4PBtOa2ai4+btet4YkQhzJQrNY+Uxz+x0n0
 zJm2bDexWSwmljdvRx/xD/wOim8GsUO/+b6ScCK0S9+s5553UbBvzj7hXo+mvG+8xIgw
 swzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j5jqVb/usfqIIwgS1OhpGJWzUGGavn5y4+PROSrzWzE=;
 b=oAzPc0FrUkA47tuNCTH3XgGaxCqqZ2ailn44oZuGvs1Ld63KGUPOuuW5tJF56rLMbj
 fV6SpmnoiLNIA91jd9aMst5cshnwpgHFKEhhtQ4SfAj1llyuojBDeIu/AA62/gFRFb1p
 IK0sQsTu2SAGV90KdTM4vuA1hOjhUlSpSyWFa/gxoLxyerTrFtuF2T3gnSIJEbtRHw+F
 8IjsN2nYRtJ8fDaPzxExNSFWncVvRNl1F4DtldAPlyLw8D81UPMFqo8MSwWOh9nilGXE
 TZDKbgImJ0IJ65oINWQsyWJW+HQcxCUInEMWfqqF1GOxkMFgDdOWNv/J2bBUG+I6qX2Q
 619Q==
X-Gm-Message-State: AOAM530IOOpl0gjUa5dJBapaanzsVJs03R7H2hsgLnmVy8rOjQx1NKJk
 utrJOYiR30K5slVjC+XecwkkO2Jo
X-Google-Smtp-Source: ABdhPJyp5cUlKcziyx1Pxy7cajtaOsANEU86/7rP0WDmEzrjvVN5wV8qJQHrJQf7kLQi3iZlkj6JMw==
X-Received: by 2002:a1c:a952:: with SMTP id s79mr3035157wme.153.1589536441893; 
 Fri, 15 May 2020 02:54:01 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:01 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/38] Fareless gem_free_object
Date: Fri, 15 May 2020 10:50:40 +0100
Message-Id: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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

Here is v2 of the series, with the requested minor tweaks.

 - Add new WARNING in the struct_mutex doc (Daniel)
 - Drop a few more struct_mutex references (Daniel)
 - Missing space in the drm_object_put doc (Jani)
 - Keep drm_object_put_unlocked removal as separate patch (Sam, Thomas)

Considering other have pending work, which may clash with this series
and the overall positive feedback (thanks everyone), I'm inclined to
merge the series to drm-misc-next on Monday evening.

-Emil

Emil Velikov (38):
  drm: remove unused drm_gem.h include
  drm/gem: use _unlocked reference in drm_gem_objects_lookup docs
  drm/todo: mention i915 in the struct_mutex section
  drm/doc: drop struct_mutex references
  drm/doc: add WARNING for drm_device::struct_mutex
  drm/doc: drop struct_mutex reference for drm_gem_object_free
  drm/amdgpu: use the unlocked drm_gem_object_put
  drm/gma500: Use lockless gem BO free callback
  drm: remove drm_driver::gem_free_object
  drm/gem: fold drm_gem_object_put_unlocked and __drm_gem_object_put()
  drm/gem: add _locked suffix to drm_object_put
  drm/gem: add drm_object_put helper
  drm: remove _unlocked suffix in drm_object_put_unlocked
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
  drm: remove transient drm_object_put_unlocked()

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
 include/drm/drm_device.h                      |  3 +
 include/drm/drm_drv.h                         | 10 ---
 include/drm/drm_gem.h                         | 27 +++----
 100 files changed, 271 insertions(+), 327 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
