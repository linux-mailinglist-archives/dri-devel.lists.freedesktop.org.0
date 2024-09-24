Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76569983EB9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3B410E5F2;
	Tue, 24 Sep 2024 07:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w0b4PHH2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/6EzeO29";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w0b4PHH2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/6EzeO29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185FB10E553;
 Tue, 24 Sep 2024 07:17:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D009D21BA9;
 Tue, 24 Sep 2024 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySGccPaoLtrpBMvyJiCnBbyJ7P7gMWtboZGz4KVH7zA=;
 b=w0b4PHH2ONiY+OC7Gx43yQukp88SkZx2NXGRMsvsV/BnUPGsVkLhCUSZ/mZkCmkOv0B0lE
 AweUrevrMuDknSfkeARhk+D47RTdHKIloaN5Rj3F+kVdzUsO27UYrqFVrjlVC1o4ev8V6Q
 X+V5ByyGP/lDAQooEaTBFwMavmVdbJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySGccPaoLtrpBMvyJiCnBbyJ7P7gMWtboZGz4KVH7zA=;
 b=/6EzeO29TWV+SdIYScjaZJII++bucIGxFT0jkO24Oj0OZTX+Zj1+vRFefVUT5C/dN8xu3B
 Ne7gnopMdINGLyCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w0b4PHH2;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/6EzeO29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySGccPaoLtrpBMvyJiCnBbyJ7P7gMWtboZGz4KVH7zA=;
 b=w0b4PHH2ONiY+OC7Gx43yQukp88SkZx2NXGRMsvsV/BnUPGsVkLhCUSZ/mZkCmkOv0B0lE
 AweUrevrMuDknSfkeARhk+D47RTdHKIloaN5Rj3F+kVdzUsO27UYrqFVrjlVC1o4ev8V6Q
 X+V5ByyGP/lDAQooEaTBFwMavmVdbJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySGccPaoLtrpBMvyJiCnBbyJ7P7gMWtboZGz4KVH7zA=;
 b=/6EzeO29TWV+SdIYScjaZJII++bucIGxFT0jkO24Oj0OZTX+Zj1+vRFefVUT5C/dN8xu3B
 Ne7gnopMdINGLyCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EF8313AE2;
 Tue, 24 Sep 2024 07:17:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KAW2IaJn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v5 51/80] drm/bochs: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:49 +0200
Message-ID: <20240924071734.98201-52-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D009D21BA9
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
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc),to(RLbwen1niosrcqbxsafh1)];
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

The bochs driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

v5:
- select DRM_CLIENT_SELECTION
v4:
- rebase on top of GEM-SHMEM

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/Kconfig | 1 +
 drivers/gpu/drm/tiny/bochs.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 7ab8d6c02dab..5e047ba8a30d 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -14,6 +14,7 @@ config DRM_ARCPGU
 config DRM_BOCHS
 	tristate "DRM Support for bochs dispi vga interface (qemu stdvga)"
 	depends on DRM && PCI && MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 9055b1dd66df..5d2d34976d4b 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -6,6 +6,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
@@ -674,6 +675,7 @@ static const struct drm_driver bochs_driver = {
 	.major			= 1,
 	.minor			= 0,
 	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
 /* ---------------------------------------------------------------------- */
@@ -732,7 +734,8 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 	if (ret)
 		goto err_free_dev;
 
-	drm_fbdev_shmem_setup(dev, 32);
+	drm_client_setup(dev, NULL);
+
 	return ret;
 
 err_free_dev:
-- 
2.46.0

