Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956784F9A4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 17:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3583710F738;
	Fri,  9 Feb 2024 16:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PMibptSM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OXpROGiL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PMibptSM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OXpROGiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FD810F734;
 Fri,  9 Feb 2024 16:32:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B2061FD38;
 Fri,  9 Feb 2024 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707496332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EuHpygMWZ0pFypvvafOMjr8kZ7cdZ7xE3kOjc4ozeQY=;
 b=PMibptSMlJY4NvyauWvZgruhu2v59XEWtbNSJXHs3U7waupwTmapoaeegYwMQxKrlSfrnj
 gW3INbP2gVIjAz2a1Aa9I9MCozdqs/l/bIieCgGuoyzacHFn4i+pYwAQdiKk1OCHp+ygJv
 Dm3lGvV1e6yMaRRug/5u+LBgU075m/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707496332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EuHpygMWZ0pFypvvafOMjr8kZ7cdZ7xE3kOjc4ozeQY=;
 b=OXpROGiLUNOGvE0SluyWhTY0zvl6Jvk33xMQ9KGYp342BD4VgQAugwjxwSJG4GnO1IOhQ9
 HRw5RGEzGXvi5HDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707496332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EuHpygMWZ0pFypvvafOMjr8kZ7cdZ7xE3kOjc4ozeQY=;
 b=PMibptSMlJY4NvyauWvZgruhu2v59XEWtbNSJXHs3U7waupwTmapoaeegYwMQxKrlSfrnj
 gW3INbP2gVIjAz2a1Aa9I9MCozdqs/l/bIieCgGuoyzacHFn4i+pYwAQdiKk1OCHp+ygJv
 Dm3lGvV1e6yMaRRug/5u+LBgU075m/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707496332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EuHpygMWZ0pFypvvafOMjr8kZ7cdZ7xE3kOjc4ozeQY=;
 b=OXpROGiLUNOGvE0SluyWhTY0zvl6Jvk33xMQ9KGYp342BD4VgQAugwjxwSJG4GnO1IOhQ9
 HRw5RGEzGXvi5HDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0136B13353;
 Fri,  9 Feb 2024 16:32:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id djSZOotTxmVuGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Feb 2024 16:32:11 +0000
Date: Fri, 9 Feb 2024 17:32:10 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20240208164242.GA14321@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PMibptSM;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OXpROGiL
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[15];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 6B2061FD38
X-Spam-Flag: NO
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

Hi Dave and Sima,

here's the PR for drm-misc-next for this week. There's nothing that
stands out: plenty of fixes, the usual round of newly supported panel
and bridge devices, and some changes to the internal interfaces.

Best regards
Thomas

drm-misc-next-2024-02-08:
drm-misc-next for v6.9:

UAPI Changes:

Cross-subsystem Changes:

dma-buf:
- clean up docs

media:
- tc358743: fix v4l device registration

video:
- move all kernel parameters for video behind CONFIG_VIDEO

sound:
- remove <drm/drm_edid.h> include from header

Core Changes:

ci:
- add tests for msm

managed:
- add drmm_release_action() with tests

ttm:
- fix errno codes
- simply busy-placement handling
- fix page decryption

docs:
- add new external references
- clean up

Driver Changes:

amdgpu:
- clean up

bridge:
- imx: add i.MX8MP HDMI PVI plus DT bindings, add i.MX8MP HDMI TX plus DT
  bindings
- samsung-dsim: add bsh-smm-s2/pro boards
- sii902x: fix probing and unregistration
- tc358767: limit pixel PLL input range
- switch to new drm_bridge_read_edid() interface
- clean up

imx:
- use devm_ functions during init
- clean up

lima:
- fix memory leak

loongson:
- fail if no VRAM present

meson:
- switch to new drm_bridge_read_edid() interface

nouveau:
- clean up

panel:
- add BOE TH101MB31IG002-28A plus DT bindings
- add EDT ETML1010G3DRA plus DT bindings
- add Novatek NT36672E LCD DSI plus DT bindings
- nt36523: support 120Hz timings, fix includes
- simple: fix display timings on RK32FN48H
- visionox-vtdr6130: fix initialization

panel-orientation-quirks:
- GPD Win Mini

vmwgfx:
- list command SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 as invalid
- fix null-pointer deref in execbuf
- refactor display-mode probing
- fix fencing for creating cursor MOBs
- fix cursor-memory lifetime
- clean up

xlnx:
- fix live video input for ZynqMP DPSUB
The following changes since commit f8e4806e0dfa8796b3d7076a7fe054455a59c38b:

  Merge tag 'drm-misc-next-2024-01-11' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2024-02-05 13:50:15 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2024-02-08

