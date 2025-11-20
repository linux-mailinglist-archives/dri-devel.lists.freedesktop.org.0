Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97095C73EA8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8783C10E080;
	Thu, 20 Nov 2025 12:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="oNbgGHQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013036.outbound.protection.outlook.com
 [40.93.196.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E0310E080
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 12:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0B8wMVLDolAX52OTOxOF7TsLXqy3GGp6X+Ym/NLDPB1DObdSSPLIh+Bhi9c+/eevr2khkXncWxmhIIyT5WmHePeRbwBcMqy5iZ3dYzT4yv98kZ+QFnVOaUoJUp5XzDtpQ+QX0AoiG1xJbtpk9zzKV/1jR98brV4pJSZ2tUWJeMOc4O0YyFKl3mUhTI9ZbLnO+ZWEJAhpdewTrrT+9ZdlXAXQkfL3oHjXGrruXe+lkSwg+5Y0LqaaK0DKXQEkkh0L6+bwNenIbmaS0/w2r7qRO7xKmioSTTKYR162HvHj2i0t5e+xsjlIllBGBewlX/IffKrZAgTal12TBv5H8g3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdUWSt9N/J9J/AG/RN6TgfIA3S3IcfHRjK4jOK5hVB0=;
 b=DGbhfabOf40bUye6LCBvd8EJmuvpPXEdg2C09OQSJ7lXR9csTI5xGOqxaWOKVz4MwMP4HIhG6qGECeSujk0J2dtfVbxQe7XSmAIjzbd1Hausazz/qdhuK5tq0jqkUBMu4VlItcYM/COsjgdY6WtHAVhFk5hQ72nTojzU/1/omzgt5bwlt45FVkz1iYNxMF4yf1f7js8M53+zl7i/HvrTay9rgmNQmU4SgHJcPwWtLZoz+JKmMf1k+It9rlYK9nYFpUlYiXjrESalnlLVuJLTYtoZ9Wy/z+6azN8LBE0hCipVPZu5rU/WhXjyGrNzdw7YoryE98x5q0HVJaiPrKyl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdUWSt9N/J9J/AG/RN6TgfIA3S3IcfHRjK4jOK5hVB0=;
 b=oNbgGHQU+QAU8fre55QrF2qyGi+7mZCCA5iLQt9mzvs8yqyyha8jwh/bpPLf36j2TSj/sIIMxW2J2Fsxh0Ymqwxs+MfeLoGA7bjnE2n3/Iauvbe34NznXXwgJP9/zQUNV8Pl1nh1iKwqGXYxdUdR8H7jrp7dFw9HY6sN3Yr+kx4=
Received: from CH0PR03CA0383.namprd03.prod.outlook.com (2603:10b6:610:119::18)
 by DS4PR10MB997623.namprd10.prod.outlook.com (2603:10b6:8:318::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Thu, 20 Nov
 2025 12:14:33 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::48) by CH0PR03CA0383.outlook.office365.com
 (2603:10b6:610:119::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 12:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:14:32 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:30 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 06:14:30 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKCEHDu3636470;
 Thu, 20 Nov 2025 06:14:24 -0600
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
Subject: [PATCH RESEND v9 1/6] drm/bridge: cadence: cdns-mhdp8546-core: Set
 the mhdp connector earlier in atomic_enable()
Date: Thu, 20 Nov 2025 17:44:11 +0530
Message-ID: <20251120121416.660781-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120121416.660781-1-h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DS4PR10MB997623:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cbb4ba-1fed-45ff-7725-08de282e5d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HvR25vdgMxRWlydI4TegL8FxLIrwLNUYLOoCZga/T158nHqV/N/9wC9jtnlM?=
 =?us-ascii?Q?t0Ab/bXAIQVXaJkTD3s7a4KLxOpH5XuLD6nchuxbO8PuPpNe3AOWlxYvcjHk?=
 =?us-ascii?Q?+5MdI8P2F8W+Lr0ScT9eAYv7rlKYLD6YJnP5ICxb4GfpkNacfLXmsYslGBnW?=
 =?us-ascii?Q?HC6ggoJ4xDdUylWochP6LNWQwv3VsD08+99+HQVFwEiSxD9ymwYX+RxP1+7I?=
 =?us-ascii?Q?6KfiKHXpg4KAywLgCfIGD5s4SDr/itQNFGdikj5Rt9PMc+UbtCPd9iDW/vgW?=
 =?us-ascii?Q?CM3uKb/8UXNKhfnREWLZBN3wp1LyU8k1WUwaI9sgH9CRalqz/nELA2SzsUj+?=
 =?us-ascii?Q?e/A3KxisOElGsKcdFgGb0foFg9ePy02rscIClD4KuzMv3qm0cPs/cJIIRnQ7?=
 =?us-ascii?Q?NuyG/03yPkFUucc7PIK8YeoDIfO+HGZ+tG+tAT88nL9QCYeoUIvh18aTZYvc?=
 =?us-ascii?Q?mmw+OFCLl9WrPRRa8/jMfp6HZ9gn6OFFTQgH4He21hojFBQh8KsBtItFDPXl?=
 =?us-ascii?Q?xPoepWUus2EjQhb+5qX11ZJV0AQRG8n3IgqR8GdBVFPSt6Ax5zEZA6+2mlb3?=
 =?us-ascii?Q?eYduX4NBQxEjs2y/F23pbwDpVdN4CEOZaZfElmSo0GYZirwldTdmLBcbMUy3?=
 =?us-ascii?Q?CksH+ISRuBD2WI9LfKuUw4h8TYaxSf8a4hXw93WKn9ia83FQW52StfxlwXjY?=
 =?us-ascii?Q?iB4VOWu5s56+8nu3YS/+wcw/+tVZuDVKxgtiMArzDqWseZx10rtJXnfWDe4D?=
 =?us-ascii?Q?9e/aZvn1t8cG2JbBl6AnOcbhT4tjscXwYeB21fAO9Bea9w4lzAfN/cIQ1ngx?=
 =?us-ascii?Q?9bMu/5huRy9ewqtg6LTc8tRgK5QPeBX3KYxvnnzycQjCsB0n4OSWpHYRNJFv?=
 =?us-ascii?Q?4iIXFhmyrwJQ923CaaShbhcujtfCBMuhCZrPld8AwIdLzqCzRA2ildBmKLZK?=
 =?us-ascii?Q?BKjDjUlVEOyS8QEan5Ng+LFCIGA3NGxTI73KV1YsZjPpUaIiXKo2ZHEq73zG?=
 =?us-ascii?Q?cV3HEzdXt47WqtdqIg051ttgO7tYGHrGgbyirwB7IdIlpccUthrJyZxEL6HD?=
 =?us-ascii?Q?jritKKtJ9QOyuh8NqHxGewE/R7RaHz5L4IyP7EAKP4V4i4lGiJxn1gPGh1ea?=
 =?us-ascii?Q?+5u8MdP43hpHqfHdmkvkNaXqaeZDGQskP5Heei21ZTiuHf8fO4p9ba6kbTKY?=
 =?us-ascii?Q?qi1PGk3if9+YHex/+x9Y1oJdi4Wy0nzn0yZr2+P7pk0T+XYnEt2n1f326gbp?=
 =?us-ascii?Q?SFhgCIQZgYOgPhNySkgnLxVrYk8QDmjG7s058ZZBavFcozrLHutgr2BxXRI9?=
 =?us-ascii?Q?VfjqjO715W9daSscxlTsO8yRF6xxxdciRGGTY0CMJsAf7Jc+XPU02USvO1C5?=
 =?us-ascii?Q?3nheg2cqS8o/MlQ0YJ5PPI6szp479OAYQM/zEcV96QnUMTK5GlHnMQwyItin?=
 =?us-ascii?Q?s7dbB+QkVNN0LoBYuShNt7jHA+yi6q7/d73votR40jDT45tJWqm2sxWAzuNF?=
 =?us-ascii?Q?pjiRbSl2lJ4aZmHo0IW/tzUbtphaYCJUVOz6oiZWicBNELSgv9y7sM2JfjB4?=
 =?us-ascii?Q?A8G1F4Q/DXtuYbSBrejofi98zzuc8rmhVweFrCT5?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:14:32.9602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cbb4ba-1fed-45ff-7725-08de282e5d31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997623
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

From: Jayesh Choudhary <j-choudhary@ti.com>

In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
NULL pointer while trying to access the mutex. We need the connector to
be set before that. Unlike in legacy cases with flag
!DRM_BRIDGE_ATTACH_NO_CONNECTOR, we do not have connector initialised
in bridge_attach(), so add the mhdp->connector_ptr in device structure
to handle both cases with DRM_BRIDGE_ATTACH_NO_CONNECTOR and
!DRM_BRIDGE_ATTACH_NO_CONNECTOR, set it in atomic_enable() earlier to
avoid possible NULL pointer dereference in recovery paths like
modeset_retry_fn() with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 ++++++++++---------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 26 ++++++++++++-----
 3 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 38726ae1bf150..f3076e9cdabbe 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -740,7 +740,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	bridge_attached = mhdp->bridge_attached;
 	spin_unlock(&mhdp->start_lock);
 	if (bridge_attached) {
-		if (mhdp->connector.dev)
+		if (mhdp->connector_ptr && mhdp->connector_ptr->dev)
 			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
 		else
 			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
@@ -1636,6 +1636,7 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
+	mhdp->connector_ptr = conn;
 	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
 
 	ret = drm_display_info_set_bus_formats(&conn->display_info,
@@ -1915,17 +1916,25 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	struct cdns_mhdp_bridge_state *mhdp_state;
 	struct drm_crtc_state *crtc_state;
-	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_bridge_state *new_state;
 	const struct drm_display_mode *mode;
 	u32 resp;
-	int ret;
+	int ret = 0;
 
 	dev_dbg(mhdp->dev, "bridge enable\n");
 
 	mutex_lock(&mhdp->link_mutex);
 
+	mhdp->connector_ptr = drm_atomic_get_new_connector_for_encoder(state,
+								       bridge->encoder);
+	if (WARN_ON(!mhdp->connector_ptr))
+		goto out;
+
+	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector_ptr);
+	if (WARN_ON(!conn_state))
+		goto out;
+
 	if (mhdp->plugged && !mhdp->link_up) {
 		ret = cdns_mhdp_link_up(mhdp);
 		if (ret < 0)
@@ -1945,15 +1954,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
-	connector = drm_atomic_get_new_connector_for_encoder(state,
-							     bridge->encoder);
-	if (WARN_ON(!connector))
-		goto out;
-
-	conn_state = drm_atomic_get_new_connector_state(state, connector);
-	if (WARN_ON(!conn_state))
-		goto out;
-
 	if (mhdp->hdcp_supported &&
 	    mhdp->hw_state == MHDP_HW_READY &&
 	    conn_state->content_protection ==
@@ -2030,6 +2030,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
 		mhdp->info->ops->disable(mhdp);
 
+	mhdp->connector_ptr = NULL;
 	mutex_unlock(&mhdp->link_mutex);
 }
 
@@ -2296,7 +2297,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 
 	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
 
-	conn = &mhdp->connector;
+	conn = mhdp->connector_ptr;
 
 	/* Grab the locks before changing connector property */
 	mutex_lock(&conn->dev->mode_config.mutex);
@@ -2373,7 +2374,7 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	int ret;
 
 	ret = cdns_mhdp_update_link_status(mhdp);
-	if (mhdp->connector.dev) {
+	if (mhdp->connector_ptr && mhdp->connector_ptr->dev) {
 		if (ret < 0)
 			schedule_work(&mhdp->modeset_retry_work);
 		else
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..a76775c768956 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -376,6 +376,7 @@ struct cdns_mhdp_device {
 	struct mutex link_mutex;
 
 	struct drm_connector connector;
+	struct drm_connector *connector_ptr;
 	struct drm_bridge bridge;
 
 	struct cdns_mhdp_link link;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 42248f179b69d..5ac2fad2f0078 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -393,8 +393,10 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
 {
 	int ret;
 
-	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+	if (mhdp->connector_ptr) {
+		dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
+			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+	}
 
 	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
 
@@ -443,9 +445,11 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 	if (!ret && hdcp_port_status & HDCP_PORT_STS_AUTH)
 		goto out;
 
-	dev_err(mhdp->dev,
-		"[%s:%d] HDCP link failed, retrying authentication\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+	if (mhdp->connector_ptr) {
+		dev_err(mhdp->dev,
+			"[%s:%d] HDCP link failed, retrying authentication\n",
+			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+	}
 
 	ret = _cdns_mhdp_hdcp_disable(mhdp);
 	if (ret) {
@@ -487,13 +491,19 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	struct cdns_mhdp_device *mhdp = container_of(hdcp,
 						     struct cdns_mhdp_device,
 						     hdcp);
-	struct drm_device *dev = mhdp->connector.dev;
+	struct drm_device *dev = NULL;
 	struct drm_connector_state *state;
 
+	if (mhdp->connector_ptr)
+		dev = mhdp->connector_ptr->dev;
+
+	if (!dev)
+		return;
+
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	mutex_lock(&mhdp->hdcp.mutex);
-	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		state = mhdp->connector.state;
+	if (mhdp->connector_ptr && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		state = mhdp->connector_ptr->state;
 		state->content_protection = mhdp->hdcp.value;
 	}
 	mutex_unlock(&mhdp->hdcp.mutex);
-- 
2.34.1

