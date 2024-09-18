Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D697C17B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1657410E647;
	Wed, 18 Sep 2024 21:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XeEGZHDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F28010E649;
 Wed, 18 Sep 2024 21:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZl8UU+4Q6KNgMoGQVyHWo1AG5zeP1K7JYqoLKaSHmGn0z2uGYU3FYFcCe/gcpSmTfupmzzdRlDoHntkR64n09WshLOpuOhS3yW6nrOjoUfsLKa+DWD5xqNLtO65rms2R/qo1G/OyVTDzFEh5vScpxVODg/FgAnCTRyytMtDfeVI7zUw18DABa+dmu5cUyIStZFJ7symmhu9zo41/UUxHPKp1UWBUZ4E4fys6ldAQyjSav7QKY7YJ9a6SY50TWLzoKyBuqC2zfl78QE6kl6O/JAnEUAw6SH69p+cmKihpNY83PSQ468yDV3M8A/Azv9ZNVkQZthhpr9WUhk43bd5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJbgym8i1yA2o7BYksfFmeum5J/CpROvvYSTy7Xb3OA=;
 b=vQIznuhiiGYSJeTlouTwHLG77IeAM11odBrXq7TciC/sNZkUpingxDvq33AJTejujCXYsH8Sh88zDt4tAuM8t8eH1nzwg7/tnOCdrhSNuHmyc3esGX58aSymoSQAUtd2HGFF6BgY3sogvODFGqm5COzA2f4e/g9fADdqehpqHF9b1OMkQk4jaK4W5Ib0aBi5jntDgpU2k0c8puHRxewaWi6u5uNDTxjywo7J6ajOtWgqXR+1dfQgUKHmpSx0PHq6N5Nzs7Q9vOEado79T/tQcHC3tO/dSL4WTXNJNtuPXFfu2mLFIm8oFwi0v3qpv1PI5Xt/KGg7gxD1FkcJjkSoTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJbgym8i1yA2o7BYksfFmeum5J/CpROvvYSTy7Xb3OA=;
 b=XeEGZHDlxIG1wHyYV0NdjCr2IlTdCl3stq0JJVC5NRykp3edkPHfWMlXWrYsXlMZaLpNn3rc7YSWGjefVENuIr7L9cmE6waX0Y0NNCYxeWmq54aThErKxVUBK6WZPXYP8NdSOgtELaexckHAGC+lcejy0BSpr3A/VhttNX0lrks=
Received: from SN6PR01CA0029.prod.exchangelabs.com (2603:10b6:805:b6::42) by
 SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.24; Wed, 18 Sep 2024 21:39:12 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::e9) by SN6PR01CA0029.outlook.office365.com
 (2603:10b6:805:b6::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:11 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:10 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 01/10] drm/amd/display: switch amdgpu_dm_connector to use
 struct drm_edid
