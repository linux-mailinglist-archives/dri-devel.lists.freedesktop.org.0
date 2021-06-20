Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55BB3AE100
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 00:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3899D891C2;
	Sun, 20 Jun 2021 22:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B2B891C2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 22:47:18 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C767082893;
 Mon, 21 Jun 2021 00:47:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624229237;
 bh=bEr9By9V55nACZ9COHJHn7W2H9Tr4h8/XkDVIZ79ZBo=;
 h=From:To:Cc:Subject:Date:From;
 b=W8kJ3KfK+/5V5C/mkbIIgMy2WgZ7UIukwFiukEhxvbBkiuqI+N5ZN8P9qPUaDIR4/
 PR4OnpYJxsleFdO4ffAOtFOZP202QSf3NAKE11x7y7iydCM758Zbvix+a49ce8Yi/J
 1426XJdvJrlqa0JeQi4vGXCrwhg46COUheNyTeDB872ZV+oDFCDRiCtcSqpIHC8aRU
 mOszP6KKok0zzPhhLD5fibn1g2Dy3ftVLcFuaO9TiOYZ7RxptQlAALb3SERkWSLw86
 DU4vXTsdiE7e+qHC357i/JKSFsd8O4HZoydT9F2TfXKYrxl2SQqtEh95eNvJ10yjV4
 IgGtNAhuh2i8Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: mxsfb: Enable recovery on underflow
Date: Mon, 21 Jun 2021 00:47:01 +0200
Message-Id: <20210620224701.189289-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, ch@denx.de,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Abrecht <public@danielabrecht.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is some sort of corner case behavior of the controller,
which could rarely be triggered at least on i.MX6SX connected
to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
bridged 1920x1080 panel (and likely on other setups too), where
the image on the panel shifts to the right and wraps around.
This happens either when the controller is enabled on boot or
even later during run time. The condition does not correct
itself automatically, i.e. the display image remains shifted.

It seems this problem is known and is due to sporadic underflows
of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
IRQs, neither of the IRQs trigger and neither IRQ status bit is
asserted when this condition occurs.

All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
bit, which is described in the reference manual since i.MX23 as
"
  Set this bit to enable the LCDIF block to recover in the next
  field/frame if there was an underflow in the current field/frame.
"
Enable this bit to mitigate the sporadic underflows.

Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Abrecht <public@danielabrecht.ch>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 300e7bab0f43..01e0f525360f 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -115,6 +115,35 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 	reg |= VDCTRL4_SYNC_SIGNALS_ON;
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
 
+	/*
+	 * Enable recovery on underflow.
+	 *
+	 * There is some sort of corner case behavior of the controller,
+	 * which could rarely be triggered at least on i.MX6SX connected
+	 * to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
+	 * bridged 1920x1080 panel (and likely on other setups too), where
+	 * the image on the panel shifts to the right and wraps around.
+	 * This happens either when the controller is enabled on boot or
+	 * even later during run time. The condition does not correct
+	 * itself automatically, i.e. the display image remains shifted.
+	 *
+	 * It seems this problem is known and is due to sporadic underflows
+	 * of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
+	 * IRQs, neither of the IRQs trigger and neither IRQ status bit is
+	 * asserted when this condition occurs.
+	 *
+	 * All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
+	 * bit, which is described in the reference manual since i.MX23 as
+	 * "
+	 *   Set this bit to enable the LCDIF block to recover in the next
+	 *   field/frame if there was an underflow in the current field/frame.
+	 * "
+	 * Enable this bit to mitigate the sporadic underflows.
+	 */
+	reg = readl(mxsfb->base + LCDC_CTRL1);
+	reg |= CTRL1_RECOVER_ON_UNDERFLOW;
+	writel(reg, mxsfb->base + LCDC_CTRL1);
+
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
 }
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 55d28a27f912..df90e960f495 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -54,6 +54,7 @@
 #define CTRL_DF24			BIT(1)
 #define CTRL_RUN			BIT(0)
 
+#define CTRL1_RECOVER_ON_UNDERFLOW	BIT(24)
 #define CTRL1_FIFO_CLEAR		BIT(21)
 #define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
 #define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)
-- 
2.30.2

