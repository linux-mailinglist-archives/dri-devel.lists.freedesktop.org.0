Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C3F19750C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9169489F49;
	Mon, 30 Mar 2020 07:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7506E159
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 14:58:47 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ng8so6392232pjb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8BcxV8pGWJr7R5GyeodoBfbjlgHj70bMVXWL1P/PRiA=;
 b=c9/0eKER41JmgTmkyLd4o0N090jCq6vEQVUWvqTldbNa/noBczXdbXylNqfn+9GDH+
 WGXuLdCTMG//pUS+UM8lEUR7MA5baNxvn2KWJWrJr06077S5i9dmGx2pU9iPCmlo4QhD
 cfyv9CJ5k8xLLoLOtzWh+bDRd76EN+7xuXlvkJDBFjZUxcyr2C+wiy1FA4GLjFod2sTA
 AXv3wdotCT3B5p6HfqEMT2hGMGIhEI9LcAOzL6NmVT9wX5P6aQW/lyoljBuQw70u8AdB
 Elc0qoUk6G7T5WEE4P4HifwYr+DwOyjh+v/bDwiACJG52nZTYo4hEJ5UADrMe7UG8P4e
 qelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8BcxV8pGWJr7R5GyeodoBfbjlgHj70bMVXWL1P/PRiA=;
 b=bjMdVnQTRDtnmi/4pby2GSSN1TL8f5Uvh/PUmb0eeK7gphknN7KZwlOyQrfZRj0Gmh
 O8s1GZQnmvR3w0EN7VZ4wZ3KEjTpFHElw3oPWhfbRxaa/GRPza/GDv6FXaaT/gDP3FzM
 d67GFmo1Z2UZmiS5wonRV/FiwrydBb+J88SKrUCj5FSNGCPF16PyiAwpUSI9xijpenZ6
 a1QdmP0hC4T97A16SQtlC1AqyMyPRmGxWFb/R1dxL10/kaJGzHBUS/Vo+OgGAk4IIgjN
 aeWGXXqkrFJRRhxk00E2UjvmYQHrhp1Z5QOzd2uwV1kXch4aUvPVr5Z+g4Tw0bGlT+dD
 iLOA==
X-Gm-Message-State: AGi0PuaKRjGXzPNvIZNgbrKJgukjyxi2CkYS++4vdNZcSmcLOAhqa8iO
 737fGb5PfGx70wY7djBkpFw=
X-Google-Smtp-Source: APiQypJeUUa8fwtqNZ7WFemPga2cu7l9NOhSfiE3izJjKXKkOQ1zmtu+VGTFwmE2NCLNG6icNn1Bwg==
X-Received: by 2002:a17:90a:be18:: with SMTP id
 a24mr3578860pjs.92.1585493927244; 
 Sun, 29 Mar 2020 07:58:47 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id j65sm7883215pgc.16.2020.03.29.07.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 07:58:46 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v4] video: fbdev: vesafb: add missed release_region
Date: Sun, 29 Mar 2020 22:58:39 +0800
Message-Id: <20200329145839.20076-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: linux-fbdev@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver forgets to free the I/O region in remove and probe
failure.
Add the missed calls to fix it.

Since the success of request_region() is optional, add the "region" field
in vesafb_par to represent whether request_region() succeeds.
Then only call release_region() when "region" is not null.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v4:
  - Add a field in vesafb_par to represent whether request_region() succeeds.
  - Only call release_region() when request_region() succeeds.
  - Adjust the order in the error handler of probe.
  - Modify commit message.

 drivers/video/fbdev/vesafb.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index a1fe24ea869b..df6de5a9dd4c 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -32,6 +32,7 @@
 struct vesafb_par {
 	u32 pseudo_palette[256];
 	int wc_cookie;
+	struct resource *region;
 };
 
 static struct fb_var_screeninfo vesafb_defined = {
@@ -411,7 +412,7 @@ static int vesafb_probe(struct platform_device *dev)
 
 	/* request failure does not faze us, as vgacon probably has this
 	 * region already (FIXME) */
-	request_region(0x3c0, 32, "vesafb");
+	par->region = request_region(0x3c0, 32, "vesafb");
 
 	if (mtrr == 3) {
 		unsigned int temp_size = size_total;
@@ -439,7 +440,7 @@ static int vesafb_probe(struct platform_device *dev)
 		       "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
 			vesafb_fix.smem_len, vesafb_fix.smem_start);
 		err = -EIO;
-		goto err;
+		goto err_release_region;
 	}
 
 	printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
@@ -458,19 +459,22 @@ static int vesafb_probe(struct platform_device *dev)
 
 	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
 		err = -ENOMEM;
-		goto err;
+		goto err_release_region;
 	}
 	if (register_framebuffer(info)<0) {
 		err = -EINVAL;
 		fb_dealloc_cmap(&info->cmap);
-		goto err;
+		goto err_release_region;
 	}
 	fb_info(info, "%s frame buffer device\n", info->fix.id);
 	return 0;
-err:
+err_release_region:
 	arch_phys_wc_del(par->wc_cookie);
 	if (info->screen_base)
 		iounmap(info->screen_base);
+	if (par->region)
+		release_region(0x3c0, 32);
+err:
 	framebuffer_release(info);
 	release_mem_region(vesafb_fix.smem_start, size_total);
 	return err;
@@ -481,6 +485,8 @@ static int vesafb_remove(struct platform_device *pdev)
 	struct fb_info *info = platform_get_drvdata(pdev);
 
 	unregister_framebuffer(info);
+	if (((struct vesafb_par *)(info->par))->region)
+		release_region(0x3c0, 32);
 	framebuffer_release(info);
 
 	return 0;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
