Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1D29A917
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 11:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF6E6EB49;
	Tue, 27 Oct 2020 10:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4996E1BA;
 Tue, 27 Oct 2020 10:09:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD06DAEE6;
 Tue, 27 Oct 2020 10:09:57 +0000 (UTC)
Date: Tue, 27 Oct 2020 11:09:36 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20201027100936.GA4858@linux-uq9g>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

with 5.11-rc tagged, here's the first PR for drm-misc-next for what will be=
come
Linux 5.11. What sticks out is the large number of TTM refactoring patches,=
 and
the conversion to GEM object functions. THe framebuffer code is now orphane=
d.
There are tons of small changes for compiler warnings throughout fbdev

Best regards
Thomas


drm-misc-next-2020-10-27:
drm-misc-next for 5.11:

UAPI Changes:

  - doc: rules for EBUSY on non-blocking commits; requirements for fourcc
    modifiers; on parsing EDID
  - fbdev/sbuslib: Remove unused FBIOSCURSOR32
  - fourcc: deprecate DRM_FORMAT_MOD_NONE
  - virtio: Support blob resources for memory allocations; Expose host-visi=
ble
    and cross-device features

Cross-subsystem Changes:

  - devicetree: Add vendor Prefix for Yes Optoelectronics, Shanghai Top Dis=
play
    Optoelectronics
  - dma-buf: Add struct dma_buf_map that stores DMA pointer and I/O-memory =
flag;
    dma_buf_vmap()/vunmap() return address in dma_buf_map; Use struct_size(=
) macro

Core Changes:

  - atomic: pass full state to CRTC atomic enable/disable; warn for EBUSY d=
uring
    non-blocking commits
  - dp: Prepare for DP 2.0 DPCD
  - dp_mst: Receive extended DPCD caps
  - dma-buf: Documentation
  - doc: Format modifiers; dma-buf-map; Cleanups
  - fbdev: Don't use compat_alloc_user_space(); mark as orphaned
  - fb-helper: Take lock in drm_fb_helper_restore_work_fb()
  - gem: Convert implementation and drivers to GEM object functions, remove
    GEM callbacks from struct drm_driver (expect gem_prime_mmap)
  - panel: Cleanups
  - pci: Add legacy infix to drm_irq_by_busid()
  - sched: Avoid infinite waits in drm_sched_entity_destroy()
  - switcheroo: Cleanups
  - ttm: Remove AGP support; Don't modify caching during swapout; Major
    refactoring of the implementation and API that affects all depending
    drivers; Add ttm_bo_wait_ctx(); Add ttm_bo_pin()/unpin() in favor of
    TTM_PL_FLAG_NO_EVICT; Remove ttm_bo_create(); Remove fault_reserve_noti=
fy()
    callback; Push move() implementation into drivers; Remove TTM_PAGE_FLAG=
_WRITE;
    Replace caching flags with init-time cache setting; Push ttm_tt_bind() =
into
    drivers; Replace move_notify() with delete_mem_notify(); No overlapping=
 memcpy();
    no more ttm_set_populated()
  - vram-helper: Fix BO top-down placement; TTM-related changes; Init GEM
    object functions with defaults; Default placement in system memory; Cle=
anups

Driver Changes:

  - amdgpu: Use GEM object functions
  - armada: Use GEM object functions
  - aspeed: Configure output via sysfs; Init struct drm_driver with
  - ast: Reload LUT after FB format changes
  - bridge: Add driver and DT bindings for anx7625; Cleanups
  - bridge/dw-hdmi: Constify ops
  - bridge/ti-sn65dsi86: Add retries for link training
  - bridge/lvds-codec: Add support for regulator
  - bridge/tc358768: Restore connector support DRM_GEM_CMA_DRIVEROPS; Clean=
ups
  - display/ti,j721e-dss: Add DT properies assigned-clocks, assigned-clocks=
-parent and
    dma-coherent
  - display/ti,am65s-dss: Add DT properies assigned-clocks, assigned-clocks=
-parent and
    dma-coherent
  - etnaviv: Use GEM object functions
  - exynos: Use GEM object functions
  - fbdev: Cleanups and compiler fixes throughout framebuffer drivers
  - fbdev/cirrusfb: Avoid division by 0
  - gma500: Use GEM object functions; Fix double-free of connector; Cleanups
  - hisilicon/hibmc: I2C-based DDC support; Use to_hibmc_drm_device(); Clea=
nups
  - i915: Use GEM object functions
  - imx/dcss: Init driver with DRM_GEM_CMA_DRIVER_OPS; Cleanups
  - ingenic: Reset pixel clock when parent clock changes; support reserved
    memory; Alloc F0 and F1 DMA channels at once; Support different pixel f=
