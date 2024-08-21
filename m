Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD6959D03
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4210E63A;
	Wed, 21 Aug 2024 13:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w14pQuX1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cMxGPaP8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w14pQuX1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cMxGPaP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876D410E5FB;
 Wed, 21 Aug 2024 13:03:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 443EA20083;
 Wed, 21 Aug 2024 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqVTgOC4upq68SQ/Z7eXH49ackW+CGsZMC0iZJh8XmM=;
 b=w14pQuX1yQT5Qwz/ohCNa42YvWtQFQl1BKGWmxYcJrwGD/ttpthn0nI3g3jnsMqTgI0XwJ
 N7/iKc2XGSYhhCiD2tg8IhwewpTu3fDwvp1cMYH2L0jPRX9X/lq0jTvTZsxbmXSHdB4Sfy
 wpGrB2FG2j9gX94ha3D1Q7BuKTJu+zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqVTgOC4upq68SQ/Z7eXH49ackW+CGsZMC0iZJh8XmM=;
 b=cMxGPaP84dSvhaZ6DZLUlG8lCjK3hiUqnh+41dN282PD65xBejYyszI/GCtox0gmXBkfBR
 VN7YXGt/5fI/KYAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w14pQuX1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cMxGPaP8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqVTgOC4upq68SQ/Z7eXH49ackW+CGsZMC0iZJh8XmM=;
 b=w14pQuX1yQT5Qwz/ohCNa42YvWtQFQl1BKGWmxYcJrwGD/ttpthn0nI3g3jnsMqTgI0XwJ
 N7/iKc2XGSYhhCiD2tg8IhwewpTu3fDwvp1cMYH2L0jPRX9X/lq0jTvTZsxbmXSHdB4Sfy
 wpGrB2FG2j9gX94ha3D1Q7BuKTJu+zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqVTgOC4upq68SQ/Z7eXH49ackW+CGsZMC0iZJh8XmM=;
 b=cMxGPaP84dSvhaZ6DZLUlG8lCjK3hiUqnh+41dN282PD65xBejYyszI/GCtox0gmXBkfBR
 VN7YXGt/5fI/KYAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F07C713770;
 Wed, 21 Aug 2024 13:03:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yOCBObrlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:03:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH v2 09/86] drm/arm/malidp: Run DRM default client setup
Date: Wed, 21 Aug 2024 14:59:06 +0200
Message-ID: <20240821130348.73038-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 443EA20083
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCPT_COUNT_SEVEN(0.00)[11];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLtjf1sgqngceqezr4ayorkryp)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

The malidp driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 6682131d2910..4cb25004b84f 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -18,6 +18,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -562,6 +563,7 @@ static void malidp_debugfs_init(struct drm_minor *minor)
 static const struct drm_driver malidp_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(malidp_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = malidp_debugfs_init,
 #endif
@@ -852,7 +854,7 @@ static int malidp_bind(struct device *dev)
 	if (ret)
 		goto register_fail;
 
-	drm_fbdev_dma_setup(drm, 32);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 
-- 
2.46.0

