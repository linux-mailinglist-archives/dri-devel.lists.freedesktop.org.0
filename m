Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F086797173F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947010E3C0;
	Mon,  9 Sep 2024 11:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="weSE0nh9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eIf+IUC4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VcNL+pNU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4aT98TJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E1A10E385;
 Mon,  9 Sep 2024 11:36:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EEC5721BC6;
 Mon,  9 Sep 2024 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4lVjltZC8qXQ0u0A7ynm3u2ZAGaK1BP9BZYe0mhLts=;
 b=weSE0nh9l60+7WsLUCqJYlzEALntYE5bI0EHXHjrKsBcFxinIm69WCPYTP2GbK0EWagiwT
 UVcQ0D0vVwpvaTNadqO3hfFyb/6t6+J00Q4s9UmDhcUtpZuH+3bs0wB2DcfGnujnGMntJA
 dYPgT4DaDHJ6ih7MU6gEcfylb92ugTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4lVjltZC8qXQ0u0A7ynm3u2ZAGaK1BP9BZYe0mhLts=;
 b=eIf+IUC4AiPFeTsp3BmtMk3ltg8aUG9S7p90c2yrkk2a1f+28LMqf5w/JzyC5hOPdVg1jY
 96lxF8PMQamUZmCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VcNL+pNU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4aT98TJh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4lVjltZC8qXQ0u0A7ynm3u2ZAGaK1BP9BZYe0mhLts=;
 b=VcNL+pNU6n28lpzOrww0g3+pwjAQMiyOQ6Dj/8//iDfdIACYPIrkpzunC27UHsDRCzmClR
 hfG85+nTk5DgKJhWG8NgfBM5Im97kO/ZaU1Vm/Q/gQp+crm87uQ5PfQ0pc2wU7VRA6TlUf
 8gr9/Mb+krGN9n7QbeA1U0PY2rdIlmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4lVjltZC8qXQ0u0A7ynm3u2ZAGaK1BP9BZYe0mhLts=;
 b=4aT98TJhYh5gX6qDqNDK5NXgKRO3qsq6zTN7M+pvM+YZmIiKgLDhZ/RE0OqKEv7CQi9FIL
 ajPs1KD/a51/Y9Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC66C13312;
 Mon,  9 Sep 2024 11:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CHm/KMfd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:36:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexey Brodkin <abrodkin@synopsys.com>
Subject: [PATCH v4 06/80] drm/arcgpu: Run DRM default client setup
Date: Mon,  9 Sep 2024 13:30:12 +0200
Message-ID: <20240909113633.595465-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EEC5721BC6
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[10];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_TRACE(0.00)[suse.de:+]
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

Call drm_client_setup_with_fourcc() to run the kernel's default client
setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v2:
- use drm_client_setup_with_fourcc()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e..81abedec435d 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -371,6 +372,7 @@ static const struct drm_driver arcpgu_drm_driver = {
 	.patchlevel = 0,
 	.fops = &arcpgu_drm_ops,
 	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = arcpgu_debugfs_init,
 #endif
@@ -394,7 +396,7 @@ static int arcpgu_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_dma_setup(&arcpgu->drm, 16);
+	drm_client_setup_with_fourcc(&arcpgu->drm, DRM_FORMAT_RGB565);
 
 	return 0;
 
-- 
2.46.0

