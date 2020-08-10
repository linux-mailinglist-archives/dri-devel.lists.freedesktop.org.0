Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203242416A7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC9F6E112;
	Tue, 11 Aug 2020 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9E189970
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:59:26 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id 2so473298pjx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eo6C/t0QntXHNv+va8pAtuZAT72BZ2Eud6mjtShgwHg=;
 b=LSmLsRT+JLkxww7GAqI0nzxKzx/yMQC6QJ9PAGbTEjhds5OxybT1pPct/kZguC9WMD
 5BQ3oKbhlQLJADKOipuTyAPBS/ZfEtBq4uOYqnPTgEkqqLvlVf0Gd63DaPAAirBWdeDh
 6mK+FccXipK1BnLbcMmDcsB28+8oFPpOUruQ75UQyctCuHydLONLm+rC2udRvGmrm2S9
 psZvIBEtQkK+IqrRJsNODSqwjhUQYZn4B+rZgKFOMD0FV67Wq6osw+mHRKDvRFR/beBd
 cZ2+7vDybwtFQR+lAluQK0MXMb2e2tpDaVWuLTgQJvyHJRVC0kQxMH29JLuk1PL7v/IS
 r89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eo6C/t0QntXHNv+va8pAtuZAT72BZ2Eud6mjtShgwHg=;
 b=lwk6SqIW0GP9u809qvOuvYfVaVUuz1ZEFfVlQ6MnU86biSsMa49n+9d8X+H74UZXFp
 g2zP+y0F7/NUrpSdwDhFvMlBg+0flaOM5oucEZV1APF06L6rPzRDI3UR6bzrJQrFGR8h
 Z7DbAC5VYyLGQGgzCnrojaVjr78UVnF1mLCoWLE1W5T+ckq4uR7gOmS0jITtfZwBygz8
 JZhwLR++zdVtt7LiRl+KLqJclC6ve3ltui9A+uWyoFH6hlAPsikF4U4SuM/xFXGDnn7I
 oZiaZF92n1DDKk9gsDTDtS4wvVmKy3X9sU4DSlVIOXwpsObETM0JSU7RFtmG1YDDB1wR
 ZAuA==
X-Gm-Message-State: AOAM532nyGLdF6//ghe2M5L+pidEOgiKROnhv0QTTacWZfqeyHCP2edI
 +TRlTxJ8p9aCqvKCyPsTAVQ=
X-Google-Smtp-Source: ABdhPJxRdHMOzsMBP22XP83ZETl0dliT9DbqNZKJdu3R1+qEw1kdDcuvBsTY7YGA33MZvsC265I1xw==
X-Received: by 2002:a17:902:b28a:: with SMTP id
 u10mr11740349plr.195.1597085966053; 
 Mon, 10 Aug 2020 11:59:26 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:59:25 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 01/12] fbdev: gxfb: use generic power management
Date: Tue, 11 Aug 2020 00:27:12 +0530
Message-Id: <20200810185723.15540-2-vaibhavgupta40@gmail.com>
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

Although the gxfb driver does not have that extra load, we should switch to
the new generic framework by updating function signatures and define a
"struct dev_pm_ops" variable to bind PM callbacks so that we can remove
the legacy .suspend & .resume bindings. Additionally, this helps us to
remove the unnecessary call to gxfb_suspend() in the event of Freeze and
Hibernate, as the function does nothing in their case.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/geode/gxfb.h       |  5 ----
 drivers/video/fbdev/geode/gxfb_core.c  | 36 ++++++++++++++------------
 drivers/video/fbdev/geode/suspend_gx.c |  4 ---
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/geode/gxfb.h b/drivers/video/fbdev/geode/gxfb.h
index d2e9c5c8e294..792c111c21e4 100644
--- a/drivers/video/fbdev/geode/gxfb.h
+++ b/drivers/video/fbdev/geode/gxfb.h
@@ -21,7 +21,6 @@ struct gxfb_par {
 	void __iomem *dc_regs;
 	void __iomem *vid_regs;
 	void __iomem *gp_regs;
-#ifdef CONFIG_PM
 	int powered_down;
 
 	/* register state, for power management functionality */
@@ -36,7 +35,6 @@ struct gxfb_par {
 	uint64_t fp[FP_REG_COUNT];
 
 	uint32_t pal[DC_PAL_COUNT];
-#endif
 };
 
 unsigned int gx_frame_buffer_size(void);
@@ -49,11 +47,8 @@ void gx_set_dclk_frequency(struct fb_info *info);
 void gx_configure_display(struct fb_info *info);
 int gx_blank_display(struct fb_info *info, int blank_mode);
 
-#ifdef CONFIG_PM
 int gx_powerdown(struct fb_info *info);
 int gx_powerup(struct fb_info *info);
-#endif
-
 
 /* Graphics Processor registers (table 6-23 from the data book) */
 enum gp_registers {
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index d38a148d4746..44089b331f91 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -322,17 +322,14 @@ static struct fb_info *gxfb_init_fbinfo(struct device *dev)
 	return info;
 }
 
-#ifdef CONFIG_PM
-static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused gxfb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(pdev);
+	struct fb_info *info = dev_get_drvdata(dev);
 
-	if (state.event == PM_EVENT_SUSPEND) {
-		console_lock();
-		gx_powerdown(info);
-		fb_set_suspend(info, 1);
-		console_unlock();
-	}
+	console_lock();
+	gx_powerdown(info);
+	fb_set_suspend(info, 1);
+	console_unlock();
 
 	/* there's no point in setting PCI states; we emulate PCI, so
 	 * we don't end up getting power savings anyways */
@@ -340,9 +337,9 @@ static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int gxfb_resume(struct pci_dev *pdev)
+static int __maybe_unused gxfb_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(pdev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	int ret;
 
 	console_lock();
@@ -356,7 +353,6 @@ static int gxfb_resume(struct pci_dev *pdev)
 	console_unlock();
 	return 0;
 }
-#endif
 
 static int gxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
@@ -467,15 +463,23 @@ static const struct pci_device_id gxfb_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, gxfb_id_table);
 
+static const struct dev_pm_ops gxfb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= gxfb_suspend,
+	.resume		= gxfb_resume,
+	.freeze		= NULL,
+	.thaw		= gxfb_resume,
+	.poweroff	= NULL,
+	.restore	= gxfb_resume,
+#endif
+};
+
 static struct pci_driver gxfb_driver = {
 	.name		= "gxfb",
 	.id_table	= gxfb_id_table,
 	.probe		= gxfb_probe,
 	.remove		= gxfb_remove,
-#ifdef CONFIG_PM
-	.suspend	= gxfb_suspend,
-	.resume		= gxfb_resume,
-#endif
+	.driver.pm	= &gxfb_pm_ops,
 };
 
 #ifndef MODULE
diff --git a/drivers/video/fbdev/geode/suspend_gx.c b/drivers/video/fbdev/geode/suspend_gx.c
index 1110a527c35c..8c49d4e98772 100644
--- a/drivers/video/fbdev/geode/suspend_gx.c
+++ b/drivers/video/fbdev/geode/suspend_gx.c
@@ -11,8 +11,6 @@
 
 #include "gxfb.h"
 
-#ifdef CONFIG_PM
-
 static void gx_save_regs(struct gxfb_par *par)
 {
 	int i;
@@ -259,5 +257,3 @@ int gx_powerup(struct fb_info *info)
 	par->powered_down  = 0;
 	return 0;
 }
-
-#endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
