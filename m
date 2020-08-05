Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F386323D78E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6576E889;
	Thu,  6 Aug 2020 07:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B526E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 18:10:10 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id s26so23195730pfm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIelC/rsG5LlfCfiRk2OK0We+ffRSIzCW8qbxQDXpBs=;
 b=hf+eR422jWMydn6U5vfGmRcr6WRiQRedOZ1+fXRaGmOLOA0QDcOVCKczD2IOQfnMUa
 DRWfaTJEcBBZ3Br/8mn3yAkuUoY6lTQbfumrxdiGRxYXQXH3M9O5gbsUxBp249ODISfq
 NlvL/NyyPy11GcV+dU8nAynEWgYDY6uVIWTk+VWVHvQNKmpXaAWghFjHScQ9N3e9Jcsb
 sNnUIGlLiKsdsk1WWudgPEkWLiPoclIlPbY9fS8f6r9RSypbRICuC616VoLB/YajcYod
 l+XoEN11YMvw7ZnVAspjvjN2UsRb8j2bnhYKn6wcbDM8Ji01zcPUbDDcwkJ6STajEBnJ
 QdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIelC/rsG5LlfCfiRk2OK0We+ffRSIzCW8qbxQDXpBs=;
 b=HuNp6BWjm8F/WrHaatYA6cmy8ngGWF3pZLdi0qaUlJQH5F9TPAFfJMjgTd+NAOmqZo
 MO4TXtFKAGEvmtXTA69T4f6AiOh9wTOLwX8l55B6PwyoAKw4Zu3wtlbLab8/drJaS3R1
 9idIar1qwhf2R7GKLmZ/hYsZd3uU9U6zVvHCYlIx7FYH+XSe5b3c2Yi9gSD/qhJBDAMO
 brQDMN8sCoDe21f7wccVIqENl5bSQdOB7dOE4oIa5wAiZv4aK12x7Oa+NQul7nBWpVb6
 s6R6i2PCtXHjWXeC6cn1FW/R7tFzcEL2C1mm+HGdvciODcIpXgSDGFBJWDjPXv3P+MPN
 7Cdw==
X-Gm-Message-State: AOAM533QlMrr7aUf7mTVNSFcgo28MYfzFBH+A3KZpGV0x8VAACLilyk+
 /Cd0Y3AIm9BD0JCO3LLVIuk=
X-Google-Smtp-Source: ABdhPJyClIjD3Alxk47jczZytSJA88FVc00EHEWRuyu4K0qCudUE+Tf0WljQP/05ghRXsy+HixMFsw==
X-Received: by 2002:a63:6945:: with SMTP id e66mr3926452pgc.177.1596651010103; 
 Wed, 05 Aug 2020 11:10:10 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t63sm4977510pfb.210.2020.08.05.11.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:10:09 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Mackerras <paulus@samba.org>, Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>, Antonino Daplas <adaplas@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v1 08/12] fbdev: cyber2000fb: use generic power management
Date: Wed,  5 Aug 2020 23:37:18 +0530
Message-Id: <20200805180722.244008-9-vaibhavgupta40@gmail.com>
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
