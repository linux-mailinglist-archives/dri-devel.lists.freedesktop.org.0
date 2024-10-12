Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCEB99B5C4
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 17:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB16810E1DB;
	Sat, 12 Oct 2024 15:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Err1FrX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5607C10E1DB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 15:07:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49CF7ET0056320;
 Sat, 12 Oct 2024 10:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1728745634;
 bh=DFrowa/lRkObQyt3XVRqE/xAlxLVA1L+zikIaNZbF4k=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Err1FrX8cRE5U3MTNSE6V806LQ4H4O9JtEmeGWP7K+VKwrwyX85PQCYXiXwEfcBZL
 jc079+Paok4msDA/xaXI74oRZbeOrl2d/K3Zg3IGZAV0JiOlr48hgMNEleXVaWXzYk
 oA5W42TOP53sPZIW4DAWGub+IlUGTKWKLP3k6KI0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49CF7Ec2019370
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 12 Oct 2024 10:07:14 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Oct 2024 10:07:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Oct 2024 10:07:13 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49CF7CL6030314;
 Sat, 12 Oct 2024 10:07:13 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <sam@ravnborg.org>,
 <bparrot@ti.com>, <jcormier@criticallink.com>, <devarsht@ti.com>
Subject: [PATCH 1/2] drm/tidss: Clear the interrupt status for interrupts
 being disabled
Date: Sat, 12 Oct 2024 20:37:09 +0530
Message-ID: <20241012150710.261767-2-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241012150710.261767-1-devarsht@ti.com>
References: <20241012150710.261767-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

It is possible that dispc_{k2g/k3}_set_irqenable can be called for
disabling some interrupt events which were previously enabled. However
instead of clearing any pending events for the interrupt events that are
required to be disabled, it was instead clearing the new interrupt events
which were not even enabled. 

For e.g. While disabling the vsync events, dispc_k3_set_irqenable tries to
clear DSS_IRQ_DEVICE_OCP_ERR which was not enabled per the old_mask at all
as shown below :

"dispc_k3_set_irqenable : irqenabled - mask = 91, old = f0, clr = 1" where
clr = (mask ^ old_mask) & old_mask

This corrects the bit mask to make sure that it always clears any pending
interrupt events that are requested to be disabled before disabling them
actually.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Reported-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 1ad711f8d2a8..b04419b24863 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -700,8 +700,8 @@ void dispc_k2g_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 {
 	dispc_irq_t old_mask = dispc_k2g_read_irqenable(dispc);
 
-	/* clear the irqstatus for newly enabled irqs */
-	dispc_k2g_clear_irqstatus(dispc, (mask ^ old_mask) & mask);
+	/* clear the irqstatus for irqs that are being disabled now */
+	dispc_k2g_clear_irqstatus(dispc, (mask ^ old_mask) & old_mask);
 
 	dispc_k2g_vp_set_irqenable(dispc, 0, mask);
 	dispc_k2g_vid_set_irqenable(dispc, 0, mask);
@@ -843,8 +843,8 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
 
 	old_mask = dispc_k3_read_irqenable(dispc);
 
-	/* clear the irqstatus for newly enabled irqs */
-	dispc_k3_clear_irqstatus(dispc, (old_mask ^ mask) & mask);
+	/* clear the irqstatus for irqs that are being disabled now */
+	dispc_k3_clear_irqstatus(dispc, (old_mask ^ mask) & old_mask);
 
 	for (i = 0; i < dispc->feat->num_vps; ++i) {
 		dispc_k3_vp_set_irqenable(dispc, i, mask);
-- 
2.39.1

