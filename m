Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E0774E5F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8876A10E220;
	Tue,  8 Aug 2023 22:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-122.mta1.migadu.com (out-122.mta1.migadu.com
 [95.215.58.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EEC10E215
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:34:34 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691534073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQgYw5lX3SkYq1STywg88ED6q5FjX9omCE5FKYEvLx8=;
 b=V2b/yZWh7iqOPKRM+woaS0Pcn2y/ZwlopGA/To5CR6hBItv7RHn++t0bdatVP+jBdJY3WF
 XEy5JoecUt0pwfcntmWSCZuzjtsjWYXbh4aYIVQPplR1enGjSuBkUvCm7NtvjmK/1e2a/q
 t2IOEGUJZhKpiH+y+nQ3gBn4OCPe5HA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 05/11] PCI/VGA: Move the new_state assignment out of the
 loop
Date: Wed,  9 Aug 2023 06:34:06 +0800
Message-Id: <20230808223412.1743176-6-sui.jingfeng@linux.dev>
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

In the vga_arbiter_notify_clients() function, the value of the 'new_state'
variable will be 'false' on systems that have more than one VGA device.
The value will be 'true' if there is only one VGA device or no VGA device
at all. Hence, its value is not relevant to the iteration of the loop.

So move the assignment clause out of the loop. For a system with multiple
video cards, this patch saves unnecessary assignment.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index dc10a262fb5e..6883067a802a 100644
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
2.34.1

