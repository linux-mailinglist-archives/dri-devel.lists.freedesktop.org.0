Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD169556F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 01:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C5010E7B8;
	Tue, 14 Feb 2023 00:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE60310E7B4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 00:37:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1E76496;
 Tue, 14 Feb 2023 01:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1676335059;
 bh=vV8Poz7KcFFrPKJ+Q0B5tIcg0ixBf9vRYs7KQYoOV0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e5+W+SsSUzMLjVvDRrL4UGU5Fqy3PaRFcRdGklw7zrldgnn5KGH/upNqZk8GE0zdy
 ryJNITN+tc4qmDdR2jH2+59MN/y9CploqDsYlDMcKJTcQobsGJAdekA8qTvjKW2QOp
 ONOEhjfmGf5cfVpI59dPEf0sZ/w4GCVkiM9Hx4Wc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: rcar-du: lvds: Call function directly instead of
 through pointer
Date: Tue, 14 Feb 2023 02:37:34 +0200
Message-Id: <20230214003736.18871-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When disabling the companion bridge in rcar_lvds_atomic_disable(),
there's no need to go through the bridge's operations to call
.atomic_disable(). Call rcar_lvds_atomic_disable() on the companion
directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 260ea5d8624e..61de18af62e6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -582,8 +582,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 
 	/* Disable the companion LVDS encoder in dual-link mode. */
 	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
-		lvds->companion->funcs->atomic_disable(lvds->companion,
-						       old_bridge_state);
+		rcar_lvds_atomic_disable(lvds->companion, old_bridge_state);
 
 	pm_runtime_put_sync(lvds->dev);
 }
-- 
Regards,

Laurent Pinchart

