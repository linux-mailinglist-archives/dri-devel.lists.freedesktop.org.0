Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349C983DB5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DFD10E4E6;
	Tue, 24 Sep 2024 07:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="daGr9Cue";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HStoHsvz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="daGr9Cue";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HStoHsvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCBB10E138;
 Tue, 24 Sep 2024 07:17:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0085921B96;
 Tue, 24 Sep 2024 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sleF6+959X5RTlD9l7+KTN6LaNlTaLCcnHzHgSDTFbA=;
 b=daGr9CueSEXqRZuJiPzmETK0gwnT0TdQ+QEO02ZPFWuO96BreU54Vy81uq++8V0Z/xamiP
 HUl2z8vkdXhkkNtCGUK43Se7Y95nVmEF2mnt3cxQzUtWv6oRIn6ELAT7IaQ2Mp4KMSTGc+
 sQQtD2jLeCK2M3I2zxFji7FUROtDV2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sleF6+959X5RTlD9l7+KTN6LaNlTaLCcnHzHgSDTFbA=;
 b=HStoHsvzqWmaRJWqDXbMM8/tUAU/mFVmmWAgA2X/9OY+Ii3PGU24ik8+RjcM1zjNb5I739
 8FhqioOGtyJ7s7BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=daGr9Cue;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HStoHsvz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sleF6+959X5RTlD9l7+KTN6LaNlTaLCcnHzHgSDTFbA=;
 b=daGr9CueSEXqRZuJiPzmETK0gwnT0TdQ+QEO02ZPFWuO96BreU54Vy81uq++8V0Z/xamiP
 HUl2z8vkdXhkkNtCGUK43Se7Y95nVmEF2mnt3cxQzUtWv6oRIn6ELAT7IaQ2Mp4KMSTGc+
 sQQtD2jLeCK2M3I2zxFji7FUROtDV2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sleF6+959X5RTlD9l7+KTN6LaNlTaLCcnHzHgSDTFbA=;
 b=HStoHsvzqWmaRJWqDXbMM8/tUAU/mFVmmWAgA2X/9OY+Ii3PGU24ik8+RjcM1zjNb5I739
 8FhqioOGtyJ7s7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7D1C1386E;
 Tue, 24 Sep 2024 07:17:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id y76hK5Jn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 00/80] drm: Provide client setup helper and convert drivers
Date: Tue, 24 Sep 2024 09:11:58 +0200
Message-ID: <20240924071734.98201-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0085921B96
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.51
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

Provide drm_client_setup() to initialize in-kernel DRM clients. Then
convert all drivers to the new interface. Remove old interfaces for
the fbdev client.

So far, the only supported DRM client in the kernel is for fbdev
emulation with its fbcon support. Long term, we want to move away
from fbcon. Possible replacements are DRM-based loggers, boot-up
logos or maybe even a console. The exact kind of client should be
configurable by the user. You can find examples of such clients at
[1] and [2].

To do this, we need one single interface for drivers to initialize
the configured in-kernel clients, replacing the current call to
initialize fbdev emulation. The fbdev emulation also depends on the
DRM driver's management, so drivers differ in what fbdev code they
run. We need to abstract this as well.

This patchset addresses these topics. While there are many patches,
most of them are small, straight-forward changes to drivers or
rearrange existing code.

Patches 1 to 3 add a driver-neutral setup function for the fbdev
client. The new callback fbdev_probe in struct drm_driver creates
the GEM buffer for fbdev output. It replaces the existing callback
fb_probe from struct drm_fb_helper_funcs, which currently does the
same. The client code is equal to code in exisisting fbdev emulation,
except for its use of fbdev_probe.

Patch 4 adds drm_client_setup(), a client-agnostic interface to
initialize the in-kernel DRM clients. It only supports the new fbdev
emulation setup, but additional clients will be added here. Hopefully
this will hide future changes to DRM client initialization from
drivers. DRM drivers with support for DRM's default clients now have
to select DRM_CLIENT_SELECTION. This Kconfig option will later control
the details of selecting client code and modules.

Patches 5 to 48 rework all drivers with GEM memory management based
on DMA helpers. This is fairly straigh-forward. The fbdev-dma helpers
provide an implementation of the fbdev_probe helpers. Each driver
sets the new callback in its instance of struct drm_driver and calls
drm_client_setup(). Then the old fbdev-dma client goes away.

Patches 49 to 62 do the same for drivers with SHMEM-based GEM memory
management. The fbdev client code is again the same as before, except
for the fbdev_probe callback.

