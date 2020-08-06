Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AA23D786
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272276E882;
	Thu,  6 Aug 2020 07:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DE46E87B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 07:28:54 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w17so27039566ply.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otRXxNiL4gSVNa6K+8BQSdss/DJNJyTyG/m0dhQQX4E=;
 b=OCwl2xDwvE1snTQ5bo+L1m2eYeuMLJAcfBA+IBsEjQA1yyteEZ5hUzzWYUYFSVs7yE
 gv135n4/e7GmIEGn47sKsk9WnNJbuZ+k3vITt26kDjAl1GLIjI3Jh9/7qWuXNXiBd30x
 aJWw5cjXnaS7Kt0AqQxYk0THyVlQruYmNozroghu8a0R+afmWWOW9tfpoKoKfqCN8W6f
 i+6cS6P5NhQwUQtP7SQaW7tou6klf4XncZYLp8DmdAq+EQklaNt7Zg073W60d+2c5bc1
 QMixkQAb4VlmD5hRMbPN71xHotttPfZ0oCIgX8NsVgvUcZSkv7Zjh5D0H3kHWsNCGe+F
 jiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otRXxNiL4gSVNa6K+8BQSdss/DJNJyTyG/m0dhQQX4E=;
 b=OacNm/QuQQlcvZV/rjJkpirVHVC1i0cVazA6pGG5VelxC9z5RcUrO39xHBal/7ONss
 HemA2EQphxDET8RCmLfWFf75xA25hdCRJiAe+XkySF/rph30StTiN2LpCrVbSpN+O3mH
 iE0/O8PxLa4ysaEP65j7Yq4pi9vMA15hSZI3B0eyLlIa8zbABmQVef/DlO22pbaEypC4
 KuHrVxAONtkeTkAbaEG0nETqF4J7EsQGoIAgTHfEuQZMHufT0s0nWvdnhpjRpLFnl7ud
 eUcWgKyCVbk6YbXhVkjJ8W0c5KxG/gmd2rUtpf6sNlT9we5eXd8Q05qAWp8oNnbKKZht
 kfxQ==
X-Gm-Message-State: AOAM533lv+QINO5eR9soiKUnZDZn69+M/auT4Kg3zMFKSwGMSYhwlOa3
 hqU+gjt7mBDTdceS1O1B45I=
X-Google-Smtp-Source: ABdhPJxB33J8in6hVmRJzWA2XAc3HXbCnIXx134loDG2q0NXHME3BjsXKW01wmOFkf7S9wmJfTzxPg==
X-Received: by 2002:a17:902:9a94:: with SMTP id
 w20mr6975803plp.59.1596698933892; 
 Thu, 06 Aug 2020 00:28:53 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id e125sm6654646pfh.69.2020.08.06.00.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 00:28:53 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Subject: [PATCH v1 2/2] fbdev: radeonfb:use generic power management
Date: Thu,  6 Aug 2020 12:56:58 +0530
Message-Id: <20200806072658.592444-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806072658.592444-1-vaibhavgupta40@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
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
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers using legacy PCI power management .suspend()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a "struct dev_pm_ops"
variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/aty/radeon_base.c | 10 +++++---
 drivers/video/fbdev/aty/radeon_pm.c   | 36 +++++++++++++++++++++------
 drivers/video/fbdev/aty/radeonfb.h    |  3 +--
 3 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index e116a3f9ad56..232dbe154666 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2559,16 +2559,18 @@ static void radeonfb_pci_unregister(struct pci_dev *pdev)
         framebuffer_release(info);
 }
 
+#ifdef CONFIG_PM
+#define RADEONFB_PCI_PM_OPS (&radeonfb_pci_pm_ops)
+#else
+#define RADEONFB_PCI_PM_OPS NULL
+#endif
 
 static struct pci_driver radeonfb_driver = {
 	.name		= "radeonfb",
 	.id_table	= radeonfb_pci_table,
 	.probe		= radeonfb_pci_register,
 	.remove		= radeonfb_pci_unregister,
-#ifdef CONFIG_PM
-	.suspend       	= radeonfb_pci_suspend,
-	.resume		= radeonfb_pci_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= RADEONFB_PCI_PM_OPS,
 };
 
 #ifndef MODULE
