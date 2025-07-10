Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B93AFFEB7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603510E36D;
	Thu, 10 Jul 2025 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NJJCaqNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C179110E218
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752141986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=cKLk4Ejj9qsVlEDxN/3XSV0TiAbLt4wlCRkdUpPJP40=;
 b=NJJCaqNh+gsNN/o/cWry58MnYvCYpzDYRL+oONVzEL6yECCm48HFszgQX1f7AVNw1A23x2
 MsevWvcjVwbKEhKhZ9qxUWbtB148on3V5Y2riAE6yuqZc7QrnLb8JPrI2D7L+MbvbF0MJ9
 inlmBilcKrsaYs6kJ8whAeCWExHry4c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-qvBWDEhhNxqYnW8TLeZsFw-1; Thu, 10 Jul 2025 06:06:22 -0400
X-MC-Unique: qvBWDEhhNxqYnW8TLeZsFw-1
X-Mimecast-MFC-AGG-ID: qvBWDEhhNxqYnW8TLeZsFw_1752141981
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-454c2c08d36so5719745e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 03:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752141981; x=1752746781;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cKLk4Ejj9qsVlEDxN/3XSV0TiAbLt4wlCRkdUpPJP40=;
 b=HihKMtRjYGYfAQTo/x/+t0u2js9Nc3vYKfuKBpdAdlGsgGVflunSQCV3U5QNEQtGjP
 VLgEtUrfwtnWmZFf/V/OS/jjPkVnXMWMEYAM03U/tsY55HegsxOLeM4fLugz336btyrP
 0TqPQKTRsWQbnZjRk1uyP7J+vLik6zckkR68dQRhIltvPSLP55v0IYXHNBoDbF13M3Ld
 3UpR0gAdDAhn4/TcLI3Eiv2KbI23vP0w8SoBBkZ9RVro4BnyB8ls3lGlnIrLgJltwGx3
 SsshFC0/hfXlSyM5f0sJ7FkwhFZYrNMheIBZQBstt9Z+jnGFKtd2eH8IoPrXxWsLoCs+
 Masw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCbJIEGTn7Rie6txGMdAOKLkbLn3jxwHGHiEyl3bc19DHil8QPlLgeh8lJVAFW2yoyU9nnDAkALJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc1DKVhVvClvkB5pTrkdtJX0NSEX/ynmIDLDNfzzvtvaTTtr9f
 mzG6bs9rFArnysdzF0nu0fyUFOKVlbuzxd1Tt4fIXZ2+uFDlJDbUyLdCVMnfmZWdeO2hgUP8rxE
 vblcp/l/FolMkBycAr6+phINApWHgiF6Zs8Nx2sQeCABJm5mIFxhJc7d6vCg6VHaeabhtJQ==
X-Gm-Gg: ASbGnctU28Bb+f3wl+IjgjbmcS1DstJy+8CHWqh146KPc3ChCNIkTKiWONMKoY9n3We
 iQNbu4WK8eH9pAlxAIND95kT4QnhAYx6pFA9S2tMEYL3o7qqSPNWpe/xGe98kAxVYDdZRDBXXZl
 iFXhW3/7Xer/JNcchuJ5D6zcbieqsHtPc6pEILZZmAIaXHnDl6zD98vKQMVZLULJw+8bTWMBkmZ
 UT9gwmf1/lpgAF23q2IN1Wb5IEhLQeaRUbXZZkeQSDV4E3KZ3M7O1x1E9TOYZ+I346f1Jj79Q==
X-Received: by 2002:a05:600c:811a:b0:442:ccfa:1461 with SMTP id
 5b1f17b1804b1-454dd21b419mr19525945e9.13.1752141981101; 
 Thu, 10 Jul 2025 03:06:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP8nxKZdo/3rz9jPlN62JBbEZtii+3ngeB7ANH5iBaHmFVDgjQdd2IQwKBd6DD/kWYe71AKQ==
X-Received: by 2002:a05:600c:811a:b0:442:ccfa:1461 with SMTP id
 5b1f17b1804b1-454dd21b419mr19525425e9.13.1752141980552; 
 Thu, 10 Jul 2025 03:06:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e14e82sm1437619f8f.71.2025.07.10.03.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 03:06:20 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:06:19 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20250710-observant-elite-dingo-acfd6d@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bzuvyvhasloi7xeg"
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


--bzuvyvhasloi7xeg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-next PR. It's likely to be the last PR for
this release cycle.

Maxime

drm-misc-next-2025-07-10:
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:
- amdgpu: debugfs improvements
- ast: Improve hardware generations implementation
- dma-buf heaps:
  - Give the CMA heap a stable name
- panthor: fix UAF in debugfs
- rockchip: Convert inno_hdmi to a bridge
- sti: Convert to devm_drm_bridge_alloc()
- vkms: Use faux_device

