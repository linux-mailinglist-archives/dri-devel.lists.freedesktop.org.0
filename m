Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBEC73EBA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE64D10E744;
	Thu, 20 Nov 2025 12:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="jmCbvV9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7561E10E743
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 12:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNrN3OZ+OOTMTovmmHBslqrCjuNLto+ZIlT3Zr+TvpH/15w357BVv/zkE1poFdhJ5bMkzlN6A8tjTCfwmFml2PoTkhQzo4J9BGe5HboeaH9e8RPXLbtbLksvEDKWutQlpvMrpZbI6iCRv2jCqoHx+tqSFTPoXJfgPV2ZeXMhDHyBlzCG7LNccX8ZlL4FkRR/RDtxIm7B1NN/+Ex5UovR1MF+xP3xSq5TYiEwZuiwZ+l9LRqggbISxJ8QqiDOyvNC+0YVFHVEB/JEyUobmp8+inyv12o2SbpP5rGxgaVRB9FvYsE+BtDxLXbm4lZRkPV8Ux6d+RTSxd1/8UGTQEefiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfH7D/FxOe2/RsbcUSJmS6zsrpWA1R4j3g8WDzsspOQ=;
 b=Qo21FVGWtoIki4zy/TJTueVc9hMzNSs+Kt1H6YLERyYx+4Rfp4dLMFkY10mpbivSS6DY4TBSsBPdgQ5nh//0db7I3UA1uOrgcQdvnqCYkyXjFiC1+BBrT7dOXNFX88jTB+oKcOLuHfoW9PUN+XTtrCxLvinO5/1s7OZh6jcd33Xtd4NQEGfA/7BZtr374cBP/2a89MVf81FfTy4qu7UdKohWJTwEgJu0wP0nTleD4fVHp1ZZNQmWhyz539hxz9RGQ3TXjJeooG+zJFu8mJhBWdxPcW8zFoSgCn3xFyXlrHNq7hDbh1fAtpEcIm57ZYKa5gYWrm9LM1rexVAqwm65fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfH7D/FxOe2/RsbcUSJmS6zsrpWA1R4j3g8WDzsspOQ=;
 b=jmCbvV9t7UvBUMtzRG2rFMMuqeNBGy+vaUw6KzDhygRhw5QShwsfXM3TMAtwqhKltfIeiue9bZ1HCGggKH6OJX5n95hdkn6lLRoto865lVxTAToJA6LHlVlpDVopvvAjDk9+NpygkME3vd2QJ0lAbHh7merv2xY4i+xFA/LatS0=
