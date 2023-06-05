Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09394722942
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079410E2B1;
	Mon,  5 Jun 2023 14:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748CA10E2B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22F121FD76;
 Mon,  5 Jun 2023 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCx/dUe5OxwgFGTh2cN0tz4CX+UMv9VY6aqqNukRliQ=;
 b=hX+RpPR6FQKJCa5vubNQMMVx/SXeS8/2r/DXXXzZ+2DK27tyFIMq8hwkcNPqnC4cchqWsj
 mmtxVKNfpcCIbpgab4cuWtEaoLpfSLqRdHUm8PsRvxhPkqDreQ0SGnyt91D9xIc1Qvbqgj
 cbVTOqtOPJN5BgFP524GbsVWFmY+ffE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCx/dUe5OxwgFGTh2cN0tz4CX+UMv9VY6aqqNukRliQ=;
 b=miI5026hEzMTKuCL4Uy7gHQ6G5JVR3CJ8Sv6nQheM3LmwtnvSh+sDC6tTmwFl7TAy89Mjs
 buAZxivqDsrSnhAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6C88139C8;
 Mon,  5 Jun 2023 14:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yIKLM6/1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 04/30] fbdev/atyfb: Reorder backlight and framebuffer
 init/cleanup
Date: Mon,  5 Jun 2023 16:47:46 +0200
Message-Id: <20230605144812.15241-5-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the init and cleanup calls for
both data structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/aty/atyfb_base.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index cba2b113b28b..51504fe39054 100644
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
2.40.1

