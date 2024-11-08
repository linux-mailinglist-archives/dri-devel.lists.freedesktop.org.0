Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360E9C20E6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A5F10E9F7;
	Fri,  8 Nov 2024 15:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oKdMn+sW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pSkR/3np";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f+LOlGGt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WC+xR4ZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F0910E9EB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 15:46:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FF6321BB9;
 Fri,  8 Nov 2024 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1h/IGu3sY/0N14TPIzap4XnMz5FTFAxz5Wqyfvuauk=;
 b=oKdMn+sWR2LdkvhpEG2t7AzEb9TTCwFzCJFgkhBFsKx+O6x4ebrmeKLZJ1ma1+lsDTwfmI
 gezT827YOrZmuSn2fx7p9akYZnNAY81bANd38boMVY1GFK2agTPD4dRewgHn+zrkWg/aBb
 2mqYejGfS0GAjekXO2ig5+2Kxm95mRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1h/IGu3sY/0N14TPIzap4XnMz5FTFAxz5Wqyfvuauk=;
 b=pSkR/3npf/+4EMONNazxo1D3GZLTo6173AXlh18IGfK2zfi0TQFx8sR4pCELrDOOxS2n6Z
 G/lcwzPxXGaVMSCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f+LOlGGt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WC+xR4ZQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1h/IGu3sY/0N14TPIzap4XnMz5FTFAxz5Wqyfvuauk=;
 b=f+LOlGGta+o2KxZ9RNtj58BYSvgfyj1EJTR14xkHMkhaVSa+3w02CH9GJEsyxQMYCCenuV
 t0Q/QjFMJKRXxPkhPZ/O34GsCcIrpaVZxAtllpgtqnXVgW5t/oP5PcHGc8PSRZOd/ES0TR
 U8RvU7kANHZuXFIgr4pB4TkEnqriFho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1h/IGu3sY/0N14TPIzap4XnMz5FTFAxz5Wqyfvuauk=;
 b=WC+xR4ZQXXVXT0bQucPS1lrF8fgtosinrHx1xRwLfrFL+Wuh9H1U7PiC6kxd106Hds8WwU
 HNnwTJY5kYiXfyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEB7E13A53;
 Fri,  8 Nov 2024 15:46:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SBlOLT0yLmcAHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Nov 2024 15:46:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/client: Move public client header to clients/
 subdirectory
Date: Fri,  8 Nov 2024 16:42:38 +0100
Message-ID: <20241108154600.126162-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108154600.126162-1-tzimmermann@suse.de>
References: <20241108154600.126162-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0FF6321BB9
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,ideasonboard.com:email,suse.de:dkim,suse.de:mid,suse.de:email];
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

