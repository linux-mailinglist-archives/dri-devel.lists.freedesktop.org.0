Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59817ADFDB2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 08:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BB910E9AC;
	Thu, 19 Jun 2025 06:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cQqK2B7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE88A10E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750315162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=p5enKuiqyRGMmsEPAdTXolzNCfuZy/BY1RSK8455g0s=;
 b=cQqK2B7ZZi8cfQ0ShxNPqhkBThwmHhs1UOoH0jVKGNx3MfkL+uZ1WUCm4rgsWUV27Ds6f5
 xqvYTfLeSG49rA744fd+c5vLdRxfjtOyxPoFNj1tfhoxCxyttaRo9RTgIoLZ1GvQaSfdXz
 35RQD+/e4mCnK2EwhCT3mcW7ZoZI2G4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-EGOCCSUIN6yE9z-ZF_YRCw-1; Thu, 19 Jun 2025 02:39:18 -0400
X-MC-Unique: EGOCCSUIN6yE9z-ZF_YRCw-1
X-Mimecast-MFC-AGG-ID: EGOCCSUIN6yE9z-ZF_YRCw_1750315157
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450787c8626so3212895e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 23:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750315157; x=1750919957;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5enKuiqyRGMmsEPAdTXolzNCfuZy/BY1RSK8455g0s=;
 b=xBhWTFooXAL5H/mZ+ErJ/DXPEogCb6xUcrjKHkmtULgkhIIjxzU0Monc+Q2IAJl/Ff
 if6XVtDTZeBILHWagU/fw6tw1qPQWZ0EMElgkuUKTAC65Of8QVxgeLwfdKe/O8xR74qd
 rSTQFINqYMdmZ+hKkl/N9HSUh4KXzIQvv8G/HpEpH7vTNYi1xaAeBQl3AZFMKto3GTrm
 XyceIS8ao42TEAQjB2efu5LW9NumCVAUtsRqHRaIXrzKApeCwC8ICKFvtFuM4WNBlpNf
 smUPu6/lhD9j5kx8MB4pQqQqVr/0kS1mGC3GfCKGZ+WMyq3iL+rhbgvdWMiOnHhVgVfg
 YKQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxtewBZsUje/Wujh49vlJnWH9ahOpFQ2tTcVtqLh3MfvssuldAtCoURTqSdl0H0DDti46Tgb1c6F0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCfGKjTCzu3v4NzzWq4MN1b8vDZDTf7W3AHxzGUdZf4uj7HL1J
 q+r3ynYAs4faRK1RNZjF9m63Szsp5wtjhFA2mjAnmyRIKY2zHUKRNesPAGD6qkISxO16INn4zjJ
 HMQEFwCWV4G2Xr0PD7SdDV069zGd5JaY9TqQYBFC7WhzxMqTH4+hoj2RJ23KQUoiXKNw7bw==
X-Gm-Gg: ASbGncuuw13UR4Pn2KZUtdlGoGoZfKVUSVppg5F7nrHEXm44rfmypuF1ZoGvJe/U3J2
 NbBleqHuVXHuSTcs0E2bHEtyd6w91S2ezKcPkOnIBv2sJENjyRAz8e8x9wzGVfXdvvlrPgaQX8g
 eWF4JHgESh891ucWpPV+iJE+9jzWt1zweEGbDtmq5n38p/ZlSZFSAFeCpN06umagGjeZUXqGMQA
 9iisdRt3m8yywUmv9w/Jkx8x/dgUYTY+vBCqJ/R9YCUUFzLKcrPPJXgHt0w0WnVprjG6tB+KQ==
X-Received: by 2002:a05:600c:529b:b0:43d:97ea:2f4 with SMTP id
 5b1f17b1804b1-4533caf5b1amr190948695e9.12.1750315157190; 
 Wed, 18 Jun 2025 23:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD6N+KfXImSt0Y6dhtlqz4sqW9hlH/ehek4UYK81qLYOfmhzPe0CczrO2UJ8jaLd0/rb+CDA==
X-Received: by 2002:a05:600c:529b:b0:43d:97ea:2f4 with SMTP id
 5b1f17b1804b1-4533caf5b1amr190948415e9.12.1750315156688; 
 Wed, 18 Jun 2025 23:39:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b1bc97sm18804299f8f.68.2025.06.18.23.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 23:39:15 -0700 (PDT)
