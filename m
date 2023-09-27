Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9833C7B018F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D5910E4B5;
	Wed, 27 Sep 2023 10:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA7910E05B;
 Wed, 27 Sep 2023 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695809399; x=1727345399;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=TJNpDjbYMLtmQD5BYcSskY6w0GtLnD8XO7hSMvZMOgo=;
 b=iqKBfxY1Hob3jHm9LddQEShjsXk51RBbQhOJ+SdHEReyJZodgH/0/UFw
 pY1NAfMgSLD22gbdttjgfzqyRTdCtlyDeGNa8Bfpx630N1VGEsMJmS2FP
 znuuZB/yEJ328uzEx3cUWPsOyhQerzu8RfBRhmevPX7lEs59YOJeIP5Xi
 TulsGCQwz1fO6E2UnLyWcQbrhYjSmSw8WrBdFhPFEpHMINvCa3eE5IC8F
 MqiMUxXiSXjKR9Wqk28EGUJ0WwoL3xQkIc7cD8x9/1rc9U5HNaXZLs6VB
 P/ks+IPoL2vVoSp/h6NBFGMm0Z6ghlJjlVKeApNs248VUUMzPkljIeTFJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381689030"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="381689030"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="477992"
Received: from vcorfu1-mobl.ger.corp.intel.com (HELO [10.251.220.226])
 ([10.251.220.226])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:09:23 -0700
Message-ID: <f1fae5eb-25b8-192a-9a53-215e1184ce81@linux.intel.com>
Date: Wed, 27 Sep 2023 12:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2023-09-27:
drm-misc-next for v6.7-rc1:

UAPI Changes:
- drm_file owner is now updated during use, in the case of a drm fd
   opened by the display server for a client, the correct owner is
   displayed.
- Qaic gains support for the QAIC_DETACH_SLICE_BO ioctl to allow bo
   recycling.

Cross-subsystem Changes:
- Disable boot logo for au1200fb, mmpfb and unexport logo helpers.
   Only fbcon should manage display of logo.
- Update freescale in MAINTAINERS.
- Add some bridge files to bridge in MAINTAINERS.
- Update gma500 driver repo in MAINTAINERS to point to drm-misc.

Core Changes:
- Move size computations to drm buddy allocator.
- Make drm_atomic_helper_shutdown(NULL) a nop.
- Assorted small fixes in drm_debugfs, DP-MST payload addition error 
handling.
- Fix DRM_BRIDGE_ATTACH_NO_CONNECTOR handling.
- Handle bad (h/v)sync_end in EDID by clipping to htotal.
- Build GPUVM as a module.

Driver Changes:
- Simple drivers don't need to cache prepared result.
- Call drm_atomic_helper_shutdown() in shutdown/unbind for a whole lot
   more drm drivers.
- Assorted small fixes in amdgpu, ssd130x, bridge/it6621, accel/qaic,
   nouveau, tc358768.
- Add NV12 for komeda writeback.
- Add arbitration lost event to synopsis/dw-hdmi-cec.
- Speed up s/r in nouveau by not restoring some big bo's.
- Assorted nouveau display rework in preparation for GSP-RM,
   especially related to how the modeset sequence works and
   the DP sequence in relation to link training.
