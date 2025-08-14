Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A3B25D15
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCBE10E7FC;
	Thu, 14 Aug 2025 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="S066NPXf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I2+EVl3b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S066NPXf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I2+EVl3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0F010E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:24:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C16B1F7D2;
 Thu, 14 Aug 2025 07:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755156296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fpssUaI6kFxZRRh1XUKjv35ARweYQjpT9N0D5R22Gik=;
 b=S066NPXfOU206pIuh6TRAovV3bTSLR0B1gfGDXgPvhiQDhvZsm60i0iO4T7oSskwsivKbq
 llafDx0w5Fj61d68G4/q80uFX9o5+H6VcCPcjRw0onW6jz3JXqJMLLMVNkC1EmBQeVDI0T
 onF1ke5CubRKekjyqiCM8ItDtjkwbEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755156296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fpssUaI6kFxZRRh1XUKjv35ARweYQjpT9N0D5R22Gik=;
 b=I2+EVl3brVAUlNBPAi0KQ9MOWBnc/2VPMSGTkYZWiOM+I8KiOqTkxFKNwYTXUeoe4lZg9o
 WIKNpecKGglnSqCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755156296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fpssUaI6kFxZRRh1XUKjv35ARweYQjpT9N0D5R22Gik=;
 b=S066NPXfOU206pIuh6TRAovV3bTSLR0B1gfGDXgPvhiQDhvZsm60i0iO4T7oSskwsivKbq
 llafDx0w5Fj61d68G4/q80uFX9o5+H6VcCPcjRw0onW6jz3JXqJMLLMVNkC1EmBQeVDI0T
 onF1ke5CubRKekjyqiCM8ItDtjkwbEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755156296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fpssUaI6kFxZRRh1XUKjv35ARweYQjpT9N0D5R22Gik=;
 b=I2+EVl3brVAUlNBPAi0KQ9MOWBnc/2VPMSGTkYZWiOM+I8KiOqTkxFKNwYTXUeoe4lZg9o
 WIKNpecKGglnSqCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF25A136AE;
 Thu, 14 Aug 2025 07:24:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Rlk7LUePnWh6fAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Aug 2025 07:24:55 +0000
Date: Thu, 14 Aug 2025 09:24:54 +0200
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
Message-ID: <20250814072454.GA18104@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30
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

here's the first PR from drm-misc-next for the kernel's upcoming
v6.18. There are the usual fixes. There is a number of new hardware
supported by bridge and panel. We a new driver for Rockchip NPUs.

Best regards
Thomas

drm-misc-next-2025-08-14:
drm-misc-next for v6.18:

UAPI Changes:

- Add DRM_IOCTL_GEM_CHANGE_HANDLE for reassigning GEM handles
- Document DRM_MODE_PAGE_FLIP_EVENT

Cross-subsystem Changes:

fbcon:
- Add missing declarations in fbcon.h

Core Changes:

bridge:
- Fix ref counting

panel:
- Replace and remove mipi_dsi_generic_write_{seq/_chatty}()

sched:
- Fixes

Rust:
- Drop Opaque<> from ioctl arguments

Driver Changes:

amdxdma:
- Support buffers allocated by user space
- Streamline PM interfaces
- Fixes

bridge:
- cdns-dsi: Various improvements to mode setting
- Support Solomon SSD2825 plus DT bindings
- Support Waveshare DSI2DPI plus DT bindings

gud:
- Fixes

ivpu:
- Fixes

nouveau:
- Use GSP firmware by default
- Fixes

panel:
- panel-edp: Support mt8189 Chromebooks; Support BOE NV140WUM-N64;
  Support SHP LQ134Z1; Fixes
- panel-simple: Support Olimex LCD-OLinuXino-5CTS plus DT bindings
- Support Samsung AMS561RA01
- Support Hydis HV101HD1 plus DT bindings

panthor:
- Print task/pid on errors
- Fixes

renesas:
- convert to RUNTIME_PM_OPS

repaper:
- Use shadow-plane helpers

