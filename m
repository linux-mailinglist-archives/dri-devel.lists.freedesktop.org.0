Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA20CAFDAA
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C48C10E161;
	Tue,  9 Dec 2025 12:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="F+Vckqku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAFF10E161
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVB4wvuPqt21Tv6cY4AbQS4mriIyGnlnr1WvPpXyCOAp1i0QHdcUvEOfbu4xP+nUUF2mzRl03ypjmYv3KbhmDu1xJSipX/9RwFLiQ+q9pbj1sQRMxWWSpcXTzS0StOpv0JGP/4cXDhdHIWlq4Y2KDCYvMYkgQqotv5HhR65bAZpOW6bvAYaiViA0AW3TSDEiCrv0GXuPj1EdoQg/A6IMk+rwlGFMX4L7r6JwIoQvObUEOVvoh7f3VsCxPqtEL17UqM22PE/5UkXMl4MDWjyqrglUL2vJSt1dhO7t1kqXi6VoxY4ZuoopkkalwX7YU4AyQoAdO7agPa37uWEjWVpABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk4ZQPehZkMhtO2T6CDTwCoRIqbBd5/FiKPZhYc+kRI=;
 b=VmU3wnRmnWSbd/E9Bu+EbHiNQncH6LDVEirHA3dE56+4or4V6o+t4tBnnpNPgb33HdNZqDc99JEZznYqGoO6EmHVEpZopIzK8q431eyVIM0RHksNzvgDQ0yboYMvWdku2MJ79XU2RlE8zFkGaM/tRRzgHdXphd7NObi6ngmS3WXHjVanTNDmoIqzLeN121xoFgu0aFkhuXWEu29Ax2M/gOcXsERTYAJHL4egkHJIdr5B5GSxf5LTMoArTpdSLbdS4SlZnnpSXx3kwC1zRvOZbnMa0cjoSOGh7QDDCM61CulfYXS0fE7zjDA+OTKbhmLTU0OXp01TIJACX+/aH92gBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dk4ZQPehZkMhtO2T6CDTwCoRIqbBd5/FiKPZhYc+kRI=;
 b=F+VckqkuVGOloOQ5KhtZ0ADjCTzf9TeWoe4eFJHvoBfOUBjcIj6V++of/AkdABKC+MBasVD2SDF94o+M6OkToGMVdKwoVWSkGH58mfCLRcZJLnZ6snXA8e0z+7qjsVPVTk8gjl6XNuB2OCenDeeZe7FZ2j+lQutjwAae8Kd9ZBY=
