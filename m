Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF31756511
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3E510E253;
	Mon, 17 Jul 2023 13:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338C110E257
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:34:16 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
 by laurent.telenet-ops.be with bizsmtp
 id NDaE2A0030ucMBo01DaEsE; Mon, 17 Jul 2023 15:34:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLOMX-001fzk-83;
 Mon, 17 Jul 2023 15:34:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLOMg-007RAi-4y;
 Mon, 17 Jul 2023 15:34:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH resend] drm/panel: simple: Simplify matching using
 of_device_get_match_data()
Date: Mon, 17 Jul 2023 15:34:13 +0200
Message-Id: <bca1d6f6a0582988accbb48d709aa9de7ad49ed7.1689600771.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both the patform_driver and mipi_dsi_driver structures contain pointers
to the match table used, so the custom code to obtain match and match
data can be replaced by calls to of_device_get_match_data().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/panel/panel-simple.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 241243447b3e5c81..70326f335f44c295 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4457,13 +4457,13 @@ MODULE_DEVICE_TABLE(of, platform_of_match);
 
 static int panel_simple_platform_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *id;
+	const struct panel_desc *desc;
 
-	id = of_match_node(platform_of_match, pdev->dev.of_node);
-	if (!id)
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
 		return -ENODEV;
 
-	return panel_simple_probe(&pdev->dev, id->data);
+	return panel_simple_probe(&pdev->dev, desc);
 }
 
 static void panel_simple_platform_remove(struct platform_device *pdev)
@@ -4734,15 +4734,12 @@ MODULE_DEVICE_TABLE(of, dsi_of_match);
 static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct panel_desc_dsi *desc;
-	const struct of_device_id *id;
 	int err;
 
-	id = of_match_node(dsi_of_match, dsi->dev.of_node);
-	if (!id)
+	desc = of_device_get_match_data(&dsi->dev);
+	if (!desc)
 		return -ENODEV;
 
-	desc = id->data;
-
 	err = panel_simple_probe(&dsi->dev, &desc->desc);
 	if (err < 0)
 		return err;
-- 
2.34.1

