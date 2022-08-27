Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE65A37BD
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 15:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E3A10EC98;
	Sat, 27 Aug 2022 13:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E4810ECA1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661605436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yposfSgcqUNKXQMmnTeL+ByxLnXvpJUSRc1BSMzRTZA=;
 b=GpeTBAmm5uI7yh1phj3uyohNc18hzaS+ixE+mXtlJXfqRsfOntC7rs0f/ev/eZBEFpPH3z
 xca9tfHbPI4c3RAdhjsymYmvkVQ0taWoBeBonCSwWH4xP1BWDwDXzgIFyixIsszPVI5LnJ
 lpA1Bjq9FtGtmq7PL83jeaOy9l+1ipI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-6zWf5ZVLNc-QbXOqcCb8zw-1; Sat, 27 Aug 2022 09:03:53 -0400
X-MC-Unique: 6zWf5ZVLNc-QbXOqcCb8zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5FE71C0515C;
 Sat, 27 Aug 2022 13:03:52 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46052C15BB3;
 Sat, 27 Aug 2022 13:03:50 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v3 1/3] PCI: Move
 PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO definitions to pci_ids.h
Date: Sat, 27 Aug 2022 15:03:43 +0200
Message-Id: <20220827130345.1320254-2-vkuznets@redhat.com>
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

There are already three places in kernel which define PCI_VENDOR_ID_MICROSOFT
and two for PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these
from core Vmbus code. Move the defines where they belong.

No functional change.

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com> # pci_ids.h
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 3 ---
 drivers/net/ethernet/microsoft/mana/gdma_main.c | 4 ----
 drivers/video/fbdev/hyperv_fb.c                 | 4 ----
 include/linux/pci_ids.h                         | 3 +++
 4 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 6d11e7938c83..40888e36f91a 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -23,9 +23,6 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
-#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
-
 DEFINE_DRM_GEM_FOPS(hv_fops);
 
 static struct drm_driver hyperv_driver = {
diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
index 5f9240182351..00d8198072ae 100644
--- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
+++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
@@ -1465,10 +1465,6 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifndef PCI_VENDOR_ID_MICROSOFT
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
-#endif
-
 static const struct pci_device_id mana_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 886c564787f1..b58b445bb529 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -74,10 +74,6 @@
 #define SYNTHVID_DEPTH_WIN8 32
 #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
 
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
-#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
-
-
 enum pipe_msg_type {
 	PIPE_MSG_INVALID,
 	PIPE_MSG_DATA,
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 6feade66efdb..15b49e655ce3 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2079,6 +2079,9 @@
 #define PCI_DEVICE_ID_ICE_1712		0x1712
 #define PCI_DEVICE_ID_VT1724		0x1724
 
+#define PCI_VENDOR_ID_MICROSOFT		0x1414
+#define PCI_DEVICE_ID_HYPERV_VIDEO	0x5353
+
 #define PCI_VENDOR_ID_OXSEMI		0x1415
 #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
 #define PCI_DEVICE_ID_OXSEMI_PCIe840		0xC000
-- 
2.37.1

