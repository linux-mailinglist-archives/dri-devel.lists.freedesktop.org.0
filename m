Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D51B52CDD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A803410EA58;
	Thu, 11 Sep 2025 09:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SIQP+lxi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dnRB8UHN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SIQP+lxi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dnRB8UHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94E910E070
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:17:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5ED8C60317;
 Thu, 11 Sep 2025 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757582259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hnS/7oxxjsOKOj/tXQW7Itm6Cx2fMvkmDt7Kn2kIylM=;
 b=SIQP+lxiML3iIKHDXn93T0/i1QIePPs2OSzBLVoJOsxRhfP3m34/q5EsE6jrugqD3c5vbU
 lcX2NdybouJQ+tUxkvpXe5I+F0AuDIGSlOTtWRAnb2rIPslEo0lLz3u8hiNGDdMXYSJftj
 0lCWGsaaLnLaZ0rEBS0/ZRNW7qw+DAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757582259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hnS/7oxxjsOKOj/tXQW7Itm6Cx2fMvkmDt7Kn2kIylM=;
 b=dnRB8UHN9GcRmaCT2HfSMnaaRQxt5KDH5yNr2e8jK6GhKPMSLOTDcurZqvJjUxub9LkO/T
 Qh9S74zTOfJp7nCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757582259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hnS/7oxxjsOKOj/tXQW7Itm6Cx2fMvkmDt7Kn2kIylM=;
 b=SIQP+lxiML3iIKHDXn93T0/i1QIePPs2OSzBLVoJOsxRhfP3m34/q5EsE6jrugqD3c5vbU
 lcX2NdybouJQ+tUxkvpXe5I+F0AuDIGSlOTtWRAnb2rIPslEo0lLz3u8hiNGDdMXYSJftj
 0lCWGsaaLnLaZ0rEBS0/ZRNW7qw+DAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757582259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hnS/7oxxjsOKOj/tXQW7Itm6Cx2fMvkmDt7Kn2kIylM=;
 b=dnRB8UHN9GcRmaCT2HfSMnaaRQxt5KDH5yNr2e8jK6GhKPMSLOTDcurZqvJjUxub9LkO/T
 Qh9S74zTOfJp7nCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E580D13301;
 Thu, 11 Sep 2025 09:17:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DoXeNrKTwmgNAgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Sep 2025 09:17:38 +0000
Date: Thu, 11 Sep 2025 11:17:37 +0200
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
Message-ID: <20250911091737.GA39831@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

here's the final PR for drm-misc-next that goes into v6.18. It adds
support for the 'boot_display' sysfs attribute. Exported buffers from
TTM should now be accounted correctly. There's a new driver for the
Mayqueen e-Ink paper. Vkms got support for a lot of additional color
formats. And there's of course the usual number of fixes and cleanups
everywhere.

Best regards
Thomas

drm-misc-next-2025-09-11:
drm-misc-next for v6.18:

UAPI Changes:

- Provide 'boot_display' attribute on boot-up devices

amdxdma:
- Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY

Cross-subsystem Changes:

bindings:
- Add Mayqueen vendor prefix mayqueen-

pci:
- vgaarb: Use screen_info helpers

Core Changes:

ttm:
- Add interface to populate buffers

Driver Changes:

amdgpu:
- Pre-populate exported buffers

ast:
- Clean up detection of DRAM config

bochs:
- Clean up

bridge:
- adv7511: Write full Audio infoframe
- ite6263: Support vendor-specific infoframes
- simple: Add support for Realtek RTD2171 DP-to-HDMI plus DT bindings
- Clean up

gma500:
- Clean up

nouveau:
- Pre-populate exported buffers

panel:
- edp: Add support for additonal mt8189 Chromebook panels
- lvds: Add DT bindings for EDT ETML0700Z8DHA
- Clean up

pixpaper:
- Add support for Mayqueen Pixpaper plus DT bindings

rcar-du:
- Use RUNTIME_PM_OPS
- Add support for DSI commands

vkms:
- Support variants of ARGB8888, ARGB16161616, RGB565, RGB888 and P01x
- Spport YUV with 16-bit components

