Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B5B39471
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 08:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5925910E6A1;
	Thu, 28 Aug 2025 06:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DjmPXXJ0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X3cLXoV4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DjmPXXJ0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X3cLXoV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11AE10E662
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 06:57:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D2B520A2B;
 Thu, 28 Aug 2025 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756364236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=qDWNDVvNNsAxXJooDXOa/tZgDE103c22K7NDiMqZuqw=;
 b=DjmPXXJ0cl2xp/Dry6gOZ+hmYUeZCK1ASitG5fXQj4J0a6evWZbd3A98ibe5c7uUpAe4nq
 tQZG82rghF1Foj0R2KhY7Xc5HIpyRDH2v+/fREBxOlpjehLKDQ79Csh/uPSuMP82ahrX5l
 +UncMQ01scYjplpXbKjJs3XjowZwk18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756364236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=qDWNDVvNNsAxXJooDXOa/tZgDE103c22K7NDiMqZuqw=;
 b=X3cLXoV4xOQPQjW84hWp4RGupkx84GFl7l2nW2XMGKHFm7llGZRHloZ8uFBGRgDxlYe5Ru
 wqkpwXAPx5f4yUDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DjmPXXJ0;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X3cLXoV4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756364236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=qDWNDVvNNsAxXJooDXOa/tZgDE103c22K7NDiMqZuqw=;
 b=DjmPXXJ0cl2xp/Dry6gOZ+hmYUeZCK1ASitG5fXQj4J0a6evWZbd3A98ibe5c7uUpAe4nq
 tQZG82rghF1Foj0R2KhY7Xc5HIpyRDH2v+/fREBxOlpjehLKDQ79Csh/uPSuMP82ahrX5l
 +UncMQ01scYjplpXbKjJs3XjowZwk18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756364236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=qDWNDVvNNsAxXJooDXOa/tZgDE103c22K7NDiMqZuqw=;
 b=X3cLXoV4xOQPQjW84hWp4RGupkx84GFl7l2nW2XMGKHFm7llGZRHloZ8uFBGRgDxlYe5Ru
 wqkpwXAPx5f4yUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07E881368B;
 Thu, 28 Aug 2025 06:57:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id s6S2AMz9r2gtDgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Aug 2025 06:57:16 +0000
Date: Thu, 28 Aug 2025 08:57:14 +0200
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
Message-ID: <20250828065714.GA11906@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 6D2B520A2B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

this is the PR from drm-misc-next for this week. Noteworthy is a UAPI
fix for async page flips.

Best regards
Thomas

drm-misc-next-2025-08-28:
drm-misc-next for v6.18:

UAPI Changes:

atomic:
- Reallow no-op async page flips

Cross-subsystem Changes:

hid:
- i2c-hid: Make elan touch controllers power on after panel is enabled

video:
- Improve pixel-format handling for struct screen_info

Core Changes:

display:
- dp: Fix command length

Driver Changes:

amdxdna:
- Fixes

bridge:
- Add support for Radxa Ra620 plus DT bindings

msm:
- Fix VMA allocation

panel:
- ilitek-ili9881c: Refactor mode setting; Add support for Bestar
  BSD1218-A101KL68 LCD plus DT bindings
- lvds: Add support for Ampire AMP19201200B5TZQW-T03 to DT bindings

rockchip:
- dsi2: Add support for RK3576 plus DT bindings

stm:
- Clean up logging

