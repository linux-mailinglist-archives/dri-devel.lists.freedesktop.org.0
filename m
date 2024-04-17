Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3556A8A8AEB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8510E9B3;
	Wed, 17 Apr 2024 18:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABAF10EF80
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:19:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rx9sS-0006Fp-1S; Wed, 17 Apr 2024 20:19:24 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rx9sR-00Cq24-HB; Wed, 17 Apr 2024 20:19:23 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH v2 2/2] gpu: ipu-v3: pre: add dynamic buffer layout
 reconfiguration
Date: Wed, 17 Apr 2024 20:19:23 +0200
Message-Id: <20240417181923.1037651-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240417181923.1037651-1-l.stach@pengutronix.de>
References: <20240417181923.1037651-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

imx-drm doesn't mandate a modeset when the framebuffer modifier changes,
but currently the tile prefetch and resolve (TPR) configuration of the
PRE is only set up on the initial modeset.

As the TPR configuration is double buffered, same as all the other PRE
states, we can support dynamic reconfiguration of the buffer layout from
one frame to another. As switching between (super-)tiled and linear
prefetch needs to touch the CTRL register make sure to do the
reconfiguration inside the safe window.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- move modifier configuration into separate function
- move safe window update to occur after flip has been queued
---
 drivers/gpu/ipu-v3/ipu-pre.c | 89 ++++++++++++++++++++++++------------
 drivers/gpu/ipu-v3/ipu-prg.c |  2 +-
 drivers/gpu/ipu-v3/ipu-prv.h |  2 +-
 3 files changed, 63 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
index 0d4e882fe8f1..8a47c3d8abda 100644
--- a/drivers/gpu/ipu-v3/ipu-pre.c
+++ b/drivers/gpu/ipu-v3/ipu-pre.c
@@ -99,8 +99,12 @@ struct ipu_pre {
 
 	struct {
 		bool		in_use;
+		uint64_t	modifier;
+		unsigned int	height;
 		unsigned int	safe_window_end;
 		unsigned int	bufaddr;
+		u32		ctrl;
+		u8		cpp;
 	} cur;
 };
 
@@ -165,6 +169,40 @@ void ipu_pre_put(struct ipu_pre *pre)
 	pre->cur.in_use = false;
 }
 
+static inline void
+ipu_pre_update_safe_window(struct ipu_pre *pre)
+{
+	if (pre->cur.modifier == DRM_FORMAT_MOD_LINEAR)
+		pre->cur.safe_window_end = pre->cur.height - 2;
+	else
+		pre->cur.safe_window_end = DIV_ROUND_UP(pre->cur.height, 4) - 1;
+}
+
+static void
+ipu_pre_configure_modifier(struct ipu_pre *pre, uint64_t modifier)
+{
+	u32 val;
+
+	val = readl(pre->regs + IPU_PRE_TPR_CTRL);
+	val &= ~IPU_PRE_TPR_CTRL_TILE_FORMAT_MASK;
+	if (modifier != DRM_FORMAT_MOD_LINEAR) {
+		/* only support single buffer formats for now */
+		val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SINGLE_BUF;
+		if (modifier == DRM_FORMAT_MOD_VIVANTE_SUPER_TILED)
+			val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SUPER_TILED;
+		if (pre->cur.cpp == 2)
+			val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_16_BIT;
+	}
+	writel(val, pre->regs + IPU_PRE_TPR_CTRL);
+
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		pre->cur.ctrl &= ~IPU_PRE_CTRL_BLOCK_EN;
+	else
+		pre->cur.ctrl |= IPU_PRE_CTRL_BLOCK_EN;
+
+	pre->cur.modifier = modifier;
+}
+
 void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 		       unsigned int height, unsigned int stride, u32 format,
 		       uint64_t modifier, unsigned int bufaddr)
@@ -173,15 +211,16 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 	u32 active_bpp = info->cpp[0] >> 1;
 	u32 val;
 
+	pre->cur.bufaddr = bufaddr;
+	pre->cur.height = height;
+	pre->cur.cpp = info->cpp[0];
+	pre->cur.ctrl = readl(pre->regs + IPU_PRE_CTRL);
+
 	/* calculate safe window for ctrl register updates */
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		pre->cur.safe_window_end = height - 2;
-	else
-		pre->cur.safe_window_end = DIV_ROUND_UP(height, 4) - 1;
+	ipu_pre_update_safe_window(pre);
 
 	writel(bufaddr, pre->regs + IPU_PRE_CUR_BUF);
 	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
