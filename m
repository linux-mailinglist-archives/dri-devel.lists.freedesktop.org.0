Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E55971741
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFF410E3C3;
	Mon,  9 Sep 2024 11:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="L3nofErR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U3NI4yCr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dkOcDxiC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="papUjWtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6954210E3A2;
 Mon,  9 Sep 2024 11:36:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5CA01FC11;
 Mon,  9 Sep 2024 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hp1xu0QBNSwuuUmXiVtWi9okyF+w431NbD8YEW0sXIY=;
 b=L3nofErR2eAEyli2/OHxTIpTQQCxk9rXNp7doR3ZmN00jUfpVlhIsMZFRirNkAlg9nP6iP
 s8DcJ8Id6ICKWh0QVEiUBvPwQbElj4pNoLuwKFzXgWKYfvNtU/FXhbuT1dWgEPy6rIjMUL
 prFr2F+K7V9+8GH8FmFnPd5rxjjj9bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881802;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hp1xu0QBNSwuuUmXiVtWi9okyF+w431NbD8YEW0sXIY=;
 b=U3NI4yCreTLPGY19oVRIPYj6eI86/V2Tpp34Jmw+Hi2z9lfGO0avRGKg+F+lKQe3kkrcB/
 yI/ssNoC4baQfCBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hp1xu0QBNSwuuUmXiVtWi9okyF+w431NbD8YEW0sXIY=;
 b=dkOcDxiC56gERSt5FbxZaAu+0nvs0wMop5MAApcPBkYEW/vWsZFHeRl/OHHbfLprfQfiBa
 mIMf7x+uk4/lqgWDdhShjr8IxgvvPr1kYIhB7shjnlMTm2x0NHg0JgFbI2tbKBdgVHr78s
 toyaVxp2xMWsqIQ07Yp2lt8CCdjxAqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hp1xu0QBNSwuuUmXiVtWi9okyF+w431NbD8YEW0sXIY=;
 b=papUjWtYNv2gR7DQosmdJj2wfpcfOiiGUCZn5O/3Vg79RjF8S4slC9n1S72epqm4Bzyd92
 JIjqbyWgVMBVT2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CFCE13A84;
 Mon,  9 Sep 2024 11:36:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OLt+Fcnd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:36:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v4 11/80] drm/atmel-hdlcd: Run DRM default client setup
Date: Mon,  9 Sep 2024 13:30:17 +0200
Message-ID: <20240909113633.595465-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,microchip.com:email]; 
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
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

Call drm_client_setup_with_fourcc() to run the kernel's default client
setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

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
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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

