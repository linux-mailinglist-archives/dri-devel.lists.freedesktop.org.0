Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D25E2416BE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2326E4B7;
	Tue, 11 Aug 2020 06:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D0D8999C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 19:00:27 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id kr4so490179pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0+jOHm8rOkNKyaunCdMu5yjlq5vV0eABQayoJ0528s=;
 b=ivA1aaBUqdfgaLxoUgpllPwcVHSBM7bdP5tm1sTOPej3S/pjrIeus2jhbAdE9ZCRop
 gpw9DTZU6CMqhQ2FTPFyjfblMdEJxh8L03aZXKBEdOKPFbT/eAImT6/HCoVWAVeijQhb
 wQSPdivqd9TnHrk0p1sSpE3hDkzM/sxbQ0NZSJTkVZNWjgd+kvrUhV3mdEGMmEVRyk0Y
 cKew74EKthOegKVQ8badipz12z+tyVUExgN9P74Swhb0zjXBKnckcSS3ngLcheVdW8Jj
 /uSJnGJqPSz+yBss5ED6Es1OvvXbxXKz1KFMi++RJhz8DlNDQdi4soe5evQc45D0yoTW
 Z1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0+jOHm8rOkNKyaunCdMu5yjlq5vV0eABQayoJ0528s=;
 b=L2hozk/UfcyjXJFnBtiHcgBO4IMPEZM/0WH+Bygc6TyAbpuAPVrynFXlVhMP+LR7kO
 SmHWfGaT2yCbxd3LNewHnv3HqFvT4bD3HzeS8DYwxKYSOsqlsbx2LIGlD++gSgtLgWld
 9ezpeiFUPXAVUJv9ixsM/m4Ke5fmbU05HpJeYuAtH9f2Hou+Pabb6+iF6fAohzYzZ5uB
 ZvXiNtOo/ZYH1gSMSB2xe+z5KjO+Ebry/AQNucb2FXD1uzAcOysMgwCHm6v+X5z5XXVz
 XhhNSwEaauVOB8/N8oEja06B6R4LBa+6F7LeTlfSKp1MsJ8hFQKfXAElp1Rlq2p9fPay
 9EVw==
X-Gm-Message-State: AOAM532axVcvkEfuV8vrqPq+SEC7FHsA1Dh2kH+N4U7L9XWT6GnZCcJR
 QKeAfPrtqII8DlpG5ODV1HI=
X-Google-Smtp-Source: ABdhPJw9zh50ift33KPLF0gpYxTpUeEdaP8Jb6WeAkKvYMnGC5Fle9xVNYZuWbaiuMAmoxMIZ8b0+w==
X-Received: by 2002:a17:902:8d94:: with SMTP id
 v20mr14878457plo.298.1597086027479; 
 Mon, 10 Aug 2020 12:00:27 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:27 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 09/12] fbdev: i740fb: use generic power management
Date: Tue, 11 Aug 2020 00:27:20 +0530
Message-Id: <20200810185723.15540-10-vaibhavgupta40@gmail.com>
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
 drivers/video/fbdev/i740fb.c | 40 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index c65ec7386e87..8d7f06fc8a5a 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -1175,16 +1175,11 @@ static void i740fb_remove(struct pci_dev *dev)
 	}
 }
 
-#ifdef CONFIG_PM
-static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused i740fb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct i740fb_par *par = info->par;
 
-	/* don't disable console during hibernation and wakeup from it */
-	if (state.event == PM_EVENT_FREEZE || state.event == PM_EVENT_PRETHAW)
-		return 0;
-
 	console_lock();
 	mutex_lock(&(par->open_lock));
 
@@ -1197,19 +1192,15 @@ static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
 
 	fb_set_suspend(info, 1);
 
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
 	mutex_unlock(&(par->open_lock));
 	console_unlock();
 
 	return 0;
 }
 
-static int i740fb_resume(struct pci_dev *dev)
+static int __maybe_unused i740fb_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct i740fb_par *par = info->par;
 
 	console_lock();
@@ -1218,11 +1209,6 @@ static int i740fb_resume(struct pci_dev *dev)
 	if (par->ref_count == 0)
 		goto fail;
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-	if (pci_enable_device(dev))
-		goto fail;
-
 	i740fb_set_par(info);
 	fb_set_suspend(info, 0);
 
@@ -1231,10 +1217,17 @@ static int i740fb_resume(struct pci_dev *dev)
 	console_unlock();
 	return 0;
 }
-#else
-#define i740fb_suspend NULL
-#define i740fb_resume NULL
-#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops i740fb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= i740fb_suspend,
+	.resume		= i740fb_resume,
+	.freeze		= NULL,
+	.thaw		= i740fb_resume,
+	.poweroff	= i740fb_suspend,
+	.restore	= i740fb_resume,
+#endif /* CONFIG_PM_SLEEP */
+};
 
 #define I740_ID_PCI 0x00d1
 #define I740_ID_AGP 0x7800
@@ -1251,8 +1244,7 @@ static struct pci_driver i740fb_driver = {
 	.id_table	= i740fb_id_table,
 	.probe		= i740fb_probe,
 	.remove		= i740fb_remove,
-	.suspend	= i740fb_suspend,
-	.resume		= i740fb_resume,
+	.driver.pm	= &i740fb_pm_ops,
 };
 
 #ifndef MODULE
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
