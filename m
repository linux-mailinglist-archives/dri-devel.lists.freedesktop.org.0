Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F198FDC7E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED39B10E832;
	Thu,  6 Jun 2024 02:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QO+2HBQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB3010E832;
 Thu,  6 Jun 2024 02:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRZjtODQL5C/PIs4cawDTU32PwY+QIXYgnWA3p1j7tDCC1q/qoJ39I0MLCimqnBLrWqmL0Hp7BY/8KwoF1D7DGVYkHcFiFme1zK99IKnGsKi1KDzmSDvPq4HJPx8GT8jjW1xBs6bjxgjamsdII58rICfHAjAc1r1ZuIeOWEMEz+FxdGuSqsbmL6b21a0Eg9Yd/C4DqI/5ySTPV35HczeOTlW/MajOXUJvBC6IsqjqH0iraqkhYaKxetOPGvE6IdJk+KULg+NtxDkclAaRhRr3PcgCDSjS59yvucdAxlZxH9A1tXAhTziYIyKFdvtNDw/0DyBmfEy9pk7xmyTpi9R3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFfrD3VZ/pK39SFn8HivHTbLysNB2wiHluJDbemggo4=;
 b=RUWk0HUd79lzFkvV0lf82oMvOv3tHMfL/6FoRyYXZtGwcUvdVMzsyIvj4canF7ioHBzpPGk5ZqD1LQh55rNgWT67Jh7VCUBJ0rELusJ3WPiW3NPDPcC4ZP46HUzz8fpfNUPzlqdntKplj0KfwzCyM+N8ZtwynK18YQqGj+AtSW8NQxi8wycnghNgK4EsWt6LrhW1es2BbPDnPSPpCfkL/V3HJ4ymSx2vmvRphj8rojb3XLSTNn5omU3JY6TC/wcVhhqds9fcpspBZccFvPvS5qj3GXarBmIXwikCJv8oUlR8rA3Mq16wFWtx5P+c9h/bxqhIcpIA/xy0WIWym1t4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFfrD3VZ/pK39SFn8HivHTbLysNB2wiHluJDbemggo4=;
 b=QO+2HBQx4YaMIN9ykeE86AnNCASXQpEfyqfL5QwV1nvKXcwpIX3i896LtiVu+DUoIspeu92MxNCkNoDsY/gjv1fBe0BlTMhjaOR1OJu9e6ClLTKIzN2nd5mYjlXftBzZ3kwDGQdIjFtCIadw6ndrR53txXLyG0+QCQ3HXk8FN0k=
