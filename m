Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088BB065E8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 20:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8597A10E62C;
	Tue, 15 Jul 2025 18:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IJeS5Fs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46E710E626;
 Tue, 15 Jul 2025 18:21:30 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-237d849253fso6322615ad.1; 
 Tue, 15 Jul 2025 11:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752603690; x=1753208490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SgUodSXjfN+287E/q1/BCnzkqpO2qkw8e+hTlepDgVU=;
 b=IJeS5Fs1946M8P0/AMuRLpmvbI2J8J8S5coG2LMdqzNhCwp1Q957RBMK5/l6UMrTZH
 v9tv0v96d8MX5aLgdtbHgu64XtxramlF8+fWXUsEEEP4yWiZonZANqT1aujeMc1hsxHn
 sMEbMU3ApkmUTnAvZYROslF4OxpO6WFZ7nNNEcS8ydp6OQMi/aG5fgk/E0oVFM0+yUEH
 bSH4+p3o6/xBMPX4rg2urIe4BHXR8XHmP3vRghl55M73F1dWRrKipMDKx4VRJCTQBxtt
 bUO1SxLxbGokQ+U3Xoe2k4kfbXCRa/zaWTWI3NkplhpJ3nhsf6rGmsrA91mRF4AQUiTd
 ql6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752603690; x=1753208490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SgUodSXjfN+287E/q1/BCnzkqpO2qkw8e+hTlepDgVU=;
 b=UnVvb821UNkQx2tZs20/HOm5dfjz9Ogh0MeuKk7aZgAqAOaZrMyHf4SqQnYDM1yrDH
 SBW7SjDp11vakx4rHUDahr1fJHdfaQePoyvNomyO3xGzpSW986OME0JhEaC7bGK18rja
 cKyGMDgfe/IrVRu1zfQHH35X4WFCjli1HE+JGVY9RWHgjvlfJfephKHPh9ICtLAbRFCH
 O7Eqvi/ght0cuoEtwnwTzp7+Y4Kpd6tJ37sIS55mDVQLn1j4STGZx4Kq0Fn2yC0XVJWa
 HC/5Afiqh2fjNGT6Z9lxG/9HDTrE80mnTb4bkPItLBa7FIjtTNC323RmIcaOX6Yyp27o
 8Hrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuOhaNS1UWgBoHAtRibJb5iJqiQo20KGBL7LpDSeXsgc9QxcyR1W472jVBrpk2qhEaqI3HYI02HEQ=@lists.freedesktop.org,
 AJvYcCW59GUUBH0LYdIHi3LIir1nXFK2OxLbMILB+DucfzJWj/ipUpT1iI8+oXEXvfqLf8HTBB19JjhW6ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgxf0BY398fv7zN9WzCo+LR7bU7upk6RX8Qdb2HMT1/Ls7YFIj
 ue2VLpLYlEF6M3nlIiCwksv0fYC5kMeKwcMVvbmA9yDt8Myj6gs7316drpEsOiQykuk3XqhNPOt
 zpRH4OnMJWYB1+pqp5j4INoLDi5QawX6hPw==
X-Gm-Gg: ASbGncuNLK52a2sI1AoZJrXF7rXGopOUaZmPgVN3BNvCC5m4I17M77iKmcqz1SnoqFk
 JARsP1QNyXUzXoLbSQ2PfqtppWUvafB+ZdJzVBpDGzFcV0UgsnScp1KeBluWWhMKbEh0dZAE2sN
 z8lylGA+8YaW95zsB0KNrq1s4l6RTmFRNUabVUAQMM4npuFzc+G0eBFuKVMOr9DfJRRYQwg/1xU
 r17BEb6
X-Google-Smtp-Source: AGHT+IGfXRxsFa4iLHjJ42dXTDKBnChXJA/a7eUhaH3kLnYYV1dWMrGaEoprBBiPnVZI3g9VonLht1YujFFO39vLTbE=
X-Received: by 2002:a17:90a:c106:b0:314:29ff:6845 with SMTP id
 98e67ed59e1d1-31c9e76b7e1mr88015a91.4.1752603690254; Tue, 15 Jul 2025
 11:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Jul 2025 14:21:18 -0400
