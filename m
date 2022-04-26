Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FAE50F51A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B2610E531;
	Tue, 26 Apr 2022 08:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 421F510E554
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:42:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,290,1643641200"; d="scan'208";a="118023982"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2022 17:42:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.117])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE0E840071E2;
 Tue, 26 Apr 2022 17:41:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm: rcar-du: Fix Alpha blending issue on Gen3
Date: Tue, 26 Apr 2022 09:41:57 +0100
Message-Id: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As per R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf,
unexpected image output(such as incorrect colors or planes being
invisible) can happen on the below conditions, as PnALPHAR register
is not initialized by reset.

When alpha blending (PpMRm.PpSPIM=0b101) is performed and:
	•two Planes are enabled on any DUn (n=0,1,2,3)
		oDSPRn= 0x0000 0031 or 0x0000 0013
	•or DU0 and DU1 is used for display at the same time
		oDSPR0= 0x0000 0001 and DSPR1= 0x0000 0003
		oDSPR0= 0x0000 0003 and DSPR1= 0x0000 0001
	•or DU2 and DU3(H3 Only) is used for display at the same time
		oDSPR2= 0x0000 0001 and DSPR3= 0x0000 0003
		oDSPR2= 0x0000 0003 and DSPR3= 0x0000 0001

This patch set PnALPHAR register to 0 to avoid this issue.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description
 * Updated the code comments
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index f214a8b6cfd3..aa80c44dd8d7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -510,6 +510,18 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
 
 	rcar_du_plane_write(rgrp, index, PnDDCR4,
 			    state->format->edf | PnDDCR4_CODE);
+
+	/*
+	 * On Gen3, some DU channels have two planes, each being wired to a
+	 * separate VSPD instance. The DU can then blend two planes. While
+	 * this feature isn't used by the driver, issues related to alpha
+	 * blending (such as incorrect colors or planes being invisible) may
+	 * still occur if the PnALPHAR register has a stale value. Set the
+	 * register to 0 to avoid this.
+	 */
+
+	/* TODO: Check if alpha-blending should be disabled in PnMR. */
+	rcar_du_plane_write(rgrp, index, PnALPHAR, 0);
 }
 
 static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
-- 
2.25.1