for you to fetch changes up to 3ce7384048fa1793db0eae013fa377d89256b76f:

  drm/bridge: remove drm_bridge_get_edid() in favour of drm_bridge_edid_read() (2024-02-08 17:12:33 +0200)

----------------------------------------------------------------
drm-misc-next for v6.9:

UAPI Changes:

Cross-subsystem Changes:

dma-buf:
- clean up docs

media:
- tc358743: fix v4l device registration

video:
- move all kernel parameters for video behind CONFIG_VIDEO

sound:
- remove <drm/drm_edid.h> include from header

Core Changes:

ci:
- add tests for msm

managed:
- add drmm_release_action() with tests

ttm:
- fix errno codes
- simply busy-placement handling
- fix page decryption

docs:
- add new external references
- clean up

Driver Changes:

amdgpu:
- clean up

bridge:
- imx: add i.MX8MP HDMI PVI plus DT bindings, add i.MX8MP HDMI TX plus DT
  bindings
- samsung-dsim: add bsh-smm-s2/pro boards
- sii902x: fix probing and unregistration
- tc358767: limit pixel PLL input range
- switch to new drm_bridge_read_edid() interface
- clean up

imx:
- use devm_ functions during init
- clean up

lima:
- fix memory leak

loongson:
- fail if no VRAM present

meson:
- switch to new drm_bridge_read_edid() interface

nouveau:
- clean up

panel:
- add BOE TH101MB31IG002-28A plus DT bindings
- add EDT ETML1010G3DRA plus DT bindings
- add Novatek NT36672E LCD DSI plus DT bindings
- nt36523: support 120Hz timings, fix includes
- simple: fix display timings on RK32FN48H
- visionox-vtdr6130: fix initialization

panel-orientation-quirks:
- GPD Win Mini

vmwgfx:
- list command SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 as invalid
- fix null-pointer deref in execbuf
- refactor display-mode probing
- fix fencing for creating cursor MOBs
- fix cursor-memory lifetime
- clean up

xlnx:
- fix live video input for ZynqMP DPSUB

----------------------------------------------------------------
Adam Ford (1):
      drm/bridge: imx8mp-hdmi-pvi: Fix build warnings

Alex Bee (1):
      drm/rockchip: inno_hdmi: Explicitly include drm_atomic.h

Alexander Stein (2):
      drm: panel: simple: convert LG LB070WV8 fixed mode into display timings
      media: tc358743: register v4l2 async device only after successful setup

Alexander Warnecke (1):
      drm/panel: Add driver for BOE TH101MB31IG002-28A panel

Anatoliy Klymenko (4):
      drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
      drm: xlnx: zynqmp_dpsub: Fix timing for live mode
      drm: xlnx: zynqmp_dpsub: Clear status register ASAP
      drm: xlnx: zynqmp_dpsub: Filter interrupts against mask

Chen Haonan (1):
      drm/panel: Simplify with dev_err_probe()

Christian König (2):
      drm/vmwgfx: remove vmw_vram_gmr_placement
      drm/ttm: return ENOSPC from ttm_bo_mem_space v3

Dario Binacchi (2):
      drm: bridge: samsung-dsim: enter display mode in the enable() callback
      drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

Huacai Chen (1):
      drm/loongson: Error out if no VRAM detected

Ian Forbes (1):
      drm/vmwgfx: Add SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 to command array.

Jani Nikula (18):
      ASoC: hdmi-codec: drop drm/drm_edid.h include
      drm/amdgpu: prefer snprintf over sprintf
      drm/imx: prefer snprintf over sprintf
      drm/nouveau/acr/ga102: remove unused but set variable
      drm/nouveau/svm: remove unused but set variables
      drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
      drm/bridge: switch to drm_bridge_edid_read()
      drm/bridge: chrontel-ch7033: switch to drm_bridge_edid_read()
      drm/bridge: lt8912b: use drm_bridge_edid_read()
      drm/bridge: lt8912b: clear the EDID property on failures
      drm/bridge: lt8912b: use ->edid_read callback
      drm/bridge: lt9611uxc: use drm_bridge_edid_read()
      drm: bridge: simple-bridge: use drm_bridge_edid_read()
      drm: bridge: simple-bridge: clear the EDID property on failures
      drm/bridge: tfp410: use drm_bridge_edid_read()
      drm/bridge: tfp410: clear the EDID property on failures
      drm/meson: switch to drm_bridge_edid_read()
      drm/bridge: remove drm_bridge_get_edid() in favour of drm_bridge_edid_read()

Jeffrey Hugo (1):
      dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing @codeaurora address

Jessica Zhang (3):
      drm/panel: visionox-vtdr6130: Set prepare_prev_first flag
      dt-bindings: visionox-rm69299: Update maintainers
      drm/panel: visionox-r66451: Set prepare_prev_first flag

