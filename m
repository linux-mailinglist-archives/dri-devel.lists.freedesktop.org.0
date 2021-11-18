Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A04557C9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DBD6EBFE;
	Thu, 18 Nov 2021 09:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3BB6EBF6;
 Thu, 18 Nov 2021 09:13:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD90A212C2;
 Thu, 18 Nov 2021 09:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637226828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6CyJ4Alb+Wk8RTmoIMq319Lx0KWEYKkKdVjnUOIQesQ=;
 b=glrtYVmXX0vPNvn18tLsjijexo8BCbKJD9jmuogxlbZSIktcFOff5xEotNFJWja+dm4jfx
 jfEiDOwTI1kqaBNLFCQSsWUK5wTzQ9h/2M+XPRY7asnmCxSqwZg3+lHKM/mApzSw3kg+Zs
 KIlzNlUXIbgYv6WsdJmJisjy03dJYnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637226828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6CyJ4Alb+Wk8RTmoIMq319Lx0KWEYKkKdVjnUOIQesQ=;
 b=QTvW/mW9t4myyP9jf5YNb1FpQzdAXju9uWKO6mN0zzXtIpLVlckPfyvrHxmduVNtLUoHfY
 nr/qFICx0C/usNCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7699513CF6;
 Thu, 18 Nov 2021 09:13:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QxToG0wZlmEuagAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Nov 2021 09:13:48 +0000
Date: Thu, 18 Nov 2021 10:13:47 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YZYZSypIrr+qcih3@linux-uq9g.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the first PR for drm-misc-next for what will become Linux 5.17.

The dma-buf interface got a new iterator-based interface with updates to
several drivers. This change might have an effect on other subsystems as
well.

During development, we had linker errors as dma-buf symbols have been
moved into their own namespace. I rebuilt after backmerging v5.16-rc1
into drm-misc-next, but could not see and related problems. This appears
to be fix now.

Best regards
Thomas

drm-misc-next-2021-11-18:
drm-misc-next for 5.17:

UAPI Changes:

 * Remove restrictions on DMA_BUF_SET_NAME ioctl
 * connector: State of privacy screen
 * sysfs: Send hotplug uevent

Cross-subsystem Changes:

 * clk/bmc-2835: Fixes

 * dma-buf: Add dma_resv selftest; Error-handling fixes; Add debugfs
   helpers; Remove dma_resv_get_excl_unlocked(); Documentation fixes

 * pwm: Introduce of_pwm_single_xlate()

Core Changes:

 * Support for privacy screens
 * Make drm_irq.c legacy
 * Fix __stack_depot_* name conflict
 * Documentation fixes
 * Fixes and cleanups

 * dp-helper: Reuse 8b/10b link-training delay helpers

 * format-helper: Update interfaces

 * fb-helper: Allocate shadow buffer of correct size

 * gem: Link GEM SHMEM and CMA helpers into separate modules; Use
	    dma_resv iterator; Import DMA_BUF namespace into GEM-helper modules

 * gem/shmem-helper: Interface cleanups

 * scheduler: Grab fence in drm_sched_job_add_implicit_dependencies();
   Lockdep fixes

 * kms-helpers: Link several files from core into the KMS-helper module

Driver Changes:

 * Use dma_resv_iter in several places
 * Fixes and cleanups

 * amdgpu: Use drm_kms_helper_connector_hotplug_event(); Get all fences
   at once

 * bridge: Switch to managed MIPI DSI helpers in several places; Register
   and attach during probe in several places; Convert to YAML in several
   places

 * bridge/anx7625: Support MIPI DPI input; Support HDMI audio; Fixes

 * bridge/dw-hdmi: Allow interlace on bridge

 * bridge/ps8640: Enable PM; Support aux-bus

 * bridge/tc358768: Enabled reference clock; Support pulse mode;
   Modesetting fixes

 * bridge/ti-sn65dsi86: Use regmap_bulk_write(); Implement PWM

 * etnaviv: Get all fences at once

 * gma500: GEM object cleanups; Remove generic drivers in probe function

 * i915: Support VESA panel backlights

 * ingenic: Fixes and cleanups

 * kirin: Adjust probe order

 * kmb: Enable framebuffer console

 * lima: Kconfig fixes

 * meson: Refactoring to supperot DRM_BRIDGE_ATTACH_NO_ENCODER

 * msm: Fixes and cleanups

 * msm/dsi: Adjust probe order

 * omap: Fixes and cleanups

 * nouveau: CRC fixes; Validate LUTs in atomic check; Set HDMI AVI RGB
   quantization to FULL; Fixes and cleanups

 * panel: Support Innolux G070Y2-T02, Vivax TPC-9150, JDI R63452,
   Newhaven 1.8-128160EF, Wanchanglong W552964ABA, Novatek NT35950,
   BOE BF060Y8M, Sony Tulip Truly NT35521; Use dev_err_probe() throughout
   drivers; Fixes and cleanups

 * panel/ili9881c: Orientation fixes

 * radeon: Use dma_resv_wait_timeout()

 * rockchip: Add timeout for DSP hold; Suspend/resume fixes; PLL clock
   fixes; Implement mmap in GEM object functions

 * simpledrm: Support FB_DAMAGE_CLIPS and virtual screen sizes

 * sun4i: Use CMA helpers without vmap support

 * tidss: Fixes and cleanups

 * v3d: Cleanups

 * vc4: Fix HDMI-CEC hang when display is off; Power on HDMI controller
   while disabling; Support 4k@60 Hz modes; Fixes and cleanups

 * video: Convert to sysfs_emit() in several places

 * video/omapfb: Fix fall-through

 * virtio: Overflow fixes

 * xen: Implement mmap as GEM object functions
