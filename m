Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5CD95449D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAE310E5E2;
	Fri, 16 Aug 2024 08:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Vl7SJ0JL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OVZgvLuA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vl7SJ0JL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OVZgvLuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6C010E5DF;
 Fri, 16 Aug 2024 08:41:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 740DE2007A;
 Fri, 16 Aug 2024 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723797671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=1zCkZHKftmsbv/yjBf2ckjh0EBnaakuBMWqnfpX/YNU=;
 b=Vl7SJ0JL/r3S88RSu6k5FEGFf1p2sg/PnPPUchFgAvwik4BONLJV59PKWq/Lm9qOVZtIt1
 roAQAce2xhYLHmRS5FUwJU6BvjKaQr2mKtPX/AYRa7E7QGb3XRI/U+jMxktPTJuwwjZiPp
 Yzslt2LB0+e2zOfZygdPUtAjhPp14Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723797671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=1zCkZHKftmsbv/yjBf2ckjh0EBnaakuBMWqnfpX/YNU=;
 b=OVZgvLuAn50HX0dLuxv7E1qEbCwzKxGSIpphKZtOG/w2DxjkpXg3Sf2xfAFgX3ohBSeE2X
 uZwRnLyxhh1oSECQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723797671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=1zCkZHKftmsbv/yjBf2ckjh0EBnaakuBMWqnfpX/YNU=;
 b=Vl7SJ0JL/r3S88RSu6k5FEGFf1p2sg/PnPPUchFgAvwik4BONLJV59PKWq/Lm9qOVZtIt1
 roAQAce2xhYLHmRS5FUwJU6BvjKaQr2mKtPX/AYRa7E7QGb3XRI/U+jMxktPTJuwwjZiPp
 Yzslt2LB0+e2zOfZygdPUtAjhPp14Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723797671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=1zCkZHKftmsbv/yjBf2ckjh0EBnaakuBMWqnfpX/YNU=;
 b=OVZgvLuAn50HX0dLuxv7E1qEbCwzKxGSIpphKZtOG/w2DxjkpXg3Sf2xfAFgX3ohBSeE2X
 uZwRnLyxhh1oSECQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E42A1397F;
 Fri, 16 Aug 2024 08:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GSm9AacQv2beIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 08:41:11 +0000
Date: Fri, 16 Aug 2024 10:41:09 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <20240816084109.GA229316@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MISSING_XM_UA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

this is the weekly PR for drm-misc-next. Mostly small cleanups and
improvements. Rockchip received support for more modes and displays.

Best regards
Thomas

drm-misc-next-2024-08-16:
drm-misc-next for v6.12:

Core Changes:

ci:
- Update dependencies

docs:
- Cleanups

edid:
- Improve debug logging
- Clean up interface

fbdev emulation:
- Remove old fbdev hooks
- Update documentation

panic:
- Cleanups

Driver Changes:

amdgpu:
- Remove usage of old fbdev hooks
- Use backlight constants

ast:
- Fix timeout loop for DP link training

hisilicon:
- hibmc: Cleanups

mipi-dsi:
- Improve error handling
- startek-kd070fhfid015: Use new error handling

nouveau:
- Remove usage of old fbdev hooks

panel:
- Use backlight constants

radeon:
- Use backlight constants

rockchip:
- Improve DP sink-capability reporting
- Cleanups
- dw_hdmi: Support 4k@60Hz; Cleanups
- vop: Support RGB display on Rockchip RK3066; Support 4096px width

tilcdc:
- Use backlight constants
The following changes since commit 4e996697a443a214887ef81b008c344d183b5659:

  Merge tag 'drm-misc-next-2024-08-09' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-08-09 10:41:59 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-08-16

for you to fetch changes up to 8befe8fa5a4e4b30787b17e078d9d7b5cb92ea19:

  drm/tilcdc: Use backlight power constants (2024-08-16 09:28:01 +0200)

----------------------------------------------------------------
drm-misc-next for v6.12:

Core Changes:

ci:
- Update dependencies

docs:
- Cleanups

edid:
- Improve debug logging
- Clean up interface

fbdev emulation:
- Remove old fbdev hooks
- Update documentation

panic:
- Cleanups

Driver Changes:

amdgpu:
- Remove usage of old fbdev hooks
- Use backlight constants

ast:
- Fix timeout loop for DP link training

hisilicon:
- hibmc: Cleanups

mipi-dsi:
- Improve error handling
- startek-kd070fhfid015: Use new error handling

nouveau:
- Remove usage of old fbdev hooks

panel:
- Use backlight constants

radeon:
- Use backlight constants

rockchip:
- Improve DP sink-capability reporting
- Cleanups
- dw_hdmi: Support 4k@60Hz; Cleanups
- vop: Support RGB display on Rockchip RK3066; Support 4096px width

tilcdc:
- Use backlight constants

----------------------------------------------------------------
Alex Bee (1):
      drm/rockchip: vop: Allow 4096px width scaling

Andy Shevchenko (1):
      drm: fixed: Don't use "proxy" headers

Christophe JAILLET (1):
      drm/rockchip: Constify struct drm_encoder_helper_funcs

Cristian Ciocaltea (5):
      drm/rockchip: Explicitly include bits header
      drm/rockchip: dw_hdmi: Use modern drm_device based logging
      drm/rockchip: dw_hdmi: Simplify clock handling
      drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
      drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg, cur_ctr and phy_config

