Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B882E97C183
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3215310E658;
	Wed, 18 Sep 2024 21:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BDpYdO0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073CD10E65E;
 Wed, 18 Sep 2024 21:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEQCaTe96Ldvl8cOZfpe9nsejV0GpsOLRcpfnc+neLjLHhNxknwUxVxrEJt4RUbzSP0dX9lxyxhHe9qlUR0K5o4uEry149HB69G3tAuCILc+Jj+eM8GONnuvdrNRXsc5SpXV5sarpEBe1bQXDUNTh/DEU2x/niypKGC/kvU+avVCAgJsuLBVVkebGglifRFPduDKnsXSJ64329y3NPdl//GVSEL4iYYc9ksNFsgp1x83Wowu5auEPVEYQz/uetjrrZhxckOlxO2TfNkimSSy6Xh+IMVipAusLbCggwOynu3EguNIOLJO7OPXaNSwgfzb0W6z0tgbLS7RmLzUmMfbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nY9lHuxmg6YhEaKekT6cpJgQoSawY6eDrtDkEPFHx3E=;
 b=k1YSZkG6fjmWKX71fV3IpSKvBSFxrWIcawLVoHZCsKkDsLGAaoKNHlWlf/eWdEi9IGwMMX40CVisHeq284xvxkwVZIvoW9YkL8RE1wzF/cz4hjBA8lsCTC1lIxDIl4cHEvVnCnWZy/8p86VugIG21Psai5w9DyfP4KwaWqtlG92HLH0HravwPk/oUPle56vtZGd0ODK1NCsmr32eybXVJ/IF5q2y27/LZPdnEKEzY5dXmi9sBpYYkhbFlnwxv6S04WGB1HQNzf16eWvmzucb9wwzW1b6sfKmzREeUaoR4IhxI8vsm3UXlJ69j83R4tQr3z+TAgHDDSaJWo6j/UJqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nY9lHuxmg6YhEaKekT6cpJgQoSawY6eDrtDkEPFHx3E=;
 b=BDpYdO0jYz+peg1HPh/JhTdUwW9F49bfR9pVxl1jfqNiyWxb4Ep+IX7DN4tkELmGsS2JLO9XInLXFSa3Kwvgk9YzfkQfL2F8oyvHr9F3dkiWS9tneJZlqkvPuVOJL6mo+ow+7T44YXAD2EIPU0QU157DrhMTDlM2EIyj9jJezcY=
Received: from SA1PR02CA0004.namprd02.prod.outlook.com (2603:10b6:806:2cf::8)
 by DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 21:39:22 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::e1) by SA1PR02CA0004.outlook.office365.com
 (2603:10b6:806:2cf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:21 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:19 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 10/10] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
Date: Wed, 18 Sep 2024 16:38:45 -0500
Message-ID: <20240918213845.158293-11-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DM3PR12MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: 48020fb3-36de-414a-e0f2-08dcd82a5bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dqJ4152FIu8lD8aOmzzoVI2yELcznBqNTuva4B91/vLDhX18ePtFZEtsjJqT?=
 =?us-ascii?Q?ocoomiX3E0kyKv5AxspIsYO+nL21oM8JbTA5xwgxePLYsdqpyHzVRsomzYrU?=
 =?us-ascii?Q?m3jvY19V6/BR5vqANTCFPY9sQKcH/jAzdkc0mvLFCNcSl8jEo0582Hdt+xgV?=
 =?us-ascii?Q?idgHBGXcq59YuAAPdiKN20WseMbHl2ci3w/EIQRq0sC/ZC6KsE1qzNode3kN?=
 =?us-ascii?Q?zWDSESqS5DdyZPCMPRZUJbbHNBlHPgiLLuQWiymAl4ypFNmRDDDIA98Rd0Fl?=
 =?us-ascii?Q?aGvqZsGNEgUCh/8aQGX/sOOxwi5EJ7a2E3xMfyZGrSc/SFnUrqpkjnNICfHW?=
 =?us-ascii?Q?Hh+17UVCvztDUb2iV9icQ3ftTSokJsn2qWlzBcmFqol5LRG5ej9DirB6ZBAX?=
 =?us-ascii?Q?E6+xGim8ilZIlwHRhi2o/1QyA5Aty17dKphkv7ZA4iIc32HHfLZzQWwDSD7M?=
 =?us-ascii?Q?rsmiHqEO+NbeuV254n4FbSmiQcpc6O4huDIMQNDCxpqJBRmTrf02pXtTzLtd?=
 =?us-ascii?Q?HO2kbhcK3D8XbC6yYqLzFcdpCd2NRSRo3jGqvFzv2NQcHfYRYykMdANI21nl?=
 =?us-ascii?Q?KJEGLzyk1h6GV5yYqlg75HKsaoKEXODlFy2BvOXDqWkZSr2RQSKfx8qdOJ+p?=
 =?us-ascii?Q?5CkC+9QdlnjnJeMTCK3MX4U2EPy9xs5bTIx3ZsFIm64X+2kgtPg4HKOklG4q?=
 =?us-ascii?Q?U5EvzIJAAl4bpBKyYzYUvPgZ6zTIvNffRlF5h/JA4MIT9u4hrJCBLwpHWjrw?=
 =?us-ascii?Q?RPyr07GqIFvr8PL/rrwaRBheFtz8PdMgSsNCjNfd82zEGNzZRw52tEpAOQML?=
 =?us-ascii?Q?0p1xPNx0woUgMz4qhzFfpc5sW9pr5YVBRPAPLurEOJ3y1hKNGGKma2JRBhGk?=
 =?us-ascii?Q?2l9AJnPYRZ741NuBrir9puNkO35/6RT+AAQGfRndj8MXhuDINqcfYNH3dFFH?=
 =?us-ascii?Q?LqtaiV5LUJ1SypSVeZMJMvssksSZ8K56g/LF3xRaayTmjjwLrtCqSD0iSOFQ?=
 =?us-ascii?Q?XCDpHTdv5TWzHd8IUu4Lxdbx2sAyzcn4qfouP5s13RWZ8HXxSYpkVkfvw1g2?=
 =?us-ascii?Q?nuL6xDJXbf8p/DplX3YWztIzHMEAq8NtlXpdnURJ4AzYr3UvsbZtXhv4x6jw?=
 =?us-ascii?Q?byaejbZcrP6bsgUXo4gMHEkHAK7mT/tS2aAZPH6sWXcisE1jTW5Cmv0yTjdt?=
 =?us-ascii?Q?Ko+hGEte11C4i0IkCXVRgVfjWVH2Ccm2lkGHAmBwYsSs2I8XbkEDsADL1Hpg?=
 =?us-ascii?Q?sk/rh7NKLG7hmEXQSqBGTwFRajmJKoS/SJ2aygF7b+RAWJtxc1lwiox7LtyN?=
 =?us-ascii?Q?w5OiGPEhWIz9PU7iM9VKOKca741HZC0sJz02dvQArgTTgyKgyEJHlVjcj0GF?=
 =?us-ascii?Q?PRTwKeK/3BiqI5OOMblSsaxQjFPrLH0M2CqSCwpboMyedSnhOPtDnAWCAXML?=
 =?us-ascii?Q?nsQipyznaUcjq8+secStjyQBKeZn+NrE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:21.9799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48020fb3-36de-414a-e0f2-08dcd82a5bd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434
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

