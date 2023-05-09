Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B06FC2EA
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8F410E37A;
	Tue,  9 May 2023 09:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27D010E371
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:36:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3499UhN8071928;
 Tue, 9 May 2023 04:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1683624643;
 bh=jiDn66o6NiUAZGdP/2jhIMZ7WOU5GHi8PKN2VCsu2rY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TJOLIUOoO9l1ZXwldinjV0iSKp+CzZYqKW4p/Ec+5XUTwLPw/WzpIDG7BhoUBPBw1
 xACr/NVWHmy8Zw7roXkh37vFNCUDZXf+/rLf5RhkFlVR/Tf4OXnTEDy7HhKfwK4aV2
 4xzTH2bUnlHdiVBlNZx2bppHjXm5IvjTDCjI3aGA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3499UhA3032363
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 May 2023 04:30:43 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 04:30:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 04:30:43 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3499UgZ1020465;
 Tue, 9 May 2023 04:30:42 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Francesco Dolcini
 <francesco@dolcini.it>
Subject: [PATCH v6 4/8] drm/bridge: mhdp8546: Set input_bus_flags from
 atomic_check
Date: Tue, 9 May 2023 15:00:32 +0530
Message-ID: <20230509093036.3303-5-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509093036.3303-1-a-bhatia1@ti.com>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nikhil Devshatwar <nikhil.nd@ti.com>

input_bus_flags are specified in drm_bridge_timings (legacy) as well
as drm_bridge_state->input_bus_cfg.flags

The flags from the timings will be deprecated. Bridges are supposed
to validate and set the bridge state flags from atomic_check.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[a-bhatia1: replace timings in cdns_mhdp_platform_info by input_bus_flags]
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---

Notes:

    changes from v5:
    * removed the wrongly addded return statement in tfp410 driver.
    * replaced the timings field in cdns_mhdp_platform_info by
      input_bus_flags field, in order to get rid of bridge->timings
      altogether.

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c  | 11 ++++++++---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h  |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c |  9 ++++-----
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h |  2 +-
 4 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 623e4235c94f..a677b1267525 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2189,6 +2189,13 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
+	/*
+	 * There might be flags negotiation supported in future.
+	 * Set the bus flags in atomic_check statically for now.
+	 */
+	if (mhdp->info)
+		bridge_state->input_bus_cfg.flags = *mhdp->info->input_bus_flags;
+
 	mutex_unlock(&mhdp->link_mutex);
 	return 0;
 }
@@ -2554,8 +2561,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HPD;
 	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-	if (mhdp->info)
-		mhdp->bridge.timings = mhdp->info->timings;
 
 	ret = phy_init(mhdp->phy);
 	if (ret) {
@@ -2642,7 +2647,7 @@ static const struct of_device_id mhdp_ids[] = {
 #ifdef CONFIG_DRM_CDNS_MHDP8546_J721E
 	{ .compatible = "ti,j721e-mhdp8546",
 	  .data = &(const struct cdns_mhdp_platform_info) {
-		  .timings = &mhdp_ti_j721e_bridge_timings,
+		  .input_bus_flags = &mhdp_ti_j721e_bridge_input_bus_flags,
 		  .ops = &mhdp_ti_j721e_ops,
 	  },
 	},
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bedddd510d17..bad2fc0c7306 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -336,7 +336,7 @@ struct cdns_mhdp_bridge_state {
 };
 
 struct cdns_mhdp_platform_info {
-	const struct drm_bridge_timings *timings;
+	const u32 *input_bus_flags;
 	const struct mhdp_platform_ops *ops;
 };
 
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
index dfe1b59514f7..12d04be4e242 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
@@ -71,8 +71,7 @@ const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
 	.disable = cdns_mhdp_j721e_disable,
 };
 
-const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings = {
-	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
-			   DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
-			   DRM_BUS_FLAG_DE_HIGH,
-};
+const u32
+mhdp_ti_j721e_bridge_input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+				       DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+				       DRM_BUS_FLAG_DE_HIGH;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
index 97d20d115a24..5ddca07a4255 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
@@ -14,6 +14,6 @@
 struct mhdp_platform_ops;
 
 extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;
-extern const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings;
+extern const u32 mhdp_ti_j721e_bridge_input_bus_flags;
 
 #endif /* !CDNS_MHDP8546_J721E_H */
-- 
2.40.1

