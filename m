Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D92716BC75
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F4E6EA4C;
	Tue, 25 Feb 2020 08:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DFFA893D0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 19:12:46 +0000 (UTC)
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id A8B9A81B7;
 Mon, 24 Feb 2020 19:13:29 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH 2/3] bus: ti-sysc: Detect display subsystem related devices
Date: Mon, 24 Feb 2020 11:12:29 -0800
Message-Id: <20200224191230.30972-3-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224191230.30972-1-tony@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
 dri-devel@lists.freedesktop.org, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 "Andrew F . Davis" <afd@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suman Anna <s-anna@ti.com>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to prepare probing display subsystem (DSS) with ti-sysc
interconnect target module driver and device tree data, let's
detect DSS related modules.

We need to also add reset quirk handling for DSS, but until that's
done, let's just enable the optional clock quirks for DSS and
omap4 HDMI. The rest is just naming of modules if CONFIG_DEBUG
is set.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1302,10 +1302,18 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_MODULE_QUIRK_AESS),
 	SYSC_QUIRK("dcan", 0x48480000, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff,
 		   SYSC_QUIRK_CLKDM_NOAUTO),
+	SYSC_QUIRK("dss", 0x4832a000, 0, 0x10, 0x14, 0x00000020, 0xffffffff,
+		   SYSC_QUIRK_OPT_CLKS_IN_RESET),
+	SYSC_QUIRK("dss", 0x58000000, 0, -ENODEV, 0x14, 0x00000040, 0xffffffff,
+		   SYSC_QUIRK_OPT_CLKS_IN_RESET),
+	SYSC_QUIRK("dss", 0x58000000, 0, -ENODEV, 0x14, 0x00000061, 0xffffffff,
+		   SYSC_QUIRK_OPT_CLKS_IN_RESET),
 	SYSC_QUIRK("dwc3", 0x48880000, 0, 0x10, -ENODEV, 0x500a0200, 0xffffffff,
 		   SYSC_QUIRK_CLKDM_NOAUTO),
 	SYSC_QUIRK("dwc3", 0x488c0000, 0, 0x10, -ENODEV, 0x500a0200, 0xffffffff,
 		   SYSC_QUIRK_CLKDM_NOAUTO),
+	SYSC_QUIRK("hdmi", 0, 0, 0x10, -ENODEV, 0x50030200, 0xffffffff,
+		   SYSC_QUIRK_OPT_CLKS_NEEDED),
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x00000006, 0xffffffff,
 		   SYSC_MODULE_QUIRK_HDQ1W),
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x0000000a, 0xffffffff,
@@ -1342,13 +1350,21 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   0xffff00f0, 0),
 	SYSC_QUIRK("dcan", 0, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff, 0),
 	SYSC_QUIRK("dcan", 0, 0x20, -ENODEV, -ENODEV, 0x4edb1902, 0xffffffff, 0),
+	SYSC_QUIRK("dispc", 0x4832a400, 0, 0x10, 0x14, 0x00000030, 0xffffffff, 0),
+	SYSC_QUIRK("dispc", 0x58001000, 0, 0x10, 0x14, 0x00000040, 0xffffffff, 0),
+	SYSC_QUIRK("dispc", 0x58001000, 0, 0x10, 0x14, 0x00000051, 0xffffffff, 0),
 	SYSC_QUIRK("dmic", 0, 0, 0x10, -ENODEV, 0x50010000, 0xffffffff, 0),
+	SYSC_QUIRK("dsi", 0x58004000, 0, 0x10, 0x14, 0x00000030, 0xffffffff, 0),
+	SYSC_QUIRK("dsi", 0x58005000, 0, 0x10, 0x14, 0x00000030, 0xffffffff, 0),
+	SYSC_QUIRK("dsi", 0x58005000, 0, 0x10, 0x14, 0x00000040, 0xffffffff, 0),
+	SYSC_QUIRK("dsi", 0x58009000, 0, 0x10, 0x14, 0x00000040, 0xffffffff, 0),
 	SYSC_QUIRK("dwc3", 0, 0, 0x10, -ENODEV, 0x500a0200, 0xffffffff, 0),
 	SYSC_QUIRK("d2d", 0x4a0b6000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
 	SYSC_QUIRK("d2d", 0x4a0cd000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
 	SYSC_QUIRK("epwmss", 0, 0, 0x4, -ENODEV, 0x47400001, 0xffffffff, 0),
 	SYSC_QUIRK("gpu", 0, 0x1fc00, 0x1fc10, -ENODEV, 0, 0, 0),
 	SYSC_QUIRK("gpu", 0, 0xfe00, 0xfe10, -ENODEV, 0x40000000 , 0xffffffff, 0),
+	SYSC_QUIRK("hdmi", 0, 0, 0x10, -ENODEV, 0x50031d00, 0xffffffff, 0),
 	SYSC_QUIRK("hsi", 0, 0, 0x10, 0x14, 0x50043101, 0xffffffff, 0),
 	SYSC_QUIRK("iss", 0, 0, 0x10, -ENODEV, 0x40000101, 0xffffffff, 0),
 	SYSC_QUIRK("lcdc", 0, 0, 0x54, -ENODEV, 0x4f201000, 0xffffffff, 0),
@@ -1366,6 +1382,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("prcm", 0, 0, -ENODEV, -ENODEV, 0x40000100, 0xffffffff, 0),
 	SYSC_QUIRK("prcm", 0, 0, -ENODEV, -ENODEV, 0x00004102, 0xffffffff, 0),
 	SYSC_QUIRK("prcm", 0, 0, -ENODEV, -ENODEV, 0x40000400, 0xffffffff, 0),
+	SYSC_QUIRK("rfbi", 0x4832a800, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
+	SYSC_QUIRK("rfbi", 0x58002000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, 0x10, -ENODEV, 0x40000900, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4e8b0100, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4f000100, 0xffffffff, 0),
@@ -1383,6 +1401,7 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("usbhstll", 0, 0, 0x10, 0x14, 0x00000008, 0xffffffff, 0),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, 0x14, 0x50700100, 0xffffffff, 0),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -ENODEV, 0x50700101, 0xffffffff, 0),
+	SYSC_QUIRK("venc", 0x58003000, 0, -ENODEV, -ENODEV, 0x00000002, 0xffffffff, 0),
 	SYSC_QUIRK("vfpe", 0, 0, 0x104, -ENODEV, 0x4d001200, 0xffffffff, 0),
 #endif
 };
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
