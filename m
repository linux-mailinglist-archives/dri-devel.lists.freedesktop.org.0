Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4168224169B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385586E106;
	Tue, 11 Aug 2020 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6865789AEE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 19:00:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id k18so6127538pfp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUB+rA3wMgyIGCTgDMTDExS1DTdL7k930vthzu2b58I=;
 b=Ef7/XI6fXp2PdOxr7kRX47309hXJcNbM4NqFwiRvuciUILVKoTxZjSAF4uICpm6euz
 2BN5Vy5ogfx/lcIwuk8Ue20WASNEkJXthoHnQ3FgGXtdTO/d8FWdxfLIbrWwO038bdL7
 h/CykS470RoIf8oW7CJOk0IycTobYDdd3MDciM39KC7SPyQSgEpKavf3vLL2EILk01/E
 okP9VZFtNxIS6Abu5JVjtxtvx5/9uFBGhizqpC7SGjDi4/ECicadSN1GHRuu8hKC6KJ/
 Q4/n/ov/5jioDN+gpDIra1uQadVW0eS9VVsYGeka0qL9LRbSkOUHHoixo0+glJ4RvhLS
 IfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vUB+rA3wMgyIGCTgDMTDExS1DTdL7k930vthzu2b58I=;
 b=gyrYUdQxG4ThHnskVy00++AZZh3tgkETQieGnI2ZD3tZAbi8fv1NGU1YV0pB35MRAl
 809+tygN9+/kmIxLKDYzqGuJcCMXgUdNAWWqXiPqiUT5xyccFjB9rzCzHxumWpHq6T6m
 cyxYT2SGcE25MN+K4baEFa0CDZVrtyQkb0HQaapBYvRydyBLMQa+gAAcc/v67KUSQ3e6
 XerfeIk5Gjt4mv3NP7Xx61XKsMGv7nkL4pUGHls9RPgkpr04LiLu6g1aZgX09AIvXfJR
 0nKk6LzuhxwI0hc/cNW3u7wgVSiDh2iBjfb07mh6Ed6StN9OwU2EKqpmKz5/3Etgu58I
 oycg==
X-Gm-Message-State: AOAM531fkmkYLainGncP0dAdyozciAKAUE/HQDp4Zs0tnXrS33GU+8At
 F7n/UFNWgQuLdvRAyy2wajg=
X-Google-Smtp-Source: ABdhPJxEmlFDCZfhZX0GJe9P/FvsH260+WSzBurbLHgA3ag3KBCOkHuX9/WWHwNw2rTdcLEYiEeGvQ==
X-Received: by 2002:a62:1a49:: with SMTP id a70mr2488335pfa.297.1597086048906; 
 Mon, 10 Aug 2020 12:00:48 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:48 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 12/12] fbdev: arkfb: use generic power management
Date: Tue, 11 Aug 2020 00:27:23 +0530
Message-Id: <20200810185723.15540-13-vaibhavgupta40@gmail.com>
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
 drivers/video/fbdev/arkfb.c | 41 +++++++++++++++----------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 11ab9a153860..6a4114db0dfd 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1085,12 +1085,11 @@ static void ark_pci_remove(struct pci_dev *dev)
 }
 
 
-#ifdef CONFIG_PM
 /* PCI suspend */
 
-static int ark_pci_suspend (struct pci_dev* dev, pm_message_t state)
+static int __maybe_unused ark_pci_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct arkfb_info *par = info->par;
 
 	dev_info(info->device, "suspend\n");
@@ -1098,7 +1097,7 @@ static int ark_pci_suspend (struct pci_dev* dev, pm_message_t state)
 	console_lock();
 	mutex_lock(&(par->open_lock));
 
-	if ((state.event == PM_EVENT_FREEZE) || (par->ref_count == 0)) {
+	if (par->ref_count == 0) {
 		mutex_unlock(&(par->open_lock));
 		console_unlock();
 		return 0;
@@ -1106,10 +1105,6 @@ static int ark_pci_suspend (struct pci_dev* dev, pm_message_t state)
 
 	fb_set_suspend(info, 1);
 
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
 	mutex_unlock(&(par->open_lock));
 	console_unlock();
 
@@ -1119,9 +1114,9 @@ static int ark_pci_suspend (struct pci_dev* dev, pm_message_t state)
 
 /* PCI resume */
 
-static int ark_pci_resume (struct pci_dev* dev)
+static int __maybe_unused ark_pci_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct arkfb_info *par = info->par;
 
 	dev_info(info->device, "resume\n");
@@ -1132,14 +1127,6 @@ static int ark_pci_resume (struct pci_dev* dev)
 	if (par->ref_count == 0)
 		goto fail;
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-
-	if (pci_enable_device(dev))
-		goto fail;
-
-	pci_set_master(dev);
-
 	arkfb_set_par(info);
 	fb_set_suspend(info, 0);
 
@@ -1148,10 +1135,17 @@ static int ark_pci_resume (struct pci_dev* dev)
 	console_unlock();
 	return 0;
 }
-#else
-#define ark_pci_suspend NULL
-#define ark_pci_resume NULL
-#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops ark_pci_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= ark_pci_suspend,
+	.resume		= ark_pci_resume,
+	.freeze		= ark_pci_suspend,
+	.thaw		= ark_pci_resume,
+	.poweroff	= ark_pci_suspend,
+	.restore	= ark_pci_resume,
+#endif
+};
 
 /* List of boards that we are trying to support */
 
@@ -1168,8 +1162,7 @@ static struct pci_driver arkfb_pci_driver = {
 	.id_table	= ark_devices,
 	.probe		= ark_pci_probe,
 	.remove		= ark_pci_remove,
-	.suspend	= ark_pci_suspend,
-	.resume		= ark_pci_resume,
+	.driver.pm	= &ark_pci_pm_ops,
 };
 
 /* Cleanup */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