The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-11-18

for you to fetch changes up to a713ca234ea9d946235ac7248995c5fddfd9e523:

  Merge drm/drm-next into drm-misc-next (2021-11-18 09:36:39 +0100)

----------------------------------------------------------------
drm-misc-next for 5.17:

UAPI Changes:

 * Remove restrictions on DMA_BUF_SET_NAME ioctl
 * connector: State of privacy screen
 * sysfs: Send hotplug uevent

Cross-subsystem Changes:

 * clk/bmc-2835: Fixes

 * dma-buf: Add dma_resv selftest; Error-handling fixes; Add debugfs
   helpers; Remove dma_resv_get_excl_unlocked(); Documentation fixes

 * pwm: Introduce of_pwm_single_xlate()

Core Changes:

 * Support for privacy screens
 * Make drm_irq.c legacy
 * Fix __stack_depot_* name conflict
 * Documentation fixes
 * Fixes and cleanups

 * dp-helper: Reuse 8b/10b link-training delay helpers

 * format-helper: Update interfaces

 * fb-helper: Allocate shadow buffer of correct size

 * gem: Link GEM SHMEM and CMA helpers into separate modules; Use
	    dma_resv iterator; Import DMA_BUF namespace into GEM-helper modules

 * gem/shmem-helper: Interface cleanups

 * scheduler: Grab fence in drm_sched_job_add_implicit_dependencies();
   Lockdep fixes

 * kms-helpers: Link several files from core into the KMS-helper module

Driver Changes:

 * Use dma_resv_iter in several places
 * Fixes and cleanups

 * amdgpu: Use drm_kms_helper_connector_hotplug_event(); Get all fences
   at once

 * bridge: Switch to managed MIPI DSI helpers in several places; Register
   and attach during probe in several places; Convert to YAML in several
   places

 * bridge/anx7625: Support MIPI DPI input; Support HDMI audio; Fixes

 * bridge/dw-hdmi: Allow interlace on bridge

 * bridge/ps8640: Enable PM; Support aux-bus

 * bridge/tc358768: Enabled reference clock; Support pulse mode;
   Modesetting fixes

 * bridge/ti-sn65dsi86: Use regmap_bulk_write(); Implement PWM

 * etnaviv: Get all fences at once

 * gma500: GEM object cleanups; Remove generic drivers in probe function

 * i915: Support VESA panel backlights

 * ingenic: Fixes and cleanups

 * kirin: Adjust probe order

 * kmb: Enable framebuffer console

 * lima: Kconfig fixes

 * meson: Refactoring to supperot DRM_BRIDGE_ATTACH_NO_ENCODER

 * msm: Fixes and cleanups

 * msm/dsi: Adjust probe order

 * omap: Fixes and cleanups

 * nouveau: CRC fixes; Validate LUTs in atomic check; Set HDMI AVI RGB
   quantization to FULL; Fixes and cleanups

 * panel: Support Innolux G070Y2-T02, Vivax TPC-9150, JDI R63452,
   Newhaven 1.8-128160EF, Wanchanglong W552964ABA, Novatek NT35950,
   BOE BF060Y8M, Sony Tulip Truly NT35521; Use dev_err_probe() throughout
   drivers; Fixes and cleanups

 * panel/ili9881c: Orientation fixes

 * radeon: Use dma_resv_wait_timeout()

 * rockchip: Add timeout for DSP hold; Suspend/resume fixes; PLL clock
   fixes; Implement mmap in GEM object functions

 * simpledrm: Support FB_DAMAGE_CLIPS and virtual screen sizes

 * sun4i: Use CMA helpers without vmap support

 * tidss: Fixes and cleanups

 * v3d: Cleanups

 * vc4: Fix HDMI-CEC hang when display is off; Power on HDMI controller
   while disabling; Support 4k@60 Hz modes; Fixes and cleanups

 * video: Convert to sysfs_emit() in several places

 * video/omapfb: Fix fall-through

 * virtio: Overflow fixes

 * xen: Implement mmap as GEM object functions