rocket:
- Add driver for Rockchip NPU plus DT bindings

sharp-memory:
- Use shadow-plane helpers

simpledrm:
- Use of_reserved_mem_region_to_resource() helper

tidss:
- Use crtc_ fields for programming display mode
- Remove other drivers from aperture

v3d:
- Support querying nubmer of GPU resets for KHR_robustness

vmwgfx:
- Fixes
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-08-14

for you to fetch changes up to 0070851095d2954567510777976e40275f81ca1b:

  drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS() (2025-08-14 06:57:34 +0100)

----------------------------------------------------------------
drm-misc-next for v6.18:

UAPI Changes:

- Add DRM_IOCTL_GEM_CHANGE_HANDLE for reassigning GEM handles
- Document DRM_MODE_PAGE_FLIP_EVENT

Cross-subsystem Changes:

fbcon:
- Add missing declarations in fbcon.h

Core Changes:

bridge:
- Fix ref counting

panel:
- Replace and remove mipi_dsi_generic_write_{seq/_chatty}()

sched:
- Fixes

Rust:
- Drop Opaque<> from ioctl arguments

Driver Changes:

amdxdma:
- Support buffers allocated by user space
- Streamline PM interfaces
- Fixes

bridge:
- cdns-dsi: Various improvements to mode setting
- Support Solomon SSD2825 plus DT bindings
- Support Waveshare DSI2DPI plus DT bindings

gud:
- Fixes

ivpu:
- Fixes

nouveau:
- Use GSP firmware by default
- Fixes

panel:
- panel-edp: Support mt8189 Chromebooks; Support BOE NV140WUM-N64;
  Support SHP LQ134Z1; Fixes
- panel-simple: Support Olimex LCD-OLinuXino-5CTS plus DT bindings
- Support Samsung AMS561RA01
- Support Hydis HV101HD1 plus DT bindings

panthor:
- Print task/pid on errors
- Fixes

renesas:
- convert to RUNTIME_PM_OPS

repaper:
- Use shadow-plane helpers

rocket:
- Add driver for Rockchip NPU plus DT bindings

sharp-memory:
- Use shadow-plane helpers

simpledrm:
- Use of_reserved_mem_region_to_resource() helper

tidss:
- Use crtc_ fields for programming display mode
- Remove other drivers from aperture

v3d:
- Support querying nubmer of GPU resets for KHR_robustness

vmwgfx:
- Fixes

----------------------------------------------------------------
Akhilesh Patil (1):
      drm: panel: orisetech: improve error handling during probe

Aleksandrs Vinarskis (3):
      dt-bindings: display: panel: samsung,atna40cu11: document ATNA40CU11
      dt-bindings: display: panel: samsung,atna40ct06: document ATNA40CT06
      drm/panel-edp: Add BOE NV140WUM-N64

Aradhya Bhatia (1):
      drm/bridge: cdns-dsi: Fix the _atomic_check()

Beata Michalska (1):
      rust: drm: Drop the use of Opaque for ioctl arguments

Brigham Campbell (7):
      drm: Create mipi_dsi_dual* macros
      drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
      drm: Remove unused MIPI write seq and chatty functions
      drm: docs: Update task from drm TODO list
      accel/rocket: Fix Rockchip NPU compilation
      accel/rocket: Fix undeclared const rocket_pm_ops
      drm/panel: novatek-nt35560: Fix invalid return value

Carl Vanderlip (1):
      MAINTAINERS: Update email address for Carl Vanderlip

Chen Ni (1):
      drm/panel: himax-hx8279: Remove unneeded semicolon

Chia-I Wu (4):
      panthor: set owner field for driver fops
      panthor: save task pid and comm in panthor_group
      panthor: dump task pid and comm on gpu errors
      drm/bridge: it6505: select REGMAP_I2C

Christopher Orr (1):
      drm/panel-edp: Add SHP LQ134Z1 panel for Dell XPS 9345