ormats;
    Revert support for cached mmap buffers
    on F0/F1; support 30-bit/24-bit/8-bit-palette modes
  - komeda: Use DEFINE_SHOW_ATTRIBUTE
  - mcde: Detect platform_get_irq() errors
  - mediatek: Use GEM object functions
  - msm: Use GEM object functions
  - nouveau: Cleanups; TTM-related changes; Use GEM object functions
  - omapdrm: Use GEM object functions
  - panel: Add driver and DT bindings for Novatak nt36672a; Add driver and =
DT
    bindings for YTC700TLAG-05-201C; Add driver and DT bindings for TDO TL0=
70WSH30;
    Cleanups
  - panel/mantix: Fix reset; Fix deref of NULL pointer in mantix_get_modes()
  - panel/otm8009a: Allow non-continuous dsi clock; Cleanups
  - panel/rm68200: Allow non-continuous dsi clock; Fix mode to 50 FPS
  - panfrost: Fix job timeout handling; Cleanups
  - pl111: Use GEM object functions
  - qxl: Cleanups; TTM-related changes; Pin new BOs with ttm_bo_init_reserv=
ed()
  - radeon: Cleanups; TTM-related changes; Use GEM object functions
  - rockchip: Use GEM object functions
  - shmobile: Cleanups
  - tegra: Use GEM object functions
  - tidss: Set drm_plane_helper_funcs.prepare_fb
  - tilcdc: Don't keep vblank interrupt enabled all the time
  - tve200: Detect platform_get_irq() errors
  - vc4: Use GEM object functions; Only register components once DSI is att=
ached;
    Add Maxime as maintainer
  - vgem: Use GEM object functions
  - via: Simplify critical section in via_mem_alloc()
  - virtgpu: Use GEM object functions
  - virtio: Implement blob resources, host-visible and cross-device feature=
s;
    Support mapping of host-allocated resources; Use UUID APi; Cleanups
  - vkms: Use GEM object functions; Switch to SHMEM
  - vmwgfx: TTM-related changes; Inline ttm_bo_swapout_all()
  - xen: Use GEM object functions
  - xlnx: Use GEM object functions
