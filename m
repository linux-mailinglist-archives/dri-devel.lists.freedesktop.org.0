Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1C078C756
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D12910E341;
	Tue, 29 Aug 2023 14:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABA410E338
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:21:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F37A32185F;
 Tue, 29 Aug 2023 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693318889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AflgOAYTtEUtMKQLysXvACzGCyW8TUedsKSeZsJeZOQ=;
 b=cq8X5NuSSyzfgxosSvcRklTtNwaVTxXHmI/XYlc2UmWKQKTN8ixJNdiXjY6HM09v8vn8rV
 VrKzfss8wdd2jQr8LI1lQiDT9iskNVtj47lrK13RWxwe6UQTPWHRWW2Yp115RsbbVOgjeM
 /6RR5ORXFefGeJZuG09GHnIU92y2FQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693318889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AflgOAYTtEUtMKQLysXvACzGCyW8TUedsKSeZsJeZOQ=;
 b=CVS2f+Xw2RXolsCSwuEXZ7p2xKclocsdMi3n6bT+FJKm/qvp4VDYW1TjPx3dzGNM9OviRl
 54D3HbScTEZPtLCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1C5B13909;
 Tue, 29 Aug 2023 14:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kB1vLuj+7WREewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 29 Aug 2023 14:21:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] fbdev/au1200fb: Do not display boot-up logo
Date: Tue, 29 Aug 2023 16:15:40 +0200
Message-ID: <20230829142109.4521-2-tzimmermann@suse.de>
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

The fbcon module takes care of displaying the logo, if any. Remove
the code form au1200fb. If we want to display the logo without fbcon,
we should implement this in the fbdev core code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/au1200fb.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index c137d6afe484..98afd385c49c 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1719,15 +1719,6 @@ static int au1200fb_drv_probe(struct platform_device *dev)
 		}
 
 		au1200fb_fb_set_par(fbi);
-
-#if !defined(CONFIG_FRAMEBUFFER_CONSOLE) && defined(CONFIG_LOGO)
-		if (plane == 0)
-			if (fb_prepare_logo(fbi, FB_ROTATE_UR)) {
-				/* Start display and show logo on boot */
-				fb_set_cmap(&fbi->cmap, fbi);
-				fb_show_logo(fbi, FB_ROTATE_UR);
-			}
-#endif
 	}
 
 	/* Now hook interrupt too */
-- 
2.41.0