Date: Wed, 18 Sep 2024 16:38:36 -0500
Message-ID: <20240918213845.158293-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918213845.158293-1-mario.limonciello@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c3f947-12f2-4c02-c7fe-08dcd82a55d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z9G703IXMtVleC8vtDxGsgjBeprWAoLPrfWlJfi9XS5QN6oOiGp0frJ1baxP?=
 =?us-ascii?Q?ml0yWiFXBmDxjvcRK/nCeFmJvH+DUDoiWI8eNUObTQWaA5QKu3gkHnA0QI6U?=
 =?us-ascii?Q?mlrRNvicTKkG9fCELsoYZEhJHb8e1SP9Mq0r3Y2xcfGGLSVrOMjZWMmY9lud?=
 =?us-ascii?Q?G6lm/eA7/X6kaN7b16yDsj9t95Zh58gzE2U2R7KV75L1ZLdpDt964qB2FRWL?=
 =?us-ascii?Q?dMwNWaidV1bZiPsDBPiCsjuPSLeuHkA6z9nrDUaL7ffOK+ntjrYqnxUljIfH?=
 =?us-ascii?Q?mFMYadJPN28XHlnyYgq9ptrkcDJXVWiARDT+iu7bjVWNIb5bkXq/YwZdKMyr?=
 =?us-ascii?Q?Ed+ys9FnYQfD9wThWog1l53uc2wkHQtKOC2Swu0JE/mqW6suRKRcPKuAwbtT?=
 =?us-ascii?Q?3GWUsYkfZWn93qllOWYe1jJyn85MyUKsdttrNEvw7IKfBKidNzpEVIJ0nceB?=
 =?us-ascii?Q?2gfg9/PyM7PBsPFYoDU/CdviTnQh+nPQAsTPD6nlYfKsGYbdA6TUEaJtFJyT?=
 =?us-ascii?Q?HBu1Z8gyVZl3CDmr2DJ2LfoeaV2442EOf5phkUW9RfPQWhdVOX4Ph2mOX8vt?=
 =?us-ascii?Q?KP7F/S0ZTJQR8brdk2xM9nuF93xDrvUGXWqTecp1G9ps2cDxSdiqqmjA5XMR?=
 =?us-ascii?Q?VM9gJbd/F4rgyxjxFPgefI7vDVzB0SkEtHx60p3yTjLicUS7y47eYFGY+dF5?=
 =?us-ascii?Q?6j72sEQwxFyH2NzE0M4DnEliiJN5dWFOloGQYhDi+TSpVHrUMc9pTQSbGuqB?=
 =?us-ascii?Q?mFzGtpcVduhtFW2NxvUJfRvR5jQ4WIb0D+awcmWZiB4s50U2iykHEMknePy5?=
 =?us-ascii?Q?MhRdbzPXEc5z6FenzCqt2AoxqhXcgtwHs/bAyjMQ1dragpKhwshjV71wKxG0?=
 =?us-ascii?Q?zXip/Vw9OmQl4straAKhuDDeNjmkS1k0jfosb2+NLXqaqbyOGt/0IcfS49Qj?=
 =?us-ascii?Q?VbdGBRZOSF2kB6HJNjqljR5mQHYKLGdSB+4soZyYTJ09JMfYzDPPuoWshA8a?=
 =?us-ascii?Q?DaCrIPtkpxLtVGrWMv7se76cyVoswPgLpSP2wRTUm46ga/pbeCZum5zG7Kx7?=
 =?us-ascii?Q?1nZTm9kkZPeZyOKUs7spqwPb5hWML5jdcj6ZDQc0cTv8z4QsjqXoi1dvIcHl?=
 =?us-ascii?Q?Cdfk2T2m0SIIbrvya+gqUbk9DbW+lvOBeCRjnxVPxfyDlZAGbt1Y4Msh+Ng6?=
 =?us-ascii?Q?XyaVNLgPkyXfIVFwynEpBuo0o3lQZ7h56S94xQtwsygn8KjRyI5S0RD5Ydbt?=
 =?us-ascii?Q?fQVWy+ISc34M7x9FnmiZJctYyHU6IONIbsUuaThimwdp31FIsewVdF9Uk5hd?=
 =?us-ascii?Q?uqCP4sb5D2wq9drPGr/ixvjSMcGVV+ESDIAWh6jTJ4Gl/TZNpY3KZuHexhEC?=
 =?us-ascii?Q?Plo77LFWmWqCQ1vEzB5Qt7NipvTHQ/9tTEB6mh3AtwFdMgO54ZTh8potkRD/?=
 =?us-ascii?Q?nyyiBV179P1jrlvhMyv2tY9cIOmoNxBe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:11.9024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c3f947-12f2-4c02-c7fe-08dcd82a55d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177
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

From: Melissa Wen <mwen@igalia.com>

