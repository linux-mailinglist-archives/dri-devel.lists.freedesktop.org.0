Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF176B0FB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92A310E39E;
	Tue,  1 Aug 2023 10:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D18010E3AF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:15:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C89A61F8A3;
 Tue,  1 Aug 2023 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690884955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OizvOV+KGhq1cUeg0Ziu/m3hWWoPLFNF2+FFf00vsg=;
 b=ZoHnHfcInQBTtO/VrcaJpKmYnOrqQQPEoRRhW0/lWibZpV1O8qWQmY8QvaEJ9cDL30uDrH
 imDnH7iIRNmDUi1fdzpPZFhgzLVayGRYYEsghzB7cea9Koo/QnJsxFgLzsOLd1q8G15wT/
 Qbq3y8fhDSsVYza4rQ4G7DpqFyZTFPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690884955;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OizvOV+KGhq1cUeg0Ziu/m3hWWoPLFNF2+FFf00vsg=;
 b=kR78RlOr9dLeYKfhw8X8qz+e+0UJCfUN0+wUDg1IP9BpJpfM3RF/y8Cy3p1CAEtdseNUBU
 kM6UDK6G6E2/6PCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9320B139C8;
 Tue,  1 Aug 2023 10:15:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +NgLI1vbyGQBXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 10:15:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 34/47] fbdev/pxa168fb: Use fbdev I/O helpers
Date: Tue,  1 Aug 2023 12:13:39 +0200
Message-ID: <20230801101541.900-35-tzimmermann@suse.de>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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
---
 drivers/video/fbdev/Kconfig    | 4 +---
 drivers/video/fbdev/pxa168fb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index eeaf82880bb3..329b57c173ad 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1572,9 +1572,7 @@ config FB_PXA168
 	tristate "PXA168/910 LCD framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on CPU_PXA168 || CPU_PXA910 || COMPILE_TEST
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for the built-in LCD controller in the Marvell
 	  MMP processor.
diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index 790aa231a593..adee34386580 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -543,14 +543,12 @@ static irqreturn_t pxa168fb_handle_irq(int irq, void *dev_id)
 
 static const struct fb_ops pxa168fb_ops = {
 	.owner		= THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var	= pxa168fb_check_var,
 	.fb_set_par	= pxa168fb_set_par,
 	.fb_setcolreg	= pxa168fb_setcolreg,
 	.fb_blank	= pxa168fb_blank,
 	.fb_pan_display	= pxa168fb_pan_display,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 };
 
 static void pxa168fb_init_mode(struct fb_info *info,
-- 
2.41.0

