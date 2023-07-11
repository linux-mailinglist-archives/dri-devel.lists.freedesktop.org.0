Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151574F088
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8314D10E39F;
	Tue, 11 Jul 2023 13:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-62.mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAD710E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:44:25 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689083063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIy4iyC9nuH2OGqIfvEGjD1H7yPmKE3hN2OnCkSSwos=;
 b=M5PbJsEas/pXLhY4bwrSzQ/fEGUVORpMVmQVcHLy3OjgNETQPgCHeJLRfbT1A5TZr4ofaV
 dciq2+E7wwBjI1+3/pnGDRSITsSwsg8a3lf3w7+pXO+C1xXKSp248NOmqPKXo1bWwUIb/l
 Vf2D+/G31gJ7u+EAJbM2VTSEsHDQm6s=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sui@freedesktop.org, Jingfeng@loongson.cn
Subject: [PATCH 4/6] PCI/VGA: Move the new_state assignment out the loop
Date: Tue, 11 Jul 2023 21:43:52 +0800
Message-Id: <20230711134354.755966-5-sui.jingfeng@linux.dev>
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

In the vga_arbiter_notify_clients() function, the value of the 'new_state'
variable will be 'false' on systems that have more than one PCI VGA card.
Its value will be 'true' on systems that have one or no PCI VGA compatible
card. In other words, its value is not relevant to the iteration, so move
the assignment () out of the loop.

For a system with multiple video cards, this patch saves the redundant
assignment.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 668139f7c247..4c448c758bab 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -1468,22 +1468,20 @@ static void vga_arbiter_notify_clients(void)
 {
 	struct vga_device *vgadev;
 	unsigned long flags;
-	uint32_t new_decodes;
-	bool new_state;
+	bool state;
 
 	if (!vga_arbiter_used)
 		return;
 
+	state = (vga_count > 1) ? false : true;
+
 	spin_lock_irqsave(&vga_lock, flags);
 	list_for_each_entry(vgadev, &vga_list, list) {
-		if (vga_count > 1)
-			new_state = false;
-		else
-			new_state = true;
 		if (vgadev->set_decode) {
-			new_decodes = vgadev->set_decode(vgadev->pdev,
-							 new_state);
-			vga_update_device_decodes(vgadev, new_decodes);
+			unsigned int decodes;
+
+			decodes = vgadev->set_decode(vgadev->pdev, state);
+			vga_update_device_decodes(vgadev, decodes);
 		}
 	}
 	spin_unlock_irqrestore(&vga_lock, flags);
-- 
2.25.1

