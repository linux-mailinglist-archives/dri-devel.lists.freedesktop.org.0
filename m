Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D93D2F30
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 23:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3951D6F388;
	Thu, 22 Jul 2021 21:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4A96F3DC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:29:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D76A360EC0;
 Thu, 22 Jul 2021 21:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626989382;
 bh=rDBL/DrcxrM8sheIRMWXyOuRj4OssHldiIThz+01+pY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DmfvhOpcAxbW/UiRPvCqM03W5cJOJiAlpzo22zaQ90A+ExUd0uxu1P0okeL5YpCAM
 Mi6WIFUINXsMzeNbvK5hTyz6eIKH6zjbeVNKQ1r9x07laE5Sqwq0L8fYtbvOap06+N
 Oq8TYHIAeZjNsRX0DrOaosP4RgDP/Hz+dQFaQ+zbInHUsLFxUhPISOIt9bImV+zqGH
 CUZD16SDwmnxVX2StqT9LrQBrMzUgUv2g8yvEeSce8hnm2Np6IC/+VMqkgvGmb1o/W
 LvnvdAc9Tv++phZtC1g9BSWYfeWWYJmGFG4XhGjGsAp4GJr4pC35cBKB5x9t/WtofI
 pa0Ji3q9VD6zQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v2 7/9] PCI/VGA: Split out vga_arb_update_default_device()
Date: Thu, 22 Jul 2021 16:29:18 -0500
Message-Id: <20210722212920.347118-8-helgaas@kernel.org>
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

If there's no default VGA device, and we find a VGA device that owns the
legacy VGA resources, we make that device the default.  Split this logic
out from vga_arbiter_add_pci_device() into a new function,
vga_arb_update_default_device().

[bhelgaas: split another piece to separate patch]
Link: https://lore.kernel.org/r/20210705100503.1120643-1-chenhuacai@loongson.cn
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/vgaarb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index a6a5864ff538..4cecb599f5ed 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -577,6 +577,21 @@ static bool vga_arb_integrated_gpu(struct device *dev)
 }
 #endif
 
+static void vga_arb_update_default_device(struct vga_device *vgadev)
+{
+	struct pci_dev *pdev = vgadev->pdev;
+
+	/*
+	 * If we don't have a default VGA device yet, and this device owns
+	 * the legacy VGA resources, make it the default.
+	 */
+	if (!vga_default_device() &&
+	    ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
+		vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
+		vga_set_default_device(pdev);
+	}
+}
+
 /*
  * Rules for using a bridge to control a VGA descendant decoding: if a bridge
  * has only one VGA descendant then it can be used to control the VGA routing
@@ -704,15 +719,7 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 		bus = bus->parent;
 	}
 
-	/* Deal with VGA default device. Use first enabled one
-	 * by default if arch doesn't have it's own hook
-	 */
-	if (!vga_default_device() &&
-	    ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
-		vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
-		vga_set_default_device(pdev);
-	}
-
+	vga_arb_update_default_device(vgadev);
 	vga_arbiter_check_bridge_sharing(vgadev);
 
 	/* Add to the list */
-- 
2.25.1

