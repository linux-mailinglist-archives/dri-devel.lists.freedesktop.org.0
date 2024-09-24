Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE3D983EC3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36FF10E612;
	Tue, 24 Sep 2024 07:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SZjsgKZa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XiKJ2LQp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SZjsgKZa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XiKJ2LQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258F910E59B;
 Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE3591FCD9;
 Tue, 24 Sep 2024 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLksGfGtUiOshyKMWd7HBxy4BiUPMyCGhC1n1FQwYRI=;
 b=SZjsgKZaq8MczjtkMNjH6SNAe6ETUs9+J/VD/sEGGgS2S5uYrN/NvGQUXC+d1Cb8blO/TK
 fvg440xd3GBsvt+xkGUtsLxIx6beF/SMEskFs2Lq7TwFIWrKAGP3u526znfMie86ZmeudW
 cWgTjF2JYyunAQBKFKTkwAMJ3d6+t6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162280;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLksGfGtUiOshyKMWd7HBxy4BiUPMyCGhC1n1FQwYRI=;
 b=XiKJ2LQpo4bCSlPA0guTZuDbAXbYvvKXdB/0G/S+4fq5khTt/lOqS67qXjI8qfsSdolyEv
 hUUdDM0lOq+TkvAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLksGfGtUiOshyKMWd7HBxy4BiUPMyCGhC1n1FQwYRI=;
 b=SZjsgKZaq8MczjtkMNjH6SNAe6ETUs9+J/VD/sEGGgS2S5uYrN/NvGQUXC+d1Cb8blO/TK
 fvg440xd3GBsvt+xkGUtsLxIx6beF/SMEskFs2Lq7TwFIWrKAGP3u526znfMie86ZmeudW
 cWgTjF2JYyunAQBKFKTkwAMJ3d6+t6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162280;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLksGfGtUiOshyKMWd7HBxy4BiUPMyCGhC1n1FQwYRI=;
 b=XiKJ2LQpo4bCSlPA0guTZuDbAXbYvvKXdB/0G/S+4fq5khTt/lOqS67qXjI8qfsSdolyEv
 hUUdDM0lOq+TkvAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D4A81386E;
 Tue, 24 Sep 2024 07:18:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oKMtJahn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:18:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v5 70/80] drm/vboxvideo: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:08 +0200
Message-ID: <20240924071734.98201-71-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The vboxvideo driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vboxvideo/Kconfig    | 1 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vboxvideo/Kconfig b/drivers/gpu/drm/vboxvideo/Kconfig
index 45fe135d6e43..180e30b82ab9 100644
--- a/drivers/gpu/drm/vboxvideo/Kconfig
+++ b/drivers/gpu/drm/vboxvideo/Kconfig
@@ -2,6 +2,7 @@
 config DRM_VBOXVIDEO
 	tristate "Virtual Box Graphics Card"
 	depends on DRM && X86 && PCI
+	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	select DRM_TTM
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index ef36834c8673..49dc337b3e01 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_file.h>
@@ -80,7 +81,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto err_irq_fini;
 
-	drm_fbdev_ttm_setup(&vbox->ddev, 32);
+	drm_client_setup(&vbox->ddev, NULL);
 
 	return 0;
 
@@ -193,6 +194,7 @@ static const struct drm_driver driver = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 
 	DRM_GEM_VRAM_DRIVER,
+	DRM_FBDEV_TTM_DRIVER_OPS,
 };
 
 drm_module_pci_driver_if_modeset(vbox_pci_driver, vbox_modeset);
-- 
2.46.0

