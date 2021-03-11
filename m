Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9A337212
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DE86EC19;
	Thu, 11 Mar 2021 12:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EB9D6EC19
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 12:09:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906AF31B;
 Thu, 11 Mar 2021 04:09:02 -0800 (PST)
Received: from cubie.arm.com (unknown [10.37.8.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD1903F793;
 Thu, 11 Mar 2021 04:09:01 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Fix off-by-1 when with readback conn due to
 rounding
Date: Thu, 11 Mar 2021 12:08:46 +0000
Message-Id: <20210311120846.23543-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: liviu.dudau@arm.com, Carsten Haitzler <carsten.haitzler@arm.com>,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carsten Haitzler <carsten.haitzler@arm.com>

When setting up a readback connector that writes data back to memory
rather than to an actual output device (HDMI etc.), rounding was set
to round. As the DPU uses a higher internal number of bits when generating
a color value, this round-down back to 8bit ended up with everything
being off-by one. e.g. #fefefe became #ffffff. This sets
rounding to "round-down" so things end up correct by turning on the LW_TRC
round down flag.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 7 ++++++-
 drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h      | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 8a02ade369db..e97acc5519d1 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -468,7 +468,12 @@ static void d71_wb_layer_update(struct komeda_component *c,
 	struct komeda_layer_state *st = to_layer_st(state);
 	struct drm_connector_state *conn_st = state->wb_conn->state;
 	struct komeda_fb *kfb = to_kfb(conn_st->writeback_job->fb);
-	u32 ctrl = L_EN | LW_OFM, mask = L_EN | LW_OFM | LW_TBU_EN;
+	/* LW_TRC sets rounding to truncate not round which is needed for
+	 * the output of writeback to match the input in the most common
+	 * use cases like RGB888 -> RGB888, so set this bit by default
+	 */
+	u32 ctrl = LW_TRC | L_EN | LW_OFM;
+	u32 mask = LW_TRC | L_EN | LW_OFM | LW_TBU_EN;
 	u32 __iomem *reg = c->reg;
 
 	d71_layer_update_fb(c, kfb, st->addr);
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
index e80172a0b320..a8036689d721 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
@@ -321,6 +321,7 @@
 #define LAYER_WR_FORMAT		0x0D8
 
 /* Layer_WR control bits */
+#define LW_TRC			BIT(1)
 #define LW_OFM			BIT(4)
 #define LW_LALPHA(x)		(((x) & 0xFF) << 8)
 #define LW_A_WCACHE(x)		(((x) & 0xF) << 28)
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
