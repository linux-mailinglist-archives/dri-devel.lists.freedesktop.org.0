Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78B4C3919
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0604F10E8F6;
	Thu, 24 Feb 2022 22:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EC510E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:48:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E366B829E1;
 Thu, 24 Feb 2022 22:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AD9C340E9;
 Thu, 24 Feb 2022 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742888;
 bh=zCrOTRI5fzfMxvY7mVKuiOfXQDcxs6WspZEbppc3uFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TNXk8OQnF2O6ltfLUVjr/p5x5xmcEhNQWg4I7g39zQ+VhJoQq9J/O2+D4mJkve1sD
 d0dSEsrDd8jbGGPs+8VBk2qIsaZSORBMUNVS/5X1PnO1rYwPKY67XHft3MhpNhDaqS
 ehdfVvsJy8VAxyOG9DMsbVLLRAjIkdbg5bZ3yAl0eXn76uICJGsKsGT7qBStQ+wx1n
 nOo7tJxXO6eGjDyox+4FUpXHKV1E9XawmGUwPfpuKR+2zZnj7jxVupPXjKWxwMrPVl
 9EkhlDrGG6V6r8Gfibmg1JYP56tYHmEAlkCJTeCV7DmIttTRr4O0UtZruhIEz5HB1r
 F4o9uY6CB6MoQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 02/11] PCI/VGA: Move vga_arb_integrated_gpu() earlier in
 file
Date: Thu, 24 Feb 2022 16:47:44 -0600
Message-Id: <20220224224753.297579-3-helgaas@kernel.org>
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

Move vga_arb_integrated_gpu() earlier in file to prepare for future patch.
No functional change intended.

[bhelgaas: pull #ifdefs inside function]
Link: https://lore.kernel.org/r/20211015061512.2941859-3-chenhuacai@loongson.cn
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/pci/vgaarb.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 8320385a487b..6c57ffb77770 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -565,6 +565,17 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
+static bool vga_arb_integrated_gpu(struct device *dev)
+{
+#if defined(CONFIG_ACPI)
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
+#else
+	return false;
+#endif
+}
+
 /*
  * Rules for using a bridge to control a VGA descendant decoding: if a bridge
  * has only one VGA descendant then it can be used to control the VGA routing
@@ -1430,20 +1441,6 @@ static struct miscdevice vga_arb_device = {
 	MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
 };
 
-#if defined(CONFIG_ACPI)
-static bool vga_arb_integrated_gpu(struct device *dev)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-
-	return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
-}
-#else
-static bool vga_arb_integrated_gpu(struct device *dev)
-{
-	return false;
-}
-#endif
-
 static void __init vga_arb_select_default_device(void)
 {
 	struct pci_dev *pdev, *found = NULL;
-- 
2.25.1

