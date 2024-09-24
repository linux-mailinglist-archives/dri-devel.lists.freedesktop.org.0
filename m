Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB4983E18
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0AA10E558;
	Tue, 24 Sep 2024 07:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="h5Bfv5dA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7y8oPsq7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jDbhT90e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AuOzjUP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4196210E4FE;
 Tue, 24 Sep 2024 07:17:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9ABD21BA2;
 Tue, 24 Sep 2024 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBlg8BRZwEsEa+gva53ek7ArbUADYZDnbmdB+ni1+aY=;
 b=h5Bfv5dA2VRFQf3JbdIfLDVYAnHhbf7LsT+QA3UOoKj3k8SyLNFKzYrqkrOnhBLAROeqD+
 Y1F1ZxwLO98dBno6QrabsoHFNH8b0qVzHvLUqtgflF/qACFpk5GAwM/VDeAfxgMr90+b3k
 FHSiWyJKIIRm9aBmq6kMILxStPOWpWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBlg8BRZwEsEa+gva53ek7ArbUADYZDnbmdB+ni1+aY=;
 b=7y8oPsq7+Nd5I39acmcf5QzEwwQ0d91BC4YRjwZeKpqI9fnu04CTiI6bOzCV5nN/TlqKhg
 CmJjPwWw6U6y91BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBlg8BRZwEsEa+gva53ek7ArbUADYZDnbmdB+ni1+aY=;
 b=jDbhT90eswGg3+qoee+xXsJV+ZG8GCknke2voS4QaMnz9mGfzwqnsqOeFVVnvpKsaBCaTB
 Xzkj7+At/jBCWp+wNriFCcHkCrqRO0GbvzoA1+6bgM3Myx9MNOOGc98vVnrD5c9cv9VHOm
 KO5RoESIA67+SeKInvC4/Ajn7gzu/io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162261;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBlg8BRZwEsEa+gva53ek7ArbUADYZDnbmdB+ni1+aY=;
 b=AuOzjUP/QIF82QRR0xZJV1JJK79JH1AJz8ouHWN2dPEtL4fYKtXydMNpXa2CTpdcqT9SNG
 TT/Q55WBszqBNUAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 942AE1386E;
 Tue, 24 Sep 2024 07:17:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sLX+IpVn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v5 10/80] drm/aspeed: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:08 +0200
Message-ID: <20240924071734.98201-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The aspeed driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

v5:
- select DRM_CLIENT_SELECTION
v3:
- add DRM_FBDEV_DMA_DRIVER_OPS macro

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/aspeed/Kconfig          | 1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
index 8137c39b057b..6e68f20aac21 100644
--- a/drivers/gpu/drm/aspeed/Kconfig
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -4,6 +4,7 @@ config DRM_ASPEED_GFX
 	depends on DRM && OF
 	depends on (COMPILE_TEST || ARCH_ASPEED)
 	depends on MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index a7a6b70220eb..109023815fa2 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -14,6 +14,7 @@
 #include <linux/reset.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -247,6 +248,7 @@ DEFINE_DRM_GEM_DMA_FOPS(fops);
 static const struct drm_driver aspeed_gfx_driver = {
 	.driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 	.fops = &fops,
 	.name = "aspeed-gfx-drm",
 	.desc = "ASPEED GFX DRM",
@@ -339,7 +341,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_dma_setup(&priv->drm, 32);
+	drm_client_setup(&priv->drm, NULL);
 	return 0;
 
 err_unload:
-- 
2.46.0