Received: from DS7PR05CA0089.namprd05.prod.outlook.com (2603:10b6:8:56::6) by
 CY8PR10MB6907.namprd10.prod.outlook.com (2603:10b6:930:86::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.11; Thu, 20 Nov 2025 12:15:00 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::4a) by DS7PR05CA0089.outlook.office365.com
 (2603:10b6:8:56::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Thu,
 20 Nov 2025 12:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:15:00 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:57 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:57 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 06:14:57 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKCEHE03636470;
 Thu, 20 Nov 2025 06:14:51 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
Subject: [PATCH RESEND v9 5/6] cadence: cdns-mhdp8546*: Change drm_connector
 from structure to pointer
Date: Thu, 20 Nov 2025 17:44:15 +0530
Message-ID: <20251120121416.660781-6-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120121416.660781-1-h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|CY8PR10MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 1644920f-a861-41e2-9d1f-08de282e6dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c95zxxJN03Xp8JC5qNKWrOH2fdPjgajxMO0O9/Fa7eDW5lDZZg1dNoSY0G4Z?=
 =?us-ascii?Q?33/l7lOVSjTwY6bMDgRn6zdKp8X2842TameInOqPiMCLnBNCDRrRjHDYj4Cn?=
 =?us-ascii?Q?xyp+iLYkZ3JHUNFEMiHZDmGClnE7Olf8uOU2matC/iWYY28Z1/gyzGwfG50+?=
 =?us-ascii?Q?ZK+sWkHI43fdx+Sv69acs/mUabKKG5hyWyJDmNobJu7o8B6D31TM/9IxW2v4?=
 =?us-ascii?Q?+9NaZbGQw9pRDj/ssg8vZTo5lFRc6exMgtjY99yDto4wMJPEg4g7zcdTF65R?=
 =?us-ascii?Q?dJTY5Go0Blv9g4Vkmj/EM81tFgbelOwT48+jMDk9ccLU/oBJmS6mLujTwOUl?=
 =?us-ascii?Q?UgCH4KzZ8aBsHI+BENN37BlOVQVUoVBw+nVhGGRDqA+m1mKARqY7EGBBhy68?=
 =?us-ascii?Q?zjlk28Y5uTJebPwvwZ1Vva1HcLFsoJFxToq2EsRZsAT/6Wvnj+zyxxWlQRkN?=
 =?us-ascii?Q?Qrg5vcDqFrM3TT0FhWvoReL9Wt4JRKDuLz91Swsse71QoLlfsaxyZja9+Kgl?=
 =?us-ascii?Q?kQOm8zlcadlYmXp/y6ho7v/3w8cHmtTTOYoH80P0G7ZP8bIyEXeMKWw/4mQZ?=
 =?us-ascii?Q?ijjAzM8V5AR6rDEuLWbQfoxkQsIY31j+LWW+XrwE0+7VCk+5zvLEKMeTn/Xr?=
 =?us-ascii?Q?mO0FcXiszFLFTotzFpvm62lM5RdIYmmFC8D21h+I+IJ8z9Yfxt5iyIN51EvM?=
 =?us-ascii?Q?WUa6lR6/vNwOLqxJRD5Tufgvf5IckokL3gvnyRhE1Nk59awKXAfKOmscb3B4?=
 =?us-ascii?Q?69beltIOlawZcuMpw5UzYI5ocG8P0KwWrKkjE/SAxKgvQd+oi7hTF1hHJuaQ?=
 =?us-ascii?Q?FcBScroSdQYorlm76L6b/Iq4odHaEMq9pWt6byF6aXCW7XoEABNDlE4wxWA7?=
 =?us-ascii?Q?3yJCzGJpJDNDqQBw++B+79Qr1MqpP0Kj4SoGWl8puGzjpIqYdBJQlNpyX/s3?=
 =?us-ascii?Q?X6kSIzgKNjJ4IOPvPL3FhgQ36ISOHq1Z2T374yCXSeNOEKaed01KeIp4/XTt?=
 =?us-ascii?Q?/L+7c3YAB9ev6RbRcBvj52AMGPlw5JeT806oK1OyGKSL0fiJ2TafXHpyE8MN?=
 =?us-ascii?Q?FYdq6pgGIr7y+AbOmgQYgbk/UuVWic9rgqQRN7xQjIfXDGI6FdRNRcXCC1ip?=
 =?us-ascii?Q?4m9t8YrKOj3xugygIIHQppJl+BiRjQYhw1OGqk9pIFxgEJdo6FHQnlC61461?=
 =?us-ascii?Q?7BalyGDFhAbkKkipz3J9b5tmVPsqpf+Z/IBUUoz0HaRhCzETgSelZfZtZeOq?=
 =?us-ascii?Q?1R3UjMjdxwRqWyYF3Pzs4fKYjd+SOarV2fVISMmSurO/sv3TD1mLr/1V6Y5o?=
 =?us-ascii?Q?PesFAOF1DOah0VD2FRHcNUswK/MbfyAfQ2VdpKANdWWApvc3FIv/iGiDZIVm?=
 =?us-ascii?Q?ybBEQPpYTQ667w5moB6uydZddZnY8i6n4kKf8CCNABtLzzIiyDCM5RHtkPzn?=
 =?us-ascii?Q?vMETOwLmldxzwaYzUQOm0b+Z5hyVAXJwWx5bJZV9rO7pt1zEvu+n+s4+NARb?=
 =?us-ascii?Q?qjxcKjRwcso+EgjxspuGPkFxxGCRz9rjfPoI67/o8tMf+4MMsk7oAnRjeinN?=
 =?us-ascii?Q?j2rtbRr/tMKp4Ha5QfWxpkp9FBBTOMRFcuRAHMmD?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:15:00.6985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1644920f-a861-41e2-9d1f-08de282e6dba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6907
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

After enabling DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, mhdp->connector is not
initialised during bridge_attach(). The connector is however required in
few driver calls like cdns_mhdp_hdcp_enable() and
cdns_mhdp_modeset_retry_fn().Now that we have dropped the legacy code
which became redundant with introduction of DRM_BRIDGE_ATTACH_NO_CONNECTOR
usecase in driver,we can cleanly switch to drm_connector pointer
instead of structure.

Set it in bridge_enable() and clear it in bridge_disable(),
and make appropriate changes.

This allows us to dynamically set the reference in bridge_enable()
when the connector becomes available and clear it in bridge_disable().
This change is necessary to properly integrate with the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set while maintaining all
connector-dependent functionality in the driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c  | 14 +++++++-------
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h  |  3 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c  | 16 ++++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 816d5d87b45fe..002b4be3de674 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1765,12 +1765,12 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 
 	mutex_lock(&mhdp->link_mutex);
 
-	mhdp->connector_ptr = drm_atomic_get_new_connector_for_encoder(state,
-								       bridge->encoder);
-	if (WARN_ON(!mhdp->connector_ptr))
+	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
+								   bridge->encoder);
+	if (WARN_ON(!mhdp->connector))
 		goto out;
 
