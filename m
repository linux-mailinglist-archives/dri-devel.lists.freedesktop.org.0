Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A085FA8A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 14:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CC610E93F;
	Thu, 22 Feb 2024 13:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VY6eOg5B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cqn46D77";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VY6eOg5B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cqn46D77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA5410E6FD;
 Thu, 22 Feb 2024 13:58:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 475751F461;
 Thu, 22 Feb 2024 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708610323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=odwJk8hAfjCS8VvHSQMCo8xGn7In6YDpj13V7WH3EVM=;
 b=VY6eOg5B5Zwiq4AkaqdEQ2rBFjbL0HKeEz7X4KDygs2mHoR3YEKmsf2+eAG74FOl4ienIu
 72qOgWvJsFYyzwPpOIl3yGF7nCRBiC5kAtykq2lC25btJJE/7UuC20w0wMm5nVtYbms21o
 VUokME2dCrPxblCr0Ptg5QtpEsOsmCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708610323;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=odwJk8hAfjCS8VvHSQMCo8xGn7In6YDpj13V7WH3EVM=;
 b=Cqn46D77b5M2Wr8aZybKZWL0r0dDi2EZQ/vWjXsEvmlH4sWkHQl5bklpRs0iSjevTvppM7
 AMR+IRQ4YrKCEUCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708610323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=odwJk8hAfjCS8VvHSQMCo8xGn7In6YDpj13V7WH3EVM=;
 b=VY6eOg5B5Zwiq4AkaqdEQ2rBFjbL0HKeEz7X4KDygs2mHoR3YEKmsf2+eAG74FOl4ienIu
 72qOgWvJsFYyzwPpOIl3yGF7nCRBiC5kAtykq2lC25btJJE/7UuC20w0wMm5nVtYbms21o
 VUokME2dCrPxblCr0Ptg5QtpEsOsmCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708610323;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=odwJk8hAfjCS8VvHSQMCo8xGn7In6YDpj13V7WH3EVM=;
 b=Cqn46D77b5M2Wr8aZybKZWL0r0dDi2EZQ/vWjXsEvmlH4sWkHQl5bklpRs0iSjevTvppM7
 AMR+IRQ4YrKCEUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C94FE13A8C;
 Thu, 22 Feb 2024 13:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xI6sLxJT12WgQQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Feb 2024 13:58:42 +0000
Date: Thu, 22 Feb 2024 14:58:41 +0100
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
Message-ID: <20240222135841.GA6677@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.10
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

this is the weekly PR for drm-misc-next. It's the usual set of
fixes and driver updates. Statistics computation for shared GEM BOs
has been updated to take imported DMA bufs into account. This can
result in different output from fdinfo files, which could be seen
as a UAPI change.

Best regards
Thomas

drm-misc-next-2024-02-22:
drm-misc-next for v6.9:

UAPI Changes:

- changes to fdinfo stats

Cross-subsystem Changes:

agp:
- remove unused type field from struct agp_bridge_data

Core Changes:

ci:
- update test names
- cleanups

gem:
- add stats for shared buffers plus updates to amdgpu, i915, xe

Documentation:
- fixes

syncobj:
- fixes to waiting and sleeping

Driver Changes:

bridge:
- adv7511: fix crash on irq during probe
- dw_hdmi: set bridge type

host1x:
- cleanups

ivpu:
- updates to firmware API
- refactor BO allocation

meson:
- fix error handling in probe

panel:
- revert "drm/panel-edp: Add auo_b116xa3_mode"
- add Himax HX83112A plus DT bindings
- ltk500hd1829: add support for ltk101b4029w and admatec 9904370
- simple: add BOE BP082WX1-100 8.2" panel plus DT bindungs

