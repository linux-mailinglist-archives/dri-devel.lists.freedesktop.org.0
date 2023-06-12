Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362972C778
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4B310E269;
	Mon, 12 Jun 2023 14:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EA210E254
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:13:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BC3222838;
 Mon, 12 Jun 2023 14:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686579237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlVcmvzQv7LlXsgvsBhpy1neAHLfhVIo6jMpaCVHhbM=;
 b=wUxmfirh6VNkcGRn6mKsulbVu7QH8bYevkHyb0yYz8XOtHUU9lQb9UBbLCe2ra5EFuFeAI
 GHLtlmCFTLzGg7xPsoaPpwUKAz9MWA+jd429AluaVrvtYWo6PdjACsDUN8HgPDjNZsJt3b
 /St0XSCdNwukFwRgPZzlj0KmoO1X94A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686579237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlVcmvzQv7LlXsgvsBhpy1neAHLfhVIo6jMpaCVHhbM=;
 b=B8siKHLL2vcweQADuS5kOj3W2q2DepX36jW8jW9Pcc4DwS/BlKpty2EBbvgi9gWuZe+Lgs
 5sZmH38mKQTYHsBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D06C51357F;
 Mon, 12 Jun 2023 14:13:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sNXyMSQoh2RwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:13:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v2 07/38] fbdev/atyfb: Reorder backlight and framebuffer
 init/cleanup
Date: Mon, 12 Jun 2023 16:07:45 +0200
Message-ID: <20230612141352.29939-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
References: <20230612141352.29939-1-tzimmermann@suse.de>
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
---
 drivers/video/fbdev/aty/atyfb_base.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index cba2b113b28b0..51504fe39054c 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2654,11 +2654,6 @@ static int aty_init(struct fb_info *info)
 			   USE_F32KHZ | TRISTATE_MEM_EN, par);
 	} else
 #endif
-	if (M64_HAS(MOBIL_BUS) && backlight) {
-#ifdef CONFIG_FB_ATY_BACKLIGHT
-		aty_bl_init(par);
-#endif
-	}
 
 	memset(&var, 0, sizeof(var));
 #ifdef CONFIG_PPC
@@ -2751,6 +2746,12 @@ static int aty_init(struct fb_info *info)
 		goto aty_init_exit;
 	}
 
+	if (M64_HAS(MOBIL_BUS) && backlight) {
+#ifdef CONFIG_FB_ATY_BACKLIGHT
+		aty_bl_init(par);
+#endif
+	}
+
 	fb_list = info;
 
 	PRINTKI("fb%d: %s frame buffer device on %s\n",
@@ -3716,12 +3717,13 @@ static void atyfb_remove(struct fb_info *info)
 	aty_set_crtc(par, &par->saved_crtc);
 	par->pll_ops->set_pll(info, &par->saved_pll);
 
-	unregister_framebuffer(info);
-
 #ifdef CONFIG_FB_ATY_BACKLIGHT
 	if (M64_HAS(MOBIL_BUS))
 		aty_bl_exit(info->bl_dev);
 #endif
+
+	unregister_framebuffer(info);
+
 	arch_phys_wc_del(par->wc_cookie);
 
 #ifndef __sparc__
-- 
2.41.0