----------------------------------------------------------------
Andrey Grodzovsky (1):
      drm/sched: Avoid lockdep spalt on killing a processes

AngeloGioacchino Del Regno (6):
      dt-bindings: display/bridge: ptn3460: Convert to YAML binding
      dt-bindings: display/bridge: sil, sii9234: Convert to YAML binding
      dt-bindings: display: Add bindings for Novatek NT35950
      drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels
      dt-bindings: display: Document BOE BF060Y8M-AJ0 panel compatible
      drm/panel: Add BOE BF060Y8M-AJ0 5.99" AMOLED panel driver

Anitha Chrisanthus (1):
      drm/kmb: Enable support for framebuffer console

Arnd Bergmann (1):
      dma-buf: st: fix error handling in test_get_fences()

Ben Skeggs (2):
      drm/nouveau/pmu/gm200-: avoid touching PMU outside of DEVINIT/PREOS/ACR
      drm/nouveau/pmu/gm200-: use alternate falcon reset sequence

Bhaskar Chowdhury (1):
      drm/nouveau/bios/init: A typo fix

Bjorn Andersson (4):
      pwm: Introduce single-PWM of_xlate function
      drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
      drm/bridge: ti-sn65dsi86: Implement the pwm_chip
      drm/bridge: sn65dsi86: ti_sn65dsi86_read_u16() __maybe_unused

Brian Norris (9):
      drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
      drm/panel: innolux-p079zca: Delete panel on attach() failure
      drm/panel: Delete panel on mipi_dsi_attach() failure
      drm/rockchip: vop: Add timeout for DSP hold
      drm/rockchip: dsi: Hold pm-runtime across bind/unbind
      drm/rockchip: dsi: Reconfigure hardware on resume()
      drm/rockchip: dsi: Fix unbalanced clock on probe error
      drm/rockchip: dsi: Disable PLL clock on bind error
      drm/bridge: analogix_dp: Make PSR-exit block less

Cai Huoqing (16):
      drm: panel: nt36672a: Removed extra whitespace.
      drm/panel: ej030na: Make use of the helper function dev_err_probe()
      drm/panel: fy07024di26a30d: Make use of the helper function dev_err_probe()
      drm/panel: ili9881c: Make use of the helper function dev_err_probe()
      drm/panel: k101-im2ba02: Make use of the helper function dev_err_probe()
      drm/panel: ls037v7dw01: Make use of the helper function dev_err_probe()
      drm/panel: nt39016: Make use of the helper function dev_err_probe()
      drm/panel: s6e63j0x03: Make use of the helper function dev_err_probe()
      drm/panel: sofef00: Make use of the helper function dev_err_probe()
      drm/panel: td043mtea1: Make use of the helper function dev_err_probe()
      drm/panel: xpp055c272: Make use of the helper function dev_err_probe()
      drm/panel: y030xx067a: Make use of the helper function dev_err_probe()
      drm/omapdrm: Convert to SPDX identifier
      drm/omap: dss: Make use of the helper macro SET_RUNTIME_PM_OPS()
      drm/omap: Make use of the helper function devm_platform_ioremap_resourcexxx()
      drm/tidss: Make use of the helper macro SET_RUNTIME_PM_OPS()

Chia-I Wu (1):
      MAINTAINERS: add reviewers for virtio-gpu

Christian König (25):
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies
      drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
      drm/msm: use new iterator in msm_gem_describe
      drm/radeon: use new iterator in radeon_sync_resv
      dma-buf: fix kerneldoc for renamed members
      drm/nouveau: use the new iterator in nouveau_fence_sync
      dma-buf: add dma_resv selftest v4
      drm/amdgpu: use the new iterator in amdgpu_sync_resv
      drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
      drm: use new iterator in drm_gem_plane_helper_prepare_fb v3
      drm/etnaviv: use new iterator in etnaviv_gem_describe
      drm/etnaviv: replace dma_resv_get_excl_unlocked
      drm/nouveau: use the new interator in nv50_wndw_prepare_fb
      drm/etnaviv: stop getting the excl fence separately here
      drm/radeon: use dma_resv_wait_timeout() instead of manually waiting
      dma-buf: add dma_fence_describe and dma_resv_describe v2
      drm/msm: use the new dma_resv_describe
      drm/etnaviv: use dma_resv_describe
      drm/i915: use the new iterator in i915_gem_busy_ioctl v2
      drm/i915: use new iterator in i915_gem_object_wait_priority
      drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
      drm/i915: use new cursor in intel_prepare_plane_fb v2
      drm/i915: use new iterator in i915_gem_object_wait_reservation
      drm/amdgpu: stop getting excl fence separately
      dma-buf: nuke dma_resv_get_excl_unlocked

Colin Ian King (2):
      drm/virtio: fix potential integer overflow on shift of a int
      drm/virtio: fix another potential integer overflow on shift of a int

