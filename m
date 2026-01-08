Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF1D01935
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0BC10E6A5;
	Thu,  8 Jan 2026 08:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WSi1xh4Z";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="t3sh2GAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A2E10E6A2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767860790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=/ciEekKvSDtjek2xr+dB+FxgGmcFL6sHdIhER3U7ln0=;
 b=WSi1xh4ZZFYhtbdYPp1x+DGe0lLE06GijV6CHq5TekHa/ioHudndWcrUqknSskBh7Ws1jL
 Ol1hV57VSJpM5Aax6PECv+ocO2l7Jc/seGXJXsIhnkaHQolZmJMfunnmsu0/nsEP1pyNPx
 UW/3rv39yETj2F1HTHyRoR3+7xe29w8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-2_kgb1sYMDS0-JHASvQP5w-1; Thu, 08 Jan 2026 03:26:28 -0500
X-MC-Unique: 2_kgb1sYMDS0-JHASvQP5w-1
X-Mimecast-MFC-AGG-ID: 2_kgb1sYMDS0-JHASvQP5w_1767860787
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779ecc3cc8so20266825e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1767860787; x=1768465587; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ciEekKvSDtjek2xr+dB+FxgGmcFL6sHdIhER3U7ln0=;
 b=t3sh2GAZIEqGqb/QBQ4RJ2J0P43Pk7dd+DKR7Aj95+KRiCsMeo8tfW+kJCCcmTPO4C
 pyAznYU7Td8M2AXJfyl7udk7ZOgMiKJKaL4UYhUem3VYwM4XFH/CGL10G3eDEmKVE0hy
 IV6nf/ZEe9/KxdWZGzQf2ovWk8hStq3qcCxR3fnbdROI+HpncI4CDFaakgbVL2XzzyCK
 uE2HVMPszs4nyPt99LF16vf2k8f9pDTd4F7yzBYDUaatwGWIUCE91raxsw9/UvuTAPLC
 9kyVGDpmL+zlsDOhRcQ3YSweKrJzjEJsV3vpKiQ4fc2wSNLSYpOpwS2mX3RuKB7Tt5PA
 s0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767860787; x=1768465587;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ciEekKvSDtjek2xr+dB+FxgGmcFL6sHdIhER3U7ln0=;
 b=idD52a+2GuhZ/mKrdCWBvtc5W5gGfsgWVesuXK2h0Srcv35rUv8qZpCMLYBjk2u+Ib
 6KF2r9SOPCy/siaP4M6rsYzsG2Yk0mv40T1N0OcTV8kPAZRMvo/l40fp4PPlo04o6u6y
 VPhBaXD/IsZWnBWprPirwUQP90PMvVufdggcNkMWOkFXtSF/OZ1Ua+xxds0KzkPTcHjN
 2lyVtTtFOs1Vv5kiDFHYv1XvF8dC9HhutdkQvtKY3eUh12Fx9DCzcGhoPR5/FF4vXoAN
 6E+7XS0Deu1vbdxdrw0l8qMTuu9x3+VKUyN7wqXmAlRJvUohu1GfAS7AL0aKHGIV9jr6
 K+KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk4IlgeRh4YrPXDNUEghnG4AogLRMmFbFUfYA75NKJZ/MeLY1Gcaxd+MJOKIuJcZQH38VjSyZVneI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaFKQxmCckQWsLSAjAC24YShCo/+ggvW7oLTVbzzg9B/7kZPwt
 D9A8JtnsLIQjrA3MdRjzOZCh7UsoVu1vZTrXhhDl+7MrEsfDrk2edW9uK8pEbNg+rCAga8+9zKx
 uPSrg4IpaL/aBnAYRuzx7V6GYsDN8jxsai/A4d/J3zCAdi7QMO1j0G6ZRElLOlvU3RMeFpXkF/q
 fU3g==
X-Gm-Gg: AY/fxX6vfH4OweHZT1Qx7Oz4Ns7xajtW9TOajM94CtWprxktHqq8mXQnnA3C3ZGKO/o
 IdJi0Rns/4yeKmgTpkG/5ReMeW9xGmY+uDZ+BQ6R4ryJ7rxeotDoIFKFSx+Cw0cXI2IBlTrOM33
 JfSLD/mgqiG9oWijJTSdiGlCH7/gEHDFSTJ5Bq+rvLjTgiFsQgmjp+mV/BKRlnAU8bMHAx2McKf
 VGGSI695v4JoXOXardLd8ykVNZX0jiEco7dyGmrScT3ywopCL1K0U5xSkpm6/je57l7YwYukMZt
 yJ8dYFO5CG982yWQTgpXTgxt2tMOyxtwk46uFbGcdc3g5+XwQNtG/UMxzq5nIQ==
X-Received: by 2002:a05:600c:1988:b0:477:fad:acd9 with SMTP id
 5b1f17b1804b1-47d84b54025mr53556405e9.34.1767860786900; 
 Thu, 08 Jan 2026 00:26:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnXPDy1sxFKFhhMcSwFNGFUc/GK/Qz9o8f+THE15OZf0OqXouxHk+BSMhStOReZR8yzb4N3Q==
