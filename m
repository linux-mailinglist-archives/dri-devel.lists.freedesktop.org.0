Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A72416BC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339C16E4B1;
	Tue, 11 Aug 2020 06:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B719E89970
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:59:40 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x25so2772353pff.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alhqoEvoDzB6EgYbPZouIY7wwoSwqK7ATGTbSeQXdVM=;
 b=boaPJgd9MUTMhnVe3c0WDxW7vqkOz7PWgP40Ngq9aEBR/wFbk5+SnGqmKkykQlWzuF
 Brq7EEbO75RrpB/tncOFRjPF4quasLr6mJF7gtiX7ztYynOUkkJuaPBXzkE2Uvyx/3kB
 VwyqDO3g5gjG1oB1bTUkRAUlpOfFlkB0Igv1fOqGPCY//rPv3P4mRVzsY9w6LI0B3dlI
 Juc8CWOB/ZyI+Mwg21i0RoG2bHf/966tu5IYXcA6pMScmf4OE/1jKbOfeBC5vhSLYYIX
 Tg1xkk+q16sJhRRuZEtgXAezUk4jqbvfynzUFsD6ZAxX5nV8HfsD4swaYAhuC4uINelV
 SpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alhqoEvoDzB6EgYbPZouIY7wwoSwqK7ATGTbSeQXdVM=;
 b=QCFgoZUH8rtTMClpCBtupiEu7u1X4/LZ1HiBepEniISbL363XylleMkt5ldRC8WFxF
 W4TdYJGLQdmvU67No7VvvpFb5VKo/Zra8KYP6+q9nLnAn6oHr4/4+/xeMZSPEXUtqmkm
 4if735CuBqkCJYOcTrxm1D6890NPUhpCCExu8X2LM+2tbs/e6YPfQN6j6zQhqV5rwLVb
 UlyV8ctt98CokndXJXPi5OaX5UMCKww405pofOIi2aKBXmYDlYE2Q7DPcZhUR1iUMlk2
 1d7hDEdLAKcH3TFE6BwUhS2DljnNQ6EuKrBHdo/j75PHWpHQMnImIeihT6NIGmM2TRYI
 uU6w==
X-Gm-Message-State: AOAM533P2FNNunuEtgG2fPUOu3Z4xoEOeMVZbjR9N7F/FdoAibLOFsWW
 ZVMt6sCwwP/Cm+cYPLEjl+k=
X-Google-Smtp-Source: ABdhPJxrqIoKPrZbePpOgvrfyXi1CIbTQvHAVqma3Orahl2Z3dnYJtew3QXDtnIE2TcI9cyuJs+Nqw==
X-Received: by 2002:a63:e118:: with SMTP id z24mr22301979pgh.230.1597085980258; 
 Mon, 10 Aug 2020 11:59:40 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:59:39 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 03/12] fbdev: via-core: use generic power management
Date: Tue, 11 Aug 2020 00:27:14 +0530
Message-Id: <20200810185723.15540-4-vaibhavgupta40@gmail.com>
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
.suspend & .resume bindings. Additionally, this helps us to remove the
unnecessary call to via_suspend() in the event of Freeze and Hibernate, as
the function does nothing in their case.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/via/via-core.c | 39 ++++++++++++------------------
 include/linux/via-core.h           |  2 --
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 703ddee9a244..89d75079b730 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -558,9 +558,8 @@ static void via_teardown_subdevs(void)
 /*
  * Power management functions
  */
-#ifdef CONFIG_PM
-static LIST_HEAD(viafb_pm_hooks);
-static DEFINE_MUTEX(viafb_pm_hooks_lock);
+static __maybe_unused LIST_HEAD(viafb_pm_hooks);
+static __maybe_unused DEFINE_MUTEX(viafb_pm_hooks_lock);
 
 void viafb_pm_register(struct viafb_pm_hooks *hooks)
 {
@@ -580,12 +579,10 @@ void viafb_pm_unregister(struct viafb_pm_hooks *hooks)
 }
 EXPORT_SYMBOL_GPL(viafb_pm_unregister);
 
-static int via_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused via_suspend(struct device *dev)
 {
 	struct viafb_pm_hooks *hooks;
 
-	if (state.event != PM_EVENT_SUSPEND)
-		return 0;
 	/*
 	 * "I've occasionally hit a few drivers that caused suspend
 	 * failures, and each and every time it was a driver bug, and
@@ -600,24 +597,13 @@ static int via_suspend(struct pci_dev *pdev, pm_message_t state)
 		hooks->suspend(hooks->private);
 	mutex_unlock(&viafb_pm_hooks_lock);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 	return 0;
 }
 
-static int via_resume(struct pci_dev *pdev)
+static int __maybe_unused via_resume(struct device *dev)
 {
 	struct viafb_pm_hooks *hooks;
 
-	/* Get the bus side powered up */
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	if (pci_enable_device(pdev))
-		return 0;
-
-	pci_set_master(pdev);
-
 	/* Now bring back any subdevs */
 	mutex_lock(&viafb_pm_hooks_lock);
 	list_for_each_entry(hooks, &viafb_pm_hooks, list)
@@ -626,7 +612,6 @@ static int via_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static int via_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
@@ -712,15 +697,23 @@ static const struct pci_device_id via_pci_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, via_pci_table);
 
+static const struct dev_pm_ops via_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= via_suspend,
+	.resume		= via_resume,
+	.freeze		= NULL,
+	.thaw		= via_resume,
+	.poweroff	= NULL,
+	.restore	= via_resume,
+#endif
+};
+
 static struct pci_driver via_driver = {
 	.name		= "viafb",
 	.id_table	= via_pci_table,
 	.probe		= via_pci_probe,
 	.remove		= via_pci_remove,
-#ifdef CONFIG_PM
-	.suspend	= via_suspend,
-	.resume		= via_resume,
-#endif
+	.driver.pm	= &via_pm_ops,
 };
 
 static int __init via_core_init(void)
diff --git a/include/linux/via-core.h b/include/linux/via-core.h
index 9e802deedb2d..8737599b9148 100644
--- a/include/linux/via-core.h
+++ b/include/linux/via-core.h
@@ -47,7 +47,6 @@ struct via_port_cfg {
 /*
  * Allow subdevs to register suspend/resume hooks.
  */
-#ifdef CONFIG_PM
 struct viafb_pm_hooks {
 	struct list_head list;
 	int (*suspend)(void *private);
@@ -57,7 +56,6 @@ struct viafb_pm_hooks {
 
 void viafb_pm_register(struct viafb_pm_hooks *hooks);
 void viafb_pm_unregister(struct viafb_pm_hooks *hooks);
-#endif /* CONFIG_PM */
 
 /*
  * This is the global viafb "device" containing stuff needed by
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
