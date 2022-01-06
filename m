Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3F485CE7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AA910E53F;
	Thu,  6 Jan 2022 00:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1610E53A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:07:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85B97B81E5B;
 Thu,  6 Jan 2022 00:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAF8C36AE9;
 Thu,  6 Jan 2022 00:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641427646;
 bh=S7SdNo1VNpzaamjfYJNlC8obavkWhiss2wA+rwzSTJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FwA7kPtNWW6ggve83Ha+lSthggzduAq7XxntpXOko/s5wSZJr8CDdt6/taui9lum7
 o15P90zbodX93EDa7o+Hnaoj+nCeRO9LqNbNK0nOdkLKQKZZWuITF6jZ+50mza80tf
 IWHlGRnfPZCloT2wcRc5i3dIBRfQF7T4jIF/Ol7egm9o812vkScv1E5MCP54WXni9i
 b787dZ+6HTop4qy6LZGc9avWuWmwGCvQa6cExRaWNZQUMTByqDDk5CUfLCGltstC6t
 HBDzshv1Bot9bS/TUDhxg3qf0v0w83fKiFFmJSm+ljOMqgnR44J6ra1XueAlS7Gv+W
 Wg5ot5rLJ9m9g==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v8 08/10] vgaarb: Log bridge control messages when adding
 devices
Date: Wed,  5 Jan 2022 18:06:56 -0600
Message-Id: <20220106000658.243509-9-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106000658.243509-1-helgaas@kernel.org>
References: <20220106000658.243509-1-helgaas@kernel.org>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
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
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/vga/vgaarb.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 455cf048fae8..b7e6c1228fff 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
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

