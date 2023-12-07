Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07380850E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB49010E826;
	Thu,  7 Dec 2023 09:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF7E10E826
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701943149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ms8UncPlgcNfW0YFQ+vXf5RNFabBq2wTZbql29AYOu4=;
 b=DUU4G1cU8aTkBXydgz1hOfP730TBFNVgwXJJfxve+UsQ///nNmQo5QWZQXF59Q8U3rx2MC
 wmtTdte22O1mG3EpS/Tg3RdkSkG1/GanBVX7N2A52oV5uLC2qMnc7ujrNkwVW9GunOzNi+
 qxL8yvA1k/YP5cKyJMygrLoEj+rjxHU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-OB8ZwgNvOIG30d-hsURNiQ-1; Thu, 07 Dec 2023 04:59:05 -0500
X-MC-Unique: OB8ZwgNvOIG30d-hsURNiQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-333405020afso659016f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 01:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701943144; x=1702547944;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ms8UncPlgcNfW0YFQ+vXf5RNFabBq2wTZbql29AYOu4=;
 b=BsUXDmnoRtVqo0+n8vWSsQsBHXPsZWfhRjpbwh/Z+VUNobjL1Xlv9fsoPHOJ/NBldg
 y2nKBzwmy8yvr105xm8LScn48QVZNj529yjOIKIQvuuDveTbRa3zdrw0Twk7p5MOkSOE
 hjyBupOfmaUCrLGoPRh3K0DLB7VkVMO/KOW2zlTVLFr1DO7uqzD8y8KFL5cStTto4Igi
 LoAzJoe0u77BUqJM3EZ+27sc7xJNYV98SdbgifF7yy4Fcb79RqCg6psxvHdJowFLe1CY
 hYH6Ezoy1nnjF53+s19QkEJxGVvmUO505wdlIju8JJyt4jikbF3elHotsQCObfw8+JFz
 Fz3g==
X-Gm-Message-State: AOJu0Yz2GRxZvnzj8zInASOSF8RYKf0VvqI0H55nRll+ZP0lwMNiHprT
 8CF/A/umJGq88kTo8tkpLIx+pp5dI2e/GW2MFqt7NF3W18UxvuyExNmMFw5wUphP2E7RoFZcinE
 duubswzL8eMO0S7F6LhUmlxZ2gYRQ
X-Received: by 2002:adf:e952:0:b0:333:2fd2:5d3d with SMTP id
 m18-20020adfe952000000b003332fd25d3dmr1259224wrn.111.1701943144458; 
 Thu, 07 Dec 2023 01:59:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFoWNjH3goB8O/YVmCMnBpWe51RijMNHv733WkEsM1BwO0fF9qR8Rioa5D6Kizd2/mg8ZX4Q==
X-Received: by 2002:adf:e952:0:b0:333:2fd2:5d3d with SMTP id
 m18-20020adfe952000000b003332fd25d3dmr1259210wrn.111.1701943143974; 
 Thu, 07 Dec 2023 01:59:03 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 s13-20020adff80d000000b003334a0513dbsm996300wrp.67.2023.12.07.01.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 01:59:03 -0800 (PST)
Date: Thu, 7 Dec 2023 10:59:03 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <yu5heqaufyeo4nlowzieu4s5unwqrqyx4jixbfjmzdon677rpk@t53vceua2dao>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wgwzsblzmz3j3rey"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wgwzsblzmz3j3rey
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Sima,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2023-12-07:
drm-misc-next for 6.8:

UAPI Changes:
  - Remove Userspace Mode-Setting ioctls
  - v3d: New uapi to handle jobs involving the CPU

Cross-subsystem Changes:

Core Changes:
  - atomic: Add support for FB-less planes which got reverted a bit
    later for lack of IGT tests and userspace code, Dump private objects
    state in drm_state_dump.
  - dma-buf: Add fence deadline support
  - encoder: Create per-encoder debugfs directory, move the bridge chain
    file to that directory

Driver Changes:
  - Include drm_auth.h in driver that use it but don't include it, Drop
    drm_plane_helper.h from drivers that include it but don't use it
  - imagination: Plenty of small fixes
  - panfrost: Improve interrupt handling at poweroff
  - qaic: Convert to persistent DRM devices
  - tidss: Support for the AM62A7, a few probe improvements, some cleanups
  - v3d: Support for jobs involving the CPU

  - bridge:
    - Create transparent aux-bridge for DP/USB-C
    - lt8912b: Add suspend/resume support and power regulator support

  - panel:
    - himax-hx8394: Drop prepare, unprepare and shutdown logic, Support
      panel rotation
    - New panels: BOE BP101WX1-100, Powkiddy X55, Ampire AM8001280G,
      Evervision VGG644804, SDC ATNA45AF01
