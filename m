Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF87C8CC8BE
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE4410EC1A;
	Wed, 22 May 2024 22:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c52Zf0IF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2085.outbound.protection.outlook.com [40.107.96.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEFD10EC1A;
 Wed, 22 May 2024 22:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LevrCwe29hnKmK405ykNUUUkmjDetZ4TF1Vu34JyWyxtSuW+02Luc65xYbyf1igcQGWSJZIf0aFheQwIKyP2RchMpDmmkLIe2iaWI/eqM1jnIwZMn4gS6/mLPw2dp00woPby6y1NT/CFazbntE3KTqNHHV5iORDbUKZv+ljUsc41JMsqLQXwp5CbD51aXTMCAgu7o3msD2N3rSduLVk0CDkyDZjuSln9aWsxucOF6lFArNmZCIqOnqcF3/YzF6v4RxSoUylKsWjE1xgl6tUpYJ5FzRz/d8OeZ0a7gfmZ/swUxEg/g8TBJ9qDdmLiPDWWwLaScAYl6UfIBGDSzzLZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQDATGlcKoK1MbJii9dTWt/cKbD7zWps+qg3FXvEQ8E=;
 b=PRGMdJjMj9rO05XqcxRIbFPYWBfrT5T2vAqojHFPSwlDKYzUkLDhtpRD48X9NDxDJY/EfhPJEptMfRHXAFslyzx4jOexs7OtaatYkr2LHhZtxcY3D9+XuHZCXXo3M744AisXOlY1vp5/tJlhn1sLH86lbZwSos2gCjNNhnKpbHXaPaez0F+U6/kcak+eIpMzqvneqIOChSIkGPALvc6jqCK2yEaj5+qNgA5yEnMDf8DXN9MdHLpqxmOS8GixgeDDxQ61w4hZk8w+zHRAZja45x6kJ7T6qwDWNkDnn3p9pQv/+DPOgefKoHTincq2xD5g8fZZes3RzB3pfP6NTp7fyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQDATGlcKoK1MbJii9dTWt/cKbD7zWps+qg3FXvEQ8E=;
 b=c52Zf0IF21JV8sPp5VHxfnakILG9MGsG36qmHvtntn1ndXDhb+3eNjMf+m6Z5Tg8YayibX3LJbH9HbAGz+PAg7RRhTtazqJJ+BG1jJUJAejf42f25zYJlZ3xTWielXK7E3gxDO37/ul6KALXCwBpfNI1t1JdXxbsyDfY6eYlPAw=
Received: from PH7P220CA0046.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::10)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 22:05:55 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:510:32b:cafe::f5) by PH7P220CA0046.outlook.office365.com
 (2603:10b6:510:32b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 22:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:05:55 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:05:52 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v2 2/2] drm/amd: Add power_saving_policy drm property to eDP
 connectors
