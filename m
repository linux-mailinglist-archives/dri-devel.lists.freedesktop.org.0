Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A23B0ABE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33B96E7D3;
	Tue, 22 Jun 2021 16:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0026E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso2714928wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rGseW/2NA6fZVCFc5Kns8fRU7bafEFYBWr5+CbGtNOg=;
 b=BLlKpZF+W0F89w0d1M6ubYZffSuuE5Yps0apeP/drgt9QWtdVgszEHmIZdJ/mSxidD
 QLBmzI18tDJAVpkQuhCv6qPq75yDR+fbVwbT4P0af6wIBdrxkERaotV5dIxhohP7wMr1
 qTrUz0atoijLS9U3ZeZP2YgmD+4lQ/EpgbLws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rGseW/2NA6fZVCFc5Kns8fRU7bafEFYBWr5+CbGtNOg=;
 b=PxxO4nyZb4+gQlXnEHDGsfZs/T0VoVj43cdFH2QEKUx2juSqAObDn80rTIm9wLz6Jf
 0MfkYQX8linWkDtcfLkP9Af57TnT1tPFSG3gsplJMVjez8tiVqqycLXm72nTFJlSotOj
 yKD3kyh0Pb4obtHavcPQhR+ywcAej+ze7yLHelOfrTuyfuvbTtdqVvrAFUaAv1QdJRXB
 benoVekmrjvVQNpvcL5IhB1W8DMNt/qFRXZsAxn01ovVsHy99m5Yx7KTaUQPjj9iYJxI
 IZ3y72sFbPMxrQbli6Qm72OXqmW1TJlOmVGhMcLTAsylDa+wa/9/E9oAq2dDcD+Tw4TV
 K6RQ==
X-Gm-Message-State: AOAM530gwBibmJ4Catll3YrIIEw+fw0H8iBsMRk23ASR+0BtwHc/q8sJ
 gC2YKTgLbSV6PJK2aT/Vubxr0tASq8Pw1g==
X-Google-Smtp-Source: ABdhPJwx7DftFLy/uJveBEvFozElMCAhNwSlUPie2QPKETquGjboOFCsRE7C89bBEUzYTH3kuNoKjw==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr5714572wma.186.1624380917326; 
 Tue, 22 Jun 2021 09:55:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/15] implicit fencing/dma-resv rules for shared buffers
Date: Tue, 22 Jun 2021 18:54:56 +0200
Message-Id: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

After many bits have been spilled on dri-devel discussion this I think
we're converging on a consensus understanding of where we are, and it's
time to resubmit patches.

This is essentially v2 of

https://lore.kernel.org/dri-devel/20210521090959.1663703-7-daniel.vetter@ffwll.ch/

but a lot has changed:

- Christian fixed up amdgpu with a much more competent patch.

- I used the entire audit I've done in that patch to instead improve the
  documentation. That's the first 3 patches.

- panfrost patches fixed (hopefully, testing would be appreciated)

- drm/tiny patch fixed

- I've also thrown an RFC on top at the end for what I think amdgpu should
  be doing. Probably really, really buggy, so beware :-)

Review on the entire pile except the very last RFC very much appreciated.

Note that this does not, by far, fix all the various issues in handling
dma_buf.resv fences. This is just the part I had mostly ready already, and
which didn't take long to refresh and rebase. The other part is checking
whether drivers do anything funny that breaks the cross driver contract in
how they handle dependencies the get from the dma_buf.resv. I know they
do, but the full audit is not yet done.

Cheers, Daniel

Daniel Vetter (15):
  dma-resv: Fix kerneldoc
  dma-buf: Switch to inline kerneldoc
  dma-buf: Document dma-buf implicit fencing/resv fencing rules
  drm/panfrost: Shrink sched_lock
  drm/panfrost: Use xarray and helpers for depedency tracking
  drm/panfrost: Fix implicit sync
  drm/atomic-helper: make drm_gem_plane_helper_prepare_fb the default
  drm/<driver>: drm_gem_plane_helper_prepare_fb is now the default
  drm/armada: Remove prepare/cleanup_fb hooks
  drm/vram-helpers: Create DRM_GEM_VRAM_PLANE_HELPER_FUNCS
  drm/omap: Follow implicit fencing in prepare_fb
  drm/simple-helper: drm_gem_simple_display_pipe_prepare_fb as default
  drm/tiny: drm_gem_simple_display_pipe_prepare_fb is the default
  drm/gem: Tiny kernel clarification for drm_gem_fence_array_add
  RFC: drm/amdgpu: Implement a proper implicit fencing uapi

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  21 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   6 +
 drivers/gpu/drm/armada/armada_overlay.c       |   2 -
 drivers/gpu/drm/armada/armada_plane.c         |  29 ----
 drivers/gpu/drm/armada/armada_plane.h         |   2 -
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   1 -
 drivers/gpu/drm/ast/ast_mode.c                |   3 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  10 ++
 drivers/gpu/drm/drm_gem.c                     |   3 +
 drivers/gpu/drm/drm_gem_atomic_helper.c       |   3 +
 drivers/gpu/drm/drm_simple_kms_helper.c       |  12 +-
 drivers/gpu/drm/gud/gud_drv.c                 |   1 -
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |   3 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |   1 -
 drivers/gpu/drm/imx/ipuv3-plane.c             |   1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   1 -
 drivers/gpu/drm/ingenic/ingenic-ipu.c         |   1 -
 drivers/gpu/drm/mcde/mcde_display.c           |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |   1 -
 drivers/gpu/drm/meson/meson_overlay.c         |   1 -
 drivers/gpu/drm/meson/meson_plane.c           |   1 -
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |   2 -
 drivers/gpu/drm/omapdrm/omap_plane.c          |   3 +
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  41 +++--
 drivers/gpu/drm/panfrost/panfrost_job.c       |  71 ++++-----
 drivers/gpu/drm/panfrost/panfrost_job.h       |   8 +-
 drivers/gpu/drm/pl111/pl111_display.c         |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   1 -
 drivers/gpu/drm/stm/ltdc.c                    |   1 -
 drivers/gpu/drm/sun4i/sun4i_layer.c           |   1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |   1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |   1 -
 drivers/gpu/drm/tidss/tidss_plane.c           |   1 -
 drivers/gpu/drm/tiny/hx8357d.c                |   1 -
 drivers/gpu/drm/tiny/ili9225.c                |   1 -
 drivers/gpu/drm/tiny/ili9341.c                |   1 -
 drivers/gpu/drm/tiny/ili9486.c                |   1 -
 drivers/gpu/drm/tiny/mi0283qt.c               |   1 -
 drivers/gpu/drm/tiny/repaper.c                |   1 -
 drivers/gpu/drm/tiny/st7586.c                 |   1 -
 drivers/gpu/drm/tiny/st7735r.c                |   1 -
 drivers/gpu/drm/tve200/tve200_display.c       |   1 -
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |   3 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |   1 -
 include/drm/drm_gem_vram_helper.h             |  12 ++
 include/drm/drm_modeset_helper_vtables.h      |   7 +-
 include/drm/drm_simple_kms_helper.h           |   7 +-
 include/linux/dma-buf.h                       | 146 +++++++++++++++---
 include/linux/dma-resv.h                      |   2 +-
 include/uapi/drm/amdgpu_drm.h                 |  10 ++
 51 files changed, 270 insertions(+), 170 deletions(-)

-- 
2.32.0.rc2