Replace raw edid handling (struct edid) with the opaque EDID type
(struct drm_edid) on amdgpu_dm_connector for consistency. It may also
prevent mismatch of approaches in different parts of the driver code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v7: fix LKP robot issue
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 123 ++++++++----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  13 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 ++---
 4 files changed, 84 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6f4b753f5f51..b7d93787667c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3487,7 +3487,7 @@ void amdgpu_dm_update_connector_after_detect(
 			aconnector->dc_sink = sink;
 			dc_sink_retain(aconnector->dc_sink);
 			amdgpu_dm_update_freesync_caps(connector,
-					aconnector->edid);
+					aconnector->drm_edid);
 		} else {
 			amdgpu_dm_update_freesync_caps(connector, NULL);
 			if (!aconnector->dc_sink) {
@@ -3546,18 +3546,19 @@ void amdgpu_dm_update_connector_after_detect(
 		aconnector->dc_sink = sink;
 		dc_sink_retain(aconnector->dc_sink);
 		if (sink->dc_edid.length == 0) {
-			aconnector->edid = NULL;
+			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
 				drm_dp_cec_unset_edid(
 					&aconnector->dm_dp_aux.aux);
 			}
 		} else {
-			aconnector->edid =
-				(struct edid *)sink->dc_edid.raw_edid;
+			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
+
+			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
+			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
-						    aconnector->edid);
+				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux, edid);
 		}
 
 		if (!aconnector->timing_requested) {
@@ -3568,17 +3569,18 @@ void amdgpu_dm_update_connector_after_detect(
 					"failed to create aconnector->requested_timing\n");
 		}
 
-		drm_connector_update_edid_property(connector, aconnector->edid);
-		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
+		drm_edid_connector_update(connector, aconnector->drm_edid);
+		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
 		update_connector_ext_caps(aconnector);
 	} else {
 		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 		amdgpu_dm_update_freesync_caps(connector, NULL);
-		drm_connector_update_edid_property(connector, NULL);
+		drm_edid_connector_update(connector, NULL);
 		aconnector->num_modes = 0;
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		drm_edid_free(aconnector->drm_edid);
+		aconnector->drm_edid = NULL;
 		kfree(aconnector->timing_requested);
 		aconnector->timing_requested = NULL;
 		/* Set CP to DESIRED if it was ENABLED, so we can re-enable it again on hotplug */
@@ -7105,32 +7107,24 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
-	struct edid *edid;
-	struct i2c_adapter *ddc;
-
-	if (dc_link && dc_link->aux_mode)
-		ddc = &aconnector->dm_dp_aux.aux.ddc;
-	else
-		ddc = &aconnector->i2c->base;
+	const struct drm_edid *drm_edid;
 
-	/*
-	 * Note: drm_get_edid gets edid in the following order:
-	 * 1) override EDID if set via edid_override debugfs,
-	 * 2) firmware EDID if set via edid_firmware module parameter
-	 * 3) regular DDC read.
-	 */
-	edid = drm_get_edid(connector, ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read(connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
 
-	aconnector->edid = edid;
-
+	aconnector->drm_edid = drm_edid;
 	/* Update emulated (virtual) sink's EDID */
 	if (dc_em_sink && dc_link) {
+		// FIXME: Get rid of drm_edid_raw()
+		const struct edid *edid = drm_edid_raw(drm_edid);
+
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
+		memmove(dc_em_sink->dc_edid.raw_edid, edid,
+			(edid->extensions + 1) * EDID_LENGTH);
 		dm_helpers_parse_edid_caps(
 			dc_link,
 			&dc_em_sink->dc_edid,
@@ -7160,36 +7154,26 @@ static int get_modes(struct drm_connector *connector)
 static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_connector *connector = &aconnector->base;
-	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink_init_data init_params = {
 			.link = aconnector->dc_link,
 			.sink_signal = SIGNAL_TYPE_VIRTUAL
 	};
-	struct edid *edid;
-	struct i2c_adapter *ddc;
-
-	if (dc_link->aux_mode)
-		ddc = &aconnector->dm_dp_aux.aux.ddc;
-	else
-		ddc = &aconnector->i2c->base;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
-	/*
-	 * Note: drm_get_edid gets edid in the following order:
-	 * 1) override EDID if set via edid_override debugfs,
-	 * 2) firmware EDID if set via edid_firmware module parameter
-	 * 3) regular DDC read.
-	 */
-	edid = drm_get_edid(connector, ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read(connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
 
-	if (drm_detect_hdmi_monitor(edid))
+	if (connector->display_info.is_hdmi)
 		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
 
-	aconnector->edid = edid;
+	aconnector->drm_edid = drm_edid;
 
+	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
 		aconnector->dc_link,
 		(uint8_t *)edid,
@@ -7876,16 +7860,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
 }
 
 static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
-					      struct edid *edid)
+					      const struct drm_edid *drm_edid)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 
-	if (edid) {
+	if (drm_edid) {
 		/* empty probed_modes */
 		INIT_LIST_HEAD(&connector->probed_modes);
 		amdgpu_dm_connector->num_modes =
-				drm_add_edid_modes(connector, edid);
+				drm_edid_connector_add_modes(connector);
 
 		/* sorting the probed modes before calling function
 		 * amdgpu_dm_get_native_mode() since EDID can have
@@ -7899,10 +7883,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
 		amdgpu_dm_get_native_mode(connector);
 
 		/* Freesync capabilities are reset by calling
-		 * drm_add_edid_modes() and need to be
+		 * drm_edid_connector_add_modes() and need to be
 		 * restored here.
 		 */
-		amdgpu_dm_update_freesync_caps(connector, edid);
+		amdgpu_dm_update_freesync_caps(connector, drm_edid);
 	} else {
 		amdgpu_dm_connector->num_modes = 0;
 	}
@@ -7998,12 +7982,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
 }
 
 static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
-						   struct edid *edid)
+						   const struct drm_edid *drm_edid)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 		to_amdgpu_dm_connector(connector);
 
-	if (!(amdgpu_freesync_vid_mode && edid))
+	if (!(amdgpu_freesync_vid_mode && drm_edid))
 		return;
 
 	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
@@ -8016,24 +8000,24 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct drm_encoder *encoder;
-	struct edid *edid = amdgpu_dm_connector->edid;
+	const struct drm_edid *drm_edid = amdgpu_dm_connector->drm_edid;
 	struct dc_link_settings *verified_link_cap =
 			&amdgpu_dm_connector->dc_link->verified_link_cap;
 	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
 
 	encoder = amdgpu_dm_connector_to_encoder(connector);
 
-	if (!drm_edid_is_valid(edid)) {
+	if (!drm_edid) {
 		amdgpu_dm_connector->num_modes =
 				drm_add_modes_noedid(connector, 640, 480);
 		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
 			amdgpu_dm_connector->num_modes +=
 				drm_add_modes_noedid(connector, 1920, 1080);
 	} else {
-		amdgpu_dm_connector_ddc_get_modes(connector, edid);
+		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
 		if (encoder)
 			amdgpu_dm_connector_add_common_modes(encoder, connector);
-		amdgpu_dm_connector_add_freesync_modes(connector, edid);
+		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
 	}
 	amdgpu_dm_fbc_init(connector);
 
@@ -11958,7 +11942,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 }
 
 static void parse_edid_displayid_vrr(struct drm_connector *connector,
-		struct edid *edid)
+				     const struct edid *edid)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -12001,7 +11985,7 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
 }
 
 static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -12036,7 +12020,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 }
 
 static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+			       const struct edid *edid,
