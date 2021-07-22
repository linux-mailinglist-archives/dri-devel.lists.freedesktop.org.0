Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025B3D2F2C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 23:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA506EEAA;
	Thu, 22 Jul 2021 21:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17206ECE5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:29:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F1B060C41;
 Thu, 22 Jul 2021 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626989378;
 bh=jzI4K0thGJA1hYgjMq9AeGLmE9HeNM6DZi9oIzIppys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/Cz/zr3klCDL8wPUjP5VrC4X/FslhOLTp7JbvxX+f0NBrSFiTiIEKOFbecMBGbtE
 ZOKxnjYy+XbsYdkEWspu64XXYlxq205X4H81mQnWKAl7CAjHeMeN85/4YMvJQOt4Hp
 +5Fb2gljR+gsviWyxROLE0evWIr0fnKBzp529KiypXrwW70THxu3BLfXQxNcPOMf9N
 i5mX7KWhsPIm7m0ABC1yiU+HFzgStMdWbueDYlPt/Ge0OSbn8C5a5azqQBCFAignl5
 pUrPAavTxITT0v/jlSqxt5oowCIcGZ+KN2U51oWt02sft/dG3FNWUrPmgLJil3Krd6
 +MfANMJEmrHhw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v2 5/9] PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
Date: Thu, 22 Jul 2021 16:29:16 -0500
Message-Id: <20210722212920.347118-6-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722212920.347118-1-helgaas@kernel.org>
References: <20210722212920.347118-1-helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Huacai Chen <chenhuacai@loongson.cn>

Move vga_arb_integrated_gpu() earlier in file to prepare for future patch.
No functional change intended.

[bhelgaas: split to separate patch]
Link: https://lore.kernel.org/r/20210705100503.1120643-1-chenhuacai@loongson.cn
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/vgaarb.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index c984c76b3fd7..1f8fb37be5fa 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -563,6 +563,20 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
+#if defined(CONFIG_ACPI)
+static bool vga_arb_integrated_gpu(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
+}
+#else
+static bool vga_arb_integrated_gpu(struct device *dev)
+{
+	return false;
+}
+#endif
+
 /*
  * Rules for using a bridge to control a VGA descendant decoding: if a bridge
  * has only one VGA descendant then it can be used to control the VGA routing
@@ -1416,20 +1430,6 @@ static struct miscdevice vga_arb_device = {
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