- bridge:
  - Improve CEC handling code, convertions to devm_drm_bridge_alloc()
The following changes since commit 203dcde881561f1a4ee1084e2ee438fb4522c94a:

  Merge tag 'drm-msm-next-2025-07-05' of https://gitlab.freedesktop.org/drm/msm into drm-next (2025-07-08 14:31:19 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-07-10

for you to fetch changes up to fe69a391808404977b1f002a6e7447de3de7a88e:

  drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code (2025-07-10 10:16:50 +0100)

----------------------------------------------------------------
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:
- amdgpu: debugfs improvements
- ast: Improve hardware generations implementation
- dma-buf heaps:
  - Give the CMA heap a stable name
- panthor: fix UAF in debugfs
- rockchip: Convert inno_hdmi to a bridge
- sti: Convert to devm_drm_bridge_alloc()
- vkms: Use faux_device

- bridge:
  - Improve CEC handling code, convertions to devm_drm_bridge_alloc()

----------------------------------------------------------------
Alessio Belle (1):
      drm/imagination: Clear runtime PM errors while resetting the GPU

Andy Yan (9):
      drm/rockchip: inno_hdmi: Merge register definition to c file
      drm/rockchip: inno_hdmi: Refactor register macros to make checkpatch happy
      drm/rockchip: inno_hdmi: Remove unnecessary parentheses to make checkpatch happy
      drm/rockchip: inno_hdmi: Rename function inno_hdmi_reset to inno_hdmi_init_hw
      drm/rockchip: inno_hdmi: Move ddc/i2c configuration and HOTPLUG unmute to inno_hdmi_init_hw
      drm/rockchip: inno_hdmi: Use sleep_range instead of udelay
      drm/rockchip: inno_hdmi: switch i2c registration to devm functions
      drm/rockchip: inno_hdmi: Simpify clk get/enable by devm_clk_get_enabled api
      drm/rockchip: vop2: Fix the update of LAYER/PORT select registers when there are multi display output on rk3588/rk3568

Chaoyi Chen (2):
      drm/rockchip: lvds: Convert to drm bridge
      drm/rockchip: cdn-dp: Convert to drm bridge

Cristian Ciocaltea (3):
      drm/display: hdmi-cec-helper: Fix adapter unregistration
      drm/bridge: Fix kdoc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
      drm/bridge: adv7511: Fix DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup

Dan Carpenter (1):
      drm/dp: Clean up white space in drm_edp_backlight_probe_state()

Greg Kroah-Hartman (2):
      drm/vkms: convert to use faux_device
      drm/vgem/vgem_drv convert to use faux_device

Heiko Stuebner (1):
      drm/rockchip: vop2: fail cleanly if missing a primary plane for a video-port

Jared Kangas (3):
      Documentation: dma-buf: heaps: Fix code markup
      dma-buf: heaps: Parameterize heap name in __add_cma_heap()
      dma-buf: heaps: Give default CMA heap a fixed name

Juston Li (1):
      gpu/trace: make TRACE_GPU_MEM configurable

Luca Ceresoli (3):
      drm/bridge: tc358767: fix uninitialized variable regression
      drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
      drm/sti: hda: convert to devm_drm_bridge_alloc() API

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Marek Szyprowski (1):
      drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API

Matthew Brost (1):
      drm: Simplify drmm_alloc_ordered_workqueue return

Shixiong Ou (1):
      fbcon: Fix outdated registered_fb reference in comment

Simona Vetter (1):
      drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code

Sunil Khatri (6):
      drm: move drm based debugfs funcs to drm_debugfs.c
      drm: add debugfs support on per client-id basis
      drm/amdgpu: add debugfs support for VM pagetable per client
      drm/amdgpu: add support of debugfs for mqd information
      drm/amdgpu: fix MQD debugfs undefined symbol when DEBUG_FS=n
      drm/amdgpu: fix the logic to validate fpriv and root bo

T.J. Mercier (1):
      dma-buf: system_heap: No separate allocation for attachment sg_tables

Tamir Duberstein (1):
      rust: drm: remove unnecessary imports

Thierry Reding (1):
      drm/fbdev-client: Skip DRM clients if modesetting is absent

Thomas Zimmermann (13):
      drm/gem-shmem: Do not map s/g table by default
      drm/tegra: Test for imported buffers with drm_gem_is_imported()
      drm/tegra: Use dma_buf from GEM object instance
      drm/ast: Declare helpers for POST in header
      drm/ast: Move Gen7+ POST code to separate source file
      drm/ast: Move Gen6+ POST code to separate source file
      drm/ast: Move Gen4+ POST code to separate source file
      drm/ast: Move Gen2+ and Gen1 POST code to separate source files
      drm/ast: Move struct ast_dramstruct to ast_post.h
      drm/ast: Handle known struct ast_dramstruct with helpers
      drm/ast: Split ast_set_def_ext_reg() by chip generation
      drm/ast: Gen7: Disable VGASR0[1] as on Gen4+
      drm/ast: Gen7: Switch default registers to gen4+ state

