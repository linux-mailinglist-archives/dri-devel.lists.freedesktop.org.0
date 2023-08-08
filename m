Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DA774E5B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192F110E215;
	Tue,  8 Aug 2023 22:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-79.mta1.migadu.com (out-79.mta1.migadu.com
 [IPv6:2001:41d0:203:375::4f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E81910E215
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:34:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691534076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzZwtUzLVgyigIZtu0FTQnFL+tgS0hu77QEo/xERbug=;
 b=DGYotxqNLyZsNF2IhhW+hGPcxHM/d9eMPF9lhqKC3341P3IrJ+qrPvpcLToq9oBZD1PR0F
 A2j9JANAQEm7SnZ98HhQ6RDX0BuJJNhpHUfinaFEM9j29EBLRlA84huObzAoFTeTMViyZD
 1oWz4mA51DDBJiuVfb30E9SV7R7bhqY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 07/11] PCI/VGA: vga_client_register() return -ENODEV on
 failure, not -1
Date: Wed,  9 Aug 2023 06:34:08 +0800
Message-Id: <20230808223412.1743176-8-sui.jingfeng@linux.dev>
In-Reply-To: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Fixes: 934f992c763a ("drm/i915: Recognise non-VGA display devices")
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 811510253553..a6b8c0def35d 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -964,7 +964,7 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  *
  * To unregister just call vga_client_unregister().
  *
- * Returns: 0 on success, -1 on failure
+ * Returns: 0 on success, -ENODEV on failure
  */
 int vga_client_register(struct pci_dev *pdev,
 		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
@@ -975,16 +975,13 @@ int vga_client_register(struct pci_dev *pdev,
 
 	spin_lock_irqsave(&vga_lock, flags);
 	vgadev = vgadev_find(pdev);
-	if (!vgadev)
-		goto bail;
-
-	vgadev->set_decode = set_decode;
-	ret = 0;
-
-bail:
+	if (vgadev) {
+		vgadev->set_decode = set_decode;
+		ret = 0;
+	}
 	spin_unlock_irqrestore(&vga_lock, flags);
-	return ret;
 
+	return ret;
 }
 EXPORT_SYMBOL(vga_client_register);
 
-- 
2.34.1

