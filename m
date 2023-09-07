Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89F797107
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6443610E795;
	Thu,  7 Sep 2023 08:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4446410E79B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:54:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF84621865;
 Thu,  7 Sep 2023 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694076850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41o/btvw9C5S0iA1yowHnm0gHWjgAAVogrPERtBT9GA=;
 b=PKTYaL/v/ZaN8PPLd2WqAmWUhDE5coJWqhLuQ9pROo9OQdTloob56ywQFvoOVLfnKzaXmB
 YoVZMBcJ30UXp8bB8IwX+AUygAknUqrbtfeSB276LWFYZ2wHwNBw7gXAU5ZYabD2uvcXxT
 S60ZPlhuZ/vmT0o9HFBI5HoLejAwjiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694076850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41o/btvw9C5S0iA1yowHnm0gHWjgAAVogrPERtBT9GA=;
 b=hwMwz5AFFPjhFriVqWD4zEyh9RdjaKlIu9wN8cD9VBP5RKAmY/KWnbFss/oEOkMB61pxMe
 oIAYtxjBjenH11Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B237F138FA;
 Thu,  7 Sep 2023 08:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sLtQKrKP+WT6JgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:54:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] fbdev/mmp/mmpfb: Do not display boot-up logo
Date: Thu,  7 Sep 2023 10:52:01 +0200
Message-ID: <20230907085408.9354-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907085408.9354-1-tzimmermann@suse.de>
References: <20230907085408.9354-1-tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbcon module takes care of displaying the logo, if any. Remove
the code form mmpfb. It is probably no tworking as expected, as it
interferes with the framebuffer console. If we want to display the
logo without fbcon, we should implement this in the fbdev core code.

v2:
	* add a note on fbcon interference (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/mmp/fb/mmpfb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/mmp/fb/mmpfb.c b/drivers/video/fbdev/mmp/fb/mmpfb.c
index 42a87474bcea..2d9797c6fb3e 100644
--- a/drivers/video/fbdev/mmp/fb/mmpfb.c
+++ b/drivers/video/fbdev/mmp/fb/mmpfb.c
@@ -628,13 +628,6 @@ static int mmpfb_probe(struct platform_device *pdev)
 	dev_info(fbi->dev, "loaded to /dev/fb%d <%s>.\n",
 		info->node, info->fix.id);
 
-#ifdef CONFIG_LOGO
-	if (fbi->fb_start) {
-		fb_prepare_logo(info, 0);
-		fb_show_logo(info, 0);
-	}
-#endif
-
 	return 0;
 
 failed_clear_info:
-- 
2.42.0

