Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101113E52C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2ED6EE1E;
	Thu, 16 Jan 2020 17:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4566EE1E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 17:13:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 706A72468C;
 Thu, 16 Jan 2020 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194798;
 bh=aOKjMlhukutgw1+Sk4z/1CeV3kR3/79/Q7lf4BLEXwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xMR7tLW6iucsEmLBaXDiaBt9tcqj0Fo0yCpJTK7aSM7ZGuw7DwT0iHfk33KW4q6hu
 rVYJTR6w3JjTt4zzo2Ma6kYAoQpp5H8T0g5AZb4JQtQUHJAE4pTEoCEgqk1uAU4kHZ
 VDF9mbbkpYqTOYk7/7YM5Cir9HCh/oyiP5lgkclo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 610/671] drm: panel-lvds: Potential Oops in probe
 error handling
Date: Thu, 16 Jan 2020 12:04:08 -0500
Message-Id: <20200116170509.12787-347-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit fb2ee9bf084bcaeff1e5be100decc0eacb4af2d5 ]

The "lvds->backlight" pointer could be NULL in situations where
of_parse_phandle() returns NULL.  This code is cleaner if we use the
managed devm_of_find_backlight() so the clean up is automatic.

Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20190911104928.GA15930@mwanda
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-lvds.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 8a1687887ae9..bd704a36c5d0 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -199,7 +199,6 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 static int panel_lvds_probe(struct platform_device *pdev)
 {
 	struct panel_lvds *lvds;
-	struct device_node *np;
 	int ret;
 
 	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
@@ -245,14 +244,9 @@ static int panel_lvds_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	np = of_parse_phandle(lvds->dev->of_node, "backlight", 0);
-	if (np) {
-		lvds->backlight = of_find_backlight_by_node(np);
-		of_node_put(np);
-
-		if (!lvds->backlight)
-			return -EPROBE_DEFER;
-	}
+	lvds->backlight = devm_of_find_backlight(lvds->dev);
+	if (IS_ERR(lvds->backlight))
+		return PTR_ERR(lvds->backlight);
 
 	/*
 	 * TODO: Handle all power supplies specified in the DT node in a generic
@@ -268,14 +262,10 @@ static int panel_lvds_probe(struct platform_device *pdev)
 
 	ret = drm_panel_add(&lvds->panel);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	dev_set_drvdata(lvds->dev, lvds);
 	return 0;
-
-error:
-	put_device(&lvds->backlight->dev);
-	return ret;
 }
 
 static int panel_lvds_remove(struct platform_device *pdev)
@@ -286,9 +276,6 @@ static int panel_lvds_remove(struct platform_device *pdev)
 
 	panel_lvds_disable(&lvds->panel);
 
-	if (lvds->backlight)
-		put_device(&lvds->backlight->dev);
-
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
