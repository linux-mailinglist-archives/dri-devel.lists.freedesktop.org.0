Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395976B14B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA4610E3CF;
	Tue,  1 Aug 2023 10:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A4A10E389
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:16:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3EEA51FD69;
 Tue,  1 Aug 2023 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690884959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRPE/2mQ7YcskaqoFAf6vDbof386gHH0uPRvKyWn4WU=;
 b=sMml8PRU8QnbrlC7ow1CAmh9DMbDNnxLbHjbNlCvKsit6ZF9hLuBX4cTtgahowDDOK088L
 EI3TaYKmhrP+DvBcVnq8TH/+7kXrX8yQdvm9eRblfrBuRhRZ+7EpWfktFDzFbkS3hfHe4I
 bqcOB2C8L8fTPKZAnBxGe1ITMRKPVmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690884959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRPE/2mQ7YcskaqoFAf6vDbof386gHH0uPRvKyWn4WU=;
 b=4npM65/rP7OZChcw1psEm8RwjJJlg8jCIRmPnCBtctCj87/h+dHSCwy3oZZSBe/4tTlr8t
 GQ9n/JYLmJP+R8Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01792139BD;
 Tue,  1 Aug 2023 10:15:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ICfdOl7byGQBXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 10:15:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 47/47] vfio-dev/mdpy-fb: Use fbdev I/O helpers
Date: Tue,  1 Aug 2023 12:13:52 +0200
Message-ID: <20230801101541.900-48-tzimmermann@suse.de>
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
 Kirti Wankhede <kwankhede@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>
---
 samples/Kconfig             | 4 +---
 samples/vfio-mdev/mdpy-fb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index bf49ed0d7362..b0ddf5f36738 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -210,9 +210,7 @@ config SAMPLE_VFIO_MDEV_MDPY
 config SAMPLE_VFIO_MDEV_MDPY_FB
 	tristate "Build VFIO mdpy example guest fbdev driver"
 	depends on FB
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	help
 	  Guest fbdev driver for the virtual display sample driver.
 
diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index cda477b28685..4598bc28acd9 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -88,11 +88,9 @@ static void mdpy_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops mdpy_fb_ops = {
 	.owner		= THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_destroy	= mdpy_fb_destroy,
 	.fb_setcolreg	= mdpy_fb_setcolreg,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 };
 
 static int mdpy_fb_probe(struct pci_dev *pdev,
-- 
2.41.0

