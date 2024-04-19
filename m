Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52128AAA90
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC69010FE50;
	Fri, 19 Apr 2024 08:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CQBbgGNX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QPRfHRGk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CQBbgGNX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QPRfHRGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3694F10FE15
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:33:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF8D737584;
 Fri, 19 Apr 2024 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713515619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9hYtMFbhq6fQ1WjYfnz27Em6Q+Mruq723U9xjEAy9o=;
 b=CQBbgGNXncA7FeKiPdmUwBdOWaUwyRQwZ6rgJ5JRkR/kRnW/IHCRYNwEguVClZivBG90XA
 98zznj2Jy1zyDWJmGzPPV7dB02DvuAZzMqq4POzg5Tft5uOwsodI+x/Q8/MMuy9wUIBBcG
 8J5a9WDDbkNJDxOEODiLrOP1MMbHi7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713515619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9hYtMFbhq6fQ1WjYfnz27Em6Q+Mruq723U9xjEAy9o=;
 b=QPRfHRGkogmZt2hwlux4KBB157BeNJUregCxDcChxEDBrRTTO/J4vZWR/1IvlDw5nGGR/5
 9Zysc7toyxvpe/Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713515619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9hYtMFbhq6fQ1WjYfnz27Em6Q+Mruq723U9xjEAy9o=;
 b=CQBbgGNXncA7FeKiPdmUwBdOWaUwyRQwZ6rgJ5JRkR/kRnW/IHCRYNwEguVClZivBG90XA
 98zznj2Jy1zyDWJmGzPPV7dB02DvuAZzMqq4POzg5Tft5uOwsodI+x/Q8/MMuy9wUIBBcG
 8J5a9WDDbkNJDxOEODiLrOP1MMbHi7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713515619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9hYtMFbhq6fQ1WjYfnz27Em6Q+Mruq723U9xjEAy9o=;
 b=QPRfHRGkogmZt2hwlux4KBB157BeNJUregCxDcChxEDBrRTTO/J4vZWR/1IvlDw5nGGR/5
 9Zysc7toyxvpe/Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99AFF13687;
 Fri, 19 Apr 2024 08:33:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ML9pJGMsImb9agAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 15/43] drm/tiny/gm12u320: Use fbdev-shmem
Date: Fri, 19 Apr 2024 10:29:08 +0200
Message-ID: <20240419083331.7761-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419083331.7761-1-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 0187539ff5eaa..8b4efd39d7c41 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -13,7 +13,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
@@ -699,7 +699,7 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (ret)
 		goto err_put_device;
 
-	drm_fbdev_generic_setup(dev, 0);
+	drm_fbdev_shmem_setup(dev, 0);
 
 	return 0;
 
-- 
2.44.0

