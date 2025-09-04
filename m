Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E7B436B1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 11:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B921010E9C5;
	Thu,  4 Sep 2025 09:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="l5rXadrg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lzhL83/c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cJL2fP6S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PfDDhUI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4743310E9A3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 09:09:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A147A34057;
 Thu,  4 Sep 2025 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756976975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v0GGp7T1negfA7vsLHrRnB07bIv9wOI6Gd067Vl/9eM=;
 b=l5rXadrgdBdd6XYUCUDL17gs7L0E8KmxzKgI3o4JE18xLcvRgxtYengCXfVWIcC8KJAtSv
 aEhDcwxQ52XqvGY1lw1AeFhHAS7WZqgCrVgUkIj6I0VonnkO84Yu+zChUu6l5vw4ohIcua
 8H9XXV0yi6orusKszvgsH6v2v3/7SeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756976975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v0GGp7T1negfA7vsLHrRnB07bIv9wOI6Gd067Vl/9eM=;
 b=lzhL83/cxyySUDlGUAUn68Vzz49OtqaW/Ny7CyCNT7Q3U9a3RjiLQhSFQBrPfum83EGhtO
 LfLzrOMJJPGGdhCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cJL2fP6S;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PfDDhUI0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756976974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v0GGp7T1negfA7vsLHrRnB07bIv9wOI6Gd067Vl/9eM=;
 b=cJL2fP6SI0oxGMO7SRqJOLy6q42jZ5+swtxxZnCD2SjKBiXvvX0gYU5Hx7+r0zlll7cccR
 jBSbx8G1wcxS0VYmvNfJ3mH5S/MP+7Mc/tmyitL/QdY/x3qYZVk/xBmj4PmjOucbFu2CwK
 5k54S/z4zKItsjpa4X7O6ApwW1a0hKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756976974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v0GGp7T1negfA7vsLHrRnB07bIv9wOI6Gd067Vl/9eM=;
 b=PfDDhUI0z0hrbK+3mIpeMx+I7Hc3Z6G0QqgY2iFNMgwEZLVo6A0V9/JKkuqJZLCK5091dT
 wdQw52AMJ29U1VAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DE4513675;
 Thu,  4 Sep 2025 09:09:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id urPqDU5XuWjJFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Sep 2025 09:09:34 +0000
Date: Thu, 4 Sep 2025 11:09:32 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20250904090932.GA193997@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A147A34057
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim]
X-Spam-Score: -4.51
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

Hi Dave, Sima,

here's the drm-misc-next PR for this week. Many smaller fixes and
improvements throughout the DRM code.

Best regards
Thomas

drm-misc-next-2025-09-04:
drm-misc-next for v6.18:

Cross-subsystem Changes:

- Update a number of DT bindings for STM32MP25 Arm SoC

Core Changes:

gem:
- Simplify locking for GPUVM

panel-backlight-quirks:
- Add additional quirks for EDID, DMI, brightness

sched:
- Fix race condition in trace code
- Clean up

sysfb:
- Clean up

Driver Changes:

amdgpu:
- Give kernel jobs a unique id for better tracing

amdxdna:
- Improve error reporting

bridge:
- Improve ref counting on bridge management
- adv7511: Provide SPD and HDMI infoframes
- it6505: Replace crypto_shash with sha()
- synopsys: Add support for DW DPTX Controller plus DT bindings

gud:
- Replace simple-KMS pipe with regular atomic helpers

imagination:
- Improve power management
- Add support for TH1520 GPU
- Support Risc-V architectures

ivpu:
- Clean up

nouveau:
- Improve error reporting

panthor:
- Fail VM bind if BO has offset
- Clean up

rcar-du:
- Make number of lanes configurable

rockchip:
- Add support for RK3588 DPTX output

rocket:
- Use kfree() and sizeof() correctly
- Test DMA status
- Clean up

sitronix:
- st7571-i2c: Add support for inverted displays and 2-bit grayscale
- Clean up

