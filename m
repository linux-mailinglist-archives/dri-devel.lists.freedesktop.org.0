Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409EC856448
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 14:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DDA10E7D4;
	Thu, 15 Feb 2024 13:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PsyCtG2Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ISUPsBRf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PsyCtG2Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ISUPsBRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D30310E7BC;
 Thu, 15 Feb 2024 13:26:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B83721F4A;
 Thu, 15 Feb 2024 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708003572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RI0WCuctkLaHpQpD/PEL+xM6htSsjBx35OrDA4oiTH0=;
 b=PsyCtG2YZYlYtvmlkxUHIA1mmUNENYiuSjtzNBFrBNE/3lNkX+R8jwfMlWIc5wRR+1bu0n
 40M7kE9LSKZO54qzpWt2DENyithCqS/gaPrZ6CaboF4a+ybdwMOQEPfM9i6gHe9676KBiV
 F/Wiq9TvA4GN3twXpfeDEXilIgne4yI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708003572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RI0WCuctkLaHpQpD/PEL+xM6htSsjBx35OrDA4oiTH0=;
 b=ISUPsBRfi1zJpkIHXuEAD2vZAlNOyRcsM5iQH9jDfb4/22pBW+kbg1UqzcZsmUSdFQMrIZ
 9FU35mY4f1OspVAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708003572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RI0WCuctkLaHpQpD/PEL+xM6htSsjBx35OrDA4oiTH0=;
 b=PsyCtG2YZYlYtvmlkxUHIA1mmUNENYiuSjtzNBFrBNE/3lNkX+R8jwfMlWIc5wRR+1bu0n
 40M7kE9LSKZO54qzpWt2DENyithCqS/gaPrZ6CaboF4a+ybdwMOQEPfM9i6gHe9676KBiV
 F/Wiq9TvA4GN3twXpfeDEXilIgne4yI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708003572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RI0WCuctkLaHpQpD/PEL+xM6htSsjBx35OrDA4oiTH0=;
 b=ISUPsBRfi1zJpkIHXuEAD2vZAlNOyRcsM5iQH9jDfb4/22pBW+kbg1UqzcZsmUSdFQMrIZ
 9FU35mY4f1OspVAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E661E13A53;
 Thu, 15 Feb 2024 13:26:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SebrNvMQzmWZVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Feb 2024 13:26:11 +0000
Date: Thu, 15 Feb 2024 14:26:10 +0100
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
Message-ID: <20240215132610.GA1464@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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

Hi Dave, Sima,

here's the drm-misc-next PR for this week. The majority of changes
comes from Jani's update of the internal EDID callbacks, which the bridge
code now uses. There are also stability fixes for lima, improvements to
print helpers, correct parent devices for firmware framebuffers, and of
course various fixes.

Best regards
Thomas

drm-misc-next-2024-02-15:
drm-misc-next for v6.9:

UAPI Changes:

Cross-subsystem Changes:

arch:
- powerpc/ps3: select CONFIG_VIDEO

Core Changes:

ci:
- msm: fix apq8016 runner

display:
- use newer DRM print helpers

documentation:
- fix typos

print:
- add device-specific error and debug printers

sysfb:
- set Linux parent device for firmware framebuffer

tests:
- mm: use newer DRM print helpers

Driver Changes:

bridge:
- switch to ->read_edid callback throughout the bridge
drivers
- remove old ->get_edid callback

i915:
- use newer DRM print helpers

lima:
- improve stability by fixes to error handling and recovery

mediathek:
- switch to ->read_edid callback

msm:
- switch to ->read_edid callback

omap:
- switch to ->read_edid callback

panel:
- add Powkiddy RGB10MAX3 plus DT bindings
- st7703: support panel rotation plus DT bindings

rockchip:
- DT bindings: remove port, add power-domains

xe:
- use newer DRM print helpers

