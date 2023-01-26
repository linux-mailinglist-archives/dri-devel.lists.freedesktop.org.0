Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449D67D496
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FBB10E972;
	Thu, 26 Jan 2023 18:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515AC10E977
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 18:47:46 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pL7Hk-0005nn-Cl; Thu, 26 Jan 2023 19:47:44 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] gpu: ipu-v3: pre: move state into struct
Date: Thu, 26 Jan 2023 19:47:43 +0100
Message-Id: <20230126184744.921758-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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

Move the variables tracking the current dynamic state into a struct
to separate it a bit better from the static device properties.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/ipu-v3/ipu-pre.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
index ad82c9e0252f..befffc85a146 100644
--- a/drivers/gpu/ipu-v3/ipu-pre.c
+++ b/drivers/gpu/ipu-v3/ipu-pre.c
@@ -96,9 +96,12 @@ struct ipu_pre {
 
 	dma_addr_t		buffer_paddr;
 	void			*buffer_virt;
-	bool			in_use;
-	unsigned int		safe_window_end;
-	unsigned int		last_bufaddr;
+
+	struct {
+		bool		in_use;
+		unsigned int	safe_window_end;
+		unsigned int	bufaddr;
+	} cur;
 };
 
 static DEFINE_MUTEX(ipu_pre_list_mutex);
@@ -138,7 +141,7 @@ int ipu_pre_get(struct ipu_pre *pre)
 {
 	u32 val;
 
-	if (pre->in_use)
+	if (pre->cur.in_use)
 		return -EBUSY;
 
 	/* first get the engine out of reset and remove clock gating */
@@ -151,7 +154,7 @@ int ipu_pre_get(struct ipu_pre *pre)
 	      IPU_PRE_CTRL_SDW_UPDATE;
 	writel(val, pre->regs + IPU_PRE_CTRL);
 
-	pre->in_use = true;
+	pre->cur.in_use = true;
 	return 0;
 }
 
@@ -159,7 +162,7 @@ void ipu_pre_put(struct ipu_pre *pre)
 {
 	writel(IPU_PRE_CTRL_SFTRST, pre->regs + IPU_PRE_CTRL);
 
-	pre->in_use = false;
+	pre->cur.in_use = false;
 }
 
 void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
@@ -172,13 +175,13 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 
 	/* calculate safe window for ctrl register updates */
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		pre->safe_window_end = height - 2;
+		pre->cur.safe_window_end = height - 2;
 	else
-		pre->safe_window_end = DIV_ROUND_UP(height, 4) - 1;
+		pre->cur.safe_window_end = DIV_ROUND_UP(height, 4) - 1;
 
 	writel(bufaddr, pre->regs + IPU_PRE_CUR_BUF);
 	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
-	pre->last_bufaddr = bufaddr;
+	pre->cur.bufaddr = bufaddr;
 
 	val = IPU_PRE_PREF_ENG_CTRL_INPUT_PIXEL_FORMAT(0) |
 	      IPU_PRE_PREF_ENG_CTRL_INPUT_ACTIVE_BPP(active_bpp) |
@@ -236,11 +239,11 @@ void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr)
 	unsigned short current_yblock;
 	u32 val;
 
-	if (bufaddr == pre->last_bufaddr)
+	if (bufaddr == pre->cur.bufaddr)
 		return;
 
 	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
-	pre->last_bufaddr = bufaddr;
+	pre->cur.bufaddr = bufaddr;
 
 	do {
 		if (time_after(jiffies, timeout)) {
@@ -252,7 +255,7 @@ void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr)
 		current_yblock =
 			(val >> IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_SHIFT) &
 			IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_MASK;
-	} while (current_yblock == 0 || current_yblock >= pre->safe_window_end);
+	} while (current_yblock == 0 || current_yblock >= pre->cur.safe_window_end);
 
 	writel(IPU_PRE_CTRL_SDW_UPDATE, pre->regs + IPU_PRE_CTRL_SET);
 }
-- 
2.30.2

