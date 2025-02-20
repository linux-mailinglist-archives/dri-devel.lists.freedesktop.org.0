Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8FA3D3BF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 09:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792ED10E8E9;
	Thu, 20 Feb 2025 08:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FZLL/Vw4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rDT1sMvR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V7IpOxCG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FTsULBjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9E510E8E0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 08:53:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 83A7321199;
 Thu, 20 Feb 2025 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740041604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=13aQmWlC4evO6/N5fgsXiNbH2ZHqX7IU2xHYmRkmlWg=;
 b=FZLL/Vw4FmHAeri1FZ2ci9LIbYJzv9+uydLC7E0uzXVDdzIITuokeiFwEbM/wGmPD9jmHQ
 LAoNApmkA3C8W0jrgg1B9+qLdifGrI31LVvA6LUQboDVtIQCBiciGMFXWUxBC62ku+BzXR
 W1aNnM4QLle31HdnQaeIOKUqaCPvVbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740041604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=13aQmWlC4evO6/N5fgsXiNbH2ZHqX7IU2xHYmRkmlWg=;
 b=rDT1sMvRb+K7YymRYOYoQxN9ovcSj4vOD/JHvCY+6ElarN7cWNL3tggoKQoZY7CkYj7T+v
 UofgYBIcgjN+gPCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740041603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=13aQmWlC4evO6/N5fgsXiNbH2ZHqX7IU2xHYmRkmlWg=;
 b=V7IpOxCGfpeSFtvJp+SDClcnKn1rQ7/qafexsaCYDGuygOoqzX6HhgZKp6R85DtXd5XD1C
 nwRPQVg9d4AkvB3s46ptQwF+PhavWmI1eBbUqhmIciWGFZfA77Dt+wWO4CQzKXfhQbGQZS
 4O7O4VAabSqNt1htPOn1av0VjobPlgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740041603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=13aQmWlC4evO6/N5fgsXiNbH2ZHqX7IU2xHYmRkmlWg=;
 b=FTsULBjR/s3Y19FHBAKzLIG+RmT1FoxksaLtMiM8lSQq3RwaihJmaDxgqQrBDrCF+Np5Zs
 TF0CDMD7t5+NrOAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1493F13A69;
 Thu, 20 Feb 2025 08:53:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bxK1A4PttmeyaAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Feb 2025 08:53:23 +0000
Date: Thu, 20 Feb 2025 09:53:21 +0100
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
Message-ID: <20250220085321.GA184551@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 linux.fritz.box:mid, gitlab.freedesktop.org:url]
X-Spam-Flag: NO
X-Spam-Level: 
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

this is the weekly PR for drm-misc-next. It has quite a number of
highlights:

* There is the new device wedge event, which allows drivers to report
  unresponsive hardware to user space via a uevent. Drivers for AMD and
  Intel HW already use the functionality.

* The i2c subdirectory has been removed after all code has been moved
elsewhere.

* Atomic helpers now support asyncronous pageflips on arbitrary planes.
  Amdgpu already supports this.

And of course there's the usual amount of fixes, cleanups and small
additions.

Best regards
Thomas

drm-misc-next-2025-02-20:
drm-misc-next for v6.15:

UAPI Changes:

device-wedged events:
- Let's drivers notify userspace of hung-up devices via uevent

Cross-subsystem Changes:

media:
- cec: tda998x: Import driver from DRM

Core Changes:

- Cleanups

atomic-helper:
- async-flip: Support on arbitrary planes
- writeback: Fix use-after-free error
- Document atomic-state history
- Pleanty of cleanups to callback parameter names

doc:
- Test for kernel-doc errors

format-helper:
- Support ARGB8888-to-ARGB4444 pixel-format conversion

panel-orientation-quirks:
- Add quirks for AYANEO 2S, AYA NEO Flip DS and KB, AYA NEO Slide, GPD Win 2,
  OneXPlayer Mini (Intel)

sched:
- Add parameter struct for init

