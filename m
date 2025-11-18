Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB55C69347
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C710E489;
	Tue, 18 Nov 2025 11:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YTj2Nzyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD8610E489
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akK2RHju1wHOXDePHX+2ghwT0PkNybPlS1NuWLf9m4nYNNJ6yeO7tL8Iq6DyNagXA3mDVpAC+jLIB5xJq56VUCH86dbF2HT1X0RBzTF8Ns998FrLXQazKpbbQB5BQdBO4vic+q2H/hRvPqHB0M87ViVZyK5XkXNa3k82/dRcl/tqbbzymHPYgxwUCvqLLkwFXA8SezDbrKk/CANG2kjnVBEHSuaHacEmPpmu8GZ4EO7wi6nTBkn0zsSLe/WuhGNX+knj7cQ0CVVhZsUb8O9K0JAi4QA6otylVCbvco48SigNh+J3V+L9zwlgJ2nVejv+QRPO7iI+K4SAB76e0rC4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waiHw50H1YchUu3Rx/5lCbjnbcCiwfaFWLsubeZEhGg=;
 b=o8e63Tc3z05bESZGwZFcz0plm+L1daAKL8Bh3Xr8il5dY7xiuudM0f7DG98dHUkiE1XknbeAagslE6zS2To2nLuJWu1R++wusglDeoE1MRI3jrkZFW6OjxaBsgUe9pzjGvNhAIEopIm8Dpc12Doz8U4ZBBS9g23XonngH8sZ8VIJzijlV9sLnC4pINImh/CUyJdT3vqgDy+Y96kDpBYi6RA9mJBlCXclonu1gQB+hQgbWissR5hcph+bA5UQCuk9DeYWFfYkEyTOhY5gvjhriSPWJhPsyANTatKCDDU+ZFUvHiFXIgMEQLZIqNNte/1gyTIZo3+pEztaj6cGHJNJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waiHw50H1YchUu3Rx/5lCbjnbcCiwfaFWLsubeZEhGg=;
 b=YTj2NzyxXWwyQHfgvQczxARpzwDoaPCZuhmDsO1EupzcgJpcgLrJDeTIP0ZbFQ4EUZCVd4wI1T1cRZ+zAoGVgb+jgKcskXfKuHx9UptoWlM2TSjzNTheCnF9b4fwGSYQYXgqztDGK+vxK+QGmyPn4N5sdKHhklPW992Zr4ibfwk=
