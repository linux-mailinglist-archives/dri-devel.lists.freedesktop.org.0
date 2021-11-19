Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D5456E30
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 12:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E7E6E4BA;
	Fri, 19 Nov 2021 11:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDE16E4BA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637321367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YNsvprf1D4tM6+4YGzakWjPMIUQacpxPSiAIWlnUZcE=;
 b=eyVfNWG0Kd88ut1Rl2qhwBW2L8YnCl9Qgh9kNPCELyCg89xO/lXqsNfuxxvARmLPjEDkmb
 apOPk7r3rGSlBTTwMWMAEwQfjH6vaKR6moWY0AvYT/X1NCHAA5OVLkC2ywpqoEPTcooJnq
 2/JQcaV+sYTeicTGbmeFgqcFMosSlv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-Ne7WM6Y4NKGckXIv6l9jIQ-1; Fri, 19 Nov 2021 06:29:21 -0500
X-MC-Unique: Ne7WM6Y4NKGckXIv6l9jIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C5C8799E0;
 Fri, 19 Nov 2021 11:29:20 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDB15100EB3D;
 Fri, 19 Nov 2021 11:29:10 +0000 (UTC)
From: Mohammed Gamal <mgamal@redhat.com>
To: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 decui@microsoft.com, drawat.floss@gmail.com
Subject: [PATCH] drm/hyperv: Fix device removal on Gen1 VMs
Date: Fri, 19 Nov 2021 12:29:00 +0100
Message-Id: <20211119112900.300537-1-mgamal@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: airlied@linux.ie, Mohammed Gamal <mgamal@redhat.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Hyper-V DRM driver tries to free MMIO region on removing
the device regardless of VM type, while Gen1 VMs don't use MMIO
and hence causing the kernel to crash on a NULL pointer dereference.

Fix this by making deallocating MMIO only on Gen2 machines and implement
removal for Gen1

Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")

Signed-off-by: Mohammed Gamal <mgamal@redhat.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index cd818a629183..9f923beb7d8d 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -225,12 +225,29 @@ static int hyperv_vmbus_remove(struct hv_device *hdev)
 {
 	struct drm_device *dev = hv_get_drvdata(hdev);
 	struct hyperv_drm_device *hv = to_hv(dev);
+	struct pci_dev *pdev;
 
 	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
 	vmbus_close(hdev->channel);
 	hv_set_drvdata(hdev, NULL);
-	vmbus_free_mmio(hv->mem->start, hv->fb_size);
+
+	/*
+	 * Free allocated MMIO memory only on Gen2 VMs.
+	 * On Gen1 VMs, release the PCI device
+	 */
+	if (efi_enabled(EFI_BOOT)) {
+		vmbus_free_mmio(hv->mem->start, hv->fb_size);
+	} else {
+		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
+				PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
+		if (!pdev) {
+			drm_err(dev, "Unable to find PCI Hyper-V video\n");
+			return -ENODEV;
+		}
+		pci_release_region(pdev, 0);
+		pci_dev_put(pdev);
+	}
 
 	return 0;
 }
-- 
2.33.1

