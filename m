Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456513E0FC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D7E6EDE3;
	Thu, 16 Jan 2020 16:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43E56EDE3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 16:46:58 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1F81214AF;
 Thu, 16 Jan 2020 16:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193218;
 bh=soEda4LnwxwIeFkNICBfyvXmeA/EOSoybIFXUCSfTdk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2lNxzOBxZ+h2GzGRm03Y5FhXSwC46k2i48rWeKuzRLyWbEdTY4C7ER2s+QmbqopEL
 HycMD/QgG9KvIgZDJvlvtNCzMYj/f0u03Uro5/gIhk4JHrFe5kTEfQHBBkF4x/ej4O
 XV4Em4ZwAt94IQBATbHCI4WyPecKx6Z088DYNKYQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 048/205] drm: rcar_lvds: Fix color mismatches on
 R-Car H2 ES2.0 and later
Date: Thu, 16 Jan 2020 11:40:23 -0500
Message-Id: <20200116164300.6705-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 3986457110a054466bf02f9c4a85aa2bba96177b ]

Commit 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk") states
that LVDS lanes 1 and 3 are inverted on R-Car H2 ES1 only, and that the
problem has been fixed in newer revisions.

However, the code didn't take into account the actual hardware revision,
thus applying the quirk also on newer hardware revisions, causing green
color reversals.

Fix this by applying the quirk when running on R-Car H2 ES1.x only.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Fixes: 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 3fc7e6899cab..50c11a7f0467 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -842,8 +843,23 @@ static int rcar_lvds_get_clocks(struct rcar_lvds *lvds)
 	return 0;
 }
 
+static const struct rcar_lvds_device_info rcar_lvds_r8a7790es1_info = {
+	.gen = 2,
+	.quirks = RCAR_LVDS_QUIRK_LANES,
+	.pll_setup = rcar_lvds_pll_setup_gen2,
+};
+
+static const struct soc_device_attribute lvds_quirk_matches[] = {
+	{
+		.soc_id = "r8a7790", .revision = "ES1.*",
+		.data = &rcar_lvds_r8a7790es1_info,
+	},
+	{ /* sentinel */ }
+};
+
 static int rcar_lvds_probe(struct platform_device *pdev)
 {
+	const struct soc_device_attribute *attr;
 	struct rcar_lvds *lvds;
 	struct resource *mem;
 	int ret;
@@ -857,6 +873,10 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	lvds->dev = &pdev->dev;
 	lvds->info = of_device_get_match_data(&pdev->dev);
 
+	attr = soc_device_match(lvds_quirk_matches);
+	if (attr)
+		lvds->info = attr->data;
+
 	ret = rcar_lvds_parse_dt(lvds);
 	if (ret < 0)
 		return ret;
@@ -893,12 +913,6 @@ static const struct rcar_lvds_device_info rcar_lvds_gen2_info = {
 	.pll_setup = rcar_lvds_pll_setup_gen2,
 };
 
-static const struct rcar_lvds_device_info rcar_lvds_r8a7790_info = {
-	.gen = 2,
-	.quirks = RCAR_LVDS_QUIRK_LANES,
-	.pll_setup = rcar_lvds_pll_setup_gen2,
-};
-
 static const struct rcar_lvds_device_info rcar_lvds_gen3_info = {
 	.gen = 3,
 	.quirks = RCAR_LVDS_QUIRK_PWD,
@@ -930,7 +944,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a774a1-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
-	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
+	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