diff --git a/drivers/video/fbdev/aty/radeon_pm.c b/drivers/video/fbdev/aty/radeon_pm.c
index b9af70bd656a..352d0bb4773a 100644
--- a/drivers/video/fbdev/aty/radeon_pm.c
+++ b/drivers/video/fbdev/aty/radeon_pm.c
@@ -2611,8 +2611,9 @@ static void radeon_set_suspend(struct radeonfb_info *rinfo, int suspend)
 	}
 }
 
-int radeonfb_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
+static int radeonfb_pci_suspend_late(struct device *dev, pm_message_t mesg)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
         struct fb_info *info = pci_get_drvdata(pdev);
         struct radeonfb_info *rinfo = info->par;
 
@@ -2660,11 +2661,6 @@ int radeonfb_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
 	pmac_suspend_agp_for_card(pdev);
 #endif /* CONFIG_PPC_PMAC */
 
-	/* It's unclear whether or when the generic code will do that, so let's
-	 * do it ourselves. We save state before we do any power management
-	 */
-	pci_save_state(pdev);
-
 	/* If we support wakeup from poweroff, we save all regs we can including cfg
 	 * space
 	 */
@@ -2689,7 +2685,6 @@ int radeonfb_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
 			msleep(20);
 			OUTREG(LVDS_GEN_CNTL, INREG(LVDS_GEN_CNTL) & ~(LVDS_DIGON));
 		}
-		pci_disable_device(pdev);
 	}
 	/* If we support D2, we go to it (should be fixed later with a flag forcing
 	 * D3 only for some laptops)
@@ -2705,6 +2700,21 @@ int radeonfb_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
 	return 0;
 }
 
+static int radeonfb_pci_suspend(struct device *dev)
+{
+	return radeonfb_pci_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int radeonfb_pci_hibernate(struct device *dev)
+{
+	return radeonfb_pci_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int radeonfb_pci_freeze(struct device *dev)
+{
+	return radeonfb_pci_suspend_late(dev, PMSG_FREEZE);
+}
+
 static int radeon_check_power_loss(struct radeonfb_info *rinfo)
 {
 	return rinfo->save_regs[4] != INPLL(CLK_PIN_CNTL) ||
@@ -2712,8 +2722,9 @@ static int radeon_check_power_loss(struct radeonfb_info *rinfo)
 	       rinfo->save_regs[3] != INPLL(SCLK_CNTL);
 }
 
-int radeonfb_pci_resume(struct pci_dev *pdev)
+static int radeonfb_pci_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
         struct fb_info *info = pci_get_drvdata(pdev);
         struct radeonfb_info *rinfo = info->par;
 	int rc = 0;
@@ -2795,6 +2806,15 @@ int radeonfb_pci_resume(struct pci_dev *pdev)
 	return rc;
 }
 
+const struct dev_pm_ops radeonfb_pci_pm_ops = {
+	.suspend	= radeonfb_pci_suspend,
+	.resume		= radeonfb_pci_resume,
+	.freeze		= radeonfb_pci_freeze,
+	.thaw		= radeonfb_pci_resume,
+	.poweroff	= radeonfb_pci_hibernate,
+	.restore	= radeonfb_pci_resume,
+};
+
 #ifdef CONFIG_PPC__disabled
 static void radeonfb_early_resume(void *data)
 {
diff --git a/drivers/video/fbdev/aty/radeonfb.h b/drivers/video/fbdev/aty/radeonfb.h
index 131b34dd65af..93f403cbb415 100644
--- a/drivers/video/fbdev/aty/radeonfb.h
+++ b/drivers/video/fbdev/aty/radeonfb.h
@@ -483,8 +483,7 @@ extern void radeon_delete_i2c_busses(struct radeonfb_info *rinfo);
 extern int radeon_probe_i2c_connector(struct radeonfb_info *rinfo, int conn, u8 **out_edid);
 
 /* PM Functions */
-extern int radeonfb_pci_suspend(struct pci_dev *pdev, pm_message_t state);
-extern int radeonfb_pci_resume(struct pci_dev *pdev);
+extern const struct dev_pm_ops radeonfb_pci_pm_ops;
 extern void radeonfb_pm_init(struct radeonfb_info *rinfo, int dynclk, int ignore_devlist, int force_sleep);
 extern void radeonfb_pm_exit(struct radeonfb_info *rinfo);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
