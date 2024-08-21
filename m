Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FABE959DF6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0C310EA68;
	Wed, 21 Aug 2024 13:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OQRuaZBg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fRMQuTRQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OQRuaZBg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fRMQuTRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344F10E9A0;
 Wed, 21 Aug 2024 13:04:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C84F222DC;
 Wed, 21 Aug 2024 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qBC4F/QMF0ixYSuWSkzl6lwHz9e+dTa2kz+pa5TtE8=;
 b=OQRuaZBgziXZ/u9vj0MuXcjN7RiAI/nbOTa2VXJjDp+/fljA2xcy5JgHwIEpwHthy2SRFD
 HfWgBqXM9Xj6t6LID/KJt5UPiKiNurYYg1vYCDsFbXA6buMGakXmq4MIIqZJ3L3EaZHDKU
 GDRi+EU9kiWicOFVSrG5N7yPh///sDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qBC4F/QMF0ixYSuWSkzl6lwHz9e+dTa2kz+pa5TtE8=;
 b=fRMQuTRQghiK0VdVLSqoGeGPa6OWsC+RfVPz3NjhGqzWLPe7gt9S1H0DBiDeYmxHgA9bfm
 71XZI8V4ngXhrrAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OQRuaZBg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fRMQuTRQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qBC4F/QMF0ixYSuWSkzl6lwHz9e+dTa2kz+pa5TtE8=;
 b=OQRuaZBgziXZ/u9vj0MuXcjN7RiAI/nbOTa2VXJjDp+/fljA2xcy5JgHwIEpwHthy2SRFD
 HfWgBqXM9Xj6t6LID/KJt5UPiKiNurYYg1vYCDsFbXA6buMGakXmq4MIIqZJ3L3EaZHDKU
 GDRi+EU9kiWicOFVSrG5N7yPh///sDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qBC4F/QMF0ixYSuWSkzl6lwHz9e+dTa2kz+pa5TtE8=;
 b=fRMQuTRQghiK0VdVLSqoGeGPa6OWsC+RfVPz3NjhGqzWLPe7gt9S1H0DBiDeYmxHgA9bfm
 71XZI8V4ngXhrrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 129CA13B18;
 Wed, 21 Aug 2024 13:04:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eM9aA8vlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH v2 56/86] drm/mgag200: Run DRM default client setup
Date: Wed, 21 Aug 2024 14:59:53 +0200
Message-ID: <20240821130348.73038-57-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5C84F222DC
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 RCPT_COUNT_SEVEN(0.00)[11];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw),to(RLazpx1r3qpnsfr8nfakn)];
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

Call drm_client_setup_with_fourcc() to run the kernel's default client
setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v2:
- use drm_client_setup_with_fourcc()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_client_setup.c    | 2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
index c8ca5afaa47a..5373a892f097 100644
--- a/drivers/gpu/drm/drm_client_setup.c
+++ b/drivers/gpu/drm/drm_client_setup.c
@@ -64,6 +64,6 @@ void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color
 {
 	u32 fourcc = drm_driver_color_mode_format(dev, color_mode);
 
-	drm_client_setup_with_fourcc(dev, fmt);
+	drm_client_setup_with_fourcc(dev, fourcc);
 }
 EXPORT_SYMBOL(drm_client_setup_with_color_mode);
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 6623ee4e3277..29087e2398df 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -11,9 +11,11 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
@@ -129,6 +131,7 @@ static const struct drm_driver mgag200_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
 /*
@@ -314,7 +317,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * FIXME: A 24-bit color depth does not work with 24 bpp on
 	 * G200ER. Force 32 bpp.
 	 */
-	drm_fbdev_shmem_setup(dev, 32);
+	drm_client_setup_with_fourcc(dev, DRM_FORMAT_XRGB8888);
 
 	return 0;
 }
-- 
2.46.0

