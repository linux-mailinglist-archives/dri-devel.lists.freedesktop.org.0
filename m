Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8BA101FB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C259210E04D;
	Tue, 14 Jan 2025 08:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfQyC7X5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FB810E102
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736843221; x=1768379221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=APCJFUvNGNLvoHSnXBtSiamzFzPiWWqOvvKstFwnrpk=;
 b=IfQyC7X5xej4R03Z8Wic40eVnTkrAJgx1hkJkqQ55ftHxK5QmY9VAi8I
 kMijc0Dp7roDn/AmfHKKdkKNI+RMkWwm/ilVsvyNm9FxvrjsgNthtNFQH
 xdvIHNNQ64I4AmI1rrY9ykOHA7GHWQ43pY9Cked1/v9y+EnOzWbAURxrl
 8EQe7saaIeKSKpP1cy7jsdB73HYAWdVUJwgsTB9maBfSCKbcN+1DJ39uu
 lNAVVTR1Jt0Ba3pajJdBI8Rx6wiD4BTboZ5Qw16Y5rW8blOzMb/eziGKH
 hkS4rOCcsoX3OmA641xuizzjevIxdhdJHQMqgdNg+DL1CMcqXVTLi2s3M w==;
X-CSE-ConnectionGUID: 3KwYBjnpTjaxCril97TmKw==
X-CSE-MsgGUID: ZDL0jTElTrys3xsV9fqlXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47795085"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="47795085"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:27:00 -0800
X-CSE-ConnectionGUID: Kv42k/ZLTHqTWFtg98E6GA==
X-CSE-MsgGUID: T/EkgjJfRq6SCJUSNGacrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="104562849"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:26:56 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH] drm/virtio: Don't return error if virtio-gpu PCI dev is not
 found
Date: Mon, 13 Jan 2025 23:57:59 -0800
Message-ID: <20250114075759.2616551-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.47.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While fixing a shared VGA resource ownership issue, commit 5dd8b536bb
("drm/virtio: Lock the VGA resources during initialization") wrongly
assumed that there is always a PCI device associated with virtio-gpu
and it would return error if this device is not found during init.

This is incorrect, as virtio-gpu can be operated in MMIO mode (M68K)
where a PCI device would probably not be created for it. Therefore,
fix this issue by not erroring out if the associated PCI device is
not found during initialization.

Fixes: 5dd8b536bb ("drm/virtio: Lock the VGA resources during initialization")
Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index d4309dba557b..2d88e390feb4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -173,23 +173,24 @@ static int __init virtio_gpu_driver_init(void)
 	pdev = pci_get_device(PCI_VENDOR_ID_REDHAT_QUMRANET,
 			      PCI_DEVICE_ID_VIRTIO_GPU,
 			      NULL);
-	if (!pdev)
-		return -ENODEV;
-
-	if (pci_is_vga(pdev)) {
+	if (pdev && pci_is_vga(pdev)) {
 		ret = vga_get_interruptible(pdev,
 			VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM);
-		if (ret)
-			goto error;
+		if (ret) {
+			pci_dev_put(pdev);
+			return ret;
+		}
 	}
 
 	ret = register_virtio_driver(&virtio_gpu_driver);
 
-	if (pci_is_vga(pdev))
-		vga_put(pdev, VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM);
+	if (pdev) {
+		if (pci_is_vga(pdev))
+			vga_put(pdev,
+				VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM);
 
-error:
-	pci_dev_put(pdev);
+		pci_dev_put(pdev);
+	}
 
 	return ret;
 }
-- 
2.47.1

