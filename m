Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCA68C850B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 12:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E601210E234;
	Fri, 17 May 2024 10:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B1210EE72
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 10:45:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7v5y-0008WB-Mq; Fri, 17 May 2024 12:45:50 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7v5y-001r5M-92; Fri, 17 May 2024 12:45:50 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH v3 3/3] gpu: ipu-v3: pre: don't use fixed timeout when waiting
 for safe window
Date: Fri, 17 May 2024 12:45:49 +0200
Message-Id: <20240517104549.3648939-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240517104549.3648939-1-l.stach@pengutronix.de>
References: <20240517104549.3648939-1-l.stach@pengutronix.de>
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

The timeout when waiting for the PRE safe window is rather short, as
normally we would only need to wait a few dozen usecs for the problematic
scanline region to pass and we don't want to spin too long in case
something goes wrong. This however mixes badly with preemption, as we
can easily get scheduled away from the CPU for a longer time than our
timeout, in which case we would hit a spurious timeout and wrongly skip
the PRE update.

Instead of disabling preemption across the wait loop, potentially
impacting the overall system latency, use a wait loop with a fixed
max number of iterations, so time spent away from the CPU is not
accounted against the timeout budget.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v3: new patch
---
 drivers/gpu/ipu-v3/ipu-pre.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
index 2db797b50436..5b174cb8aefc 100644
--- a/drivers/gpu/ipu-v3/ipu-pre.c
+++ b/drivers/gpu/ipu-v3/ipu-pre.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/genalloc.h>
 #include <linux/module.h>
@@ -259,10 +260,6 @@ void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
 
 void ipu_pre_update(struct ipu_pre *pre, uint64_t modifier, unsigned int bufaddr)
 {
-	unsigned long timeout = jiffies + msecs_to_jiffies(5);
-	unsigned short current_yblock;
-	u32 val;
-
 	if (bufaddr == pre->cur.bufaddr &&
 	    modifier == pre->cur.modifier)
 		return;
@@ -273,8 +270,11 @@ void ipu_pre_update(struct ipu_pre *pre, uint64_t modifier, unsigned int bufaddr
 	if (modifier != pre->cur.modifier)
 		ipu_pre_configure_modifier(pre, modifier);
 
-	do {
-		if (time_after(jiffies, timeout)) {
+	for (int i = 0;;i++) {
+		unsigned short current_yblock;
+		u32 val;
+
+		if (i > 500) {
 			dev_warn(pre->dev, "timeout waiting for PRE safe window\n");
 			return;
 		}
@@ -283,8 +283,14 @@ void ipu_pre_update(struct ipu_pre *pre, uint64_t modifier, unsigned int bufaddr
 		current_yblock =
 			(val >> IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_SHIFT) &
 			IPU_PRE_STORE_ENG_STATUS_STORE_BLOCK_Y_MASK;
-	} while (current_yblock == 0 ||
-		 current_yblock >= pre->cur.safe_window_end);
+
+		if (current_yblock != 0 &&
+		    current_yblock < pre->cur.safe_window_end)
+			break;
+
+		udelay(10);
+		cpu_relax();
+	}
 
 	writel(pre->cur.ctrl | IPU_PRE_CTRL_SDW_UPDATE,
 	       pre->regs + IPU_PRE_CTRL);
-- 
2.39.2

