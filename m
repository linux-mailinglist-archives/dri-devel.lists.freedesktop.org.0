Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE2B965BE8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23A910EA04;
	Fri, 30 Aug 2024 08:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="viSxzArb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yHLpme8a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ooyNSFPl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ijq7ySi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5C910E937;
 Fri, 30 Aug 2024 08:45:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A38FA1F7CB;
 Fri, 30 Aug 2024 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTu3mH18SqX4UwUi4CO1R036/TuN7XPOiF7r9318ZIo=;
 b=viSxzArbizrKyb+P2JT2tOShVFYGLyi8oPY9oTOYWPsyM4A78eKW5aGdlrPKQd7hayOYEz
 htVrouVWJdjRrHNiYhf9cWF0yvusQpzFcxs8NvjBubVkD9DDhJySmTquvKxkELl8nJX2dX
 8Zw5Axgcl8HI9faHPCpooqDLY4VSzsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTu3mH18SqX4UwUi4CO1R036/TuN7XPOiF7r9318ZIo=;
 b=yHLpme8aSXsbmIhkB4t24gZYq9Z+LOJNMMlZ/49Z/jHx0PUDlKG2hozALpZjXrnYkuknEV
 /usDbLlqclik86CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTu3mH18SqX4UwUi4CO1R036/TuN7XPOiF7r9318ZIo=;
 b=ooyNSFPld8OBjN7Nuzqzmi71Aho8eMGY73UlGdQlKcBRkpdxI/hechONN+Q2c0X3zbzIFH
 dxUsm6bbLUuczzTIW4F+jhTjb/Aa63IP/GeDQi4+Ctx5/CVXK0e7GHFO7dP/xzN5BR53iW
 atcND+lYUxj41QFNcSJ0AdtXAlOkJAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007520;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTu3mH18SqX4UwUi4CO1R036/TuN7XPOiF7r9318ZIo=;
 b=0ijq7ySis0WEEn4BrA4tqu0omNyKzbRgIOE2FxZJPdv6YxJAokCM5rp8aP/5uu/C1nqxjb
 NiSORk/hBrTTi0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48E1E13A69;
 Fri, 30 Aug 2024 08:45:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uNyMEKCG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v3 62/81] drm/vkms: Run DRM default client setup
Date: Fri, 30 Aug 2024 10:40:46 +0200
Message-ID: <20240830084456.77630-63-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.80
X-Spamd-Result: default: False [-5.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[14]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,riseup.net];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email, riseup.net:email,
 imap1.dmz-prg2.suse.org:helo]
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: "Maíra Canal" <mairacanal@riseup.net>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0c1a713b7b7b..2d1e95cb66e5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
@@ -112,6 +113,7 @@ static const struct drm_driver vkms_driver = {
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
@@ -225,7 +227,7 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
-	drm_fbdev_shmem_setup(&vkms_device->drm, 0);
+	drm_client_setup(&vkms_device->drm, NULL);
 
 	return 0;
 
-- 
2.46.0