Move the public header file drm_client_setup.h to the clients/
subdirectory and update all drivers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          | 2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c  | 2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                  | 2 +-
 drivers/gpu/drm/arm/malidp_drv.c                 | 2 +-
 drivers/gpu/drm/armada/armada_drv.c              | 2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c          | 2 +-
 drivers/gpu/drm/ast/ast_drv.c                    | 2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 2 +-
 drivers/gpu/drm/clients/drm_client_setup.c       | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c          | 2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c        | 2 +-
 drivers/gpu/drm/gma500/psb_drv.c                 | 2 +-
 drivers/gpu/drm/gud/gud_drv.c                    | 2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c  | 2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c          | 2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c              | 2 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c         | 2 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c              | 2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c        | 2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                    | 2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c            | 2 +-
 drivers/gpu/drm/loongson/lsdc_drv.c              | 2 +-
 drivers/gpu/drm/mcde/mcde_drv.c                  | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c           | 2 +-
 drivers/gpu/drm/meson/meson_drv.c                | 2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c            | 2 +-
 drivers/gpu/drm/msm/msm_drv.c                    | 2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                | 2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c            | 2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c             | 2 +-
 drivers/gpu/drm/pl111/pl111_drv.c                | 2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                    | 2 +-
 drivers/gpu/drm/radeon/radeon_drv.c              | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c    | 2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 2 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c      | 2 +-
 drivers/gpu/drm/solomon/ssd130x.c                | 2 +-
 drivers/gpu/drm/sti/sti_drv.c                    | 2 +-
 drivers/gpu/drm/stm/drv.c                        | 2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                | 2 +-
 drivers/gpu/drm/tegra/drm.c                      | 2 +-
 drivers/gpu/drm/tidss/tidss_drv.c                | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c              | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                    | 3 ++-
 drivers/gpu/drm/tiny/bochs.c                     | 2 +-
 drivers/gpu/drm/tiny/cirrus.c                    | 2 +-
 drivers/gpu/drm/tiny/gm12u320.c                  | 2 +-
 drivers/gpu/drm/tiny/hx8357d.c                   | 2 +-
 drivers/gpu/drm/tiny/ili9163.c                   | 2 +-
 drivers/gpu/drm/tiny/ili9225.c                   | 2 +-
 drivers/gpu/drm/tiny/ili9341.c                   | 2 +-
 drivers/gpu/drm/tiny/ili9486.c                   | 2 +-
 drivers/gpu/drm/tiny/mi0283qt.c                  | 2 +-
 drivers/gpu/drm/tiny/ofdrm.c                     | 2 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c            | 2 +-
 drivers/gpu/drm/tiny/repaper.c                   | 2 +-
 drivers/gpu/drm/tiny/sharp-memory.c              | 2 +-
 drivers/gpu/drm/tiny/simpledrm.c                 | 2 +-
 drivers/gpu/drm/tiny/st7586.c                    | 2 +-
 drivers/gpu/drm/tiny/st7735r.c                   | 2 +-
 drivers/gpu/drm/tve200/tve200_drv.c              | 2 +-
 drivers/gpu/drm/udl/udl_drv.c                    | 2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c             | 2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                    | 2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c             | 2 +-
 drivers/gpu/drm/vkms/vkms_drv.c                  | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c              | 2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                | 2 +-
 include/drm/{ => clients}/drm_client_setup.h     | 0
 72 files changed, 72 insertions(+), 71 deletions(-)
 rename include/drm/{ => clients}/drm_client_setup.h (100%)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6ac7d335e28e..92e39eef29a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -23,7 +23,7 @@
  */
 
 #include <drm/amdgpu_drm.h>
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 6d475bb34002..b694c90d4390 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -9,7 +9,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include "komeda_dev.h"
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index cd4389809d42..4af8fce7dab7 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -22,8 +22,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 4cb25004b84f..38b1b5b6bf69 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -16,9 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/debugfs.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 5c26f0409478..ddf0eaf546a6 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -11,8 +11,8 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 109023815fa2..55e90ab9b231 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -13,8 +13,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 4afe4be072ef..8e9c9cb89a50 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -31,8 +31,8 @@
 #include <linux/of.h>
 #include <linux/pci.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_gem_shmem_helper.h>
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 792dcc19e8e7..506289a937e2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -16,9 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
index c14221ca5a0d..c6a295d5de50 100644
--- a/drivers/gpu/drm/clients/drm_client_setup.c
+++ b/drivers/gpu/drm/clients/drm_client_setup.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fbdev_client.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2a466d8179f4..7e517a2ec681 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -13,9 +13,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/uaccess.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 91a48d774cf7..12b2096b6c9d 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -18,8 +18,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index c419ebbc49ec..2c56ece17d71 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -19,8 +19,8 @@
 
 #include <acpi/video.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 09ccdc1dc1a2..65a16f009ea6 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -13,9 +13,9 @@
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 8c488c98ac97..69bdae604982 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -15,8 +15,8 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 86a3a1faff49..7e9c2e3ceee2 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -17,8 +17,8 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index e0953777a206..c5ac240f7a7a 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -9,8 +9,8 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_gem_shmem_helper.h>
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 63a335c62296..490b5c269f39 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -3,11 +3,11 @@
  * Copyright 2019 NXP.
  */
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index ced06bd8eae8..6b84429735d6 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -13,9 +13,9 @@
 
 #include <video/imx-ipu-v3.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 3215c4acd675..c5121fed80fd 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // SPDX-FileCopyrightText: 2020 Marian Cichy <M.Cichy@pengutronix.de>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 056b70b63554..0a4eb3994cd6 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -20,11 +20,11 @@
 #include <linux/pm.h>
 #include <linux/regmap.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_damage_helper.h>
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 0274ab9caa85..4173344ba32c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -13,8 +13,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index e4d90701b29d..9152034e54a3 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -15,8 +15,8 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index b350bdcf1645..58d97403271c 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -7,9 +7,9 @@
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index f60bdd7b6c13..f8c7aa9d7f33 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -65,9 +65,9 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a4594f8873d5..63131d091d87 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -12,9 +12,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 7cace75a38af..83ee18024682 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -16,8 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/amlogic/meson-canvas.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 97fd7eb765b4..b7ed763addfa 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -10,8 +10,8 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c2dd8ef6d6dc..b5fa715cbfb0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,7 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 58ccad9c425d..81ec91cef66c 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -14,9 +14,9 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 34a98717b72c..1c27a97dce03 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -17,9 +17,9 @@
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 107f63f08bd9..a99c1d9855c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -31,7 +31,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/dynamic_debug.h>
 
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_ttm_helper.h>
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index f4bd0c6e3f34..7b6396890681 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -6,7 +6,7 @@
 
 #include <linux/fb.h>
 
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 13362150b9c6..4b96f48cf630 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -45,9 +45,9 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 21f752644242..f15e9583b098 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -34,9 +34,9 @@
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 23d6d1a2586d..d7fe3b29cc13 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -37,7 +37,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/pci.h>
 
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 4e0bafc86f50..0f5204ef996e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -18,8 +18,8 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index bbd7003335da..0a03a20f663b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -12,8 +12,8 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 8d3effe3f598..40b582ee178e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -17,8 +17,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 585355de696b..0393b48ad65b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -17,7 +17,7 @@
 #include <linux/console.h>
 #include <linux/iommu.h>
 
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 29b2f82d81f8..a737f650c2bc 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -18,9 +18,9 @@
 #include <linux/pwm.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 65f180c8e8e2..a6c13318aa0b 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -13,9 +13,9 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 478dc129d5c2..d181d11b277b 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -16,9 +16,9 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 3f880d8a5666..a7c11b795e98 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -15,8 +15,8 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bf3421667ecc..34878f5d2918 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -13,9 +13,9 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 2428b9aaa003..16b836f9ac35 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -9,9 +9,9 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 8c9f3705aa6c..821d0ba26287 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -13,8 +13,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 81abedec435d..d8f0190b670a 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -6,8 +6,9 @@
  */
 
 #include <linux/clk.h>
