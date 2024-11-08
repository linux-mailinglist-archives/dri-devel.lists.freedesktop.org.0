Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126489C20E5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D51410E9F6;
	Fri,  8 Nov 2024 15:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gDOtKmoA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EdGLpDh+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d6z9Kcv1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fpMwbm+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF9D10E9F4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 15:46:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78BED21BB8;
 Fri,  8 Nov 2024 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=292WX6PlfZIUWYUT1RP/sSFivvB7WcW/MgBZHTdUkak=;
 b=gDOtKmoASf7KxgjZSyWAYTko0HICuI0T23fiSteOAOpfiveGljrcNYDD3wyBhe3aQqnVsj
 OAMyW6ou03gJ22ng3auOptPjMnX+dyE/J0jbbT9Uz7RlU3tVlrwYFVWFvXT8DfBsvcCP4D
 JsHtc69DmmuLa3mBNuCwtXkREHLYQMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=292WX6PlfZIUWYUT1RP/sSFivvB7WcW/MgBZHTdUkak=;
 b=EdGLpDh+4e2hGcdIRKXab2vtXo+WRsw9C7qenfxfoaQTdWdLWZEZ0hn5/tiGjCILA29It4
 VgJFDoJvGiCD3RBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d6z9Kcv1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fpMwbm+U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=292WX6PlfZIUWYUT1RP/sSFivvB7WcW/MgBZHTdUkak=;
 b=d6z9Kcv1Jp7nrIm2aJ/8/Pslz2R3pYjENZf4m7Dk8w1OyYWDyAjatGn9nFmHEFnQxUpE3U
 hE+fWzAUc7sNTWdCq/7uLdFJEa0iSFcujpo0PheTf4K75h9cnGBDfMl8d24nilFeus5ZDc
 v6dYY6G32t5MLLFhJB3tCGKhXXTziO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=292WX6PlfZIUWYUT1RP/sSFivvB7WcW/MgBZHTdUkak=;
 b=fpMwbm+UHCeFGJBJWZGqRTNMzeobauNPJQqjGBoBJifeATN+6FBRWBMPInqjbVnJKlWu3W
 HA4/nPdNlmD/+xAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36D5713967;
 Fri,  8 Nov 2024 15:46:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E2MDDD0yLmcAHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Nov 2024 15:46:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm: Move client code into subdirectories
Date: Fri,  8 Nov 2024 16:42:36 +0100
Message-ID: <20241108154600.126162-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 78BED21BB8
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

The drm_log client will likely be merged into DRM soon. Time to clean
up some of the existing files. This series moves the existing DRM
client for fbdev emulation and its build infrastructure into clients/
subdirectories. Drm_log can then be located there as well.

The core and helper support for in-kernel DRM clients remains in
its current location.

No functional changes.

Thomas Zimmermann (3):
  drm: Move client code to clients/ subdirectory
  drm/client: Move public client header to clients/ subdirectory
  drm/fbdev-client: Unexport drm_fbdev_client_setup()

 drivers/gpu/drm/Kconfig                       | 72 +-----------------
 drivers/gpu/drm/Makefile                      |  9 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/armada/armada_drv.c           |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/clients/Kconfig               | 73 +++++++++++++++++++
 drivers/gpu/drm/clients/Makefile              |  5 ++
 .../gpu/drm/clients/drm_client_internal.h     |  4 +-
 .../gpu/drm/{ => clients}/drm_client_setup.c  |  5 +-
 .../gpu/drm/{ => clients}/drm_fbdev_client.c  |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
 drivers/gpu/drm/gud/gud_drv.c                 |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  2 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  2 +-
 drivers/gpu/drm/loongson/lsdc_drv.c           |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
 drivers/gpu/drm/solomon/ssd130x.c             |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  3 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/gm12u320.c               |  2 +-
 drivers/gpu/drm/tiny/hx8357d.c                |  2 +-
 drivers/gpu/drm/tiny/ili9163.c                |  2 +-
 drivers/gpu/drm/tiny/ili9225.c                |  2 +-
 drivers/gpu/drm/tiny/ili9341.c                |  2 +-
 drivers/gpu/drm/tiny/ili9486.c                |  2 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |  2 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |  2 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |  2 +-
 drivers/gpu/drm/tiny/repaper.c                |  2 +-
 drivers/gpu/drm/tiny/sharp-memory.c           |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/gpu/drm/tiny/st7586.c                 |  2 +-
 drivers/gpu/drm/tiny/st7735r.c                |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/udl/udl_drv.c                 |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  2 +-
 include/drm/{ => clients}/drm_client_setup.h  |  0
 78 files changed, 158 insertions(+), 155 deletions(-)
 create mode 100644 drivers/gpu/drm/clients/Kconfig
 create mode 100644 drivers/gpu/drm/clients/Makefile
 rename include/drm/drm_fbdev_client.h => drivers/gpu/drm/clients/drm_client_internal.h (85%)
 rename drivers/gpu/drm/{ => clients}/drm_client_setup.c (96%)
 rename drivers/gpu/drm/{ => clients}/drm_fbdev_client.c (98%)
 rename include/drm/{ => clients}/drm_client_setup.h (100%)

-- 
2.47.0