X-Received: by 2002:a05:600c:1988:b0:477:fad:acd9 with SMTP id
 5b1f17b1804b1-47d84b54025mr53556125e9.34.1767860786349; 
 Thu, 08 Jan 2026 00:26:26 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e199bsm14999855f8f.16.2026.01.08.00.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:26:25 -0800 (PST)
Date: Thu, 8 Jan 2026 09:26:25 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20260108-literate-nyala-of-courtesy-de501a@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rpzmdoo344mwnsls"
Content-Disposition: inline
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


--rpzmdoo344mwnsls
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Sima,

Happy new year!

Here's the first drm-misc-next PR for 2026.

Thanks
Maxime

drm-misc-next-2026-01-08:
drm-misc-next for 6.20:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - draw: Add API to check if a format conversion can be done
  - panic: Rename draw_panic_static_* to draw_panic_screen_*, Add kunit
    tests
  - shmem: Improve tests

Driver Changes:
  - ast: Big endian fixes
  - etnaviv: Add PPU flop reset support
  - panfrost: Add GPU_PM_RT support for RZ/G3E SoC
  - panthor: multiple fixes around VM termination, huge page support
  - pl111: Fix build regression
  - v3d: Fix DMA segment size

  - bridge:
    - Add connector argument to .hpd_notify
    - Plenty of patches to convert existing drivers to refcounting
    - Convert Rockchip's inno hdmi support to a proper bridge
    - lontium-lt9611uxc: Switch to HDMI audio helpers

  - panel:
    - New panel: BOE NV140WUM-T08
The following changes since commit 332070795bd96193756cb4446eddc3ec9ff6a0e8:

  accel/amdxdna: Enable hardware context priority (2025-12-18 10:36:44 -080=
0)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
6-01-08

for you to fetch changes up to 6a0b99e9fb45f403c3097a9047963d2dd5b0fab2:

  drm/etnaviv: Add module parameter to force PPU flop reset (2026-01-06 16:=
43:19 +0100)

----------------------------------------------------------------
drm-misc-next for 6.20:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - draw: Add API to check if a format conversion can be done
  - panic: Rename draw_panic_static_* to draw_panic_screen_*, Add kunit
    tests
  - shmem: Improve tests

Driver Changes:
  - ast: Big endian fixes
  - etnaviv: Add PPU flop reset support
  - panfrost: Add GPU_PM_RT support for RZ/G3E SoC
  - panthor: multiple fixes around VM termination, huge page support
  - pl111: Fix build regression
  - v3d: Fix DMA segment size

  - bridge:
    - Add connector argument to .hpd_notify
    - Plenty of patches to convert existing drivers to refcounting
    - Convert Rockchip's inno hdmi support to a proper bridge
    - lontium-lt9611uxc: Switch to HDMI audio helpers

  - panel:
    - New panel: BOE NV140WUM-T08

----------------------------------------------------------------
Adri=E1n Larumbe (1):
      drm/panthor: Support partial unmaps of huge pages

Andy Yan (2):
      drm/rockchip: inno-hdmi: Convert to drm bridge
      MAINTAINERS: Add entry for Innosilicon hdmi bridge library

Arnd Bergmann (1):
      drm: pl111: fix build regression

Biju Das (1):
      drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC

Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

Francesco Valla (3):
      drm/draw: add drm_draw_can_convert_from_xrgb8888
      drm/log: avoid WARN when searching for usable format
      drm/panic: avoid WARN when checking format support

Gert Wollny (5):
      drm/etnaviv: Add command stream definitions required for a PPU flop r=
eset
      drm/etnaviv: move some functions to a header to be able to use them e=
xternally
      drm/etnaviv: Add a new function to emit a series of states to cmd str=
eam
      drm/etnaviv: Add PPU flop reset
      drm/etnaviv: Add module parameter to force PPU flop reset

Hans de Goede (1):
      drm/panel: edp: add BOE NV140WUM-T08 panel

Jani Nikula (1):
      drm/atomic: convert drm_atomic_get_{old, new}_colorop_state() into pr=
oper functions

Jocelyn Falempe (2):
      drm/panic: Rename draw_panic_static_* to draw_panic_screen_*
      drm/panic: Add kunit tests for drm_panic

Ketil Johnsen (1):
      drm/panthor: Evict groups before VM termination

Luca Ceresoli (18):
      drm/bridge: add of_drm_find_and_get_bridge()
      drm/bridge: deprecate of_drm_find_bridge()
      drm/todo: add entry about converting to of_drm_find_and_get_bridge()
      drm/bridge: make of_drm_find_bridge() a wrapper of of_drm_find_and_ge=
