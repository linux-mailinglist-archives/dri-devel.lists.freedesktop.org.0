Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB2965ADB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6351510E8A8;
	Fri, 30 Aug 2024 08:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Wndlm32e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YBJ1mW2G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wndlm32e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YBJ1mW2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527B110E885;
 Fri, 30 Aug 2024 08:45:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6AA11F7B7;
 Fri, 30 Aug 2024 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MyY/hiVYKu+BxdjrdCs3GBQfdcvtPauFcAO9VyoGr4=;
 b=Wndlm32e4igITjOf4tm4cVW9kS4tmI4JiWju5ci+gCrFh06kZmBqpb08mT+tn35MqgHmOl
 8ZDro711ER/UAZL16bMe50Hlgw3HcZU7AFJLskhJhzNC6oCu4DJUjy4xpx9ECjeTvD8HiD
 1vvv16RzoBCBlcuIhSgEq7Z7LFCkqrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MyY/hiVYKu+BxdjrdCs3GBQfdcvtPauFcAO9VyoGr4=;
 b=YBJ1mW2GZKt7Tr2ZW3nF+Zhh+OE1E/b9+lWnQ7VbDU+K/laZgRWO1jr8plsia6h7JJlPl4
 TzAm7T8q5KiANFCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MyY/hiVYKu+BxdjrdCs3GBQfdcvtPauFcAO9VyoGr4=;
 b=Wndlm32e4igITjOf4tm4cVW9kS4tmI4JiWju5ci+gCrFh06kZmBqpb08mT+tn35MqgHmOl
 8ZDro711ER/UAZL16bMe50Hlgw3HcZU7AFJLskhJhzNC6oCu4DJUjy4xpx9ECjeTvD8HiD
 1vvv16RzoBCBlcuIhSgEq7Z7LFCkqrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MyY/hiVYKu+BxdjrdCs3GBQfdcvtPauFcAO9VyoGr4=;
 b=YBJ1mW2GZKt7Tr2ZW3nF+Zhh+OE1E/b9+lWnQ7VbDU+K/laZgRWO1jr8plsia6h7JJlPl4
 TzAm7T8q5KiANFCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 950D513A3D;
 Fri, 30 Aug 2024 08:45:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8AggI4+G0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 14/81] drm/hx8357d: Run DRM default client setup
Date: Fri, 30 Aug 2024 10:39:58 +0200
Message-ID: <20240830084456.77630-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/hx8357d.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index 2e631282edeb..6b0d1846cfcf 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -17,6 +17,7 @@
 #include <linux/spi/spi.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -194,6 +195,7 @@ static const struct drm_driver hx8357d_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &hx8357d_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "hx8357d",
 	.desc			= "HX8357D",
@@ -256,7 +258,7 @@ static int hx8357d_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_dma_setup(drm, 0);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 }
-- 
2.46.0

