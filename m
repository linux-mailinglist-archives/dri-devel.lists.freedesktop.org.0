Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31278D582
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8710E4F1;
	Wed, 30 Aug 2023 11:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 526 seconds by postgrey-1.36 at gabe;
 Wed, 30 Aug 2023 11:24:31 UTC
Received: from out-247.mta0.migadu.com (out-247.mta0.migadu.com
 [91.218.175.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25AF10E12C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 11:24:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693394153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yb+XrAs7p/uVFQHI/WIGJJnBL8UHr9s0W2yc+Aw9HB8=;
 b=DQIPbHXjCEL1XRjgI8qUIGrjENjBVN+8g0H3qkTlRv717qujOhlbI9f+qb7WgC0HTu7QOb
 VjyHUqq8o/liZ/z0nM++7ft8suZFkjs9/5dLwbuH9A2fg2mBgYjKd5q2bDT24iINXpmHAw
 9/WBfPgfyJ3eM/e/WPmvRCpLd8xkXzY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [-next 5/5] drm/qxl: Switch to pci_is_vga()
Date: Wed, 30 Aug 2023 19:15:32 +0800
Message-Id: <20230830111532.444535-6-sui.jingfeng@linux.dev>
In-Reply-To: <20230830111532.444535-1-sui.jingfeng@linux.dev>
References: <20230830111532.444535-1-sui.jingfeng@linux.dev>
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
 virtualization@lists.linux-foundation.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Should be no functional change, just for cleanup purpose.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index a3b83f89e061..08586bd2448f 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -68,11 +68,6 @@ module_param_named(num_heads, qxl_num_crtc, int, 0400);
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-static bool is_vga(struct pci_dev *pdev)
-{
-	return pdev->class == PCI_CLASS_DISPLAY_VGA << 8;
-}
-
 static int
 qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
@@ -100,7 +95,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto disable_pci;
 
-	if (is_vga(pdev) && pdev->revision < 5) {
+	if (pci_is_vga(pdev) && pdev->revision < 5) {
 		ret = vga_get_interruptible(pdev, VGA_RSRC_LEGACY_IO);
 		if (ret) {
 			DRM_ERROR("can't get legacy vga ioports\n");
@@ -131,7 +126,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 unload:
 	qxl_device_fini(qdev);
 put_vga:
-	if (is_vga(pdev) && pdev->revision < 5)
+	if (pci_is_vga(pdev) && pdev->revision < 5)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 disable_pci:
 	pci_disable_device(pdev);
@@ -159,7 +154,7 @@ qxl_pci_remove(struct pci_dev *pdev)
 
 	drm_dev_unregister(dev);
 	drm_atomic_helper_shutdown(dev);
-	if (is_vga(pdev) && pdev->revision < 5)
+	if (pci_is_vga(pdev) && pdev->revision < 5)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 }
 
-- 
2.34.1