- Update anx7816 panel.
- Support NVSYNC and NHSYNC in tegra.
- Allow multiple power domains in simple driver.
The following changes since commit 15d30b46573d75f5cb58cfacded8ebab9c76a2b0:

   drm/ssd130x: Use bool for ssd130x_deviceinfo flags (2023-09-10 
09:05:47 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-09-27

for you to fetch changes up to 78f54469b871db5ba8ea49abd4e5994e97bd525b:

   drm/nouveau: uvmm: rename 'umgr' to 'base' (2023-09-26 01:58:29 +0200)

----------------------------------------------------------------
drm-misc-next for v6.7-rc1:

UAPI Changes:
- drm_file owner is now updated during use, in the case of a drm fd
   opened by the display server for a client, the correct owner is
   displayed.
- Qaic gains support for the QAIC_DETACH_SLICE_BO ioctl to allow bo
   recycling.

Cross-subsystem Changes:
- Disable boot logo for au1200fb, mmpfb and unexport logo helpers.
   Only fbcon should manage display of logo.
- Update freescale in MAINTAINERS.
- Add some bridge files to bridge in MAINTAINERS.
- Update gma500 driver repo in MAINTAINERS to point to drm-misc.

Core Changes:
- Move size computations to drm buddy allocator.
- Make drm_atomic_helper_shutdown(NULL) a nop.
- Assorted small fixes in drm_debugfs, DP-MST payload addition error 
handling.
- Fix DRM_BRIDGE_ATTACH_NO_CONNECTOR handling.
- Handle bad (h/v)sync_end in EDID by clipping to htotal.
- Build GPUVM as a module.

Driver Changes:
- Simple drivers don't need to cache prepared result.
- Call drm_atomic_helper_shutdown() in shutdown/unbind for a whole lot
   more drm drivers.
- Assorted small fixes in amdgpu, ssd130x, bridge/it6621, accel/qaic,
   nouveau, tc358768.
- Add NV12 for komeda writeback.
- Add arbitration lost event to synopsis/dw-hdmi-cec.
- Speed up s/r in nouveau by not restoring some big bo's.
- Assorted nouveau display rework in preparation for GSP-RM,
   especially related to how the modeset sequence works and
   the DP sequence in relation to link training.
- Update anx7816 panel.
- Support NVSYNC and NHSYNC in tegra.
- Allow multiple power domains in simple driver.

----------------------------------------------------------------
Alicja Michalska (2):
       dt-bindings: display: anx7814: Add definition for anx7816
       drm/bridge/analogix/anx78xx: Add missing definition

AngeloGioacchino Del Regno (1):
       drm/bridge: panel: Fix device link for DRM_BRIDGE_ATTACH_NO_CONNECTOR

Arunpravin Paneer Selvam (3):
       drm/buddy: Improve contiguous memory allocation
       drm/amdgpu: Move the size computations to drm buddy
       drm/i915: Move the size computations to drm buddy

Ben Skeggs (43):
       drm/nouveau/devinit/tu102-: remove attempt at loading PreOS
       drm/nouveau/imem: support allocations not preserved across suspend
       drm/nouveau/gr/gf100-: lose contents of global ctxbufs across suspend
       drm/nouveau/mmu/gp100-: always invalidate TLBs at CACHE_LEVEL_ALL
       drm/nouveau/kms/nv50-: fix mst payload alloc fail crashing evo
       drm/nouveau/disp: rearrange output methods
       drm/nouveau/disp: add output detect method
       drm/nouveau/disp: add output method to fetch edid
       drm/nouveau/disp: rename internal output acquire/release functions
       drm/nouveau/disp: shuffle to make upcoming diffs prettier
       drm/nouveau/disp: add acquire_dac()
       drm/nouveau/disp: add acquire_sor/pior()
       drm/nouveau/disp: update SOR routing immediately on acquire()
       drm/nouveau/kms/nv50-: pull some common init out of OR-specific code
       drm/nouveau/kms/nv50-: remove nv_encoder.audio.connector
       drm/nouveau/kms/nv50-: keep output state around until modeset 
complete
       drm/nouveau/kms/nv50-: move audio enable post-modeset
       drm/nouveau/disp: add output hdmi config method
       drm/nouveau/disp: move hdmi disable out of release()
       drm/nouveau/disp: release outputs post-modeset
       drm/nouveau/disp: remove SOR routing updates from supervisor
       drm/nouveau/disp: add output backlight control methods
       drm/nouveau/disp: add output lvds config method
       drm/nouveau/disp: add hdmi audio hal function
       drm/nouveau/disp: move dp aux pwr method to HAL
       drm/nouveau/disp: add dp aux xfer method
       drm/nouveau/disp: add dp rates method
       drm/nouveau/kms/nv50-: split DP disable+enable into two modesets
       drm/nouveau/kms/nv50-: flush mst disables together
       drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link
       drm/nouveau/disp: add dp train method
       drm/nouveau/disp: move link training out of supervisor
       drm/nouveau/disp: add dp sst config method
       drm/nouveau/disp: add dp mst id get/put methods
       drm/nouveau/disp: move outp/conn construction to chipset code
       drm/nouveau/disp: move outp init/fini paths to chipset code
       drm/nouveau/disp/nv50-: skip DCB_OUTPUT_TV
       drm/nouveau/kms/nv50-: create heads based on nvkm head mask
       drm/nouveau/kms/nv50-: create heads after outps/conns
       drm/nouveau/kms/nv50-: name aux channels after their connector
       drm/nouveau/kms/nv50-: create connectors based on nvkm info
       drm/nouveau/kms/nv50-: create outputs based on nvkm info
       drm/nouveau/kms/nv50-: disable dcb parsing

Danilo Krummrich (3):
       drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
       drm/gpuvm: allow building as module
       drm/nouveau: uvmm: rename 'umgr' to 'base'

Douglas Anderson (14):
       drm/panel: Don't store+check prepared/enabled for simple cases
       drm/panel: s6e63m0: Don't store+check prepared/enabled
       drm/panel: otm8009a: Don't double check prepared/enabled
       MAINTAINERS: Update DRM DRIVERS FOR FREESCALE IMX entry
       drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a noop
       drm/imx/ipuv3: Call drm_atomic_helper_shutdown() at 
shutdown/unbind time
       drm/ingenic: Call drm_atomic_helper_shutdown() at shutdown time
       drm/armada: Call drm_atomic_helper_shutdown() at shutdown time
       drm: Call drm_atomic_helper_shutdown() at shutdown time for misc 
drivers
       drm/vc4: Call drm_atomic_helper_shutdown() at shutdown time
       drm/ssd130x: Call drm_atomic_helper_shutdown() at remove time
       drm: Call drm_atomic_helper_shutdown() at shutdown/remove time 
for misc drivers
       drm/hisilicon/kirin: Call drm_atomic_helper_shutdown() at 
shutdown/unbind time
       drm/imx/dcss: Call drm_atomic_helper_shutdown() at shutdown time

Imre Deak (3):
       drm/dp_mst: Fix NULL dereference during payload addition
       drm/dp_mst: Sanitize error return during payload addition
       drm/dp_mst: Tune down error message during payload addition

Jani Nikula (2):
       drm: bridge: it66121: ->get_edid callback must not return err 
pointers
       MAINTAINERS: add drm_bridge_connector.[ch] files under bridge chips

Janne Grunau (1):
       drm/simpledrm: Add support for multiple "power-domains"

Javier Martinez Canillas (2):
       drm/ssd130x: Store the HW buffer in the driver-private CRTC state
       drm/ssd130x: Drop _helper prefix from struct drm_*_helper_funcs 
callbacks

Jernej Skrabec (1):
       drm/bridge: dw-hdmi-cec: Add arbitration lost event

Justin Stitt (3):
       drm/nouveau/nvif: refactor deprecated strncpy
       drm/nouveau/core: refactor deprecated strncpy
       drm/nouveau/pm: refactor deprecated strncpy

Lyude Paul (1):
       drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state

Maxime Ripard (1):
       MAINTAINERS: Update gma500 git repo

Nathan Chancellor (2):
       drm/amd/display: Fix -Wuninitialized in 
dm_helpers_dp_mst_send_payload_allocation()
       drm/debugfs: Fix drm_debugfs_remove_files() stub

Pranjal Ramajor Asha Kanojiya (9):
       accel/qaic: Register for PCI driver at the beginning of module init
       accel/qaic: Use devm_drm_dev_alloc() instead of drm_dev_alloc()
       accel/qaic: Remove ->size field from struct qaic_bo
       accel/qaic: Update BO metadata in a central location
       accel/qaic: Declare BO 'sliced' after all the operations are complete
       accel/qaic: Undo slicing setup done in qaic_attach_slicing_bo()
       accel/qaic: Clean up BO during flushing of transfer list
       accel/qaic: Create a function to initialize BO
       accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL

Thierry Reding (1):
       drm/tegra: rgb: Parameterize V- and H-sync polarities

Thomas Zimmermann (7):
       fbdev/au1200fb: Do not display boot-up logo
       fbdev/mmp/mmpfb: Do not display boot-up logo
       fbdev/core: Fix style of code for boot-up logo
       fbdev/core: Unexport logo helpers
       fbdev/core: Move logo functions into separate source file
       fbdev/core: Remove empty internal helpers from fb_logo.c
       fbdev/core: Clean up include statements in fbmem.c

Tomi Valkeinen (11):
       drm/bridge: tc358768: Fix use of uninitialized variable
       drm/bridge: tc358768: Default to positive h/v syncs
       drm/bridge: tc358768: Fix bit updates
       drm/bridge: tc358768: Cleanup PLL calculations
       drm/bridge: tc358768: Use struct videomode
       drm/bridge: tc358768: Print logical values, not raw register values
       drm/bridge: tc358768: Use dev for dbg prints, not priv->dev
       drm/bridge: tc358768: Rename dsibclk to hsbyteclk
       drm/bridge: tc358768: Clean up clock period code
       drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
       drm/bridge: tc358768: Attempt to fix DSI horizontal timings

Tvrtko Ursulin (1):
       drm: Update file owner during use

Ville Syrjälä (1):
       drm/edid: Fixup h/vsync_end instead of h/vtotal

Xin Ji (1):
       drm/bridge: Add 200ms delay to wait FW HPD status stable

baozhu.liu (1):
       drm/komeda: add NV12 format to support writeback layer type

  Documentation/accel/qaic/qaic.rst                  |  10 +
  .../bindings/display/bridge/analogix,anx7814.yaml  |   1 +
  MAINTAINERS                                        |   8 +-
  drivers/accel/qaic/qaic.h                          |  13 +-
  drivers/accel/qaic/qaic_data.c                     | 187 +++++--
  drivers/accel/qaic/qaic_drv.c                      | 119 ++---
  drivers/gpu/drm/Kconfig                            |   7 +
  drivers/gpu/drm/Makefile                           |   2 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   6 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  58 +--
  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   6 +-
  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c   |   2 +-
  drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |   9 +
  drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |   7 +
  drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |   1 +
  drivers/gpu/drm/arm/hdlcd_drv.c                    |   6 +
  drivers/gpu/drm/arm/malidp_drv.c                   |   6 +
  drivers/gpu/drm/armada/armada_drv.c                |   8 +
  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   7 +
  drivers/gpu/drm/ast/ast_drv.c                      |   6 +
  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   6 +
  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   2 +
  drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +
  drivers/gpu/drm/bridge/ite-it66121.c               |   4 +-
  drivers/gpu/drm/bridge/panel.c                     |  17 +-
  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |   6 +-
  drivers/gpu/drm/bridge/tc358768.c                  | 383 +++++++++++----
  drivers/gpu/drm/display/drm_dp_mst_topology.c      |  23 +-
  drivers/gpu/drm/drm_atomic_helper.c                |   3 +
  drivers/gpu/drm/drm_auth.c                         |   3 +-
  drivers/gpu/drm/drm_buddy.c                        | 138 +++++-
  drivers/gpu/drm/drm_debugfs.c                      |  26 +-
  drivers/gpu/drm/drm_edid.c                         |  18 +-
  drivers/gpu/drm/drm_file.c                         |  40 +-
  drivers/gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c}   | 407 ++++++++--------
  drivers/gpu/drm/drm_ioctl.c                        |   3 +
  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   8 +
  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   6 +
  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |   9 +
  drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |   6 +
  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |  23 +-
  drivers/gpu/drm/imx/dcss/dcss-drv.c                |   8 +
  drivers/gpu/drm/imx/dcss/dcss-kms.c                |   7 +
  drivers/gpu/drm/imx/dcss/dcss-kms.h                |   1 +
  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   8 +
  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  66 ++-
  drivers/gpu/drm/logicvc/logicvc_drm.c              |   9 +
  drivers/gpu/drm/loongson/lsdc_drv.c                |   6 +
  drivers/gpu/drm/mcde/mcde_drv.c                    |   9 +
  drivers/gpu/drm/mgag200/mgag200_drv.c              |   8 +
  drivers/gpu/drm/nouveau/Kconfig                    |   1 +
  drivers/gpu/drm/nouveau/dispnv04/disp.c            |   2 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c            | 511 