Driver Changes:

amdgpu:
- Support device-wedged event
- Support async pageflips on overlay planes

amdxdna:
- Refactoring

ast:
- Refactor cursor handling

bridge:
- Pass full atomic state to various callbacks
- analogix-dp: Cleanups
- cdns-mhdp8546: Fix clock enable/disable
- nwl-dsi: Set bridge type
- panel: Cleanups
- ti-sn65dsi83: Add error recovery; Set bridge type

i2c:
- tda998x: Drop unused platform_data; Split driver into separate media and bridge drivers
- Remove the obsolete directory

i915:
- Support device-wedged event

nouveau:
- Fixes

panel:
- visionox-r66451: Use multi-style MIPI-DSI functions

v3d:
- Handle clock

vkms:
- Fix use-after-free error

xe:
- Support device-wedged event

xlnx:
- Use mutex guards
- Cleanups
The following changes since commit 0ed1356af8f629ae807963b7db4e501e3b580bc2:

  Merge tag 'drm-misc-next-2025-02-12' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-02-14 10:24:02 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-02-20

for you to fetch changes up to e82e1a0c22d841f379b1c768469dcdaae650e443:

  drm/ast: cursor: Move implementation to separate source file (2025-02-20 08:38:34 +0100)

----------------------------------------------------------------
drm-misc-next for v6.15:

UAPI Changes:

device-wedged events:
- Let's drivers notify userspace of hung-up devices via uevent

Cross-subsystem Changes:

media:
- cec: tda998x: Import driver from DRM

Core Changes:

- Cleanups

atomic-helper:
- async-flip: Support on arbitrary planes
- writeback: Fix use-after-free error
- Document atomic-state history
- Pleanty of cleanups to callback parameter names

doc:
- Test for kernel-doc errors

format-helper:
- Support ARGB8888-to-ARGB4444 pixel-format conversion

panel-orientation-quirks:
- Add quirks for AYANEO 2S, AYA NEO Flip DS and KB, AYA NEO Slide, GPD Win 2,
  OneXPlayer Mini (Intel)

sched:
- Add parameter struct for init

Driver Changes:

amdgpu:
- Support device-wedged event
- Support async pageflips on overlay planes

amdxdna:
- Refactoring

ast:
- Refactor cursor handling

bridge:
- Pass full atomic state to various callbacks
- analogix-dp: Cleanups
- cdns-mhdp8546: Fix clock enable/disable
- nwl-dsi: Set bridge type
- panel: Cleanups
- ti-sn65dsi83: Add error recovery; Set bridge type

i2c:
- tda998x: Drop unused platform_data; Split driver into separate media and bridge drivers
- Remove the obsolete directory

i915:
- Support device-wedged event

nouveau:
- Fixes

panel:
- visionox-r66451: Use multi-style MIPI-DSI functions

v3d:
- Handle clock

vkms:
- Fix use-after-free error

xe:
- Support device-wedged event

xlnx:
- Use mutex guards
- Cleanups

----------------------------------------------------------------
Alexander Stein (2):
      drm/bridge: ti-sn65dsi83: Set bridge type
      drm/bridge: nwl-dsi: Set bridge type

Andrew Wyatt (5):
      drm: panel-orientation-quirks: Add support for AYANEO 2S
      drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
      drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
      drm: panel-orientation-quirks: Add new quirk for GPD Win 2
      drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)

André Almeida (3):
      drm/amdgpu: Use device wedged event
      drm/atomic: Let drivers decide which planes to async flip
      drm/amdgpu: Enable async flip on overlay planes

Bart Van Assche (1):
      drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Dan Carpenter (3):
      drm/tests: Fix a test in drm_test_check_valid_clones()
      drm: writeback: Fix use after free in drm_writeback_connector_cleanup()
      drm/nouveau: Fix error pointer dereference in r535_gsp_msgq_recv()

