Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30F76B131
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E8910E3BD;
	Tue,  1 Aug 2023 10:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A6510E389
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:15:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 30C5221E55;
 Tue,  1 Aug 2023 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690884958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAhtzaImVo4a7QybNxVag4SIV09Pt1dofcuqo/ty/8g=;
 b=sar1QIL7xEC+cKuLcxsa+bFlju6Rl9Bf9cvbF153kTJ9FpgXzqqCBAR+p2uv8CIro9pWYi
 RUX3VSHXwfigV9CqTKytn+Jlk89b3G0ctnzEha4Hyzw9kxee5+1yqYnKeH2D+BDYTlym26
 i4SoiZxgdvTlGueUr9qLWMI1K1q73iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690884958;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAhtzaImVo4a7QybNxVag4SIV09Pt1dofcuqo/ty/8g=;
 b=sQ/TynwTaCPZk36GygulxJuRxaYI/1KvuMOJ8+/1+Ac3UI9TJvEmca0ilgX/OJSzrAuH6l
 IeKrRiHqQ3wVoaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEAAB139C8;
 Tue,  1 Aug 2023 10:15:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SCdvNV3byGQBXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 10:15:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 43/47] fbdev/uvesafb: Use fbdev I/O helpers
Date: Tue,  1 Aug 2023 12:13:48 +0200
Message-ID: <20230801101541.900-44-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801101541.900-1-tzimmermann@suse.de>
References: <20230801101541.900-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Michal Januszewski <spock@gentoo.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set struct fb_ops and with FB_DEFAULT_IO_OPS, fbdev's initializer
for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
Select the correct modules with Kconfig's FB_IO_HELPERS token.

The macro and token set the currently selected values, so there is
no functional change.

v2:
	* updated to use _IOMEM_ tokens

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Helge Deller <deller@gmx.de>
Cc: Michal Januszewski <spock@gentoo.org>
---
 drivers/video/fbdev/Kconfig   | 4 +---
 drivers/video/fbdev/uvesafb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index f5ce8d6d1247..e6ca54347272 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -438,9 +438,7 @@ config FB_UVESA
 	tristate "Userspace VESA VGA graphics support"
 	depends on FB && CONNECTOR
 	depends on !UML
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	select FB_MODE_HELPERS
 	help
 	  This is the frame buffer driver for generic VBE 2.0 compliant
diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index df2574d4ff30..a1a67830fbbc 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1416,13 +1416,11 @@ static struct fb_ops uvesafb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= uvesafb_open,
 	.fb_release	= uvesafb_release,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_setcolreg	= uvesafb_setcolreg,
 	.fb_setcmap	= uvesafb_setcmap,
 	.fb_pan_display	= uvesafb_pan_display,
 	.fb_blank	= uvesafb_blank,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 	.fb_check_var	= uvesafb_check_var,
 	.fb_set_par	= uvesafb_set_par,
 };
-- 
2.41.0

