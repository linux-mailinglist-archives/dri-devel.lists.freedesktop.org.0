Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B13C73EB7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4754410E2A8;
	Thu, 20 Nov 2025 12:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="KAZkIZXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013014.outbound.protection.outlook.com
 [40.107.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66B10E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 12:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8ABE2FwjamV0QJF7P+0xzSyQmvmQckt3O31KSU3/eZU3xLCPra1u0syfDS1M/SatT/IaZqMoZ/tn4gVV3H06R4mIR3clgD7b/hR6ssIugPwFHy2STik+Nt4ZTFMwcCOAM9EbaJnekpFPaTUlU7QIZB/t86fEOitieo2mewH1xYcGfgMy2GTEiF+8GOowJdhoBgsyS+ZzVeuGZuc3yP7vvufjt1nBMRuNiuoSJ3swZugRe+4bMKKi30uzt9/srn8ExHKsqOihOHimyFmeF/BMXoRynICcZFKBNswzixF3v1AqFuSLQYsJwIZDL1EMuaWS6nAkM9qQH/WGaR8LTkW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir0OMYdP/MZfn4su09I4GYzEZE7DSHa4fCba9Nq60MQ=;
 b=d+K1WVvdvNKTK6Bif03hdHsv2vj5lwlGOp4suvz8P74aLKQzWRuBjuZfhs9wKi02+Ugh7+GmD90mmwemGTDTD02uMWRCWxfBBhk2Mj1K6aJ6yUBQSTjYV8uldIYDMitcz5Ot9+CBPVp4HlzXcjZmyI7yFLy06Ie8CyHpRcLuoGPS534JdOPIFmynhnoMRv4RPUrLjTSvzs3r1zgY9z5BVUyRgpDX3PZ6AMVTnQZjTE1u4ZVumiXIckjMBjpoNp+lOSN1ygVA5IZz2jdUHHHTQ9Y7ltPKipc7tVoO7575tSjL0/QBym5v82ADQ7aI4xU1TKHPigu5lO469VHcmOagdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir0OMYdP/MZfn4su09I4GYzEZE7DSHa4fCba9Nq60MQ=;
 b=KAZkIZXHSbRrExwC7pXYNSFJ7hJ08xsBKJ8CvJCErGARlNHkoX5pAIp5G7YB6iGZZGM6rbexmt1O0eXpA1Pa2rxT4jtj0R4OeLVtT0BjNvJdG2P2jti0dbAOsNw97t+st/zOemXhDx3/nKLFMZxVd194XE8Xq2eoDkGm0hApCNw=
Received: from BY3PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:254::13)
 by DS4PPF9390CCBA1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:14:53 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::54) by BY3PR05CA0008.outlook.office365.com
 (2603:10b6:a03:254::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 12:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:14:51 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:50 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 06:14:50 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKCEHDx3636470;
 Thu, 20 Nov 2025 06:14:44 -0600
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
Subject: [PATCH RESEND v9 4/6] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
Date: Thu, 20 Nov 2025 17:44:14 +0530
Message-ID: <20251120121416.660781-5-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120121416.660781-1-h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DS4PPF9390CCBA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 7520ccc8-c74e-4efb-e47c-08de282e6882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QDLZ9KFV3BjZl34OMhtynz4GJxv0sWKhoovA3YxaomBPvSsrgJu+rkB2a3Nj?=
 =?us-ascii?Q?rIS7/ohkvWHVDzpBYGZe3lm+n0cBbdORdMKCwF2l4FuVJAYY24a6Q8oB3Jxo?=
 =?us-ascii?Q?kmieHddJOeKQf7DGPQxHmyyrV4pd1OP0pmp0wU6+1BRkhSo73SKqiXD2u4AB?=
 =?us-ascii?Q?B43URfPk6yJTDKd9geHUFYNayxTVSh5ItZlqZyjEy/RDijlR1HG3T8+FTmXx?=
 =?us-ascii?Q?D2MG5jEO+1pwr3E3Tr/NA9f2e+m3zLxE1eJOMPOevI+7ErGZZMhR/i5prUzq?=
 =?us-ascii?Q?BtT6nzGbv6daR43rAJgVTk1N+bqIlbGuaosk7GLF+wfcK0ybyCyO5IDfXNsa?=
 =?us-ascii?Q?4EId+iqLtnEviRx+vBW2BnZXSy86qKcvDwB2YVoTJR1DgzdQGWpDHpuuVKPF?=
 =?us-ascii?Q?cdo1lYxUOn+hulMT3HkMBKB50PBaqRAoU5j705fkkbx1Kndbye9fVeoPt7sR?=
 =?us-ascii?Q?9hL15qo0hpe3fvR6qqFWAe5pIoTIwG4Sswm4fsTXjk8ceYT0aZuxV8BaUZVP?=
 =?us-ascii?Q?UNqMTBKc+VZqdkhkEzwnkEsKgVdMqDDOQaOJufrTBzh/2sf1TC6taaIydkyG?=
 =?us-ascii?Q?w1VCCIOyGhkwPq9uyKSg36Mg/SNsvLq2O7ZGCWojVUUZmZzAzkZOzgxpt3F9?=
 =?us-ascii?Q?PcgkL6sWiCAUneeS4Cz3ImzMsFXlLPfJVbIVYAe6bDrR0mjPBXj/GTqTnh9y?=
 =?us-ascii?Q?nUNbWtHSye2xJJ1HzIkNUlHDV10MdMqJSUHBg9bewFAI82o26dr2hbUUU4yG?=
 =?us-ascii?Q?jPF9u9vFsc3eauWUu7Rmw8fpMVQCpfC22tH4YDorat4TfTmfrlKxcNvTK0h3?=
 =?us-ascii?Q?0CorcJyr2yZPkDPcjdKiM6JSgNh4U8mkIFNGti4swR5mJhkgyJhUb2etRFlm?=
 =?us-ascii?Q?UGL23SLycp1taj8+HRHRzrwu4tcpcYRQItBaIqfpP7ipWcAoiL950EHt20zh?=
 =?us-ascii?Q?ZM5EhS6QyE2CUC33fpM9Wvzb3s7JZAsOGiYEHORob3jZZwDEz5/OzUWeVyJJ?=
 =?us-ascii?Q?CfHh75tz7TV0NFvSUNKBPxqcrGjFXk2/sQA/fVEwBAiakmgMj0XubSLZP3+y?=
 =?us-ascii?Q?WDqqg2UvVduIFZwAMOlmBEHGsOc2IFCn+R4x5yRTKGsxw53+EPnsxeWYGNSd?=
 =?us-ascii?Q?da/s1Fb4UXJfpn8CH5FH3LMcEN0Y6cbv1LESsO9eUyeiUu2tqdNGS0PRY8TA?=
 =?us-ascii?Q?2s+Pp/lVmn19dwoh5cuZHuJSJNdzykbx7IvaGX7hMUPjxNX5qPmcEKVkgASJ?=
 =?us-ascii?Q?HQb4Bjq34R2FmFWdqTVC4GgYCA1efF3HuokBzg0GNykt6mc9XIyit1dxoraN?=
 =?us-ascii?Q?Qc9ny26O/CEzW2OQMkCCc4iIV7aOqEz6bo3D3tQhjkxkhWtw/OTqYRdwEW7Q?=
 =?us-ascii?Q?an5FvUCCU1azdkO5Bmdt4B4Uf2XLpi0GrjACteVTE3BYHctBL2IOmZf7kVcA?=
 =?us-ascii?Q?8yrJsnSr4Rq/mGOVYC36BOE11RDAvNp5Smi3KHtPR+uAwLhS+plyoiPsb207?=
 =?us-ascii?Q?5PZrBq/SQNmn049nqrxezBOzISWXlieBcZoMpVkCU1QA6bDuuMApHHSZM1K8?=
 =?us-ascii?Q?7YuhmWuyHaRwRxyPT2oDEU9uqd7Lrt5v5yKkSF7F?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:14:51.9524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7520ccc8-c74e-4efb-e47c-08de282e6882
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9390CCBA1
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

Now that we have DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, remove the
connector initialisation code as that piece of code is not called
if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is used.
Only TI K3 platforms consume this driver and tidss (their display
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

