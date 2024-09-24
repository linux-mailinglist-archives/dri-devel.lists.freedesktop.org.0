Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D8983E66
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE31310E5A3;
	Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="O2cdRrb5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x3xMC7kn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O2cdRrb5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x3xMC7kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284D10E57F;
 Tue, 24 Sep 2024 07:17:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9F5F41FBEF;
 Tue, 24 Sep 2024 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fh3bAMY2oF5DZD55LvWwNGSjH95YW8gvo5S5GjDPLE=;
 b=O2cdRrb5AJ0/kQ8yN4I5TArwkjJSpvFfz2GaNpDr0H+Gq5thmWzXbAkimYick0fjbN6C5C
 ZDzhaeFwCiybEsIxkyMM90eWFz7wt7pdkYzVb56EmgZWzjmt8y9nPVdll+yIgesPUc1umc
 JLLVwcN+YACBfSz6ol+FheD40cY+u4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fh3bAMY2oF5DZD55LvWwNGSjH95YW8gvo5S5GjDPLE=;
 b=x3xMC7kn334fmm0qBoPYvy7bST3cLk1QkRCN+pkkXVuIPI1oW5U4MB7TdSsMrI76fm6YAC
 el1ZEanGiIivEGAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O2cdRrb5;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=x3xMC7kn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fh3bAMY2oF5DZD55LvWwNGSjH95YW8gvo5S5GjDPLE=;
 b=O2cdRrb5AJ0/kQ8yN4I5TArwkjJSpvFfz2GaNpDr0H+Gq5thmWzXbAkimYick0fjbN6C5C
 ZDzhaeFwCiybEsIxkyMM90eWFz7wt7pdkYzVb56EmgZWzjmt8y9nPVdll+yIgesPUc1umc
 JLLVwcN+YACBfSz6ol+FheD40cY+u4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fh3bAMY2oF5DZD55LvWwNGSjH95YW8gvo5S5GjDPLE=;
 b=x3xMC7kn334fmm0qBoPYvy7bST3cLk1QkRCN+pkkXVuIPI1oW5U4MB7TdSsMrI76fm6YAC
 el1ZEanGiIivEGAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62CCD13AE2;
 Tue, 24 Sep 2024 07:17:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wOzwFqRn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 57/80] drm/ofdrm: Use DRM default client setup
Date: Tue, 24 Sep 2024 09:12:55 +0200
Message-ID: <20240924071734.98201-58-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9F5F41FBEF
X-Spam-Score: -5.01
X-Rspamd-Action: no action
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/Kconfig | 1 +
 drivers/gpu/drm/tiny/ofdrm.c | 9 +++------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 86abd90d19aa..02db304c0cac 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -57,6 +57,7 @@ config DRM_OFDRM
 	tristate "Open Firmware display driver"
 	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
 	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 35996f7eedac..04ffa93de44a 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -7,6 +7,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
@@ -1344,6 +1345,7 @@ DEFINE_DRM_GEM_FOPS(ofdrm_fops);
 
 static struct drm_driver ofdrm_driver = {
 	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
 	.date			= DRIVER_DATE,
@@ -1361,7 +1363,6 @@ static int ofdrm_probe(struct platform_device *pdev)
 {
 	struct ofdrm_device *odev;
 	struct drm_device *dev;
-	unsigned int color_mode;
 	int ret;
 
 	odev = ofdrm_device_create(&ofdrm_driver, pdev);
@@ -1373,11 +1374,7 @@ static int ofdrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	color_mode = drm_format_info_bpp(odev->format, 0);
-	if (color_mode == 16)
-		color_mode = odev->format->depth; // can be 15 or 16
-
-	drm_fbdev_shmem_setup(dev, color_mode);
+	drm_client_setup(dev, odev->format);
 
 	return 0;
 }
-- 
2.46.0

