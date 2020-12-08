Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D42D2AE6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEB16E96D;
	Tue,  8 Dec 2020 12:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D956E96F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:30:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUZ97064602;
 Tue, 8 Dec 2020 06:30:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430635;
 bh=UL+r7o/XYhmOTKPP1ct/Jk/pLY4vZ18VJnTp3Fi0iYI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=keXmJP5+YeGjHgjj++eB5zIe6SU3Y/geeOYC+K+r+50E22x88Y0E6UuDqDnjiYMwL
 TwJDaBCXWgT8RL/57LqzGHGrd693aUfRtin62IfO3H5Ij/WozKkTJzbbTA5dWuXOHa
 J6Objo1cNhjn1/R6mR5WBnkNX4Q6NLvg5OqsL0sA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUZvo014660
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:30:35 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:35 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjZ095068;
 Tue, 8 Dec 2020 06:30:33 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 21/29] drm/omap: dsi: display_enable cleanup
Date: Tue, 8 Dec 2020 14:28:47 +0200
Message-ID: <20201208122855.254819-22-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can drop dsi_display_enable(), which just calls
_dsi_display_enable(), and rename _dsi_display_enable() to
dsi_display_enable().

The WARN_ON(!dsi_bus_is_locked(dsi)) in dsi_display_enable is extra and
can be dropped, as _dsi_display_enable() has the same WARN_ON().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 44b8e42b52ec..961b991f6498 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3743,7 +3743,7 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 	}
 }
 
-static void _dsi_display_enable(struct dsi_data *dsi)
+static void dsi_display_enable(struct dsi_data *dsi)
 {
 	int r;
 
@@ -3772,16 +3772,6 @@ static void _dsi_display_enable(struct dsi_data *dsi)
 	DSSDBG("dsi_display_ulps_enable FAILED\n");
 }
 
-static void dsi_display_enable(struct omap_dss_device *dssdev)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	DSSDBG("dsi_display_enable\n");
-
-	WARN_ON(!dsi_bus_is_locked(dsi));
-
-	_dsi_display_enable(dsi);
-}
-
 static void _dsi_display_disable(struct dsi_data *dsi,
 		bool disconnect_lanes, bool enter_ulps)
 {
@@ -3856,7 +3846,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
 			return;
 
 		dsi_bus_lock(dsi);
-		_dsi_display_enable(dsi);
+		dsi_display_enable(dsi);
 		dsi_enable_te(dsi, true);
 		dsi_bus_unlock(dsi);
 	}
@@ -4947,7 +4937,7 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
 
 	dsi_bus_lock(dsi);
 
-	dsi_display_enable(dssdev);
+	dsi_display_enable(dsi);
 
 	dsi_enable_video_output(dssdev, VC_VIDEO);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
