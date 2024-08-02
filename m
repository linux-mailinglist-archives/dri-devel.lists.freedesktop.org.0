Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685D945FC7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7277010E15F;
	Fri,  2 Aug 2024 15:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bPl7cw7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751F310E15D;
 Fri,  2 Aug 2024 15:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja/4XfXjLKZGegNM4Bz3HoyB3IuUzyy/NfAFEQvDTyEpL6xE2Fo5G4XAk5yKxUdbjaR2cbq1QfZAxmu+8e4rd5RREuz8bsisEi+xjRqf4Tdea1XEhFGm5gwyz2IXdlpuCyRd7F86bOEChhoPQz+huWa9zZAVkqRM97kR19SHnjfVLVwZCO7or2EqPjFHfDmPc4VC/uv7ife+/0YPhL29IUc4Rt0lcHEJGPbZUn9w6RElTaSAexfsjUFQi2cKvrpUxQCa+jJujsenNidz4eKYby6yuFAVnprXHv6GJqIsF0/dD48M+b/4VQcKU58AlQCPJHJBW0NlUmtExbKaSbmaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN5Zt+l1ix4VivzdWxiS2fc0nLk6aKSSVlqjrsC+uBU=;
 b=mn678nEz11UxiidRGWxsCKfVGmtx4t97vfjkIsl0h2QS5KuDSypPahwg7B02RUZa1fEmT+BJ4GpZbwe6sPLq4za2jHus65s0W2f3GSF0Y1rVVWdhpeWMKPp7l5NBCcRxeR+DsDr9D1IGrjHqMgqMOAgEtIRKXxAgxdJDFKH1kF8Z9iBA8ysE75jG/fwCDu8Fyt+FO/u6+LIU+TvY/kff6grlyEXh7cEWyWg5cTZHorpafiWPPg/VCviXF3/lBRzmyWe+RNsjEOTjRM7PvZnUyT8AX1fStoJGwpEsZ6G6UWmM1UoAf0t10dwn6491dLSw6mCrrL+D6mQMTpZc1EDxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN5Zt+l1ix4VivzdWxiS2fc0nLk6aKSSVlqjrsC+uBU=;
 b=bPl7cw7xixnr3xS8QgoDcRSkCwLrmt5L32sehqxMYacxrbcw3607p0LEIY2E+k6P/9bH43Uj8nSQmhIpdbUCHcen3NroxwJk9ukvWWusFbi/KVzORmXu5jvKSy0ysTao2tfr2wYrQ1sbg7FTO0zm8iZ0BxcslBKENepiaxdQl10=
Received: from CH0PR03CA0431.namprd03.prod.outlook.com (2603:10b6:610:10e::22)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Fri, 2 Aug
 2024 15:00:10 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::38) by CH0PR03CA0431.outlook.office365.com
 (2603:10b6:610:10e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 15:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 15:00:09 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 10:00:07 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, Xaver Hugl <xaver.hugl@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mario Limonciello <mario.limonciello@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, <amd-gfx@lists.freedesktop.org>, Simon Ser
 <contact@emersion.fr>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH 2/2] Revert "drm/amd: Add power_saving_policy drm property to
 eDP connectors"
