Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC350C807
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 09:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1443B112385;
	Sat, 23 Apr 2022 07:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E247112385
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 07:37:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,284,1643641200"; d="scan'208";a="118891575"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 23 Apr 2022 16:37:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD4E14008C4E;
 Sat, 23 Apr 2022 16:37:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Date: Sat, 23 Apr 2022 08:37:28 +0100
Message-Id: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: LUU HOAI <hoai.luu.ub@renesas.com>

In Gen3, when Alpha blend is enabled in the PnMR register,
depending on the initial value of the PnALPHAR register,
either channel of DU might be black screen.
Therefore, this patch prevents the black screen by setting
the PnALPHAR register to all 0.

In addition, PnALPHAR register will be released in
the R-Car Gen3 Hardware Manual Rev 2.4 (Sep. 2021).

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is based on [1]
[1] https://github.com/renesas-rcar/linux-bsp/commit/fcb34fe338cbde0a64919430733541035f20a784

Not sure this patches has to go with Fixes tag for stable??

Tested the changes on RZ/G2M board

root@hihope-rzg2m:/cip-test-scripts#  modetest -M rcar-du -w 54:alpha:55555
root@hihope-rzg2m:/cip-test-scripts# modetest -M rcar-du -s "93@90:1024x768@AR24" -d -P "54@90:400x300+200+200@XR24"
setting mode 1024x768-75Hz@AR24 on connectors 93, crtc 90
testing 400x300@XR24 overlay plane 54
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 5c1c7bb04f3f..aff39b9253f8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -510,6 +510,12 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
 
 	rcar_du_plane_write(rgrp, index, PnDDCR4,
 			    state->format->edf | PnDDCR4_CODE);
+
+	/* In Gen3, PnALPHAR register need to be set to 0
+	 * to avoid black screen issue when alpha blend is enable
+	 * on DU module
+	 */
+	rcar_du_plane_write(rgrp, index, PnALPHAR, 0x00000000);
 }
 
 static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
-- 
2.25.1