Dmitry Baryshkov (4):
      drm/i2c: tda998x: drop support for platform_data
      media: cec: move driver for TDA9950 from drm/i2c
      drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge
      drm: drop i2c subdir from Makefile

Herve Codina (4):
      dt-bindings: display: bridge: sn65dsi83: Add interrupt
      drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
      drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
      drm: bridge: ti-sn65dsi83: Add error recovery mechanism

Jani Nikula (2):
      drm/client: include types.h to make drm_client_event.h self-contained
      drm: ensure drm headers are self-contained and pass kernel-doc

Jinjie Ruan (1):
      drm: zynqmp_dp: Use devm_platform_ioremap_resource_byname()

José Expósito (1):
      drm/vkms: Fix use after free and double free on init error

Lizhi Hou (1):
      accel/amdxdna: Refactor hardware context destroy routine

Luca Ceresoli (5):
      drm/debugfs: fix printk format for bridge index
      drm: of: drm_of_find_panel_or_bridge: move misplaced comment
      drm/bridge: panel: use drm_bridge_is_panel() instead of open code
      drm/bridge: panel: drm_panel_bridge_remove: warn when called on non-panel bridge
      drm/bridge: panel: forbid initializing a panel with unknown connector type

Maxime Ripard (26):
      drm/atomic: Document history of drm_atomic_state
      drm/bridge: Pass full state to atomic_pre_enable
      drm/bridge: Pass full state to atomic_enable
      drm/bridge: Pass full state to atomic_disable
      drm/bridge: Pass full state to atomic_post_disable
      drm/atomic-helper: Fix commit_tail state variable name
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_dependencies()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail_rpm()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_modeset_disables()
      drm/atomic-helper: Change parameter name of disable_outputs()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_disable()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_post_disable()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_update_legacy_modeset_state()
      drm/atomic-helper: Change parameter name of crtc_set_mode()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_planes()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_modeset_enables()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enable()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_enable()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_writebacks()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_fake_vblank()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_hw_done()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_vblanks()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_cleanup_planes()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_cleanup_done()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_flip_done()

Philipp Stanner (1):
      drm/sched: Use struct for drm_sched_init() params

Raag Jadav (4):
      drm: Introduce device wedged event
      drm/doc: Document device wedged event
      drm/xe: Use device wedged event
      drm/i915: Use device wedged event

Sean Anderson (1):
      drm: zynqmp_dp: Use scope-based mutex helpers

Shixiong Ou (1):
      drm/bridge: analogix_dp: Use devm_platform_ioremap_resource()

Stefan Wahren (1):
      drm/v3d: Add clock handling

Tejas Vipin (1):
      drm/panel: visionox-r66451: transition to mipi_dsi wrapped functions

Thomas Hellström (1):
      MAINTAINERS: Add TTM reviewers

Thomas Zimmermann (5):
      Merge drm/drm-next into drm-misc-next
      drm/ast: cursor: Calculate checksum in helper
      drm/ast: cursor: Move format conversion to shared helper
      drm/ast: cursor: Add support for ARGB4444
      drm/ast: cursor: Move implementation to separate source file

