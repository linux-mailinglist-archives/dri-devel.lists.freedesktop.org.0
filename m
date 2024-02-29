Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE686C41A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241E10E380;
	Thu, 29 Feb 2024 08:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ez1gmYsj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PNY6SIHu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kszoDB+U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MD/qm0UZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE710E336;
 Thu, 29 Feb 2024 08:48:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F00981F7CA;
 Thu, 29 Feb 2024 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709196488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z8mhRkkMZKsglNVQUnJwl53a+6TSR4e41XZHIxcGWr4=;
 b=ez1gmYsjjbih+ihR4qkXMeQPQX++7r9wLMhRmN+jXowo8LPB51oQaSC+Sv3hVj5JssUPr/
 fwAMSH2WjsXt6X9gsnq2oqiPhZdb3PTeuOCmpY3JsCvHF7+Gi/Hs9v7YirRDx9dlrb2J7K
 TXcjQFka6v7HQN8ZcKbMFlLSJLXaTxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709196488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z8mhRkkMZKsglNVQUnJwl53a+6TSR4e41XZHIxcGWr4=;
 b=PNY6SIHuotrsDQOcFBMAbU60K5MeZo98bWjUxVM/MfGFArhggYPQMnLnqSzPhFfYzbwp3U
 UiLLGO5kWiSC9kAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709196487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z8mhRkkMZKsglNVQUnJwl53a+6TSR4e41XZHIxcGWr4=;
 b=kszoDB+USgH2JDctqgU5KctgQTDq59Fkjx6T1hMMEAN0fm5z6FH5ABGzWcHlZev/sJ52A7
 L2tYT7M6lIOkYsjkH4uR7dSQTk89hQ8m23p8Q5NjvGlcN/ABXHmb55SQwBqGGWxgjL5Q3H
 D6AICjyTNTWbzursJ6oSBUm1GREGTPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709196487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z8mhRkkMZKsglNVQUnJwl53a+6TSR4e41XZHIxcGWr4=;
 b=MD/qm0UZany/QSc65nB+V8yCWHakBMJCTGB+EecYaOZ4VipPFyJQOp/1WInYMV3odozYa2
 FA+haXLbiuvNU0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8596113A58;
 Thu, 29 Feb 2024 08:48:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6zOlHsdE4GXaTwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Feb 2024 08:48:07 +0000
Date: Thu, 29 Feb 2024 09:48:06 +0100
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
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20240229084806.GA21616@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kszoDB+U;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="MD/qm0UZ"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.36 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.05)[-0.262];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -4.36
X-Rspamd-Queue-Id: F00981F7CA
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

here's the additional PR for drm-misc-next.

Best regards
Thomas

drm-misc-next-2024-02-29:
drm-misc-next for v6.9:

UAPI Changes:

Cross-subsystem Changes:

backlight:
- corgi: include backlight header

fbdev:
- Cleanup includes in public header file
- fbtft: Include backlight header

Core Changes:

edid:
- Remove built-in EDID data

dp:
- Avoid AUX transfers on powered-down displays
- Add VSC SDP helpers

modesetting:
- Add sanity checks for polling
- Cleanups

scheduler:
- Cleanups

tests:
- Add helpers for mode-setting tests

Driver Changes:

i915:
- Use shared VSC SDP helper

mgag200:
- Work around PCI write bursts

mxsfb:
- Use managed mode config

nouveau:
- Include backlight header where necessary

qiac:
- Cleanups

sun4:
- HDMI: updates to atomic mode setting

tegra:
- Fix GEM refounting in error paths

tidss:
- Fix multi display
- Fix initial Z position

v3d:
- Support display MMU page size
The following changes since commit f112b68f273fb0121cb64e0c3ac06adcb91e32b8:

  Merge v6.8-rc6 into drm-next (2024-02-26 11:41:07 +0100)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-misc tags/drm-misc-next-2024-02-29

for you to fetch changes up to 8df1ddb5bf11ab820ad991e164dab82c0960add9:

  drm/dp: Don't attempt AUX transfers when eDP panels are not powered (2024-02-28 12:43:36 -0800)

----------------------------------------------------------------
drm-misc-next for v6.9:

UAPI Changes:

Cross-subsystem Changes:

backlight:
- corgi: include backlight header

fbdev:
- Cleanup includes in public header file
- fbtft: Include backlight header

Core Changes:

edid:
- Remove built-in EDID data

dp:
- Avoid AUX transfers on powered-down displays
- Add VSC SDP helpers

modesetting:
- Add sanity checks for polling
- Cleanups

scheduler:
- Cleanups

tests:
- Add helpers for mode-setting tests

Driver Changes:

i915:
- Use shared VSC SDP helper

mgag200:
- Work around PCI write bursts

mxsfb:
- Use managed mode config

nouveau:
- Include backlight header where necessary

qiac:
- Cleanups

sun4:
- HDMI: updates to atomic mode setting

tegra:
- Fix GEM refounting in error paths

tidss:
- Fix multi display
- Fix initial Z position

v3d:
- Support display MMU page size

----------------------------------------------------------------
Abhinav Kumar (2):
      drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
      drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()

Douglas Anderson (1):
      drm/dp: Don't attempt AUX transfers when eDP panels are not powered

Fedor Pchelkin (1):
      drm/tegra: put drm_gem_object ref on error in tegra_fb_create