t_bridge()
      drm/arcpgu: convert to of_drm_find_and_get_bridge()
      drm/bridge: add next_bridge pointer to struct drm_bridge
      drm/bridge: ite-it66121: get/put the next bridge
      drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge
      drm/bridge: simple-bridge: get/put the next bridge
      drm/meson: encoder_cvbs: get/put the next bridge
      drm/meson: encoder_dsi: get/put the next bridge
      drm/meson: encoder_hdmi: get/put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers
      drm/bridge: imx8qxp-pxl2dpi: remove excess error message
      drm/bridge: imx8qxp-pxl2dpi: imx8qxp_pxl2dpi_find_next_bridge: return=
 int, not ERR_PTR
      drm/bridge: imx8qxp-pxl2dpi: get/put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: get/put the companion bridge
      drm/bridge: imx8qxp-pixel-link: remove excess error message

Martin Blumenstingl (1):
      drm/meson: venc: add support for HDMI DMT modes up to 3840x2160

Ren=E9 Rebe (1):
      drm/ast: Swap framebuffer writes on big-endian machines

Thomas Zimmermann (7):
      drm/tests: shmem: Swap names of export tests
      drm/tests: shmem: Add clean-up action to unpin pages
      drm/tests: shmem: Hold reservation lock around vmap/vunmap
      drm/tests: shmem: Hold reservation lock around madvise
      drm/tests: shmem: Hold reservation lock around purge
      vt: Remove trailing whitespace
      vt: Remove con_debug_enter/_leave from struct consw

Xiaolei Wang (1):
      drm/v3d: Set DMA segment size to avoid debug warnings

 Documentation/gpu/todo.rst                         |  16 +
 MAINTAINERS                                        |   9 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   3 +
 drivers/gpu/drm/ast/ast_cursor.c                   |  11 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  11 +-
 drivers/gpu/drm/bridge/Kconfig                     |   7 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   9 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   9 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  63 ++-
 .../{rockchip/inno_hdmi.c =3D> bridge/inno-hdmi.c}   | 504 ++++++---------=
------
 drivers/gpu/drm/bridge/ite-it66121.c               |   7 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         | 125 ++---
 drivers/gpu/drm/bridge/simple-bridge.c             |  15 +-
 drivers/gpu/drm/clients/drm_log.c                  |   2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   2 +-
 drivers/gpu/drm/drm_atomic.c                       |  32 ++
 drivers/gpu/drm/drm_atomic_helper.c                |   1 +
 drivers/gpu/drm/drm_bridge.c                       |  69 ++-
 drivers/gpu/drm/drm_draw.c                         |  29 ++
 drivers/gpu/drm/drm_draw_internal.h                |   2 +
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  63 +++
 drivers/gpu/drm/drm_panic.c                        |  24 +-
 drivers/gpu/drm/etnaviv/Makefile                   |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |  75 +--
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h           |  99 ++++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   3 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |   3 +
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c       | 224 +++++++++
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h       |  21 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  11 +
 drivers/gpu/drm/etnaviv/state_3d.xml.h             |  95 ++++
 drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   7 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   7 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  10 +-
 drivers/gpu/drm/meson/meson_venc.c                 |   4 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   1 +
 drivers/gpu/drm/panel/panel-edp.c                  |   7 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   5 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              | 104 ++++-
 drivers/gpu/drm/panthor/panthor_sched.c            |  14 +
 drivers/gpu/drm/panthor/panthor_sched.h            |   1 +
 drivers/gpu/drm/pl111/pl111_nomadik.c              |   1 +
 drivers/gpu/drm/rockchip/Kconfig                   |   1 +
 drivers/gpu/drm/rockchip/Makefile                  |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c      | 189 ++++++++
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |  30 +-
 drivers/gpu/drm/tests/drm_panic_test.c             | 221 +++++++++
 drivers/gpu/drm/tiny/arcpgu.c                      |   5 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   2 +
 drivers/gpu/drm/vkms/vkms_composer.c               |   1 +
 drivers/gpu/drm/vkms/vkms_drv.c                    |   1 +
 drivers/tty/vt/vt.c                                |  32 +-
 include/drm/bridge/inno_hdmi.h                     |  33 ++
 include/drm/drm_atomic.h                           |  39 +-
 include/drm/drm_bridge.h                           |  17 +
 include/drm/drm_gem_shmem_helper.h                 |  11 +
 include/linux/console.h                            |   8 -
 61 files changed, 1590 insertions(+), 716 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c =3D> bridge/inno-hdmi.c} (69%)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
 create mode 100644 include/drm/bridge/inno_hdmi.h

--rpzmdoo344mwnsls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaV9qMAAKCRAnX84Zoj2+
dvpGAX0ZbOJ9mmRLm2OeTXypYLSUXE+LqQ6JYgWzmv6kQN4t6w6sdghwEPEaDm7S
Sqp/ANYBf0WoKK+sXGZ/vMI99S4GqCEUwQ+NrKxsDpsZB2vqGdIGhZPfQyGw40YT
U7RxT2vdEQ==
=vKIP
-----END PGP SIGNATURE-----

--rpzmdoo344mwnsls--

