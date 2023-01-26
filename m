Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD667D497
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDCA10E977;
	Thu, 26 Jan 2023 18:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D2110E972
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 18:47:46 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pL7Hk-0005nn-Ks; Thu, 26 Jan 2023 19:47:44 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] gpu: ipu-v3: pre: add dynamic buffer layout
 reconfiguration
Date: Thu, 26 Jan 2023 19:47:44 +0100
Message-Id: <20230126184744.921758-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126184744.921758-1-l.stach@pengutronix.de>
References: <20230126184744.921758-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
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
 drivers/gpu/ipu-v3/ipu-pre.c | 59 +++++++++++++++++++++++++++++-------
 drivers/gpu/ipu-v3/ipu-prg.c |  2 +-
 drivers/gpu/ipu-v3/ipu-prv.h |  2 +-
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
index befffc85a146..e8d9792827dd 100644
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
 
@@ -173,6 +177,11 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 	u32 active_bpp = info->cpp[0] >> 1;
 	u32 val;
 
+	pre->cur.bufaddr = bufaddr;
+	pre->cur.height = height;
+	pre->cur.modifier = modifier;
+	pre->cur.cpp = info->cpp[0];
+
 	/* calculate safe window for ctrl register updates */
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		pre->cur.safe_window_end = height - 2;
@@ -181,7 +190,6 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 
 	writel(bufaddr, pre->regs + IPU_PRE_CUR_BUF);
 	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
-	pre->cur.bufaddr = bufaddr;
 
 	val = IPU_PRE_PREF_ENG_CTRL_INPUT_PIXEL_FORMAT(0) |
 	      IPU_PRE_PREF_ENG_CTRL_INPUT_ACTIVE_BPP(active_bpp) |
@@ -223,28 +231,56 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 	}
 	writel(val, pre->regs + IPU_PRE_TPR_CTRL);
 
-	val = readl(pre->regs + IPU_PRE_CTRL);
-	val |= IPU_PRE_CTRL_EN_REPEAT | IPU_PRE_CTRL_ENABLE |
-	       IPU_PRE_CTRL_SDW_UPDATE;
+	pre->cur.ctrl = readl(pre->regs + IPU_PRE_CTRL);
+	pre->cur.ctrl |= IPU_PRE_CTRL_EN_REPEAT | IPU_PRE_CTRL_ENABLE;
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		val &= ~IPU_PRE_CTRL_BLOCK_EN;
+		pre->cur.ctrl &= ~IPU_PRE_CTRL_BLOCK_EN;
 	else
-		val |= IPU_PRE_CTRL_BLOCK_EN;
-	writel(val, pre->regs + IPU_PRE_CTRL);
+		pre->cur.ctrl |= IPU_PRE_CTRL_BLOCK_EN;
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
 
+	if (modifier != pre->cur.modifier) {
+		val = readl(pre->regs + IPU_PRE_TPR_CTRL);
+		val &= ~IPU_PRE_TPR_CTRL_TILE_FORMAT_MASK;
+		if (modifier != DRM_FORMAT_MOD_LINEAR) {
+			/* only support single buffer formats for now */
+			val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SINGLE_BUF;
+			if (modifier == DRM_FORMAT_MOD_VIVANTE_SUPER_TILED)
+				val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_SUPER_TILED;
+			if (pre->cur.cpp == 2)
+				val |= IPU_PRE_TPR_CTRL_TILE_FORMAT_16_BIT;
+		}
+		writel(val, pre->regs + IPU_PRE_TPR_CTRL);
+
+		if (modifier == DRM_FORMAT_MOD_LINEAR)
+			pre->cur.ctrl &= ~IPU_PRE_CTRL_BLOCK_EN;
+		else
+			pre->cur.ctrl |= IPU_PRE_CTRL_BLOCK_EN;
+
+		if (modifier == DRM_FORMAT_MOD_LINEAR)
+			pre->cur.safe_window_end = pre->cur.height - 2;
+		else
+			pre->cur.safe_window_end = DIV_ROUND_UP(pre->cur.height, 4) - 1;
+
+		pre->cur.modifier = modifier;
+	}
+
 	do {
 		if (time_after(jiffies, timeout)) {
 			dev_warn(pre->dev, "timeout waiting for PRE safe window\n");
@@ -255,9 +291,10 @@ void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr)
 		current_yblock =
 			(val >> IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_SHIFT) &
 			IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_MASK;
-	} while (current_yblock == 0 || current_yblock >= pre->cur.safe_window_end);
+	} while (current_yblock == 0 || current_yblock >= safe_window_end);
 
-	writel(IPU_PRE_CTRL_SDW_UPDATE, pre->regs + IPU_PRE_CTRL_SET);
+	writel(pre->cur.ctrl | IPU_PRE_CTRL_SDW_UPDATE,
+	       pre->regs + IPU_PRE_CTRL);
 }
 
 bool ipu_pre_update_pending(struct ipu_pre *pre)
diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
index 196797c1b4b3..eb8cfcd9f5b4 100644
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
index 291ac1bab66d..24f05ff3c047 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -262,7 +262,7 @@ u32 ipu_pre_get_baddr(struct ipu_pre *pre);
 void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 		       unsigned int height, unsigned int stride, u32 format,
 		       uint64_t modifier, unsigned int bufaddr);
-void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr);
+void ipu_pre_update(struct ipu_pre *pre, uint64_t modifier, unsigned int bufaddr);
 bool ipu_pre_update_pending(struct ipu_pre *pre);
 
 struct ipu_prg *ipu_prg_lookup_by_phandle(struct device *dev, const char *name,
-- 
2.30.2

