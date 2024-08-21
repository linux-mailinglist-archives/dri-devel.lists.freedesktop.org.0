Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76730959D73
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A608810E9B7;
	Wed, 21 Aug 2024 13:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wKgeFtAO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cwg4knUo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wKgeFtAO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cwg4knUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0654E10E93E;
 Wed, 21 Aug 2024 13:04:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BF8E222BA;
 Wed, 21 Aug 2024 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+83gPglvTT6kXcXNMYS2acVp/4W3cETdILdD4hLDKQ=;
 b=wKgeFtAOjuo/0YOQCCKUYHKLUd5zek+hdzqeu8M5zFdDgl91ztCvYUcMompW2b6Gak8xwU
 3BljoZi0ngEbbgIQrLDwj+q7BlVGj10eDu8TVr5CIzEwaLorvpfXPjjdKf8c/PAjm5TyBk
 DD9IJGgZS/EmozbUrnhUwTpSwoSuxvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+83gPglvTT6kXcXNMYS2acVp/4W3cETdILdD4hLDKQ=;
 b=cwg4knUo6BQyiSdMxVnoeCZnz4PAC9vajA2u3mBv8rOWWEQTaZM3laisXrqoJ9oZHQq87u
 Dt4iFxOsOoTQR+Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+83gPglvTT6kXcXNMYS2acVp/4W3cETdILdD4hLDKQ=;
 b=wKgeFtAOjuo/0YOQCCKUYHKLUd5zek+hdzqeu8M5zFdDgl91ztCvYUcMompW2b6Gak8xwU
 3BljoZi0ngEbbgIQrLDwj+q7BlVGj10eDu8TVr5CIzEwaLorvpfXPjjdKf8c/PAjm5TyBk
 DD9IJGgZS/EmozbUrnhUwTpSwoSuxvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+83gPglvTT6kXcXNMYS2acVp/4W3cETdILdD4hLDKQ=;
 b=cwg4knUo6BQyiSdMxVnoeCZnz4PAC9vajA2u3mBv8rOWWEQTaZM3laisXrqoJ9oZHQq87u
 Dt4iFxOsOoTQR+Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C41213770;
 Wed, 21 Aug 2024 13:04:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qF1TFcPlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 33/86] drm/pl111: Run DRM default client setup
Date: Wed, 21 Aug 2024 14:59:30 +0200
Message-ID: <20240821130348.73038-34-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
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

Call drm_client_setup_with_color_mode() to run the kernel's default
client setup for DRM. Set fbdev_probe in struct drm_driver, so that
the client setup can start the common fbdev client.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 02e6b74d5016..13362150b9c6 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -47,6 +47,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -225,6 +226,7 @@ static const struct drm_driver pl111_drm_driver = {
 	.patchlevel = 0,
 	.dumb_create = drm_gem_dma_dumb_create,
 	.gem_prime_import_sg_table = pl111_gem_import_sg_table,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = pl111_debugfs_init,
@@ -305,7 +307,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	if (ret < 0)
 		goto dev_put;
 
-	drm_fbdev_dma_setup(drm, priv->variant->fb_depth);
+	drm_client_setup_with_color_mode(drm, priv->variant->fb_depth);
 
 	return 0;
 
-- 
2.46.0

