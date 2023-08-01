Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE376B0F6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2199310E39B;
	Tue,  1 Aug 2023 10:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FF710E390
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:15:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A7901F8B6;
 Tue,  1 Aug 2023 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690884949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfu/BvusoLnQiuFzOL/HlwH4+5mMt3+lbLontKoD3iw=;
 b=dlFl/SzWWi5cJNuX2zYtvEUuJXwnl3/nsd9fr30doKtmbrkaJXiQgM5hYGhLqpYyX8DcPK
 3nnTOn4jNwoE43ZlpGeRT8R7U6xNrPDAWxwlJKNTJVH3fzbsLoq5oTQs7bJQC/pKQVeIcU
 nugasWT72I+mQIzsy0RSAZOV14KYDF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690884949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfu/BvusoLnQiuFzOL/HlwH4+5mMt3+lbLontKoD3iw=;
 b=GMPNmlDBzG1SFib/bWFyL1pX/SLVgtLdK+jaESqmFEXRB1jcGSAz89mbFKDorM2+u7L80M
 4NC+Q7N0DdLoDUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E1D3139BD;
 Tue,  1 Aug 2023 10:15:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UMhVClXbyGQBXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 10:15:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 09/47] fbdev/efifb: Use fbdev I/O helpers
Date: Tue,  1 Aug 2023 12:13:14 +0200
Message-ID: <20230801101541.900-10-tzimmermann@suse.de>
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
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Cc: Peter Jones <pjones@redhat.com>
---
 drivers/video/fbdev/Kconfig | 4 +---
 drivers/video/fbdev/efifb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index e57588c144de..be7c99154d32 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -486,9 +486,7 @@ config FB_EFI
 	depends on (FB = y) && !IA64 && EFI
 	select APERTURE_HELPERS
 	select DRM_PANEL_ORIENTATION_QUIRKS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	select SYSFB
 	help
 	  This is the EFI frame buffer device driver. If the firmware on
diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 3391c8e84210..f9b4ddd592ce 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -277,11 +277,9 @@ static void efifb_destroy(struct fb_info *info)
 
 static const struct fb_ops efifb_ops = {
 	.owner		= THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_destroy	= efifb_destroy,
 	.fb_setcolreg	= efifb_setcolreg,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 };
 
 static int efifb_setup(char *options)
-- 
2.41.0