Date: Wed, 22 May 2024 17:05:31 -0500
Message-ID: <20240522220531.32728-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522220531.32728-1-mario.limonciello@amd.com>
References: <20240522220531.32728-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dabfb93-d598-4223-0759-08dc7aab5a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SgDpZHqtvhy3R5N19UTopCEPYpvOCRuaLbweYvQxRpHhzLSkLNk0+lO1GGIi?=
 =?us-ascii?Q?OP9reWp5a6gYFOocgKPdK+WK/1sHWU7xlVznccjSLKZpEp8ODV9Y/QgCrThY?=
 =?us-ascii?Q?NQxUQQ9bsR2VlOmkY9OKkhFbiVXo8Y53+z/Bf1ZpxS2Dk8rUo4yojT/7+AdA?=
 =?us-ascii?Q?Dc/e8Rjuh4/7LzJpiiOW2+4/teqgVJKNjHg8/svIY/jN0xiJTitH9CrJGF6h?=
 =?us-ascii?Q?4/htBgAZGz+D83Ojn/NPM9AJ8vbN+ZalmdEVUtOSHVd2OtorJcLTxD+oDeMA?=
 =?us-ascii?Q?dMNTJQAfEzxQE+VPp8XOQphYvBnTYlKL03QxBwPUIpa+ETreuWqsLMF1scEA?=
 =?us-ascii?Q?y3aCmgV1tSQLOUFJjwf7aUPifXDrOHbfIDbmzb6gpQxIciqD+tfc/d2REa0J?=
 =?us-ascii?Q?+R6+3ZhfOZR7F3KBu7spwr+rjbQLEAWghivfuUBAkzBlAOYme4hViWkQwJUv?=
 =?us-ascii?Q?qi42yxKmIemyTAB71niB13cWJTZZLZyFIrztSU4gmidnkHaVRkL4hWHIeWm9?=
 =?us-ascii?Q?a2hHd8I0zSGuV+oxr2eudzhetioGKukIA4e8Y6Aryu9ZtvJdRlQPvDVkiWST?=
 =?us-ascii?Q?oANH+LP8bWUXmObJCYmT+RKEr0F0hGDp3kWbHO/3NKAvpEdB+Cb/EfK57RYz?=
 =?us-ascii?Q?JAUUDdaZGWYMZUmsNk6t5h30eWpCFPSwJuz+x56BY4MMlxB2nUv4RYduenip?=
 =?us-ascii?Q?UDof/gG0AFmymEMzBLBTM9yWdex7AJ4f8AkqboZMpdLYOBaEkMnDn8j2JfhX?=
 =?us-ascii?Q?Fg5/SY7CO7lVvmJ7DuVFpIWUtQUisjGtCoQ52r+hj34XEZV3x/a+LQREXV0K?=
 =?us-ascii?Q?V+emN5nrLREgoXGoehOkeL5W7chqG2VvmNXNmEzQAF0EAdCiikAo/Zl8pTv3?=
 =?us-ascii?Q?m/wJayg2MFaixBR1/zLiYY/n0mMhzG5Aail2g2zjE8OEML6aIo5kN5WgA28e?=
 =?us-ascii?Q?YzlZ1nxtZELmcZAs5VO/reMR/mpowiMv63c/amYxA+BGzwvv3dsoEt/ACqad?=
 =?us-ascii?Q?Dav1u4atkxH9XCsK1iDtM8NjWxy/Uau2tOSHNl5BUFWxeAztmiWYNZsmHEuS?=
 =?us-ascii?Q?ADKmQxs/5SP7xi76xrTyLNF5CizBVYNvB9RC3lSpnFcCAcnWhnJZSy97JX3I?=
 =?us-ascii?Q?e63DIRe3s5epmq+c1D7dHZonWZlF5LcZzHUIC/xCyvEVt/vamNJYPehTi9EU?=
 =?us-ascii?Q?FJS0JhNkQNTHBNAvGbRZW+/Ev56raJxo70kjMHtocdZpmU1Mjkpz1ZVgh/cQ?=
 =?us-ascii?Q?0JNUEZhahrKCPU5xii5Ekf82EwMNycuHvvFYezcYq1sQufp8GpvLqYO/priY?=
 =?us-ascii?Q?QVA6HWhI0VbaVIZ7YjRPMjcTgtMfeOSxM5eWaWhYaoIaZ5cog0zRpVelxZCA?=
 =?us-ascii?Q?uyc9BHM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:05:55.0216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dabfb93-d598-4223-0759-08dc7aab5a3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
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

When the `power_saving_policy` property is set to bit mask
"Require color accuracy" ABM should be disabled immediately and
any requests by sysfs to update will return an -EBUSY error.

When the `power_saving_policy` property is set to bit mask
"Require low latency" PSR should be disabled.

When the property is restored to an empty bit mask the previous
value of ABM and pSR will be restored.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 51 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 3 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 3ecc7ef95172..cfb5220cf182 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1350,6 +1350,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
+	if (adev->dc_enabled)
+		drm_mode_create_power_saving_policy_property(adev_to_drm(adev),
+							     DRM_MODE_POWER_SAVING_POLICY_ALL);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 01b0a331e4a6..a480e86892de 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6421,6 +6421,13 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
+	} else if (property == dev->mode_config.power_saving_policy) {
+		dm_new_state->abm_forbidden = val & DRM_MODE_REQUIRE_COLOR_ACCURACY;
+		dm_new_state->abm_level = (dm_new_state->abm_forbidden || !amdgpu_dm_abm_level) ?
+						ABM_LEVEL_IMMEDIATE_DISABLE :
+						amdgpu_dm_abm_level;
+		dm_new_state->psr_forbidden = val & DRM_MODE_REQUIRE_LOW_LATENCY;
+		ret = 0;
 	}
 
 	return ret;
