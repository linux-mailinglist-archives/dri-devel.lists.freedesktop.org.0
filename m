Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0444C132F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 13:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299D10EA19;
	Wed, 23 Feb 2022 12:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E6610E9DF;
 Wed, 23 Feb 2022 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645620573; x=1677156573;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=AvkvTc+JMOWfIHXO19IziN0c/f0kAYLeE4gxGXTmWL4=;
 b=e51fsXX9IQNL6YYAtwv9qZ2A+hjRsOiCXt86vjGJHgEOhxWAEGMpucHG
 srod+qRnk2s490bHqJPlKukVUAqVMep4mY4VU/L2RBARzZXpH7nr7r4gJ
 Sax/9nD2BbmCykHHqjeIPIOxmkgiUMNFfB0hqPaBhDb5v1QUXDuSyoZJg
 dz/ya0vbU4kVKkALKAK+76HKmDMM5Gx68MACeUMSGSzpN+QRuEH3DGfY2
 cyTk/dUQQ/2pcK2I7/jkzh48em2A4K/gJs/IaD+fpgWwECBtvyhw/UtbY
 SL7Wey0OM8iYC5TzaVB8+dzWAn3Qg0VzChlbzlU0CigNJ9fb2OkIZCDWa w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276572855"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="276572855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 04:49:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="707018911"
Received: from awilkens-mobl3.ger.corp.intel.com (HELO [10.252.45.1])
 ([10.252.45.1])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 04:49:29 -0800
Message-ID: <686ec871-e77f-c230-22e5-9e3bb80f064a@linux.intel.com>
Date: Wed, 23 Feb 2022 13:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Content-Language: en-US
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

After few missing, here's the final pull req for -next in v5.18

drm-misc-next-2022-02-23:
drm-misc-next for v5.18:

UAPI Changes:

Cross-subsystem Changes:
- Split out panel-lvds and lvds dt bindings .
- Put yes/no on/off disabled/enabled strings in linux/string_helpers.h
  and use it in drivers and tomoyo.
- Clarify dma_fence_chain and dma_fence_array should never include eachother.
- Flatten chains in syncobj's.
- Don't double add in fbdev/defio when page is already enlisted.
- Don't sort deferred-I/O pages by default in fbdev.

Core Changes:
- Fix missing pm_runtime_put_sync in bridge.
- Set modifier support to only linear fb modifier if drivers don't
  advertise support.
- As a result, we remove allow_fb_modifiers.
- Add missing clear for EDID Deep Color Modes in drm_reset_display_info.
- Assorted documentation updates.
- Warn once in drm_clflush if there is no arch support.
- Add missing select for dp helper in drm_panel_edp.
- Assorted small fixes.
- Improve fb-helper's clipping handling.
- Don't dump shmem mmaps in a core dump.
- Add accounting to ttm resource manager, and use it in amdgpu.
- Allow querying the detected eDP panel through debugfs.
- Add helpers for xrgb8888 to 8 and 1 bits gray.
- Improve drm's buddy allocator.
- Add selftests for the buddy allocator.

Driver Changes:
- Add support for nomodeset to a lot of drm drivers.
- Use drm_module_*_driver in a lot of drm drivers.
- Assorted small fixes to bridge/lt9611, v3d, vc4, vmwgfx, mxsfb, nouveau,
  bridge/dw-hdmi, panfrost, lima, ingenic, sprd, bridge/anx7625, ti-sn65dsi86.
- Add bridge/it6505.
- Create DP and DVI-I connectors in ast.
- Assorted nouveau backlight fixes.
- Rework amdgpu reset handling.
- Add dt bindings for ingenic,jz4780-dw-hdmi.
- Support reading edid through aux channel in ingenic.
- Add a drm driver for Solomon SSD130x OLED displays.
- Add simple support for sharp LQ140M1JW46.
- Add more panels to nt35560.
The following changes since commit 53dbee4926d3706ca9e03f3928fa85b5ec3bc0cc:

  Merge tag 'drm-misc-next-2022-01-27' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2022-02-01 19:02:41 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-02-23