stm:
- ltdc: Add support support for STM32MP257F-EV1 plus DT bindings

tidss:
- Convert to kernel's FIELD_ macros

v3d:
- Improve job management and locking
The following changes since commit 5c76c794bf29399394ebacaa5af8436b8bed0d46:

  HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower() (2025-08-27 16:35:20 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-09-04

for you to fetch changes up to 2a1eea8fd601db4c52f0d14f8871663b7b052c91:

  drm/sysfb: Remove double assignment to pointer crtc_state (2025-09-04 09:26:39 +0200)

----------------------------------------------------------------
drm-misc-next for v6.18:

Cross-subsystem Changes:

- Update a number of DT bindings for STM32MP25 Arm SoC

Core Changes:

gem:
- Simplify locking for GPUVM

panel-backlight-quirks:
- Add additional quirks for EDID, DMI, brightness

sched:
- Fix race condition in trace code
- Clean up

sysfb:
- Clean up

Driver Changes:

amdgpu:
- Give kernel jobs a unique id for better tracing

amdxdna:
- Improve error reporting

bridge:
- Improve ref counting on bridge management
- adv7511: Provide SPD and HDMI infoframes
- it6505: Replace crypto_shash with sha()
- synopsys: Add support for DW DPTX Controller plus DT bindings

gud:
- Replace simple-KMS pipe with regular atomic helpers

imagination:
- Improve power management
- Add support for TH1520 GPU
- Support Risc-V architectures

ivpu:
- Clean up

nouveau:
- Improve error reporting

panthor:
- Fail VM bind if BO has offset
- Clean up

rcar-du:
- Make number of lanes configurable

rockchip:
- Add support for RK3588 DPTX output

rocket:
- Use kfree() and sizeof() correctly
- Test DMA status
- Clean up

sitronix:
- st7571-i2c: Add support for inverted displays and 2-bit grayscale
- Clean up

stm:
- ltdc: Add support support for STM32MP257F-EV1 plus DT bindings

tidss:
- Convert to kernel's FIELD_ macros

v3d:
- Improve job management and locking

----------------------------------------------------------------
Alice Ryhl (3):
      drm_gem: add mutex to drm_gem_object.gpuva
      panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock
      gpuvm: remove gem.gpuva.lock_dep_map

Andy Yan (4):
      dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
      drm/bridge: synopsys: Add DW DPTX Controller support library
      drm/rockchip: Add RK3588 DPTX output support
      MAINTAINERS: Add entry for DW DPTX Controller bridge

Antheas Kapenekakis (6):
      drm: panel-backlight-quirks: Make EDID match optional
      drm: panel-backlight-quirks: Convert brightness quirk to generic structure
      drm: panel-backlight-quirks: Add secondary DMI match
      drm: panel-backlight-quirks: Add brightness mask quirk
      drm: panel-backlight-quirks: Add Steam Deck brightness quirk
      drm: panel-backlight-quirks: Log applied panel brightness quirks

Brigham Campbell (1):
      accel/rocket: Fix usages of kfree() and sizeof()

Chen Ni (1):
      drm/vesadrm: Remove unneeded semicolon

Chia-I Wu (1):
      drm/panthor: check bo offset alignment in vm bind

Colin Ian King (1):
      drm/sysfb: Remove double assignment to pointer crtc_state

Dan Carpenter (1):
      accel/rocket: Fix some error checking in rocket_core_init()

Danilo Krummrich (1):
      drm/test: drm_exec: use kzalloc() to allocate GEM objects

Dmitry Baryshkov (1):
      drm/bridge: adv7511: provide SPD and HDMI infoframes

Eric Biggers (1):
      drm/bridge: it6505: Use SHA-1 library instead of crypto_shash

Heiko Stuebner (3):
      accel/rocket: Fix indentation of Kconfig entry
      accel/rocket: Depend on DRM_ACCEL not just DRM
      accel/rocket: Check the correct DMA irq status to warn about

Jacek Lawrynowicz (2):
      accel/ivpu: Remove unused PLL_CONFIG_DEFAULT
      accel/ivpu: Make function parameter names consistent

Javier Martinez Canillas (1):
      drm/sitronix/st7571-i2c: Make st7571_panel_data variables static const

Liao Yuanhong (3):
      drm/sched/tests: Remove redundant header files
      drm/nouveau: Replace redundant return value judgment with PTR_ERR_OR_ZERO()
      drm/ssd130x: Remove the use of dev_err_probe()

Luca Ceresoli (7):
      drm/debugfs: bridges_show: show refcount
      list: add list_last_entry_or_null()
      drm/bridge: add drm_bridge_chain_get_last_bridge()
      drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()
      drm/omapdrm: use drm_bridge_chain_get_last_bridge()
      drm/bridge: add drm_bridge_is_last()
      drm/display: bridge_connector: use drm_bridge_is_last()

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in DRM ACCEL DRIVER FOR ROCKCHIP NPU

Marcus Folkesson (6):
      drm/st7571-i2c: correct pixel data format description
      dt-bindings: display: sitronix,st7571: add optional inverted property
      dt-bindings: display: sitronix,st7567: add optional inverted property
      drm/st7571-i2c: add support for inverted pixel format
      drm/format-helper: introduce drm_fb_xrgb8888_to_gray2()
      drm/st7571-i2c: add support for 2bit grayscale for XRGB8888

Marek Vasut (1):
      drm/rcar-du: dsi: Fix 1/2/3 lane support

Maxime Ripard (14):
      drm/tidss: dispc: Remove unused OVR_REG_GET
      drm/tidss: dispc: Convert accessors to macros
      drm/tidss: dispc: Switch to GENMASK instead of FLD_MASK
      drm/tidss: dispc: Get rid of FLD_VAL
      drm/tidss: dispc: Get rid of FLD_GET
      drm/tidss: dispc: Get rid of FLD_MOD
      drm/tidss: dispc: Switch REG_GET to using a mask
      drm/tidss: dispc: Switch REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VID_REG_GET to using a mask
      drm/tidss: dispc: Switch VID_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VP_REG_GET to using a mask
      drm/tidss: dispc: Switch VP_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch OVR_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Define field masks being used

Maíra Canal (6):
      drm/v3d: Store a pointer to `struct v3d_file_priv` inside each job
      drm/v3d: Store the active job inside the queue's state
      drm/v3d: Replace a global spinlock with a per-queue spinlock
      drm/v3d: Address race-condition between per-fd GPU stats and fd release
      drm/v3d: Synchronous operations can't timeout
      drm/v3d: Protect per-fd reset counter against fd release

Michal Wilczynski (3):
      drm/imagination: Use pwrseq for TH1520 GPU power management
      dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU support
      drm/imagination: Enable PowerVR driver for RISC-V

Nathan Chancellor (1):
      drm/tidss: dispc: Explicitly include bitfield.h

Philipp Stanner (1):
      drm/sched: Document race condition in drm_sched_fini()

Pierre-Eric Pelloux-Prayer (2):
      drm/amdgpu: give each kernel job a unique id
      drm/sched: Fix racy access to drm_sched_entity.dependency

Qianfeng Rong (1):
      accel/amdxdna: Use int instead of u32 to store error codes

Raphael Gallais-Pou (6):
      dt-bindings: display: st: add two new compatibles to LTDC device
      dt-bindings: display: st,stm32-ltdc: add access-controllers property
      dt-bindings: display: st: add new compatible to LVDS device
      dt-bindings: display: st,stm32mp25-lvds: add access-controllers property
      dt-bindings: display: st,stm32mp25-lvds: add power-domains property
      dt-bindings: arm: stm32: add required #clock-cells property

Ruben Wauters (1):
      drm/gud: Replace simple display pipe with DRM atomic helpers

Steven Price (1):
      drm/panthor: Simplify mmu_hw_do_operation_locked

Tvrtko Ursulin (1):
      drm/sched: Remove mention of indirect buffers

Yannick Fertre (2):
      drm/stm: ltdc: support new hardware version for STM32MP25 SoC
      drm/stm: ltdc: handle lvds pixel clock

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |   31 +-
 .../bindings/display/rockchip/rockchip,dw-dp.yaml  |  150 ++
 .../bindings/display/sitronix,st7567.yaml          |    5 +
 .../bindings/display/sitronix,st7571.yaml          |    5 +
 .../devicetree/bindings/display/st,stm32-ltdc.yaml |   55 +-
 .../bindings/display/st,stm32mp25-lvds.yaml        |   13 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   49 +-
 MAINTAINERS                                        |   10 +-
 drivers/accel/amdxdna/aie2_ctx.c                   |    6 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    2 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |    3 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |    2 +-
 drivers/accel/rocket/Kconfig                       |   16 +-
 drivers/accel/rocket/rocket_core.c                 |    2 +-
 drivers/accel/rocket/rocket_job.c                  |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   12 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   31 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    5 +
 drivers/gpu/drm/bridge/Kconfig                     |    3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |    6 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   30 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        |   12 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   33 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |    7 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            | 2095 ++++++++++++++++++++
 drivers/gpu/drm/display/drm_bridge_connector.c     |    5 +-
 drivers/gpu/drm/drm_bridge.c                       |    3 +
 drivers/gpu/drm/drm_format_helper.c                |  108 +
 drivers/gpu/drm/drm_gem.c                          |    2 +
 drivers/gpu/drm/drm_gpuvm.c                        |   30 +-
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |  115 +-
 drivers/gpu/drm/gud/gud_connector.c                |   25 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   52 +-
 drivers/gpu/drm/gud/gud_internal.h                 |   13 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   64 +-
 drivers/gpu/drm/imagination/Kconfig                |    3 +-
 drivers/gpu/drm/imagination/pvr_device.c           |   22 +-
 drivers/gpu/drm/imagination/pvr_device.h           |   17 +
 drivers/gpu/drm/imagination/pvr_drv.c              |   23 +-
 drivers/gpu/drm/imagination/pvr_power.c            |  168 +-
 drivers/gpu/drm/imagination/pvr_power.h            |   15 +
 drivers/gpu/drm/nouveau/nouveau_platform.c         |    5 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    6 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |    3 -
 drivers/gpu/drm/panthor/panthor_gem.h              |   12 -
 drivers/gpu/drm/panthor/panthor_mmu.c              |   82 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |    5 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |    8 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    9 +
 drivers/gpu/drm/rockchip/Makefile                  |    1 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c          |  150 ++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |   25 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   16 +
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |    1 -
 drivers/gpu/drm/sitronix/st7571-i2c.c              |   45 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |    3 +-
 drivers/gpu/drm/stm/drv.c                          |   12 +-
 drivers/gpu/drm/stm/ltdc.c                         |   58 +-
 drivers/gpu/drm/stm/ltdc.h                         |    6 +
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |    3 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |    2 +-
 drivers/gpu/drm/tests/drm_exec_test.c              |   22 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  298 +--
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |   76 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |   14 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   22 +-
 drivers/gpu/drm/v3d/v3d_fence.c                    |   11 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   10 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   68 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   85 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |    2 +-
 include/drm/bridge/dw_dp.h                         |   20 +
 include/drm/drm_bridge.h                           |   23 +
 include/drm/drm_format_helper.h                    |    4 +
 include/drm/drm_gem.h                              |   51 +-
 include/drm/drm_gpuvm.h                            |   30 +-
 include/drm/drm_utils.h                            |    8 +-
 include/linux/list.h                               |   14 +
 99 files changed, 3877 insertions(+), 706 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
 create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
 create mode 100644 include/drm/bridge/dw_dp.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
