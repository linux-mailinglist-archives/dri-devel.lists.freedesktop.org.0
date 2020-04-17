Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D181ADC5A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 13:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37EE6EB9E;
	Fri, 17 Apr 2020 11:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F796EB9E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 11:42:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HBfwaw034081;
 Fri, 17 Apr 2020 06:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587123718;
 bh=9I0dVn3l1ySOYQ8sB5SbfX0zUOF3BMJa6/jUms4bDWg=;
 h=From:To:CC:Subject:Date;
 b=HxXLMRJOaQZC4Nm/bAnrJecPe+Yz0m9PvYwipGKD7YqvFrDaL9pSTekoewOYqfPUN
 c3it1wDmoUJ1d7BEAhFUEHgYaAYS3aOsvycVQGY8PeH0/CngfH+jXQ0vdA9HqE7+zL
 OEFWlBHuuNwx7P80P3WqzY/9nt8fciZ/a5+HTP9U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HBfwK9080528
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Apr 2020 06:41:58 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 06:41:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 06:41:57 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HBfuoX031891;
 Fri, 17 Apr 2020 06:41:56 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/omap: change default signal polarities and drives
Date: Fri, 17 Apr 2020 14:41:51 +0300
Message-ID: <20200417114151.25843-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the given videomode does not specify DISPLAY_FLAG_* for the specific
signal property, the driver used a default value. These defaults were
never thought through, as the expectation was that all the DISPLAY_FLAGS
are always set explicitly.

With DRM bridge and panel drivers this is not the case, and while that
issue should be resolved in the future, it's still good to have sane
signal defaults.

This patch changes the defaults to what the hardware has as reset
defaults. Also, based on my experience, I think they make sense and are
more likely correct than the defaults without this patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 33 ++++++-----------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index dbb90f2d2ccd..6639ee9b05d3 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -3137,33 +3137,12 @@ static void _dispc_mgr_set_lcd_timings(struct dispc_device *dispc,
 	dispc_write_reg(dispc, DISPC_TIMING_H(channel), timing_h);
 	dispc_write_reg(dispc, DISPC_TIMING_V(channel), timing_v);
 
-	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
-		vs = false;
-	else
-		vs = true;
-
-	if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH)
-		hs = false;
-	else
-		hs = true;
-
-	if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
-		de = false;
-	else
-		de = true;
-
-	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
-		ipc = false;
-	else
-		ipc = true;
-
-	/* always use the 'rf' setting */
-	onoff = true;
-
-	if (vm->flags & DISPLAY_FLAGS_SYNC_POSEDGE)
-		rf = true;
-	else
-		rf = false;
+	vs = !!(vm->flags & DISPLAY_FLAGS_VSYNC_LOW);
+	hs = !!(vm->flags & DISPLAY_FLAGS_HSYNC_LOW);
+	de = !!(vm->flags & DISPLAY_FLAGS_DE_LOW);
+	ipc = !!(vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE);
+	onoff = true; /* always use the 'rf' setting */
+	rf = !!(vm->flags & DISPLAY_FLAGS_SYNC_POSEDGE);
 
 	l = FLD_VAL(onoff, 17, 17) |
 		FLD_VAL(rf, 16, 16) |
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
