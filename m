Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18424AFDD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FCC6E8F3;
	Thu, 20 Aug 2020 07:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738CF6E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 18:59:25 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 128so11843200pgd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SwW9DvsaTVzEe8rYytiBA176ZEm49NeUyegN/TvZxk=;
 b=YSsPXgdbsE6HMZQBWbvHa516SeqorDSP49+EHMEd67zIXPQeYtQtmOAjF56GHZ4ENC
 Xes44b5QftvrU0bHvqmBY/RJBqIT/mqJOJMuwq5oR550n1Dt39WkwKAtb56Jp/BNpapU
 n5xcaM+eXqCMXR11855GweHH4jxNv8qQVFzY8PxtYAY32anTsYLwg42iteXgiQv3cVoH
 jyaR9706HrP9cwbBlREmMl7vs9xrggzmsyU2mJgfjvc/r1XVeumsdfG61K8EDi+P9Vx0
 xOhdUfcyDgzEOOsSKCza8JUml+9+kIoZ2cc/CG4h5ByYWhQfiFmQ0so34lSoaOfYBJV1
 kbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6SwW9DvsaTVzEe8rYytiBA176ZEm49NeUyegN/TvZxk=;
 b=BV8sCLysnYW2Uxwm2OVb7062fAfHFhtiSvLlcoij4aYKlTfe0c+PjdJ6vNm5EaH9ZN
 6lhMpxMbIYkHo3DkHLT2byQeZJ3lRUDGcS0fkSZRJRPL6T3y4TL6ye76RfY3KoTCntQ/
 vWXT4rsMYiUHODM0deybLe2ekmoSGWuTimQ1PXX6ltP1bxDMsfeZgckEcl6p7MRMTRjW
 Qoy+IumYVF8BJSNq/fAiFJaJxhXNFPN70FvlphZVo1+UtXuIjd49iAZ4zY1C7p2imLLP
 3o2vOslmAklC/Qprtb1qJk1zcFPc0cTtrKWQo/HeRizd7Lkyu3wKS84DD3rBNL2rI6ZE
 nAtw==
X-Gm-Message-State: AOAM533lESfSrdCfLZ3J7ZIyd7jLSoLGnEAMko95XZ6ma6YNk9epOIfV
 HfkTlme9J73zcrKNSLMmD2gNtCSle3CWT511
X-Google-Smtp-Source: ABdhPJzlZoB9mX9uX/0f4umZ3wploRhwn9d7X9NR1Pk93n4y87Cd9Zl8KupRYvEiMnjWyJTmoxrHHQ==
X-Received: by 2002:aa7:8757:: with SMTP id g23mr20042724pfo.283.1597863564965; 
 Wed, 19 Aug 2020 11:59:24 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:59:24 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v3 04/12] fbdev: aty: use generic power management
Date: Thu, 20 Aug 2020 00:26:46 +0530
Message-Id: <20200819185654.151170-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

Now,
- atyfb_pci_suspend() had a "pm_message_t" type parameter as per legacy
  PCI PM framework, that got deprecated in generic.
- Rename the callback as atyfb_pci_suspend_late() and preserve the
  parameter.
- Define 3 new callbacks as:
        * atyfb_pci_suspend()
        * atyfb_pci_freeze()
        * atyfb_pci_hibernate()
  which in turn call atyfb_pci_suspend_late() by passing appropriate
  value for "pm_message_t" type parameter.
- Bind the callbacks in "struct dev_pm_ops" type variable
  "atyfb_pci_pm_ops".

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/aty/atyfb_base.c | 50 ++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index b0ac895e5ac9..a24d5bf6ade1 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -132,8 +132,8 @@
 #define PRINTKI(fmt, args...)	printk(KERN_INFO "atyfb: " fmt, ## args)
 #define PRINTKE(fmt, args...)	printk(KERN_ERR "atyfb: " fmt, ## args)
 
