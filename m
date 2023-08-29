Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A185378C754
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C14010E33C;
	Tue, 29 Aug 2023 14:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6427910E336
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:21:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FA9A21868;
 Tue, 29 Aug 2023 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693318890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHmbIqd2sUALnEdDnM2WVScGsOEczoZHYPBc5JTP918=;
 b=PfvisSyWAL9Y8TeZyN6Vve4T4Dgaj2MONj/yPeYxYzyjMAm39+B7qbPjls2cJbZkp4KCP4
 y2a0TZ/tag79lMIdQE3xY9hgw/5hLaE52Agocvkf0j2Upt6lKsNX89ZgtkYwZGc478chlO
 8iGBmAZ0E3eYPwgoyU9SHww2F7aqwvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693318890;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHmbIqd2sUALnEdDnM2WVScGsOEczoZHYPBc5JTP918=;
 b=idXwFnO1J6W1bIilkvJvrMvOfP/0NENujLUqkulomqjNYdPNsvrDFbcaO4eyey7eQCN7cO
 Bfnwqa8LPPvekuBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8075138E2;
 Tue, 29 Aug 2023 14:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IBfgM+n+7WREewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 29 Aug 2023 14:21:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] fbdev/core: Remove empty internal helpers from fb_logo.c
Date: Tue, 29 Aug 2023 16:15:45 +0200
Message-ID: <20230829142109.4521-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829142109.4521-1-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
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

Remove the two empty helpers for the case the CONFIG_FB_LOGO_EXTRA
has not been set. They are internal functions and only called once.
Providing empty replacements seems like overkill. Instead protect
the call sites with a test for CONFIG_FB_LOGO_EXTRA.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_logo.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_logo.c b/drivers/video/fbdev/core/fb_logo.c
index cde0a330b2ad..9cff78332858 100644
--- a/drivers/video/fbdev/core/fb_logo.c
+++ b/drivers/video/fbdev/core/fb_logo.c
@@ -412,21 +412,6 @@ static int fb_show_extra_logos(struct fb_info *info, int y, int rotate)
 
 	return y;
 }
-
-#else /* !CONFIG_FB_LOGO_EXTRA */
-
-static inline int fb_prepare_extra_logos(struct fb_info *info,
-					 unsigned int height,
-					 unsigned int yres)
-{
-	return height;
-}
-
-static inline int fb_show_extra_logos(struct fb_info *info, int y, int rotate)
-{
-	return y;
-}
-
 #endif /* CONFIG_FB_LOGO_EXTRA */
 
 int fb_prepare_logo(struct fb_info *info, int rotate)
@@ -497,8 +482,11 @@ int fb_prepare_logo(struct fb_info *info, int rotate)
 	height = fb_logo.logo->height;
 	if (fb_center_logo)
 		height += (yres - fb_logo.logo->height) / 2;
+#ifdef CONFIG_FB_LOGO_EXTRA
+	height = fb_prepare_extra_logos(info, height, yres);
+#endif
 
-	return fb_prepare_extra_logos(info, height, yres);
+	return height;
 }
 EXPORT_SYMBOL(fb_prepare_logo);
 
@@ -512,7 +500,9 @@ int fb_show_logo(struct fb_info *info, int rotate)
 
 	count = fb_logo_count < 0 ? num_online_cpus() : fb_logo_count;
 	y = fb_show_logo_line(info, rotate, fb_logo.logo, 0, count);
+#ifdef CONFIG_FB_LOGO_EXTRA
 	y = fb_show_extra_logos(info, y, rotate);
+#endif
 
 	return y;
 }
-- 
2.41.0

