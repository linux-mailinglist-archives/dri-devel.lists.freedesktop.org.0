Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1B4C3918
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E270010E8F0;
	Thu, 24 Feb 2022 22:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9910E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:48:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83089B829E2;
 Thu, 24 Feb 2022 22:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE201C340E9;
 Thu, 24 Feb 2022 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742902;
 bh=WsI9+ns+zf8pTfM0e7lrNva8Pq9/6NNaMQeyS3JWV+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tB6DjIkg9nTU06U1CNJlwuCgn8MbPHm5TKYehHIyvS30JyOorKIuL3lSGCs5/TuNj
 p28f3AJAgMmgd6EIMkjzwZt22R/vk6Nq6kMIAcAX1bxQVyCct/A4aGjwW5aIad8+Uf
 mtd8/ny9wkBWJj00Uuwi5QtmEvZGJ5UPqY8o+NlQd/HJ/7bzHm6td8tfj4DUsFnASk
 16pjFntgiOxQ/e4EN0mO3Q5rHkhBQ4g+uDUKKwTB5+uBCJYZja6B/wAMgeWFP0pKyo
 BpN8DbxSuAchs8Qj/D0oo8kXRcCHhTArD9hi1AFBRl9VLw6XsfetikVrkApHRbufj5
 06cVMoAAij2Wg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 09/11] PCI/VGA: Log bridge control messages when adding
 devices
Date: Thu, 24 Feb 2022 16:47:51 -0600
Message-Id: <20220224224753.297579-10-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224224753.297579-1-helgaas@kernel.org>
References: <20220224224753.297579-1-helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Huacai Chen <chenhuacai@loongson.cn>

Previously vga_arb_device_init() iterated through all VGA devices and
indicated whether legacy VGA routing to each could be controlled by an
upstream bridge.

But we determine that information in vga_arbiter_add_pci_device(), which we
call for every device, so we can log it there without iterating through the
VGA devices again.

Note that we call vga_arbiter_check_bridge_sharing() before adding the
device to vga_list, so we have to handle the very first device separately.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/pci/vgaarb.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 582f0054b71a..7b1bfdea9d10 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -719,8 +719,10 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 
 	vgadev->bridge_has_one_vga = true;
 
-	if (list_empty(&vga_list))
+	if (list_empty(&vga_list)) {
+		vgaarb_info(&vgadev->pdev->dev, "bridge control possible\n");
 		return;
+	}
 
 	/* okay iterate the new devices bridge hierarachy */
 	new_bus = vgadev->pdev->bus;
@@ -759,6 +761,11 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 		}
 		new_bus = new_bus->parent;
 	}
+
+	if (vgadev->bridge_has_one_vga)
+		vgaarb_info(&vgadev->pdev->dev, "bridge control possible\n");
+	else
+		vgaarb_info(&vgadev->pdev->dev, "no bridge control possible\n");
 }
 
 /*
@@ -1557,7 +1564,6 @@ static int __init vga_arb_device_init(void)
 {
 	int rc;
 	struct pci_dev *pdev;
-	struct vga_device *vgadev;
 
 	rc = misc_register(&vga_arb_device);
 	if (rc < 0)
@@ -1573,15 +1579,6 @@ static int __init vga_arb_device_init(void)
 			       PCI_ANY_ID, pdev)) != NULL)
 		vga_arbiter_add_pci_device(pdev);
 
-	list_for_each_entry(vgadev, &vga_list, list) {
-		struct device *dev = &vgadev->pdev->dev;
-
-		if (vgadev->bridge_has_one_vga)
-			vgaarb_info(dev, "bridge control possible\n");
-		else
-			vgaarb_info(dev, "no bridge control possible\n");
-	}
-
 	pr_info("loaded\n");
 	return rc;
 }
-- 
2.25.1

