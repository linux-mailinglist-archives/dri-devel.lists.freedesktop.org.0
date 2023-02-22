Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED2B69FFB5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 00:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1ED10E468;
	Wed, 22 Feb 2023 23:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B87410E465
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 23:42:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B69FDAD2;
 Thu, 23 Feb 2023 00:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677109335;
 bh=ZTRKP43OI7R9LJPgqiu/VzAwQlsHOheonTrMceo2D2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FhctQJgggzLMefq6PiOHrPH8AcJzNMpuLPS023HIGuUZkP1gNLMADH0tytvontxOs
 i2vn6L6No1M+W8dmnM8wbfjGUwW/14sf39GwRIymDzlUL09TXQUfQvdAslV8PawQRD
 BnvANPN4gJN5Jmg6Wbvm2ugIwyfsAtfk/p9rXVJM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: rcar-du: Rename DORCR fields to make them 0-based
Date: Thu, 23 Feb 2023 01:42:11 +0200
Message-Id: <20230222234212.5461-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
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

The DORCR fields were documented in the R-Car H1 datasheet with 1-based
named, and then got renamed to 0-based in Gen2. The 0-based names are
used for Gen3 and Gen4, making H1 an outlier. Rename the field macros to
make them 0-based, in order to increase readability of the code when
comparing it with the documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  8 ++++----
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 26 ++++++++++++-------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 152602236377..b5950749d68a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -175,7 +175,7 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	 * Use DS1PR and DS2PR to configure planes priorities and connects the
 	 * superposition 0 to DU0 pins. DU1 pins will be configured dynamically.
 	 */
-	rcar_du_group_write(rgrp, DORCR, DORCR_PG1D_DS1 | DORCR_DPRS);
+	rcar_du_group_write(rgrp, DORCR, DORCR_PG0D_DS0 | DORCR_DPRS);
 
 	/* Apply planes to CRTCs association. */
 	mutex_lock(&rgrp->lock);
@@ -349,7 +349,7 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 	struct rcar_du_device *rcdu = rgrp->dev;
 	u32 dorcr = rcar_du_group_read(rgrp, DORCR);
 
-	dorcr &= ~(DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_MASK);
+	dorcr &= ~(DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_MASK);
 
 	/*
 	 * Set the DPAD1 pins sources. Select CRTC 0 if explicitly requested and
@@ -357,9 +357,9 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 	 * by default.
 	 */
 	if (rcdu->dpad1_source == rgrp->index * 2)
-		dorcr |= DORCR_PG2D_DS1;
+		dorcr |= DORCR_PG1D_DS0;
 	else
-		dorcr |= DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_DS2;
+		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
 
 	rcar_du_group_write(rgrp, DORCR, dorcr);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index 789ae9285108..6c750fab6ebb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -511,19 +511,19 @@
  */
 
 #define DORCR			0x11000
-#define DORCR_PG2T		(1 << 30)
-#define DORCR_DK2S		(1 << 28)
-#define DORCR_PG2D_DS1		(0 << 24)
-#define DORCR_PG2D_DS2		(1 << 24)
-#define DORCR_PG2D_FIX0		(2 << 24)
-#define DORCR_PG2D_DOOR		(3 << 24)
-#define DORCR_PG2D_MASK		(3 << 24)
-#define DORCR_DR1D		(1 << 21)
-#define DORCR_PG1D_DS1		(0 << 16)
-#define DORCR_PG1D_DS2		(1 << 16)
-#define DORCR_PG1D_FIX0		(2 << 16)
-#define DORCR_PG1D_DOOR		(3 << 16)
-#define DORCR_PG1D_MASK		(3 << 16)
+#define DORCR_PG1T		(1 << 30)
+#define DORCR_DK1S		(1 << 28)
+#define DORCR_PG1D_DS0		(0 << 24)
+#define DORCR_PG1D_DS1		(1 << 24)
+#define DORCR_PG1D_FIX0		(2 << 24)
+#define DORCR_PG1D_DOOR		(3 << 24)
+#define DORCR_PG1D_MASK		(3 << 24)
+#define DORCR_DR0D		(1 << 21)
+#define DORCR_PG0D_DS0		(0 << 16)
+#define DORCR_PG0D_DS1		(1 << 16)
+#define DORCR_PG0D_FIX0		(2 << 16)
+#define DORCR_PG0D_DOOR		(3 << 16)
+#define DORCR_PG0D_MASK		(3 << 16)
 #define DORCR_RGPV		(1 << 4)
 #define DORCR_DPRS		(1 << 0)
 
-- 
Regards,

Laurent Pinchart

