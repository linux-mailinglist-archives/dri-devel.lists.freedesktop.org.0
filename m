Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A822C2416AD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6CE6E134;
	Tue, 11 Aug 2020 06:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10768999C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 19:00:12 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o1so5540388plk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mzrXpDqX5i6vQZwjLr9S3RbpzEaKALa8Egnl+iixcM=;
 b=KO+/AjBTIwJEYPClBBf++vl71rCcmJ6mVDRfCXBJWqjCIwlWBlZVjNwoLJDK0XKw0J
 KN1e/UyOXJAsM2VUeFpXLMM6ud22P/z6v/vYXN+O/LKJNGBk0AC3l3TrCiFw8SnHFVP4
 gt4CE3k7Nr6fBjXgtRPWoRJwEcxY2BW1c6b3pMvhoti86z0RlVEVUsvrnkIfuFuS8LmU
 KsoXacgTEcozPBXOnWR8DAo5Rp1vbsr0KhvWKeEEVJKceJUHj4bVB48DCjeILPxd6jvo
 GRIfTX7Sw0nNtnZ3Ji6MoDu0fbhjq20+lgDqGpNl/CNSxN9QBCnJ66NGElsHEFDpBZt2
 yUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mzrXpDqX5i6vQZwjLr9S3RbpzEaKALa8Egnl+iixcM=;
 b=BpNrEmm9D3ux9H+NDLkpk9PiZRcn+r4+Be+cdWd1nVRO8WCWFJKvsGwQj7GahAqKZh
 oi/PUcSC4cb0uHhr3UmqGwMjOSVvA7e58+GXkWihkLUxNG41hJ5KMQDyX0uu8bX2JAr3
 tsU7QM9IYRWeGqY2aZqQzLJlbzjK8LUzTAI41lYgpU6k2lNkGqhULq34on7tdN2ltkqP
 ekVlOBdhWuGF4YuUD/gSXoaJmF3mEPVFA+C+B48jib3z3W/RYl0y7IZDvM3GgY9J464I
 fB7yPxfsEOeLtst2sMvTrT/ui73t8w/fq4FS61E76/yQ4D264HyKajw+c5IlrGgvVoxr
 2XxA==
X-Gm-Message-State: AOAM532/ks2JkhszhPOP54WXao+r9XjdROmOD11oMigWX+eZD1tp64d9
 zE/xRD8gON9uRwyRSTW1ZAA=
X-Google-Smtp-Source: ABdhPJw0ejL2XMFYue6TPVCj5nsTa/sv61cNxlaGSOGH2vUT0Pg61qnaVXZudCp2WQgRwKmPh13J1Q==
X-Received: by 2002:a17:90a:f98e:: with SMTP id
 cq14mr719824pjb.51.1597086012300; 
 Mon, 10 Aug 2020 12:00:12 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 07/12] fbdev: savagefb: use generic power management
Date: Tue, 11 Aug 2020 00:27:18 +0530
Message-Id: <20200810185723.15540-8-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200810185723.15540-1-vaibhavgupta40@gmail.com>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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

Drivers should do only device-specific jobs. But in general, drivers using
legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
PM-related tasks themselves which can be done by PCI Core itself. This
brings extra load on the driver and it directly calls PCI helper functions
to handle them.

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
unnecessary calls to the PCI Helper functions along with the legacy
.suspend & .resume bindings.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/savage/savagefb_driver.c | 52 ++++++++++++--------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 3c8ae87f0ea7..d6aae759e90f 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2346,9 +2346,9 @@ static void savagefb_remove(struct pci_dev *dev)
 	}
 }
 
-static int savagefb_suspend(struct pci_dev *dev, pm_message_t mesg)
+static int savagefb_suspend_late(struct device *dev, pm_message_t mesg)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct savagefb_par *par = info->par;
 
 	DBG("savagefb_suspend");
@@ -2356,7 +2356,7 @@ static int savagefb_suspend(struct pci_dev *dev, pm_message_t mesg)
 	if (mesg.event == PM_EVENT_PRETHAW)
 		mesg.event = PM_EVENT_FREEZE;
 	par->pm_state = mesg.event;
-	dev->dev.power.power_state = mesg;
+	dev->power.power_state = mesg;
 
 	/*
 	 * For PM_EVENT_FREEZE, do not power down so the console
@@ -2374,17 +2374,29 @@ static int savagefb_suspend(struct pci_dev *dev, pm_message_t mesg)
 	savagefb_blank(FB_BLANK_POWERDOWN, info);
 	savage_set_default_par(par, &par->save);
 	savage_disable_mmio(par);
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, mesg));
 	console_unlock();
 
 	return 0;
 }
 
-static int savagefb_resume(struct pci_dev* dev)
+static int __maybe_unused savagefb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	return savagefb_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused savagefb_hibernate(struct device *dev)
+{
+	return savagefb_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused savagefb_freeze(struct device *dev)
+{
+	return savagefb_suspend_late(dev, PMSG_FREEZE);
+}
+
+static int __maybe_unused savagefb_resume(struct device *dev)
+{
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct savagefb_par *par = info->par;
 	int cur_state = par->pm_state;
 
@@ -2396,20 +2408,11 @@ static int savagefb_resume(struct pci_dev* dev)
 	 * The adapter was not powered down coming back from a
 	 * PM_EVENT_FREEZE.
 	 */
-	if (cur_state == PM_EVENT_FREEZE) {
-		pci_set_power_state(dev, PCI_D0);
+	if (cur_state == PM_EVENT_FREEZE)
 		return 0;
-	}
 
 	console_lock();
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-
-	if (pci_enable_device(dev))
-		DBG("err");
-
-	pci_set_master(dev);
 	savage_enable_mmio(par);
 	savage_init_hw(par);
 	savagefb_set_par(info);
@@ -2420,6 +2423,16 @@ static int savagefb_resume(struct pci_dev* dev)
 	return 0;
 }
 
+static const struct dev_pm_ops savagefb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= savagefb_suspend,
+	.resume		= savagefb_resume,
+	.freeze		= savagefb_freeze,
+	.thaw		= savagefb_resume,
+	.poweroff	= savagefb_hibernate,
+	.restore	= savagefb_resume,
+#endif
+};
 
 static const struct pci_device_id savagefb_devices[] = {
 	{PCI_VENDOR_ID_S3, PCI_CHIP_SUPSAV_MX128,
@@ -2500,8 +2513,7 @@ static struct pci_driver savagefb_driver = {
 	.name =     "savagefb",
 	.id_table = savagefb_devices,
 	.probe =    savagefb_probe,
-	.suspend =  savagefb_suspend,
-	.resume =   savagefb_resume,
+	.driver.pm = &savagefb_pm_ops,
 	.remove =   savagefb_remove,
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