+			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -12070,7 +12055,7 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
  * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
  *
  * @connector: Connector to query.
- * @edid: EDID from monitor
+ * @drm_edid: DRM EDID from monitor
  *
  * Amdgpu supports Freesync in DP and HDMI displays, and it is required to keep
  * track of some of the display information in the internal data struct used by
@@ -12078,19 +12063,19 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
  * FreeSync parameters.
  */
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-				    struct edid *edid)
+				    const struct drm_edid *drm_edid)
 {
 	int i = 0;
-	struct detailed_timing *timing;
-	struct detailed_non_pixel *data;
-	struct detailed_data_monitor_range *range;
+	const struct detailed_timing *timing;
+	const struct detailed_non_pixel *data;
+	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
 	struct dc_sink *sink;
-
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
+	const struct edid *edid;
 	bool freesync_capable = false;
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 
@@ -12103,7 +12088,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->dc_sink :
 		amdgpu_dm_connector->dc_em_sink;
 
-	if (!edid || !sink) {
+	if (!drm_edid || !sink) {
 		dm_con_state = to_dm_connector_state(connector->state);
 
 		amdgpu_dm_connector->min_vfreq = 0;
@@ -12120,6 +12105,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (!adev->dm.freesync_module)
 		goto update;
 
+	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
 	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
 	     connector->display_info.monitor_range.max_vfreq == 0))
@@ -12196,7 +12183,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
-	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
+	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
 			timing  = &edid->detailed_timings[i];
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 15d4690c74d6..5e49b97b3d46 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -673,7 +673,7 @@ struct amdgpu_dm_connector {
 
 	/* we need to mind the EDID between detect
 	   and get modes due to analog/digital/tvencoder */
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	/* shared with amdgpu */
 	struct amdgpu_hpd hpd;
@@ -951,7 +951,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
 				    struct drm_connector *connector);
 
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-					struct edid *edid);
+				    const struct drm_edid *drm_edid);
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 50109d13d967..b8004ccdcc33 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -897,7 +897,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	struct i2c_adapter *ddc;
 	int retry = 3;
 	enum dc_edid_status edid_status;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -909,25 +910,27 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 */
 	do {
 
-		edid = drm_get_edid(&aconnector->base, ddc);
+		drm_edid = drm_edid_read_ddc(connector, ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
 			drm_dp_send_real_edid_checksum(&aconnector->dm_dp_aux.aux, connector->real_edid_checksum);
 
-		if (!edid && connector->edid_corrupt) {
+		if (!drm_edid && connector->edid_corrupt) {
 			connector->edid_corrupt = false;
 			return EDID_BAD_CHECKSUM;
 		}
 
-		if (!edid)
+		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
+		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
 		/* We don't need the original edid anymore */
-		kfree(edid);
+		drm_edid_free(drm_edid);
 
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 83a31b97e96b..5e3d3eda3c9f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -129,7 +129,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
 		dc_sink_release(aconnector->dc_sink);
 	}
 
-	kfree(aconnector->edid);
+	drm_edid_free(aconnector->drm_edid);
 
 	drm_connector_cleanup(connector);
 	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
@@ -182,7 +182,7 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 
 		dc_sink_release(dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		aconnector->drm_edid = NULL;
 		aconnector->dsc_aux = NULL;
 		port->passthrough_aux = NULL;
 	}
@@ -302,16 +302,18 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 	if (!aconnector)
 		return drm_add_edid_modes(connector, NULL);
 
-	if (!aconnector->edid) {
-		struct edid *edid;
+	if (!aconnector->drm_edid) {
+		const struct drm_edid *drm_edid;
 
-		edid = drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
+		drm_edid = drm_dp_mst_edid_read(connector,
+						&aconnector->mst_root->mst_mgr,
+						aconnector->mst_output_port);
 
-		if (!edid) {
+		if (!drm_edid) {
 			amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID, false);
 
-			drm_connector_update_edid_property(
+			drm_edid_connector_update(
 				&aconnector->base,
 				NULL);
 
@@ -345,7 +347,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 			return ret;
 		}
 
-		aconnector->edid = edid;
+		aconnector->drm_edid = drm_edid;
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID, true);
 	}
@@ -360,10 +362,13 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		struct dc_sink_init_data init_params = {
 				.link = aconnector->dc_link,
 				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
+		const struct edid *edid;
+
+		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
 		dc_sink = dc_link_add_remote_sink(
 			aconnector->dc_link,
-			(uint8_t *)aconnector->edid,
-			(aconnector->edid->extensions + 1) * EDID_LENGTH,
+			(uint8_t *)edid,
+			(edid->extensions + 1) * EDID_LENGTH,
 			&init_params);
 
 		if (!dc_sink) {
@@ -405,7 +410,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 
 		if (aconnector->dc_sink) {
 			amdgpu_dm_update_freesync_caps(
-					connector, aconnector->edid);
+					connector, aconnector->drm_edid);
 
 #if defined(CONFIG_DRM_AMD_DC_FP)
 			if (!validate_dsc_caps_on_connector(aconnector))
@@ -419,10 +424,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		}
 	}
 
-	drm_connector_update_edid_property(
-					&aconnector->base, aconnector->edid);
+	drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
 
-	ret = drm_add_edid_modes(connector, aconnector->edid);
+	ret = drm_edid_connector_add_modes(connector);
 
 	return ret;
 }
@@ -500,7 +504,7 @@ dm_dp_mst_detect(struct drm_connector *connector,
 
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		aconnector->drm_edid = NULL;
 		aconnector->dsc_aux = NULL;
 		port->passthrough_aux = NULL;
 
-- 
2.34.1

