Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877ECAFDB6
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA2E10E4C7;
	Tue,  9 Dec 2025 12:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vUcQdN8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBD110E4C7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5PX1IX/7qBguTerKybwCxlAgKcvLms5G9wbkciNODW1BFzC9PDAJcQCBRcCc7f6MHvPFbVoq10N1IDGjZCEsfPlf0OXUOvuomQdQ1m8fp9djtI0zZu5AbkPYoD8WYMe+BVhGc2DnTnzrokk55wrEpIRTKJ4VbuXbmB53+vYtZ+ZNf7r46V6jW9a/uxozwLo8jGdKr9bfw2Eb5jZWD3+tmPjLGQjQ12gY7Ft6GdjGa2G06BY3AyQBGu0fAfKlN57tY/hmVgaIqH6wj1ONp8jKMOyOY0VCCQqyZopdKkAHfRnc63qJHruTp+pWXwHXxvbZV99rUZI0HS3dyyQOkzOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm8vKZsNBVHxW/Am3DPqn2hHMUtMcZo53egKcKTpYfs=;
 b=wJu7qFmWdxGNqB67tuSVq5GTz5TKQsW97jKkEzq80qu6b6NuckVpoOsmMne3IuLVu4sBGVOMDm030T3Yw9YJJNi9RnLWhWAlX/Gnyy3EwGlbePwu+c0oa0NoMPhZF9731xhe78GMzZSqm9hcxIki0Uwc9HloRuhM+yAO8PyZBe96/vNz5GF0W8HMKnzwkR0p4wqlzwKJthm2V3yHCEvyNUmTzGFqPXjU1wzTSVke3ItzIK5aOIwQqIYcykvzv/v4N3+dUmQXmcaNqQ7PtuzTl8VOacEu6f0lgnwfE7mTvy35C+PyIhoyX06GmEUsiqHxZGUgRpYOCrRDlBkRuAx4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm8vKZsNBVHxW/Am3DPqn2hHMUtMcZo53egKcKTpYfs=;
 b=vUcQdN8rk974t7hklhZjkwp60iSf+xENr39wMxuDTi+6bXN9sGHfxijj1DHDPmzj0rMreDPC/Aclao+GJ8CmGed1DAR2NAms77d9lN4ARp61OOOSejP5g+E8b+ppGoXcaB0C9kNlOja7/rHCWf5LPwcmm8sQ3ihBeLIUJ6B7Gqc=
