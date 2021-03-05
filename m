Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E884D32F031
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 17:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCAB6EB82;
	Fri,  5 Mar 2021 16:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCB716EB82
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 16:39:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7C2D11FB;
 Fri,  5 Mar 2021 08:39:26 -0800 (PST)
Received: from cubie.arm.com (unknown [10.37.8.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 186DD3F73B;
 Fri,  5 Mar 2021 08:39:25 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Fix off-by-1 when with readback conn due to
 rounding
Date: Fri,  5 Mar 2021 16:38:53 +0000
Message-Id: <20210305163853.66157-1-carsten.haitzler@foss.arm.com>
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

When setting up a readback conenctor that writes data back to memory
rather than to an actual output device (HDMI etc.), rounding was ses
to round-down. As the DPU uses a higher internal number of bits when
generating a color value, this round-down back to 8bit ended up with
everything being off-by one. e.g. #ffffff became #fefefe. This sets
rounding to "round" so things end up correct by turning on the round
flag (LW_TRC).

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 6 +++++-
 drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h      | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 8a02ade369db..d551e79fa0f1 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -468,7 +468,11 @@ static void d71_wb_layer_update(struct komeda_component *c,
 	struct komeda_layer_state *st = to_layer_st(state);
 	struct drm_connector_state *conn_st = state->wb_conn->state;
 	struct komeda_fb *kfb = to_kfb(conn_st->writeback_job->fb);
-	u32 ctrl = L_EN | LW_OFM, mask = L_EN | LW_OFM | LW_TBU_EN;
+	/* LW_TRC sets rounding to round not truncate which is needed for
+         * the output of writeback to match the input in the most common
+         * use cases like RGB888 -> RGB888, so set this bit by default */
+	u32 ctrl = L_EN | LW_OFM | LW_TRC;
+	u32 mask = L_EN | LW_OFM | LW_TBU_EN | LW_TRC;
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
