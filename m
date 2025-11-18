Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B1C6934A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4351A10E48B;
	Tue, 18 Nov 2025 11:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="r1pSi/ez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013067.outbound.protection.outlook.com
 [40.93.201.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B4710E489
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzjtmp9Ur8wK9JdFKPTq+9NN+K3gfvoj075N28kS8URceVdsUxdS3+YvOp3Az96RQqsj3Haqgxr1KZK61v/mS4uvCfUcsZh/ZA/X0QX3sAF2HHfQNgRyf2wpfE0fNzQ44CZMh1Ri9lPegFferGc0vScnitJVt+g3JYIQesrRk2AVnbWLk4fhXHAb1Ih086XtQDfHqzVRcuwMwXEhAAci/x3sTq1WL0M8dLefKjOkt32iKsRfY5ZpaHf43Firi3HWMaU9FtnfTgv6qcbBI1bH3vqtbRVgQ3pZ4a5mhmfqJGiZ6fDwvbcxcRQPc5VUHW3CdR2zHIRRfmNiZVdoniUJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3qdo/IG6v+ZfflaxjCcsPqVfggcrGmWOTuIHC3Sh6E=;
 b=hJjpf8oRWWKJZ0cXXf9QkszNNdaNqoYlYi3MijRDRGhZN8gH5eKeO9+Z4LHKeUAhmNfc4cirGeAxofwamxZnVOIDwhbScIMjrz6/k1dEkIc77rWpxqDZsJEagnqn4z4iORCBp5gOP1IUmw242pANL+ViR3hd5YxcnONl/yWH7dFIjdCLcd2sMGxYh883SDhxxJE1E8XAp7CNjtEO0bhIoG3yxEe2JkvJjTjNClfXz+hJGhYsHJe5sVYQpHODrGp1hv1nnOKL44Qmtp9+npxFYtgbKGzUWKJsZDLO48OIlRsbmD4XLpyXl0wnNMNTAOZtpxUhdyZrlU33D4zAuAozIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3qdo/IG6v+ZfflaxjCcsPqVfggcrGmWOTuIHC3Sh6E=;
 b=r1pSi/ez7N3JRGZ5h0tmPRRcfNMReUcA/KRQb5VImWgA9agWsE6iLTLAvC/1M27/YkuIrowoZ72Tee5L1zu7JGB5mn4YQRbIhdL8FhUgZmO5rg3JAKdLi3ABM251iDLWEJsNXim5QgPOkmSZBQBAM7TiPweFPysY7cXy9vbXit0=
Received: from MN2PR16CA0046.namprd16.prod.outlook.com (2603:10b6:208:234::15)
 by BLAPR10MB4897.namprd10.prod.outlook.com (2603:10b6:208:30f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 11:53:38 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::b4) by MN2PR16CA0046.outlook.office365.com
 (2603:10b6:208:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 11:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 11:53:36 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:30 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 05:53:29 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIBqulR006869;
 Tue, 18 Nov 2025 05:53:23 -0600
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
Subject: [PATCH v9 4/6] drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy
 support for connector initialisation in bridge
Date: Tue, 18 Nov 2025 17:22:53 +0530
Message-ID: <20251118115255.108225-5-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118115255.108225-1-h-shenoy@ti.com>
References: <20251118115255.108225-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|BLAPR10MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c94c79-0a4a-40af-a150-08de26991b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+EuDaBVeT3nNGJ/3n1wSj/JtHADwowYokOtH/+Gu3nEFZwmRx8ajj2B3BoLw?=
 =?us-ascii?Q?k1VIWj2ycsqZzW6vB2daKKa4HPvRng6gTKeAXFj+0iqj6qvs/tw2yc+fsZld?=
 =?us-ascii?Q?q28+QYxYFQyDM7j21st5Lcm2YMR5phBhX2F9aM2uknK/6Lu9HFRb00i5Sa9v?=
 =?us-ascii?Q?akPESXv3X5/Kzzxe2N20riOOcpJy9a6KZyrNmKGfHftGI/YjNKRnAKPYXo4I?=
 =?us-ascii?Q?W/3++zyXlokj3qFsFLP7Pf70d0C399cQwodG3wxcr6J3gzB68DLfKiH9OBcI?=
 =?us-ascii?Q?Xz6UUH1YK2JSQ9KIY/bBrYAvzfB/cISf/7gU+c3NS7E032qhWNSG5M1tIylQ?=
 =?us-ascii?Q?pbadJiEslzYvQXXKDQZaULE7VbI6Id8jY63RjjbV5tUdFJKmq5wTKZkdMFUs?=
 =?us-ascii?Q?pfaEy6BT8EFzm4fVKRTjviZACWDCKGLx9UbQBw6cIY85Ks8SHyK5FLtoCwtZ?=
 =?us-ascii?Q?fVR0R76oeoxFCMTcKh4sUnZ/uy1mAKsaj/1Ex8Lt8G5L8gM912HBUiAy1mFl?=
 =?us-ascii?Q?8kw4j/u2664tgxTA7C2u+G3dmuWUCgFB5evjMt5W3Kf7FmJed07epXnwmJ69?=
 =?us-ascii?Q?d1i9pgdzrBtfkaavQF4R4d3vZILTqcZfeWxVKz+Aqqu9bLVFfaF2T49sL0Fk?=
 =?us-ascii?Q?4XvgnYnarYpnP9NQwh02bukOZq2tb7uzqs5W+Ykqk4cRXzzWGkXQPEbHMk0A?=
 =?us-ascii?Q?iZc3U3eQ9n2Pyg0tjqdVP6FubxLgYGTqWVonwDSqBMWALK+Fvg7blFH+VlGR?=
 =?us-ascii?Q?rT2kORIvKXpPj3ICTkUhaFv510/e3cokY51xsKmOdtWYv7Jvg92CUoQR/MEz?=
 =?us-ascii?Q?UB+415vAad+xXSgs9HNvkFwFH2Qjf3h5KblMWTzn42zZWZnOV6xDisdIujOr?=
 =?us-ascii?Q?/TWnRI8xTnG/y57bFZ9Jc+Qtr22X4Ms3kkpUpX5ItB7iZQ4fqCMQjyFVOxnQ?=
 =?us-ascii?Q?ocF9CYCzEKVCZ6P3ICxNSowfaL7wfaU/0ie888xPAtmwceQmK75i/JxURSgl?=
 =?us-ascii?Q?/+MaHSpyWGHPHeinfAXfRmuotFWxRREPKWOfgSUp6RARatN1WNJqVoNJd0k1?=
 =?us-ascii?Q?QJkoUQkRMPkGKCZotH9xGgryLyQYWBuKEhUhL+JBruvYW5DDJRkG8cfXAg1O?=
 =?us-ascii?Q?isjSqne+LkIu/oe+OyAHXt/iLXYOahIDdwamkSzfDTYQDkUpBZBPTjeU96S8?=
 =?us-ascii?Q?Gw62jR/83wny0Rx7i56DkzzuLMBhKGlodr3H0detYAUt7vl8rbpjT1zvCe7o?=
 =?us-ascii?Q?9hbZWtkKGnIFCpwaWokwZHx82Ucnyr4eW0JDUUcA9bOF4bi9T1tu+n4nGBn3?=
 =?us-ascii?Q?jjiNYohSQoHCz5HhBRRzXiKBd8TRchDG14UsOj2MFCwc6P4BHn8tBZ3cqGSN?=
 =?us-ascii?Q?EiO8DytCTQMkO9GVy7elqG1E3XW6S9TyjA+P+CkYcuBzRqx7IFpbrzu42zLu?=
 =?us-ascii?Q?73GLu66JXPe2AgYVnTbFQJtnPfJp1CPHzOKd197MJVctlpW74Rdwy7/ufN2+?=
 =?us-ascii?Q?6cvTW3XrGaIrava5t2hFQ2lQBBM7qVtFaS6afqAYPF75ziMPUkYIuTjKO0D+?=
 =?us-ascii?Q?j9lBluB0j1cTIt6H1GSNAS+5SNcpk+6bu/MQtSeW?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:53:36.6330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c94c79-0a4a-40af-a150-08de26991b90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4897
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

Now that we have DBANC framework, remove the connector initialisation code
as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
is used. Only TI K3 platforms consume this driver and tidss (their display
controller) has this flag set. So this legacy support can be dropped.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 188 +-----------------
 1 file changed, 10 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d944095da4722..816d5d87b45fe 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -739,12 +739,8 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	spin_lock(&mhdp->start_lock);
 	bridge_attached = mhdp->bridge_attached;
 	spin_unlock(&mhdp->start_lock);
-	if (bridge_attached) {
-		if (mhdp->connector_ptr && mhdp->connector_ptr->dev)
-			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
-		else
-			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
-	}
+	if (bridge_attached)
+		drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
 }
 
 static int cdns_mhdp_load_firmware(struct cdns_mhdp_device *mhdp)
@@ -1444,56 +1440,6 @@ static const struct drm_edid *cdns_mhdp_edid_read(struct cdns_mhdp_device *mhdp,
 	return drm_edid_read_custom(connector, cdns_mhdp_get_edid_block, mhdp);
 }
 
-static int cdns_mhdp_get_modes(struct drm_connector *connector)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(connector);
-	const struct drm_edid *drm_edid;
-	int num_modes;
-
-	if (!mhdp->plugged)
-		return 0;
-
-	drm_edid = cdns_mhdp_edid_read(mhdp, connector);
-
-	drm_edid_connector_update(connector, drm_edid);
-
-	if (!drm_edid) {
-		dev_err(mhdp->dev, "Failed to read EDID\n");
-		return 0;
-	}
-
-	num_modes = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	/*
-	 * HACK: Warn about unsupported display formats until we deal
-	 *       with them correctly.
-	 */
-	if (connector->display_info.color_formats &&
-	    !(connector->display_info.color_formats &
-	      mhdp->display_fmt.color_format))
-		dev_warn(mhdp->dev,
-			 "%s: No supported color_format found (0x%08x)\n",
-			__func__, connector->display_info.color_formats);
-
-	if (connector->display_info.bpc &&
-	    connector->display_info.bpc < mhdp->display_fmt.bpc)
-		dev_warn(mhdp->dev, "%s: Display bpc only %d < %d\n",
-			 __func__, connector->display_info.bpc,
-			 mhdp->display_fmt.bpc);
-
-	return num_modes;
-}
-
-static int cdns_mhdp_connector_detect(struct drm_connector *conn,
-				      struct drm_modeset_acquire_ctx *ctx,
-				      bool force)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-
-	return cdns_mhdp_detect(mhdp);
-}
-
 static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
 {
 	u32 bpp;
@@ -1547,115 +1493,6 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
 	return true;
 }
 
