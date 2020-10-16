Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61A2902EB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 12:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B724189F3C;
	Fri, 16 Oct 2020 10:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109E689F3C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:39:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09GAdbaS076108;
 Fri, 16 Oct 2020 05:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602844777;
 bh=gLNGmXmLPYN7J+t4Ys2U2jbOmm1yaJ4+iE+0SbC+Ay0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=S94+AyLJ/3Eb5e4QluDB5px3wnzO2u6F/9bFqaXoc85IRMu8kgw4GgEoE2E309Ren
 i2KG3ZQimglrgRtr+ImDvrV+FVwU6SIEsYd7QE6xcxzUUlrw6fAA467TPmFoj1oSEt
 E+CqYA/bIldUsgilxiaMKt9nreNS1NNRrluasCn8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09GAdbgx112592
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Oct 2020 05:39:37 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 16
 Oct 2020 05:39:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 16 Oct 2020 05:39:36 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09GAdT1R110152; 
 Fri, 16 Oct 2020 05:39:35 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 2/5] drm/tidss: Set bus_format correctly from bridge/connector
Date: Fri, 16 Oct 2020 16:09:14 +0530
Message-ID: <20201016103917.26838-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016103917.26838-1-nikhil.nd@ti.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When there is a chain of bridges attached to the encoder,
the bus_format should be ideally set from the input format of the
first bridge in the chain.

Use the bridge state to get the negotiated bus_format.
If the bridge does not support format negotiation, error out
and fail.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 drivers/gpu/drm/tidss/tidss_encoder.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index e278a9c89476..ae7f134754b7 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -22,6 +22,7 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 	struct drm_device *ddev = encoder->dev;
 	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
 	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct drm_bridge_state *bstate;
 	struct drm_bridge *bridge;
 	bool bus_flags_set = false;
 
@@ -41,14 +42,19 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 		break;
 	}
 
-	if (!di->bus_formats || di->num_bus_formats == 0)  {
-		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
-			__func__);
+	/* Copy the bus_format from the input_bus_format of first bridge */
+	bridge = drm_bridge_chain_get_first_bridge(encoder);
+	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
+	if (bstate)
+		tcrtc_state->bus_format = bstate->input_bus_cfg.format;
+
+	if (tcrtc_state->bus_format == 0 ||
+	    tcrtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
+
+		dev_err(ddev->dev, "Bridge connected to the encoder did not specify media bus format\n");
 		return -EINVAL;
 	}
 
-	// XXX any cleaner way to set bus format and flags?
-	tcrtc_state->bus_format = di->bus_formats[0];
 	if (!bus_flags_set)
 		tcrtc_state->bus_flags = di->bus_flags;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