The following changes since commit a13fee31f56449fc600d9e064c7b32302f92dcef:

  Merge v6.7-rc3 into drm-next (2023-11-28 11:55:56 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-12-07

for you to fetch changes up to 90d50b8d85834e73536fdccd5aa913b30494fef0:

  drm/mipi-dsi: Fix detach call without attach (2023-12-07 09:22:47 +0200)

----------------------------------------------------------------
drm-misc-next for 6.8:

UAPI Changes:
  - Remove Userspace Mode-Setting ioctls
  - v3d: New uapi to handle jobs involving the CPU

Cross-subsystem Changes:

Core Changes:
  - atomic: Add support for FB-less planes which got reverted a bit
    later for lack of IGT tests and userspace code, Dump private objects
    state in drm_state_dump.
  - dma-buf: Add fence deadline support
  - encoder: Create per-encoder debugfs directory, move the bridge chain
    file to that directory

Driver Changes:
  - Include drm_auth.h in driver that use it but don't include it, Drop
    drm_plane_helper.h from drivers that include it but don't use it
  - imagination: Plenty of small fixes
  - panfrost: Improve interrupt handling at poweroff
  - qaic: Convert to persistent DRM devices
  - tidss: Support for the AM62A7, a few probe improvements, some cleanups
  - v3d: Support for jobs involving the CPU

  - bridge:
    - Create transparent aux-bridge for DP/USB-C
    - lt8912b: Add suspend/resume support and power regulator support

  - panel:
    - himax-hx8394: Drop prepare, unprepare and shutdown logic, Support
      panel rotation
    - New panels: BOE BP101WX1-100, Powkiddy X55, Ampire AM8001280G,
      Evervision VGG644804, SDC ATNA45AF01

----------------------------------------------------------------
Abel Vesa (1):
      drm/panel-edp: Add SDC ATNA45AF01

Abhinav Kumar (2):
      drm: improve the documentation of connector hpd ops
      drm: remove drm_bridge_hpd_disable() from drm_bridge_connector_destro=
y()

Alex Bee (1):
      dt-bindings: gpu: mali-utgard: Add Rockchip RK3128 compatible

Andrew Davis (1):
      drm/omapdrm: Improve check for contiguous buffers

Andr=E9 Almeida (1):
      drm: Refuse to async flip with atomic prop changes

AngeloGioacchino Del Regno (3):
      drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
      drm/panfrost: Add gpu_irq, mmu_irq to struct panfrost_device
      drm/panfrost: Synchronize and disable interrupts before powering off

Aradhya Bhatia (2):
      dt-bindings: display: ti: Add support for am62a7 dss
      drm/tidss: Add support for AM62A7 DSS

Arnd Bergmann (1):
      drm/imagination: move update_logtype() into ifdef section

Bert Karwatzki (1):
      drm/sched: Partial revert of "Qualify drm_sched_wakeup() by drm_sched=
_entity_is_ready()"

Boris Brezillon (1):
      drm/gpuvm: Let drm_gpuvm_bo_put() report when the vm_bo object is des=
troyed

Carl Vanderlip (2):
      accel/qaic: Increase number of in_reset states
      accel/qaic: Expand DRM device lifecycle

Chris Morgan (6):
      drm/panel: himax-hx8394: Drop prepare/unprepare tracking
      drm/panel: himax-hx8394: Drop shutdown logic
      dt-bindings: display: Document Himax HX8394 panel rotation
      drm/panel: himax-hx8394: Add Panel Rotation Support
      dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
      drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel

Colin Ian King (1):
      drm/imagination: Fix a couple of spelling mistakes in literal strings

Dan Carpenter (5):
      drm/imagination: Fix error codes in pvr_device_clk_init()
      drm/imagination: Fix IS_ERR() vs NULL bug in pvr_request_firmware()
      drm/imagination: fix off by one in pvr_vm_mips_init() error handling
      drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
      drm/bridge: nxp-ptn3460: simplify some error checking

Danilo Krummrich (8):
      drm/nouveau: use GPUVM common infrastructure
      drm/nouveau: implement 1:1 scheduler - entity relationship
      drm/nouveau: enable dynamic job-flow control
      drm/imagination: vm: prevent duplicate drm_gpuvm_bo instances
      drm/imagination: vm: check for drm_gpuvm_range_valid()
      drm/imagination: vm: fix drm_gpuvm reference count
      drm/gpuvm: fall back to drm_exec_lock_obj()
      drm/imagination: vm: make use of GPUVM's drm_exec helper

Dario Binacchi (1):
      drm/bridge: Fix typo in post_disable() description

Dmitry Baryshkov (17):
      drm/drv: propagate errors from drm_modeset_register_all()
      drm/bridge: add transparent bridge helper
      phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
      usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
      drm/bridge: implement generic DP HPD bridge
      soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
      usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
      drm/encoder: register per-encoder debugfs dir
      drm/bridge: migrate bridge_chains to per-encoder file
      Revert "drm/atomic: Loosen FB atomic checks"
      Revert "drm/atomic: Move framebuffer checks to helper"
      Revert "drm/atomic: Add solid fill data to plane state dump"
      Revert "drm/atomic: Add pixel source to plane state dump"
      Revert "drm: Add solid fill pixel source"
      Revert "drm: Introduce solid fill DRM plane property"
      Revert "drm: Introduce pixel_source DRM plane property"
      drm/atomic: add private obj state to state dump

Donald Robson (7):
      drm/imagination: Numerous documentation fixes.
      drm/imagination: Fixed warning due to implicit cast to bool
      drm/imagination: Fixed missing header in pvr_fw_meta
      drm/imagination: pvr_device_process_active_queues now static
      drm/imagination: pvr_gpuvm_free() now static
      drm/imagination: Removed unused function to_pvr_vm_gpuva()
      drm/imagination: Removed unused functions in pvr_fw_trace

Frank Binns (1):
      MAINTAINERS: Document Imagination PowerVR driver patches go via drm-m=
isc

Harshit Mogalapalli (1):
      drm/v3d: Fix missing error code in v3d_submit_cpu_ioctl()

Hsin-Yi Wang (3):
      drm/panel-edp: Add override_edid_mode quirk for generic edp
      drm/panel-edp: Add auo_b116xa3_mode
      drm/panel-edp: Avoid adding multiple preferred modes

Javier Martinez Canillas (5):
      drm: Allow drivers to indicate the damage helpers to ignore damage cl=
ips
      drm/virtio: Disable damage clipping if FB changed since last page-flip
      drm/vmwgfx: Disable damage clipping if FB changed since last page-flip
      drm/plane: Extend damage tracking kernel-doc
      drm/todo: Add entry about implementing buffer age for damage tracking

Jean Delvare (1):
      drm/loongson: Add platform dependency

Jessica Zhang (7):
      drm: Introduce pixel_source DRM plane property
      drm: Introduce solid fill DRM plane property
      drm: Add solid fill pixel source
      drm/atomic: Add pixel source to plane state dump
      drm/atomic: Add solid fill data to plane state dump
      drm/atomic: Move framebuffer checks to helper
      drm/atomic: Loosen FB atomic checks

Khaled Almahallawy (1):
      drm/display/dp: Add the remaining Square PHY patterns DPCD register d=
efinitions

Liu Ying (1):
      drm/bridge: imx93-mipi-dsi: Fix a couple of building warnings

Luben Tuikov (4):
      drm/sched: Fix bounds limiting when given a malformed entity
      drm/sched: Rename priority MIN to LOW
      drm/sched: Reverse run-queue priority enumeration
      drm/sched: Fix compilation issues with DRM priority rename

Marco Felsch (1):
      drm/panel: ilitek-ili9881c: make use of prepare_prev_first

Marco Pagani (1):
      drm/test: add a test suite for GEM objects backed by shmem

Ma=EDra Canal (11):
      drm/v3d: Don't allow two multisync extensions in the same job
      drm/v3d: Decouple job allocation from job initiation
      drm/v3d: Use v3d_get_extensions() to parse CPU job data
      drm/v3d: Create tracepoints to track the CPU job
      drm/v3d: Enable BO mapping
      drm/v3d: Create a CPU job extension for a indirect CSD job
      drm/v3d: Create a CPU job extension for the timestamp query job
      drm/v3d: Create a CPU job extension for the reset timestamp job
      drm/v3d: Create a CPU job extension to copy timestamp query to a buff=
er
      drm/v3d: Create a CPU job extension for the reset performance query j=
ob
      drm/v3d: Create a CPU job extension for the copy performance query job

Melissa Wen (6):
      drm/v3d: Remove unused function header
      drm/v3d: Move wait BO ioctl to the v3d_bo file
      drm/v3d: Detach job submissions IOCTLs to a new specific file
      drm/v3d: Simplify job refcount handling
      drm/v3d: Add a CPU job submission
      drm/v3d: Detach the CSD job BO setup

Michael Banack (1):
      drm: Introduce documentation for hotspot properties

Michael Walle (2):
      dt-bindings: display: simple: add Evervision VGG644804 panel
      drm/panel-simple: add Evervision VGG644804 panel entry

Philipp Zabel (2):
      dt-bindings: ili9881c: Add Ampire AM8001280G LCD panel
      drm/panel: ilitek-ili9881c: Add Ampire AM8001280G LCD panel

Pin-yen Lin (1):
      drm/edp-panel: Sort the panel entries

Rajneesh Bhardwaj (1):
      drm/ttm: Schedule delayed_delete worker closer

Ramesh Errabolu (1):
      dma-buf: Correct the documentation of name and exp_name symbols

Rob Clark (3):
      drm/syncobj: Add deadline support for syncobj waits
      dma-buf/sync_file: Add SET_DEADLINE ioctl
      dma-buf/sw_sync: Add fence deadline support

Rob Herring (1):
      drm: Use device_get_match_data()

Simon Ser (2):
      drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
      drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP

Stefan Eichenberger (3):
      drm/bridge: lt8912b: Add suspend/resume support
      dt-bindings: display: bridge: lt8912b: Add power supplies
      drm/bridge: lt8912b: Add power supplies

Thomas Hellstr=F6m (1):
      Documentation/gpu: VM_BIND locking document

Thomas Zimmermann (64):
      Merge drm/drm-next into drm-misc-next
      drm/ast: Turn ioregs_lock to modeset_lock
      drm/ast: Rework I/O register setup
      drm/ast: Retrieve I/O-memory ranges without ast device
      drm/ast: Add I/O helpers without ast device
      drm/ast: Enable VGA without ast device instance
      drm/ast: Enable MMIO without ast device instance
      drm/ast: Partially implement POST without ast device instance
      drm/ast: Add enum ast_config_mode
      drm/ast: Detect ast device type and config mode without ast device
      drm/ast: Move detection code into PCI probe helper
      fbdev/acornfb: Fix name of fb_ops initializer macro
      fbdev/sm712fb: Use correct initializer macros for struct fb_ops
      fbdev/vfb: Set FBINFO_VIRTFB flag
      fbdev/vfb: Initialize fb_ops with fbdev macros
      fbdev/arcfb: Set FBINFO_VIRTFB flag
      fbdev/arcfb: Use generator macros for deferred I/O
      auxdisplay/cfag12864bfb: Set FBINFO_VIRTFB flag
      auxdisplay/cfag12864bfb: Initialize fb_ops with fbdev macros
      auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
      auxdisplay/ht16k33: Initialize fb_ops with fbdev macros
      hid/picolcd_fb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Initialize fb_ops with fbdev macros
      fbdev/smscufx: Select correct helpers
      fbdev/udlfb: Select correct helpers
      fbdev/au1200fb: Set FBINFO_VIRTFB flag
      fbdev/au1200fb: Initialize fb_ops with fbdev macros
      fbdev/ps3fb: Set FBINFO_VIRTFB flag
      fbdev/ps3fb: Initialize fb_ops with fbdev macros
      media/ivtvfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/clps711x-fb: Initialize fb_ops with fbdev macros
      fbdev/vt8500lcdfb: Initialize fb_ops with fbdev macros
      fbdev/wm8505fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/cyber2000fb: Initialize fb_ops with fbdev macros
      staging/sm750fb: Declare fb_ops as constant
      staging/sm750fb: Initialize fb_ops with fbdev macros
      fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
      fbdev: Remove trailing whitespaces
      fbdev: Push pgprot_decrypted() into mmap implementations
      fbdev: Move default fb_mmap code into helper function
      fbdev: Warn on incorrect framebuffer access
      fbdev: Remove default file-I/O implementations
      drm: Fix TODO list mentioning non-KMS drivers
      drm: Include <drm/drm_auth.h>
      drm/i915: Include <drm/drm_auth.h>
      accel: Include <drm/drm_auth.h>
      drm: Include <drm/drm_device.h>
      drm/radeon: Do not include <drm/drm_legacy.h>
      drm: Remove entry points for legacy ioctls
      drm: Remove the legacy DRM_IOCTL_MODESET_CTL ioctl
      drm: Remove support for legacy drivers
      drm: Remove locking for legacy ioctls and DRM_UNLOCKED
      drm: Remove source code for non-KMS drivers
      char/agp: Remove frontend code
      drm: Remove Kconfig option for legacy support (CONFIG_DRM_LEGACY)
      drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
      drm/amdgpu: Do not include <drm/drm_plane_helper.h>
      drm/loongson: Do not include <drm/drm_plane_helper.h>
      drm/shmobile: Do not include <drm/drm_plane_helper.h>
      drm/solomon: Do not include <drm/drm_plane_helper.h>
      drm/ofdrm: Do not include <drm/drm_plane_helper.h>
      drm/simpledrm: Do not include <drm/drm_plane_helper.h>
      drm/xlnx: Do not include <drm/drm_plane_helper.h>

Tomi Valkeinen (16):
      drm/tidss: Use pm_runtime_resume_and_get()
      drm/tidss: Use PM autosuspend
      drm/tidss: Drop useless variable init
      drm/tidss: Move reset to the end of dispc_init()
      drm/tidss: Return error value from from softreset
      drm/tidss: Check for K2G in in dispc_softreset()
      drm/tidss: Add simple K2G manual reset
      drm/tidss: Fix dss reset
      drm/tidss: IRQ code cleanup
      drm/tidss: Fix atomic_flush check
      drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY
      drm/drm_file: fix use of uninitialized variable
      drm/framebuffer: Fix use of uninitialized variable
      drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
      drm/bridge: tc358767: Fix return value on error case
      drm/mipi-dsi: Fix detach call without attach

Tony Lindgren (2):
      dt-bindings: display: simple: Add boe,bp101wx1-100 panel
      drm/panel: simple: Add BOE BP101WX1-100 panel

Uwe Kleine-K=F6nig (3):
      drm/tilcdc: Convert to platform remove callback returning void
      drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()
      drm/imx/lcdc: Fix double-free of driver data

Xin Ji (2):
      Revert "drm/bridge: Add 200ms delay to wait FW HPD status stable"
      drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms

Yang Li (1):
      drm/imagination: Remove unneeded semicolon

Yuran Pereira (1):
      drm/nouveau: Removes unnecessary args check in nouveau_uvmm_sm_prepare

Zack Rusin (8):
      drm: Disable the cursor plane on atomic contexts with virtualized dri=
vers
      drm/atomic: Add support for mouse hotspots
      drm/vmwgfx: Use the hotspot properties from cursor planes
      drm/qxl: Use the hotspot properties from cursor planes
      drm/vboxvideo: Use the hotspot properties from cursor planes
      drm/virtio: Use the hotspot properties from cursor planes
      drm: Remove legacy cursor hotspot code
      drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT

heminhong (1):
      drm/qxl: remove unused declaration

 Documentation/accel/qaic/qaic.rst                  |    9 +-
 Documentation/core-api/pin_user_pages.rst          |    2 +
 .../bindings/display/bridge/lontium,lt8912b.yaml   |   21 +
 .../bindings/display/panel/himax,hx8394.yaml       |    3 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
 .../bindings/display/panel/panel-simple.yaml       |    4 +
 .../bindings/display/ti/ti,am65x-dss.yaml          |   14 +
 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |    1 +
 Documentation/gpu/drm-kms.rst                      |    8 +
 Documentation/gpu/drm-mm.rst                       |    4 +
 Documentation/gpu/drm-vm-bind-locking.rst          |  582 +++++++
 Documentation/gpu/imagination/index.rst            |    2 +-
 Documentation/gpu/imagination/uapi.rst             |    5 +-
 Documentation/gpu/implementation_guidelines.rst    |    1 +
 Documentation/gpu/rfc/xe.rst                       |    5 +
 Documentation/gpu/todo.rst                         |   30 +-
 MAINTAINERS                                        |    1 +
 drivers/accel/drm_accel.c                          |    1 +
 drivers/accel/qaic/mhi_controller.c                |    2 +-
 drivers/accel/qaic/qaic.h                          |   15 +-
 drivers/accel/qaic/qaic_control.c                  |    5 +-
 drivers/accel/qaic/qaic_data.c                     |   16 +-
 drivers/accel/qaic/qaic_drv.c                      |   50 +-
 drivers/auxdisplay/Kconfig                         |   10 +-
 drivers/auxdisplay/cfag12864bfb.c                  |   10 +-
 drivers/auxdisplay/ht16k33.c                       |   10 +-
 drivers/char/agp/Makefile                          |    6 -
 drivers/char/agp/agp.h                             |    9 -
 drivers/char/agp/backend.c                         |   11 -
 drivers/char/agp/compat_ioctl.c                    |  291 ----
 drivers/char/agp/compat_ioctl.h                    |  106 --
 drivers/char/agp/frontend.c                        | 1068 -------------
 drivers/dma-buf/dma-fence.c                        |    3 +-
 drivers/dma-buf/sw_sync.c                          |   82 +
 drivers/dma-buf/sync_debug.h                       |    2 +
 drivers/dma-buf/sync_file.c                        |   19 +
 drivers/gpu/drm/Kconfig                            |   24 +-
 drivers/gpu/drm/Makefile                           |   12 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    1 -
 drivers/gpu/drm/armada/armada_crtc.c               |   24 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   10 +-
 drivers/gpu/drm/ast/ast_drv.c                      |  263 +++-
 drivers/gpu/drm/ast/ast_drv.h                      |  101 +-
 drivers/gpu/drm/ast/ast_main.c                     |  244 +--
 drivers/gpu/drm/ast/ast_mode.c                     |   26 +-
 drivers/gpu/drm/ast/ast_post.c                     |   81 +-
 drivers/gpu/drm/ast/ast_reg.h                      |   12 +-
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   54 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |    4 +
 drivers/gpu/drm/bridge/aux-bridge.c                |  140 ++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |  163 ++
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |    3 +-
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        |    4 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   58 +
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    6 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    6 +-
 drivers/gpu/drm/drm_agpsupport.c                   |  451 ------
 drivers/gpu/drm/drm_atomic.c                       |    9 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |   14 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   97 +-
 drivers/gpu/drm/drm_auth.c                         |    8 +-
 drivers/gpu/drm/drm_bridge.c                       |   44 -
 drivers/gpu/drm/drm_bridge_connector.c             |    6 -
 drivers/gpu/drm/drm_bufs.c                         | 1627 ----------------=
----
 drivers/gpu/drm/drm_context.c                      |  513 ------
 drivers/gpu/drm/drm_crtc_helper.c                  |    7 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    2 +-
 drivers/gpu/drm/drm_damage_helper.c                |    3 +-
 drivers/gpu/drm/drm_debugfs.c                      |   65 +-
 drivers/gpu/drm/drm_dma.c                          |  178 ---
 drivers/gpu/drm/drm_drv.c                          |   27 +-
 drivers/gpu/drm/drm_encoder.c                      |    4 +
 drivers/gpu/drm/drm_file.c                         |   66 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    2 +-
 drivers/gpu/drm/drm_gpuvm.c                        |   51 +-
 drivers/gpu/drm/drm_hashtab.c                      |  203 ---
 drivers/gpu/drm/drm_internal.h                     |   17 +-
 drivers/gpu/drm/drm_ioc32.c                        |  613 +-------
 drivers/gpu/drm/drm_ioctl.c                        |   93 +-
 drivers/gpu/drm/drm_irq.c                          |  204 ---
 drivers/gpu/drm/drm_legacy.h                       |  290 ----
 drivers/gpu/drm/drm_legacy_misc.c                  |  105 --
 drivers/gpu/drm/drm_lock.c                         |  373 -----
 drivers/gpu/drm/drm_memory.c                       |  138 --
 drivers/gpu/drm/drm_mipi_dsi.c                     |   17 +-
 drivers/gpu/drm/drm_mode_object.c                  |    2 +-
 drivers/gpu/drm/drm_pci.c                          |  204 +--
 drivers/gpu/drm/drm_plane.c                        |  150 +-
 drivers/gpu/drm/drm_plane_helper.c                 |   32 -
 drivers/gpu/drm/drm_scatter.c                      |  220 ---
 drivers/gpu/drm/drm_syncobj.c                      |   64 +-
 drivers/gpu/drm/drm_vblank.c                       |  101 --
 drivers/gpu/drm/drm_vm.c                           |  665 --------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |    9 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    1 +
 drivers/gpu/drm/imagination/pvr_cccb.h             |    1 +
 drivers/gpu/drm/imagination/pvr_device.c           |   10 +-
 drivers/gpu/drm/imagination/pvr_device.h           |   25 +-
 drivers/gpu/drm/imagination/pvr_device_info.c      |    3 +-
 drivers/gpu/drm/imagination/pvr_free_list.c        |    2 +-
 drivers/gpu/drm/imagination/pvr_fw.h               |    3 +-
 drivers/gpu/drm/imagination/pvr_fw_info.h          |    8 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |    1 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |   48 +-
 drivers/gpu/drm/imagination/pvr_hwrt.h             |    1 +
 drivers/gpu/drm/imagination/pvr_job.c              |    4 +-
 drivers/gpu/drm/imagination/pvr_mmu.c              |    3 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |    2 +-
 drivers/gpu/drm/imagination/pvr_queue.h            |    4 +-
 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h    |    4 +-
 drivers/gpu/drm/imagination/pvr_vm.c               |  131 +-
 drivers/gpu/drm/imagination/pvr_vm.h               |    3 +-
 drivers/gpu/drm/imagination/pvr_vm_mips.c          |   11 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |    9 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    9 -
 drivers/gpu/drm/loongson/Kconfig                   |    1 +
 drivers/gpu/drm/loongson/lsdc_plane.c              |    1 -
 drivers/gpu/drm/msm/msm_gpu.h                      |    2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   10 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   19 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   31 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    9 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |   70 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h             |    6 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  211 +--
 drivers/gpu/drm/nouveau/nouveau_sched.h            |   43 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |  210 ++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |    4 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    4 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |    5 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   14 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   83 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  180 ++-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  225 +++
 drivers/gpu/drm/panel/panel-simple.c               |   62 +
 drivers/gpu/drm/panfrost/panfrost_device.c         |    3 +
 drivers/gpu/drm/panfrost/panfrost_device.h         |   10 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   40 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   26 +-
 drivers/gpu/drm/panfrost/panfrost_job.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   32 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.h            |    1 +
 drivers/gpu/drm/qxl/qxl_display.c                  |   14 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |    2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    7 -
 drivers/gpu/drm/radeon/radeon_drv.h                |    1 -
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |    1 -
 drivers/gpu/drm/scheduler/sched_entity.c           |   14 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   20 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |    1 -
 drivers/gpu/drm/tests/Makefile                     |    1 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |  383 +++++
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   12 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  138 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    3 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |   16 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |   58 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    9 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |    1 -
 drivers/gpu/drm/tiny/simpledrm.c                   |    1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |    8 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |    6 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   19 +-
 drivers/gpu/drm/v3d/Makefile                       |    3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |   51 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |    4 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |  140 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  768 ---------
 drivers/gpu/drm/v3d/v3d_sched.c                    |  316 ++++
 drivers/gpu/drm/v3d/v3d_submit.c                   | 1320 ++++++++++++++++
 drivers/gpu/drm/v3d/v3d_trace.h                    |   57 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   20 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    1 -
 drivers/hid/hid-picolcd_fb.c                       |    1 +
 drivers/media/pci/ivtv/Kconfig                     |    4 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |    6 +-
 drivers/phy/qualcomm/Kconfig                       |    2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |   44 +-
 drivers/soc/qcom/Kconfig                           |    1 +
 drivers/soc/qcom/pmic_glink_altmode.c              |   33 +-
 drivers/staging/sm750fb/sm750.c                    |   65 +-
 drivers/usb/typec/mux/Kconfig                      |    2 +-
 drivers/usb/typec/mux/nb7vpq904m.c                 |   44 +-
 drivers/usb/typec/tcpm/Kconfig                     |    1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   41 +-
 drivers/video/fbdev/Kconfig                        |   50 +-
 drivers/video/fbdev/acornfb.c                      |    2 +-
 drivers/video/fbdev/amba-clcd.c                    |    2 +
 drivers/video/fbdev/arcfb.c                        |  114 +-
 drivers/video/fbdev/au1100fb.c                     |    2 +
 drivers/video/fbdev/au1200fb.c                     |   11 +-
 drivers/video/fbdev/clps711x-fb.c                  |    4 +-
 drivers/video/fbdev/core/Kconfig                   |    7 +-
 drivers/video/fbdev/core/Makefile                  |    2 +-
 drivers/video/fbdev/core/cfbcopyarea.c             |    3 +
 drivers/video/fbdev/core/cfbfillrect.c             |    3 +
 drivers/video/fbdev/core/cfbimgblt.c               |    3 +
 drivers/video/fbdev/core/fb_chrdev.c               |   72 +-
 drivers/video/fbdev/core/fb_defio.c                |    2 +
 drivers/video/fbdev/core/fb_io_fops.c              |   36 +
 drivers/video/fbdev/core/fb_sys_fops.c             |    6 +
 drivers/video/fbdev/core/syscopyarea.c             |    3 +
 drivers/video/fbdev/core/sysfillrect.c             |    3 +
 drivers/video/fbdev/core/sysimgblt.c               |    3 +
 drivers/video/fbdev/cyber2000fb.c                  |    9 +-
 drivers/video/fbdev/ep93xx-fb.c                    |    2 +
 drivers/video/fbdev/gbefb.c                        |    2 +
 drivers/video/fbdev/omap/omapfb_main.c             |    2 +
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    2 +
 drivers/video/fbdev/ps3fb.c                        |   11 +-
 drivers/video/fbdev/sa1100fb.c                     |    2 +
 drivers/video/fbdev/sbuslib.c                      |    5 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |   16 +-
 drivers/video/fbdev/sm712fb.c                      |    6 +-
 drivers/video/fbdev/smscufx.c                      |    2 +
 drivers/video/fbdev/udlfb.c                        |    2 +
 drivers/video/fbdev/vermilion/vermilion.c          |    2 +
 drivers/video/fbdev/vfb.c                          |   10 +-
 drivers/video/fbdev/vt8500lcdfb.c                  |    4 +-
 drivers/video/fbdev/wm8505fb.c                     |    2 +
 include/drm/bridge/aux-bridge.h                    |   37 +
 include/drm/display/drm_dp.h                       |    3 +
 include/drm/drm_auth.h                             |   22 -
 include/drm/drm_bridge.h                           |    4 +-
 include/drm/drm_device.h                           |   71 +-
 include/drm/drm_drv.h                              |   28 +-
 include/drm/drm_encoder.h                          |   16 +-
 include/drm/drm_file.h                             |   17 +-
 include/drm/drm_framebuffer.h                      |   12 -
 include/drm/drm_gpuvm.h                            |   25 +-
 include/drm/drm_ioctl.h                            |   11 -
 include/drm/drm_legacy.h                           |  331 ----
 include/drm/drm_mipi_dsi.h                         |    2 +
 include/drm/drm_modeset_helper_vtables.h           |   10 +
 include/drm/drm_plane.h                            |   24 +
 include/drm/drm_plane_helper.h                     |    2 -
 include/drm/gpu_scheduler.h                        |    6 +-
 include/linux/dma-buf.h                            |   11 +-
 include/linux/fb.h                                 |   16 +-
 include/uapi/drm/drm.h                             |   52 +-
 include/uapi/drm/drm_mode.h                        |    9 +
 include/uapi/drm/pvr_drm.h                         |   10 +-
 include/uapi/drm/v3d_drm.h                         |  240 ++-
 include/uapi/linux/sync_file.h                     |   22 +
 258 files changed, 6469 insertions(+), 10527 deletions(-)
 create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
 delete mode 100644 drivers/char/agp/compat_ioctl.c
 delete mode 100644 drivers/char/agp/compat_ioctl.h
 delete mode 100644 drivers/char/agp/frontend.c
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
 delete mode 100644 drivers/gpu/drm/drm_agpsupport.c
 delete mode 100644 drivers/gpu/drm/drm_bufs.c
 delete mode 100644 drivers/gpu/drm/drm_context.c
 delete mode 100644 drivers/gpu/drm/drm_dma.c
 delete mode 100644 drivers/gpu/drm/drm_hashtab.c
 delete mode 100644 drivers/gpu/drm/drm_irq.c
 delete mode 100644 drivers/gpu/drm/drm_legacy.h
 delete mode 100644 drivers/gpu/drm/drm_legacy_misc.c
 delete mode 100644 drivers/gpu/drm/drm_lock.c
 delete mode 100644 drivers/gpu/drm/drm_memory.c
 delete mode 100644 drivers/gpu/drm/drm_scatter.c
 delete mode 100644 drivers/gpu/drm/drm_vm.c
 create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_submit.c
 create mode 100644 include/drm/bridge/aux-bridge.h
 delete mode 100644 include/drm/drm_legacy.h

--wgwzsblzmz3j3rey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXGXZwAKCRDj7w1vZxhR
xRfPAQCeBfAid67zM/SoNvje4csr6lOM71lkc0Tu/h6W8ONXEAD/dXc0eO42/8vm
I6y/LDtMVrpfZ4SGnIyJaHAWJFQaKAw=
=Nk9E
-----END PGP SIGNATURE-----

--wgwzsblzmz3j3rey--