@@ -6463,6 +6470,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		*val = dm_state->underscan_enable;
 		ret = 0;
+	} else if (property == dev->mode_config.power_saving_policy) {
+		*val = 0;
+		if (dm_state->psr_forbidden)
+			*val |= DRM_MODE_REQUIRE_LOW_LATENCY;
+		if (dm_state->abm_forbidden)
+			*val |= DRM_MODE_REQUIRE_COLOR_ACCURACY;
+		ret = 0;
 	}
 
 	return ret;
@@ -6489,9 +6503,12 @@ static ssize_t panel_power_savings_show(struct device *device,
 	u8 val;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	val = to_dm_connector_state(connector->state)->abm_level ==
-		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
-		to_dm_connector_state(connector->state)->abm_level;
+	if (to_dm_connector_state(connector->state)->abm_forbidden)
+		val = 0;
+	else
+		val = to_dm_connector_state(connector->state)->abm_level ==
+			ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
+			to_dm_connector_state(connector->state)->abm_level;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 
 	return sysfs_emit(buf, "%u\n", val);
@@ -6515,10 +6532,16 @@ static ssize_t panel_power_savings_store(struct device *device,
 		return -EINVAL;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	to_dm_connector_state(connector->state)->abm_level = val ?:
-		ABM_LEVEL_IMMEDIATE_DISABLE;
+	if (to_dm_connector_state(connector->state)->abm_forbidden)
+		ret = -EBUSY;
+	else
+		to_dm_connector_state(connector->state)->abm_level = val ?:
+			ABM_LEVEL_IMMEDIATE_DISABLE;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 
+	if (ret)
+		return ret;
+
 	drm_kms_helper_hotplug_event(dev);
 
 	return count;
@@ -7689,6 +7712,13 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
 
+	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    (dc_is_dmcu_initialized(adev->dm.dc) ||
+	     adev->dm.dc->ctx->dmub_srv)) {
+		drm_object_attach_property(&aconnector->base.base,
+				dm->ddev->mode_config.power_saving_policy, 0);
+	}
+
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		/* Content Type is currently only implemented for HDMI. */
 		drm_connector_attach_content_type_property(&aconnector->base);
@@ -9344,6 +9374,11 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			stream_update.hdr_static_metadata = &hdr_packet;
 		}
 
+		if (dm_old_con_state->psr_forbidden && !dm_new_con_state->psr_forbidden)
+			amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
+		else if (!dm_old_con_state->psr_forbidden && dm_new_con_state->psr_forbidden)
+			amdgpu_dm_psr_enable(dm_new_crtc_state->stream);
+
 		status = dc_stream_get_status(dm_new_crtc_state->stream);
 
 		if (WARN_ON(!status))
@@ -10019,6 +10054,12 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 		update_stream_scaling_settings(
 			&new_crtc_state->mode, dm_new_conn_state, dm_new_crtc_state->stream);
 
+
+	if (dm_old_conn_state->psr_forbidden && !dm_new_conn_state->psr_forbidden)
+		amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
+	else if (!dm_old_conn_state->psr_forbidden && dm_new_conn_state->psr_forbidden)
+		amdgpu_dm_psr_enable(dm_new_crtc_state->stream);
+
 	/* ABM settings */
 	dm_new_crtc_state->abm_level = dm_new_conn_state->abm_level;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 09519b7abf67..b246e82f5b0d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -873,6 +873,8 @@ struct dm_connector_state {
 	bool underscan_enable;
 	bool freesync_capable;
 	bool update_hdcp;
+	bool abm_forbidden;
+	bool psr_forbidden;
 	uint8_t abm_level;
 	int vcpi_slots;
 	uint64_t pbn;
-- 
2.43.0