+
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 447989bb8201..8460ca9988cb 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -4,9 +4,9 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index f06a2be71f60..afd29b3df2b5 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -24,10 +24,10 @@
 #include <video/cirrus.h>
 #include <video/vga.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 0c17ae532fb4..47dbee84d58b 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -7,9 +7,9 @@
 #include <linux/pm.h>
 #include <linux/usb.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index 6b0d1846cfcf..910279ebbbaa 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -16,8 +16,8 @@
 #include <linux/property.h>
 #include <linux/spi/spi.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 5eb39ca1a855..e54ce120692f 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -7,8 +7,8 @@
 #include <linux/property.h>
 #include <linux/spi/spi.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 875e2d09729a..f322e67f473a 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -16,8 +16,8 @@
 #include <linux/spi/spi.h>
 #include <video/mipi_display.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index c1dfdfbbd30c..356c7f107c3e 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -15,8 +15,8 @@
 #include <linux/property.h>
 #include <linux/spi/spi.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 7e46a720d5e2..f5b1d21f7109 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -14,8 +14,8 @@
 
 #include <video/mipi_display.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index f1461c55dba6..61e33376fbc9 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -13,8 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 220c1244b3c0..b27ed3677bfd 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -5,9 +5,9 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index e66729b31bd6..79d5818cbbe6 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -14,8 +14,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 77944eb17b3c..9373063a13fc 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -21,8 +21,8 @@
 #include <linux/spi/spi.h>
 #include <linux/thermal.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 2d2315bd6aef..d87068126f9b 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 3182d32f1b8f..b3a2fc11dcf0 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -10,9 +10,9 @@
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 97013685c62f..7bfd4296c1c9 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -12,8 +12,8 @@
 #include <linux/spi/spi.h>
 #include <video/mipi_display.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 0747ebd999cc..6832ca590127 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -16,8 +16,8 @@
 #include <linux/spi/spi.h>
 #include <video/mipi_display.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index b30340a2141d..cb66dbbe2801 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -37,9 +37,9 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 8d8ae40f945c..6c182b21028e 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -5,8 +5,8 @@
 
 #include <linux/module.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem_shmem_helper.h>
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index a536c467e2b2..d9d884aad97f 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -13,8 +13,8 @@
 #include <linux/pci.h>
 #include <linux/vt_kern.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index d47e5967592f..bfceb1e7d0b4 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -31,8 +31,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ffca6e2e1c9a..6b0da1456042 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -32,9 +32,9 @@
 #include <linux/poll.h>
 #include <linux/wait.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2d1e95cb66e5..bab13943d8e0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -13,10 +13,10 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 2c46897876dd..ded48554568a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -35,7 +35,7 @@
 #include "vmwgfx_vkms.h"
 #include "ttm_object.h"
 
-#include <drm/drm_client_setup.h>
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_ttm_helper.h>
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index fc81983d9e5e..e272ecbce78d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -9,12 +9,12 @@
  * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
diff --git a/include/drm/drm_client_setup.h b/include/drm/clients/drm_client_setup.h
similarity index 100%
rename from include/drm/drm_client_setup.h
rename to include/drm/clients/drm_client_setup.h
-- 
2.47.0

