Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DB7EE0A6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F403A10E278;
	Thu, 16 Nov 2023 12:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE95E10E278
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:24:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.04,308,1695654000"; d="scan'208";a="183167221"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2023 21:24:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.178])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 273F54009F88;
 Thu, 16 Nov 2023 21:24:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Date: Thu, 16 Nov 2023 12:24:24 +0000
Message-Id: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rcar_du_vsps_init() doesn't free the np allocated by
of_parse_phandle_with_fixed_args() for the non-error case.

Fix memory leak for the non-error case.

While at it, replace the label 'error'->'done' as it applies to non-error
case as well and update the error check condition for rcar_du_vsp_init()
to avoid breakage in future, if it returns positive value.

Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced the label 'error'->'done' as it applies to non-error case as
   well.
 * Update the error check condition for rcar_du_vsp_init() to avoid
   breakage in future, if it returns positive value.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 70d8ad065bfa..4c8fe83dd610 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -705,7 +705,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
 						       cells, i, &args);
 		if (ret < 0)
-			goto error;
+			goto done;
 
 		/*
 		 * Add the VSP to the list or update the corresponding existing
@@ -743,13 +743,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 		vsp->dev = rcdu;
 
 		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
-		if (ret < 0)
-			goto error;
+		if (ret)
+			goto done;
 	}
 
-	return 0;
-
-error:
+done:
 	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
 		of_node_put(vsps[i].np);
 
-- 
2.25.1

