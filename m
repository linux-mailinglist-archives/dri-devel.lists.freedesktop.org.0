Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0115A0C27
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 11:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9AC10F5B6;
	Thu, 25 Aug 2022 09:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607AD10F5B6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661418036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23P3Co+/Djz33H05V6CMmPYXP2reF7URWbDmqqAYxBY=;
 b=dsXWoL5EUkaYKiryxWUYJBVGs6frl7QbZWy+aM3v4WJxqTUcNZH3/2yYTLNggK0t5aL2Ch
 Ag68kAA7V7FKJ9svn7eFLJkHEH0VdJngOrFSV0T560C2waCPChFYC3WmAlneh41qum/kNy
 rf+7VLaMhAyeSgaBK5ibqzRD15FDCdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-AtI0Dh6tPtakz3ZlsfTqMg-1; Thu, 25 Aug 2022 05:00:33 -0400
X-MC-Unique: AtI0Dh6tPtakz3ZlsfTqMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD0773C0F37A;
 Thu, 25 Aug 2022 09:00:32 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4826440B40C8;
 Thu, 25 Aug 2022 09:00:30 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v2 2/3] Drivers: hv: Always reserve framebuffer region for
 Gen1 VMs
Date: Thu, 25 Aug 2022 11:00:23 +0200
Message-Id: <20220825090024.1007883-3-vkuznets@redhat.com>
In-Reply-To: <20220825090024.1007883-1-vkuznets@redhat.com>
References: <20220825090024.1007883-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
'screen_info.lfb_base' is set. Gen2 VMs seem to have it set by EFI fb
(or, in some edge cases like kexec, the address where the buffer was
moved, see
https://lore.kernel.org/all/20201014092429.1415040-1-kasong@redhat.com/)
but on Gen1 VM it depends on bootloader behavior. With grub, it depends
on 'gfxpayload=' setting but in some cases it is observed to be zero.
Relying on 'screen_info.lfb_base' to reserve framebuffer region is
risky. Instead, it is possible to get the address from the dedicated
PCI device which is always present.

Check for legacy PCI video device presence and reserve the whole
region for framebuffer on Gen1 VMs.

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

