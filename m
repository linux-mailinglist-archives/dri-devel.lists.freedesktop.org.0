Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96059A6BA2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC310E527;
	Mon, 21 Oct 2024 14:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dyJ9w6Ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9141710E520
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:18 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A51D11775;
 Mon, 21 Oct 2024 16:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729519591;
 bh=VBitCg4mmzcbGyGk6q4vLoLZGA6NGjSGxDJCUaNRvRA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dyJ9w6Oty908otkRxZOKWO1PS3cEDZdAKt2iIRMvLHuGuuCX/0JwLMK7d6NWRnI/j
 qjbgEVn9R6ktyaVu93CSVA1IglJPShVcR/OSXw0dD190svCH3FldrVTZbfN+Xsmj9w
 wa/8z2popAW6glKGFqdfmy0/dOgsZcijA39X0TZM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 21 Oct 2024 17:07:45 +0300
Subject: [PATCH 1/7] drm/tidss: Fix issue in irq handling causing irq-flood
 issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-tidss-irq-fix-v1-1-82ddaec94e4a@ideasonboard.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Bin Liu <b-liu@ti.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3147;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=VBitCg4mmzcbGyGk6q4vLoLZGA6NGjSGxDJCUaNRvRA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnFmBMHTozIfIAbjm5ocXIG5ei/8JY10fx5WH+c
 u6fVWtNOfuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxZgTAAKCRD6PaqMvJYe
 9YSIEACmQz+oDjXeahJ5zI+JsbI5Ax7kejJ0nkUwa25a2Xm+kcbrjRgR6iJJs93GyuccBI/d9iB
 865nFZO4QQNUe8zVxy1AoftrDQMGrephfAXmMhg+dy9QPD+OBj9dHfoZwzX9tOM8ZgxOAH6qYpp
 czJ1xC/IWbZZcjmm1+/hn9KmLSyEAYntDr1qd5SloR0jcn3dQBz+F3LoQPyR+P2aH2uXBYMWIYc
 76ZEN+/PD/bAk49yLxcfAEPk7yqE2bquxoiCjDliokSxEH6gkJgI2Vn6yGx9lNpJazjm0AOzcz1
 SYUK2d7GU1HjtGcsylsHT5e3PJ6J7+U7dhjEtq8NuyqqqkLtL729rh5tPGyOP01KFum83ugAXBO
 5iW+fXI9RTiILT5nBLpuJWFJyKtR5KU0dbDYIDIO48VLr4LlcwX0LpuJh71yIFeUo+lAZRx+FuE
 +riqBc9puFiw+U8DzR9lXenUWfaxicMPhVz/VQ1CmlDIds+0J3ypwH4U4hSl+nYCeIM6vkxHMpg
 UDPb1msyY9VquNeuIG/FAN9ShOdvmApZtU+iUKH4gdcyPOb0b4AWOR/YwKyUVJNQN4Ki1CWrTJ4
 dpPTU+C04jDQmr1AiOwSeUlawYGMm1mna8uuJed5FY4kyZc9BfBYf4UZOXGnD/SNc0lTYBYy0x/
 FDag+XhxTw7HC/w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

It has been observed that sometimes DSS will trigger an interrupt and
the top level interrupt (DISPC_IRQSTATUS) is not zero, but the VP and
VID level interrupt-statuses are zero.

As the top level irqstatus is supposed to tell whether we have VP/VID
interrupts, the thinking of the driver authors was that this particular
case could never happen. Thus the driver only clears the DISPC_IRQSTATUS
bits which has corresponding interrupts in VP/VID status. So when this
issue happens, the driver will not clear DISPC_IRQSTATUS, and we get an
interrupt flood.

It is unclear why the issue happens. It could be a race issue in the
driver, but no such race has been found. It could also be an issue with
the HW. However a similar case can be easily triggered by manually
writing to DISPC_IRQSTATUS_RAW. This will forcibly set a bit in the
DISPC_IRQSTATUS and trigger an interrupt, and as the driver never clears
the bit, we get an interrupt flood.

To fix the issue, always clear DISPC_IRQSTATUS. The concern with this
solution is that if the top level irqstatus is the one that triggers the
interrupt, always clearing DISPC_IRQSTATUS might leave some interrupts
unhandled if VP/VID interrupt statuses have bits set. However, testing
shows that if any of the irqstatuses is set (i.e. even if
DISPC_IRQSTATUS == 0, but a VID irqstatus has a bit set), we will get an
interrupt.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Co-developed-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
Co-developed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 1ad711f8d2a8..f81111067578 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -780,24 +780,20 @@ static
 void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
 {
 	unsigned int i;
-	u32 top_clear = 0;
 
 	for (i = 0; i < dispc->feat->num_vps; ++i) {
-		if (clearmask & DSS_IRQ_VP_MASK(i)) {
+		if (clearmask & DSS_IRQ_VP_MASK(i))
 			dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
-			top_clear |= BIT(i);
-		}
 	}
 	for (i = 0; i < dispc->feat->num_planes; ++i) {
-		if (clearmask & DSS_IRQ_PLANE_MASK(i)) {
+		if (clearmask & DSS_IRQ_PLANE_MASK(i))
 			dispc_k3_vid_write_irqstatus(dispc, i, clearmask);
-			top_clear |= BIT(4 + i);
-		}
 	}
 	if (dispc->feat->subrev == DISPC_K2G)
 		return;
 
-	dispc_write(dispc, DISPC_IRQSTATUS, top_clear);
+	/* always clear the top level irqstatus */
+	dispc_write(dispc, DISPC_IRQSTATUS, dispc_read(dispc, DISPC_IRQSTATUS));
 
 	/* Flush posted writes */
 	dispc_read(dispc, DISPC_IRQSTATUS);

-- 
2.43.0