xlnx:
- switch to ->read_edid callback
The following changes since commit 3ce7384048fa1793db0eae013fa377d89256b76f:

  drm/bridge: remove drm_bridge_get_edid() in favour of drm_bridge_edid_read() (2024-02-08 17:12:33 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2024-02-15

for you to fetch changes up to aa1267e673fe5307cf00d02add4017d2878598b6:

  drm: ci: use clk_ignore_unused for apq8016 (2024-02-14 11:23:56 -0300)

----------------------------------------------------------------
drm-misc-next for v6.9:

UAPI Changes:

Cross-subsystem Changes:

arch:
- powerpc/ps3: select CONFIG_VIDEO

Core Changes:

ci:
- msm: fix apq8016 runner

display:
- use newer DRM print helpers

documentation:
- fix typos

print:
- add device-specific error and debug printers

sysfb:
- set Linux parent device for firmware framebuffer

tests:
- mm: use newer DRM print helpers

Driver Changes:

bridge:
- switch to ->read_edid callback throughout the bridge
drivers
- remove old ->get_edid callback

i915:
- use newer DRM print helpers

lima:
- improve stability by fixes to error handling and recovery

mediathek:
- switch to ->read_edid callback

msm:
- switch to ->read_edid callback

omap:
- switch to ->read_edid callback

panel:
- add Powkiddy RGB10MAX3 plus DT bindings
- st7703: support panel rotation plus DT bindings

rockchip:
- DT bindings: remove port, add power-domains

xe:
- use newer DRM print helpers

xlnx:
- switch to ->read_edid callback

----------------------------------------------------------------
Chris Morgan (4):
      dt-bindings: display: Add Powkiddy RGB10MAX3 panel
      drm/panel: st7703: Add Powkiddy RGB10MAX3 Panel Support
      dt-bindings: display: rocktech,jh057n00900: Document panel rotation
      drm/panel: st7703: Add Panel Rotation Support

Dmitry Baryshkov (1):
      drm: ci: use clk_ignore_unused for apq8016

Erico Nunes (8):
      drm/lima: reset async_reset on pp hard reset
      drm/lima: reset async_reset on gp hard reset
      drm/lima: set pp bus_stop bit before hard reset
      drm/lima: set gp bus_stop bit before hard reset
      drm/lima: handle spurious timeouts due to high irq latency
      drm/lima: remove guilty drm_sched context handling
      drm/lima: increase default job timeout to 10s
      drm/lima: standardize debug messages by ip name

Jani Nikula (37):
      drm/bridge: anx7625: switch to ->edid_read callback
      drm/bridge: cdns-mhdp8546: switch to ->edid_read callback
      drm/bridge: cdns-mhdp8546: clear the EDID property on failures
      drm/bridge: display-connector: switch to ->edid_read callback
      drm/bridge: it6505: switch to ->edid_read callback
      drm: bridge: it66121: switch to ->edid_read callback
      drm/bridge: lt9611: switch to ->edid_read callback
      drm/bridge: lt9611uxc: switch to ->edid_read callback
      drm/bridge: megachips: switch to ->edid_read callback
      drm/bridge: nxp-ptn3460: switch to ->edid_read callback
      drm/bridge: sii902x: use display info is_hdmi
      drm/bridge: sii902x: switch to ->edid_read callback
      drm/mediatek/dp: switch to ->edid_read callback
      drm/mediatek/hdmi: switch to ->edid_read callback
      drm/msm/hdmi: fix indent
      drm/msm/hdmi: switch to ->edid_read callback
      drm/omap/hdmi4: switch to ->edid_read callback
      drm/omap/hdmi5: switch to ->edid_read callback
      drm: xlnx: zynqmp_dpsub: switch to ->edid_read callback
      drm: adv7511: switch to ->edid_read callback
      drm: bridge: dw_hdmi: switch to ->edid_read callback
      drm: bridge: dw_hdmi: clear the EDID property and CEC address on failures
      drm/bridge: tc358767: update the EDID property
      drm/bridge: tc358767: switch to ->edid_read callback
      drm/bridge: ti-sn65dsi86: switch to ->edid_read callback
      drm/bridge: remove ->get_edid callback
      drm/print: make drm_err_printer() device specific by using drm_err()
      drm/print: move enum drm_debug_category etc. earlier in drm_print.h
      drm/print: add drm_dbg_printer() for drm device specific printer
      drm/dp_mst: switch from drm_debug_printer() to device specific drm_dbg_printer()
      drm/mode: switch from drm_debug_printer() to device specific drm_dbg_printer()
      drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
      drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()
      drm/i915: use drm_printf() with the drm_err_printer intead of pr_err()
      drm/xe: switch from drm_debug_printer() to device specific drm_dbg_printer()
      drm: remove drm_debug_printer in favor of drm_dbg_printer
      drm/xe: fix arguments to drm_err_printer()

Johan Jonker (2):
      dt-bindings: display: rockchip: rockchip,dw-hdmi: remove port property
      dt-bindings: display: rockchip,dw-hdmi: add power-domains property

Michał Winiarski (1):
      drm/tests: mm: Convert to drm_dbg_printer

Randy Dunlap (3):
      drivers/ps3: select VIDEO to provide cmdline functions
      drm: drm_crtc: correct some comments
      iosys-map: fix typo

Ricardo B. Marliere (1):
      gpu: host1x: bus: make host1x_bus_type const

Thomas Hellström (1):
      drm/xe: Fix a missing argument to drm_err_printer

Thomas Zimmermann (8):
      video: Add helpers for decoding screen_info
      video: Provide screen_info_get_pci_dev() to find screen_info's PCI device
      firmware/sysfb: Set firmware-framebuffer parent device
      fbdev/efifb: Remove PM for parent device
      firmware/sysfb: Create firmware device only for enabled PCI devices
      fbdev/efifb: Do not track parent device status
      firmware/sysfb: Update screen_info for relocated EFI framebuffers
      fbdev/efifb: Remove framebuffer relocation tracking

 .../display/panel/rocktech,jh057n00900.yaml        |   3 +
 .../display/rockchip/rockchip,dw-hdmi.yaml         |  33 +++-
 arch/powerpc/platforms/ps3/Kconfig                 |   1 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/sysfb.c                           |  51 ++++-
 drivers/firmware/sysfb_simplefb.c                  |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  47 +++--
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  30 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  28 +--
 drivers/gpu/drm/bridge/display-connector.c         |   8 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  17 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |  16 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   8 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   8 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  18 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  22 ++-
 drivers/gpu/drm/bridge/sii902x.c                   |  38 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  43 ++--
 drivers/gpu/drm/bridge/tc358767.c                  |  17 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   8 +-
 drivers/gpu/drm/ci/test.yml                        |   5 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  17 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  23 ++-
 drivers/gpu/drm/drm_bridge.c                       |  19 --
 drivers/gpu/drm/drm_crtc.c                         |   8 +-
 drivers/gpu/drm/drm_mode_config.c                  |   2 +-
 drivers/gpu/drm/drm_modeset_lock.c                 |   2 +-
 drivers/gpu/drm/drm_print.c                        |  29 ++-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   5 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  27 ++-
 .../gpu/drm/i915/display/intel_display_driver.c    |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   3 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |   3 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |  10 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   3 +-
 drivers/gpu/drm/i915/selftests/i915_active.c       |   8 +-
 drivers/gpu/drm/lima/lima_ctx.c                    |   2 +-
 drivers/gpu/drm/lima/lima_ctx.h                    |   1 -
 drivers/gpu/drm/lima/lima_gp.c                     |  39 +++-
 drivers/gpu/drm/lima/lima_l2_cache.c               |   6 +-
 drivers/gpu/drm/lima/lima_mmu.c                    |  18 +-
 drivers/gpu/drm/lima/lima_pmu.c                    |   3 +-
 drivers/gpu/drm/lima/lima_pp.c                     |  37 +++-
 drivers/gpu/drm/lima/lima_sched.c                  |  38 +++-
 drivers/gpu/drm/lima/lima_sched.h                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  31 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  26 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  33 ++--
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |  22 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |  12 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 104 ++++++++++
 drivers/gpu/drm/tests/drm_mm_test.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c                |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   3 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   8 +-
 drivers/gpu/host1x/bus.c                           |   2 +-
 drivers/gpu/host1x/bus.h                           |   2 +-
 drivers/video/Kconfig                              |   4 +
 drivers/video/Makefile                             |   4 +
 drivers/video/fbdev/efifb.c                        |  97 +--------
 drivers/video/screen_info_generic.c                | 146 ++++++++++++++
 drivers/video/screen_info_pci.c                    | 136 +++++++++++++
 include/drm/display/drm_dp_helper.h                |   3 +-
 include/drm/drm_bridge.h                           |  30 ---
 include/drm/drm_print.h                            | 220 +++++++++++----------
 include/linux/iosys-map.h                          |   2 +-
 include/linux/screen_info.h                        | 126 ++++++++++++
 include/linux/sysfb.h                              |   6 +-
 74 files changed, 1186 insertions(+), 567 deletions(-)
 create mode 100644 drivers/video/screen_info_generic.c
 create mode 100644 drivers/video/screen_info_pci.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
