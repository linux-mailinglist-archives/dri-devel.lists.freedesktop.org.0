Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD135985B9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EB6C195D;
	Thu, 18 Aug 2022 14:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6641BB9C83
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660832725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIDqzcZGlp+4QMAFK7ua+1esufE/cwW7LaxUX2qJezI=;
 b=UaLCl/KDD1co3Hw2lUSWyZMPCUxgKha+JMJOGNAbX6cQSEHclQI/n/rS9gR/+8hvkzPYPo
 Nw+dHietkOVXlb4goUgm7veEtdN+nzvDbUK0QpXgnSfkmRhuMBfZV0IX42HeyfnqvZzpOV
 BQuQoLknDYeoW+l7BUK1Y0u9COW2S38=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-Vd7tPDnuO9-Q7pC41Cs1Pg-1; Thu, 18 Aug 2022 10:25:18 -0400
X-MC-Unique: Vd7tPDnuO9-Q7pC41Cs1Pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7DD51C05132;
 Thu, 18 Aug 2022 14:25:17 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D99D5C15BB8;
 Thu, 18 Aug 2022 14:25:15 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v1 3/4] Drivers: hv: Always reserve framebuffer region for
 Gen1 VMs
Date: Thu, 18 Aug 2022 16:25:07 +0200
Message-Id: <20220818142508.402273-4-vkuznets@redhat.com>
In-Reply-To: <20220818142508.402273-1-vkuznets@redhat.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
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
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Deepak Rawat <drawat.floss@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmbus_reserve_fb() tries reserving framebuffer region iff
screen_info.lfb_base is set. Gen2 VMs seem to have it set by EFI fb
but on Gen1 VM it is observed to be zero. In fact, we do not need to
rely on some other video driver setting it correctly as Gen1 VMs have
a dedicated PCI device to look at. Both Hyper-V DRM and Hyper-V FB
drivers get framebuffer base from this PCI device already so Vmbus
driver can do the same trick.

Check for legacy PCI video device presence and reserve the whole
region for framebuffer.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/hv/vmbus_drv.c | 47 +++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 547ae334e5cd..6edaeefa2c3c 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -35,6 +35,7 @@
 #include <linux/kernel.h>
 #include <linux/syscore_ops.h>
 #include <linux/dma-map-ops.h>
+#include <linux/pci.h>
 #include <clocksource/hyperv_timer.h>
 #include "hyperv_vmbus.h"
 
@@ -2258,26 +2259,44 @@ static int vmbus_acpi_remove(struct acpi_device *device)
 
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
+		if (!(pdev->resource[0].flags & IORESOURCE_MEM))
+			return;
+
+		start = pci_resource_start(pdev, 0);
+		size = pci_resource_len(pdev, 0);
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