Patches 63 to 72 do the same for drivers with TTM-based GEM memory
management.

Patches 73 to 80 do the same for most of the remaining drivers with
custom fbdev emulation. As before, the new fbdev client code is mostly
the same the old one; except for the fbdev_probe function.

Changes for i915 and xe are a bit more involved, so they are left out
for now and will be send in a separate series.

This patchset has been tested on various hardware with the various
memory managers involved.

v5:
- add DRM_CLIENT_SELECTION and DRM_CLIENT_SETUP to Kconfig and update
  drivers accordingly
v4:
- drop unneeded changes to panel/ili9341
- fix docs
v3:
- add missing macros for driver ops (Sam)
- split off i915/xe changes
v2:
- add drm_client_setup_with_fourcc()
- xe: set fbdev_probe in xe_display_driver_set_hooks()
- do cleanups

[1] https://lore.kernel.org/dri-devel/20240801100640.462606-4-jfalempe@redhat.com/
[2] https://lists.freedesktop.org/archives/dri-devel/2019-March/212113.html

Thomas Zimmermann (80):
  drm/fbdev-helper: Move color-mode lookup into 4CC format helper
  drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
  drm/fbdev: Add memory-agnostic fbdev client
  drm: Add client-agnostic setup helper
  drm/fbdev-dma: Support struct drm_driver.fbdev_probe
  drm/arcgpu: Run DRM default client setup
  drm/arm/komeda: Run DRM default client setup
  drm/arm/hdlcd: Run DRM default client setup
  drm/arm/malidp: Run DRM default client setup
  drm/aspeed: Run DRM default client setup
  drm/atmel-hdlcd: Run DRM default client setup
  drm/fsl-dcu: Run DRM default client setup
  drm/hisilicon/kirin: Run DRM default client setup
  drm/hx8357d: Run DRM default client setup
  drm/ili9163: Run DRM default client setup
  drm/ili9225: Run DRM default client setup
  drm/ili9341: Run DRM default client setup
  drm/ili9486: Run DRM default client setup
  drm/imx/dcss: Run DRM default client setup
  drm/imx/ipuv3: Run DRM default client setup
  drm/imx/lcdc: Run DRM default client setup
  drm/ingenic: Run DRM default client setup
  drm/kmb: Run DRM default client setup
  drm/logicvc: Run DRM default client setup
  drm/mcde: Run DRM default client setup
  drm/mediatek: Run DRM default client setup
  drm/meson: Run DRM default client setup
  drm/mi0283qt: Run DRM default client setup
  drm/mxsfb/lcdif: Run DRM default client setup
  drm/mxsfb: Run DRM default client setup
  drm/panel-mipi-dbi: Run DRM default client setup
  drm/pl111: Run DRM default client setup
  drm/renesas/rcar-du: Run DRM default client setup
  drm/renesas/rz-du: Run DRM default client setup
  drm/renesas/shmobile: Run DRM default client setup
  drm/repaper: Run DRM default client setup
  drm/rockchip: Run DRM default client setup
  drm/sti: Run DRM default client setup
  drm/stm: Run DRM default client setup
  drm/sun4i: Run DRM default client setup
  drm/tidss: Run DRM default client setup
  drm/tilcdc: Run DRM default client setup
  drm/st7586: Run DRM default client setup
  drm/st7735r: Run DRM default client setup
  drm/tve200: Run DRM default client setup
  drm/vc4: Run DRM default client setup
  drm/xlnx: Run DRM default client setup
  drm/fbdev-dma: Remove obsolete setup function
  drm/fbdev-shmem: Support struct drm_driver.fbdev_probe
  drm/ast: Run DRM default client setup
  drm/bochs: Run DRM default client setup
  drm/cirrus: Run DRM default client setup
  drm/gm12u320: Run DRM default client setup
  drm/gud: Run DRM default client setup
  drm/hyperv_drm: Run DRM default client setup
  drm/mgag200: Run DRM default client setup
  drm/ofdrm: Use DRM default client setup
  drm/simpledrm: Run DRM default client setup
  drm/solomon: Run DRM default client setup
  drm/udl: Run DRM default client setup
  drm/virtgpu: Run DRM default client setup
  drm/vkms: Run DRM default client setup
  drm/fbdev-shmem: Remove obsolete setup function
  drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
  drm/amdgpu: Run DRM default client setup
  drm/hisilicon/hibmc: Run DRM default client setup
  drm/loongson: Run DRM default client setup
  drm/nouveau: Run DRM default client setup
  drm/qxl: Run DRM default client setup
  drm/vboxvideo: Run DRM default client setup
  drm/vmwgfx: Run DRM default client setup
  drm/fbdev-ttm: Remove obsolete setup function
  drm/armada: Run DRM default client setup
  drm/exynos-drm: Run DRM default client setup
  drm/gma500: Run DRM default client setup
  drm/msm: Run DRM default client setup
  drm/radeon: Run DRM default client setup
  drm/tegra: Run DRM default client setup
  drm/omapdrm: Remove struct drm_fb_helper from struct omap_fbdev.
  drm/omapdrm: Run DRM default client setup

 drivers/gpu/drm/Kconfig                       |  13 +
 drivers/gpu/drm/Makefile                      |   6 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  11 +-
 drivers/gpu/drm/arm/Kconfig                   |   2 +
 drivers/gpu/drm/arm/display/Kconfig           |   1 +
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |   4 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |   2 +
 drivers/gpu/drm/arm/hdlcd_drv.c               |   4 +-
 drivers/gpu/drm/arm/malidp_drv.c              |   4 +-
 drivers/gpu/drm/armada/Kconfig                |   1 +
 drivers/gpu/drm/armada/armada_drm.h           |  11 +-
 drivers/gpu/drm/armada/armada_drv.c           |   4 +-
 drivers/gpu/drm/armada/armada_fbdev.c         | 113 +--------
 drivers/gpu/drm/aspeed/Kconfig                |   1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |   4 +-
 drivers/gpu/drm/ast/Kconfig                   |   1 +
 drivers/gpu/drm/ast/ast_drv.c                 |   6 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig           |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   5 +-
 drivers/gpu/drm/drm_client_setup.c            |  66 +++++
 drivers/gpu/drm/drm_fb_helper.c               | 102 +++-----
 drivers/gpu/drm/drm_fbdev_client.c            | 141 +++++++++++
 drivers/gpu/drm/drm_fbdev_dma.c               | 170 +++----------
 drivers/gpu/drm/drm_fbdev_shmem.c             | 170 +++----------
 drivers/gpu/drm/drm_fbdev_ttm.c               | 225 +++++-------------
 drivers/gpu/drm/drm_fourcc.c                  |  30 ++-
 drivers/gpu/drm/exynos/Kconfig                |   1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  99 +-------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h     |  15 +-
 drivers/gpu/drm/fsl-dcu/Kconfig               |   1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |   4 +-
 drivers/gpu/drm/gma500/Kconfig                |   1 +
 drivers/gpu/drm/gma500/fbdev.c                | 100 +-------
 drivers/gpu/drm/gma500/psb_drv.c              |   4 +-
 drivers/gpu/drm/gma500/psb_drv.h              |  12 +-
 drivers/gpu/drm/gud/Kconfig                   |   1 +
 drivers/gpu/drm/gud/gud_drv.c                 |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig       |   1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   4 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig       |   1 +
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |   2 +
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |   4 +-
 drivers/gpu/drm/imx/dcss/Kconfig              |   1 +
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |   4 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig             |   1 +
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |   4 +-
 drivers/gpu/drm/imx/lcdc/Kconfig              |   1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |   4 +-
 drivers/gpu/drm/ingenic/Kconfig               |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   4 +-
 drivers/gpu/drm/kmb/Kconfig                   |   1 +
 drivers/gpu/drm/kmb/kmb_drv.c                 |   4 +-
 drivers/gpu/drm/logicvc/Kconfig               |   1 +
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  16 +-
 drivers/gpu/drm/loongson/Kconfig              |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.c           |   4 +-
 drivers/gpu/drm/mcde/Kconfig                  |   1 +
 drivers/gpu/drm/mcde/mcde_drv.c               |   4 +-
 drivers/gpu/drm/mediatek/Kconfig              |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   4 +-
 drivers/gpu/drm/meson/Kconfig                 |   1 +
 drivers/gpu/drm/meson/meson_drv.c             |   4 +-
 drivers/gpu/drm/mgag200/Kconfig               |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   5 +-
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  13 +-
 drivers/gpu/drm/msm/msm_fbdev.c               | 144 ++---------
 drivers/gpu/drm/mxsfb/Kconfig                 |   2 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |   4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |   4 +-
 drivers/gpu/drm/nouveau/Kconfig               |   1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  10 +-
 drivers/gpu/drm/omapdrm/Kconfig               |   1 +
 drivers/gpu/drm/omapdrm/omap_drv.c            |   1 +
 drivers/gpu/drm/omapdrm/omap_drv.h            |   3 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c          | 161 ++++---------
 drivers/gpu/drm/omapdrm/omap_fbdev.h          |   8 +
 drivers/gpu/drm/pl111/Kconfig                 |   1 +
 drivers/gpu/drm/pl111/pl111_drv.c             |   4 +-
 drivers/gpu/drm/qxl/Kconfig                   |   1 +
 drivers/gpu/drm/qxl/qxl_drv.c                 |   4 +-
 drivers/gpu/drm/radeon/Kconfig                |   1 +
 drivers/gpu/drm/radeon/radeon_drv.c           |  14 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         | 114 +--------
 drivers/gpu/drm/radeon/radeon_mode.h          |  12 +-
 drivers/gpu/drm/renesas/rcar-du/Kconfig       |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |   4 +-
 drivers/gpu/drm/renesas/rz-du/Kconfig         |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |   4 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig      |   1 +
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |   5 +-
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   4 +-
 drivers/gpu/drm/solomon/Kconfig               |   1 +
 drivers/gpu/drm/solomon/ssd130x.c             |   4 +-
 drivers/gpu/drm/sti/Kconfig                   |   1 +
 drivers/gpu/drm/sti/sti_drv.c                 |   4 +-
 drivers/gpu/drm/stm/Kconfig                   |   1 +
 drivers/gpu/drm/stm/drv.c                     |   5 +-
 drivers/gpu/drm/sun4i/Kconfig                 |   1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   4 +-
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/drm.c                   |   5 +-
 drivers/gpu/drm/tegra/drm.h                   |  12 +-
 drivers/gpu/drm/tegra/fbdev.c                 |  98 +-------
 drivers/gpu/drm/tidss/Kconfig                 |   1 +
 drivers/gpu/drm/tidss/tidss_drv.c             |   4 +-
 drivers/gpu/drm/tilcdc/Kconfig                |   1 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   5 +-
 drivers/gpu/drm/tiny/Kconfig                  |  16 ++
 drivers/gpu/drm/tiny/arcpgu.c                 |   4 +-
 drivers/gpu/drm/tiny/bochs.c                  |   5 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   4 +-
 drivers/gpu/drm/tiny/gm12u320.c               |   4 +-
 drivers/gpu/drm/tiny/hx8357d.c                |   4 +-
 drivers/gpu/drm/tiny/ili9163.c                |   4 +-
 drivers/gpu/drm/tiny/ili9225.c                |   4 +-
 drivers/gpu/drm/tiny/ili9341.c                |   4 +-
 drivers/gpu/drm/tiny/ili9486.c                |   4 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   4 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   9 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   4 +-
 drivers/gpu/drm/tiny/repaper.c                |   4 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   9 +-
 drivers/gpu/drm/tiny/st7586.c                 |   4 +-
 drivers/gpu/drm/tiny/st7735r.c                |   4 +-
 drivers/gpu/drm/tve200/Kconfig                |   1 +
 drivers/gpu/drm/tve200/tve200_drv.c           |   9 +-
 drivers/gpu/drm/udl/Kconfig                   |   1 +
 drivers/gpu/drm/udl/udl_drv.c                 |   4 +-
 drivers/gpu/drm/vboxvideo/Kconfig             |   1 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   4 +-
 drivers/gpu/drm/vc4/Kconfig                   |   1 +
 drivers/gpu/drm/vc4/vc4_drv.c                 |   5 +-
 drivers/gpu/drm/virtio/Kconfig                |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   6 +-
 drivers/gpu/drm/vkms/Kconfig                  |   1 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   4 +-
 drivers/gpu/drm/vmwgfx/Kconfig                |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   5 +-
 drivers/gpu/drm/xlnx/Kconfig                  |   1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |   4 +-
 include/drm/drm_client_setup.h                |  26 ++
 include/drm/drm_drv.h                         |  18 ++
 include/drm/drm_fbdev_client.h                |  19 ++
 include/drm/drm_fbdev_dma.h                   |  13 +-
 include/drm/drm_fbdev_shmem.h                 |  13 +-
 include/drm/drm_fbdev_ttm.h                   |  15 +-
 include/drm/drm_fourcc.h                      |   1 +
 153 files changed, 983 insertions(+), 1370 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_setup.c
 create mode 100644 drivers/gpu/drm/drm_fbdev_client.c
 create mode 100644 include/drm/drm_client_setup.h
 create mode 100644 include/drm/drm_fbdev_client.h


base-commit: 3abb1f2faac15a9f09824d692d1a38e0c485dc6b
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.46.0