Some manufacturers have intentionally put an EDID that differs from
the EDID on the internal panel on laptops.

Attempt to fetch this EDID if it exists and prefer it over the EDID
that is provided by the panel. If a user prefers to use the EDID from
the panel, offer a DC debugging parameter that would disable this.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 62 ++++++++++++++++++-
 drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 8f4be7a1ec45..05d3e00ecce0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -23,6 +23,8 @@
  *
  */
 
+#include <acpi/video.h>
+
 #include <linux/string.h>
 #include <linux/acpi.h>
 #include <linux/i2c.h>
@@ -874,6 +876,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link *link)
 	return dp_sink_present;
 }
 
+static int
+dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct drm_connector *connector = data;
+	struct acpi_device *acpidev = ACPI_COMPANION(connector->dev->dev);
+	unsigned char start = block * EDID_LENGTH;
+	void *edid;
+	int r;
+
+	if (!acpidev)
+		return -ENODEV;
+
+	/* fetch the entire edid from BIOS */
+	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
+	if (r < 0) {
+		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
+		return r;
+	}
+	if (len > r || start > r || start + len > r) {
+		r = -EINVAL;
+		goto cleanup;
+	}
+
+	memcpy(buf, edid + start, len);
+	r = 0;
+
+cleanup:
+	kfree(edid);
+
+	return r;
+}
+
+static const struct drm_edid *
+dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
+{
+	struct drm_connector *connector = &aconnector->base;
+
+	if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
+		return NULL;
+
+	switch (connector->connector_type) {
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_eDP:
+		break;
+	default:
+		return NULL;
+	}
+
+	if (connector->force == DRM_FORCE_OFF)
+		return NULL;
+
+	return drm_edid_read_custom(connector, dm_helpers_probe_acpi_edid, connector);
+}
+
 enum dc_edid_status dm_helpers_read_local_edid(
 		struct dc_context *ctx,
 		struct dc_link *link,
@@ -896,7 +952,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-		drm_edid = drm_edid_read_ddc(connector, ddc);
+		drm_edid = dm_helpers_read_acpi_edid(aconnector);
+		if (drm_edid)
+			DRM_DEBUG_KMS("Using ACPI provided EDID for %s\n", connector->name);
+		else
+			drm_edid = drm_edid_read_ddc(connector, ddc);
 		drm_edid_connector_update(connector, drm_edid);
 		aconnector->drm_edid = drm_edid;
 
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 3f91926a50e9..1ec7c5e5249e 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
 	 * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
 	 */
 	DC_FORCE_IPS_ENABLE = 0x4000,
+	/**
+	 * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
+	 * eDP display from ACPI _DDC method.
+	 */
+	DC_DISABLE_ACPI_EDID = 0x8000,
 };
 
 enum amd_dpm_forced_level;
-- 
2.34.1

