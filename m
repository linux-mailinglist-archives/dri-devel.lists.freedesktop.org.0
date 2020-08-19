Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B198A24AFF2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB056E911;
	Thu, 20 Aug 2020 07:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8E56E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 18:59:50 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id h2so852813plr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pp7ILrXVpYWERUNp+y3FKEvGmfdJxafp13Cd61iIdo=;
 b=Mn+ymFH5Tc2xZr4mSSRBUl7CNfTA0DlesWU0Sq0Xu1T+OqneWcVq4ekASysyYI2ETT
 NOSB7C2Cedt19yXvJ2upXqZodaCRErUqHBJvXJ+y1AG0d1s3aeoXWgX4ydW1wonG1AQJ
 KyyYcwn0E1nHoVzOPWBujC3D3P2PPODBG13GhGBCib7jUZw+yShRX9TFZfqK5/8JvmIY
 Q9fAysRWcGK4QLyVjz9u8ryaERCmVOEyPJXSzbd+3ZARafIcqDvcV2dqniZXDul1xz43
 LQjdek9dXEkDQpvBHd7Ur9Oo/o0EtG2HR0sFPQG850ujw/PavQIQaX7UXDdE6ivpyEku
 Cp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pp7ILrXVpYWERUNp+y3FKEvGmfdJxafp13Cd61iIdo=;
 b=N1/Oaos/Wnq3wvm2dEQBROlSiH0U3hmIINt9l5zUTBoAN7cJJmpjhFMWi0MKtKTxYk
 cIEtZfmQca45Wssl5hGaeEeO0gbZqfFQWiXobiKJxVOCfrBYqbaRGd7uEWhBJxdFhewC
 ZXEJC0l2iy9tvwB8bBtdW/59OQE64fFD3GwrSDdgb1Pk/wxZxblP4MexOXC5X/SGM6mQ
 gMy6+EbE8RyU509Dhgoi9tD5sHCEKyTfoK7neMlkLucqnjskpPQKpTZK5C3sggOEDSBQ
 0VZ1sUMrYe6r/nJVPhktn49VE6yFx/opn4LKFcDt0j+FrNaYbJugof/5WW9cAXjCDMiD
 mrtg==
X-Gm-Message-State: AOAM530wQX+dhzI6a896Pjp0hVNsY8w6BykSHMHeBKhloWsBNd3cG7qY
 PvYeIvj8DpI94NqKUuV/afU=
X-Google-Smtp-Source: ABdhPJyPQYzgR72iLGG6L45iOOLTCC87J2wjbMAQqVqpLvOesvLqGUTY8VuELv+F5IyITtz4hTGtcA==
X-Received: by 2002:a17:90a:498b:: with SMTP id
 d11mr5130955pjh.179.1597863589786; 
 Wed, 19 Aug 2020 11:59:49 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:59:49 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v3 08/12] fbdev: cyber2000fb: use generic power management
Date: Thu, 20 Aug 2020 00:26:50 +0530
Message-Id: <20200819185654.151170-9-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. This way we can
remove the legacy .suspend & .resume bindings from "lxfb_driver".

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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