renesas:
- add RZ/G2L DU support plus DT bindings
The following changes since commit aa1267e673fe5307cf00d02add4017d2878598b6:

  drm: ci: use clk_ignore_unused for apq8016 (2024-02-14 11:23:56 -0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2024-02-22

for you to fetch changes up to a3baaca4a8766e9386e472d97315e5c131beb87d:

  drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vsp_*() (2024-02-22 14:46:41 +0100)

----------------------------------------------------------------
drm-misc-next for v6.9:

UAPI Changes:

- changes to fdinfo stats

Cross-subsystem Changes:

agp:
- remove unused type field from struct agp_bridge_data

Core Changes:

ci:
- update test names
- cleanups

gem:
- add stats for shared buffers plus updates to amdgpu, i915, xe

Documentation:
- fixes

syncobj:
- fixes to waiting and sleeping

Driver Changes:

bridge:
- adv7511: fix crash on irq during probe
- dw_hdmi: set bridge type

host1x:
- cleanups

ivpu:
- updates to firmware API
- refactor BO allocation

meson:
- fix error handling in probe

panel:
- revert "drm/panel-edp: Add auo_b116xa3_mode"
- add Himax HX83112A plus DT bindings
- ltk500hd1829: add support for ltk101b4029w and admatec 9904370
- simple: add BOE BP082WX1-100 8.2" panel plus DT bindungs

renesas:
- add RZ/G2L DU support plus DT bindings

----------------------------------------------------------------
Alex Deucher (6):
      Documentation/gpu: Update documentation on drm-shared-*
      drm: add drm_gem_object_is_shared_for_memory_stats() helper
      drm: update drm_show_memory_stats() for dma-bufs
      drm/amdgpu: add shared fdinfo stats
      drm/i915: Update shared stats to use the new gem helper
      drm/xe: Update shared stats to use the new gem helper

Alexander Stein (1):
      drm: bridge: dw_hdmi: Set DRM bridge type

Biju Das (6):
      dt-bindings: display: Document Renesas RZ/G2L DU bindings
      dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
      drm: renesas: Add RZ/G2L DU Support
      MAINTAINERS: Update entries for Renesas DRM drivers
      MAINTAINERS: Create entry for Renesas RZ DRM drivers
      drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vsp_*()

Colin Ian King (1):
      gpu: host1x: remove redundant assignment to variable space

Devarsh Thakkar (1):
      dt-bindings: display: ti,am65x-dss: Add support for common1 region

Dmitry Baryshkov (4):
      drm/ci: skip suspend tests for both msm-sc7180 machines
      drm/ci: update IGT test names
      drm/ci: update msm-apq8096-fails list
      drm/ci: mark universal-plane-sanity as failing on SC7180

Douglas Anderson (1):
      drm/panel: boe-tv101wum-nl6: make use of prepare_prev_first

Erik Kurzinger (3):
      drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
      drm/syncobj: reject invalid flags in drm_syncobj_find_fence
      drm/syncobj: call might_sleep before waiting for fence submission

Geert Uytterhoeven (1):
      drm: Spelling s/hardward/hardware/g

Heiko Stuebner (5):
      dt-bindings: vendor-prefixes: add prefix for admatec GmbH
      dt-bindings: display: panel-lvds: Add compatible for admatec 9904370 panel
      drm/panel: ltk500hd1829: make room for more similar panels
      dt-bindings: display: ltk500hd1829: add variant compatible for ltk101b4029w
      drm/panel: ltk500hd1829: add panel type for ltk101b4029w

Hsin-Yi Wang (1):
      Revert "drm/panel-edp: Add auo_b116xa3_mode"

Jacek Lawrynowicz (5):
      accel/ivpu: Rename TILE_SKU_BOTH_MTL to TILE_SKU_BOTH
      accel/ivpu: Remove legacy firmware name
      accel/ivpu: Update FW API headers
      accel/ivpu: Fix ivpu_reset_engine_fn merge issue
      accel/ivpu: Rename VPU to NPU in message strings

Jiri Slaby (SUSE) (1):
      char/agp: remove agp_bridge_data::type

Krystian Pradzynski (1):
      accel/ivpu: Add support for FW boot param system_time_us

Luca Weiss (2):
      dt-bindings: display: panel: Add Himax HX83112A
      drm/panel: Add driver for DJN HX83112A LCD panel

Mads Bligaard Nielsen (1):
      drm/bridge: adv7511: fix crash on irq during probe

Martin Blumenstingl (1):
      drm/meson: improve encoder probe / initialization error handling

Tony Lindgren (2):
      dt-bindings: display: simple: Add boe,bp082wx1-100 8.2" panel
      drm/panel: simple: Add BOE BP082WX1-100 8.2" panel

Wachowski, Karol (2):
      accel/ivpu: Use lazy allocation for doorbell IDs
      accel/ivpu: Refactor BO creation functions

 .../bindings/display/panel/himax,hx83112a.yaml     |   74 +
 .../display/panel/leadtek,ltk500hd1829.yaml        |    4 +-
 .../bindings/display/panel/panel-lvds.yaml         |    2 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/renesas,rzg2l-du.yaml         |  126 ++
 .../bindings/display/ti/ti,am65x-dss.yaml          |    7 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/gpu/drm-usage-stats.rst              |    2 +-
 MAINTAINERS                                        |   12 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |   32 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   12 +-
 drivers/accel/ivpu/ivpu_drv.h                      |    7 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   49 +-
 drivers/accel/ivpu/ivpu_fw_log.c                   |    6 +-
 drivers/accel/ivpu/ivpu_gem.c                      |   70 +-
 drivers/accel/ivpu/ivpu_gem.h                      |    6 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |   10 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |   10 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |   12 +-
 drivers/accel/ivpu/ivpu_job.c                      |   20 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   10 +-
 drivers/accel/ivpu/vpu_boot_api.h                  |   46 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |   32 +-
 drivers/char/agp/agp.h                             |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    6 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   22 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    1 +
 drivers/gpu/drm/ci/testlist.txt                    | 1888 +++++++++-----------
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    2 -
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |    1 +
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |    2 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |    1 +
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |    2 +
 drivers/gpu/drm/drm_file.c                         |    2 +-
 drivers/gpu/drm/drm_syncobj.c                      |   11 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |    2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    6 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   24 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.h         |    2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   23 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.h          |    2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   15 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.h         |    2 +-
 drivers/gpu/drm/panel/Kconfig                      |   10 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |    2 +
 drivers/gpu/drm/panel/panel-edp.c                  |   19 +-
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       |  372 ++++
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |  265 ++-
 drivers/gpu/drm/panel/panel-simple.c               |   20 +
 drivers/gpu/drm/renesas/Kconfig                    |    1 +
 drivers/gpu/drm/renesas/Makefile                   |    1 +
 drivers/gpu/drm/renesas/rz-du/Kconfig              |   12 +
 drivers/gpu/drm/renesas/rz-du/Makefile             |    8 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c      |  422 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h      |   89 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |  175 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h       |   78 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |   72 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h   |   32 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |  371 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h       |   43 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |  349 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h       |   82 +
 drivers/gpu/drm/xe/xe_drm_client.c                 |    2 +-
 drivers/gpu/host1x/cdma.c                          |    3 +-
 include/drm/drm_bridge.h                           |    2 +-
 include/drm/drm_gem.h                              |   13 +
 70 files changed, 3748 insertions(+), 1279 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83112a.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