Tvrtko Ursulin (2):
      drm/sched: De-clutter drm_sched_init
      drm/sched: Consolidate drm_sched_rq_select_entity_rr

Yumeng Fang (1):
      drm/rockchip: dw_hdmi: Use dev_err_probe() to simplify code

 Documentation/userspace-api/dma-buf-heaps.rst      |   11 +-
 drivers/Kconfig                                    |    2 -
 drivers/accel/drm_accel.c                          |   16 -
 drivers/dma-buf/heaps/Kconfig                      |   10 +
 drivers/dma-buf/heaps/cma_heap.c                   |   36 +-
 drivers/dma-buf/heaps/system_heap.c                |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   52 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   55 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |    1 +
 drivers/gpu/drm/ast/Makefile                       |    5 +
 drivers/gpu/drm/ast/ast_2000.c                     |  149 ++
 drivers/gpu/drm/ast/ast_2100.c                     |  348 ++++
 drivers/gpu/drm/ast/ast_2300.c                     | 1328 +++++++++++++
 drivers/gpu/drm/ast/ast_2500.c                     |  569 ++++++
 drivers/gpu/drm/ast/ast_2600.c                     |   44 +
 drivers/gpu/drm/ast/ast_dram_tables.h              |  207 --
 drivers/gpu/drm/ast/ast_drv.c                      |    4 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   17 +-
 drivers/gpu/drm/ast/ast_post.c                     | 2027 +-------------------
 drivers/gpu/drm/ast/ast_post.h                     |   50 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    6 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   40 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |    3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    1 +
 drivers/gpu/drm/clients/drm_client_setup.c         |    5 +
 drivers/gpu/drm/display/drm_dp_helper.c            |   14 +-
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      |    2 +-
 drivers/gpu/drm/drm_debugfs.c                      |  118 +-
 drivers/gpu/drm/drm_drv.c                          |   16 +-
 drivers/gpu/drm/drm_file.c                         |   11 +
 drivers/gpu/drm/drm_internal.h                     |    6 +-
 drivers/gpu/drm/drm_panic_qr.rs                    |    2 +-
 drivers/gpu/drm/imagination/pvr_power.c            |   59 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   31 +-
 drivers/gpu/drm/panthor/panthor_gem.h              |    3 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  291 ++-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |    8 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   16 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  452 ++++-
 drivers/gpu/drm/rockchip/inno_hdmi.h               |  349 ----
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   29 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   33 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   68 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |   89 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   81 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   27 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   26 +-
 drivers/gpu/drm/sti/sti_hdmi.h                     |    2 +
 drivers/gpu/drm/tegra/gem.c                        |    4 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    2 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   30 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    2 -
 drivers/gpu/drm/vkms/vkms_drv.c                    |   28 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    4 +-
 drivers/gpu/trace/Kconfig                          |   11 +-
 drivers/video/Kconfig                              |    2 +
 drivers/video/fbdev/core/fbcon.c                   |    4 +-
 include/drm/drm_accel.h                            |    5 -
 include/drm/drm_bridge.h                           |    2 +-
 include/drm/drm_debugfs.h                          |   11 +
 include/drm/drm_drv.h                              |   19 +-
 include/drm/drm_file.h                             |    7 +
 include/drm/drm_gem_shmem_helper.h                 |   18 +-
 include/drm/drm_managed.h                          |   15 +-
 rust/kernel/drm/driver.rs                          |    1 -
 67 files changed, 3761 insertions(+), 3169 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_2000.c
 create mode 100644 drivers/gpu/drm/ast/ast_2100.c
 create mode 100644 drivers/gpu/drm/ast/ast_2300.c
 create mode 100644 drivers/gpu/drm/ast/ast_2500.c
 create mode 100644 drivers/gpu/drm/ast/ast_2600.c
 delete mode 100644 drivers/gpu/drm/ast/ast_dram_tables.h
 create mode 100644 drivers/gpu/drm/ast/ast_post.h
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h

--bzuvyvhasloi7xeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG+QmwAKCRAnX84Zoj2+
drjXAYCdii//9WtwKswRhFfpfmWun4TTFDscam6Wm8dt/BVGzt5Krit15FzDtMDx
LMh+SYEBf1PiaVOYddzU/GOrmwkvhlVUFD7wPeh5/6+CgR3+amSMIUL4uNClZved
W+xUx8Po3Q==
=FctW
-----END PGP SIGNATURE-----

--bzuvyvhasloi7xeg--