Date: Fri, 2 Aug 2024 10:59:46 -0400
Message-ID: <20240802145946.48073-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802145946.48073-1-hamza.mahfooz@amd.com>
References: <20240802145946.48073-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: b500a0da-1481-47fd-7fe4-08dcb303cdce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vu6iIXEQlP3Xnr3hSn6OPkx82wm1udmnlovz+aTdUVzRKn1hCekXR1aO7/2E?=
 =?us-ascii?Q?38A8mxrjDRnnzXsG5SGGN9fnf6L9CZvhRlF3Y5vd0g6DQfWBKR3XpYrudHSd?=
 =?us-ascii?Q?8lPwMa3ZxwOb3Po29iiJOePxxMgyU1ybNeWdbZIyY9xu4xLvc5wSZL5cdI6p?=
 =?us-ascii?Q?K0eCLoqT/+bS04+3tYo/sc+AnfUCFKcNejpC6qUQ3CGSoMW7lwH/pVa2GvLl?=
 =?us-ascii?Q?+lK3i9LSRT6PS6tTTwixroewEjMQDTYMqmBeHhlOMonWSdrAZXP381XMNfvt?=
 =?us-ascii?Q?d7oZhFne6H8fqMLYqLg/8Xgqy9MFt5GQwQ7g9SLw0zHG0fkWZaRsN4nT0RtA?=
 =?us-ascii?Q?LytwUJF9g5M+ZG1FUr+XEqUuSUXluNeb/4W3t6x99JpfTkgSd9ii+j1DQd26?=
 =?us-ascii?Q?rqMQCyUN9MVl6IvMixmGYkDrIh4uq6dGjwpMnOAjDpKcRAPxqcrVgl7oKkEh?=
 =?us-ascii?Q?tt4TUaEImvyV9oOnt0IfMUy7Cj4AF/QaNit4CKWpyioYjvcj2nh845bYqzcn?=
 =?us-ascii?Q?CBZiz8wYOpiNHiA3pvPPw9crEcIHsu9P7HzKPHo2dSteKSrgSXNO4oEYk1KV?=
 =?us-ascii?Q?JqQJuq0FeXNnujA+UFi+SEtwke9wFBx2nBRlpl8qMsFEDvaZx2/5dUIsq0yE?=
 =?us-ascii?Q?P7vcJq1YDboJvqk61dGBpiYxfNnEKltdjSRyj5ogn1XdaLbFfG15Xc0p+lUP?=
 =?us-ascii?Q?70EK9IXl01sgP6nCg9+VE+IQGsv0Ulct/zkdHb7YyqJUInfqPc/AsI5tCGld?=
 =?us-ascii?Q?hk+JmPj6BuwrZyATCPGSXxEjfsHnRqK5O7SYdzccRPNEKxEHd/EGi2vF+W5s?=
 =?us-ascii?Q?gh3fg9ols2pluywQinTf0SjETBU2FJp5qzeolOwUPBETh7SCghQMJ0Ba7fVE?=
 =?us-ascii?Q?+egS2sGG9k0O9EH/DfIS1SXR2fdblYKtl8hATR8iZmrQltwCBitu9Xf1Xlkz?=
 =?us-ascii?Q?Y8WM6Ym0CaFnoUst3iIYvDpX0kr9d4XB1ddW5f4FdzpXL/ery6C4np4q1lL9?=
 =?us-ascii?Q?mt59U9VVbO9acYPV7w2RSZJS6pvllgsI1Z6aoZ0q1H5POCBZKqE6FJHmHHyM?=
 =?us-ascii?Q?Yeusi0t7SFcnSXZtL4xn7XmAJLAoAhndLbLO861ns1GVezhOFadLXpPJXgIb?=
 =?us-ascii?Q?m+PlTLSEEdWOTo951OHmsBeMZ3wQYDz5NzjNas3VSFsWnMn4DEGCuD/7HIW4?=
 =?us-ascii?Q?MUodP011WK4LZ0MRBJRQKPRhPfa7rfeBUNGuYSj/NHeoKYD/p3TPYE8Sy845?=
 =?us-ascii?Q?2lm8TQIT+z3ca9PLaUofmQK6iHxy0rz8Jpbtn+4JWccLRpmK9fdWBWUckQi/?=
 =?us-ascii?Q?khXT1tQrOGQ5Gt+ViNXcZdOamrGCCCK776oCLSwDU0SUpyoACXACxMqelSyH?=
 =?us-ascii?Q?aieX2Bekagv06imHC255lQrFGfnNLoJq7KRdE5Z/6QM2zbNeBU8yVdkmWQMC?=
 =?us-ascii?Q?SncNYJsc46vJm/KsogK0IHjdIHrmbWBV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:00:09.7810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b500a0da-1481-47fd-7fe4-08dcb303cdce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666
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

This reverts commit 9d8c094ddab05db88d183ba82e23be807848cad8.

It was merged without meeting userspace requirements.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 --
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 52 ++-----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 -
 3 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 879b4a04c588..092ec11258cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1407,10 +1407,6 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
