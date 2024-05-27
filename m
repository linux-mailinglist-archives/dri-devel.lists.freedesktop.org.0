Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A098D052C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9949110E4E4;
	Mon, 27 May 2024 15:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="cURU/Aju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2633910E8D8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:36 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716822151; bh=mO1wTBrjD0PxLOyQ4AqovbqlEFzmz5ozW7rB391zFZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cURU/AjuxgUwR+8nWz1e4LtyXs/e1DBcpK1wFmxlXep0ObfgsF5ZvgtPS+d1JnRxA
 IDCRW/4Q3AqLNCwF8+pE/UIHPPfOy17xNm2u4UmbHubR8HHKn/mLwi24TOgL9ARuY3
 SgAxj0YCbgtYPDjAPpVD0+tRVCv5Mwlr//PIZFxz92HZhXJ/E9QzANce44CgngQVa6
 n3GgTwg7LvtvysfhUUHW4uv3O/Ke6DreKA38CmDl//SOQWDafxsMm7tE8Dk+I9kQwK
 a95TKV6v7BESJqVpzvIKI0wBbPga4hVmshbGBnMIQd/H+b+2L1NRqxgzYdbNlfLXb+
 SV8Zm+6KAnVaw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RF2PiZ1954007; Mon, 27 May 2024 18:02:26 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tal Cohen <talcohen@habana.ai>
Subject: [PATCH 8/8] accel/habanalabs: disable EQ interrupt after disabling pci
Date: Mon, 27 May 2024 18:02:24 +0300
Message-Id: <20240527150224.1953969-8-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527150224.1953969-1-obitton@habana.ai>
References: <20240527150224.1953969-1-obitton@habana.ai>
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

From: Tal Cohen <talcohen@habana.ai>

When sending disable pci msg towards firmware, there is a
possibility that an EQ packet is already pending,
disabling EQ interrupt will prevent this from happening.
The interrupt will be re-enabled after reset.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 5ca7014def00..78e65c6b76a7 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1502,10 +1502,11 @@ static void send_disable_pci_access(struct hl_device *hdev, u32 flags)
 		if (hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0))
 			return;
 
-		/* verify that last EQs are handled before disabled is set */
+		/* disable_irq also generates sync irq, this verifies that last EQs are handled
+		 * before disabled is set. The IRQ will be enabled again in request_irq call.
+		 */
 		if (hdev->cpu_queues_enable)
-			synchronize_irq(pci_irq_vector(hdev->pdev,
-					hdev->asic_prop.eq_interrupt_id));
+			disable_irq(pci_irq_vector(hdev->pdev, hdev->asic_prop.eq_interrupt_id));
 	}
 }
 
-- 
2.34.1

