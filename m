Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733FAF8024
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006E410E113;
	Thu,  3 Jul 2025 18:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fbu0Pmtu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0165E10E113
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 18:35:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6B944419B;
 Thu,  3 Jul 2025 18:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A50C4CEE3;
 Thu,  3 Jul 2025 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751567717;
 bh=9jb2HLI9HrPZc5LhaUHkznBv5LXACEW22xeTnBLCoi0=;
 h=From:To:Cc:Subject:Date:From;
 b=fbu0PmtuWC2GHVZSZNyBmOQD1mxvq6kYdXkW2FM1JSYB+I+vH9ljZS16YYVZIj2vD
 aDL6ezVHjRe/XjOBeBR6NNZcT1fokxdggvz2MOCFomJS4wyk/soWy9H3ydAnxM8fzt
 v9bXUvP3dMKjX2hdjfbRc7G3QWQtcTBDGn1KeLASvZobFtIRCRZq9TWxLsyYY6Dcma
 MydtI83vGfDLFvj+Er9QgOncX+cHKdCZPzsTXu39CivQistF+pTPIU+Ml29OAuRg2h
 mrCilhUS92/eDOLb7cyx7OuqTDlYFGtvefyTrhENHgJqMAzZ+hjNx8ScEd8OBMTdMH
 qaCqoc6qmT1fA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: simplefb: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Date: Thu,  3 Jul 2025 13:35:13 -0500
Message-ID: <20250703183514.2074928-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The error handling is a bit different. "memory-region" is optional, so
failed lookup is not an error. But then an error in
of_address_to_resource() is treated as an error. However, that
distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/video/fbdev/simplefb.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index be95fcddce4c..1893815dc67f 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -21,9 +21,9 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/parser.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
@@ -134,7 +134,7 @@ struct simplefb_params {
 static int simplefb_parse_dt(struct platform_device *pdev,
 			   struct simplefb_params *params)
 {
-	struct device_node *np = pdev->dev.of_node, *mem;
+	struct device_node *np = pdev->dev.of_node;
 	int ret;
 	const char *format;
 	int i;
@@ -174,19 +174,10 @@ static int simplefb_parse_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	mem = of_parse_phandle(np, "memory-region", 0);
-	if (mem) {
-		ret = of_address_to_resource(mem, 0, &params->memory);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to parse memory-region\n");
-			of_node_put(mem);
-			return ret;
-		}
-
+	ret = of_reserved_mem_region_to_resource(np, 0, &params->memory);
+	if (!ret) {
 		if (of_property_present(np, "reg"))
 			dev_warn(&pdev->dev, "preferring \"memory-region\" over \"reg\" property\n");
-
-		of_node_put(mem);
 	} else {
 		memset(&params->memory, 0, sizeof(params->memory));
 	}
-- 
2.47.2