-	pre->cur.bufaddr = bufaddr;
 
 	val = IPU_PRE_PREF_ENG_CTRL_INPUT_PIXEL_FORMAT(0) |
 	      IPU_PRE_PREF_ENG_CTRL_INPUT_ACTIVE_BPP(active_bpp) |
@@ -211,40 +250,30 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 
 	writel(pre->buffer_paddr, pre->regs + IPU_PRE_STORE_ENG_ADDR);
 
-	val = readl(pre->regs + IPU_PRE_TPR_CTRL);
-	val &= ~IPU_PRE_TPR_CTRL_TILE_FORMAT_MASK;
-	if (modifier != DRM_FORMAT_MOD_LINEAR) {
-		/* only support single buffer formats for now */
-		val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SINGLE_BUF;
-		if (modifier == DRM_FORMAT_MOD_VIVANTE_SUPER_TILED)
-			val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SUPER_TILED;
-		if (info->cpp[0] == 2)
-			val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_16_BIT;
-	}
-	writel(val, pre->regs + IPU_PRE_TPR_CTRL);
+	ipu_pre_configure_modifier(pre, modifier);
 
-	val = readl(pre->regs + IPU_PRE_CTRL);
-	val |= IPU_PRE_CTRL_EN_REPEAT | IPU_PRE_CTRL_ENABLE |
-	       IPU_PRE_CTRL_SDW_UPDATE;
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		val &= ~IPU_PRE_CTRL_BLOCK_EN;
-	else
-		val |= IPU_PRE_CTRL_BLOCK_EN;
-	writel(val, pre->regs + IPU_PRE_CTRL);
+	pre->cur.ctrl |= IPU_PRE_CTRL_EN_REPEAT | IPU_PRE_CTRL_ENABLE;
+	writel(pre->cur.ctrl | IPU_PRE_CTRL_SDW_UPDATE,
+	       pre->regs + IPU_PRE_CTRL);
 }
 
-void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr)
+void ipu_pre_update(struct ipu_pre *pre, uint64_t modifier, unsigned int bufaddr)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(5);
 	unsigned short current_yblock;
+	unsigned int safe_window_end = pre->cur.safe_window_end;
 	u32 val;
 
-	if (bufaddr == pre->cur.bufaddr)
+	if (bufaddr == pre->cur.bufaddr &&
+	    modifier == pre->cur.modifier)
 		return;
 
 	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
 	pre->cur.bufaddr = bufaddr;
 
+	if (modifier != pre->cur.modifier)
+		ipu_pre_configure_modifier(pre, modifier);
+
 	do {
 		if (time_after(jiffies, timeout)) {
 			dev_warn(pre->dev, "timeout waiting for PRE safe window\n");
@@ -255,9 +284,13 @@ void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr)
 		current_yblock =
 			(val >> IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_SHIFT) &
 			IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_MASK;
-	} while (current_yblock == 0 || current_yblock >= pre->cur.safe_window_end);
+	} while (current_yblock == 0 || current_yblock >= safe_window_end);
+
+	writel(pre->cur.ctrl | IPU_PRE_CTRL_SDW_UPDATE,
+	       pre->regs + IPU_PRE_CTRL);
 
-	writel(IPU_PRE_CTRL_SDW_UPDATE, pre->regs + IPU_PRE_CTRL_SET);
+	/* calculate safe window for the next update with the new modifier */
+	ipu_pre_update_safe_window(pre);
 }
 
 bool ipu_pre_update_pending(struct ipu_pre *pre)
diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
index 729605709955..661dedf6617a 100644
--- a/drivers/gpu/ipu-v3/ipu-prg.c
+++ b/drivers/gpu/ipu-v3/ipu-prg.c
@@ -287,7 +287,7 @@ int ipu_prg_channel_configure(struct ipuv3_channel *ipu_chan,
 	chan = &prg->chan[prg_chan];
 
 	if (chan->enabled) {
-		ipu_pre_update(prg->pres[chan->used_pre], *eba);
+		ipu_pre_update(prg->pres[chan->used_pre], modifier, *eba);
 		return 0;
 	}
 
diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
index d4621b1ea7f1..3884acb7995a 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -263,7 +263,7 @@ u32 ipu_pre_get_baddr(struct ipu_pre *pre);
 void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 		       unsigned int height, unsigned int stride, u32 format,
 		       uint64_t modifier, unsigned int bufaddr);
-void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr);
+void ipu_pre_update(struct ipu_pre *pre, uint64_t modifier, unsigned int bufaddr);
 bool ipu_pre_update_pending(struct ipu_pre *pre);
 
 struct ipu_prg *ipu_prg_lookup_by_phandle(struct device *dev, const char *name,
-- 
2.39.2

