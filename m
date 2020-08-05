Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2634E23D772
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72406E1A2;
	Thu,  6 Aug 2020 07:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8996E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 18:09:38 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id f9so4756663pju.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uItQaxawuJpK5je/oUH/UET1q9rEg6Zl2yCHgObWaU=;
 b=AZ+Ob5UwDYRFspLaKbnD3yYh2qZsQKHrcZDLyvODYGY1YbkFdqYvUpnWs+STSiKBit
 WLz2kwHe+aE4KxOc7yBn6ML9QYCd1mGW2siMD2WhuF/q9YMMA4dquWeum7W973iiC2YV
 X1u0h6MRWU2/yNBeQAjyu+4MW5mPWkvLREPJ1FzwtTQIezg31a3imnvvrKmTR12u9f5Y
 ueaIfnxZgNw4QSD1onlwxzEvBGGcMOek4BTA6qbPo+b8eO1x3SNxStKvABVAhIcpcVDb
 r/gcMW4yBFwRb4oRr6EeUXKxmKQ2qSLzJzytfLwwSm8M418t+2GulbS2UlAJoMrhdD1e
 l1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uItQaxawuJpK5je/oUH/UET1q9rEg6Zl2yCHgObWaU=;
 b=IaBMufpmK2RNyPkIjC8HWvzx2GoVDZSuPuiS+jdp5sBu+Lok5SO8DddM0Qs68pMcEX
 KL1HKxj/xzlvCZQXhv8E2sNbgqtikoVooPpu+ymukjUcmRYj7ZcMigDQNRt9BdlZaEod
 xeaKNfgEUEmTvK+vi81U+VL197WIkKlmwYfVojS0F1GY7a+rw0UT4fbyfS32z6IPf5T3
 0JM6/NYmsehOxVkHueoBmhM7Rzi7sOXYHtwPpXMtbrhqw53/7BcKQFp5HWsGqAMoCnaI
 3canDAa8+9MBhzsND82u3MJQI+vyJbKsi3GVbQMY6u99qDtKOmu7af2Q5Z2q1ZDyuRTH
 8AXg==
X-Gm-Message-State: AOAM5317v6sXjpkhOzPhsRmI+Foz2Q8VpZwah43ZnU5d/NKZwdFV8Uef
 ujcM6Z/gtfYUB3hsklPgJCc=
X-Google-Smtp-Source: ABdhPJzmv6N0E9VbwZH7UnXkgxlJLDvMP70umANYnnNhbgOzcfqOc8j7WNngIOLBGMiismfsUWErjw==
X-Received: by 2002:a17:90a:f192:: with SMTP id
 bv18mr4155781pjb.21.1596650978416; 
 Wed, 05 Aug 2020 11:09:38 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t63sm4977510pfb.210.2020.08.05.11.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:09:38 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Mackerras <paulus@samba.org>, Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>, Antonino Daplas <adaplas@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v1 03/12] fbdev: via-core: use generic power management
Date: Wed,  5 Aug 2020 23:37:13 +0530
Message-Id: <20200805180722.244008-4-vaibhavgupta40@gmail.com>
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
