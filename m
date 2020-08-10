Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC342416AE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0626B6E135;
	Tue, 11 Aug 2020 06:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73BC89998
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:59:55 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id p8so5434950pgn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=puMAU16yPRJjcWrBBbirtIhNXaGIaRb087rXL9a93dY=;
 b=dXiBXr6E0TYKVe5evLcBJVsXAmowNxpsmGxjs5usDMfgqZiDNBp07ub/f1J2Tn/lk2
 30Ye7V77uvvn1d0xyyH5N2KwzDyNy9YtTyjXu8Oe3mZCf7acoTgeg0D/c40WRn+Zx9AV
 YLh5bOGmIOHuunBZ9CmRl1j+pacYeNhMpghSYprgJ0CXYtd1LoEF3oWPBVWQHhRsaKCA
 S21MN1pNfEesIxslEGmKrp4RxeHSa8TUV5B1G8NmqfyDxQ29+o1xJjwPATWw8JzzEJ/4
 7AhZwkOz205ia1OGQv1FWyDyUwl+tx+hfZzMKwVUv7GQQk8IVLRv5L/oqa8cPkKNYE/y
 pbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=puMAU16yPRJjcWrBBbirtIhNXaGIaRb087rXL9a93dY=;
 b=XShHumKJdf1iLj3BuA4FSygolsey/+ZFeRJEwYpl7ZgHgdyZcgzt2OVISXopb900z3
 xvztGh7CaP1ZcXBlde1rKXZEpLWSOEMBJhzH2Q3MAiASZbeeSvpGhg5O/WPxz/2W0XWZ
 U9b8U/m/OnV98G6V8ewMosvRWzof036X26fdm8pulC6gbjb0PkRNlX4a91gDcDAz8E3L
 BoqAnoPUb/iZ1iWTVUAVsU7CbBNa6k28rXL/zVT8VTykefSojAEqAkFg/WtXLzj/GYUn
 E58AGIonsGxssY0+UG7Ca0c5JzOBnvBc3PZ9L0C55+1mmhcHGKTjajYU4UC3miAH4i8M
 wnCA==
X-Gm-Message-State: AOAM530x5euLRWUlz9fPnK+vlZG4jqXNnGpa1wL0x0hNROQZ0xWOWxfs
 flsNei2+F3geqtBNSojnLso=
X-Google-Smtp-Source: ABdhPJw/8SWq4UyW3sAzJltPdzA+52NELmb6lAQ+XEPrB165bwZBbAYZXhx32FFAx3Jit3f0k7T6fQ==
X-Received: by 2002:a63:aa04:: with SMTP id e4mr7515802pgf.318.1597085995343; 
 Mon, 10 Aug 2020 11:59:55 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:59:54 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 05/12] fbdev: aty128fb: use generic power management
Date: Tue, 11 Aug 2020 00:27:16 +0530
Message-Id: <20200810185723.15540-6-vaibhavgupta40@gmail.com>
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
 drivers/video/fbdev/aty/aty128fb.c | 51 ++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index d05d4195acad..dd7762fea058 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -162,10 +162,22 @@ static char * const r128_family[] = {
 static int aty128_probe(struct pci_dev *pdev,
                                const struct pci_device_id *ent);
 static void aty128_remove(struct pci_dev *pdev);
-static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state);
-static int aty128_pci_resume(struct pci_dev *pdev);
+static int aty128_pci_suspend_late(struct device *dev, pm_message_t state);
+static int __maybe_unused aty128_pci_suspend(struct device *dev);
+static int __maybe_unused aty128_pci_hibernate(struct device *dev);
+static int __maybe_unused aty128_pci_freeze(struct device *dev);
+static int __maybe_unused aty128_pci_resume(struct device *dev);
 static int aty128_do_resume(struct pci_dev *pdev);
 
+static const struct dev_pm_ops aty128_pci_pm_ops = {
+	.suspend	= aty128_pci_suspend,
+	.resume		= aty128_pci_resume,
+	.freeze		= aty128_pci_freeze,
+	.thaw		= aty128_pci_resume,
+	.poweroff	= aty128_pci_hibernate,
+	.restore	= aty128_pci_resume,
+};
+
 /* supported Rage128 chipsets */
 static const struct pci_device_id aty128_pci_tbl[] = {
 	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RAGE128_LE,
@@ -272,8 +284,7 @@ static struct pci_driver aty128fb_driver = {
 	.id_table	= aty128_pci_tbl,
 	.probe		= aty128_probe,
 	.remove		= aty128_remove,
-	.suspend	= aty128_pci_suspend,
-	.resume		= aty128_pci_resume,
+	.driver.pm	= &aty128_pci_pm_ops,
 };
 
 /* packed BIOS settings */
@@ -2320,7 +2331,6 @@ static int aty128fb_ioctl(struct fb_info *info, u_int cmd, u_long arg)
 static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 {
 	u32	pmgt;
-	struct pci_dev *pdev = par->pdev;
 
 	if (!par->pdev->pm_cap)
 		return;
@@ -2347,23 +2357,15 @@ static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 		aty_st_le32(BUS_CNTL1, 0x00000010);
 		aty_st_le32(MEM_POWER_MISC, 0x0c830000);
 		msleep(100);
-
-		/* Switch PCI power management to D2 */
-		pci_set_power_state(pdev, PCI_D2);
 	}
 }
 
-static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int aty128_pci_suspend_late(struct device *dev, pm_message_t state)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info = pci_get_drvdata(pdev);
 	struct aty128fb_par *par = info->par;
 
-	/* Because we may change PCI D state ourselves, we need to
-	 * first save the config space content so the core can
-	 * restore it properly on resume.
-	 */
-	pci_save_state(pdev);
-
 	/* We don't do anything but D2, for now we return 0, but
 	 * we may want to change that. How do we know if the BIOS
 	 * can properly take care of D3 ? Also, with swsusp, we
@@ -2422,6 +2424,21 @@ static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
+static int __maybe_unused aty128_pci_suspend(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused aty128_pci_hibernate(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused aty128_pci_freeze(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_FREEZE);
+}
+
 static int aty128_do_resume(struct pci_dev *pdev)
 {
 	struct fb_info *info = pci_get_drvdata(pdev);
@@ -2468,12 +2485,12 @@ static int aty128_do_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-static int aty128_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused aty128_pci_resume(struct device *dev)
 {
 	int rc;
 
 	console_lock();
-	rc = aty128_do_resume(pdev);
+	rc = aty128_do_resume(to_pci_dev(dev));
 	console_unlock();
 
 	return rc;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