-	if (adev->dc_enabled)
-		drm_mode_create_power_saving_policy_property(adev_to_drm(adev),
-							     DRM_MODE_POWER_SAVING_POLICY_ALL);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0ce983ab5d65..7e7929f24ae4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6725,14 +6725,6 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
-	} else if (property == dev->mode_config.power_saving_policy) {
-		dm_new_state->abm_forbidden = val & DRM_MODE_REQUIRE_COLOR_ACCURACY;
-		dm_new_state->abm_level = (dm_new_state->abm_forbidden ||
-					   !dm_old_state->abm_level) ?
-						ABM_LEVEL_IMMEDIATE_DISABLE :
-						dm_old_state->abm_level;
-		dm_new_state->psr_forbidden = val & DRM_MODE_REQUIRE_LOW_LATENCY;
-		ret = 0;
 	}
 
 	return ret;
@@ -6775,13 +6767,6 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		*val = dm_state->underscan_enable;
 		ret = 0;
-	} else if (property == dev->mode_config.power_saving_policy) {
-		*val = 0;
-		if (dm_state->psr_forbidden)
-			*val |= DRM_MODE_REQUIRE_LOW_LATENCY;
-		if (dm_state->abm_forbidden)
-			*val |= DRM_MODE_REQUIRE_COLOR_ACCURACY;
-		ret = 0;
 	}
 
 	return ret;
@@ -6808,12 +6793,9 @@ static ssize_t panel_power_savings_show(struct device *device,
 	u8 val;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	if (to_dm_connector_state(connector->state)->abm_forbidden)
-		val = 0;
-	else
-		val = to_dm_connector_state(connector->state)->abm_level ==
-			ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
-			to_dm_connector_state(connector->state)->abm_level;
+	val = to_dm_connector_state(connector->state)->abm_level ==
+		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
+		to_dm_connector_state(connector->state)->abm_level;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 
 	return sysfs_emit(buf, "%u\n", val);
@@ -6837,16 +6819,10 @@ static ssize_t panel_power_savings_store(struct device *device,
 		return -EINVAL;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	if (to_dm_connector_state(connector->state)->abm_forbidden)
-		ret = -EBUSY;
-	else
-		to_dm_connector_state(connector->state)->abm_level = val ?:
-			ABM_LEVEL_IMMEDIATE_DISABLE;
+	to_dm_connector_state(connector->state)->abm_level = val ?:
+		ABM_LEVEL_IMMEDIATE_DISABLE;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 
-	if (ret)
-		return ret;
-
 	drm_kms_helper_hotplug_event(dev);
 
 	return count;
@@ -8040,14 +8016,6 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
 
-	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    (dc_is_dmcu_initialized(adev->dm.dc) ||
-	     adev->dm.dc->ctx->dmub_srv)) {
-		drm_object_attach_property(&aconnector->base.base,
-					   dm->ddev->mode_config.power_saving_policy,
-					   0);
-	}
-
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		/* Content Type is currently only implemented for HDMI. */
 		drm_connector_attach_content_type_property(&aconnector->base);
@@ -9748,7 +9716,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
 		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
 		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
-		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
 		struct dc_surface_update *dummy_updates;
 		struct dc_stream_update stream_update;
@@ -9802,15 +9769,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			stream_update.hdr_static_metadata = &hdr_packet;
 		}
 
-		aconnector->disallow_edp_enter_psr = dm_new_con_state->psr_forbidden;
-
-		/* immediately disable PSR if disallowed */
-		if (aconnector->disallow_edp_enter_psr) {
-			mutex_lock(&dm->dc_lock);
-			amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
-			mutex_unlock(&dm->dc_lock);
-		}
-
 		status = dc_stream_get_status(dm_new_crtc_state->stream);
 
 		if (WARN_ON(!status))
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 6ecb17def4aa..2d7755e2b6c3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -915,8 +915,6 @@ struct dm_connector_state {
 	bool underscan_enable;
 	bool freesync_capable;
 	bool update_hdcp;
-	bool abm_forbidden;
-	bool psr_forbidden;
 	uint8_t abm_level;
 	int vcpi_slots;
 	uint64_t pbn;
-- 
2.45.2