Dan Carpenter (1):
      drm/ast: astdp: fix loop timeout check

Daniel Yang (1):
      drm/connector: kerneldoc: Fix two missing newlines in drm_connector.c

Dragan Simic (1):
      drm/rockchip: cdn-dp: Clean up a few logged messages

Jani Nikula (4):
      drm/edid: reduce DisplayID log spamming
      drm/rockchip: cdn-dp: get rid of drm_edid_raw()
      drm/i915/gvt: stop using drm_edid_block_valid()
      drm/edid: make drm_edid_block_valid() static

Jocelyn Falempe (5):
      drm/panic: Remove space before "!" in panic message
      drm/panic: Remove useless export symbols
      drm/panic: Move drm_panic_register prototype to drm_crtc_internal.h
      drm/panic: Move copyright notice to the top
      drm/panic: Add panic description

Jonas Karlman (3):
      drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
      drm/rockchip: dw_hdmi: Allow High TMDS Bit Rates
      drm/rockchip: dw_hdmi: Add max_tmds_clock validation

Louis Chauvet (1):
      drm/vkms: Formatting and typo fix

Mohammed Anees (1):
      drm: Add missing documentation for struct drm_plane_size_hint

Tejas Vipin (2):
      drm/mipi-dsi: add more multi functions for better error handling
      drm/panel: startek-kd070fhfid015: transition to mipi_dsi wrapped functions

Thomas Zimmermann (18):
      Merge drm/drm-next into drm-misc-next
      drm: Do delayed switcheroo in drm_lastclose()
      drm/amdgpu: Do not set struct drm_driver.lastclose
      drm/nouveau: Do not set struct drm_driver.lastclose
      drm/nouveau: Do not set struct drm_mode_config_funcs.output_poll_changed
      drm/nouveau: Implement switcheroo reprobe with drm_client_dev_hotplug()
      drm/fbdev-helper: Update documentation on obsolete callbacks
      drm/fbdev-helper: Remove drm_fb_helper_output_poll_changed()
      drm: Remove struct drm_driver.lastclose
      drm: Remove struct drm_mode_config_funcs.output_poll_changed
      drm/amdgpu: Use backlight power constants
      drm/panel: panel-novatak-nt35510: Use backlight power constants
      drm/panel: panel-orisetech-otm8009a: Use backlight power constants
      drm/panel: panel-samsung-s6e63j0x03: Use backlight power constants
      drm/panel: panel-samsung-s6e3ha2: Use backlight power constants
      drm/panel: panel-sony-acx565akm: Use backlight power constants
      drm/radeon: Use backlight power constants
      drm/tilcdc: Use backlight power constants

Val Packett (2):
      drm/rockchip: vop: clear DMA stop bit on RK3066
      drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066

Vignesh Raman (1):
      drm/ci: uprev mesa

WangYuli (1):
      drm/ci: Upgrade setuptools requirement to 70.0.0

Zhang Zekun (1):
      drm/hisilicon: Remove unused delarations

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  17 --
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   2 +-
 drivers/gpu/drm/ast/ast_dp.c                       |  15 +-
 drivers/gpu/drm/ci/container.yml                   |   8 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |  22 +--
 drivers/gpu/drm/ci/image-tags.yml                  |   8 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |   1 +
 drivers/gpu/drm/ci/test.yml                        |   4 +-
 drivers/gpu/drm/ci/xfails/requirements.txt         |   2 +-
 drivers/gpu/drm/drm_connector.c                    |   4 +
 drivers/gpu/drm/drm_crtc_internal.h                |   4 +
 drivers/gpu/drm/drm_displayid.c                    |   3 -
 drivers/gpu/drm/drm_edid.c                         |  22 +--
 drivers/gpu/drm/drm_fb_helper.c                    |  37 +---
 drivers/gpu/drm/drm_file.c                         |  32 ++--
 drivers/gpu/drm/drm_internal.h                     |   1 -
 drivers/gpu/drm/drm_mipi_dsi.c                     | 194 +++++++++++++++++++++
 drivers/gpu/drm/drm_panic.c                        |  62 +++++--
 drivers/gpu/drm/drm_probe_helper.c                 |  10 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |  18 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   1 -
 drivers/gpu/drm/nouveau/nouveau_display.c          |   1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c              |  10 +-
 drivers/gpu/drm/nouveau/nouveau_vga.h              |   1 -
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   2 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  10 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   2 +-
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 115 ++++--------
 drivers/gpu/drm/radeon/atombios_encoders.c         |   2 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   2 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  32 ++--
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 107 +++++-------
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   2 +
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |   2 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   6 +-
 drivers/gpu/vga/vga_switcheroo.c                   |   3 +-
 include/drm/drm_drv.h                              |  28 ---
 include/drm/drm_edid.h                             |   2 -
 include/drm/drm_fb_helper.h                        |   6 -
 include/drm/drm_fixed.h                            |   3 +-
 include/drm/drm_mipi_dsi.h                         |  10 ++
 include/drm/drm_mode_config.h                      |  16 --
 include/drm/drm_panic.h                            |  21 +--
 include/uapi/drm/drm_mode.h                        |   2 +
 55 files changed, 471 insertions(+), 416 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
