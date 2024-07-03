Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE299252E4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 07:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279C210E533;
	Wed,  3 Jul 2024 05:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NvxYdR1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17EF10E1CF;
 Wed,  3 Jul 2024 05:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9Y9QDYR0kfXkoWZwnsyrNrohskJNW3paqW03o4E8+9ItLgNj68/dOxrQj8IfsAh6idEaRT8OBjqyCgZFADakBzFaJxKPpk8YV4c4z0QNODR96Yu13lrV1xAr6Jr/ffWSI59sXeJTmc/ISQ9vR0Lc48y13Gh7H+6YKXOJ/AxflygrggGOkA7tLRUrmNo5sryRFwxE8RL5baMYvVDZStggNpD5O/LySivSO9cLjtYNz0xASxKjw6bFO+OOozktQcduYC43iys3XB87OwxLDT5Wcm8LUCJwz/ojK1fm8dnnCMoBk71AA680my5egDjHEQ7/I2No9DLvpdKJb3gOIJ1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9ugXrD3w28yxC3G0feNQIUXI7CvuAjSb00E+Izb0bg=;
 b=ct1aBbO5kOOf8ig9Xg50a8h9rLjsnvXgVTmgrRQYlIIoPksW1zX1/NYIIchL5JBGN2V2ZAjM7OC/KWSqLSrlgi0BqbckIw5n1T9cRAAIYEP7qO8u1rXJd4pyKI91Jt2kOJXYDisnm0TBNVn1ZaRyCxWckkkDAxRX5i9PJJ3sjb1YH88qUe5/mldUaIJv62Q32JsmjBpdhHHUC3aiOe6VnwEeGdwY4MlE942QZXQo5xtQZVHKVgqchD+WqUAnh8RrsR3TCC2BYgSavelozZ7W0AMqIeQXS4qPBZx3KSdmw3o9nDpxsain9QwRRIXFIHvZipgWcdEfSQ6W+EZdg73OdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9ugXrD3w28yxC3G0feNQIUXI7CvuAjSb00E+Izb0bg=;
 b=NvxYdR1frgJ6eOYYhQuKbn2c+/L9Q/irKgxjM2uqW1HfRbhr5Ttwcp/SGQoEsqKmtP4/BKbMmljOWyFjRhPo/wHBgmXgBEvHpSugYw1tS9GfE1+5hQuBz0gLn0sC5OCQ6rCIWCZay+3olOSDsbRnPIJcnrA4WTW5ExvOTSfjMok=
Received: from MW2PR16CA0042.namprd16.prod.outlook.com (2603:10b6:907:1::19)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 05:17:44 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:907:1:cafe::a8) by MW2PR16CA0042.outlook.office365.com
 (2603:10b6:907:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.37 via Frontend
 Transport; Wed, 3 Jul 2024 05:17:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.1 via Frontend Transport; Wed, 3 Jul 2024 05:17:44 +0000
Received: from AUS-HP-PV-STX4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Jul
 2024 00:17:42 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v4 2/2] drm/amd: Add power_saving_policy drm property to eDP
 connectors
