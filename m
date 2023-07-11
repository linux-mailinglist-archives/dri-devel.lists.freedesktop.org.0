Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CCB74F087
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16B710E39A;
	Tue, 11 Jul 2023 13:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-52.mta0.migadu.com (out-52.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2D510E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:44:22 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689083060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSELRnxi3WNW936UlC8GM9d7GKkUecfY1U1Y7wjl+uY=;
 b=xJyYazfcQNg5BkenFjHDBatlKKm0dhriClEVMtpSJ0VFseaNKgOJNiTxOUYiKr2cnh7/um
 z5uVCpJIXf9DPBH/tnLaP7PP4CYkNlRcgiB8Sgp3cf9dk1Aovox2BT0Ky6waQnsC7ENo6V
 Tlv9Vq/fuRA085J2lVe38D/l0AOB6/M=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sui@freedesktop.org, Jingfeng@loongson.cn
Subject: [PATCH 3/6] PCI/VGA: drop the inline of vga_update_device_decodes()
 function
Date: Tue, 11 Jul 2023 21:43:51 +0800
Message-Id: <20230711134354.755966-4-sui.jingfeng@linux.dev>
In-Reply-To: <20230711134354.755966-1-sui.jingfeng@linux.dev>
References: <20230711134354.755966-1-sui.jingfeng@linux.dev>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

The vga_update_device_decodes() function is NOT a trivial function, It is
not performance critical either. So, drop the inline.

This patch also make the parameter and argument consistent, use unsigned
int type instead of the signed type to store the decode. Change the second
argument of vga_update_device_decodes() function as 'unsigned int' type.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 021116ed61cb..668139f7c247 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -860,24 +860,24 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 	return ret;
 }
 
-/* this is called with the lock */
-static inline void vga_update_device_decodes(struct vga_device *vgadev,
-					     int new_decodes)
+/* This is called with the lock */
+static void vga_update_device_decodes(struct vga_device *vgadev,
+				      unsigned int new_decodes)
 {
 	struct device *dev = &vgadev->pdev->dev;
-	int old_decodes, decodes_removed, decodes_unlocked;
+	unsigned int old_decodes = vgadev->decodes;
+	unsigned int decodes_removed = ~new_decodes & old_decodes;
+	unsigned int decodes_unlocked = vgadev->locks & decodes_removed;
 
-	old_decodes = vgadev->decodes;
-	decodes_removed = ~new_decodes & old_decodes;
-	decodes_unlocked = vgadev->locks & decodes_removed;
 	vgadev->decodes = new_decodes;
 
-	vgaarb_info(dev, "changed VGA decodes: olddecodes=%s,decodes=%s:owns=%s\n",
-		vga_iostate_to_str(old_decodes),
-		vga_iostate_to_str(vgadev->decodes),
-		vga_iostate_to_str(vgadev->owns));
+	vgaarb_info(dev,
+		    "VGA decodes changed: olddecodes=%s,decodes=%s:owns=%s\n",
+		    vga_iostate_to_str(old_decodes),
+		    vga_iostate_to_str(vgadev->decodes),
+		    vga_iostate_to_str(vgadev->owns));
 
-	/* if we removed locked decodes, lock count goes to zero, and release */
+	/* If we removed locked decodes, lock count goes to zero, and release */
 	if (decodes_unlocked) {
 		if (decodes_unlocked & VGA_RSRC_LEGACY_IO)
 			vgadev->io_lock_cnt = 0;
-- 
2.25.1