Received: from PH0PR07CA0067.namprd07.prod.outlook.com (2603:10b6:510:f::12)
 by IA1PR10MB6073.namprd10.prod.outlook.com (2603:10b6:208:3af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 12:03:49 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::64) by PH0PR07CA0067.outlook.office365.com
 (2603:10b6:510:f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 12:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 12:03:47 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:46 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 06:03:46 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9C3XBM1165975;
 Tue, 9 Dec 2025 06:03:40 -0600
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
Subject: [PATCH v10 1/6] drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp
 connector earlier in atomic_enable()
Date: Tue, 9 Dec 2025 17:33:27 +0530
Message-ID: <20251209120332.3559893-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209120332.3559893-1-h-shenoy@ti.com>
References: <20251209120332.3559893-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA1PR10MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 401fa539-2a9a-4c0d-56e3-08de371b027c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nbz6COOueAlS3AQCb6f1OrpZaJ/JAS7z5cGkppC2/Cpw2IlwzBfCkqKrUjpf?=
 =?us-ascii?Q?lCRtVgbnA7xieCIR29zTREXfnpGYyYEpjEYlFqfoupQDJmWf+3LZjz/SgWSG?=
 =?us-ascii?Q?gdVgxemCBqq5hbrovdxoBg3m4EvRJedtCIC0CrA+lRmNJw4Kn1iK1DQ9LWMc?=
 =?us-ascii?Q?j+wPqBG86Gr7xJRz7G2XlF3qtZNFsMi9AAwlWw13k9D/UfLqxZbIQmcQs171?=
 =?us-ascii?Q?xQ4iicPsxDLQiURTTC1B/LM/rKQYTlMQ7VEdF7NGvEyKdwcB/+i6fOLKDU6h?=
 =?us-ascii?Q?bdqu7DH3lPS7FtYHeMLwS48lOyAAyPJQSbMk2OTSv59FsnGrXyQNGfovQ02j?=
 =?us-ascii?Q?zr+c+eHjn+tGOcOW/cZbxDdNAIQDhk8clrFYt9GqcCTbVhWngyhclWSDJoTv?=
 =?us-ascii?Q?9ElRAm2DGvO7sw67G28Q1XDx1Empxikjnbp+3KqL1gqGg8vm8Zs8gVtSkGeI?=
 =?us-ascii?Q?1ZPzkUtN1HW1DXcZ8h13zpDPPuv65fPNolj0b9FzG4QUcd7PO1h9I3qEAFYF?=
 =?us-ascii?Q?GYxrmajvP9hyTArWDX1fwNHdTMVRPXGqlLyziSJulTsWSIiTqdZzHnCwLBnP?=
 =?us-ascii?Q?3+0mBijGx/B9EKJHYqaV+tpedskYfUggwTmV7E6FrKwnCc4xxR3k3IfsZ+Km?=
 =?us-ascii?Q?+QBZpO8v9GbCslMyAOO2P8CH8g8ao022vBCuyBPJ6MPO23dGCplq+nP7Pdqc?=
 =?us-ascii?Q?lu31I26s4O6OIul83gyGggdwPpozEeRTRHU34mamVQG9/tKsrgOV09MbmqK1?=
 =?us-ascii?Q?dZFw35lgl/3+XKwuRhB04+283ltRnYoGeC9r1Ywg7YmHxjCrYIzxn5XmMebJ?=
 =?us-ascii?Q?dJDV/YxEyz+2sy2lR6jo+uQrFQ4oxSvP+AB7LzG9KdssQOUqR4oV6xBydVY4?=
 =?us-ascii?Q?JgY/s+9cilm0V7NlSqw57S+F20MXCyyjxtODi2XsBlbjwQ7BVR7JUo4xs2oY?=
 =?us-ascii?Q?MChhMPVVphXVwJT1YHmjSDc8Q5jlS6imGw+LUN3PrPsiKbZlq5EesavsORz0?=
 =?us-ascii?Q?MqqTk1Lk+waq9pzYUiNA17jD8LJoQgtwv64C2GSQDcAfNpmh2h74NujTVMnr?=
 =?us-ascii?Q?4MMVBbpZ5egFlrsiJY8f8TkKtkmDuRZe95df2gjyARE9MxU0A0HhSAXEjs5+?=
 =?us-ascii?Q?bh8A0LVJBbB/VsrU7WJQHBLiLUS3GSHQXwhzVVUyHBEGT1mKeSCucOrx4PGJ?=
 =?us-ascii?Q?gVLJteZSxGR00chFt5S4NlXHt9OcwUzwykt2d725I7+gW8Y/V/k3rP2DugZb?=
 =?us-ascii?Q?4tk4g70AkP9AEIxCPFuqC5Ewb0khqYN3G4GgV3IOlDBORYk3yShcGMEH2/2K?=
 =?us-ascii?Q?4M9YIXIifv5kcIM5HuSf2V0pf/9Krg0WDi6x2o7SsNVgVBUVBLuOp3a1zqBV?=
 =?us-ascii?Q?C9nt3mpdgP++O5351vykTyfMbjRAWp/1cBQ3qokkLb0aK4yh9sPRCNUG50vH?=
 =?us-ascii?Q?fJbwFMNQ/pc7g4y5uANrem1tkB/TN58Gg+CsSY7dL3QjfqNEUL5ocnVY//Uf?=
 =?us-ascii?Q?2ZqlYTwykZxEa7MRuKV6z6mOsUZPsh4qjUAAJekKrlS72J/45FkIDNcCtpgX?=
 =?us-ascii?Q?+6z1R9HsSD+Flus2KB0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:03:47.7853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401fa539-2a9a-4c0d-56e3-08de371b027c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6073
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
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 18 +++++++++---
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 38726ae1bf150..ef2d0ea606f78 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -740,7 +740,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	bridge_attached = mhdp->bridge_attached;
 	spin_unlock(&mhdp->start_lock);
 	if (bridge_attached) {
-		if (mhdp->connector.dev)
+		if (mhdp->connector_ptr)
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
+	if (mhdp->connector_ptr) {
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
index 42248f179b69d..21a7d2fb266e4 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -394,7 +394,7 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
 	int ret;
 
 	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+		mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
 
 	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
 
@@ -436,6 +436,10 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 	int ret = 0;
 
 	mutex_lock(&mhdp->hdcp.mutex);
+
+	if (!mhdp->connector_ptr)
+		goto out;
+
 	if (mhdp->hdcp.value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
 		goto out;
 
@@ -445,7 +449,7 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 
 	dev_err(mhdp->dev,
 		"[%s:%d] HDCP link failed, retrying authentication\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+		mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
 
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
 	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		state = mhdp->connector.state;
+		state = mhdp->connector_ptr->state;
 		state->content_protection = mhdp->hdcp.value;
 	}
 	mutex_unlock(&mhdp->hdcp.mutex);
-- 
2.34.1

