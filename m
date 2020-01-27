Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A365149FAB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07066EA3B;
	Mon, 27 Jan 2020 08:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D996E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 02:21:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 485YQ75mKmz1rfc9;
 Mon, 27 Jan 2020 03:21:03 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 485YQ73kJBz1qwXf;
 Mon, 27 Jan 2020 03:21:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id jZq3p0IB9MDp; Mon, 27 Jan 2020 03:21:01 +0100 (CET)
X-Auth-Info: 3A8XXtSl/DVmCLb85c3itPj9bfyRAzf7nBB5d5KXhaw=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 27 Jan 2020 03:21:01 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Add Innolux N133HSE panel support
Date: Mon, 27 Jan 2020 03:20:57 +0100
Message-Id: <20200127022057.379140-1-marex@denx.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Sean Cross <xobs@kosagi.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Cross <xobs@kosagi.com>

The Innolux N133HSE panel is a 13.3" 1920x1080 panel that contains an
integrated backlight, and connects via eDP.

It is used in the Kosagi Novena.

Signed-off-by: Sean Cross <xobs@kosagi.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
---
 .../display/panel/innolux,n133hse-ea1.txt     |  7 +++++
 drivers/gpu/drm/panel/panel-simple.c          | 26 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt b/Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt
new file mode 100644
index 000000000000..1a886aeedabf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt
@@ -0,0 +1,7 @@
+Innolux Corporation 13.3" FHD (1920x1080) TFT LCD panel
+
+Required properties:
+- compatible: should be "innolux,n133hse-ea1"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e14c14ac62b5..3dffd2e5af6d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1793,6 +1793,29 @@ static const struct panel_desc innolux_n116bge = {
 	},
 };
 
+static const struct drm_display_mode innolux_n133hse_ea1_mode = {
+	.clock = 138500,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 46,
+	.hsync_end = 1920 + 46 + 30,
+	.htotal = 1920 + 46 + 30 + 84,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 2,
+	.vsync_end = 1080 + 2 + 4,
+	.vtotal = 1080 + 2 + 4 + 26,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc innolux_n133hse_ea1 = {
+	.modes = &innolux_n133hse_ea1_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 293,
+		.height = 165,
+	},
+};
+
 static const struct drm_display_mode innolux_n156bge_l21_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -3348,6 +3371,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n116bge",
 		.data = &innolux_n116bge,
+	}, {
+		.compatible = "innolux,n133hse-ea1",
+		.data = &innolux_n133hse_ea1,
 	}, {
 		.compatible = "innolux,n156bge-l21",
 		.data = &innolux_n156bge_l21,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
