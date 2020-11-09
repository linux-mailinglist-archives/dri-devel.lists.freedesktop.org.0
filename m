Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337842AC1C8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 18:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5575589B22;
	Mon,  9 Nov 2020 17:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E934E89B22
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 17:06:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9H6SW1002661;
 Mon, 9 Nov 2020 11:06:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604941588;
 bh=t+mNXplLhUjB3RYE8ox7vIOHVM/EWQj5uV2mj6N6AYY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hOE41cHExd0+2mFUAnNPzRU5d8H9FDhqhqBkWQxWjK+70/T0JuZqMVsEo4stzBX8N
 Xwul2oNPJFcXUEAPkmO5Az5w/U1zFhOKg/dx3+ucdvhX+qBnlYLfEZPmBeCkKN8oui
 9aCmHwODnTB5/ENkT5cTt7y+jtUABi0990NuoEwM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9H6Su1110261
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 11:06:28 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 11:06:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 11:06:28 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9H6FZb037277; 
 Mon, 9 Nov 2020 11:06:26 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
Date: Mon, 9 Nov 2020 22:35:59 +0530
Message-ID: <20201109170601.21557-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109170601.21557-1-nikhil.nd@ti.com>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
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
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index e278a9c89476..ba5b6fccabe7 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -22,6 +22,7 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 	struct drm_device *ddev = encoder->dev;
 	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
 	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct drm_bridge_state *bstate;
 	struct drm_bridge *bridge;
 	bool bus_flags_set = false;
 
@@ -41,17 +42,22 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 		break;
 	}
 
-	if (!di->bus_formats || di->num_bus_formats == 0)  {
-		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
-			__func__);
-		return -EINVAL;
-	}
-
-	// XXX any cleaner way to set bus format and flags?
-	tcrtc_state->bus_format = di->bus_formats[0];
 	if (!bus_flags_set)
 		tcrtc_state->bus_flags = di->bus_flags;
 
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
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
