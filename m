Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611F9717E9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4292010E47C;
	Mon,  9 Sep 2024 11:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WpD05+/z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9hnAN7sJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WpD05+/z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9hnAN7sJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0F610E446;
 Mon,  9 Sep 2024 11:36:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE2961FC9E;
 Mon,  9 Sep 2024 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skAxtcucEFRdtHYzjA7T6PEbLSi7X3Lykvix50EiRLs=;
 b=WpD05+/zXauy5uq2iXnMQeXDEfeVwWBnkYf1j+SBbhOfs2d1xnxzzJLlNrlEKOiV0//r1g
 0tGs0GP1kOEf5lyHvCidFHD9lzcqvsebjg0Mxo58ZeSwH7tevo/FGBU725U1liUh+YGGz/
 DLvf5LMASqG6sXqZTHjcg3IEp7tvj/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skAxtcucEFRdtHYzjA7T6PEbLSi7X3Lykvix50EiRLs=;
 b=9hnAN7sJAwgT1bcuoM+9F6v/bPhd27L/ucKYmT22Iu5y2lF05nt/jKflkOtEroVYNVW9Fr
 gqAqxUg+ie0+FuDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="WpD05+/z";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9hnAN7sJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skAxtcucEFRdtHYzjA7T6PEbLSi7X3Lykvix50EiRLs=;
 b=WpD05+/zXauy5uq2iXnMQeXDEfeVwWBnkYf1j+SBbhOfs2d1xnxzzJLlNrlEKOiV0//r1g
 0tGs0GP1kOEf5lyHvCidFHD9lzcqvsebjg0Mxo58ZeSwH7tevo/FGBU725U1liUh+YGGz/
 DLvf5LMASqG6sXqZTHjcg3IEp7tvj/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skAxtcucEFRdtHYzjA7T6PEbLSi7X3Lykvix50EiRLs=;
 b=9hnAN7sJAwgT1bcuoM+9F6v/bPhd27L/ucKYmT22Iu5y2lF05nt/jKflkOtEroVYNVW9Fr
 gqAqxUg+ie0+FuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EB3C13B01;
 Mon,  9 Sep 2024 11:36:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UDvmFdrd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:36:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 53/80] drm/gm12u320: Run DRM default client setup
Date: Mon,  9 Sep 2024 13:30:59 +0200
Message-ID: <20240909113633.595465-54-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE2961FC9E
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
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc),to(RLbwen1niosrcqbxsafh1)];
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 0bd7707c053e..0c17ae532fb4 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
@@ -632,6 +633,7 @@ static const struct drm_driver gm12u320_drm_driver = {
 	.fops		 = &gm12u320_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 	.gem_prime_import = gm12u320_gem_prime_import,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
 static const struct drm_mode_config_funcs gm12u320_mode_config_funcs = {
@@ -706,7 +708,7 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (ret)
 		goto err_put_device;
 
-	drm_fbdev_shmem_setup(dev, 0);
+	drm_client_setup(dev, NULL);
 
 	return 0;
 
-- 
2.46.0