Dan Carpenter (1):
      drm/bridge: display-connector: fix an uninitialized pointer in probe()

Daniel Mack (2):
      dt-bindings: display: add bindings for newhaven, 1.8-128160EF
      drm/tiny: add driver for newhaven, 1.8-128160EF

Dmitry Osipenko (5):
      drm/bridge: tc358768: Enable reference clock
      drm/bridge: tc358768: Support pulse mode
      drm/bridge: tc358768: Calculate video start delay
      drm/bridge: tc358768: Disable non-continuous clock mode
      drm/bridge: tc358768: Correct BTACNTRL1 programming

Guangming Cao (1):
      dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME

Gustavo A. R. Silva (1):
      video: omapfb: Fix fall-through warning for Clang

Hans Verkuil (1):
      drm/nouveau: set RGB quantization range to FULL

Hans de Goede (7):
      drm: Add privacy-screen class (v4)
      drm/privacy-screen: Add X86 specific arch init code
      drm/privacy-screen: Add notifier support (v2)
      drm/connector: Add a drm_connector privacy-screen helper functions (v2)
      platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey() helper
      platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI handles only once
      platform/x86: thinkpad_acpi: Register a privacy-screen device

Ilia Mirkin (1):
      drm/nouveau/kms/nv04: use vzalloc for nv04_display

Jani Nikula (2):
      drm/dp: add helpers to read link training delays
      drm/dp: reuse the 8b/10b link training delay helpers

Jernej Skrabec (1):
      drm/sun4i: virtual CMA addresses are not needed

Jiapeng Chong (2):
      drm/nouveau: Remove unused variable ret
      drm/nouveau/fifo: make tu102_fifo_runlist static

John Keeping (3):
      dt-bindings: ili9881c: add missing panel-common inheritance
      dt-bindings: ili9881c: add rotation property
      drm/panel: ilitek-ili9881c: Read panel orientation

Karol Herbst (1):
      MAINTAINERS: update information for nouveau

Kieran Bingham (1):
      gpu: drm: panel-edp: Fix edp_panel_entry documentation

Lee Jones (1):
      drm/nouveau/dispnv50/headc57d: Make local function 'headc57d_olut' static

Luo Jiaxing (3):
      drm/nouveau/device: use snprintf() to replace strncpy() to avoid NUL-terminated string loss
      drm/nouveau/kms/nv50-: Remove several set but not used variables "ret" in disp.c
      drm/nouveau/kms: delete an useless function call in nouveau_framebuffer_new()

Lyude Paul (13):
      drm/nouveau/kms/nv50-: Use drm_dbg_kms() in crc.c
      drm/nouveau/kms/nv50-: Check vbl count after CRC context flip
      drm/nouveau/kms/nv140-: Use hard-coded wndws or core channel for CRC channel
      drm/nouveau/kms/nvd9-nv138: Fix CRC calculation for the cursor channel
      drm/nouveau/kms/nv140-: Add CRC methods to gv100_disp_core_mthd_head
      drm/nouveau/kms/nv50-: Correct size checks for cursors
      drm/nouveau/kms/nv50-: Use NV_ATOMIC() in nv50_head_atomic_check_lut()
      drm/nouveau/kms/nv50-: Always validate LUTs in nv50_head_atomic_check_lut()
      drm/i915: Add support for panels with VESA backlights with PWM enable/disable
      drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux enable/brightness
      drm/dp: Don't read back backlight mode in drm_edp_backlight_enable()
      drm/dp, drm/i915: Add support for VESA backlights using PWM for brightness control
      drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()

Maarten Lankhorst (1):
      drm/i915: Fix i915_request fence wait semantics

Marcel Ziswiler (1):
      drm: import DMA_BUF module namespace

Marek Vasut (2):
      drm: of: Add drm_of_lvds_get_data_mapping
      drm/bridge: ti-sn65dsi83: Optimize reset line toggling