Received: from PH7P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::11)
 by MN6PR10MB8022.namprd10.prod.outlook.com (2603:10b6:208:4f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:04:12 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::d7) by PH7P220CA0024.outlook.office365.com
 (2603:10b6:510:326::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 12:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Tue, 9 Dec 2025 12:04:10 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:04:06 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:04:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 06:04:05 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9C3XBP1165975;
 Tue, 9 Dec 2025 06:03:59 -0600
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
Subject: [PATCH v10 4/6] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
Date: Tue, 9 Dec 2025 17:33:30 +0530
Message-ID: <20251209120332.3559893-5-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209120332.3559893-1-h-shenoy@ti.com>
References: <20251209120332.3559893-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|MN6PR10MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: adb3ff0e-9387-403b-2902-08de371b1036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OGWx6z+73V/wkVUUwe/+PlWS64rf3JFvidRHmzqjHUBR8nkkNzgGonoI6Nsb?=
 =?us-ascii?Q?3ZqndEu+sjBpCnRO4EQOOjdkkG8Ba/UZmgTc3BBJjWnNANCRPc6g7Sw53LsI?=
 =?us-ascii?Q?Awev8dh+/emft2aQ1dZd8P8QoBxQegxHpGORbQUAQMPLlE9pX79ivJAFbLNn?=
 =?us-ascii?Q?fCDBxUpNkmNDBgbnvauYV3YsblSFiFf/25RfAIb3Xco5ZHZBCRJC4UZJhsSq?=
 =?us-ascii?Q?h7u3Aee3DijE4Fz7y2kGQUEtMyMNtjs8NRe4QgeShj5UFia6l1crhewCvseq?=
 =?us-ascii?Q?dvJp270+dHWu77Oj8k4IGHPMbW+G5VoSzxMDdeVFnX2JTK/z2EC4q6yMUzmu?=
 =?us-ascii?Q?Vz6FY50qAAhW/kUIE9KkMJL4+uFh6NaZc8ePX7nfhM+IyULNMtVPnGM9OO9e?=
 =?us-ascii?Q?d8c0W+bwP/YnUzcB9rToXR1hRm1dkWxwKE8ypWpGWEbhwl34+vIqu+WOaKCW?=
 =?us-ascii?Q?qBxoBPicfjgENcAUDMwB683HPYMqaUShkxe5rAiGuz+tv8+BVofn81DZgeuG?=
 =?us-ascii?Q?2X7qEE4AGBugdYNjreq5pfjQ337pW0GySECNZxd5GxMbw1CqHcSDCclPVkDe?=
 =?us-ascii?Q?VsENy/bUygRa9AfcKBxXRO6bcoPBlHxMMfTh0BtWbL3yyyf3gPJUoavyWm2J?=
 =?us-ascii?Q?jvSMzYUkEbAtrSTroMVe6Z0kYLOBugV68pQx9EhsiXSToOrGYKDUeJyjAWIh?=
 =?us-ascii?Q?S7UUEI10Olw4PwoTw3Gquz4WEoYuVutOj6R9f45wdJdZ/ssxuPfTx+plxeOy?=
 =?us-ascii?Q?VOk8HoP8cY6XmtqPpDH2qu22TFm510Zho12+0DY8hdj3j3bydfhEMd5JtSoH?=
 =?us-ascii?Q?1IYBHQMCfCH0f8bG1zYXSAeDkgZ5XgORQOpZA+mIcNSI2ejuPX+4/NU2Eg9n?=
 =?us-ascii?Q?jafMWjsUbp7NlpUrq7loDRzJXMTZi45A75r4tdZfmRAED78gtD6gBqva213t?=
 =?us-ascii?Q?ArprzOjkfDeG/raKKtBJpAyI0P4KBvraRw9I+rxOxaRqFHGKuqUODZsiuXEH?=
 =?us-ascii?Q?9MS6jYMrReFV4Q/Hvie1Yui48ZIswX0oNn7h2SkLpGumAwASf3MH2z7nPAfe?=
 =?us-ascii?Q?4eMcQXfMJul07kPE6YhrbeVh+ev/3cbJSAN4LxIfnSEQ+ZL7XV10dlGfH3g/?=
 =?us-ascii?Q?8P6IaP2pepD+eYBm3aSPwvmpf0WiK4pX0Uued9WB6cCMo/N2Pc28GJ/bUvy0?=
 =?us-ascii?Q?B7qWnZuW8Ukyq04FLgxqUhb/NENyuiQPael+KMk4+MltjAwF5cwfLDWt/5KI?=
 =?us-ascii?Q?1YaQ7HKtTE6dghhyzMhnsDTDHZ/pT+1JdwwUvqjoeb5HZIwJebYhMixt+rJq?=
 =?us-ascii?Q?sGDI/xlYIuNlC3R5hmjmSHGIGUDBGWUo6TxDZstQNumiNaZVEb7/gvpaGVl3?=
 =?us-ascii?Q?Dz6IqbnNC7CifO6tGxyPnVEx2i519s8yUJAh8Zat/wz0eZx/a4aVR8/4er4S?=
 =?us-ascii?Q?HsHXlumJoSeNtnFLczDwo1hYFPqBwX7FHvh0vmklQ7sCTWIAjQjGCe64X8yt?=
 =?us-ascii?Q?LD2TcRNfwlNO9bOjbkztIRvicXpTFnd3Jlf5Tr3EPc5YL78BSGlrMhYprsHS?=
 =?us-ascii?Q?aZ2sPmG8TqZQYUxQFpJqgLDgpWejeECrXnto0ysi?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:04:10.7498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adb3ff0e-9387-403b-2902-08de371b1036
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8022
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

Now that this bridge supports DRM_BRIDGE_ATTACH_NO_CONNECTOR,
and only TI K3 platforms consume this driver and
tidss (their display controller) has DRM_BRIDGE_ATTACH_NO_CONNECTOR
flag set,we can remove the legacy code for the
non-DRM_BRIDGE_ATTACH_NO_CONNECTOR case.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 187 +-----------------
 1 file changed, 9 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 7ee19b7cc92fc..e3066dae340a6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -739,12 +739,8 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	spin_lock(&mhdp->start_lock);
 	bridge_attached = mhdp->bridge_attached;
 	spin_unlock(&mhdp->start_lock);
-	if (bridge_attached) {
-		if (mhdp->connector_ptr)
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
@@ -2414,17 +2253,9 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	struct cdns_mhdp_device *mhdp = container_of(work,
 						     struct cdns_mhdp_device,
 						     hpd_work);
-	int ret;
+	cdns_mhdp_update_link_status(mhdp);
 
-	ret = cdns_mhdp_update_link_status(mhdp);
-	if (mhdp->connector_ptr) {
-		if (ret < 0)
-			schedule_work(&mhdp->modeset_retry_work);
-		else
-			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
-	} else {
-		drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
-	}
+	drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
 }
 
 static int cdns_mhdp_probe(struct platform_device *pdev)
-- 
2.34.1