++++++++++++-------
  drivers/gpu/drm/nouveau/dispnv50/disp.h            |   6 +-
  drivers/gpu/drm/nouveau/dispnv50/head.h            |   1 +
  drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |  14 +
  drivers/gpu/drm/nouveau/include/nvif/conn.h        |  20 +-
  drivers/gpu/drm/nouveau/include/nvif/if0011.h      |  21 +-
  drivers/gpu/drm/nouveau/include/nvif/if0012.h      | 249 ++++++++--
  drivers/gpu/drm/nouveau/include/nvif/outp.h        |  96 +++-
  drivers/gpu/drm/nouveau/include/nvkm/core/memory.h |   1 +
  .../gpu/drm/nouveau/include/nvkm/subdev/instmem.h  |   2 +-
  drivers/gpu/drm/nouveau/nouveau_backlight.c        |  90 +---
  drivers/gpu/drm/nouveau/nouveau_bios.c             |   8 +-
  drivers/gpu/drm/nouveau/nouveau_connector.c        | 252 +++++-----
  drivers/gpu/drm/nouveau/nouveau_connector.h        |   3 +-
  drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   2 +-
  drivers/gpu/drm/nouveau/nouveau_display.c          |   8 +-
  drivers/gpu/drm/nouveau/nouveau_dp.c               | 345 +++++++++++--
  drivers/gpu/drm/nouveau/nouveau_drm.c              |   5 +-
  drivers/gpu/drm/nouveau/nouveau_encoder.h          |  30 +-
  drivers/gpu/drm/nouveau/nouveau_exec.c             |   4 +-
  drivers/gpu/drm/nouveau/nouveau_uvmm.c             |  42 +-
  drivers/gpu/drm/nouveau/nouveau_uvmm.h             |   8 +-
  drivers/gpu/drm/nouveau/nvif/client.c              |   2 +-
  drivers/gpu/drm/nouveau/nvif/conn.c                |  36 +-
  drivers/gpu/drm/nouveau/nvif/disp.c                |   2 +-
  drivers/gpu/drm/nouveau/nvif/outp.c                | 412 ++++++++++++++--
  drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |   3 +-
  drivers/gpu/drm/nouveau/nvkm/core/memory.c         |  15 +-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    | 146 +-----
  drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c    |  10 -
  drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h    |   2 -
  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      | 362 ++++----------
  drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c     |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c     |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c   |   2 +-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c   |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c   |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c   |  17 +-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c   |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c   |  38 ++
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |   2 +-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |  15 +-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c   |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c    | 182 ++++++-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c    | 144 ++++--
  drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h    |  43 +-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |  67 +--
  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   | 460 +++++++++++++----
  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |  10 +-
  drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c      |   7 +-
  .../gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c    |  12 +-
  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |  19 +-
  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h |   1 +
  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |   2 +-
  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c |   2 +-
  drivers/gpu/drm/omapdrm/omap_drv.c                 |   8 +
  .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |   9 -
  drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |   9 -
  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |   9 -
  drivers/gpu/drm/panel/panel-novatek-nt35950.c      |   9 -
  drivers/gpu/drm/panel/panel-novatek-nt36523.c      |  12 -
  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |  17 -
  drivers/gpu/drm/panel/panel-raydium-rm68200.c      |  38 --
  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |  25 -
  .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |  10 -
  drivers/gpu/drm/panel/panel-samsung-sofef00.c      |   9 -
  drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |  10 -
  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   9 -
  .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |  18 -
  .../gpu/drm/panel/panel-startek-kd070fhfid015.c    |  11 -
  drivers/gpu/drm/panel/panel-truly-nt35597.c        |  20 -
  drivers/gpu/drm/panel/panel-visionox-r66451.c      |  16 -
  drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   8 -
  drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |   9 -
  drivers/gpu/drm/pl111/pl111_drv.c                  |   7 +
  drivers/gpu/drm/qxl/qxl_drv.c                      |   7 +
  drivers/gpu/drm/solomon/ssd130x.c                  | 194 +++++---
  drivers/gpu/drm/sti/sti_drv.c                      |   7 +
  drivers/gpu/drm/stm/drv.c                          |   7 +
  drivers/gpu/drm/sun4i/sun4i_drv.c                  |   6 +
  drivers/gpu/drm/tegra/rgb.c                        |  16 +-
  drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  11 +-
  drivers/gpu/drm/tiny/bochs.c                       |   6 +
  drivers/gpu/drm/tiny/cirrus.c                      |   6 +
  drivers/gpu/drm/tiny/simpledrm.c                   | 105 ++++
  drivers/gpu/drm/tve200/tve200_drv.c                |   7 +
  drivers/gpu/drm/vboxvideo/vbox_drv.c               |  10 +
  drivers/gpu/drm/vc4/vc4_drv.c                      |  36 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   6 +-
  drivers/video/fbdev/au1200fb.c                     |   9 -
  drivers/video/fbdev/core/Makefile                  |   2 +
  drivers/video/fbdev/core/fb_internal.h             |  17 +
  drivers/video/fbdev/core/fb_logo.c                 | 508 
+++++++++++++++++++
  drivers/video/fbdev/core/fbcon.c                   |   2 +
  drivers/video/fbdev/core/fbmem.c                   | 542 
+--------------------
  drivers/video/fbdev/mmp/fb/mmpfb.c                 |   7 -
  include/drm/drm_buddy.h                            |   6 +-
  include/drm/drm_debugfs.h                          |   9 +-
  include/drm/drm_file.h                             |  13 +-
  include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h}       | 155 +++---
  include/linux/fb.h                                 |   5 -
  include/uapi/drm/qaic_accel.h                      |  24 +-
  156 files changed, 4652 insertions(+), 2801 deletions(-)
  rename drivers/gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c} (78%)
  create mode 100644 drivers/video/fbdev/core/fb_logo.c
  rename include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h} (78%)
