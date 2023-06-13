Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590C72E06B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D9810E377;
	Tue, 13 Jun 2023 11:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C296B10E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 695741FD94;
 Tue, 13 Jun 2023 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wf5UN+K9UcAVy1mCANrZvQ9x0IpdyWlrVw1Wkiccp8=;
 b=Nu/aaOrslrM66/21iVrUsUCTXmyWGejYdEvhVWbTTvejZLW0RsRzMAtIu6mGfqNZcsAXGI
 iAiAj7DCMQrNNHZuzZgD/XlwL1HuyoBnngarP8OoEqOIy64fGBuTm90nmmf7NOqyl/1Res
 MYcgZO01fxU02q7NWciFY3UvE/GGZxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wf5UN+K9UcAVy1mCANrZvQ9x0IpdyWlrVw1Wkiccp8=;
 b=Awwnl0APnI49QzRWeWfRYyXqXzgxWh+3sTo9xLumKCBpYeAMn/D3FEgF3jDsENtzq83I7o
 +poLwx6OQms4x9DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26C7013A47;
 Tue, 13 Jun 2023 11:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mGrCCIdOiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:09:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 09/38] fbdev/aty128fb: Reorder backlight and framebuffer
 init/cleanup
Date: Tue, 13 Jun 2023 13:06:44 +0200
Message-ID: <20230613110953.24176-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the init and cleanup calls for
both data structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/aty/aty128fb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 36a9ac05a340f..b4a49068a522f 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2028,14 +2028,14 @@ static int aty128_init(struct pci_dev *pdev, const struct pci_device_id *ent)
 	par->asleep = 0;
 	par->lock_blank = 0;
 
+	if (register_framebuffer(info) < 0)
+		return 0;
+
 #ifdef CONFIG_FB_ATY128_BACKLIGHT
 	if (backlight)
 		aty128_bl_init(par);
 #endif
 
-	if (register_framebuffer(info) < 0)
-		return 0;
-
 	fb_info(info, "%s frame buffer device on %s\n",
 		info->fix.id, video_card);
 
@@ -2167,12 +2167,12 @@ static void aty128_remove(struct pci_dev *pdev)
 
 	par = info->par;
 
-	unregister_framebuffer(info);
-
 #ifdef CONFIG_FB_ATY128_BACKLIGHT
 	aty128_bl_exit(info->bl_dev);
 #endif
 
+	unregister_framebuffer(info);
+
 	arch_phys_wc_del(par->wc_cookie);
 	iounmap(par->regbase);
 	iounmap(info->screen_base);
-- 
2.41.0