-#if defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || \
-defined (CONFIG_FB_ATY_GENERIC_LCD) || defined(CONFIG_FB_ATY_BACKLIGHT)
+#if defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_GENERIC_LCD) || \
+defined(CONFIG_FB_ATY_BACKLIGHT)
 static const u32 lt_lcd_regs[] = {
 	CNFG_PANEL_LG,
 	LCD_GEN_CNTL_LG,
@@ -175,7 +175,7 @@ u32 aty_ld_lcd(int index, const struct atyfb_par *par)
 		return aty_ld_le32(LCD_DATA, par);
 	}
 }
-#endif /* defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) */
+#endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) */
 
 #ifdef CONFIG_FB_ATY_GENERIC_LCD
 /*
@@ -1994,7 +1994,7 @@ static int atyfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 
 
 
-#if defined(CONFIG_PM) && defined(CONFIG_PCI)
+#if defined(CONFIG_PCI)
 
 #ifdef CONFIG_PPC_PMAC
 /* Power management routines. Those are used for PowerBook sleep.
@@ -2055,8 +2055,9 @@ static int aty_power_mgmt(int sleep, struct atyfb_par *par)
 }
 #endif /* CONFIG_PPC_PMAC */
 
-static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int atyfb_pci_suspend_late(struct device *dev, pm_message_t state)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info = pci_get_drvdata(pdev);
 	struct atyfb_par *par = (struct atyfb_par *) info->par;
 
@@ -2082,7 +2083,6 @@ static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	 * first save the config space content so the core can
 	 * restore it properly on resume.
 	 */
-	pci_save_state(pdev);
 
 #ifdef CONFIG_PPC_PMAC
 	/* Set chip to "suspend" mode */
@@ -2094,8 +2094,6 @@ static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 		console_unlock();
 		return -EIO;
 	}
-#else
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 #endif
 
 	console_unlock();
@@ -2105,6 +2103,21 @@ static int atyfb_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
+static int __maybe_unused atyfb_pci_suspend(struct device *dev)
+{
+	return atyfb_pci_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused atyfb_pci_hibernate(struct device *dev)
+{
+	return atyfb_pci_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused atyfb_pci_freeze(struct device *dev)
+{
+	return atyfb_pci_suspend_late(dev, PMSG_FREEZE);
+}
+
 static void aty_resume_chip(struct fb_info *info)
 {
 	struct atyfb_par *par = info->par;
@@ -2119,8 +2132,9 @@ static void aty_resume_chip(struct fb_info *info)
 			aty_ld_le32(BUS_CNTL, par) | BUS_APER_REG_DIS, par);
 }
 
-static int atyfb_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused atyfb_pci_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info = pci_get_drvdata(pdev);
 	struct atyfb_par *par = (struct atyfb_par *) info->par;
 
@@ -2162,7 +2176,18 @@ static int atyfb_pci_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /*  defined(CONFIG_PM) && defined(CONFIG_PCI) */
+static const struct dev_pm_ops atyfb_pci_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= atyfb_pci_suspend,
+	.resume		= atyfb_pci_resume,
+	.freeze		= atyfb_pci_freeze,
+	.thaw		= atyfb_pci_resume,
+	.poweroff	= atyfb_pci_hibernate,
+	.restore	= atyfb_pci_resume,
+#endif /* CONFIG_PM_SLEEP */
+};
+
+#endif /*  defined(CONFIG_PCI) */
 
 /* Backlight */
 #ifdef CONFIG_FB_ATY_BACKLIGHT
@@ -3801,10 +3826,7 @@ static struct pci_driver atyfb_driver = {
 	.id_table	= atyfb_pci_tbl,
 	.probe		= atyfb_pci_probe,
 	.remove		= atyfb_pci_remove,
-#ifdef CONFIG_PM
-	.suspend	= atyfb_pci_suspend,
-	.resume		= atyfb_pci_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &atyfb_pci_pm_ops,
 };
 
 #endif /* CONFIG_PCI */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
