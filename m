Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3AA138E6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9147810E572;
	Thu, 16 Jan 2025 11:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="aMjXcu8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 520 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jan 2025 11:25:33 UTC
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8E810E572
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 11:25:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GBGcau3929407
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 16 Jan 2025 05:16:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1737026198;
 bh=CjWeOrgrgsUWX/lvkWyygw1TwAgIFSIM+ameJ+FGJjY=;
 h=From:To:CC:Subject:Date;
 b=aMjXcu8n6FBm12F+o7f6Nbwfa4BG/1aSBJoR5skZ4FlKCcq0BwLMrMk/ErFRhcHnu
 ux/hTm/0SoePp/v8d/gNIOWsgikqPJr9Wub9VpkTpInwYAtz0kNrB5t7X/88TkdZaD
 6Bp6TJIYCgF9LI9tYXy2uuwXa5gFG5Hozmoz0KbY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GBGbEJ118125;
 Thu, 16 Jan 2025 05:16:38 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 05:16:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 05:16:37 -0600
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.69.252])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GBGaH2060516;
 Thu, 16 Jan 2025 05:16:37 -0600
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dri-devel@lists.freedesktop.org>, <sjakhade@cadence.com>, <jsarha@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <mripard@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <amishin@t-argos.ru>, <jani.nikula@intel.com>, <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [RFC PATCH] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
Date: Thu, 16 Jan 2025 16:46:36 +0530
Message-ID: <20250116111636.157641-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the cases we have DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,
the connector structure is not initialised in the bridge. That's done
by encoder. So in case of some failure in cdns_mhdp_atomic_enable,
when we schedule work for modeset_retry_work, we will use the mutex
of connector which will result in NULL pointer dereference.
Handle it by adding condition for the connector. Otherwise, since
the modeset_retry_work tries to set the connector status as bad,
set the mhdp->plugged as false which would give the connector
status as disconnected in detect hook.

Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

NOTE: Found this issue in one particular board where edid read failed.
Issue log: <https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429>

Adding conditional fixes the null pointer issue but there is still
flooding of these logs (128 times):
"cdns-mhdp8546 a000000.bridge: Failed to read DPCD addr 0"

Sending RFC as I am still not sure about how to handle this flooding.
Is it okay to decrease the log level for DPCD read and DPCD write in
the cdns_mhdp_transfer to debug?

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d081850e3c03..6a121a2700d2 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2363,18 +2363,20 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 
 	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
 
-	conn = &mhdp->connector;
-
-	/* Grab the locks before changing connector property */
-	mutex_lock(&conn->dev->mode_config.mutex);
-
-	/*
-	 * Set connector link status to BAD and send a Uevent to notify
-	 * userspace to do a modeset.
-	 */
-	drm_connector_set_link_status_property(conn, DRM_MODE_LINK_STATUS_BAD);
-	mutex_unlock(&conn->dev->mode_config.mutex);
+	if (mhdp->connector.dev) {
+		conn = &mhdp->connector;
+		/* Grab the locks before changing connector property */
+		mutex_lock(&conn->dev->mode_config.mutex);
 
+		/*
+		 * Set connector link status to BAD and send a Uevent to notify
+		 * userspace to do a modeset.
+		 */
+		drm_connector_set_link_status_property(conn, DRM_MODE_LINK_STATUS_BAD);
+		mutex_unlock(&conn->dev->mode_config.mutex);
+	} else {
+		mhdp->plugged = false;
+	}
 	/* Send Hotplug uevent so userspace can reprobe */
 	drm_kms_helper_hotplug_event(mhdp->bridge.dev);
 }
-- 
2.34.1

