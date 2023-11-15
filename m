Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811FB7EC090
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9310E526;
	Wed, 15 Nov 2023 10:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695EA10E51C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 10:29:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A677A204DF;
 Wed, 15 Nov 2023 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700044196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8aA2UVQ0+uOj5ji+nYMEChAgeirex99KBxEC+pZenE=;
 b=Hxp26XAavlawNZTjMKVxhpgXKik1tUdK3KXXHLGd5cuMF02bstsjzW3IYv7xoHo3lzHf8S
 q03buNDlZdqnhzCThZTEtya5Jv9AHK9WzYWWP8Tgd9Lg9ZvwcMw840RtVE46b/Sh3728XJ
 udQy9LRkMEDR7dZBHe9e0LJySfy9nbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700044196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8aA2UVQ0+uOj5ji+nYMEChAgeirex99KBxEC+pZenE=;
 b=edU6q5daEgr2LapNWKla7oJMD5OcHfeAfCq+3OoM3/jSAo5sB/qWP0Dvf6ggl/+7M3Gn6p
 oF/gu4yJofTPjPBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C3E5139B7;
 Wed, 15 Nov 2023 10:29:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJVRHaSdVGV+UAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:29:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 01/32] fbdev/acornfb: Fix name of fb_ops initializer macro
Date: Wed, 15 Nov 2023 11:19:06 +0100
Message-ID: <20231115102954.7102-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115102954.7102-1-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.10
X-Spamd-Result: default: False [-3.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_MISSING_CHARSET(2.50)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[12.29%]
X-Spam-Flag: NO
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix build by using the correct name for the initializer macro
for struct fb_ops.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 9037afde8b9d ("fbdev/acornfb: Use fbdev I/O helpers")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: <stable@vger.kernel.org> # v6.6+
---
 drivers/video/fbdev/acornfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
index 163d2c9f951c3..f0600f6ca2548 100644
--- a/drivers/video/fbdev/acornfb.c
+++ b/drivers/video/fbdev/acornfb.c
@@ -605,7 +605,7 @@ acornfb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 
 static const struct fb_ops acornfb_ops = {
 	.owner		= THIS_MODULE,
-	FB_IOMEM_DEFAULT_OPS,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var	= acornfb_check_var,
 	.fb_set_par	= acornfb_set_par,
 	.fb_setcolreg	= acornfb_setcolreg,
-- 
2.42.0