Vitalii Mordan (1):
      gpu: cdns-mhdp8546: fix call balance of mhdp->clk handling routines

 .../bindings/display/bridge/ti,sn65dsi83.yaml      |   3 +
 Documentation/gpu/drm-uapi.rst                     | 116 +++++++-
 Kbuild                                             |   1 +
 MAINTAINERS                                        |   5 +-
 drivers/accel/amdxdna/aie2_ctx.c                   |  49 ++--
 drivers/accel/amdxdna/amdxdna_ctx.c                |   2 +
 drivers/accel/amdxdna/amdxdna_ctx.h                |   3 +
 drivers/gpu/drm/Kconfig                            |  13 +-
 drivers/gpu/drm/Makefile                           |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  22 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  11 +-
 drivers/gpu/drm/arm/Kconfig                        |   1 +
 drivers/gpu/drm/ast/Makefile                       |   1 +
 drivers/gpu/drm/ast/ast_cursor.c                   | 309 +++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h                      |  41 ++-
 drivers/gpu/drm/ast/ast_mode.c                     | 273 +-----------------
 drivers/gpu/drm/bridge/Kconfig                     |   8 +
 drivers/gpu/drm/bridge/Makefile                    |   4 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   4 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  29 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   8 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  17 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   7 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   5 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |   7 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |  10 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  21 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   5 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  10 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |   8 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  11 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   9 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   5 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   5 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  18 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  11 +-
 drivers/gpu/drm/bridge/panel.c                     |  16 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   4 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   8 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   6 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |   6 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   9 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  20 +-
 drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c      |  49 +---
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |   6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              | 150 +++++++++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  10 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |   6 +-
 drivers/gpu/drm/drm_atomic_helper.c                | 285 +++++++++++--------
 drivers/gpu/drm/drm_atomic_uapi.c                  |  37 ++-
 drivers/gpu/drm/drm_bridge.c                       |  79 ++----
 drivers/gpu/drm/drm_debugfs.c                      |   2 +-
 drivers/gpu/drm/drm_drv.c                          |  68 +++++
 drivers/gpu/drm/drm_format_helper.c                |  69 +++++
 drivers/gpu/drm/drm_of.c                           |   2 +-
 drivers/gpu/drm/drm_panel.c                        |   5 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  46 ++-
 drivers/gpu/drm/drm_writeback.c                    |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |  20 +-
 drivers/gpu/drm/i2c/Kconfig                        |  18 --
 drivers/gpu/drm/i2c/Makefile                       |   4 -
 drivers/gpu/drm/i915/gt/intel_reset.c              |   3 +
 drivers/gpu/drm/imagination/pvr_queue.c            |  18 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |  16 +-
 drivers/gpu/drm/loongson/lsdc_plane.c              |   3 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   9 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |   2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   5 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   5 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   5 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  28 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  19 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |  17 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |   5 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c      | 181 +++++-------
 drivers/gpu/drm/panfrost/panfrost_job.c            |  20 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |  16 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |  28 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |   5 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   4 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  50 ++--
 drivers/gpu/drm/stm/lvds.c                         |   5 +-
 drivers/gpu/drm/tegra/dc.c                         |   3 +-
 drivers/gpu/drm/tests/drm_atomic_state_test.c      |   2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |  25 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  65 ++---
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   9 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  30 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |   2 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |  15 +-
 drivers/gpu/drm/xe/xe_device.c                     |   7 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |  15 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |  17 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   | 165 ++++-------
 drivers/media/cec/i2c/Kconfig                      |   9 +
 drivers/media/cec/i2c/Makefile                     |   1 +
 drivers/{gpu/drm => media/cec}/i2c/tda9950.c       |   0
 include/Kbuild                                     |   1 +
 include/drm/Makefile                               |  18 ++
 include/drm/drm_atomic.h                           |  31 +++
 include/drm/drm_atomic_helper.h                    |   2 +
 include/drm/drm_bridge.h                           |   8 +-
 include/drm/drm_client_event.h                     |   2 +
 include/drm/drm_device.h                           |   8 +
 include/drm/drm_drv.h                              |   1 +
 include/drm/drm_format_helper.h                    |   3 +
 include/drm/drm_modeset_helper_vtables.h           |   7 +-
 include/drm/gpu_scheduler.h                        |  36 ++-
 include/drm/i2c/tda998x.h                          |  40 ---
 122 files changed, 1760 insertions(+), 1273 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_cursor.c
 rename drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c (97%)
 delete mode 100644 drivers/gpu/drm/i2c/Kconfig
 delete mode 100644 drivers/gpu/drm/i2c/Makefile
 rename drivers/{gpu/drm => media/cec}/i2c/tda9950.c (100%)
 create mode 100644 include/Kbuild
 create mode 100644 include/drm/Makefile
 delete mode 100644 include/drm/i2c/tda998x.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