The following changes since commit 089d83418914abd4d908db117d9a3eca7f51a68c:

  drm/vc4: hvs: Pull the state of all the CRTCs prior to PV muxing (2020-09=
-21 16:43:11 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-10-27

for you to fetch changes up to 4dfec0d1d7b9970f36931de714b379dbeaed83f8:

  matroxfb: avoid -Warray-bounds warning (2020-10-27 07:56:19 +0100)

----------------------------------------------------------------
drm-misc-next for 5.11:

UAPI Changes:

  - doc: rules for EBUSY on non-blocking commits; requirements for fourcc
    modifiers; on parsing EDID
  - fbdev/sbuslib: Remove unused FBIOSCURSOR32
  - fourcc: deprecate DRM_FORMAT_MOD_NONE
  - virtio: Support blob resources for memory allocations; Expose host-visi=
ble
    and cross-device features

Cross-subsystem Changes:

  - devicetree: Add vendor Prefix for Yes Optoelectronics, Shanghai Top Dis=
play
    Optoelectronics
  - dma-buf: Add struct dma_buf_map that stores DMA pointer and I/O-memory =
flag;
    dma_buf_vmap()/vunmap() return address in dma_buf_map; Use struct_size(=
) macro

Core Changes:

  - atomic: pass full state to CRTC atomic enable/disable; warn for EBUSY d=
uring
    non-blocking commits
  - dp: Prepare for DP 2.0 DPCD
  - dp_mst: Receive extended DPCD caps
  - dma-buf: Documentation
  - doc: Format modifiers; dma-buf-map; Cleanups
  - fbdev: Don't use compat_alloc_user_space(); mark as orphaned
  - fb-helper: Take lock in drm_fb_helper_restore_work_fb()
  - gem: Convert implementation and drivers to GEM object functions, remove
    GEM callbacks from struct drm_driver (expect gem_prime_mmap)
  - panel: Cleanups
  - pci: Add legacy infix to drm_irq_by_busid()
  - sched: Avoid infinite waits in drm_sched_entity_destroy()
  - switcheroo: Cleanups
  - ttm: Remove AGP support; Don't modify caching during swapout; Major
    refactoring of the implementation and API that affects all depending
    drivers; Add ttm_bo_wait_ctx(); Add ttm_bo_pin()/unpin() in favor of
    TTM_PL_FLAG_NO_EVICT; Remove ttm_bo_create(); Remove fault_reserve_noti=
fy()
    callback; Push move() implementation into drivers; Remove TTM_PAGE_FLAG=
_WRITE;
    Replace caching flags with init-time cache setting; Push ttm_tt_bind() =
into
    drivers; Replace move_notify() with delete_mem_notify(); No overlapping=
 memcpy();
    no more ttm_set_populated()
  - vram-helper: Fix BO top-down placement; TTM-related changes; Init GEM
    object functions with defaults; Default placement in system memory; Cle=
anups

Driver Changes:

  - amdgpu: Use GEM object functions
  - armada: Use GEM object functions
  - aspeed: Configure output via sysfs; Init struct drm_driver with
  - ast: Reload LUT after FB format changes
  - bridge: Add driver and DT bindings for anx7625; Cleanups
  - bridge/dw-hdmi: Constify ops
  - bridge/ti-sn65dsi86: Add retries for link training
  - bridge/lvds-codec: Add support for regulator
  - bridge/tc358768: Restore connector support DRM_GEM_CMA_DRIVEROPS; Clean=
ups
  - display/ti,j721e-dss: Add DT properies assigned-clocks, assigned-clocks=
-parent and
    dma-coherent
  - display/ti,am65s-dss: Add DT properies assigned-clocks, assigned-clocks=
-parent and
    dma-coherent
  - etnaviv: Use GEM object functions
  - exynos: Use GEM object functions
  - fbdev: Cleanups and compiler fixes throughout framebuffer drivers
  - fbdev/cirrusfb: Avoid division by 0
  - gma500: Use GEM object functions; Fix double-free of connector; Cleanups
  - hisilicon/hibmc: I2C-based DDC support; Use to_hibmc_drm_device(); Clea=
nups
  - i915: Use GEM object functions
  - imx/dcss: Init driver with DRM_GEM_CMA_DRIVER_OPS; Cleanups
  - ingenic: Reset pixel clock when parent clock changes; support reserved
    memory; Alloc F0 and F1 DMA channels at once; Support different pixel f=
ormats;
    Revert support for cached mmap buffers
    on F0/F1; support 30-bit/24-bit/8-bit-palette modes
  - komeda: Use DEFINE_SHOW_ATTRIBUTE
  - mcde: Detect platform_get_irq() errors
  - mediatek: Use GEM object functions
  - msm: Use GEM object functions
  - nouveau: Cleanups; TTM-related changes; Use GEM object functions
  - omapdrm: Use GEM object functions
  - panel: Add driver and DT bindings for Novatak nt36672a; Add driver and =
DT
    bindings for YTC700TLAG-05-201C; Add driver and DT bindings for TDO TL0=
70WSH30;
    Cleanups
  - panel/mantix: Fix reset; Fix deref of NULL pointer in mantix_get_modes()
  - panel/otm8009a: Allow non-continuous dsi clock; Cleanups
  - panel/rm68200: Allow non-continuous dsi clock; Fix mode to 50 FPS
  - panfrost: Fix job timeout handling; Cleanups
  - pl111: Use GEM object functions
  - qxl: Cleanups; TTM-related changes; Pin new BOs with ttm_bo_init_reserv=
ed()
  - radeon: Cleanups; TTM-related changes; Use GEM object functions
  - rockchip: Use GEM object functions
  - shmobile: Cleanups
  - tegra: Use GEM object functions
  - tidss: Set drm_plane_helper_funcs.prepare_fb
  - tilcdc: Don't keep vblank interrupt enabled all the time
  - tve200: Detect platform_get_irq() errors
  - vc4: Use GEM object functions; Only register components once DSI is att=
ached;
    Add Maxime as maintainer
  - vgem: Use GEM object functions
  - via: Simplify critical section in via_mem_alloc()
  - virtgpu: Use GEM object functions
  - virtio: Implement blob resources, host-visible and cross-device feature=
s;
    Support mapping of host-allocated resources; Use UUID APi; Cleanups
  - vkms: Use GEM object functions; Switch to SHMEM
  - vmwgfx: TTM-related changes; Inline ttm_bo_swapout_all()
  - xen: Use GEM object functions
  - xlnx: Use GEM object functions

----------------------------------------------------------------
Alistair Delva (1):
      virtio-gpu api: fix 64/32 compat issue with blob implementation

Andy Shevchenko (2):
      drm: shmobile: Reduce include dependencies
      drm/virtio: Use UUID API for importing the UUID

Antonio Borneo (2):
      drm/panel: otm8009a: remove hack to force commands in HS
      drm/panel: otm8009a: allow using non-continuous dsi clock

Arnd Bergmann (4):
      fbdev: simplify fb_getput_cmap()
      fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
      fbdev: sbuslib: remove compat_alloc_user_space usage
      matroxfb: avoid -Warray-bounds warning

Bartlomiej Zolnierkiewicz (1):
      MAINTAINERS: mark FRAMEBUFFER LAYER as Orphan

Bernard Zhao (1):
      drm/via: reduce no need mutex_lock area

Biju Das (1):
      drm/bridge: lvds-codec: Add support for regulator

Boris Brezillon (2):
      drm/sched: Avoid infinite waits in the drm_sched_entity_destroy() path
      drm/panfrost: Fix job timeout handling

Christian K=F6nig (37):
      drm/ttm: remove nonsense AGP handling
      drm/ttm: stop dangerous caching attribute change
      drm/nouveau: stop using persistent_swap_storage
      drm/ttm: remove persistent_swap_storage
      drm/ttm: add ttm_bo_pin()/ttm_bo_unpin() v2
      drm/vmwgfx: remove unused placement combination
      drm/vmwgfx: stop using ttm_bo_create v2
      drm/vmwgfx: switch over to the new pin interface v2
      drm/nouveau: switch over to the new pin interface
      drm/vram-helper: switch over to the new pin interface
      drm/qxl: switch over to the new pin interface
      drm/radeon: switch over to the new pin interface
      drm/amdgpu: switch over to the new pin interface
      drm/ttm: remove ttm_bo_create
      drm/ttm: remove TTM_PL_FLAG_NO_EVICT
      drm/ttm: move SG flag check into ttm_bo_vm_reserve
      drm/radeon: stop using TTMs fault callback
      drm/amdgpu: stop using TTMs fault callback
      drm/nouveau: stop using TTMs fault callback
      drm/ttm: remove fault callback
      drm/qxl: fix usage of ttm_bo_init
      drm/ttm: remove TTM_PAGE_FLAG_WRITE
      drm/ttm: cleanup ttm_handle_caching_state_failure
      drm/ttm: nuke ttm_bo_evict_mm and rename mgr function v3
      drm/ttm: drop glob parameter from ttm_bo_swapout
      drm/vmwgfx: move ttm_bo_swapout_all into vmwgfx
      drm/ttm: remove ttm_bo_unmap_virtual_locked declaration v2
      drm/ttm: move ttm_set_memory.h out of include
      dma-buf: use struct_size macro
      drm/ttm: set the tt caching state at creation time
      drm/ttm: add caching state to ttm_bus_placement
      drm/ttm: use caching instead of placement for ttm_io_prot
      drm/ttm: nuke caching placement flags
      drm/ttm: nuke ttm_tt_set_(un)populated again
      drm/ttm: move swapin out of page alloc backend
      drm/ttm: make num_pages uint32_t
      drm/ttm: merge ttm_dma_tt back into ttm_tt

Colin Ian King (1):
      drm/gma500: clean up indentation issues

Daniel Vetter (10):
      drm/doc: Document that modifiers are always required for fb
      drm: update todo.rst
      drm/atomic: Make the kerneldoc a bit clearer
      drm/fb-helper: Add locking to sysrq handling
      drm/atomic: document and enforce rules around "spurious" EBUSY
      drm/atomic: debug output for EBUSY
      drm/vkms: Set preferred depth correctly
      drm/vkms: Switch to shmem helpers
      drm/vkms: fbdev emulation support
      drm: Give irq_by_busid drm_legacy_ prefix

Dave Airlie (31):
      drm/radeon: kill radeon_bo_wait
      drm/qxl: kill unused bo wait wrapper
      drm/radeon: cleanup ttm operation ctx usage.
      drm/nouveau/ttm: plumb ctx through move functions.
      drm/ttm: add bo wait that takes a ctx wrapper.
      drm/ttm: handle the SYSTEM->TT path in same place as others.
      drm/amdgpu/ttm: handle tt moves properly.
      drm/radeon/ttm: handle ttm moves properly
      drm/nouveau/ttm: handle ttm moves properly.
      drm/nouveau/ttm: memcpy waits for bo already
      drm/qxl: drop unused code (v2)
      drm/vmwgfx: move null mem checks outside move notifies
      drm/vmwgfx: add a move callback.
      drm/vram_helper: implement a ttm move callback.
      drm/ttm: make move callback compulstory
      drm/ttm: drop free old node wrapper.
      drm/ttm: refactor out common code to setup a new tt backed resource
      drm/ttm: split out the move to system from move ttm code
      drm/ttm: use new move interface for known system->ttm moves
      drm/ttm: add move old to system to drivers.
      drm/ttm: drop ttm_bo_move_ttm wrapper
      drm/ttm: move some move binds into the drivers
      drm/ttm: minor cleanup to move to system
      drm/ttm: add move to system into drivers
      drm/ttm: drop unbind callback.
      drm/ttm: remove move to new and inline into remainging place.
      drm/ttm: drop move notify around move.
      drm/ttm: move last binding into the drivers.
      drm/ttm: ttm_bo_mem_placement doesn't need ctx parameter.
      drm/ttm: replace last move_notify with delete_mem_notify
      drm/ttm: remove overlapping memcpy support

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Add retries for link training

Gerd Hoffmann (6):
      virtio-gpu api: blob resources
      virtio-gpu api: host visible feature
      drm/virtio: implement blob resources: probe for the feature.
      drm/virtio: implement blob resources: probe for host visible region
      drm/virtio: implement blob resources: implement vram object
      drm/virtio: implement blob resources: resource create blob ioctl

Gowtham Tammana (1):
      drm/tidss: Add prepare_fb to the plane helper funcs

Guido G=FCnther (3):
      drm/panel: mantix: Don't dereference NULL mode
      drm/panel: mantix: Fix panel reset
      dt-binding: display: Require two resets on mantix panel

Gurchetan Singh (13):
      drm/virtio: blob prep: refactor getting pages and attaching backing
      drm/virtio: blob prep: make CPU responses more generic
      drm/virtgpu api: blob resources
      drm/virtgpu api: host visible feature
      drm/virtgpu api: cross-device feature
      drm/virtio: implement blob resources: expose virtio_gpu_resource_id_g=
et
      drm/virtio: implement blob resources: add new fields to internal stru=
cts
      drm/virtio: implement blob resources: hypercall interface
      drm/virtio: implement blob resources: blob display integration
      drm/virtio: implement blob resources: refactor UUID code somewhat
      drm/virtio: implement blob resources: fix stride discrepancy
      drm/virtio: implement blob resources: report blob mem to userspace
      drm/virtio: advertise features to userspace

Jagan Teki (3):
      dt-bindings: vendor-prefixes: Add Yes Optoelectronics
      dt-bindings: display: simple: Add YTC700TLAG-05-201C
      drm/panel: simple: Add YTC700TLAG-05-201C

Jani Nikula (2):
      drm/dp: add subheadings to DPCD address definitions
      drm/dp: add a number of DP 2.0 DPCD definitions

Jason Yan (6):
      drm/panel: samsung: make vint_table static const
      drm/bridge: analogix_dp: make analogix_dp_start_aux_transaction() sta=
tic
      drm: bridge: adv7511: make adv7511_hdmi_hw_params() static
      drm/panel: st7703: Make jh057n00900_panel_desc static
      video: fbdev: sis: remove unneeded semicolon
      video: fbdev: fsl-diu-fb: remove unneeded variable 'res'

Jianxin Xiong (1):
      dma-buf: Clarify that dma-buf sg lists are page aligned

Joel Stanley (1):
      drm/aspeed: Add sysfs for output settings

Jyri Sarha (2):
      drm/tilcdc: Do not keep vblank interrupts enabled all the time
      drm/tilcdc: Remove tilcdc_crtc_max_width(), use private data

Koba Ko (1):
      drm/dp_mst: Retrieve extended DPCD caps for topology manager

Krzysztof Kozlowski (2):
      drm/mcde: Fix handling of platform_get_irq() error
      drm/tve200: Fix handling of platform_get_irq() error

Li Heng (1):
      video: Remove set but not used variable

Liu Shixin (5):
      omapfb: simplify the return expression of panel_dpi_connect
      omapfb: simplify the return expression of sharp_ls_connect
      omapfb: simplify the return expression of tpo_td043_connect
      omapfb: connector-dvi: simplify the return expression of dvic_connect=
()
      drm/panel: simplify the return expression of rb070d30_panel_enable()

Marek Szyprowski (1):
      drm/bridge: tc358764: restore connector support

Matteo Franchin (1):
      drm/fourcc: Add AXBXGXRX106106106106 format

Maxime Ripard (3):
      drm/atomic: Pass the full state to CRTC atomic enable/disable
      MAINTAINERS: Add myself as a maintainer for vc4
      drm/vc4: dsi: Only register our component once a DSI device is attach=
ed

Melissa Wen (1):
      drm/vkms: update todo

Neil Armstrong (4):
      dt-bindings: vendor-prefixes: Add Shanghai Top Display Optolelectroni=
cs vendor prefix
      dt-bindings: display: panel-simple-dsi: add optional reset gpio
      dt-bindings: display: panel-simple-dsi: add TDO TL070WSH30 DSI panel =
bindings
      drm: panel: add TDO tl070wsh30 panel driver

Ondrej Jirman (1):
      drm: aspeed: Fix GENMASK misuse

Paul Cercueil (8):
      drm/ingenic: Reset pixclock rate when parent clock rate changes
      drm/ingenic: Add support for reserved memory
      drm/ingenic: Alloc F0 and F1 DMA descriptors at once
      drm/ingenic: Support handling different pixel formats in F0/F1 planes
      drm/ingenic: Add support for 30-bit modes
      drm/ingenic: Add support for 24-bit modes
      drm/ingenic: Add support for paletted 8bpp
      Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached"

Qilong Zhang (1):
      omapfb: use devm_platform_ioremap_resource_byname

Qinglang Miao (11):
      vga_switcheroo: simplify the return expression of vga_switcheroo_runt=
ime_resume
      drm/panel: simplify the return expression of td028ttec1_prepare
      drm/qxl: simplify the return expression of qxl_plane_prepare_fb()
      drm/panfrost: simplify the return expression of cz_ih_hw_init()
      drm/panfrost: simplify the return expression of panfrost_devfreq_targ=
et()
      omapfb: connector-analog-tv: simplify the return expression of tvc_co=
nnect()
      omapfb: connector-hdmi: simplify the return expression of hdmic_conne=
ct
      omapfb: panel-sony-acx565akm: simplify the return expression of acx56=
5akm_connect()
      omapfb: simplify the return expression of hdmi_pll_enable
      fbdev: nvidia: use for_each_child_of_node() macro
      drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE

Randy Dunlap (1):
      drm/aspeed: Fix Kconfig warning & subsequent build errors

Rikard Falkeborn (1):
      drm: bridge: dw-hdmi: Constify dw_hdmi_i2s_ops

Robin Murphy (1):
      drm/komeda: Drop local dma_parms

Saeed Mirzamohammadi (1):
      video: fbdev: fix divide error in fbcon_switch

Simon Ser (3):
      drm/fourcc: document modifier uniqueness requirements
      drm: document that user-space should avoid parsing EDIDs
      drm: deprecate DRM_FORMAT_MOD_NONE

Sumit Semwal (2):
      dt-bindings: display: panel: Add bindings for Novatek nt36672a
      drm: panel: Add novatek nt36672a panel driver

Thomas Zimmermann (33):
      drm/vram-helper: Fix use of top-down placement
      drm/ast: Reload gamma LUT after changing primary plane's color format
      drm/amdgpu: Introduce GEM object functions
      drm/armada: Introduce GEM object functions
      drm/etnaviv: Introduce GEM object functions
      drm/exynos: Introduce GEM object functions
      drm/gma500: Introduce GEM object functions
      drm/i915: Introduce GEM object functions
      drm/imx/dcss: Initialize DRM driver instance with CMA helper macro
      drm/mediatek: Introduce GEM object functions
      drm/msm: Introduce GEM object funcs
      drm/nouveau: Introduce GEM object functions
      drm/omapdrm: Introduce GEM object functions
      drm/pl111: Introduce GEM object functions
      drm/radeon: Introduce GEM object functions
      drm/rockchip: Convert to drm_gem_object_funcs
      drm/tegra: Introduce GEM object functions
      drm/vc4: Introduce GEM object functions
      drm/vgem: Introduce GEM object functions
      drm/virtgpu: Set PRIME export function in struct drm_gem_object_funcs
      drm/vkms: Introduce GEM object functions
      drm/xen: Introduce GEM object functions
      drm/xlnx: Initialize DRM driver instance with CMA helper macro
      drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver
      drm/vram-helper: Integrate drm_gem_vram_init() into drm_gem_vram_crea=
te()
      drm/vram-helper: Set object function iff they are not provided by dri=
ver
      drm/vram-helper: Don't put new BOs into VRAM
      drm/rockchip: Include <drm/drm_gem_cma_helper> for drm_gem_cm_vm_ops
      dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
      dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
      dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
      dma-buf: Document struct dma_buf_map
      drm/aspeed: Set driver CMA functions with DRM_GEM_CMA_DRIVER_OPS

Tian Tao (7):
      drm/hisilicon: Support i2c driver algorithms for bit-shift adapters
      drm/hisilicon: Features to support reading resolutions from EDID
      drm/hisilicon: Deleted the drm_device declaration
      drm/hisilicon: Using the to_hibmc_drm_private to convert
      drm/hisilicon: Delete the unused macro
      drm/hisilicon: Use the same style of variable type in hibmc_drm_de
      drm/hisilicon: Use the same style of variable type in hibmc_drm_drv

Tom Rix (1):
      drm/gma500: fix double free of gma_connector

Tomi Valkeinen (2):
      dt-bindings: display: ti,am65x-dss: add missing properties to dt-sche=
ma
      dt-bindings: display: ti,j721e-dss: add missing properties to dt-sche=
ma

Wang Qing (1):
      video: use kobj_to_dev()

Wang ShaoBo (1):
      drm/imx/dcss: fix unused but set variable warnings

Xiaofei Tan (1):
      fbdev: mx3fb: remove unused variable 'irq'

Xin Ji (2):
      dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter DT schema
      drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP

Xu Wang (3):
      omapfb/dss: Remove redundant null check before clk_prepare_enable/clk=
_disable_unprepare
      video: fbdev: sh_mobile_lcdcfb: Remove redundant null check before cl=
k_prepare_enable/clk_disable_unprepare
      drm/bridge: ti-sn65dsi86: remove redundant null check

Yannick Fertre (2):
      drm/panel: rm68200: allow using non-continuous dsi clock
      drm/panel: rm68200: fix mode to 50fps

Zwane Mwaikambo (1):
      drm/dp_aux_dev: check aux_dev before use in drm_dp_aux_dev_get_by_min=
or()

 .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
 .../display/panel/mantix,mlaf057we51-x.yaml        |    4 +
 .../bindings/display/panel/novatek,nt36672a.yaml   |   87 +
 .../bindings/display/panel/panel-simple-dsi.yaml   |    3 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/ti/ti,am65x-dss.yaml          |   11 +
 .../bindings/display/ti/ti,j721e-dss.yaml          |   11 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/driver-api/dma-buf.rst               |    9 +
 Documentation/gpu/drm-mm.rst                       |    4 +-
 Documentation/gpu/todo.rst                         |   12 +-
 Documentation/gpu/vkms.rst                         |   99 +-
 MAINTAINERS                                        |   11 +-
 drivers/dma-buf/dma-buf.c                          |   63 +-
 drivers/dma-buf/dma-resv.c                         |    2 +-
 drivers/dma-buf/heaps/heap-helpers.c               |   10 +-
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |    5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   87 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  157 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    2 +-
 drivers/gpu/drm/arc/arcpgu_crtc.c                  |    4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |    8 +-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |   16 +-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.h    |    2 -
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |    4 +-
 drivers/gpu/drm/arm/malidp_crtc.c                  |    6 +-
 drivers/gpu/drm/armada/armada_crtc.c               |    8 +-
 drivers/gpu/drm/armada/armada_drv.c                |    3 -
 drivers/gpu/drm/armada/armada_gem.c                |   12 +-
 drivers/gpu/drm/armada/armada_gem.h                |    2 -
 drivers/gpu/drm/aspeed/Kconfig                     |    1 +
 drivers/gpu/drm/aspeed/aspeed_gfx.h                |    2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   78 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   23 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |    4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |    6 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    9 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |    2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1850 ++++++++++++++++=
++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  390 +++++
 drivers/gpu/drm/bridge/lvds-codec.c                |   29 +
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |    2 +-
 drivers/gpu/drm/bridge/tc358764.c                  |  107 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   43 +-
 drivers/gpu/drm/drm_atomic.c                       |   39 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   24 +-
 drivers/gpu/drm/drm_connector.c                    |    5 +
 drivers/gpu/drm/drm_dp_aux_dev.c                   |    2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |    7 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   26 +-
 drivers/gpu/drm/drm_fourcc.c                       |    1 +
 drivers/gpu/drm/drm_gem.c                          |   53 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |   28 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   17 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |  175 +-
 drivers/gpu/drm/drm_internal.h                     |    8 +-
 drivers/gpu/drm/drm_ioctl.c                        |    2 +-
 drivers/gpu/drm/drm_pci.c                          |    6 +-
 drivers/gpu/drm/drm_prime.c                        |   29 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |    4 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   13 -
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   19 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |   13 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   10 -
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |   15 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |    6 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    7 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    2 +
 drivers/gpu/drm/gma500/gem.c                       |   18 +-
 drivers/gpu/drm/gma500/gem.h                       |    3 +
 drivers/gpu/drm/gma500/psb_drv.c                   |    9 -
 drivers/gpu/drm/gma500/psb_drv.h                   |    2 -
 drivers/gpu/drm/hisilicon/hibmc/Makefile           |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   87 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   18 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   33 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c    |   99 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |   42 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   13 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   21 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    3 -
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   18 +-
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c   |   14 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    4 -
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    3 -
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |    9 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |   14 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |    2 -
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |    6 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  372 ++--
 drivers/gpu/drm/ingenic/ingenic-drm.h              |    7 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   12 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |    4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    5 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   11 +
 drivers/gpu/drm/meson/meson_crtc.c                 |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    7 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |    4 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   13 -
 drivers/gpu/drm/msm/msm_drv.h                      |    1 -
 drivers/gpu/drm/msm/msm_gem.c                      |   19 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  266 +--
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    4 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   14 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   14 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h              |    2 +
 drivers/gpu/drm/nouveau/nouveau_mem.c              |    8 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    4 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |    2 +
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   19 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   16 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |    4 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    9 -
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   18 +-
 drivers/gpu/drm/omapdrm/omap_gem.h                 |    2 -
 drivers/gpu/drm/panel/Kconfig                      |   21 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   25 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |  711 ++++++++
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   20 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |   14 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    7 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    2 +-
 drivers/gpu/drm/panel/panel-simple.c               |   29 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    2 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |  250 +++
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |    7 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    7 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |    8 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   62 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    5 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |    2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   11 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    1 -
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |    4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |   72 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |   25 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |    4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |  104 +-
 drivers/gpu/drm/radeon/radeon.h                    |    1 -
 drivers/gpu/drm/radeon/radeon_display.c            |    9 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   23 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |   31 +-
 drivers/gpu/drm/radeon/radeon_object.c             |  126 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    7 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  176 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |    6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    5 -
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    6 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    3 +
 drivers/gpu/drm/sti/sti_crtc.c                     |    4 +-
 drivers/gpu/drm/stm/ltdc.c                         |    4 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |    4 +-
 drivers/gpu/drm/tegra/dc.c                         |    8 +-
 drivers/gpu/drm/tegra/drm.c                        |    4 -
 drivers/gpu/drm/tegra/gem.c                        |   31 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |    6 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |    2 +
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   56 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   38 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |    7 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |    4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  192 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  103 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   40 +-
 drivers/gpu/drm/ttm/ttm_memory.c                   |    2 +-
 drivers/gpu/drm/ttm/ttm_page_alloc.c               |   89 +-
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c           |   77 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    2 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   10 +-
 {include =3D> drivers/gpu}/drm/ttm/ttm_set_memory.h  |   66 -
 drivers/gpu/drm/ttm/ttm_tt.c                       |  250 +--
 drivers/gpu/drm/tve200/tve200_drv.c                |    4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    4 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   21 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |    8 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   12 -
 drivers/gpu/drm/vc4/vc4_drv.h                      |    1 -
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   25 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |    9 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   21 +-
 drivers/gpu/drm/via/via_mm.c                       |    2 +-
 drivers/gpu/drm/virtio/Makefile                    |    2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   26 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |    4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   79 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  185 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   34 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   37 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   23 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   46 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  157 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c              |  164 ++
 drivers/gpu/drm/vkms/Makefile                      |    1 -
 drivers/gpu/drm/vkms/vkms_composer.c               |   17 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    4 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   30 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   29 -
 drivers/gpu/drm/vkms/vkms_gem.c                    |  248 ---
 drivers/gpu/drm/vkms/vkms_plane.c                  |   13 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   95 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  197 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    2 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |   44 +-
 drivers/gpu/drm/xen/xen_drm_front.h                |    2 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |   15 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |    6 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |   14 +-
 drivers/gpu/drm/zte/zx_vou.c                       |    4 +-
 drivers/gpu/vga/vga_switcheroo.c                   |    7 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   17 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   19 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   21 +-
 drivers/misc/fastrpc.c                             |    6 +-
 drivers/video/fbdev/aty/radeon_base.c              |    4 +-
 drivers/video/fbdev/cirrusfb.c                     |    3 +-
 drivers/video/fbdev/core/fbmem.c                   |   44 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |    3 +-
 drivers/video/fbdev/matrox/matroxfb_base.c         |    8 +-
 drivers/video/fbdev/mx3fb.c                        |    2 -
 drivers/video/fbdev/nvidia/nv_of.c                 |    3 +-
 .../omap2/omapfb/displays/connector-analog-tv.c    |    7 +-
 .../fbdev/omap2/omapfb/displays/connector-dvi.c    |    7 +-
 .../fbdev/omap2/omapfb/displays/connector-hdmi.c   |    7 +-
 .../video/fbdev/omap2/omapfb/displays/panel-dpi.c  |    7 +-
 .../omapfb/displays/panel-sharp-ls037v7dw01.c      |    7 +-
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   |    7 +-
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |    7 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c  |   10 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c  |   10 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c    |   10 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c    |   16 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c        |    6 +-
 drivers/video/fbdev/omap2/omapfb/dss/video-pll.c   |   20 +-
 drivers/video/fbdev/sbuslib.c                      |  124 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |    6 +-
 drivers/video/fbdev/sis/300vtbl.h                  |    2 -
 drivers/video/fbdev/sis/sis_accel.h                |   14 +-
 include/drm/drm_dp_helper.h                        |   72 +-
 include/drm/drm_drv.h                              |   85 +-
 include/drm/drm_gem.h                              |    2 +-
 include/drm/drm_gem_vram_helper.h                  |    3 -
 include/drm/drm_mode_config.h                      |   13 +
 include/drm/drm_modeset_helper_vtables.h           |   13 +-
 include/drm/drm_prime.h                            |    5 +-
 include/drm/ttm/ttm_bo_api.h                       |   83 +-
 include/drm/ttm/ttm_bo_driver.h                    |   91 +-
 include/drm/ttm/ttm_caching.h                      |   34 +
 include/drm/ttm/ttm_page_alloc.h                   |   12 +-
 include/drm/ttm/ttm_placement.h                    |   15 -
 include/drm/ttm/ttm_resource.h                     |   12 +-
 include/drm/ttm/ttm_tt.h                           |   82 +-
 include/linux/dma-buf-map.h                        |  193 ++
 include/linux/dma-buf.h                            |   14 +-
 include/linux/platform_data/shmob_drm.h            |    2 -
 include/uapi/drm/drm_fourcc.h                      |   41 +-
 include/uapi/drm/virtgpu_drm.h                     |   39 +-
 include/uapi/linux/virtio_gpu.h                    |   78 +
 295 files changed, 7571 insertions(+), 3384 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analog=
ix,anx7625.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek=
,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 create mode 100644 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
 rename {include =3D> drivers/gpu}/drm/ttm/ttm_set_memory.h (66%)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_vram.c
 delete mode 100644 drivers/gpu/drm/vkms/vkms_gem.c
 create mode 100644 include/drm/ttm/ttm_caching.h
 create mode 100644 include/linux/dma-buf-map.h

-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
