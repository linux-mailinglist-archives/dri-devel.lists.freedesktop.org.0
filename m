Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4886223D776
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5D86E877;
	Thu,  6 Aug 2020 07:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26DA6E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 18:10:16 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o1so25765860plk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wr1R0/Ze2G4IecD2JkfhRTVYXHTVK1Tx0wo+bfHFfJI=;
 b=sJdfVwrs67VSWJ5Urnu3dK5b8A8dylK7mh1xnF8wRETervUk9RNicZKtC+qvch4EFV
 k26HGRHycRlUbPnzAzmeVzlHJHTPxIuPT0hzGI/0edcqMTs6QxFztZsAYKTzI/3AuyW9
 Q+MMx6BOgb47Xcgt8E6FTwNIFije/ztkRl9lifaif5/f0H0F29Wha7hVxyCaJ3YcoGHu
 aqSTjF1lsue7sZtzPF9fQvJOlQrT5+iWp+K1nLpsudiy+Cuqa1oF9H9EsLdYlmamTQuL
 dQuQQUvftJye8+UOMCuoEqKOivnQGMZ9Ut9CFVD3GznkJVvB9d2ltjwYLrY6OnsjR27k
 mRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wr1R0/Ze2G4IecD2JkfhRTVYXHTVK1Tx0wo+bfHFfJI=;
 b=ulK8z85zLFJ21WdxA+/gTSjC2/O2Nq4UESxoYwDqXDt+N/kBQ7ATz7vpf8AtwWwcAw
 KSIEBObedYxsixY7P6wTrt4Qf5EIhudbMlavMyHquikaoKIC3jzAuU1dARSAV9rPU8Kf
 ydaq+VL3qngbGIlPlNoIpJKdqKggulmcsEer5gL7+DQRojzwy15NOVtHl9hmNsKLTG6U
 6yfbPexaYR9MxpTuQDL+Q7fMNVqRoJZKG30VxbL74DQ099fayPp047tcaldFc9SkJRJZ
 WhH3oQ8M9qr8ussZryG01Pc7zW8RX8aBMo34ef1ed5VC/DiLkIrg7Oq5wx+YalbOMxI+
 il0g==
X-Gm-Message-State: AOAM530DvOkOxvpPUYHgztRc9Zwuilbcg6VUbhJegu/rXwPIOGjodSWK
 jaOcufa0fK7DiWJEf32g88M=
X-Google-Smtp-Source: ABdhPJxyu6VM6PZNHf9Q6CWK4FZqzh1F468GpS4fZ5DdCQVfyzwWEr5vdgsuKzP6qjzcCo2AdWK0ag==
X-Received: by 2002:a17:90b:4a0a:: with SMTP id
 kk10mr4520046pjb.30.1596651016370; 
 Wed, 05 Aug 2020 11:10:16 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t63sm4977510pfb.210.2020.08.05.11.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:10:15 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Mackerras <paulus@samba.org>, Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>, Antonino Daplas <adaplas@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v1 09/12] fbdev: i740fb: use generic power management
Date: Wed,  5 Aug 2020 23:37:19 +0530
Message-Id: <20200805180722.244008-10-vaibhavgupta40@gmail.com>
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