Maxime Ripard (52):
      Merge tag 'topic/drm-dp-training-delay-helpers-2021-10-19' of git://anongit.freedesktop.org/drm/drm-intel into drm-misc-next
      Merge drm/drm-next into drm-misc-next
      clk: bcm-2835: Pick the closest clock rate
      clk: bcm-2835: Remove rounding up the dividers
      drm/vc4: hdmi: Set a default HSM rate
      drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
      drm/vc4: hdmi: Make sure the controller is powered in detect
      drm/vc4: hdmi: Make sure the controller is powered up during bind
      drm/vc4: hdmi: Rework the pre_crtc_configure error handling
      drm/vc4: hdmi: Split the CEC disable / enable functions in two
      drm/vc4: hdmi: Make sure the device is powered with CEC
      drm/vc4: hdmi: Warn if we access the controller while disabled
      drm/vc4: crtc: Make sure the HDMI controller is powered when disabling
      drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
      drm/bridge: adv7511: Register and attach our DSI device at probe
      drm/bridge: anx7625: Switch to devm MIPI-DSI helpers
      drm/bridge: anx7625: Register and attach our DSI device at probe
      drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
      drm/bridge: lt8912b: Register and attach our DSI device at probe
      drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
      drm/bridge: lt9611: Register and attach our DSI device at probe
      drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers
      drm/bridge: lt9611uxc: Register and attach our DSI device at probe
      drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
      drm/bridge: ps8640: Register and attach our DSI device at probe
      drm/bridge: sn65dsi83: Fix bridge removal
      drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers
      drm/bridge: sn65dsi83: Register and attach our DSI device at probe
      drm/bridge: sn65dsi86: Switch to devm MIPI-DSI helpers
      drm/bridge: sn65dsi86: Register and attach our DSI device at probe
      drm/bridge: tc358775: Switch to devm MIPI-DSI helpers
      drm/bridge: tc358775: Register and attach our DSI device at probe
      drm/kirin: dsi: Adjust probe order
      drm/vc4: hdmi: Remove the DDC probing for status detection
      drm/vc4: hdmi: Fix HPD GPIO detection
      drm/vc4: Make vc4_crtc_get_encoder public
      drm/vc4: crtc: Add encoder to vc4_crtc_config_pv prototype
      drm/vc4: crtc: Rework the encoder retrieval code (again)
      drm/vc4: crtc: Add some logging
      drm/vc4: Leverage the load tracker on the BCM2711
      drm/vc4: hdmi: Raise the maximum clock rate
      drm/vc4: hdmi: Enable the scrambler on reconnection
      drm/vc4: Increase the core clock based on HVS load
      drm/vc4: crtc: Drop feed_txp from state
      drm/vc4: Fix non-blocking commit getting stuck forever
      drm/vc4: crtc: Copy assigned channel to the CRTC
      drm/vc4: hdmi: Add a spinlock to protect register access
      drm/vc4: hdmi: Use a mutex to prevent concurrent framework access
      drm/vc4: hdmi: Prevent access to crtc->state outside of KMS
      drm/vc4: hdmi: Check the device state in prepare()
      drm/vc4: hdmi: Introduce an output_enabled flag
      drm/vc4: hdmi: Introduce a scdc_enabled flag

Michael Trimarchi (4):
      dt-bindings: vendor-prefix: add Wanchanglong Electronics Technology
      dt-bindings: ili9881c: add compatible string for Wanchanglong w552946aba
      drm/panel: ilitek-ili9881d: add support for Wanchanglong W552946ABA panel
      drm/panel: ilitek-ili9881c: Make gpio-reset optional

Neil Armstrong (8):
      drm/bridge: synopsys: dw-hdmi: also allow interlace on bridge
      drm/bridge: dw-hdmi: handle ELD when DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/bridge: display-connector: implement bus fmts callbacks
      drm/meson: remove useless recursive components matching
      drm/meson: split out encoder from meson_dw_hdmi
      drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/meson: rename venc_cvbs to encoder_cvbs
      drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR

Nikola Pavlica (1):
      drm/panel-simple: Add Vivax TPC-9150 panel v6

Oleksij Rempel (1):
      drm: panel-simple: Add support for the Innolux G070Y2-T02 panel

Paul Cercueil (7):
      drm/ingenic: Simplify code by using hwdescs array
      drm/ingenic: Add support for private objects
      drm/ingenic: Move IPU scale settings to private state
      drm/ingenic: Set DMA descriptor chain register when starting CRTC
      drm/ingenic: Upload palette before frame
      drm/ingenic: Attach bridge chain to encoders
      drm/ingenic: Remove bogus register write

Philip Chen (2):
      drm/bridge: parade-ps8640: Enable runtime power management
      drm/bridge: parade-ps8640: Populate devices on aux-bus

Qiang Yu (1):
      drm/lima: fix warning when CONFIG_DEBUG_SG=y & CONFIG_DMA_API_DEBUG=y

Qing Wang (3):
      drm/panel: dsi-cm: replace snprintf in show functions with sysfs_emit
      video: fbdev: replace snprintf in show functions with sysfs_emit
      video: omapfb: replace snprintf in show functions with sysfs_emit

Raffaele Tranquillini (2):
      dt-bindings: panel-simple-dsi: add JDI R63452 panel bindings
      drm/panel: Add JDI R63452 MIPI DSI panel driver

Rajat Jain (1):
      drm/connector: Add support for privacy-screen properties (v4)

Rob Clark (1):
      drm/msm/dsi: Adjust probe order

Sam Ravnborg (1):
      drm/tiny: ili9163: fix build

Shawn Guo (2):
      dt-bindings: display: Add Sony Tulip Truly NT35521 panel support
      drm/panel: Add Sony Tulip Truly NT35521 driver

