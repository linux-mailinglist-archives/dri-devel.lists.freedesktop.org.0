Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213C2CA276
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146E06E544;
	Tue,  1 Dec 2020 12:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505FC6E544
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:19:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CJ6Dr082313;
 Tue, 1 Dec 2020 06:19:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606825146;
 bh=lRiRQvM7ASp8oacnxRHdyTCWGc/9CUtthgkgm6J/LxA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=W4k7PAriEPYyKD6JMXKgyYrpjvg2DyTxcLzWGPKPrFmVJG3yIf/SuhMYeqVxpJ5R2
 mN9x3a9FPT8RsLr3WIfrzgU6Lj+B5pqABSXVPouIJa9gVHRGiyospzToiPq7wxVxUS
 UJp25YXslnZXhRLr6pJVjLn3+s8A9RoHnfCCIYPw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1CJ65v002316
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 06:19:06 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 06:19:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 06:19:05 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIn3Q118162; 
 Tue, 1 Dec 2020 06:19:03 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Date: Tue, 1 Dec 2020 17:48:28 +0530
Message-ID: <20201201121830.29704-6-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201121830.29704-1-nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the old code to iterate over the bridge chain, as this is
already done by the framework.
The bridge state should have the negotiated bus format and flags.
Use these from the bridge's state.
If the bridge does not support format negotiation, error out
and fail.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---

Notes:
    changes from v3:
    * cosmetic updates
    changes from v2:
    * Remove the old code and use the flags from the bridge state

 drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index e278a9c89476..5deb8102e4d3 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -21,37 +21,29 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 {
 	struct drm_device *ddev = encoder->dev;
 	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
-	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct drm_bridge_state *bstate;
 	struct drm_bridge *bridge;
-	bool bus_flags_set = false;
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
-	/*
-	 * Take the bus_flags from the first bridge that defines
-	 * bridge timings, or from the connector's display_info if no
-	 * bridge defines the timings.
-	 */
-	drm_for_each_bridge_in_chain(encoder, bridge) {
-		if (!bridge->timings)
-			continue;
-
-		tcrtc_state->bus_flags = bridge->timings->input_bus_flags;
-		bus_flags_set = true;
-		break;
+	/* Copy the bus_format and flags from the first bridge's state */
+	bridge = drm_bridge_chain_get_first_bridge(encoder);
+	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
+	if (!bstate) {
+		dev_err(ddev->dev, "Could not get the bridge state\n");
+		return -EINVAL;
 	}
 
-	if (!di->bus_formats || di->num_bus_formats == 0)  {
-		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
-			__func__);
+	tcrtc_state->bus_format = bstate->input_bus_cfg.format;
+	tcrtc_state->bus_flags = bstate->input_bus_cfg.flags;
+
+	if (tcrtc_state->bus_format == 0 ||
+	    tcrtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
+
+		dev_err(ddev->dev, "Bridge connected to the encoder did not specify media bus format\n");
 		return -EINVAL;
 	}
 
-	// XXX any cleaner way to set bus format and flags?
-	tcrtc_state->bus_format = di->bus_formats[0];
-	if (!bus_flags_set)
-		tcrtc_state->bus_flags = di->bus_flags;
-
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