for you to fetch changes up to f915686bd97a9c234602426e6d132b74a112a8d6:

  drm/selftests: add drm buddy pathological testcase (2022-02-23 10:46:32 +0100)

----------------------------------------------------------------
drm-misc-next for v5.18:

UAPI Changes:

Cross-subsystem Changes:
- Split out panel-lvds and lvds dt bindings .
- Put yes/no on/off disabled/enabled strings in linux/string_helpers.h
  and use it in drivers and tomoyo.
- Clarify dma_fence_chain and dma_fence_array should never include eachother.
- Flatten chains in syncobj's.
- Don't double add in fbdev/defio when page is already enlisted.
- Don't sort deferred-I/O pages by default in fbdev.

Core Changes:
- Fix missing pm_runtime_put_sync in bridge.
- Set modifier support to only linear fb modifier if drivers don't
  advertise support.
- As a result, we remove allow_fb_modifiers.
- Add missing clear for EDID Deep Color Modes in drm_reset_display_info.
- Assorted documentation updates.
- Warn once in drm_clflush if there is no arch support.
- Add missing select for dp helper in drm_panel_edp.
- Assorted small fixes.
- Improve fb-helper's clipping handling.
- Don't dump shmem mmaps in a core dump.
- Add accounting to ttm resource manager, and use it in amdgpu.
- Allow querying the detected eDP panel through debugfs.
- Add helpers for xrgb8888 to 8 and 1 bits gray.
- Improve drm's buddy allocator.
- Add selftests for the buddy allocator.

Driver Changes:
- Add support for nomodeset to a lot of drm drivers.
- Use drm_module_*_driver in a lot of drm drivers.
- Assorted small fixes to bridge/lt9611, v3d, vc4, vmwgfx, mxsfb, nouveau,
  bridge/dw-hdmi, panfrost, lima, ingenic, sprd, bridge/anx7625, ti-sn65dsi86.
- Add bridge/it6505.
- Create DP and DVI-I connectors in ast.
- Assorted nouveau backlight fixes.
- Rework amdgpu reset handling.
- Add dt bindings for ingenic,jz4780-dw-hdmi.
- Support reading edid through aux channel in ingenic.
- Add a drm driver for Solomon SSD130x OLED displays.
- Add simple support for sharp LQ140M1JW46.
- Add more panels to nt35560.

----------------------------------------------------------------
Alex Bee (1):
      dt-bindings: gpu: mali-bifrost: describe clocks for the rk356x gpu

Alexander Stein (1):
      drm: mxsfb: Use dev_err_probe() helper

Allen Chen (1):
      drm/bridge: add it6505 driver

Alyssa Rosenzweig (1):
      drm/panfrost: Handle IDVS_GROUP_SIZE feature

Andrey Grodzovsky (13):
      drm/amdgpu: Introduce reset domain
      drm/amdgpu: Move scheduler init to after XGMI is ready
      drm/amdgpu: Serialize non TDR gpu recovery with TDRs
      drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
      drm/amdgpu: Drop hive->in_reset
      drm/amdgpu: Drop concurrent GPU reset protection for device
      drm/amdgpu: Rework reset domain to be refcounted.
      drm/amdgpu: Move reset sem into reset_domain
      drm/amdgpu: Move in_gpu_reset into reset_domain
      drm/amdgpu: Rework amdgpu_device_lock_adev
      drm/amdgpu: Revert 'drm/amdgpu: annotate a false positive recursive locking'
      drm/amdgpu: Fix compile error.
      drm/amdgpu: Fix htmldoc warning

Arunpravin (10):
      drm: improve drm_buddy_alloc function
      drm: implement top-down allocation method
      drm: implement a method to free unused pages
      drm/selftests: Move i915 buddy selftests into drm
      drm/selftests: add drm buddy alloc limit testcase
      drm/selftests: add drm buddy alloc range testcase
      drm/selftests: add drm buddy optimistic testcase
      drm/selftests: add drm buddy pessimistic testcase
      drm/selftests: add drm buddy smoke testcase
      drm/selftests: add drm buddy pathological testcase