Shunsuke Mie (1):
      dma-buf: Update obsoluted comments on dma_buf_vmap/vunmap()

Simon Ser (6):
      drm/sysfs: introduce drm_sysfs_connector_hotplug_event
      drm/probe-helper: add drm_kms_helper_connector_hotplug_event
      drm/connector: use drm_sysfs_connector_hotplug_event
      amdgpu: use drm_kms_helper_connector_hotplug_event
      drm/probe-helper: use drm_kms_helper_connector_hotplug_event
      i915/display/dp: send a more fine-grained link-status uevent

Stephen Rothwell (1):
      drm/locking: fix __stack_depot_* name conflict

Thomas Zimmermann (31):
      drm/gma500: Move helpers for struct gtt_range from gtt.c to gem.c
      drm/gma500: Use to_gtt_range() everywhere
      drm/gma500: Reimplement psb_gem_create()
      drm/gma500: Allocate GTT ranges in stolen memory with psb_gem_create()
      drm/gma500: Rename psb_gtt_{pin,unpin}() to psb_gem_{pin,unpin}()
      drm/gma500: Inline psb_gtt_attach_pages() and psb_gtt_detach_pages()
      drm/gma500: Inline psb_gtt_{alloc,free}_range() into rsp callers
      drm/gma500: Set page-caching flags in GEM pin/unpin
      drm/gma500: Rewrite GTT page insert/remove without struct gtt_range
      drm/gma500: Rename struct gtt_range to struct psb_gem_object
      drm/gma500: Remove generic DRM drivers in probe function
      drm/rockchip: Implement mmap as GEM object function
      drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been set
      drm: Link several object files into drm_kms_helper.ko
      drm: Move GEM memory managers into modules
      drm: Link CMA framebuffer helpers into KMS helper library
      drm/xen: Implement mmap as GEM object function
      drm: Update documentation and TODO of gem_prime_mmap hook
      drm/format-helper: Export drm_fb_clip_offset()
      drm/format-helper: Rework format-helper memcpy functions
      drm/format-helper: Add destination-buffer pitch to drm_fb_swab()
      drm/format-helper: Rework format-helper conversion functions
      drm/format-helper: Streamline blit-helper interface
      drm/fb-helper: Allocate shadow buffer of surface height
      drm/simpledrm: Enable FB_DAMAGE_CLIPS property
      drm/simpledrm: Support virtual screen sizes
      drm: Clarify semantics of struct drm_mode_config.{min, max}_{width, height}
      drm/shmem-helper: Unexport drm_gem_shmem_create_with_handle()
      drm/shmem-helper: Export dedicated wrappers for GEM object functions
      drm/shmem-helper: Pass GEM shmem object in public interfaces
      Merge drm/drm-next into drm-misc-next

Tomi Valkeinen (1):
      drm/omap: increase DSS5 max tv pclk to 192MHz

Wang Hai (1):
      drm: fix null-ptr-deref in drm_dev_init_release()

Xin Ji (4):
      dt-bindings:drm/bridge:anx7625:add vendor define
      drm/bridge: anx7625: fix not correct return value
      drm/bridge: anx7625: add MIPI DPI input feature
      drm/bridge: anx7625: add HDMI audio function

Yang Li (2):
      drm/v3d: nullify pointer se with a NULL
      drm/panel: novatek-nt35950: remove unneeded semicolon

Zou Wei (1):
      drm/nouveau/core/client: Mark nvkm_uclient_sclass with static keyword

chongjiapeng (1):
      drm/panel: make sharp_ls055d1sx04 static

tangchunyou (1):
      nouveau/nvkm/subdev/devinit/mcp89.c:Unneeded variable

xinhui pan (1):
      drm/ttm: Put BO in its memory manager's lru list