Received: from CH0P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::21)
 by SA3PR12MB9105.namprd12.prod.outlook.com (2603:10b6:806:382::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 02:04:31 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::70) by CH0P221CA0020.outlook.office365.com
 (2603:10b6:610:11c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 02:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 6 Jun 2024 02:04:31 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 21:04:29 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to eDP
 connectors
Date: Wed, 5 Jun 2024 21:04:04 -0500
Message-ID: <20240606020404.210989-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606020404.210989-1-mario.limonciello@amd.com>
References: <20240606020404.210989-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SA3PR12MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cdc1cd-2333-4353-5205-08dc85cd0158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y+TkpjFRUaFJgnyTVvAcCivXJtlfN8bWEakklygTRhWx6jgnxmkfFC0Wxgt+?=
 =?us-ascii?Q?FUMJi02mGFqokNbPqIF5TTkABGCbYXCfjWvI27VNONzqoEJCvYXKfqPFJSmY?=
 =?us-ascii?Q?WG6lxki90zZu5RsjsOu0ueQXlhkqEpjda1ADay3Jt7cRLdATC4BdKhe1to7N?=
 =?us-ascii?Q?TUHbPQGomuvlRp+IN7dQNj9gK9rMrR5kmsG9BJf1sfUopFDoqJatnGzsohUi?=
 =?us-ascii?Q?+YZOuST4L18vBZYC/W5IPT8BAC5iXZclg2Nw7uEFAQcp/+UuoQDOjQvKNSe8?=
 =?us-ascii?Q?mRINQiApdZkA5m+IH5Xa8dfmxSWIAuU9lv9xOgIuQUPfcTYb9f4SnfOgkDyg?=
 =?us-ascii?Q?0XrA24psyIdKPq8ZhbYcfLRT4IoEnBKWaqF4mieBPPqGoUDJ+LQKfMVjVR7K?=
 =?us-ascii?Q?7pu0e3QkbqEa1RYDhy1MMP5RHPsvKqSHoy2Bkgveb0Dj//fLV1PvSiLzNlHX?=
 =?us-ascii?Q?F6QfywuT+dN2HqDL/Zi7S3leGtU47d6V+A8pRrLGZUsuCw8LkLkG5lVkk+r2?=
 =?us-ascii?Q?fDv+neSZ5j9RTe4/tafgessmztqrgyZGlBi0FVNvUz8CDZntWyJKUOYYjwYr?=
 =?us-ascii?Q?avhwCT9/P6adZqpq3K2zGutMrM+x/rMxIz9YPMiKVZZK/OIup474Urh/OMkn?=
 =?us-ascii?Q?NdfaHqysuqLX7zcBq5qGktsox+077bXD16+TJOAPazzBsg1IfWDQYRIYTyUC?=
 =?us-ascii?Q?pW6LMR+eSTvSGmt3WvUKgfwLv8GZ7XsiyxZ2KmdzGmwbln9ny3sHZ+0zzSeO?=
 =?us-ascii?Q?wSusizGBPtrmNoWEW8NJFplGJh9BDdTBP3FQKXM/qlWlP4ScoqZMtJxTlpV0?=
 =?us-ascii?Q?3RMPBg87tbmg3V6wlUXG76zTF6rF1yb1Ws/yFwFj1VPxKkUY8i/XxdAQHw+7?=
 =?us-ascii?Q?/qgc+JUkgKVRcYplh0egy2npZcR1c0FSxdjQRLBgidCtsXfQA2oWAKhk8vWX?=
 =?us-ascii?Q?cCCmN1KSYuN0PLCWCe5SW+4ijuSaRcsTbrIecIecspzoENk6OqyzJ9/tjr76?=
 =?us-ascii?Q?7mC6CvQSrq0aOVEgizRZF3qCKhpK0/sI5EQutkzH17oZC7oF05SfgPIYCmI5?=
 =?us-ascii?Q?xYBtZ1Pi4RXg3iYdz1VDvyBvfDe5vvY/Rf8x7+kozvDhfGzBC1ge1CU1A9xi?=
 =?us-ascii?Q?Q81bmE4zea6c7lNaeJMQb9jmdudzGS6e/4rGd5J67hi3FkOJ7UBIol3mdaKO?=
 =?us-ascii?Q?necGVPPIg+TAQ1Ty3kqL35z0VjNpDoroOmuXZm9B8XePniPp/wvRHlXOCLkr?=
 =?us-ascii?Q?Xs+O6Xrx0JJUSyvPC497u8f2vs2F8R6DDK0zNUxzKWGsxAKVoqjIIUcLabZu?=
 =?us-ascii?Q?IA8KpltLDhcgBM/RGNReMYuYcXw+Mgz2SC3pFsc5F2IsQ6WfMePCNByABfuh?=
 =?us-ascii?Q?nCbfb0s/BcclYuf+NIZCIeqeuWwM4zD+IbKfCSHN6Dc4w0qI0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 02:04:31.6185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cdc1cd-2333-4353-5205-08dc85cd0158
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9105
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
v2->v3:
 * Use `disallow_edp_enter_psr` instead
 * Drop case in dm_update_crtc_state()
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 3 files changed, 51 insertions(+), 5 deletions(-)

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
index f1d67c6f4b98..5fd7210b2479 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6436,6 +6436,13 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
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
@@ -6478,6 +6485,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
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
@@ -6504,9 +6518,12 @@ static ssize_t panel_power_savings_show(struct device *device,
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
@@ -6530,10 +6547,16 @@ static ssize_t panel_power_savings_store(struct device *device,
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
@@ -7704,6 +7727,13 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
@@ -9307,6 +9337,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
 		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
 		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
+		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
 		struct dc_surface_update *dummy_updates;
 		struct dc_stream_update stream_update;
@@ -9360,6 +9391,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			stream_update.hdr_static_metadata = &hdr_packet;
 		}
 
+		aconnector->disallow_edp_enter_psr = dm_new_con_state->psr_forbidden;
+
+		/* immediately disable PSR if disallowed */
+		if (aconnector->disallow_edp_enter_psr) {
+			mutex_lock(&dm->dc_lock);
+			amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
+			mutex_unlock(&dm->dc_lock);
+		}
+
 		status = dc_stream_get_status(dm_new_crtc_state->stream);
 
 		if (WARN_ON(!status))
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

