Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCEF1EB661
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D416E21A;
	Tue,  2 Jun 2020 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E51089D57
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 19:40:16 +0000 (UTC)
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 3060481C2;
 Sun, 31 May 2020 19:41:06 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH 4/5] bus: ti-sysc: Fix uninitialized framedonetv_irq
Date: Sun, 31 May 2020 12:39:40 -0700
Message-Id: <20200531193941.13179-5-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531193941.13179-1-tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suman Anna <s-anna@ti.com>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are currently only setting the framedonetv_irq disabled for the SoCs
that don't have it. But we are never setting it enabled for the SoCs that
have it. Let's initialized it to true by default.

Fixes: 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset quirk")
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1553,7 +1553,7 @@ static u32 sysc_quirk_dispc(struct sysc *ddata, int dispc_offset,
 	bool lcd_en, digit_en, lcd2_en = false, lcd3_en = false;
 	const int lcd_en_mask = BIT(0), digit_en_mask = BIT(1);
 	int manager_count;
-	bool framedonetv_irq;
+	bool framedonetv_irq = true;
 	u32 val, irq_mask = 0;
 
 	switch (sysc_soc->soc) {
@@ -1570,6 +1570,7 @@ static u32 sysc_quirk_dispc(struct sysc *ddata, int dispc_offset,
 		break;
 	case SOC_AM4:
 		manager_count = 1;
+		framedonetv_irq = false;
 		break;
 	case SOC_UNKNOWN:
 	default:
-- 
2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
