Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F92767490
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8C110E751;
	Fri, 28 Jul 2023 18:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C9710E224
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:22:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2753D1F8B4;
 Fri, 28 Jul 2023 18:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690568561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+Acam4lsZrH6+NJFaeV8zlf921nEuytKS0upCUiKng=;
 b=YpW0qPRQOP9izTwr6v4F6JrMh4k53Qqjg3RhjI0xldGw6p1baeBghtPsEwngJz7unyOwHs
 S1aWedU+5mbhN0g9dmgsBd8vZyT28/M71CydYXueOkmga/H+6O02rp0/ddqqW8iBCYE+wV
 9qT1rcx1WWkBEoVDMrMwwW6E+GmGRgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690568561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+Acam4lsZrH6+NJFaeV8zlf921nEuytKS0upCUiKng=;
 b=LrcKbzHrp0gAbv6PdU32jSbXuxPZYo8CEP01uSv5QQJQBtuLQS2OMtphP66FadRi7g3/uM
 QWmMGAFW3/lY/JAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5B6B13276;
 Fri, 28 Jul 2023 18:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EFEmN3AHxGQ3CwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jul 2023 18:22:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH 19/47] fbdev/i740fb: Use fbdev I/O helpers
Date: Fri, 28 Jul 2023 18:40:02 +0200
Message-ID: <20230728182234.10680-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728182234.10680-1-tzimmermann@suse.de>
References: <20230728182234.10680-1-tzimmermann@suse.de>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set struct fb_ops and with FB_DEFAULT_IO_OPS, fbdev's initializer
for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
Select the correct modules with Kconfig's FB_IO_HELPERS token.

The macro and token set the currently selected values, so there is
no functional change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig  | 4 +---
 drivers/video/fbdev/i740fb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 2484235ac117..9e0f7910283e 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -809,10 +809,8 @@ config FB_RIVA_BACKLIGHT
 config FB_I740
 	tristate "Intel740 support"
 	depends on FB && PCI
+	select FB_IO_HELPERS
 	select FB_MODE_HELPERS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select VGASTATE
 	select VIDEO_NOMODESET
 	select FB_DDC
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 3f5becfe9fd5..df9ab7d2a42d 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -994,14 +994,12 @@ static const struct fb_ops i740fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= i740fb_open,
 	.fb_release	= i740fb_release,
+	FB_DEFAULT_IO_OPS,
 	.fb_check_var	= i740fb_check_var,
 	.fb_set_par	= i740fb_set_par,
 	.fb_setcolreg	= i740fb_setcolreg,
 	.fb_blank	= i740fb_blank,
 	.fb_pan_display	= i740fb_pan_display,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 };
 
 /* ------------------------------------------------------------------------- */
-- 
2.41.0