vesadrm:
- Support 8-bit palette mode
The following changes since commit 043d9c6928b010be7902a01b5cdfa7d754535b1a:

  drm/bridge: anx7625: register content protect property (2025-08-20 08:22:01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-08-28

for you to fetch changes up to 5c76c794bf29399394ebacaa5af8436b8bed0d46:

  HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower() (2025-08-27 16:35:20 -0700)

----------------------------------------------------------------
drm-misc-next for v6.18:

UAPI Changes:

atomic:
- Reallow no-op async page flips

Cross-subsystem Changes:

hid:
- i2c-hid: Make elan touch controllers power on after panel is enabled

video:
- Improve pixel-format handling for struct screen_info

Core Changes:

display:
- dp: Fix command length

Driver Changes:

amdxdna:
- Fixes

bridge:
- Add support for Radxa Ra620 plus DT bindings

msm:
- Fix VMA allocation

panel:
- ilitek-ili9881c: Refactor mode setting; Add support for Bestar
  BSD1218-A101KL68 LCD plus DT bindings
- lvds: Add support for Ampire AMP19201200B5TZQW-T03 to DT bindings

rockchip:
- dsi2: Add support for RK3576 plus DT bindings

stm:
- Clean up logging

vesadrm:
- Support 8-bit palette mode

----------------------------------------------------------------
Andy Yan (2):
      dt-bindings: display: simple-bridge: Add ra620 compatible
      drm/bridge: simple-bridge: Add support for radxa ra620

Dan Carpenter (2):
      drm/panel: jdi-lpm102a188a: Fix error code in jdi_panel_prepare()
      HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()

Dmitry Baryshkov (1):
      drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs

Guochun Huang (1):
      drm/rockchip: dsi2: add support rk3576

Heiko Stuebner (7):
      drm/panel: ilitek-ili9881c: turn off power-supply when init fails
      drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to (un-)prepare
      drm/panel: ilitek-ili9881c: convert (un-)prepare to mipi_dsi_multi_context
      dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar Electronic
      dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
      drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
      dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2 controller schema

Lizhi Hou (2):
      Documentation: accel: amdxdna: Update compiler information
      accel/amdxdna: Fix incorrect type used for a local variable

Pin-yen Lin (2):
      drm/panel: Allow powering on panel follower after panel is enabled
      HID: i2c-hid: Make elan touch controllers power on after panel is enabled

Raphael Gallais-Pou (3):
      drm: of: fix documentation reference
      dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in panel-lvds
      drm/stm: ltdc: unify log system

Thomas Zimmermann (10):
      video: pixel_format: Add compare helpers
      video: screen_info: Add pixel-format helper for linear framebuffers
      drm/sysfb: Find screen_info format with helpers
      drm/sysfb: Blit to CRTC destination format
      drm/color-mgmt: Prepare for RGB332 palettes
      drm/format-helper: Add XRGB8888-to-RGB332 to drm_fb_blit()
      drm/vesadrm: Rename vesadrm_set_gamma_lut() to vesadrm_set_color_lut()
      drm/vesadrm: Prepare color management for palette-based framebuffers
      drm/vesadrm: Support DRM_FORMAT_C8
      drm/sysfb: Do not deref unexisting CRTC state in atomic_disable

Val Packett (1):
      drm/dp: drm_edp_backlight_set_level: do not always send 3-byte commands

Xaver Hugl (1):
      drm: re-allow no-op changes on non-primary planes in async flips

 Documentation/accel/amdxdna/amdnpu.rst             |  10 +-
 .../bindings/display/bridge/simple-bridge.yaml     |   1 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
 .../bindings/display/panel/panel-lvds.yaml         |   2 +
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml        |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/accel/amdxdna/aie2_pci.c                   |   3 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +
 drivers/gpu/drm/display/drm_dp_helper.c            |   4 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |  23 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |  34 +++
 drivers/gpu/drm/drm_format_helper.c                |   3 +
 drivers/gpu/drm/drm_of.c                           |   7 +-
 drivers/gpu/drm/drm_panel.c                        |  73 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  13 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 302 +++++++++++++++++----
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |   4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c   |  21 ++
 drivers/gpu/drm/stm/ltdc.c                         | 139 +++++-----
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |  24 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c      |  19 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    | 153 +++++++++--
 drivers/hid/i2c-hid/i2c-hid-core.c                 |  46 ++--
 drivers/hid/i2c-hid/i2c-hid-of-elan.c              |  11 +-
 drivers/video/screen_info_generic.c                |  55 ++++
 include/drm/drm_color_mgmt.h                       |   1 +
 include/drm/drm_panel.h                            |  14 +
 include/linux/hid.h                                |   2 +
 include/linux/screen_info.h                        |   2 +
 include/video/pixel_format.h                       |  61 +++++
 31 files changed, 817 insertions(+), 221 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
