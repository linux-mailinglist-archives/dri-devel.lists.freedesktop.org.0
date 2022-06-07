Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC24541F58
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852151122BE;
	Tue,  7 Jun 2022 23:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06581122BF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 23:11:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E690611E1;
 Tue,  7 Jun 2022 23:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10924C3411C;
 Tue,  7 Jun 2022 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654643482;
 bh=q/o80BpaLgRq9iVSp9QC1eQiLILACxZY1sBOydVH6c4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YSdiaQ8MPODZjy5tDCOevIDkXOoy9Rr3/RmUG+ckiC5TfPZsA1nM06aziSbFsTNRs
 jiczumAUXXeAqcsQUKVCqrNEiTOzLsAxvVlaofM0VxH86Mk0rncLhIjSpRjVaOA8pV
 yBgMr53BFgdhKNzguNpDfTAt/XgQ4ggsAlzKmN7WzwC+EIF6+rUJ1WDYsL4w0b/7oX
 3zS16NTTje4k6E60swxizXIxmNAmlj5otazvKI8Ll3RxrDKTAwZtueLgqgMcUl1owK
 QaplqBmQsZGJuh6XDxembUwbwKeh391b2pG1oj0ENjoN9Lg9pjqvdYCHFV0YlPuytd
 CNin5j+D8q3cQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] video: fbdev: skeletonfb: Convert to generic power
 management
Date: Tue,  7 Jun 2022 18:11:12 -0500
Message-Id: <20220607231112.354165-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607231112.354165-1-helgaas@kernel.org>
References: <20220607231112.354165-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

PCI-specific power management (pci_driver.suspend and pci_driver.resume) is
deprecated.  If drivers implement power management, they should use the
generic power management framework, not the PCI-specific hooks.

Convert the sample code to use the generic power management framework.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/video/fbdev/skeletonfb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index bcacfb6934fa..70ba78450837 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -838,9 +838,9 @@ static void xxxfb_remove(struct pci_dev *dev)
  *
  *      See Documentation/driver-api/pm/devices.rst for more information
  */
-static int xxxfb_suspend(struct pci_dev *dev, pm_message_t msg)
+static int xxxfb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct xxxfb_par *par = info->par;
 
 	/* suspend here */
@@ -853,9 +853,9 @@ static int xxxfb_suspend(struct pci_dev *dev, pm_message_t msg)
  *
  *      See Documentation/driver-api/pm/devices.rst for more information
  */
-static int xxxfb_resume(struct pci_dev *dev)
+static int xxxfb_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct xxxfb_par *par = info->par;
 
 	/* resume here */
@@ -873,14 +873,15 @@ static const struct pci_device_id xxxfb_id_table[] = {
 	{ 0, }
 };
 
+static SIMPLE_DEV_PM_OPS(xxxfb_pm_ops, xxxfb_suspend, xxxfb_resume);
+
 /* For PCI drivers */
 static struct pci_driver xxxfb_driver = {
 	.name =		"xxxfb",
 	.id_table =	xxxfb_id_table,
 	.probe =	xxxfb_probe,
 	.remove =	xxxfb_remove,
-	.suspend =      xxxfb_suspend, /* optional but recommended */
-	.resume =       xxxfb_resume,  /* optional but recommended */
+	.driver.pm =	xxxfb_pm_ops, /* optional but recommended */
 };
 
 MODULE_DEVICE_TABLE(pci, xxxfb_id_table);
-- 
2.25.1

