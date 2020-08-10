Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B910724169C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6D76E116;
	Tue, 11 Aug 2020 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B47389970
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 19:00:20 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x25so2774038pff.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUIX3oUq+BAamlZJBJ9IeD9BMm5oq8vVqQ2hIGTjUng=;
 b=e09DB0UN479Wa7sOUsksxC+y9mEDbv+QeRkQHDjr1Qt60svQT4MdFY5VxfTOAgjpMG
 L2+ffCpqK+8lUCtZBwah6ByxwCJKvDg2mHB/CgdkOGiaHT1wwuaTZ0nc5XZCeh/fVWSx
 CsbfQPYrnMT/pQioI2J0aYhe5Eh4n8J/QCY6CRT3l9DmE9u6qJ84s/nqRZuTDclF29cb
 pqV5FFy+FT7854Vmt9PpZM90yCBBxgKysyJTJlAibeexsE0L+cNlw07wHrNsPODw01jL
 YwohlLPyb0Gs8uCOGcM3IAUfCAOIYV4tGd4CUusvtfcXWq8W7hIcdaAt7pJq1yDPcpWA
 XcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUIX3oUq+BAamlZJBJ9IeD9BMm5oq8vVqQ2hIGTjUng=;
 b=EdfIKotBHuzRaHmLDf42UnvRsoyn6cEX2wNLdPk0XCF+pGducc5TDEfVJuzPcni1+n
 GBxmviHMJfhOy0ialTGnYCQyGAnkR69G3HNu7g1BLCT9Nglau3zOxgZ/Ug3gL2O+r7aE
 jM4Sz4QTCE/LCedsB6JNL9iPMWM2OxXZe7R1Fcgkm4YZCRqB+CI9DGp9NKPfrtsCtkuM
 67m8DZp01ZaFS1qEl1M2tIQzhazwZ6oISUb49Xr4Ikv0HmWi7/Eze+1EKuBFaNnGa7Cx
 E7p3ySC7MHS+WKgusCcoxybXvXYN75jIYV7pllJQ38x0qtR/qi5e0LfLDL+aJvZq0g1+
 smig==
X-Gm-Message-State: AOAM533geV1dbUK8s9dNqP+28nX9L3JxNRUJ1QuZCC/JGMg9gC6TuUnr
 dTzTCR2mmzH18J8bhmlz9l8=
X-Google-Smtp-Source: ABdhPJzqgUCaTLlwt9nMhPO/MyOHNOXTkAdRl1Eno3KtywE7hA2LRQfyZ5RFqehkSxqUE0saJ+h5Yw==
X-Received: by 2002:aa7:9a09:: with SMTP id w9mr2398983pfj.206.1597086020112; 
 Mon, 10 Aug 2020 12:00:20 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:19 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 08/12] fbdev: cyber2000fb: use generic power management
Date: Tue, 11 Aug 2020 00:27:19 +0530
Message-Id: <20200810185723.15540-9-vaibhavgupta40@gmail.com>
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

Although the cyber2000fb driver does not have that extra load, we should
switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks so that we can
remove the legacy .suspend & .resume bindings.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/cyber2000fb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 42d37bed518a..d45355b9a58c 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1810,7 +1810,7 @@ static void cyberpro_pci_remove(struct pci_dev *dev)
 	}
 }
 
-static int cyberpro_pci_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused cyberpro_pci_suspend(struct device *dev)
 {
 	return 0;
 }
@@ -1818,9 +1818,9 @@ static int cyberpro_pci_suspend(struct pci_dev *dev, pm_message_t state)
 /*
  * Re-initialise the CyberPro hardware
  */
-static int cyberpro_pci_resume(struct pci_dev *dev)
+static int __maybe_unused cyberpro_pci_resume(struct device *dev)
 {
-	struct cfb_info *cfb = pci_get_drvdata(dev);
+	struct cfb_info *cfb = dev_get_drvdata(dev);
 
 	if (cfb) {
 		cyberpro_pci_enable_mmio(cfb);
@@ -1846,12 +1846,15 @@ static struct pci_device_id cyberpro_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, cyberpro_pci_table);
 
+static SIMPLE_DEV_PM_OPS(cyberpro_pci_pm_ops,
+			 cyberpro_pci_suspend,
+			 cyberpro_pci_resume);
+
 static struct pci_driver cyberpro_driver = {
 	.name		= "CyberPro",
 	.probe		= cyberpro_pci_probe,
 	.remove		= cyberpro_pci_remove,
-	.suspend	= cyberpro_pci_suspend,
-	.resume		= cyberpro_pci_resume,
+	.driver.pm	= &cyberpro_pci_pm_ops,
 	.id_table	= cyberpro_pci_table
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