xe:
- Pre-populate exported buffers
The following changes since commit 2a1eea8fd601db4c52f0d14f8871663b7b052c91:

  drm/sysfb: Remove double assignment to pointer crtc_state (2025-09-04 09:26:39 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-09-11

for you to fetch changes up to 91494dee1091a14d91da6bcb39e12a907765c793:

  xe: populate buffers before exporting them. (2025-09-11 10:04:58 +1000)

----------------------------------------------------------------
drm-misc-next for v6.18:

UAPI Changes:

- Provide 'boot_display' attribute on boot-up devices

amdxdma:
- Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY

Cross-subsystem Changes:

bindings:
- Add Mayqueen vendor prefix mayqueen-

pci:
- vgaarb: Use screen_info helpers

Core Changes:

ttm:
- Add interface to populate buffers

Driver Changes:

amdgpu:
- Pre-populate exported buffers

ast:
- Clean up detection of DRAM config

bochs:
- Clean up

bridge:
- adv7511: Write full Audio infoframe
- ite6263: Support vendor-specific infoframes
- simple: Add support for Realtek RTD2171 DP-to-HDMI plus DT bindings
- Clean up

gma500:
- Clean up

nouveau:
- Pre-populate exported buffers

panel:
- edp: Add support for additonal mt8189 Chromebook panels
- lvds: Add DT bindings for EDT ETML0700Z8DHA
- Clean up

pixpaper:
- Add support for Mayqueen Pixpaper plus DT bindings

rcar-du:
- Use RUNTIME_PM_OPS
- Add support for DSI commands

vkms:
- Support variants of ARGB8888, ARGB16161616, RGB565, RGB888 and P01x
- Spport YUV with 16-bit components

xe:
- Pre-populate exported buffers

----------------------------------------------------------------
Chen Ni (1):
      drm/ast: ast_2100: Remove unneeded semicolon

Dave Airlie (4):
      ttm/bo: add an API to populate a bo before exporting.
      amdgpu: populate buffers before exporting them.
      nouveau: populate buffers before exporting them.
      xe: populate buffers before exporting them.

Dmitry Baryshkov (2):
      drm/bridge: adv7511: use update latch for AVI infoframes
      drm/bridge: write full Audio InfoFrame

Geert Uytterhoeven (1):
      drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()

Jacek Lawrynowicz (1):
      MAINTAINERS: Remove Jacek Lawrynowicz as intel_vpu maintainer

José Expósito (1):
      drm/vkms: Assert if vkms_config_create_*() fails

Leander Kieweg (1):
      drm/tiny/bochs: Convert dev_err() to drm_err()

LiangCheng Wang (2):
      dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
      drm: tiny: Add support for Mayqueen Pixpaper e-ink panel

Liao Yuanhong (1):
      drm/sti: Remove redundant ternary operators

Liu Ying (2):
      drm/panel: lvds: Remove unused members from main structure
      drm/bridge: ite-it6263: Support HDMI vendor specific infoframe

Lizhi Hou (1):
      accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY

Louis Chauvet (8):
      drm/vkms: Create helpers macro to avoid code duplication in format callbacks
      drm/vkms: Add support for ARGB8888 formats
      drm/vkms: Add support for ARGB16161616 formats
      drm/vkms: Add support for RGB565 formats
      drm/vkms: Add support for RGB888 formats
      drm/vkms: Change YUV helpers to support u16 inputs for conversion
      drm/vkms: Create helper macro for YUV formats
      drm/vkms: Add P01* formats

Luca Ceresoli (1):
      drm/display: bridge-connector: remove unused variable assignment

Marek Vasut (1):
      drm/rcar-du: dsi: Implement DSI command support

Mario Limonciello (AMD) (4):
      Fix access to video_is_primary_device() when compiled without CONFIG_VIDEO
      PCI/VGA: Replace vga_is_firmware_default() with a screen info check
      fbcon: Use screen info to find primary device
      DRM: Add a new 'boot_display' attribute

Min Ma (1):
      MAINTAINERS: Update Min Ma's email for AMD XDNA driver

Nathan Chancellor (1):
      drm/bridge: cdns-dsi: Select VIDEOMODE_HELPERS

Neil Armstrong (2):
      dt-bindings: display: bridge: simple: document the Realtek RTD2171 DP-to-HDMI bridge
      drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI bridge

Raphael Gallais-Pou (1):
      dt-bindings: panel: lvds: Append edt,etml0700z8dha in panel-lvds

Thomas Zimmermann (7):
      drm/ast: Do not print DRAM info
      drm/ast: Remove unused dram_bus_width field
      drm/ast: Remove unused mclk field
      drm/ast: Remove unused SCU-MPLL and SCU-STRAP values
      drm/ast: Move DRAM info next to its only user
      drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
      drm/gma500: Do not clear framebuffer GEM objects during cleanup

Wig Cheng (1):
      dt-bindings: vendor-prefixes: Add Mayqueen name

Zhongtian Wu (1):
      drm/panel-edp: Add 4 more panels needed by mt8189 Chromebooks

 Documentation/ABI/testing/sysfs-class-drm          |    8 +
 .../bindings/display/bridge/simple-bridge.yaml     |    1 +
 .../bindings/display/mayqueen,pixpaper.yaml        |   63 ++
 .../bindings/display/panel/panel-lvds.yaml         |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |   10 +-
 arch/parisc/include/asm/video.h                    |    2 +-
 arch/sparc/include/asm/video.h                     |    2 +
 arch/x86/include/asm/video.h                       |    2 +
 arch/x86/video/video-common.c                      |   25 +-
 drivers/accel/amdxdna/aie2_pci.c                   |  112 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   27 +
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   12 +
 drivers/gpu/drm/ast/ast_2100.c                     |   46 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   20 +-
 drivers/gpu/drm/ast/ast_main.c                     |  126 ---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   23 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   33 +-
 drivers/gpu/drm/bridge/cadence/Kconfig             |    1 +
 drivers/gpu/drm/bridge/ite-it6263.c                |   64 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |    5 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |    2 -
 drivers/gpu/drm/drm_sysfs.c                        |   41 +
 drivers/gpu/drm/gma500/fbdev.c                     |    2 -
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   12 +
 drivers/gpu/drm/panel/panel-edp.c                  |   11 +
 drivers/gpu/drm/panel/panel-lvds.c                 |    2 -
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  225 ++++
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |  125 +++
 drivers/gpu/drm/sti/sti_hqvdp.c                    |    2 +-
 drivers/gpu/drm/tiny/Kconfig                       |   15 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/bochs.c                       |    2 +-
 drivers/gpu/drm/tiny/pixpaper.c                    | 1165 ++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo.c                       |   15 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c      |   51 +-
 drivers/gpu/drm/vkms/tests/vkms_format_test.c      |  143 ++-
 drivers/gpu/drm/vkms/vkms_formats.c                |  327 +++---
 drivers/gpu/drm/vkms/vkms_formats.h                |    4 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   13 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   12 +
 drivers/pci/vgaarb.c                               |   31 +-
 include/drm/ttm/ttm_bo.h                           |    2 +
 include/uapi/drm/amdxdna_accel.h                   |  111 ++
 46 files changed, 2419 insertions(+), 486 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-drm
 create mode 100644 Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
 create mode 100644 drivers/gpu/drm/tiny/pixpaper.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
