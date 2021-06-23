Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6A3B1205
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 05:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E076E85E;
	Wed, 23 Jun 2021 03:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B59B6E85E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 03:07:20 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BE869B1;
 Wed, 23 Jun 2021 05:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624417639;
 bh=052lPGGPzvKrwnQudRfcCLXlzUFxaRL8WCqYmcGFWG8=;
 h=From:To:Cc:Subject:Date:From;
 b=Hg7J3toWw6YheP/74GLsj1/YehZqaRiQjAywp5XCa5YkZkTfdID2NEGefYpc2h5d/
 yWnAYXrdyJz/TkHmKa/oePBvz5V5kbyGp3dsWoCFsZGNJVJB7fWdh99uAqGKC6WmDi
 mCg9Y65NAIxOvoqFtwoqk76rlYDeZom5ZbcTo0t0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: lvds: use dev_err_probe()
Date: Wed, 23 Jun 2021 06:06:46 +0300
Message-Id: <20210623030646.7720-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify error handling by using the dev_err_probe() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 5909173b26eb..165be31c4c45 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -839,9 +839,8 @@ static struct clk *rcar_lvds_get_clock(struct rcar_lvds *lvds, const char *name,
 	if (PTR_ERR(clk) == -ENOENT && optional)
 		return NULL;
 
-	if (PTR_ERR(clk) != -EPROBE_DEFER)
-		dev_err(lvds->dev, "failed to get %s clock\n",
-			name ? name : "module");
+	dev_err_probe(lvds->dev, PTR_ERR(clk), "failed to get %s clock\n",
+		      name ? name : "module");
 
 	return clk;
 }
-- 
Regards,

Laurent Pinchart