Christian König (14):
      drm/vmwgfx: remove vmw_wait_dma_fence
      dma-buf: consolidate dma_fence subclass checking
      dma-buf: warn about dma_fence_array container rules v2
      dma-buf: Warn about dma_fence_chain container rules v2
      dma-buf: warn about containers in dma_resv object
      dma-buf: add dma_fence_chain_contained helper
      drm/amdgpu: use dma_fence_chain_contained
      drm/syncobj: flatten dma_fence_chains on transfer
      drm/ttm: fix resource manager size type and description
      drm/ttm: add common accounting to the resource mgr v3
      drm/amdgpu: remove GTT accounting v2
      drm/amdgpu: remove PL_PREEMPT accounting
      drm/amdgpu: remove VRAM accounting v2
      drm/radeon: remove resource accounting v2

Christophe JAILLET (1):
      drm/bridge: lt9611: Fix an error handling path in lt9611_probe()

Daniel Vetter (1):
      dma-resv: some doc polish for iterators

Douglas Anderson (5):
      drm/panel-edp: Allow querying the detected panel via sysfs
      Revert "drm/panel-edp: Allow querying the detected panel via sysfs"
      drm/bridge: ti-sn65dsi86: Use drm_bridge_connector
      drm: Plumb debugfs_init through to panels
      drm/panel-edp: Allow querying the detected panel via debugfs

Erico Nunes (1):
      drm/lima: avoid error task dump attempt when not enabled

Gustavo A. R. Silva (1):
      nouveau/svm: Use struct_size() helper in nouveau_pfns_map()

Hans de Goede (1):
      drm/privacy-screen: Fix sphinx warning

Hsin-Yi Wang (3):
      drm/bridge: anx7625: Convert to use devm_kzalloc
      drm/bridge: anx7625: Support reading edid through aux channel
      dt-bindings: drm/bridge: anx7625: Add aux-bus node

Javier Martinez Canillas (38):
      drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled
      drm/aspeed: Use drm_module_platform_driver() to register the driver
      drm/atmel-hlcdc: Use drm_module_platform_driver() to register the driver
      drm/fsl-dcu: Use drm_module_platform_driver() to register the driver
      drm/hisilicon/kirin: Use drm_module_platform_driver() to register the driver
      drm/kmb: Use drm_module_platform_driver() to register the driver
      drm/meson: Use drm_module_platform_driver() to register the driver
      drm: mxsfb: Use drm_module_platform_driver() to register the driver
      drm/shmobile: Use drm_module_platform_driver() to register the driver
      drm/stm: Use drm_module_platform_driver() to register the driver
      drm/sun4i: Use drm_module_platform_driver() to register the driver
      drm/tidss: Use drm_module_platform_driver() to register the driver
      drm/arc: Use drm_module_platform_driver() to register the driver
      drm/tve200: Use drm_module_platform_driver() to register the driver
      drm/xlnx: Use drm_module_platform_driver() to register the driver
      drm/armada: Add support for the nomodeset kernel parameter
      drm/exynos: Add support for the nomodeset kernel parameter
      drm/gma500: Add support for the nomodeset kernel parameter
      drm/hyperv: Add support for the nomodeset kernel parameter
      drm/imx: Add support for the nomodeset kernel parameter
      drm/ingenic: Add support for the nomodeset kernel parameter
      drm/mcde: Add support for the nomodeset kernel parameter
      drm/mediatek: Add support for the nomodeset kernel parameter
      drm/msm: Add support for the nomodeset kernel parameter
      drm/omap: Add support for the nomodeset kernel parameter
      drm: rcar-du: Add support for the nomodeset kernel parameter
      drm/rockchip: Add support for the nomodeset kernel parameter
      drm/sprd: Add support for the nomodeset kernel parameter
      drm/sti: Add support for the nomodeset kernel parameter
      drm/tegra: Add support for the nomodeset kernel parameter
      drm/tilcdc: Add support for the nomodeset kernel parameter
      drm/xen: Add support for the nomodeset kernel parameter
      drm/format-helper: Add drm_fb_xrgb8888_to_gray8_line()
      drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()
      drm: Add driver for Solomon SSD130x OLED displays
      drm/solomon: Add SSD130x OLED displays I2C support
      MAINTAINERS: Add entry for Solomon SSD130x OLED displays DRM driver
      dt-bindings: display: ssd1307fb: Add myself as binding co-maintainer

