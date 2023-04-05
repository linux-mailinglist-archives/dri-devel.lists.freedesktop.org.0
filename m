Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B646D7F50
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB54A10E98F;
	Wed,  5 Apr 2023 14:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1AC89125
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:25:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335EOjYq018196;
 Wed, 5 Apr 2023 09:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1680704685;
 bh=IIg8Hw2d+AztRioYXlvly6uzmoxjKPtZvpXX4icR5Mk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=QEOidwmJUfL0gZvptL6rL2APLDQ9IKaE5fjGSlXaS6Gz5wQNNdtnO3M321mayrH9X
 Wqqhq/8JsmbXuQv0lri4Xoo03+rD6V3TrJuP9yVjQpldAr85l8lH4m5DMQInODAmYU
 MjrrI3ZodlIyDdWKvWp3Cl+kTLrtI7RW2ktaP1pc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335EOjUQ064587
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Apr 2023 09:24:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 09:24:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 09:24:45 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335EOiA3029128;
 Wed, 5 Apr 2023 09:24:44 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] drm: bridge: cdns-mhdp8546: Add support for no-hpd
Date: Wed, 5 Apr 2023 19:54:40 +0530
Message-ID: <20230405142440.191939-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405142440.191939-1-j-choudhary@ti.com>
References: <20230405142440.191939-1-j-choudhary@ti.com>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 tzimmermann@suse.de, jonas@kwiboo.se, jani.nikula@intel.com,
 robh+dt@kernel.org, neil.armstrong@linaro.org, j-choudhary@ti.com,
 yamonkar@cadence.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rahul T R <r-ravikumar@ti.com>

In J721S2 EVMs DP0 hpd is not connected to correct
hpd pin on SOC, to handle such cases, Add support for
"no-hpd" property in the device tree node to disable
hpd

Also change the log level for dpcd read failuers to
debug, since framework retries 32 times for each read

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 37 ++++++++++++++++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f6822dfa3805..e177794b069d 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -54,6 +54,8 @@
 #include "cdns-mhdp8546-hdcp.h"
 #include "cdns-mhdp8546-j721e.h"
 
+static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp);
+
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
 	int ret, empty;
@@ -749,7 +751,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
 	 * MHDP_HW_STOPPED happens only due to driver removal when
 	 * bridge should already be detached.
 	 */
-	if (mhdp->bridge_attached)
+	if (mhdp->bridge_attached && !mhdp->no_hpd)
 		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 
@@ -845,7 +847,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to read DPCD addr %u\n",
 				msg->address);
 
@@ -1738,6 +1740,19 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	spin_unlock(&mhdp->start_lock);
 
+	if (mhdp->no_hpd) {
+		ret = wait_event_timeout(mhdp->fw_load_wq,
+					 mhdp->hw_state == MHDP_HW_READY,
+					 msecs_to_jiffies(100));
+		if (ret == 0) {
+			dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
+				__func__);
+			return -ETIMEDOUT;
+		}
+
+		cdns_mhdp_update_link_status(mhdp);
+		return 0;
+	}
 	/* Enable SW event interrupts */
 	if (hw_ready)
 		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
@@ -2256,7 +2271,16 @@ static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp)
 
 	mutex_lock(&mhdp->link_mutex);
 
-	mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
+	if (mhdp->no_hpd) {
+		ret = drm_dp_dpcd_read_link_status(&mhdp->aux, status);
+		hpd_pulse = false;
+		if (ret < 0)
+			mhdp->plugged = false;
+		else
+			mhdp->plugged = true;
+	} else {
+		mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
+	}
 
 	if (!mhdp->plugged) {
 		cdns_mhdp_link_down(mhdp);
@@ -2451,6 +2475,8 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->aux.dev = dev;
 	mhdp->aux.transfer = cdns_mhdp_transfer;
 
+	mhdp->no_hpd = of_property_read_bool(dev->of_node, "cdns,no-hpd");
+
 	mhdp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mhdp->regs)) {
 		dev_err(dev, "Failed to get memory resource\n");
@@ -2526,8 +2552,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	mhdp->bridge.of_node = pdev->dev.of_node;
 	mhdp->bridge.funcs = &cdns_mhdp_bridge_funcs;
-	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
-			   DRM_BRIDGE_OP_HPD;
+	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	if (!mhdp->no_hpd)
+		mhdp->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	if (mhdp->info)
 		mhdp->bridge.timings = mhdp->info->timings;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bedddd510d17..6786ccb51387 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -388,6 +388,7 @@ struct cdns_mhdp_device {
 
 	bool link_up;
 	bool plugged;
+	bool no_hpd;
 
 	/*
 	 * "start_lock" protects the access to bridge_attached and
-- 
2.25.1