Date: Wed, 3 Jul 2024 00:17:22 -0500
Message-ID: <20240703051722.328-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703051722.328-1-mario.limonciello@amd.com>
References: <20240703051722.328-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: d48a18d4-0f97-4260-e1e5-08dc9b1f785b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tnp57pqDEliNTuQL4hzs/mxm8ZTI857MXfzFuBpO7x5dTHSU+4oRuUTS27dj?=
 =?us-ascii?Q?Uus9y6hyYpzptkiCIddq7f7L+QxBwBs43WMiBxE1Orhf9OxWamOTJzcApdJ4?=
 =?us-ascii?Q?L8vKTte6cFtt5rKogJjx5gXI+azR5eMVb/7YtMs/NV+g2LyW7IcA3Mkt83jY?=
 =?us-ascii?Q?JqlnSrCtlgdlnPDrkFNL799dbntlzR7xvP5ASeG5yI8UFoHS9CBHqwIr6omC?=
 =?us-ascii?Q?M8FsU2O6SlZFsp+srcSFRImUvw13khkpGRP6kcZAp1EBk1hqHb3X0mH6mEXq?=
 =?us-ascii?Q?BygcR5P0C6wsMD/FR/xsf2ShslbIzB9G+T/9w0kqIJNb1aPA2yMedB6Yw1tv?=
 =?us-ascii?Q?8etNt5NVdubH4tqnsFFXvrqqEc/Ouc39jdLFcJ7E+rLp3e40o34/2MxtMdAm?=
 =?us-ascii?Q?7ib1T8PbtiwMl6x4xc7hEJ0C0MoozKPjjr9mvJ0cWgBzB80jNFryXEJynYac?=
 =?us-ascii?Q?Ecq8gxpAQVwBHjarUkG8TeHrhvroACZHGKbUE8aNR5+2mWhQVtK1ZIhiQMSK?=
 =?us-ascii?Q?ij4ZdFjoBi4eqeUk/ps0vfhaLBskmIHUY+7u7vayaWn7iw08Xm++N+1ZRtWx?=
 =?us-ascii?Q?vlFq7prGEawNNkzVdGMwSkrsXhceD2R7RBEt7ZpSOW5v0zL0a5AvJff9lZAV?=
 =?us-ascii?Q?kXpFIgqgymLPYwP8i7L6PRAvq3NeEr1L7DZ1OLdEZhSJqTVstd6unUbd96oY?=
 =?us-ascii?Q?Is+jFeV3WErUGUrfsEYo6Ef5y6R1bjg7DsUoXcZdXiN8N5bbECTfaiwaWQmk?=
 =?us-ascii?Q?WIzlHVsUSbPkGMKvdcqzs3y9WxYCyF8sw9LkVSVjNI21efLtJocbjOgbYzHA?=
 =?us-ascii?Q?e1DmzshM5sdbCDJ0FO/MGkwFjiOaEzq9B9l+kGydtDrKYLWj1Qp1AID1ThjI?=
 =?us-ascii?Q?lozPiCr3l4Aef1BFIvAa0nPUtNFBfzMOKTdNdXAf1JJsd8Gnsfd6MFKgm0M9?=
 =?us-ascii?Q?BRX6VeTFmbHj/BmsSsgnlZy72i4F4ElHiLlB1Npi+fEsiUAq/QUCZWD65una?=
 =?us-ascii?Q?yo+PDdkxfwmn/q68JdKxrQUWNoQZ9UkmZgaOPaRFRlcdj+a6BqNJ62i8HnG3?=
 =?us-ascii?Q?NikU+ffDdeUHHuArpLbzOG9kt2NevUugNa1BpfDC2yd6EMv0YZvbo+oOe7IU?=
 =?us-ascii?Q?JR43YJg7GjDWpslnWdYF6+m+6UqFAFmk2eUEG1c2uT1M6LoO5YAA6i5FR7Jl?=
 =?us-ascii?Q?vY2WZz/W+LO+2lzHIkOb5GMmtAF7gqmmPV35zIiV60eBW9sK41BX1CWrvvJk?=
 =?us-ascii?Q?r2RLbppIWafP7T4tcPZaV4T9UcuapkrABbOcZ4KwTw1AwPn0h4lZmklGeaOb?=
 =?us-ascii?Q?5IeQsCGUNMws5QWeFmsTC772Ide7Fy07BF3RcaXaGyOPrwf3Y44p2Bb509+v?=
 =?us-ascii?Q?vKp5VQuiErDPbr3lfBc/l4fc0vrhFEk6jAmNs34N96ou5Pds7u+eIa5TgsrC?=
 =?us-ascii?Q?lrh9g44x+XK+MYpIG1v/0Sf6M5E1y/QT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 05:17:44.3627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48a18d4-0f97-4260-e1e5-08dc9b1f785b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
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

When the property is restored to an empty bit mask ABM and PSR
can be enabled again.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Fix enabling again after disable (Xaver)
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
index f866a02f4f48..34da987350f5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6417,6 +6417,13 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
+	} else if (property == dev->mode_config.power_saving_policy) {
+		dm_new_state->abm_forbidden = val & DRM_MODE_REQUIRE_COLOR_ACCURACY;
+		dm_new_state->abm_level = (dm_new_state->abm_forbidden || !dm_old_state->abm_level) ?
+						ABM_LEVEL_IMMEDIATE_DISABLE :
+						dm_old_state->abm_level;
+		dm_new_state->psr_forbidden = val & DRM_MODE_REQUIRE_LOW_LATENCY;
+		ret = 0;
 	}
 
 	return ret;
@@ -6459,6 +6466,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
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
@@ -6485,9 +6499,12 @@ static ssize_t panel_power_savings_show(struct device *device,
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
@@ -6511,10 +6528,16 @@ static ssize_t panel_power_savings_store(struct device *device,
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
@@ -7685,6 +7708,13 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
@@ -9284,6 +9314,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
 		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
 		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
+		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
 		struct dc_surface_update *dummy_updates;
 		struct dc_stream_update stream_update;
@@ -9337,6 +9368,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
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