Jeff Johnson (1):
      accel/qaic: Constify aic100_channels

Jocelyn Falempe (1):
      drm/mgag200: Add a workaround for low-latency

Kunwu Chan (1):
      drm/scheduler: Simplify the allocation of slab caches in drm_sched_fence_slab_init

Marek Vasut (2):
      drm/mxsfb: Switch to drmm_mode_config_init
      drm: lcdif: Switch to drmm_mode_config_init

Maxime Ripard (10):
      drm/sun4i: hdmi: Convert encoder to atomic
      drm/sun4i: hdmi: Move mode_set into enable
      drm/sun4i: hdmi: Switch to container_of_const
      drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
      drm/edid/firmware: Remove built-in EDIDs
      drm/tests: helpers: Include missing drm_drv header
      drm/tests: helpers: Add atomic helpers
      drm/tests: Add helper to create mock plane
      drm/tests: Add helper to create mock crtc
      drm/tests: connector: Add tests for drmm_connector_init

Maíra Canal (1):
      drm/v3d: Enable V3D to use different PAGE_SIZE

Paloma Arellano (1):
      drm/dp: add an API to indicate if sink supports VSC SDP

Rodrigo Vivi (1):
      drm/i915: convert remaining intel_dp_vsc_sdp_pack

Shradha Gupta (2):
      drm: Check output polling initialized before disabling
      drm: Check polling initialized before enabling in drm_helper_probe_single_connector_modes

Thierry Reding (1):
      drm: Remove drm_num_crtcs() helper

Thomas Zimmermann (10):
      Merge drm/drm-next into drm-misc-next
      backlight/corgi-lcd: Include <linux/backlight.h>
      drm/nouveau: Include <linux/backlight.h>
      staging/fbtft: Include <linux/backlight.h>
      fbdev: Do not include <linux/backlight.h> in header
      fbdev: Do not include <linux/fs.h> in header
      fbdev: Do not include <linux/notifier.h> in header
      fbdev: Do not include <linux/slab.h> in header
      fbdev: Clean up forward declarations in header file
      fbdev: Clean up include statements in header file

Tomi Valkeinen (2):
      drm/tidss: Fix initial plane zpos values
      drm/tidss: Fix sync-lost issue with two displays

 Documentation/admin-guide/edid.rst               |  35 +--
 Documentation/admin-guide/kernel-parameters.txt  |  14 +-
 drivers/accel/qaic/mhi_controller.c              |   2 +-
 drivers/gpu/drm/display/drm_dp_helper.c          | 132 +++++++++++
 drivers/gpu/drm/drm_crtc.c                       |  15 +-
 drivers/gpu/drm/drm_edid_load.c                  | 162 ++------------
 drivers/gpu/drm/drm_modeset_helper.c             |  19 +-
 drivers/gpu/drm/drm_probe_helper.c               |  21 +-
 drivers/gpu/drm/i915/display/intel_dp.c          |  70 +-----
 drivers/gpu/drm/mgag200/Kconfig                  |  12 +
 drivers/gpu/drm/mgag200/mgag200_drv.c            |  17 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c           |   8 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                |   7 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c          |   1 +
 drivers/gpu/drm/panel/panel-edp.c                |   3 +
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c |   2 +
 drivers/gpu/drm/scheduler/sched_fence.c          |   4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c           | 133 +++++------
 drivers/gpu/drm/tegra/fb.c                       |   1 +
 drivers/gpu/drm/tests/drm_connector_test.c       | 170 +++++++++++++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c        | 150 +++++++++++++
 drivers/gpu/drm/tidss/tidss_crtc.c               |  10 +
 drivers/gpu/drm/tidss/tidss_plane.c              |   2 +-
 drivers/gpu/drm/v3d/v3d_bo.c                     |  12 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                |   2 +-
 drivers/gpu/drm/v3d/v3d_drv.h                    |   2 +
 drivers/gpu/drm/v3d/v3d_irq.c                    |   2 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                    |   2 -
 drivers/staging/fbtft/fb_ssd1351.c               |   2 +
 drivers/video/backlight/corgi_lcd.c              |   1 +
 include/drm/display/drm_dp_helper.h              |  10 +
 include/drm/drm_kunit_helpers.h                  |  23 ++
 include/linux/fb.h                               |  24 +-
 tools/edid/1024x768.S                            |  43 ----
 tools/edid/1280x1024.S                           |  43 ----
 tools/edid/1600x1200.S                           |  43 ----
 tools/edid/1680x1050.S                           |  43 ----
 tools/edid/1920x1080.S                           |  43 ----
 tools/edid/800x600.S                             |  40 ----
 tools/edid/Makefile                              |  37 ---
 tools/edid/edid.S                                | 274 -----------------------
 tools/edid/hex                                   |   1 -
 43 files changed, 700 insertions(+), 944 deletions(-)
 delete mode 100644 tools/edid/1024x768.S
 delete mode 100644 tools/edid/1280x1024.S
 delete mode 100644 tools/edid/1600x1200.S
 delete mode 100644 tools/edid/1680x1050.S
 delete mode 100644 tools/edid/1920x1080.S
 delete mode 100644 tools/edid/800x600.S
 delete mode 100644 tools/edid/Makefile
 delete mode 100644 tools/edid/edid.S
 delete mode 100644 tools/edid/hex

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