Jianhua Lu (1):
      drm/panel: nt36523: Set 120Hz fps for xiaomi,elish panels

Konrad Dybcio (1):
      drm/panel: novatek-nt36523: Set prepare_prev_first

Lucas Stach (4):
      dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
      drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
      dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
      drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI

Lukas Bulwahn (1):
      drm: Clean-up superfluously selecting VT_HW_CONSOLE_BINDING

Maaz Mombasawala (2):
      drm/vmwgfx: Make all surfaces shareable
      drm/vmwgfx: Add SPDX header to vmwgfx_drm.h

Manuel Traut (1):
      dt-bindings: display: panel: Add BOE TH101MB31IG002-28A panel

Marek Vasut (1):
      drm/bridge: tc358767: Limit the Pixel PLL input range

Martin Krastev (2):
      drm/vmwgfx: Refactor drm connector probing for display modes
      drm/vmwgfx: Fix vmw_du_get_cursor_mob fencing of newly-created MOBs

Matthew Brost (1):
      drm/sched: Add Matthew Brost to maintainers

Maxime Ripard (1):
      Merge drm/drm-next into drm-misc-next

Michał Winiarski (5):
      drm/managed: Add drmm_release_action
      drm/tests: managed: Rename the suite name to match other DRM tests
      drm/tests: managed: Add comments about test intent
      drm/tests: managed: Extract device initialization into test init
      drm/tests: managed: Add a simple test for drmm_managed_release

Philipp Stanner (2):
      drm/imx/dcss: request memory region
      drm/imx/dcss: have all init functions use devres

Primoz Fiser (1):
      drm/panel: simple: Add EDT ETML1010G3DRA panel

Randy Dunlap (5):
      drm/doc: internals: remove section on PCI legacy support
      dma-buf/dma-resv: fix spelling
      dma-buf/dma-fence: fix spelling
      drm/rect: fix kernel-doc typos
      drm/panel: re-alphabetize the menu list

Raphael Gallais-Pou (2):
      drm/panel: simple: fix flags on RK043FN48H
      drm/panel: simple: push blanking limit on RK32FN48H

Ricardo B. Marliere (2):
      drm: display: make dp_aux_bus_type const
      drm: mipi-dsi: make mipi_dsi_bus_type const

Ritesh Kumar (3):
      dt-bindings: display: panel: Add Novatek NT36672E LCD DSI
      drm/panel: Add support for Novatek NT36672E panel driver
      drm/panel: novatek-nt36672e: Include <linux/of.h>

Rob Clark (1):
      drm/ci: Add msm tests

Rodrigo Vivi (1):
      drm/doc/rfc: Removing missing reference to xe.rst

Samuel Dionne-Riel (1):
      drm: panel-orientation-quirks: Add quirk for GPD Win Mini

Somalapuram Amaranath (1):
      drm/ttm: replace busy placement with flags v6

Thomas Hellström (1):
      drm/exec, drm/gpuvm: Prefer u32 over uint32_t

Thomas Zimmermann (5):
      Documentation/gpu: Reference articles on Linux graphics stack
      video/cmdline: Introduce CONFIG_VIDEO for video= parameter
      video/cmdline: Hide __video_get_options() behind CONFIG_FB_CORE
      video/nomodeset: Select nomodeset= parameter with CONFIG_VIDEO
      Merge drm/drm-next into drm-misc-next

Tomi Valkeinen (2):
      drm/bridge: sii902x: Fix probing race issue
      drm/bridge: sii902x: Fix audio codec unregistration

Vignesh Raman (3):
      drm/ci: Update xfails for newly added msm tests
      drm/ci: uprev mesa version: fix kdl commit fetch
      drm/ci: add sc7180-trogdor-kingoftown

Yannic Moog (1):
      dt-bindings: display: panel-simple: add ETML1010G3DRA

Zack Rusin (3):
      drm/vmwgfx: Fix possible null pointer derefence with invalid contexts
      drm/ttm: Make sure the mapped tt pages are decrypted when needed
      drm/vmwgfx: Fix the lifetime of the bo cursor memory

