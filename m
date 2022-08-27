Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6525A37B9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 15:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF8810ECA1;
	Sat, 27 Aug 2022 13:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528610EC98
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661605437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oYLP+2x7Pkqzzkqq4VihKJhfPzpTwkNdBTIupOYQYo=;
 b=Nt1yBE9hoIzQTxboGgXLbgY/Ep10UEjBXEMLkmHxSDblxTDC58Yk6oWiMPt5C/wFpq+YIY
 AeW0P+THSSEVwoIvmUmnIm44DvkMZOiNBj2KhVztu2mMJMi9KqUfiQOIEt59Y3McK4t5nQ
 xiDVUweolRz1jxsVIkhyyzhda/n7twE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-o9whNxK1N9C0xpAqrQg5Cg-1; Sat, 27 Aug 2022 09:03:56 -0400
X-MC-Unique: o9whNxK1N9C0xpAqrQg5Cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67B313802B83;
 Sat, 27 Aug 2022 13:03:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E79D6C15BC0;
 Sat, 27 Aug 2022 13:03:52 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v3 2/3] Drivers: hv: Always reserve framebuffer region for
 Gen1 VMs
Date: Sat, 27 Aug 2022 15:03:44 +0200
Message-Id: <20220827130345.1320254-3-vkuznets@redhat.com>
In-Reply-To: <20220827130345.1320254-1-vkuznets@redhat.com>
References: <20220827130345.1320254-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-pci@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmbus_reserve_fb() tries reserving framebuffer region iff
'screen_info.lfb_base' is set. Gen2 VMs seem to have it set by EFI
and/or by the kernel EFI FB driver (or, in some edge cases like kexec,
the address where the buffer was moved, see
https://lore.kernel.org/all/20201014092429.1415040-1-kasong@redhat.com/)
but on Gen1 VM it depends on bootloader behavior. With grub, it depends
on 'gfxpayload=' setting but in some cases it is observed to be zero.
That being said, relying on 'screen_info.lfb_base' to reserve
framebuffer region is risky. For Gen1 VMs, it should always be
possible to get the address from the dedicated PCI device instead.

Check for legacy PCI video device presence and reserve the whole
region for framebuffer on Gen1 VMs.

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/hv/vmbus_drv.c | 46 +++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 23c680d1a0f5..536f68e563c6 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -35,6 +35,7 @@
 #include <linux/kernel.h>
 #include <linux/syscore_ops.h>
 #include <linux/dma-map-ops.h>
+#include <linux/pci.h>
 #include <clocksource/hyperv_timer.h>
 #include "hyperv_vmbus.h"
 
@@ -2262,26 +2263,43 @@ static int vmbus_acpi_remove(struct acpi_device *device)
 
 static void vmbus_reserve_fb(void)
 {
-	int size;
+	resource_size_t start = 0, size;
+	struct pci_dev *pdev;
+
+	if (efi_enabled(EFI_BOOT)) {
+		/* Gen2 VM: get FB base from EFI framebuffer */
+		start = screen_info.lfb_base;
+		size = max_t(__u32, screen_info.lfb_size, 0x800000);
+	} else {
+		/* Gen1 VM: get FB base from PCI */
+		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
+				      PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
+		if (!pdev)
+			return;
+
+		if (pdev->resource[0].flags & IORESOURCE_MEM) {
+			start = pci_resource_start(pdev, 0);
+			size = pci_resource_len(pdev, 0);
+		}
+
+		/*
+		 * Release the PCI device so hyperv_drm or hyperv_fb driver can
+		 * grab it later.
+		 */
+		pci_dev_put(pdev);
+	}
+
+	if (!start)
+		return;
+
 	/*
 	 * Make a claim for the frame buffer in the resource tree under the
 	 * first node, which will be the one below 4GB.  The length seems to
 	 * be underreported, particularly in a Generation 1 VM.  So start out
 	 * reserving a larger area and make it smaller until it succeeds.
 	 */
-
-	if (screen_info.lfb_base) {
-		if (efi_enabled(EFI_BOOT))
-			size = max_t(__u32, screen_info.lfb_size, 0x800000);
-		else
-			size = max_t(__u32, screen_info.lfb_size, 0x4000000);
-
-		for (; !fb_mmio && (size >= 0x100000); size >>= 1) {
-			fb_mmio = __request_region(hyperv_mmio,
-						   screen_info.lfb_base, size,
-						   fb_mmio_name, 0);
-		}
-	}
+	for (; !fb_mmio && (size >= 0x100000); size >>= 1)
+		fb_mmio = __request_region(hyperv_mmio, start, size, fb_mmio_name, 0);
 }
 
 /**
-- 
2.37.1

