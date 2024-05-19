Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B648C94B8
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 15:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB21610E244;
	Sun, 19 May 2024 13:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zqIX4AlH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78F10E23F;
 Sun, 19 May 2024 13:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8Ngk/XMx6wkS0pK8IPiw8LwCT9LZPpERzKYQm5O/ajcNfQMlm3h8ssYSpRXHDiNRZKPyce2xCjO6+r0HtcNE1OtGnmwPwEp8OIFnP0AAQpdT1hVsrDc0Ug5nJ35rvdjHHl9Dm0C2a90u0LUtvvRl9uoPWiPENkxxMoNfH7hRHe+YGZ5hDMqsMTtz3unHOeLtv7HoyCRTFHYuJlqKcE4Ya+TOMy8A4WaBe74hpI2AM2Kl9/TQRXe3W6pddDocany0PgTIENlDb6kfSd8DbQHYzZXh2brKYWWaAHj1RH7Au9TRz8qem7UkQYifhPAn70KD6frGzJGg2lqgKC2Y7sROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0TA/AxFD8bnO6+8jjpVyYVqUNbVaIeriyEuUJexyv4=;
 b=b/7bW4oJ2o1t6IgoRtaoOspt7XlP16tQgQeODDF7x/vMtWQsCEqEl/ooQ6Mwd10ZiOZG9iK072LMNrYUwk9aro9cGM9K5ADKIpvEKqagDqKdXmCDJ5A+dDpF8qj5W8qPKpyPVClIV5WpfJTbSoNXN5qUPKVPVLljuWyk74bWBvdyDQr1oIH5Y0q8lCSiVNy5sS0O0bNsTFkEFIIbU8LWU+MUUbMvbqOJVEhNF7B6fEbdOG9oimdg1DzGU53hfkPyraTQT/EaVtUrq0TlUnl3cvxdfT8QX6+aWWdgOpdM9+c/E8vi2RPeNcZOeBwT2S/Ceu6XPQpfxwffT9dhkhLXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0TA/AxFD8bnO6+8jjpVyYVqUNbVaIeriyEuUJexyv4=;
 b=zqIX4AlHJqRz6UoH9XkhkIpkDy/IsToSET5Ckirl9LBEKHVO1rE30xxg79ny396SiIfjvoPSMh9F9MICTNRDiOoN63wL70ufaaXuzCdgGz5h5/Lqob6Kj1cYUpiGCzgFnkM2MBuwiIcAQf/GrVqhzW9uAIlUYT0Mh/K9ZV7boJg=
Received: from BYAPR03CA0029.namprd03.prod.outlook.com (2603:10b6:a02:a8::42)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Sun, 19 May
 2024 13:06:29 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::c7) by BYAPR03CA0029.outlook.office365.com
 (2603:10b6:a02:a8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Sun, 19 May 2024 13:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Sun, 19 May 2024 13:06:29 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 08:06:27 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <xaver.hugl@gmail.com>,
 <dri-devel@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH 2/2] drm/amd: Add panel_power_saving drm property to eDP
 connectors