Jiawei Gu (1):
      drm/sched: Add device pointer to drm_gpu_scheduler

Kevin Tang (3):
      drm/sprd: remove the selected DRM_KMS_CMA_HELPER in kconfig
      drm/sprd: fix potential NULL dereference
      drm/sprd: check the platform_get_resource() return value

Linus Walleij (3):
      drm/panel: Rename Sony ACX424 to Novatek NT35560
      drm/panel: nt35560: Support more panel IDs
      drm/panel: nt35560: Support also ACX424AKM

Lucas De Marchi (6):
      drm: Stop spamming log with drm_cache message
      lib/string_helpers: Consolidate string helpers implementation
      drm/amd/display: Use str_yes_no()
      drm/gem: Sort includes alphabetically
      drm: Convert open-coded yes/no strings to yesno()
      tomoyo: Use str_yes_no()

Lyude Paul (2):
      drm/nouveau/backlight: Fix LVDS backlight detection on some laptops
      drm/nouveau/backlight: Just set all backlight types as RAW

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Maxime Ripard (5):
      drm/edid: Clear EDID Deep Color Modes in drm_reset_display_info()
      drm/vc4: hdmi: Simplify the connector state retrieval
      dt-bindings: display: Turn lvds.yaml into a generic schema
      dt-bindings: panel: Introduce a panel-lvds binding
      drm/connector: Fix typo in documentation

Minghao Chi (CGEL ZTE) (1):
      drm/vc4: Use of_device_get_match_data()

Neil Armstrong (1):
      drm/bridge: dw-hdmi: use safe format when first in bridge chain

Paul Boddie (1):
      drm/ingenic: Fix support for JZ4780 HDMI output

Pin-Yen Lin (1):
      drm/bridge: anx7625: Fix overflow issue on reading EDID

Sam Ravnborg (1):
      dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema

Sankeerth Billakanti (2):
      dt-bindings: display: simple: Add sharp LQ140M1JW46 panel
      drm/panel-edp: Add eDP sharp panel support

Simon Ser (1):
      drm: document struct drm_mode_fb_cmd2

Thomas Zimmermann (25):
      drm/mgag200: Replace module-init boiler-plate code with DRM helpers
      drm/qxl: Move ioctl array next to its only user
      drm/qxl: Replace module-init boiler-plate code with DRM helpers
      drm/vboxvideo: Replace module-init boiler-plate code with DRM helpers
      drm/vmwgfx: Replace module-init boiler-plate code with DRM helpers
      drm/fb-helper: Mark screen buffers in system memory with FBINFO_VIRTFB
      drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
      drm/ast: Fail if connector initialization fails
      drm/ast: Move connector mode_valid function to CRTC
      drm/ast: Remove AST_TX_ITE66121 constant
      drm/ast: Remove unused value dp501_maxclk
      drm/ast: Rename struct ast_connector to struct ast_vga_connector
      drm/ast: Initialize encoder and connector for VGA in helper function
      drm/ast: Read encoder possible-CRTC mask from drm_crtc_mask()
      drm/ast: Move DP501-based connector code into separate helpers
      drm/ast: Move SIL164-based connector code into separate helpers
      drm/fb-helper: Fix clip rectangle height
      drm/fb-helper: Fix vertical damage clipping
      drm/fb-helper: Calculate damaged area in separate helper
      drm/fb-helper: Clip damage area to written memory range
      drm/fb-helper: Clip damage area horizontally
      drm/gem-shmem: Set vm_ops in static initializer
      drm/gem-shmem: Don't store mmap'ed buffers in core dumps
      fbdev/defio: Early-out if page is already enlisted
      fbdev: Don't sort deferred-I/O pages by default

Tomohito Esaki (4):
      drm: introduce fb_modifiers_not_supported flag in mode_config
      drm: add support modifiers for drivers whose planes only support linear layout
      drm: remove allow_fb_modifiers
      drm/sprd: remove allow_fb_modifiers setting

