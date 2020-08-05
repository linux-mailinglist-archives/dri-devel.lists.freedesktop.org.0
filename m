Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800A23D78C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F496E88C;
	Thu,  6 Aug 2020 07:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D6E6E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 18:10:28 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id k18so15970562pfp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lTR8Lgo0lTVr30kAgGXldRLjSzJrurZ+/TCCEqZVqLQ=;
 b=gub5BhXgKIwql1fVHMrX+4usvSKCyg4lEY8j+g0tftBKI6jTK++/xJ98ikhyonQevY
 DcLYyqAawxEpy1H9uh0ctJVCOSy6DVB6UbVaYPu9jY0G0ktlVkw+X21iaOWak94jrsje
 YpxQ1fTAdY0T9Q0qSVuWXq6A+0isRy8zZ0NbEA/o/9TfA02w/0zGNY4LVR5gUeAxm3lO
 8US9cWJrqi3g6NL79G5wBUNN423vu40M3SuAnMfxpaGrVwO3QHs/RrIFY2aILq3cLCZJ
 2nkBJ7O1LJb9mDA+yk7c7Acv7rxDBePnN5iZBw9YWWV39K2npVI8Oyx0SV3i3w2TrFXu
 Ejdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lTR8Lgo0lTVr30kAgGXldRLjSzJrurZ+/TCCEqZVqLQ=;
 b=UbMDRFpZB9b8J/G1lpkWrQLDa1PYNmlze7BNMKvvQbrt6VzJ8P1AdV3lNsBKZbDeDp
 v2aNvH+9qLBv9JMe0Za3IBse3u5QwYJDx/8xdLcvqanEWxECDPKCMdOItshEAjHsoKu/
 fjO2Gc9IhJNUGduvYuQleM17FdoBhheVm0BTfBfU9m0z9ylJKahICj2D8M6db77L9OfO
 3G8Xz0SxW0TIpBIAE1f7IQ8sFieZaR7xKqUAcsyfk9HD2cLWLvFjXKIkcBsGxU8Wvo0D
 9rX/8/wnTDnMlcQQrBMS9v+WCi2WL7QmHUIgBxdW674trVKc+mIF8Oe92dXRNIpkDrlZ
 QLcQ==
X-Gm-Message-State: AOAM530OPpweoChUDmNWEjJjLfKi55+dg9Nqyz34ZtDxSjDHykxvkbMb
 U+zBrLVRXuN79iDtnI27llI=
X-Google-Smtp-Source: ABdhPJyAAqO7Rx5av7I1iXkiEYPek0iKwQgNUn4/m4VcSnNpdaU7uE7GLjNluwPRQgTfUc24ejyZ3w==
X-Received: by 2002:a63:330c:: with SMTP id z12mr4150629pgz.46.1596651028426; 
 Wed, 05 Aug 2020 11:10:28 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t63sm4977510pfb.210.2020.08.05.11.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:10:27 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Mackerras <paulus@samba.org>, Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>, Antonino Daplas <adaplas@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v1 11/12] fbdev: s3fb: use generic power management
Date: Wed,  5 Aug 2020 23:37:21 +0530
Message-Id: <20200805180722.244008-12-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
References: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/s3fb.c | 39 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 60c424fae988..5c74253e7b2c 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1410,9 +1410,9 @@ static void s3_pci_remove(struct pci_dev *dev)
 
 /* PCI suspend */
 
-static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
+static int __maybe_unused s3_pci_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct s3fb_info *par = info->par;
 
 	dev_info(info->device, "suspend\n");
@@ -1420,7 +1420,7 @@ static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
 	console_lock();
 	mutex_lock(&(par->open_lock));
 
-	if ((state.event == PM_EVENT_FREEZE) || (par->ref_count == 0)) {
+	if (par->ref_count == 0) {
 		mutex_unlock(&(par->open_lock));
 		console_unlock();
 		return 0;
@@ -1428,10 +1428,6 @@ static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
 
 	fb_set_suspend(info, 1);
 
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
 	mutex_unlock(&(par->open_lock));
 	console_unlock();
 
@@ -1441,11 +1437,10 @@ static int s3_pci_suspend(struct pci_dev* dev, pm_message_t state)
 
 /* PCI resume */
 
-static int s3_pci_resume(struct pci_dev* dev)
+static int __maybe_unused s3_pci_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct s3fb_info *par = info->par;
-	int err;
 
 	dev_info(info->device, "resume\n");
 
@@ -1458,17 +1453,6 @@ static int s3_pci_resume(struct pci_dev* dev)
 		return 0;
 	}
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-	err = pci_enable_device(dev);
-	if (err) {
-		mutex_unlock(&(par->open_lock));
-		console_unlock();
-		dev_err(info->device, "error %d enabling device for resume\n", err);
-		return err;
-	}
-	pci_set_master(dev);
-
 	s3fb_set_par(info);
 	fb_set_suspend(info, 0);
 
@@ -1478,6 +1462,16 @@ static int s3_pci_resume(struct pci_dev* dev)
 	return 0;
 }
 
+static const struct dev_pm_ops s3_pci_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= s3_pci_suspend,
+	.resume		= s3_pci_resume,
+	.freeze		= NULL,
+	.thaw		= s3_pci_resume,
+	.poweroff	= s3_pci_suspend,
+	.restore	= s3_pci_resume,
+#endif
+};
 
 /* List of boards that we are trying to support */
 
@@ -1510,8 +1504,7 @@ static struct pci_driver s3fb_pci_driver = {
 	.id_table	= s3_devices,
 	.probe		= s3_pci_probe,
 	.remove		= s3_pci_remove,
-	.suspend	= s3_pci_suspend,
-	.resume		= s3_pci_resume,
+	.driver.pm	= &s3_pci_pm_ops,
 };
 
 /* Parse user specified options */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