yangcong (1):
      drm/bridge: parade-ps8640: Fix additional suspend/resume at bootup

 .../bindings/display/bridge/analogix,anx7625.yaml  |  65 +-
 .../bindings/display/bridge/nxp,ptn3460.yaml       | 106 ++++
 .../devicetree/bindings/display/bridge/ptn3460.txt |  39 --
 .../devicetree/bindings/display/bridge/sii9234.txt |  49 --
 .../bindings/display/bridge/sil,sii9234.yaml       | 110 ++++
 .../bindings/display/panel/boe,bf060y8m-aj0.yaml   |  81 +++
 .../bindings/display/panel/ilitek,ili9163.yaml     |  69 ++
 .../bindings/display/panel/ilitek,ili9881c.yaml    |   6 +-
 .../bindings/display/panel/novatek,nt35950.yaml    | 106 ++++
 .../bindings/display/panel/panel-simple-dsi.yaml   |   2 +
 .../display/panel/sony,tulip-truly-nt35521.yaml    |  72 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/drm-kms-helpers.rst              |  15 +
 Documentation/gpu/drm-kms.rst                      |   2 +
 Documentation/gpu/todo.rst                         |  26 +-
 MAINTAINERS                                        |  19 +-
 drivers/clk/bcm/clk-bcm2835.c                      |  13 +-
 drivers/dma-buf/Makefile                           |   3 +-
 drivers/dma-buf/dma-buf.c                          |  32 +-
 drivers/dma-buf/dma-fence.c                        |  17 +
 drivers/dma-buf/dma-resv.c                         |  23 +
 drivers/dma-buf/selftests.h                        |   1 +
 drivers/dma-buf/st-dma-resv.c                      | 371 +++++++++++
 drivers/gpu/drm/Kconfig                            |   8 +-
 drivers/gpu/drm/Makefile                           |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  26 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   4 +-
 drivers/gpu/drm/bridge/Kconfig                     |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |   1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  15 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |  20 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  14 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 491 ++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  23 +-
 drivers/gpu/drm/bridge/display-connector.c         |  88 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  31 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  62 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  65 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |  21 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             | 346 ++++++----
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |  10 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h    |   4 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   9 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  13 +-
 drivers/gpu/drm/bridge/tc358768.c                  |  94 ++-
 drivers/gpu/drm/bridge/tc358775.c                  |  50 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              | 128 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 466 ++++++++++++--
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +
 drivers/gpu/drm/drm_connector.c                    | 205 +++++-
 drivers/gpu/drm/drm_dp_helper.c                    | 261 ++++++--
 drivers/gpu/drm/drm_drv.c                          |  13 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   2 +-
 drivers/gpu/drm/drm_format_helper.c                | 247 ++++----
 drivers/gpu/drm/drm_gem_atomic_helper.c            |  14 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |   5 +
 drivers/gpu/drm/drm_gem_shmem_helper.c             | 136 ++--
 drivers/gpu/drm/drm_irq.c                          |   2 -
 drivers/gpu/drm/drm_mipi_dbi.c                     |   6 +-
 drivers/gpu/drm/drm_of.c                           |  33 +
 drivers/gpu/drm/drm_privacy_screen.c               | 467 ++++++++++++++
 drivers/gpu/drm/drm_privacy_screen_x86.c           |  86 +++
 drivers/gpu/drm/drm_probe_helper.c                 |  48 +-
 drivers/gpu/drm/drm_sysfs.c                        |  25 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |  33 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c               |  52 +-
 drivers/gpu/drm/gma500/gem.c                       | 234 +++++--
 drivers/gpu/drm/gma500/gem.h                       |  28 +-
 drivers/gpu/drm/gma500/gma_display.c               |  51 +-
 drivers/gpu/drm/gma500/gtt.c                       | 326 ++--------
 drivers/gpu/drm/gma500/gtt.h                       |  29 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |   3 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |  12 +
 drivers/gpu/drm/gma500/psb_intel_display.c         |  17 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |   2 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |  14 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  52 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   5 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   7 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  81 ++-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |  35 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  96 +--
 drivers/gpu/drm/i915/i915_request.c                |  57 +-
 drivers/gpu/drm/i915/i915_request.h                |   5 +
 drivers/gpu/drm/i915/i915_sw_fence.c               |  53 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          | 283 +++++++--
 drivers/gpu/drm/ingenic/ingenic-ipu.c              | 127 +++-
 drivers/gpu/drm/kmb/kmb_drv.c                      |   4 +
 drivers/gpu/drm/lima/lima_device.c                 |   1 +
 drivers/gpu/drm/lima/lima_gem.c                    |  18 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   4 +-
 drivers/gpu/drm/meson/Kconfig                      |   2 +
 drivers/gpu/drm/meson/Makefile                     |   3 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  71 +--
 drivers/gpu/drm/meson/meson_dw_hdmi.c              | 342 +---------
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         | 284 +++++++++
 .../{meson_venc_cvbs.h => meson_encoder_cvbs.h}    |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         | 447 +++++++++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h         |  12 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c            | 293 ---------
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |  48 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  22 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   6 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 drivers/gpu/drm/msm/msm_gem.c                      |  29 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c            |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/Kbuild            |   1 +
 drivers/gpu/drm/nouveau/dispnv50/base907c.c        |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c        |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |  64 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.h             |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c         |   8 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c         |  45 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h         |  40 ++
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c         |  58 ++
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |  15 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  11 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |  38 +-
 drivers/gpu/drm/nouveau/dispnv50/head.h            |   2 +
 drivers/gpu/drm/nouveau/dispnv50/head907d.c        |   6 +
 drivers/gpu/drm/nouveau/dispnv50/head917d.c        |   1 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c        |   1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |   3 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  15 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |   7 +-
 .../gpu/drm/nouveau/include/nvhw/class/cl907d.h    |   3 +
 .../gpu/drm/nouveau/include/nvhw/class/clc57d.h    |  69 ++
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c             |   3 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |   5 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  48 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |   4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/coregv100.c   |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c         |   8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c    |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c     |  37 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.c    |  31 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h     |   2 +
 drivers/gpu/drm/omapdrm/dss/dispc.c                |   9 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |  10 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |   7 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c            |  14 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h            |  14 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c           |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |   5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi_phy.c             |   5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi_pll.c             |   4 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |   7 +-
 drivers/gpu/drm/omapdrm/dss/video-pll.c            |   8 +-
 drivers/gpu/drm/omapdrm/omap_dmm_priv.h            |  10 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |  10 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.h           |  10 +-
 drivers/gpu/drm/omapdrm/tcm-sita.c                 |  10 +-
 drivers/gpu/drm/panel/Kconfig                      |  41 ++
 drivers/gpu/drm/panel/Makefile                     |   4 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |  14 +-
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     | 445 +++++++++++++
 drivers/gpu/drm/panel/panel-dsi-cm.c               |   4 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   4 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |  13 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |  29 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 265 +++++++-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |  14 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  10 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       | 323 ++++++++++
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |   8 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |   8 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |  18 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      | 702 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |  10 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |  20 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |   8 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   8 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  21 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |   1 +
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  17 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |  21 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |   8 +-
 drivers/gpu/drm/panel/panel-simple.c               |  56 ++
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c | 552 ++++++++++++++++
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |  14 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |  25 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |  20 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   5 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   6 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |  22 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |  13 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  82 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |  13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c      |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |  44 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h        |   7 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   4 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |  15 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   3 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   2 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |  11 +-
 drivers/gpu/drm/tiny/Kconfig                       |  13 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/cirrus.c                      |  24 +-
 drivers/gpu/drm/tiny/ili9163.c                     | 225 +++++++
 drivers/gpu/drm/tiny/repaper.c                     |   2 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |  37 +-
 drivers/gpu/drm/tiny/st7586.c                      |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   2 +
 drivers/gpu/drm/v3d/v3d_bo.c                       |  22 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   4 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  91 ++-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   7 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  37 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 630 ++++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  37 ++
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |  37 ++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   8 +
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  26 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      | 129 +++-
 drivers/gpu/drm/vc4/vc4_plane.c                    |   5 -
 drivers/gpu/drm/vc4/vc4_txp.c                      |   4 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |  27 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |  16 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            | 108 ++--
 drivers/gpu/drm/xen/xen_drm_front_gem.h            |   7 -
 drivers/platform/x86/Kconfig                       |   2 +
 drivers/platform/x86/thinkpad_acpi.c               | 137 ++--
 drivers/pwm/core.c                                 |  26 +
 drivers/pwm/pwm-pxa.c                              |  16 +-
 drivers/video/fbdev/core/fbsysfs.c                 |  14 +-
 drivers/video/fbdev/omap/omapfb_main.c             |   1 +
 .../video/fbdev/omap2/omapfb/dss/display-sysfs.c   |  14 +-
 .../video/fbdev/omap2/omapfb/dss/manager-sysfs.c   |  18 +-
 .../video/fbdev/omap2/omapfb/dss/overlay-sysfs.c   |  20 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c    |  12 +-
 include/drm/drm_connector.h                        |  55 ++
 include/drm/drm_dp_helper.h                        |  28 +-
 include/drm/drm_drv.h                              |  11 +-
 include/drm/drm_format_helper.h                    |  58 +-
 include/drm/drm_gem_atomic_helper.h                |  18 +
 include/drm/drm_gem_shmem_helper.h                 | 168 ++++-
 include/drm/drm_mode_config.h                      |  13 +
 include/drm/drm_of.h                               |   7 +
 include/drm/drm_privacy_screen_consumer.h          |  65 ++
 include/drm/drm_privacy_screen_driver.h            |  84 +++
 include/drm/drm_privacy_screen_machine.h           |  46 ++
 include/drm/drm_probe_helper.h                     |   1 +
 include/drm/drm_sysfs.h                            |   1 +
 include/drm/gpu_scheduler.h                        |  12 +-
 include/linux/dma-buf.h                            |   4 +-
 include/linux/dma-fence.h                          |   1 +
 include/linux/dma-resv.h                           |  27 +-
 include/linux/pwm.h                                |   2 +
 270 files changed, 10495 insertions(+), 3566 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ptn3460.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
 create mode 100644 drivers/dma-buf/st-dma-resv.c
 create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
 create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
 delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
 create mode 100644 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35950.c
 create mode 100644 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
 create mode 100644 drivers/gpu/drm/tiny/ili9163.c
 create mode 100644 include/drm/drm_privacy_screen_consumer.h
 create mode 100644 include/drm/drm_privacy_screen_driver.h
 create mode 100644 include/drm/drm_privacy_screen_machine.h

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
