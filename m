Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BD7229B5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ED710E2CF;
	Mon,  5 Jun 2023 14:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5457E10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1F4921B72;
 Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IPv0LcB/KR9amQatic4dj9dYr0rrctL8g04cJxaOqA=;
 b=PvQgnf7xF8mqDAh4wqFPqeNtV69voQ29WMSffauLX/ATIfkqYuXsGLpeRVhN9/70/4LqFs
 9wsRe8GWGCMJ1gEZWzm0SIHsTIEhhvEHX5s0LxClKRrtLsAygPSKNipDqqe9HJP6EDpW26
 zLP10W93wAqIxBRj4f575jYOrRgP5p4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IPv0LcB/KR9amQatic4dj9dYr0rrctL8g04cJxaOqA=;
 b=M0AQtyoigFAOVZpW5mUOi+uKFvZY/DVYx2m6NlM7nzi8drQ4/NKqKwxP1V4SNoCSlHt2tk
 aSRW2d3BFh6yVIDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A36EF139C8;
 Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MNUAJ7X1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 24/30] fbdev/core: Pass Linux device to pm_vt_switch_*()
 functions
Date: Mon,  5 Jun 2023 16:48:06 +0200
Message-Id: <20230605144812.15241-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-sh@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass the Linux device to pm_vt_switch_*() instead of the virtual
fbdev device. Prepares fbdev for making struct fb_info.dev optional.

The type of device that is passed to the PM functions does not matter
much. It is only a token within the internal list of known devices.
The PM functions do not refer to any of the device's properties or its
type.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-pm@vger.kernel.org
---
 drivers/video/fbdev/core/fbmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 329d16e49a90..f91ae7d4c94d 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1478,9 +1478,9 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 		INIT_LIST_HEAD(&fb_info->modelist);
 
 	if (fb_info->skip_vt_switch)
-		pm_vt_switch_required(fb_info->dev, false);
+		pm_vt_switch_required(fb_info->device, false);
 	else
-		pm_vt_switch_required(fb_info->dev, true);
+		pm_vt_switch_required(fb_info->device, true);
 
 	fb_var_to_videomode(&mode, &fb_info->var);
 	fb_add_videomode(&mode, &fb_info->modelist);
@@ -1520,7 +1520,7 @@ static void unlink_framebuffer(struct fb_info *fb_info)
 
 	device_destroy(fb_class, MKDEV(FB_MAJOR, i));
 
-	pm_vt_switch_unregister(fb_info->dev);
+	pm_vt_switch_unregister(fb_info->device);
 
 	unbind_console(fb_info);
 
-- 
2.40.1