-static
-enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
-					  const struct drm_display_mode *mode)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-
-	mutex_lock(&mhdp->link_mutex);
-
-	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
-				    mhdp->link.rate)) {
-		mutex_unlock(&mhdp->link_mutex);
-		return MODE_CLOCK_HIGH;
-	}
-
-	mutex_unlock(&mhdp->link_mutex);
-	return MODE_OK;
-}
-
-static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
-					    struct drm_atomic_state *state)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-	struct drm_connector_state *old_state, *new_state;
-	struct drm_crtc_state *crtc_state;
-	u64 old_cp, new_cp;
-
-	if (!mhdp->hdcp_supported)
-		return 0;
-
-	old_state = drm_atomic_get_old_connector_state(state, conn);
-	new_state = drm_atomic_get_new_connector_state(state, conn);
-	old_cp = old_state->content_protection;
-	new_cp = new_state->content_protection;
-
-	if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
-	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		goto mode_changed;
-	}
-
-	if (!new_state->crtc) {
-		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
-			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		return 0;
-	}
-
-	if (old_cp == new_cp ||
-	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
-	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED))
-		return 0;
-
-mode_changed:
-	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
-	crtc_state->mode_changed = true;
-
-	return 0;
-}
-
-static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
-	.detect_ctx = cdns_mhdp_connector_detect,
-	.get_modes = cdns_mhdp_get_modes,
-	.mode_valid = cdns_mhdp_mode_valid,
-	.atomic_check = cdns_mhdp_connector_atomic_check,
-};
-
-static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-	.reset = drm_atomic_helper_connector_reset,
-	.destroy = drm_connector_cleanup,
-};
-
-static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
-{
-	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
-	struct drm_connector *conn = &mhdp->connector;
-	struct drm_bridge *bridge = &mhdp->bridge;
-	int ret;
-
-	conn->polled = DRM_CONNECTOR_POLL_HPD;
-
-	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	mhdp->connector_ptr = conn;
-	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
-
-	ret = drm_display_info_set_bus_formats(&conn->display_info,
-					       &bus_format, 1);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(conn, bridge->encoder);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to attach connector to encoder\n");
-		return ret;
-	}
-
-	if (mhdp->hdcp_supported)
-		ret = drm_connector_attach_content_protection_property(conn, true);
-
-	return ret;
-}
-
 static int cdns_mhdp_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -1672,9 +1509,11 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 		return ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		ret = cdns_mhdp_connector_init(mhdp);
-		if (ret)
-			goto aux_unregister;
+		ret = -EINVAL;
+		dev_err(mhdp->dev,
+			"Connector initialisation not supported in bridge_attach %d\n",
+			ret);
+		goto aux_unregister;
 	}
 
 	spin_lock(&mhdp->start_lock);
@@ -2414,17 +2253,10 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	struct cdns_mhdp_device *mhdp = container_of(work,
 						     struct cdns_mhdp_device,
 						     hpd_work);
-	int ret;
 
-	ret = cdns_mhdp_update_link_status(mhdp);
-	if (mhdp->connector_ptr && mhdp->connector_ptr->dev) {
-		if (ret < 0)
-			schedule_work(&mhdp->modeset_retry_work);
-		else
-			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
-	} else {
-		drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
-	}
+	cdns_mhdp_update_link_status(mhdp);
+
+	drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
 }
 
 static int cdns_mhdp_probe(struct platform_device *pdev)
-- 
2.34.1

