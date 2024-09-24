Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20168983E37
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499710E57C;
	Tue, 24 Sep 2024 07:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jcbfQ1UX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BBrxItE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oMNX25ya";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2gZ/6Nl5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC88E10E50C;
 Tue, 24 Sep 2024 07:17:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 414F41FBDD;
 Tue, 24 Sep 2024 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGTcM4W4310q085+R26iC9TvqFnXJTPf2ATEqAlC9pY=;
 b=jcbfQ1UXuBAh339/G1O4QgvbIeqPGaWh3LEUsedzZUGLKmKlgGW4jEUo+u2qf3dyFb3vx+
 nqhw39wrNhEIDdkFB+4YIJXDW73BuntdviNL2v/c48NjfWH+8UWxcqRkTqf6xBCuSmrF0W
 QLoFVivCJeV4tAN9mQxILvEzFhyLCUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGTcM4W4310q085+R26iC9TvqFnXJTPf2ATEqAlC9pY=;
 b=1BBrxItEgxJ/SRHdAUG3mpzZIOttgpm8n4yrim1Go8FGLbo+SGIR4m4fG9vp1Zipb9uARt
 EoN7DxBmLYLHSECw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oMNX25ya;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="2gZ/6Nl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGTcM4W4310q085+R26iC9TvqFnXJTPf2ATEqAlC9pY=;
 b=oMNX25yaV5sadFbz8qaZeq6RAnEoYDheC6eMhZreTjTVeK7eOoF0Sl6WN3HOcCsFLuWFga
 dcMFXSo+3lR0NwIUmtEujuooliMbxU1jOja4/vYReCAIO0OFtievRuuSxFcyhgqMywOc6K
 Yvx95GVgU7CA2Me2mLGj4LS2VmOr9RI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGTcM4W4310q085+R26iC9TvqFnXJTPf2ATEqAlC9pY=;
 b=2gZ/6Nl5SfpSaMUE2uZJHQvPWERC6X1FtmEZ+k1MI+pNXkjYVa/P2MH+0NPyYph4I7eKrD
 fMmwQlCIG21g8uDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E000913AE2;
 Tue, 24 Sep 2024 07:17:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wGFiNZVn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v5 11/80] drm/atmel-hdlcd: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:09 +0200
Message-ID: <20240924071734.98201-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 414F41FBDD
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,tuxon.dev:email,ravnborg.org:email,microchip.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[14]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
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

Call drm_client_setup_with_fourcc() to run the kernel's default client
setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v5:
- select DRM_CLIENT_SELECTION
v3:
- add DRM_FBDEV_DMA_DRIVER_OPS macro (Sam)
v2:
- use drm_client_setup_with_fourcc()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/atmel-hlcdc/Kconfig          | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/Kconfig b/drivers/gpu/drm/atmel-hlcdc/Kconfig
index 945f3aa7bb24..f8b9c91907d8 100644
--- a/drivers/gpu/drm/atmel-hlcdc/Kconfig
+++ b/drivers/gpu/drm/atmel-hlcdc/Kconfig
@@ -2,6 +2,7 @@
 config DRM_ATMEL_HLCDC
 	tristate "DRM Support for ATMEL HLCDC Display Controller"
 	depends on DRM && OF && COMMON_CLK && ((MFD_ATMEL_HLCDC && ARM) || COMPILE_TEST)
+	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 9ce429f889ca..792dcc19e8e7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -18,8 +18,10 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
@@ -840,6 +842,7 @@ DEFINE_DRM_GEM_DMA_FOPS(fops);
 static const struct drm_driver atmel_hlcdc_dc_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 	.fops = &fops,
 	.name = "atmel-hlcdc",
 	.desc = "Atmel HLCD Controller DRM",
@@ -865,7 +868,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_dma_setup(ddev, 24);
+	drm_client_setup_with_fourcc(ddev, DRM_FORMAT_RGB888);
 
 	return 0;
 
-- 
2.46.0