X-Gm-Features: Ac12FXyBbFkUWvkmSEe4JT_b-Vd-BUkACU7WkUS998DYFQKczMnVUSeREHmsTBY
Message-ID: <CADnq5_Nu1aguqutQsRZZ3TMgWTzTdsR69Ysht9FP5GRQ8JA5pg@mail.gmail.com>
Subject: Re: [PATCH 00/19] drm: Eliminate redundant drm_format_info lookups
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 10, 2025 at 12:44=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> I noticed a bunch of redundant (and rather expensive) drm_format_info
> lookups in some traces recently. This series is an attempt to eliminate
> them.

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take the amdgpu/radeon bits through drm-misc.

Alex

>
> Ville Syrj=C3=A4l=C3=A4 (19):
>   drm: Pass pixel_format+modifier to .get_format_info()
>   drm: Pass pixel_format+modifier directly to drm_get_format_info()
>   drm: Look up the format info earlier
>   drm: Pass the format info to .fb_create()
>   drm: Allow the caller to pass in the format info to
>     drm_helper_mode_fill_fb_struct()
>   drm/malidp: Pass along the format info from .fb_create()
>     malidp_verify_afbc_framebuffer_size()
>   drm/gem: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/gem/afbc: Eliminate redundant drm_get_format_info()
>   drm/amdgpu: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/armada: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/exynos: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/gma500: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/i915: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/komeda: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/msm: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/tegra: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/virtio: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/vmwgfx: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm: Make passing of format info to drm_helper_mode_fill_fb_struct()
>     mandatory
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  2 +-
>  .../arm/display/komeda/komeda_framebuffer.c   |  3 +-
>  .../arm/display/komeda/komeda_framebuffer.h   |  1 +
>  drivers/gpu/drm/arm/malidp_drv.c              | 12 +++---
>  drivers/gpu/drm/armada/armada_fb.c            | 12 +++---
>  drivers/gpu/drm/armada/armada_fb.h            |  4 +-
>  drivers/gpu/drm/armada/armada_fbdev.c         |  5 ++-
>  drivers/gpu/drm/drm_fourcc.c                  |  7 ++--
>  drivers/gpu/drm/drm_framebuffer.c             | 27 ++++++-------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 38 ++++++++-----------
>  drivers/gpu/drm/drm_modeset_helper.c          |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  7 ++--
>  drivers/gpu/drm/exynos/exynos_drm_fb.h        |  1 +
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  5 ++-
>  drivers/gpu/drm/gma500/fbdev.c                |  5 ++-
>  drivers/gpu/drm/gma500/framebuffer.c          | 14 ++++---
>  drivers/gpu/drm/gma500/psb_drv.h              |  1 +
>  drivers/gpu/drm/i915/display/intel_fb.c       | 18 +++++----
>  drivers/gpu/drm/i915/display/intel_fb.h       |  5 ++-
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 ++-
>  .../drm/i915/display/intel_plane_initial.c    |  3 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  5 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
>  drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
>  drivers/gpu/drm/msm/msm_fb.c                  | 18 +++++----
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  9 +----
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  6 ++-
>  drivers/gpu/drm/nouveau/nouveau_display.h     |  1 +
>  drivers/gpu/drm/omapdrm/omap_fb.c             | 10 ++---
>  drivers/gpu/drm/omapdrm/omap_fb.h             |  3 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  3 +-
>  drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_fbdev.c         |  3 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  3 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 +-
>  .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  3 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 11 ++----
>  drivers/gpu/drm/tegra/drm.h                   |  2 +
>  drivers/gpu/drm/tegra/fb.c                    |  7 ++--
>  drivers/gpu/drm/tegra/fbdev.c                 |  4 +-
>  drivers/gpu/drm/tests/drm_framebuffer_test.c  |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  3 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  6 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 +++++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  1 +
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  6 ++-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  3 +-
>  drivers/gpu/drm/xlnx/zynqmp_kms.c             |  3 +-
>  include/drm/drm_fourcc.h                      |  2 +-
>  include/drm/drm_gem_framebuffer_helper.h      |  6 +++
>  include/drm/drm_mode_config.h                 |  3 +-
>  include/drm/drm_modeset_helper.h              |  2 +
>  56 files changed, 207 insertions(+), 139 deletions(-)
>
> --
> 2.49.0
>
