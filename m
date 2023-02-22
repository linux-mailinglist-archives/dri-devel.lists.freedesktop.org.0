Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB769FF87
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B107F10E1F4;
	Wed, 22 Feb 2023 23:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2812410E1F4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 23:31:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4332A25;
 Thu, 23 Feb 2023 00:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677108677;
 bh=ll0dCdMfig4EdfwuYaFy0YTdw2/zakHYXS2N1zzzjSM=;
 h=From:To:Cc:Subject:Date:From;
 b=CASDbla24DIvfbNd2Vc5qlJj7q0t+nxVFgq31GsBRIt13lzaZfYB2bhNsfPDEICRA
 HQS4pkhPn6lumMTy+uBDEGUURmwkQvg03HI0VaSDvrJdPNKzqgjlk1v0v9KNMV1ctj
 JNTLBhlnODYSjcDiFu7O+RwIijzZmWlT9fcoh4Wg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Write correct values in DORCR reserved fields
Date: Thu, 23 Feb 2023 01:31:13 +0200
Message-Id: <20230222233113.4737-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
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

The DORCR register controls the routing of clocks and data between DU
channels within a group. For groups that contain a single channel,
there's no routing option to control, and some fields of the register
are then reserved. On Gen2 those reserved fields are documented as
required to be set to 0, while on Gen3 and newer the PG1T, DK1S and PG1D
reserved fields must be set to 1.

The DU driver initializes the DORCR register in rcar_du_group_setup(),
where it ignores the PG1T, DK1S and PG1D, and then configures those
fields to the correct value in rcar_du_group_set_routing(). This hasn't
been shown to cause any issue, but prevents certifying that the driver
complies with the documentation in safety-critical use cases.

As there is no reasonable change that the documentation will be updated
to clarify that those reserved fields can be written to 0 temporarily
before starting the hardware, make sure that the registers are always
set to valid values.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index b5950749d68a..2ccd2581f544 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -138,6 +138,7 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
 	u32 defr7 = DEFR7_CODE;
+	u32 dorcr;
 
 	/* Enable extended features */
 	rcar_du_group_write(rgrp, DEFR, DEFR_CODE | DEFR_DEFE);
@@ -174,8 +175,15 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	/*
 	 * Use DS1PR and DS2PR to configure planes priorities and connects the
 	 * superposition 0 to DU0 pins. DU1 pins will be configured dynamically.
+	 *
+	 * Groups that have a single channel have a hardcoded configuration. On
+	 * Gen3 and newer, the documentation requires PG1T, DK1S and PG1D_DS1 to
+	 * always be set in this case.
 	 */
-	rcar_du_group_write(rgrp, DORCR, DORCR_PG0D_DS0 | DORCR_DPRS);
+	dorcr = DORCR_PG0D_DS0 | DORCR_DPRS;
+	if (rcdu->info->gen >= 3 && rgrp->num_crtcs == 1)
+		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
+	rcar_du_group_write(rgrp, DORCR, dorcr);
 
 	/* Apply planes to CRTCs association. */
 	mutex_lock(&rgrp->lock);
-- 
Regards,

Laurent Pinchart