Received: from PH8PR07CA0001.namprd07.prod.outlook.com (2603:10b6:510:2cd::26)
 by CY5PR10MB6118.namprd10.prod.outlook.com (2603:10b6:930:36::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 11:53:38 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::d0) by PH8PR07CA0001.outlook.office365.com
 (2603:10b6:510:2cd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 11:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 11:53:37 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:36 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 05:53:36 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIBqulS006869;
 Tue, 18 Nov 2025 05:53:30 -0600
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
Subject: [PATCH v9 5/6] cadence: cdns-mhdp8546*: Change drm_connector from
 structure to pointer
Date: Tue, 18 Nov 2025 17:22:54 +0530
Message-ID: <20251118115255.108225-6-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118115255.108225-1-h-shenoy@ti.com>
References: <20251118115255.108225-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|CY5PR10MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: bad190ef-205e-40e0-63e1-08de26991bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zLYjnfqb126RZAWtRSzUo6558ZN+XosQFG2d3vTNoWLsYORlQ0w49H1I0z8p?=
 =?us-ascii?Q?Hao3R5HT8WIPjlnqAvlfvHgkBNNG0gCG9rMFL83dAbswohkbUU1kcxmyrUX2?=
 =?us-ascii?Q?g5EFdgQobc1ltMMx+2CDbmxG/Aw9OsMxb876khxYxhndxfilpOAVRD+meskM?=
 =?us-ascii?Q?qcK87e7lEaPZDplTgTyJzrSynRxDXE6pc4Sv+St0FSHHMlOPRxFj+yhbsoPN?=
 =?us-ascii?Q?4QsRcVF4bW+LruDEdq5m11mNZ3Iyou4vIjjuYzs13+3Up3n5tLiSCO/sfXpZ?=
 =?us-ascii?Q?jY5zraHwGLoi+H+iWkDCX/CnM5u/tOQSz4Lx8SJpWYtZEv4Zr7WCu9A4oyVJ?=
 =?us-ascii?Q?P4Iax/N2hba7h64lN1op7YetjzJhcKo9rXDN8Db9b16q7faLHE5htZEl7dHQ?=
 =?us-ascii?Q?jVwxAbI9I+90PiRWXIVnl5yM6PPdKmLymvCLBV46fpc7f5Pnf2Okpn19CUvr?=
 =?us-ascii?Q?jVCePdwH9IZS0Fb7Cnx3GmHJUI9VwP3C+5jtrPik6Cz/Mk/KrYHqhE34AkD+?=
 =?us-ascii?Q?xOZ2NyQBBALi/89IkrKZCkCfMaYFbnbqF/QldRMdLUOmiR5OnCwOuRHETGnn?=
 =?us-ascii?Q?k9RQd7M/gmhx/ZDcmVFb68AztBNqYrFdiBWglS2zNto3y8oM/vbPPE7uthqV?=
 =?us-ascii?Q?MIbX9ia6nHfvcnme7UyLYg/o5VGAN3hhLeiB8AmpASiEusJqQRzqZaGI9WeT?=
 =?us-ascii?Q?nQZuClPtzISIde4wj7lGhdEe6AFaj96wziYm64+TuJHIQC3sCkr90FbUzCDQ?=
 =?us-ascii?Q?Cy4AZ/iccHPszqiU8eV88hsbazMILefGbarBJelyDAJwjXF2bKLpYQ5TcX90?=
 =?us-ascii?Q?sna8nJHo3n6eyoFFlNS2wWo4R5Fh8vVb+w3kmm0x6XZnuwJeGsnGWZfQP8jI?=
 =?us-ascii?Q?3zzMqhkU50rOG9UDMIPcldUeCc/c4yXDtzEpF88lOSmGmxE58z5Vm3D4lRqV?=
 =?us-ascii?Q?ljA4jnXn/2qQLhMNr8Ko4I/i1pvIU6FTZvag2hd+ukttMBk0b02Mk3CcsQFs?=
 =?us-ascii?Q?HuLRxzs3thbF+nc7AQZcHPFUs1JMcRGXnRorKje1aVzLvJGKEUkP3Laj6Huj?=
 =?us-ascii?Q?VdT1reMwhF80QKcltWUUOShtp6pkijh87Y40GO1QV3D9Au84V91OZxin4ZXo?=
 =?us-ascii?Q?fhKlT/ruQldqJ7OArwu27Z+4g8AeyAKp/V7d75hEeuUY7rGVi0zuZ7giQZBu?=
 =?us-ascii?Q?ItaBiUKI4qsoBLCfzDzU2L8+R/9oIIausParZhSwG2TdNVVsMm/5Xo1w8XiA?=
 =?us-ascii?Q?DSIPOGBpIU6hei8uQNLxdbaUgMRaH0RFMMvqfOCytKSri/wAIGEDGVMfaarr?=
 =?us-ascii?Q?mZ1x40txiMNfb650hxxgT/DnRxOC+blXWm+xPe/2FOAJePbObaE7wJc9fSLS?=
 =?us-ascii?Q?GXxiJ42Q9mNBB4A0aa8qqalFsnxNsU8ObNpDPI7TBO2VD8NJ+/+Js1wa2Y40?=
 =?us-ascii?Q?cJaYwelzkZzltRHti8CxvM/gKLnHWaefXqRHDHPfZtF3DQrgF+VMsqmxOZY4?=
 =?us-ascii?Q?00kbAGwfFWDq15skyLyzJdLGRapGKkKU5i0dXUd+YYpnz/dgUUEfSYHpSERo?=
 =?us-ascii?Q?6FnSiZlWbp7jVgGTuWMhwrUusqTpgU+8dmHkLKJF?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:53:37.1312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad190ef-205e-40e0-63e1-08de26991bd7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6118
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

After adding DBANC framework, mhdp->connector is not initialised during
bridge_attach(). The connector is however required in few driver calls
like cdns_mhdp_hdcp_enable() and cdns_mhdp_modeset_retry_fn().
Now that we have dropped the legacy code which became redundant
with introduction of DBNAC usecase in driver, we can cleanly switch
to drm_connector pointer instead of structure.

Set it in bridge_enable() and clear it in bridge_disable(),
and make appropriate changes.

This allows us to dynamically set the reference in bridge_enable() when
the connector becomes available and clear it in bridge_disable().
This change is necessary to properly integrate with the DBANC framework
while maintaining all connector-dependent functionality in the driver.

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