Colin Ian King (3):
      drm/vmwgfx: fix missing assignment to ts
      drm/panel: Kconfig: Fix spelling mistake "pannel" -> "panel"
      drm/tidss: remove redundant assignment to variable ret

Cong Yang (1):
      drm/panel-edp: Add edp panels used by mt8189 Chromebooks

David Francis (2):
      drm: Add DRM prime interface to reassign GEM handle
      drm: Move drm_gem ioctl kerneldoc to uapi file

Dmitry Baryshkov (1):
      drm/display: bridge-connector: correct CEC bridge pointers in drm_bridge_connector_init

Geert Uytterhoeven (1):
      drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS()

Hugo Villeneuve (1):
      drm/panel: sitronix-st7703: fix typo in comments

Jacek Lawrynowicz (1):
      MAINTAINERS: Add new intel_vpu maintainer

Jann Horn (1):
      drm/panthor: Fix memory leak in panthor_ioctl_group_create()

Jayesh Choudhary (1):
      drm/tidss: Set crtc modesetting parameters with adjusted mode

Joseph Guo (3):
      dt-bindings: display: bridge: Add waveshare DSI2DPI unit support
      dt-bindings: display: panel: Add waveshare DPI panel support
      drm: bridge: Add waveshare DSI2DPI unit driver

Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Samsung AMS561RA01 panel with S6E8AA5X01 controller
      drm: panel: add support for Samsung AMS561RA01 panel with S6E8AA5X01 controller

Langyan Ye (2):
      drm/panel-edp: Add disable to 100ms for MNB601LS1-4
      drm/panel-edp: Add 50ms disable delay for four panels

Lizhi Hou (2):
      accel/amdxdna: Support user space allocated buffer
      accel/amdxdna: Unify pm and rpm suspend and resume callbacks

Luca Ceresoli (8):
      drm/bridge: add a cleanup action for scope-based drm_bridge_put() invocation
      drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/mxsfb: put the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/atomic-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/probe-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/bridge: get the bridge returned by drm_bridge_get_prev_bridge()
      drm/bridge: select_bus_fmt_recursive(): put the bridge obtained by drm_bridge_get_prev_bridge()
      drm/bridge: display-connector: put the bridge obtained by drm_bridge_get_prev_bridge()

Maarten Lankhorst (1):
      accel/ivpu: Remove lockdep_assert_irqs_disabled()

Maíra Canal (2):
      drm/v3d: Add parameter to retrieve the global number of GPU resets
      drm/v3d: Add parameter to retrieve the number of GPU resets per-fd

Mel Henning (3):
      drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
      drm/nouveau: Remove nvkm_gsp_fwif.enable
      drm/nouveau: Improve message for missing firmware

Paul Kocialkowski (2):
      dt-bindings: display: simple: Add Olimex LCD-OLinuXino-5CTS
      drm/panel: simple: Add Olimex LCD-OLinuXino-5CTS support

Philipp Stanner (1):
      drm/nouveau: Remove surplus struct member

Rob Herring (Arm) (1):
      drm/simpledrm: Use of_reserved_mem_region_to_resource() for "memory-region"

Robert Mader (1):
      drm/vkms: Add writeback encoders as possible clones

Ruben Wauters (1):
      drm/gud: Remove unnecessary logging

Salah Triki (1):
      accel/amdxdna: Delete pci_free_irq_vectors()

Seyediman Seyedarab (1):
      drm/nouveau: replace snprintf() with scnprintf() in nvkm_snprintbf()

Simon Ser (1):
      drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with atomic

Svyatoslav Ryhel (4):
      dt-bindings: display: bridge: Document Solomon SSD2825
      drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
      dt-bindings: display: panel: Document Hydis HV101HD1 DSI panel
      drm: panel: Add support for Hydis HV101HD1 MIPI DSI panel

Thomas Zimmermann (5):
      Merge drm/drm-next into drm-misc-n
      drm/repaper: Do not access GEM-DMA vaddr directly
      drm/sharp-memory: Do not access GEM-DMA vaddr directly
      fbcon: Add necessary include statements and forward declarations
      drm/panel: panel-summit: Include <linux/property.h> and <linux/mod_devicetable.h>

