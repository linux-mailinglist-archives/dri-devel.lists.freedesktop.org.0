Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F723D76D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E946E057;
	Thu,  6 Aug 2020 07:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1B26E830
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 18:09:30 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 17so2836200pfw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgVLkQgbaRD9yzOFBDpXNqjeujh8891+2ZYkeKQIDLw=;
 b=XePgyGKzBRdhr1GC2yklBTIzq8V2QdMNAJ851qYYfKh3kx4IBojl3TghejhwfBK/M1
 bElu8fW3rTNT3y0jwYuwleod23ut0qqG6TTfOBRCb/M1PtQLLSOxhAGjcZO2TK65Lmg2
 aCrBfkXj/cv3/tVsL9+b4miVVJu5Sog9tPWY0/3G63T9Azx7fYSHF62iKI2OVCbhk+lk
 eGcI8nuaJIw2tBlFwlHh69w10T2SFdCwKsqiDwFhvAam8AqEr4WZUucDuA2kemHWPBKO
 gWcboQJR8dR6qcpTHvZl8YmqZOrCuOg5zGiTXy0euwCdb2pUeAAeDLMUFzlCp7lOjPrx
 c3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgVLkQgbaRD9yzOFBDpXNqjeujh8891+2ZYkeKQIDLw=;
 b=HqzMtqtP5SERsJdq2YWyXjvSUeAXxa+McUn15VbARgsxpji7tQD41lbaLl5J5USouP
 Tnc5YtvP0U7/HPB0v0+KX4cS5lAbPF6sZLeZUFALHbSw/5JMIKJooNGZOupmOX+/x+VR
 JdF9+xpTOvJXIhE5dIOHLYZ89HVaiN6uK/vtnDxFoexa6loTErpTE4aOqDCEFyFzMD4+
 1yU1ew6Jv4LCRBo5wPj23j6yCcKlJRgt0S0ar5SLjqOsB3DcRmtwGdSCCYpjrZ4pSKRy
 rW1fB4oOX2mPO3llrqA6qSm/PewEsSRDabHaGjcmtT1O/kr0q4K4S8gGrytylNIIbndT
 ZNpQ==
X-Gm-Message-State: AOAM531IWZExMDYagzArk0ek+Pux5KvPsrkWhLIF0phq+a0M8rs0/H1v
 Ic9TcGiqIlZ7mll/i4aMYDs=
X-Google-Smtp-Source: ABdhPJz0xjkg3Aqhshw/WtB40L5HwrjZrwIVhKNP2u11WsQUYVL27Tfbg5JO2VaCbCtCsE0+C0Z+RA==
X-Received: by 2002:a62:7c87:: with SMTP id x129mr4753260pfc.165.1596650970339; 
 Wed, 05 Aug 2020 11:09:30 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t63sm4977510pfb.210.2020.08.05.11.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:09:29 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Mackerras <paulus@samba.org>, Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>, Antonino Daplas <adaplas@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v1 02/12] fbdev: lxfb: use generic power management
Date: Wed,  5 Aug 2020 23:37:12 +0530
Message-Id: <20200805180722.244008-3-vaibhavgupta40@gmail.com>
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
 drivers/video/fbdev/geode/lxfb.h      |  5 ----
 drivers/video/fbdev/geode/lxfb_core.c | 37 +++++++++++++++------------
 drivers/video/fbdev/geode/lxfb_ops.c  |  4 ---
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/geode/lxfb.h b/drivers/video/fbdev/geode/lxfb.h
index ef24bf6d49dc..d37b32dbcd68 100644
--- a/drivers/video/fbdev/geode/lxfb.h
+++ b/drivers/video/fbdev/geode/lxfb.h
@@ -29,7 +29,6 @@ struct lxfb_par {
 	void __iomem *gp_regs;
 	void __iomem *dc_regs;
 	void __iomem *vp_regs;
-#ifdef CONFIG_PM
 	int powered_down;
 
 	/* register state, for power mgmt functionality */
@@ -50,7 +49,6 @@ struct lxfb_par {
 	uint32_t hcoeff[DC_HFILT_COUNT * 2];
 	uint32_t vcoeff[DC_VFILT_COUNT];
 	uint32_t vp_coeff[VP_COEFF_SIZE / 4];
-#endif
 };
 
 static inline unsigned int lx_get_pitch(unsigned int xres, int bpp)
@@ -64,11 +62,8 @@ int lx_blank_display(struct fb_info *, int);
 void lx_set_palette_reg(struct fb_info *, unsigned int, unsigned int,
 			unsigned int, unsigned int);
 
-#ifdef CONFIG_PM
 int lx_powerdown(struct fb_info *info);
 int lx_powerup(struct fb_info *info);
-#endif
-
 
 /* Graphics Processor registers (table 6-29 from the data book) */
 enum gp_registers {
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index adc2d9c2395e..66c81262d18f 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -443,17 +443,14 @@ static struct fb_info *lxfb_init_fbinfo(struct device *dev)
 	return info;
 }
 
-#ifdef CONFIG_PM
-static int lxfb_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused lxfb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(pdev);
+	struct fb_info *info = dev_get_drvdata(dev);
 
-	if (state.event == PM_EVENT_SUSPEND) {
-		console_lock();
-		lx_powerdown(info);
-		fb_set_suspend(info, 1);
-		console_unlock();
-	}
+	console_lock();
+	lx_powerdown(info);
+	fb_set_suspend(info, 1);
+	console_unlock();
 
 	/* there's no point in setting PCI states; we emulate PCI, so
 	 * we don't end up getting power savings anyways */
@@ -461,9 +458,9 @@ static int lxfb_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int lxfb_resume(struct pci_dev *pdev)
+static int __maybe_unused lxfb_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(pdev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	int ret;
 
 	console_lock();
@@ -477,10 +474,6 @@ static int lxfb_resume(struct pci_dev *pdev)
 	console_unlock();
 	return 0;
 }
-#else
-#define lxfb_suspend NULL
-#define lxfb_resume NULL
-#endif
 
 static int lxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
@@ -600,13 +593,23 @@ static struct pci_device_id lxfb_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, lxfb_id_table);
 
+static const struct dev_pm_ops lxfb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= lxfb_suspend,
+	.resume		= lxfb_resume,
+	.freeze		= NULL,
+	.thaw		= lxfb_resume,
+	.poweroff	= NULL,
+	.restore	= lxfb_resume,
+#endif
+};
+
 static struct pci_driver lxfb_driver = {
 	.name		= "lxfb",
 	.id_table	= lxfb_id_table,
 	.probe		= lxfb_probe,
 	.remove		= lxfb_remove,
-	.suspend	= lxfb_suspend,
-	.resume		= lxfb_resume,
+	.driver.pm	= &lxfb_pm_ops,
 };
 
 #ifndef MODULE
diff --git a/drivers/video/fbdev/geode/lxfb_ops.c b/drivers/video/fbdev/geode/lxfb_ops.c
index 5be8bc62844c..b3a041fce570 100644
--- a/drivers/video/fbdev/geode/lxfb_ops.c
+++ b/drivers/video/fbdev/geode/lxfb_ops.c
@@ -580,8 +580,6 @@ int lx_blank_display(struct fb_info *info, int blank_mode)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-
 static void lx_save_regs(struct lxfb_par *par)
 {
 	uint32_t filt;
@@ -837,5 +835,3 @@ int lx_powerup(struct fb_info *info)
 	par->powered_down = 0;
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