-	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector_ptr);
+	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
 	if (WARN_ON(!conn_state))
 		goto out;
 
@@ -1869,7 +1869,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
 		mhdp->info->ops->disable(mhdp);
 
-	mhdp->connector_ptr = NULL;
+	mhdp->connector = NULL;
 	mutex_unlock(&mhdp->link_mutex);
 }
 
@@ -1964,7 +1964,7 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_connector_state *old_state, *new_state;
 	struct drm_atomic_state *state = crtc_state->state;
-	struct drm_connector *conn = mhdp->connector_ptr;
+	struct drm_connector *conn = mhdp->connector;
 	u64 old_cp, new_cp;
 
 	mutex_lock(&mhdp->link_mutex);
@@ -2179,7 +2179,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 
 	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
 
-	conn = mhdp->connector_ptr;
+	conn = mhdp->connector;
 
 	/* Grab the locks before changing connector property */
 	mutex_lock(&conn->dev->mode_config.mutex);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index a76775c768956..b297db53ba283 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -375,8 +375,7 @@ struct cdns_mhdp_device {
 	 */
 	struct mutex link_mutex;
 
-	struct drm_connector connector;
-	struct drm_connector *connector_ptr;
+	struct drm_connector *connector;
 	struct drm_bridge bridge;
 
 	struct cdns_mhdp_link link;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 5ac2fad2f0078..1d433ad3fe878 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -393,9 +393,9 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
 {
 	int ret;
 
-	if (mhdp->connector_ptr) {
+	if (mhdp->connector) {
 		dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
-			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+			mhdp->connector->name, mhdp->connector->base.id);
 	}
 
 	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
@@ -445,10 +445,10 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 	if (!ret && hdcp_port_status & HDCP_PORT_STS_AUTH)
 		goto out;
 
-	if (mhdp->connector_ptr) {
+	if (mhdp->connector) {
 		dev_err(mhdp->dev,
 			"[%s:%d] HDCP link failed, retrying authentication\n",
-			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+			mhdp->connector->name, mhdp->connector->base.id);
 	}
 
 	ret = _cdns_mhdp_hdcp_disable(mhdp);
@@ -494,16 +494,16 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	struct drm_device *dev = NULL;
 	struct drm_connector_state *state;
 
-	if (mhdp->connector_ptr)
-		dev = mhdp->connector_ptr->dev;
+	if (mhdp->connector)
+		dev = mhdp->connector->dev;
 
 	if (!dev)
 		return;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	mutex_lock(&mhdp->hdcp.mutex);
-	if (mhdp->connector_ptr && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		state = mhdp->connector_ptr->state;
+	if (mhdp->connector && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		state = mhdp->connector->state;
 		state->content_protection = mhdp->hdcp.value;
 	}
 	mutex_unlock(&mhdp->hdcp.mutex);
-- 
2.34.1