Date: Thu, 19 Jun 2025 08:39:15 +0200
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
Message-ID: <20250619-perfect-industrious-whippet-8ed3db@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="amohce7r5zhie2wj"
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


--amohce7r5zhie2wj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next PR.

Maxime

drm-misc-next-2025-06-19:
drm-misc-next for 6.17:

UAPI Changes:
- Add Task Information for the wedge API

Cross-subsystem Changes:

Core Changes:
- Fix warnings related to export.h
- fbdev: Make CONFIG_FIRMWARE_EDID available on all architectures
- fence: Fix UAF issues
- format-helper: Improve tests

Driver Changes:
- ivpu: Add turbo flag, Add Wildcat Lake Support
- rz-du: Improve MIPI-DSI Support
- vmwgfx: fence improvement
The following changes since commit c5b4393c5492555e35c08677a326c9c53b275abd:

  drm/file: add client id to drm_file_error (2025-06-12 14:33:51 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
5-06-19

for you to fetch changes up to 1a45ef022f0364186d4fb2f4e5255dcae1ff638a:

  drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers (2025=
-06-18 10:46:03 +0200)

----------------------------------------------------------------
drm-misc-next for 6.17:

UAPI Changes:
- Add Task Information for the wedge API

Cross-subsystem Changes:

Core Changes:
- Fix warnings related to export.h
- fbdev: Make CONFIG_FIRMWARE_EDID available on all architectures
- fence: Fix UAF issues
- format-helper: Improve tests

Driver Changes:
- ivpu: Add turbo flag, Add Wildcat Lake Support
- rz-du: Improve MIPI-DSI Support
- vmwgfx: fence improvement

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Add turbo flag to the DRM_IVPU_CMDQ_CREATE ioctl

Andr=E9 Almeida (6):
      drm: amdgpu: Allow NULL pointers at amdgpu_vm_put_task_info()
      drm: amdgpu: Create amdgpu_vm_print_task_info()
      drm: Create a task info option for wedge events
      drm/doc: Add a section about "Task information" for the wedge API
      drm: amdgpu: Use struct drm_wedge_task_info inside of struct amdgpu_t=
ask_info
      drm/amdgpu: Make use of drm_wedge_task_info

Arnd Bergmann (1):
      drm: omapdrm: reduce clang stack usage

Bartosz Golaszewski (1):
      drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks

Christian K=F6nig (2):
      drm/prime: remove drm_prime_lookup_buf_by_handle
      Revert "drm/prime: remove drm_prime_lookup_buf_by_handle"

Ian Forbes (3):
      drm/vmwgfx: Update last_read_seqno under the fence lock
      drm/vmwgfx: Implement dma_fence_ops properly
      drm/vmwgfx: Fix Host-Backed userspace on Guest-Backed kernel

Jerome Brunet (1):
      drm/bridge: ti-sn65dsi86: use the auxiliary device

Lad Prabhakar (9):
      drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
      drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
      drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
      drm: renesas: rz-du: mipi_dsi: Add OF data support
      drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for =
RZ/V2H(P)
      drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculatio=
ns
      drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
      drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V=
2H(P)
      drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring =
VCLK and mode validation

Lizhi Hou (1):
      accel/amdxdna: Revise device bo creation and free

Maciej Falkowski (1):
      accel/ivpu: Add initial Wildcat Lake support

Ma=EDra Canal (1):
      drm/vkms: Compile all tests with CONFIG_DRM_VKMS_KUNIT_TEST

Thomas Zimmermann (30):
      drm/format-helper: Normalize BT.601 factors to 256
      drm/format-helper: Update tests after BT.601 changes
      drm: Do not include <linux/export.h>
      drm: Include <linux/export.h>
      drm/bridge: Include <linux/export.h>
      drm/client: Include <linux/export.h>
      drm/display: Include <linux/export.h>
      drm/gem: Include <linux/export.h>
      drm/panel: Include <linux/export.h>
      drm/scheduler: Include <linux/export.h>
      drm/ttm: Include <linux/export.h>
      fbdev: Remove trailing whitespaces
      fbdev: Include <linux/export.h>
      fbdev/c2p: Include <linux/export.h>
      fbdev/cyber2000fb: Unexport symbols
      fbdev/matroxfb: Remove trailing whitespaces
      fbdev/matroxfb: Include <linux/export.h>
      fbdev/omap: Include <linux/export.h>
      fbdev/omap2: Include <linux/export.h>
      fbdev/omap2: Do not include <linux/export.h>
      fbdev/mb862xx: Do not include <linux/export.h>
      fbdev/pxafb: Unexport symbol
      fbdev/sisfb: Unexport symbols
      fbdev/viafb: Include <linux/export.h>
      fbdev/viafb: Do not include <linux/export.h>
      video: Make CONFIG_FIRMWARE_EDID generally available
      video: Make global edid_info depend on CONFIG_FIRMWARE_EDID
      drm/tests: Do not use drm_fb_blit() in format-helper tests
      drm/tests: Test drm_fb_build_fourcc_list() in separate test suite
      drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers

Tvrtko Ursulin (4):
      sync_file: Protect access to driver and timeline name
      drm/i915: Protect access to driver and timeline name
      dma-fence: Add safe access helpers and document the rules
      drm/xe: Make dma-fences compliant with the safe access rules

 Documentation/gpu/drm-uapi.rst                     |  17 +
 arch/x86/kernel/setup.c                            |   4 +
 drivers/accel/amdxdna/aie2_ctx.c                   |   2 +-
 drivers/accel/amdxdna/amdxdna_gem.c                | 191 ++++----
 drivers/accel/amdxdna/amdxdna_gem.h                |   3 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   1 +
 drivers/accel/ivpu/ivpu_drv.h                      |  14 +-
 drivers/accel/ivpu/ivpu_hw_ip.c                    |   1 +
 drivers/accel/ivpu/ivpu_job.c                      |  81 ++--
 drivers/dma-buf/dma-fence.c                        | 111 ++++-
 drivers/dma-buf/sync_file.c                        |  24 +-
 drivers/gpu/drm/Kconfig.debug                      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   8 +-
 .../gpu/drm/bridge/analogix/analogix-i2c-dptx.c    |   2 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c                |   1 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   2 +
 drivers/gpu/drm/bridge/panel.c                     |   1 +
 drivers/gpu/drm/bridge/samsung-dsim.c              |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  67 +--
 drivers/gpu/drm/clients/drm_client_setup.c         |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |   1 +
 drivers/gpu/drm/display/drm_dp_aux_bus.c           |   1 +
 drivers/gpu/drm/display/drm_dp_cec.c               |   1 +
 drivers/gpu/drm/display/drm_dp_helper.c            |   1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   1 +
 drivers/gpu/drm/display/drm_dp_tunnel.c            |   1 +
 drivers/gpu/drm/display/drm_dsc_helper.c           |   1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |   1 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      |   1 +
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |   1 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   2 +
 drivers/gpu/drm/display/drm_scdc_helper.c          |   1 +
 drivers/gpu/drm/drm_atomic.c                       |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |   1 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   1 +
 drivers/gpu/drm/drm_auth.c                         |   1 +
 drivers/gpu/drm/drm_bridge.c                       |   1 +
 drivers/gpu/drm/drm_bridge_helper.c                |   2 +
 drivers/gpu/drm/drm_buddy.c                        |   1 +
 drivers/gpu/drm/drm_client.c                       |   1 +
 drivers/gpu/drm/drm_client_event.c                 |   1 +
 drivers/gpu/drm/drm_client_modeset.c               |   2 +
 drivers/gpu/drm/drm_color_mgmt.c                   |   1 +
 drivers/gpu/drm/drm_connector.c                    |   1 +
 drivers/gpu/drm/drm_damage_helper.c                |   2 +
 drivers/gpu/drm/drm_debugfs_crc.c                  |   1 +
 drivers/gpu/drm/drm_drv.c                          |  22 +-
 drivers/gpu/drm/drm_edid.c                         |   1 +
 drivers/gpu/drm/drm_exec.c                         |   2 +
 drivers/gpu/drm/drm_fb_dma_helper.c                |   2 +
 drivers/gpu/drm/drm_fb_helper.c                    |   1 +
 drivers/gpu/drm/drm_fbdev_dma.c                    |   1 +
 drivers/gpu/drm/drm_fbdev_shmem.c                  |   1 +
 drivers/gpu/drm/drm_fbdev_ttm.c                    |   1 +
 drivers/gpu/drm/drm_file.c                         |   1 +
 drivers/gpu/drm/drm_flip_work.c                    |   1 +
 drivers/gpu/drm/drm_format_helper.c                | 247 ++++------
 drivers/gpu/drm/drm_format_internal.h              |  10 +-
 drivers/gpu/drm/drm_gem.c                          |   1 +
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   1 +
 drivers/gpu/drm/drm_gem_ttm_helper.c               |   1 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   1 +
 drivers/gpu/drm/drm_gpusvm.c                       |   1 +
 drivers/gpu/drm/drm_gpuvm.c                        |   1 +
 drivers/gpu/drm/drm_managed.c                      |   1 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |   1 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |   1 +
 drivers/gpu/drm/drm_mode_config.c                  |   1 +
 drivers/gpu/drm/drm_modeset_helper.c               |   2 +
 drivers/gpu/drm/drm_modeset_lock.c                 |   2 +
 drivers/gpu/drm/drm_panel.c                        |   1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |   1 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   1 +
 drivers/gpu/drm/drm_panic.c                        |   1 +
 drivers/gpu/drm/drm_pci.c                          |   1 -
 drivers/gpu/drm/drm_plane.c                        |   1 +
 drivers/gpu/drm/drm_plane_helper.c                 |   1 +
 drivers/gpu/drm/drm_print.c                        |   1 +
 drivers/gpu/drm/drm_privacy_screen.c               |   1 +
 drivers/gpu/drm/drm_self_refresh_helper.c          |   1 +
 drivers/gpu/drm/drm_simple_kms_helper.c            |   1 +
 drivers/gpu/drm/drm_suballoc.c                     |   2 +
 drivers/gpu/drm/drm_syncobj.c                      |   1 +
 drivers/gpu/drm/drm_vblank_work.c                  |   2 +
 drivers/gpu/drm/drm_vma_manager.c                  |   1 +
 drivers/gpu/drm/drm_writeback.c                    |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |  10 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   3 +-
 drivers/gpu/drm/i915/i915_request.c                |   7 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |  10 +-
 drivers/gpu/drm/lib/drm_random.c                   |   1 +
 drivers/gpu/drm/omapdrm/dss/dispc.c                |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     | 151 ++++--
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h    |   2 -
 drivers/gpu/drm/scheduler/sched_entity.c           |   1 +
 drivers/gpu/drm/scheduler/sched_fence.c            |   1 +
 drivers/gpu/drm/scheduler/sched_main.c             |   1 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   4 +
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          | 138 ++++++
 drivers/gpu/drm/sysfb/efidrm.c                     |   6 +-
 drivers/gpu/drm/sysfb/ofdrm.c                      |   5 +-
 drivers/gpu/drm/sysfb/simpledrm.c                  |   5 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |   6 +-
 drivers/gpu/drm/tests/Makefile                     |   3 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     | 262 +----------
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |   1 +
 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c     | 168 +++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |   3 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c       |   3 +
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |   1 +
 drivers/gpu/drm/ttm/ttm_backup.c                   |   2 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |   1 +
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   2 +
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   2 +
 drivers/gpu/drm/ttm/ttm_device.c                   |   1 +
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |   2 +
 drivers/gpu/drm/ttm/ttm_pool.c                     |   1 +
 drivers/gpu/drm/ttm/ttm_range_manager.c            |   2 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |   1 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |   1 +
 drivers/gpu/drm/vkms/tests/Makefile                |   7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  19 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |  29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              | 510 +++--------------=
----
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h              |  21 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |  61 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |   2 +-
 drivers/gpu/drm/xe/xe_device.c                     |   3 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   7 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |   3 +
 drivers/video/Kconfig                              |  18 +-
 drivers/video/fbdev/c2p_iplan2.c                   |   1 +
 drivers/video/fbdev/c2p_planar.c                   |   1 +
 drivers/video/fbdev/core/Kconfig                   |  15 -
 drivers/video/fbdev/core/cfbcopyarea.c             |   2 +
 drivers/video/fbdev/core/cfbfillrect.c             |   2 +
 drivers/video/fbdev/core/cfbimgblt.c               |   2 +
 drivers/video/fbdev/core/fb_ddc.c                  |   1 +
 drivers/video/fbdev/core/fb_defio.c                |   1 +
 drivers/video/fbdev/core/fb_io_fops.c              |   1 +
 drivers/video/fbdev/core/fb_sys_fops.c             |   2 +
 drivers/video/fbdev/core/fbcmap.c                  |   1 +
 drivers/video/fbdev/core/fbcon.c                   |   1 +
 drivers/video/fbdev/core/fbmon.c                   |   5 +-
 drivers/video/fbdev/core/modedb.c                  |   1 +
 drivers/video/fbdev/core/svgalib.c                 |   1 +
 drivers/video/fbdev/core/syscopyarea.c             |   2 +
 drivers/video/fbdev/core/sysfillrect.c             |   2 +
 drivers/video/fbdev/core/sysimgblt.c               |   2 +
 drivers/video/fbdev/cyber2000fb.c                  |  36 --
 drivers/video/fbdev/cyber2000fb.h                  |   2 -
 drivers/video/fbdev/macmodes.c                     |   3 +-
 drivers/video/fbdev/matrox/g450_pll.c              |  26 +-
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c      |  47 +-
 drivers/video/fbdev/matrox/matroxfb_Ti3026.c       |   1 +
 drivers/video/fbdev/matrox/matroxfb_accel.c        |   2 +
 drivers/video/fbdev/matrox/matroxfb_base.c         |   1 +
 drivers/video/fbdev/matrox/matroxfb_g450.c         |  62 +--
 drivers/video/fbdev/matrox/matroxfb_misc.c         |  21 +-
 drivers/video/fbdev/mb862xx/mb862xx-i2c.c          |   1 -
 drivers/video/fbdev/omap/lcd_dma.c                 |   1 +
 drivers/video/fbdev/omap/lcdc.c                    |   2 +
 drivers/video/fbdev/omap/omapfb_main.c             |   2 +
 drivers/video/fbdev/omap2/omapfb/dss/apply.c       |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/core.c        |   1 +
 .../video/fbdev/omap2/omapfb/dss/dispc-compat.c    |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/display.c     |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c         |   1 -
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c      |   1 +
 .../video/fbdev/omap2/omapfb/dss/dss_features.c    |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/manager.c     |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/output.c      |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/overlay.c     |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c         |   1 -
 drivers/video/fbdev/omap2/omapfb/dss/venc.c        |   1 +
 drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c    |   1 -
 drivers/video/fbdev/omap2/omapfb/vrfb.c            |   1 +
 drivers/video/fbdev/pxafb.c                        |  17 +-
 drivers/video/fbdev/sbuslib.c                      |   1 +
 drivers/video/fbdev/sis/sis.h                      |   2 -
 drivers/video/fbdev/sis/sis_main.c                 |  25 -
 drivers/video/fbdev/via/via-core.c                 |   1 +
 drivers/video/fbdev/via/via-gpio.c                 |   1 -
 drivers/video/fbdev/via/via_i2c.c                  |   1 +
 drivers/video/fbdev/wmt_ge_rops.c                  |   1 +
 include/drm/drm_device.h                           |   9 +
 include/drm/drm_drv.h                              |   3 +-
 include/drm/drm_format_helper.h                    |  13 +-
 include/linux/dma-fence.h                          |  31 +-
 include/linux/platform_data/video-pxafb.h          |   1 -
 include/trace/events/dma_fence.h                   |  38 +-
 include/uapi/drm/ivpu_accel.h                      |  14 +
 include/video/edid.h                               |   3 +-
 include/video/sisfb.h                              |   6 -
 222 files changed, 1487 insertions(+), 1432 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c

--amohce7r5zhie2wj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFOwkwAKCRAnX84Zoj2+
dlJ7AX9bTXFYF4HpZCljXEDBBiHM6NDx1uvFg+CSazPSvT/A10JvmraQEqSsVil1
EDTIjBcBgJV2559Y8cHz4kuxfRyK/f/UL1ySGC+P2MobntLFAVdDivAX131zyvQY
wotJ1ISQig==
=YTUj
-----END PGP SIGNATURE-----

--amohce7r5zhie2wj--

