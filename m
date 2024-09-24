Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53FB983DF8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564D710E53B;
	Tue, 24 Sep 2024 07:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LRd2Azr/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1B0YJmPr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LRd2Azr/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1B0YJmPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE2D10E527;
 Tue, 24 Sep 2024 07:17:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F30A11FBF1;
 Tue, 24 Sep 2024 07:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp52wLaEFDU0y6aCuk77kWigwM9rgzAkK/6GV5hl7LM=;
 b=LRd2Azr/Ub9yxHJO0C857a3ki3FX9u8mM/7nX6uOVo0hv6LsKog34DuL/AzZaTXJFL3vJh
 1ZiM1ThqWRvFzdRFIH+oXs0cGjEW6Gf1zcOYXCjkJpIlIlH7B0EXJZNfu4D8Ly8Sn54WP0
 2ZJV/YaIrSMRHfE2O8WIwyievxUN4IQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp52wLaEFDU0y6aCuk77kWigwM9rgzAkK/6GV5hl7LM=;
 b=1B0YJmPrMyMHFHGf4OpFxLQ5vwdCb/JzgERgAtR5sKqnSO6GWtUD928/GsrYAtJF8UMm31
 fHfwJTy7G7uRgpDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp52wLaEFDU0y6aCuk77kWigwM9rgzAkK/6GV5hl7LM=;
 b=LRd2Azr/Ub9yxHJO0C857a3ki3FX9u8mM/7nX6uOVo0hv6LsKog34DuL/AzZaTXJFL3vJh
 1ZiM1ThqWRvFzdRFIH+oXs0cGjEW6Gf1zcOYXCjkJpIlIlH7B0EXJZNfu4D8Ly8Sn54WP0
 2ZJV/YaIrSMRHfE2O8WIwyievxUN4IQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp52wLaEFDU0y6aCuk77kWigwM9rgzAkK/6GV5hl7LM=;
 b=1B0YJmPrMyMHFHGf4OpFxLQ5vwdCb/JzgERgAtR5sKqnSO6GWtUD928/GsrYAtJF8UMm31
 fHfwJTy7G7uRgpDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A421D1386E;
 Tue, 24 Sep 2024 07:17:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6BfjJppn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chun-KuaIng Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 26/80] drm/mediatek: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:24 +0200
Message-ID: <20240924071734.98201-27-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,kernel.org,pengutronix.de,gmail.com,collabora.com];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The mediatek driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chun-KuaIng Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/mediatek/Kconfig       | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 417ac8c9af41..3d2436272ff2 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -7,6 +7,7 @@ config DRM_MEDIATEK
 	depends on HAVE_ARM_SMCCC
 	depends on OF
 	depends on MTK_MMSYS
+	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 77b50c56c124..b1309a70fdcd 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -610,6 +611,7 @@ static const struct drm_driver mtk_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
 	.dumb_create = mtk_gem_dumb_create,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.gem_prime_import = mtk_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
@@ -666,7 +668,7 @@ static int mtk_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto err_deinit;
 
-	drm_fbdev_dma_setup(drm, 32);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 
-- 
2.46.0