Ville Syrjälä (2):
      drm/modes: Fix drm_mode_copy() docs
      drm/vc4: Use drm_mode_copy()

Xin Ji (1):
      drm/bridge: anx7625: send DPCD command to downstream

Yongzhi Liu (2):
      drm/bridge: Add missing pm_runtime_put_sync
      drm/v3d: fix missing unlock

 .../bindings/display/bridge/analogix,anx7625.yaml  |   17 +
 .../display/bridge/ingenic,jz4780-hdmi.yaml        |   82 +
 .../bindings/display/bridge/lvds-codec.yaml        |    2 +-
 .../bindings/display/{panel => }/lvds.yaml         |   35 +-
 .../display/panel/advantech,idk-1110wr.yaml        |   19 +-
 .../display/panel/innolux,ee101ia-01d.yaml         |   23 +-
 .../display/panel/mitsubishi,aa104xd12.yaml        |   19 +-
 .../display/panel/mitsubishi,aa121td01.yaml        |   19 +-
 .../bindings/display/panel/panel-lvds.yaml         |   57 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/sgd,gktw70sdae4se.yaml  |   19 +-
 .../bindings/display/solomon,ssd1307fb.yaml        |    1 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   15 +
 MAINTAINERS                                        |   23 +-
 drivers/dma-buf/dma-fence-array.c                  |   14 +
 drivers/dma-buf/dma-fence-chain.c                  |   15 +-
 drivers/dma-buf/dma-resv.c                         |   34 +-
 drivers/gpu/drm/Kconfig                            |    3 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  274 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |   62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   56 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   40 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    3 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   14 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |   11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   14 +-
 drivers/gpu/drm/armada/armada_drv.c                |    3 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    3 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |   58 -
 drivers/gpu/drm/ast/ast_drv.h                      |   37 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  413 ++-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    3 +-
 drivers/gpu/drm/bridge/Kconfig                     |    8 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/analogix/Kconfig            |    2 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  159 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |    3 +-
 drivers/gpu/drm/bridge/ite-it6505.c                | 3352 ++++++++++++++++++++
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    6 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   18 +-
 drivers/gpu/drm/bridge/panel.c                     |   12 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    5 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   72 +-
 drivers/gpu/drm/dp/drm_dp.c                        |    3 +-
 drivers/gpu/drm/drm_bridge_connector.c             |   15 +
 drivers/gpu/drm/drm_buddy.c                        |  420 ++-
 drivers/gpu/drm/drm_cache.c                        |    9 +-
 drivers/gpu/drm/drm_client_modeset.c               |    3 +-
 drivers/gpu/drm/drm_debugfs.c                      |    3 +
 drivers/gpu/drm/drm_edid.c                         |    3 +
 drivers/gpu/drm/drm_fb_helper.c                    |   78 +-
 drivers/gpu/drm/drm_format_helper.c                |  141 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    6 +-
 drivers/gpu/drm/drm_gem.c                          |   23 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    7 +-
 drivers/gpu/drm/drm_ioctl.c                        |    2 +-
 drivers/gpu/drm/drm_modes.c                        |    2 +-
 drivers/gpu/drm/drm_plane.c                        |   23 +-
 drivers/gpu/drm/drm_privacy_screen.c               |    1 +
 drivers/gpu/drm/drm_syncobj.c                      |   61 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    3 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    3 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |    3 +
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |    2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    3 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    3 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |   76 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |    2 +
 drivers/gpu/drm/imx/imx-drm-core.c                 |    3 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   15 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    3 +-
 drivers/gpu/drm/lib/drm_random.c                   |    3 +-
 drivers/gpu/drm/lib/drm_random.h                   |    2 +
 drivers/gpu/drm/lima/lima_gem.c                    |    1 +
 drivers/gpu/drm/lima/lima_sched.c                  |    5 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |    3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    3 +
 drivers/gpu/drm/meson/meson_drv.c                  |    3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   20 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    3 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    6 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |    6 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |    6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c      |    5 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    3 +
 drivers/gpu/drm/panel/Kconfig                      |   24 +-
 drivers/gpu/drm/panel/Makefile                     |    2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   81 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |  561 ++++
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |  490 ---
 drivers/gpu/drm/panfrost/panfrost_features.h       |    3 +
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    3 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |   31 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |   13 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |   41 +-
 drivers/gpu/drm/radeon/atom.c                      |    3 +-
 drivers/gpu/drm/radeon/radeon.h                    |    2 -
 drivers/gpu/drm/radeon/radeon_display.c            |    2 +
 drivers/gpu/drm/radeon/radeon_kms.c                |    7 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   33 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   18 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    3 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    3 +
 drivers/gpu/drm/scheduler/sched_main.c             |    9 +-
 drivers/gpu/drm/selftests/Makefile                 |    3 +-
 drivers/gpu/drm/selftests/drm_buddy_selftests.h    |   15 +
 drivers/gpu/drm/selftests/test-drm_buddy.c         |  992 ++++++
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |    1 -
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    3 +-
 drivers/gpu/drm/solomon/Kconfig                    |   21 +
 drivers/gpu/drm/solomon/Makefile                   |    2 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |  116 +
 drivers/gpu/drm/solomon/ssd130x.c                  |  843 +++++
 drivers/gpu/drm/solomon/ssd130x.h                  |   76 +
 drivers/gpu/drm/sprd/Kconfig                       |    1 -
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    5 +
 drivers/gpu/drm/sprd/sprd_drm.c                    |    6 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    5 +
 drivers/gpu/drm/sti/sti_drv.c                      |    3 +
 drivers/gpu/drm/stm/drv.c                          |    3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    3 +-
 drivers/gpu/drm/tegra/drm.c                        |    3 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |    3 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    3 +
 drivers/gpu/drm/tiny/arcpgu.c                      |    3 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   36 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |    1 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |   11 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |    6 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   10 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |   20 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    7 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   26 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   46 -
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h              |    3 -
 drivers/gpu/drm/xen/xen_drm_front.c                |    3 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    3 +-
 drivers/staging/fbtft/fbtft-core.c                 |    1 +
 drivers/video/fbdev/broadsheetfb.c                 |    1 +
 drivers/video/fbdev/core/fb_defio.c                |   48 +-
 drivers/video/fbdev/metronomefb.c                  |    1 +
 drivers/video/fbdev/udlfb.c                        |    1 +
 include/drm/drm_bridge.h                           |    7 +
 include/drm/drm_buddy.h                            |   17 +-
 include/drm/drm_connector.h                        |   11 +-
 include/drm/drm_format_helper.h                    |    4 +
 include/drm/drm_gem_shmem_helper.h                 |    2 +
 include/drm/drm_mode_config.h                      |   18 +-
 include/drm/drm_panel.h                            |    8 +
 include/drm/drm_plane.h                            |    3 +
 include/drm/gpu_scheduler.h                        |    3 +-
 include/drm/ttm/ttm_resource.h                     |   13 +-
 include/linux/dma-fence-array.h                    |   15 +-
 include/linux/dma-fence-chain.h                    |   18 +-
 include/linux/dma-fence.h                          |   38 +
 include/linux/dma-resv.h                           |   13 +-
 include/linux/fb.h                                 |    1 +
 include/linux/string_helpers.h                     |   20 +
 include/uapi/drm/drm_mode.h                        |   88 +-
 security/tomoyo/audit.c                            |    2 +-
 security/tomoyo/common.c                           |   19 +-
 security/tomoyo/common.h                           |    1 -
 202 files changed, 8548 insertions(+), 1819 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
 rename Documentation/devicetree/bindings/display/{panel => }/lvds.yaml (84%)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35560.c
 delete mode 100644 drivers/gpu/drm/panel/panel-sony-acx424akp.c
 create mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
 create mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
 create mode 100644 drivers/gpu/drm/solomon/Kconfig
 create mode 100644 drivers/gpu/drm/solomon/Makefile
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-i2c.c
 create mode 100644 drivers/gpu/drm/solomon/ssd130x.c
 create mode 100644 drivers/gpu/drm/solomon/ssd130x.h
