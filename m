Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79A983EA7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359E910E5E7;
	Tue, 24 Sep 2024 07:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OcV4d1oz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MLpSR6Lh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OcV4d1oz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MLpSR6Lh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49B810E514;
 Tue, 24 Sep 2024 07:17:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D90E1FC30;
 Tue, 24 Sep 2024 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3USQ0CV3hIQSwm8aDLvO3rAAOZSpss6Gdb+PbBk3OQs=;
 b=OcV4d1ozOV7sJ4IA/OLjLA6XIRkSgQG8DILUWeVcjDZjtKsEnXES/HoOjeqvH9J3n0I74i
 YQIn3K/fQ707hfD+G9GV2nonEwivulEzt9SxuTHxXyWGRC6grE/rom5AHCqrGQzfhMezo6
 rbHIlksVZdhCN1O5K5TueLnVbQPZnbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162277;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3USQ0CV3hIQSwm8aDLvO3rAAOZSpss6Gdb+PbBk3OQs=;
 b=MLpSR6LhCh2V4J21VKQZqwEugvAJendPiatYGzZAJGEC3vV8S1R5HNsCum+ZfoPh0hajhz
 W2g5zPvt52hDBSAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OcV4d1oz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MLpSR6Lh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3USQ0CV3hIQSwm8aDLvO3rAAOZSpss6Gdb+PbBk3OQs=;
 b=OcV4d1ozOV7sJ4IA/OLjLA6XIRkSgQG8DILUWeVcjDZjtKsEnXES/HoOjeqvH9J3n0I74i
 YQIn3K/fQ707hfD+G9GV2nonEwivulEzt9SxuTHxXyWGRC6grE/rom5AHCqrGQzfhMezo6
 rbHIlksVZdhCN1O5K5TueLnVbQPZnbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162277;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3USQ0CV3hIQSwm8aDLvO3rAAOZSpss6Gdb+PbBk3OQs=;
 b=MLpSR6LhCh2V4J21VKQZqwEugvAJendPiatYGzZAJGEC3vV8S1R5HNsCum+ZfoPh0hajhz
 W2g5zPvt52hDBSAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37CF11386E;
 Tue, 24 Sep 2024 07:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gCRjDKVn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v5 60/80] drm/udl: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:58 +0200
Message-ID: <20240924071734.98201-61-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7D90E1FC30
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/Kconfig   | 1 +
 drivers/gpu/drm/udl/udl_drv.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/Kconfig b/drivers/gpu/drm/udl/Kconfig
index c744175c6992..d7a6abef7d78 100644
--- a/drivers/gpu/drm/udl/Kconfig
+++ b/drivers/gpu/drm/udl/Kconfig
@@ -5,6 +5,7 @@ config DRM_UDL
 	depends on USB
 	depends on USB_ARCH_HAS_HCD
 	depends on MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 280a09a6e2ad..8d8ae40f945c 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem_shmem_helper.h>
@@ -73,6 +74,7 @@ static const struct drm_driver driver = {
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 	.gem_prime_import = udl_driver_gem_prime_import,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
@@ -117,7 +119,7 @@ static int udl_usb_probe(struct usb_interface *interface,
 
 	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
 
-	drm_fbdev_shmem_setup(&udl->drm, 0);
+	drm_client_setup(&udl->drm, NULL);
 
 	return 0;
 }
-- 
2.46.0

