Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80424AFC2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096D26E8E4;
	Thu, 20 Aug 2020 07:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835B56E218
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:21:58 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 13571DEE69;
 Wed, 19 Aug 2020 10:11:25 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pcraDX_E9eNT; Wed, 19 Aug 2020 10:11:24 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 27933DFA72;
 Wed, 19 Aug 2020 10:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4-cUkoOugQ41; Wed, 19 Aug 2020 10:11:23 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 6C0D5DFA71;
 Wed, 19 Aug 2020 10:11:23 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] drm/panel: simple: Add support for Innolux LS075AT011
Date: Wed, 19 Aug 2020 12:12:06 +0200
Message-Id: <20200819101206.633253-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819101206.633253-1-lkundrak@v3.sk>
References: <20200819101206.633253-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for the Innolux LS075AT011 7.5" 1200x900 panel. There's
no public data sheet for the panel -- the values have been taken from Open
Firmware and the documentation for the display controller that drives
the panel and tested on the OLPC laptop.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index cb6550d37e858..dfc69457ed2d4 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2121,6 +2121,30 @@ static const struct panel_desc innolux_g121x1_l03 = {
 	},
 };
 
+static const struct display_timing innolux_ls075at011_timing = {
+	.pixelclock = { 56000000, 57000000, 58000000 },
+	.hactive = { 1200, 1200, 1200 },
+	.hfront_porch = { 26, 26, 26 },
+	.hback_porch = { 24, 24, 24 },
+	.hsync_len = { 6, 6, 6 },
+	.vactive = { 900, 900, 900 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 5, 5, 5 },
+	.vsync_len = { 3, 3, 3 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc innolux_ls075at011 = {
+	.timings = &innolux_ls075at011_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,
+		.height = 115,
+	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 /*
  * Datasheet specifies that at 60 Hz refresh rate:
  * - total horizontal time: { 1506, 1592, 1716 }
@@ -3907,6 +3931,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,g121x1-l03",
 		.data = &innolux_g121x1_l03,
+	}, {
+		.compatible = "innolux,ls075at011",
+		.data = &innolux_ls075at011,
 	}, {
 		.compatible = "innolux,n116bge",
 		.data = &innolux_n116bge,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