Timur Tabi (1):
      drm/nouveau: always set RMDevidCheckIgnore for GSP-RM

Tomeu Vizoso (6):
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses
      dt-bindings: npu: rockchip,rknn: Add bindings

Tomi Valkeinen (15):
      drm/tidss: Fix missing includes and struct decls
      drm/tidss: Use the crtc_* timings when programming the HW
      drm/bridge: cdns-dsi: Remove extra line at the end of the file
      drm/bridge: cdns-dsi: Drop crtc_* code
      drm/bridge: cdns-dsi: Remove broken fifo emptying check
      drm/bridge: cdns-dsi: Drop checks that shouldn't be in .mode_valid()
      drm/bridge: cdns-dsi: Update htotal in cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Drop cdns_dsi_adjust_phy_config()
      drm/bridge: cdns-dsi: Adjust mode to negative syncs
      drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
      drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Fix event mode
      drm/bridge: cdns-dsi: Tune adjusted_mode->clock according to dsi needs
      drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST
      drm/tidss: Remove early fb

Tvrtko Ursulin (2):
      drm/sched: Fix a race in DRM_GPU_SCHED_STAT_NO_HANG test
      drm/sched: Avoid double re-lock on the job free path

 .mailmap                                           |    2 +
 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/display/bridge/solomon,ssd2825.yaml   |  141 +
 .../bindings/display/bridge/waveshare,dsi2dpi.yaml |  103 +
 .../bindings/display/panel/hydis,hv101hd1.yaml     |   60 +
 .../bindings/display/panel/panel-simple.yaml       |    6 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    4 +
 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       |   55 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  112 +
 Documentation/gpu/todo.rst                         |   22 +-
 MAINTAINERS                                        |   13 +-
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/amdxdna/Makefile                     |    1 +
 drivers/accel/amdxdna/aie2_ctx.c                   |   59 +-
 drivers/accel/amdxdna/aie2_pci.c                   |   45 +-
 drivers/accel/amdxdna/aie2_pci.h                   |    5 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |   26 -
 drivers/accel/amdxdna/amdxdna_ctx.h                |    2 -
 drivers/accel/amdxdna/amdxdna_gem.c                |  139 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   74 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    4 +-
 drivers/accel/amdxdna/amdxdna_ubuf.c               |  232 ++
 drivers/accel/amdxdna/amdxdna_ubuf.h               |   19 +
 drivers/accel/ivpu/ivpu_ipc.c                      |    1 -
 drivers/accel/rocket/Kconfig                       |   24 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  110 +
 drivers/accel/rocket/rocket_core.h                 |   64 +
 drivers/accel/rocket/rocket_device.c               |   60 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  290 ++
 drivers/accel/rocket/rocket_drv.h                  |   32 +
 drivers/accel/rocket/rocket_gem.c                  |  181 +
 drivers/accel/rocket/rocket_gem.h                  |   34 +
 drivers/accel/rocket/rocket_job.c                  |  636 +++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4404 ++++++++++++++++++++
 drivers/gpu/drm/bridge/Kconfig                     |   26 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  211 +-
 drivers/gpu/drm/bridge/display-connector.c         |    4 +-
 drivers/gpu/drm/bridge/ssd2825.c                   |  775 ++++
 drivers/gpu/drm/bridge/waveshare-dsi.c             |  203 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |    4 +
 drivers/gpu/drm/drm_atomic_helper.c                |    7 +
 drivers/gpu/drm/drm_bridge.c                       |    4 +-
 drivers/gpu/drm/drm_gem.c                          |   86 +-
 drivers/gpu/drm/drm_internal.h                     |    4 +
 drivers/gpu/drm/drm_ioctl.c                        |    1 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |   82 +-
 drivers/gpu/drm/drm_prime.c                        |    6 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    1 +
 drivers/gpu/drm/gud/gud_drv.c                      |    2 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |    4 +-
 drivers/gpu/drm/nouveau/Kconfig                    |    8 -
 drivers/gpu/drm/nouveau/nouveau_chan.h             |    2 -
 drivers/gpu/drm/nouveau/nouveau_dma.h              |    1 -
 drivers/gpu/drm/nouveau/nvkm/core/enum.c           |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |    1 -
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |    6 +-
 drivers/gpu/drm/nova/file.rs                       |   23 +-
 drivers/gpu/drm/nova/nova.rs                       |    1 -
 drivers/gpu/drm/nova/uapi.rs                       |   61 -
 drivers/gpu/drm/panel/Kconfig                      |   26 +-
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-edp.c                  |   44 +-
 drivers/gpu/drm/panel/panel-himax-hx8279.c         |    2 +-
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c       |  188 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |  196 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |  804 ++--
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |    7 +-
 .../panel/panel-samsung-s6e8aa5x01-ams561ra01.c    |  981 +++++
 drivers/gpu/drm/panel/panel-simple.c               |   26 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    2 +-
 drivers/gpu/drm/panel/panel-summit.c               |    2 +
 drivers/gpu/drm/panthor/panthor_drv.c              |   25 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   43 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |    8 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   53 +-
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |    2 +-
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |    7 +-
 drivers/gpu/drm/scheduler/tests/tests_basic.c      |    4 +-
 drivers/gpu/drm/sysfb/simpledrm.c                  |   15 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |    7 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |   16 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    3 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |    9 +
 drivers/gpu/drm/tidss/tidss_drv.h                  |    2 +
 drivers/gpu/drm/tidss/tidss_oldi.c                 |    1 -
 drivers/gpu/drm/tidss/tidss_plane.h                |    2 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.h          |    2 +
 drivers/gpu/drm/tiny/repaper.c                     |   16 +-
 drivers/gpu/drm/tiny/sharp-memory.c                |   27 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   11 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   11 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |    5 +
 drivers/gpu/drm/vkms/vkms_output.c                 |   13 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |    2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |    2 +-
 include/drm/drm_bridge.h                           |   20 +-
 include/drm/drm_mipi_dsi.h                         |  118 +-
 include/linux/fbcon.h                              |    7 +
 include/uapi/drm/amdxdna_accel.h                   |   25 +
 include/uapi/drm/drm.h                             |   63 +-
 include/uapi/drm/drm_mode.h                        |    8 +
 include/uapi/drm/rocket_accel.h                    |  142 +
 include/uapi/drm/v3d_drm.h                         |    2 +
 rust/kernel/drm/ioctl.rs                           |   11 +-
 117 files changed, 10399 insertions(+), 1183 deletions(-)
 create mode 100644 Documentation/accel/rocket/index.rst
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
 create mode 100644 Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
 create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.h
 create mode 100644 drivers/accel/rocket/Kconfig
 create mode 100644 drivers/accel/rocket/Makefile
 create mode 100644 drivers/accel/rocket/rocket_core.c
 create mode 100644 drivers/accel/rocket/rocket_core.h
 create mode 100644 drivers/accel/rocket/rocket_device.c
 create mode 100644 drivers/accel/rocket/rocket_device.h
 create mode 100644 drivers/accel/rocket/rocket_drv.c
 create mode 100644 drivers/accel/rocket/rocket_drv.h
 create mode 100644 drivers/accel/rocket/rocket_gem.c
 create mode 100644 drivers/accel/rocket/rocket_gem.h
 create mode 100644 drivers/accel/rocket/rocket_job.c
 create mode 100644 drivers/accel/rocket/rocket_job.h
 create mode 100644 drivers/accel/rocket/rocket_registers.h
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
 create mode 100644 drivers/gpu/drm/bridge/waveshare-dsi.c
 delete mode 100644 drivers/gpu/drm/nova/uapi.rs
 create mode 100644 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e8aa5x01-ams561ra01.c
 create mode 100644 include/uapi/drm/rocket_accel.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