Date: Sun, 19 May 2024 08:06:10 -0500
Message-ID: <20240519130610.7773-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519130610.7773-1-mario.limonciello@amd.com>
References: <20240519130610.7773-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: f9268a31-367e-49ce-53ca-08dc78047f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FlEuv+HlT429U0sj2GGHx48onC1lOPHobeY05PJuh85xNx+aP1x4XxEANlAP?=
 =?us-ascii?Q?Cwg5ScXNHsnu9FymkCMobIFYA6+OODALLshhMZ/W0iW4n8RKofTnQr0eq8M4?=
 =?us-ascii?Q?JVOH/BCiypd0vp1eXX+QIIwnvOrpchuDgURbco/OC3xludCVwAaP/H3gR5YP?=
 =?us-ascii?Q?kzc0xHwf5s9gN7ZAxW8DKfQFGoEdjKSl/MTbK0Ml6znwKT5CJvSrnajHDWuh?=
 =?us-ascii?Q?gNmh4RMBUvq7prp1hI6vDi5BN0w1WEnxt6lnkelUSQAvvo9b5uVUlA8dW9DC?=
 =?us-ascii?Q?JvGF8i3Pp/89acB1UjTMXBNdGJifP9Mw2n1e08ziTJmnDe5uka6kFFgd1cTx?=
 =?us-ascii?Q?fJKYXNtCFT7jyVluqJyPIBsV7H+NTAnqN4IAvxKsPwHm85jSmadB1B8GfEB+?=
 =?us-ascii?Q?H7+v69thm3BidNpPN4aMlsX1C2JgfNcUf3RcZyrf/Ee1NrPYlB8v8VtgTGLT?=
 =?us-ascii?Q?X1LODxv9gESid1+uN91ITS8sK1gtP/EBX4WKkdfic5BV4b48ht17kBQuUSJz?=
 =?us-ascii?Q?xOFEg0NOwl2qIpWiz4X6S7Yb91ewAFzC+7F/haJHKYyusHIllyDm1N9aIxXD?=
 =?us-ascii?Q?Riz2FpkkjFHUQ79hLIelUHS7B3UDx/IaNMB8E/K91WKvIznWH9JxSULGMaze?=
 =?us-ascii?Q?1VcW+ZTwPjQrMIkz91BPeonwERvO8eg4VYnOw7Etpp8hPjkf0G5k6ckk3G53?=
 =?us-ascii?Q?0K4iqGrg2f+TPzSjCkKXTDfc0D+6ZI9m75PYE7WFFq5FLc//V8KepZkBW81q?=
 =?us-ascii?Q?fApM4FE7+H3ZTE9Q7LdU6Y7+qnn2y4ChSnX7avM3gTTwpbISDo0xWB6fbZNL?=
 =?us-ascii?Q?Y4i5C8mG/nzlgWp+4lAOGs7QSCmiUdh+2zZfNj4NTzR0SSEReCtnofWsDtlV?=
 =?us-ascii?Q?74DMBtj8VPMbRVOpB8qKr+vdBJf+BLg8gu3T5Uzk06LUlJTp2WcAv4y+99Xa?=
 =?us-ascii?Q?5/RzNNbHPY9wKSeCWYHUcTgywhAuHMTv5+jBQC43Y7+T6ot/AnkvbyybRIvl?=
 =?us-ascii?Q?fgy4MP6QU9Q7+IIpezjQdpajaWZImJDHehOxcesEzcMhqI8A0+u9TOWZ2xBg?=
 =?us-ascii?Q?xkkMqQYdz9ud+gmY0f2b9AC9AVIjxnqdWP0Q7YmPBn2ZP389jzcvlOmU/R5q?=
 =?us-ascii?Q?z2GyotUQDedSVzeaqWOdrjpX5DJdi2m9E6ZMlhnnQFAqFyjdndUSTOQ7bPoM?=
 =?us-ascii?Q?sFJT+lo6CGKckLt93zadWgN19WMaYYwsQOrdJ/i8rxkVMRHVwkfTltndQl95?=
 =?us-ascii?Q?+68qblKGZYOSLu/3nzKW5z2AcvBPhCUy0P4ilnsG+I34yEWDHOPwnHuDvxzV?=
 =?us-ascii?Q?v/0rwwORA6VZQ42Y0FOlQsw7FwDEjVSilFnOeAV52C9hUAQjg+F6YwRtPrD2?=
 =?us-ascii?Q?XEe8faU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 13:06:29.1525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9268a31-367e-49ce-53ca-08dc78047f6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119
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

When the `panel_power_saving` property is set to "Forbidden" ABM
should be disabled immediately and any requests by sysfs to update
will return an -EBUSY error.

When the property is restored to "Allowed" the previous value of
ABM will be restored.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  3 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 3ecc7ef95172..6e6531c93d81 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1350,6 +1350,9 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
+	if (adev->dc_enabled)
+		drm_mode_create_panel_power_saving_property(adev_to_drm(adev));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 01b0a331e4a6..f6b80018b136 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6421,6 +6421,12 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
+	} else if (property == dev->mode_config.panel_power_saving) {
+		dm_new_state->abm_forbidden = val;
+		dm_new_state->abm_level = (val || !amdgpu_dm_abm_level) ?
+						ABM_LEVEL_IMMEDIATE_DISABLE :
+						amdgpu_dm_abm_level;
+		ret = 0;
 	}
 
 	return ret;
@@ -6463,6 +6469,9 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		*val = dm_state->underscan_enable;
 		ret = 0;
+	} else if (property == dev->mode_config.panel_power_saving) {
+		*val = dm_state->abm_forbidden;
+		ret = 0;
 	}
 
 	return ret;
@@ -6489,9 +6498,12 @@ static ssize_t panel_power_savings_show(struct device *device,
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
@@ -6515,10 +6527,16 @@ static ssize_t panel_power_savings_store(struct device *device,
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
@@ -7689,6 +7707,14 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
 
+	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    (dc_is_dmcu_initialized(adev->dm.dc) ||
+	     adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
+		drm_object_attach_property(&aconnector->base.base,
+				dm->ddev->mode_config.panel_power_saving,
+				DRM_MODE_PANEL_POWER_SAVING_ALLOWED);
+	}
+
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		/* Content Type is currently only implemented for HDMI. */
 		drm_connector_attach_content_type_property(&aconnector->base);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 09519b7abf67..43c3e5845a94 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -873,6 +873,7 @@ struct dm_connector_state {
 	bool underscan_enable;
 	bool freesync_capable;
 	bool update_hdcp;
+	bool abm_forbidden;
 	uint8_t abm_level;
 	int vcpi_slots;
 	uint64_t pbn;
-- 
2.45.0