Zhipeng Lu (1):
      drm/lima: fix a memleak in lima_heap_alloc

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml         | 102 ++++
 .../bindings/display/bridge/ti,sn65dsi86.yaml      |   2 +-
 .../bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml  |  84 +++
 .../display/panel/boe,th101mb31ig002-28a.yaml      |  58 ++
 .../bindings/display/panel/novatek,nt36672e.yaml   |  66 +++
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../bindings/display/panel/visionox,rm69299.yaml   |   3 +-
 Documentation/gpu/drm-internals.rst                |  12 -
 Documentation/gpu/introduction.rst                 |   2 +
 Documentation/gpu/rfc/index.rst                    |   4 -
 MAINTAINERS                                        |   1 +
 drivers/dma-buf/dma-fence.c                        |   8 +-
 drivers/dma-buf/dma-resv.c                         |   4 +-
 drivers/gpu/drm/Kconfig                            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  11 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |  12 +-
 drivers/gpu/drm/bridge/imx/Kconfig                 |  18 +
 drivers/gpu/drm/bridge/imx/Makefile                |   2 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       | 207 +++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        | 154 +++++
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  20 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   1 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  11 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  10 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |  17 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   1 +
 drivers/gpu/drm/bridge/tc358767.c                  |   7 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  18 +-
 drivers/gpu/drm/ci/build.sh                        |   1 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |  14 +-
 drivers/gpu/drm/ci/test.yml                        |  26 +-
 drivers/gpu/drm/ci/testlist.txt                    |  49 ++
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   3 +-
 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |  30 -
 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |  17 -
 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |   7 -
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |  17 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |  17 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   5 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |  28 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |   7 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c           |   2 +-
 drivers/gpu/drm/drm_bridge.c                       |  36 +-
 drivers/gpu/drm/drm_bridge_connector.c             |  16 +-
 drivers/gpu/drm/drm_exec.c                         |   2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   2 -
 drivers/gpu/drm/drm_managed.c                      |  39 ++
 drivers/gpu/drm/drm_mipi_dsi.c                     |   2 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  12 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  37 +-
 drivers/gpu/drm/imx/dcss/dcss-blkctl.c             |  13 +-
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c              |  14 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.c                |  19 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.h                |   1 -
 drivers/gpu/drm/imx/dcss/dcss-dpr.c                |  21 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |  12 +-
 drivers/gpu/drm/imx/dcss/dcss-dtg.c                |  26 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c             |  21 +-
 drivers/gpu/drm/imx/dcss/dcss-ss.c                 |  12 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |   2 +-
 drivers/gpu/drm/ingenic/Kconfig                    |   1 -
 drivers/gpu/drm/lima/lima_gem.c                    |  23 +-
 drivers/gpu/drm/loongson/lsdc_drv.c                |   2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c                |   2 -
 drivers/gpu/drm/mcde/Kconfig                       |   1 -
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  20 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  59 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |   1 -
 drivers/gpu/drm/nouveau/nouveau_svm.c              |  10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c     |   3 +-
 drivers/gpu/drm/panel/Kconfig                      | 221 +++----
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |  18 +-
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   | 322 +++++++++++
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |   8 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     | 643 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  61 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |   1 +
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |   1 +
 drivers/gpu/drm/pl111/Kconfig                      |   1 -
 drivers/gpu/drm/qxl/qxl_object.c                   |   2 -
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   2 -
 drivers/gpu/drm/radeon/radeon_object.c             |   2 -
 drivers/gpu/drm/radeon/radeon_ttm.c                |   8 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |   1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   1 +
 drivers/gpu/drm/tegra/hdmi.c                       |   1 +
 drivers/gpu/drm/tests/drm_managed_test.c           |  77 ++-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  28 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  13 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  73 +--
 drivers/gpu/drm/ttm/ttm_tt.c                       |  12 +
 drivers/gpu/drm/tve200/Kconfig                     |   1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   1 +
 drivers/gpu/drm/vmwgfx/ttm_object.c                |   6 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 296 ++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  32 -
 drivers/gpu/drm/xe/xe_bo.c                         |  33 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  14 +-
 drivers/media/i2c/tc358743.c                       |   7 +-
 drivers/staging/sm750fb/Kconfig                    |   1 -
 drivers/video/Kconfig                              |   5 +-
 drivers/video/Makefile                             |   3 +-
 drivers/video/cmdline.c                            |   2 +
 drivers/video/fbdev/Kconfig                        |  35 --
 drivers/video/fbdev/core/Kconfig                   |   2 +-
 drivers/video/fbdev/core/fbmem.c                   |   2 -
 drivers/video/fbdev/geode/Kconfig                  |   3 -
 include/drm/drm_bridge.h                           |  35 +-
 include/drm/drm_exec.h                             |   4 +-
 include/drm/drm_gpuvm.h                            |   2 +-
 include/drm/drm_managed.h                          |   4 +
 include/drm/drm_rect.h                             |   4 +-
 include/drm/ttm/ttm_placement.h                    |  10 +-
 include/drm/ttm/ttm_resource.h                     |   8 +-
 include/drm/ttm/ttm_tt.h                           |   9 +-
 include/linux/fb.h                                 |   7 -
 include/sound/hdmi-codec.h                         |   1 -
 include/uapi/drm/vmwgfx_drm.h                      |   6 +-
 include/video/cmdline.h                            |   8 +-
 133 files changed, 2633 insertions(+), 980 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
 create mode 100644 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672e.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
