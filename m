Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BB99549A5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E66B10E671;
	Fri, 16 Aug 2024 12:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jn/iFw1O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M25FOWbo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jn/iFw1O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M25FOWbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBFD10E630;
 Fri, 16 Aug 2024 12:54:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA0F6200BE;
 Fri, 16 Aug 2024 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6o6Scy1BJgypassIbZZC5npqYNMJ1zA3LlQ6X/IDq8Y=;
 b=jn/iFw1OTVXSjH6rwTxfHJxhC2DPNolj/i4kyI/fgaxeAqCV4d3Pf+xg+EoXQDntdgwtoy
 m5nyUwwacbZds051fSO2Zq5UTrZtBPmcPHGK1VSxaj9by0dO01iYurXnEeesKsCCb8wOgw
 jz2iMgJHY+S5X9GcjTTKSvPpNZnlTzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6o6Scy1BJgypassIbZZC5npqYNMJ1zA3LlQ6X/IDq8Y=;
 b=M25FOWboOz1NdxDWxOCb8UIFvbPNGBSoGOeVevUZQ5TQDRVWId5CVwo16Cq9pxrzHzUfnE
 yAKMwQN8z3X4muDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6o6Scy1BJgypassIbZZC5npqYNMJ1zA3LlQ6X/IDq8Y=;
 b=jn/iFw1OTVXSjH6rwTxfHJxhC2DPNolj/i4kyI/fgaxeAqCV4d3Pf+xg+EoXQDntdgwtoy
 m5nyUwwacbZds051fSO2Zq5UTrZtBPmcPHGK1VSxaj9by0dO01iYurXnEeesKsCCb8wOgw
 jz2iMgJHY+S5X9GcjTTKSvPpNZnlTzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6o6Scy1BJgypassIbZZC5npqYNMJ1zA3LlQ6X/IDq8Y=;
 b=M25FOWboOz1NdxDWxOCb8UIFvbPNGBSoGOeVevUZQ5TQDRVWId5CVwo16Cq9pxrzHzUfnE
 yAKMwQN8z3X4muDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6058613ACA;
 Fri, 16 Aug 2024 12:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8HtGFvxLv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 28/86] drm/mi0283qt: Run DRM default client setup
Date: Fri, 16 Aug 2024 14:22:54 +0200
Message-ID: <20240816125408.310253-29-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -7.30
X-Spam-Level: 
X-Spamd-Result: default: False [-7.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
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
Cc: "Noralf Trønnes" <noralf@tronnes.org>
---
 drivers/gpu/drm/tiny/mi0283qt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index cdc5423990ca..f1461c55dba6 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -14,6 +14,7 @@
 #include <linux/spi/spi.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -154,6 +155,7 @@ static const struct drm_driver mi0283qt_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &mi0283qt_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "mi0283qt",
 	.desc			= "Multi-Inno MI0283QT",
@@ -226,7 +228,7 @@ static int mi0283qt_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_dma_setup(drm, 0);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 }
-- 
2.46.0

