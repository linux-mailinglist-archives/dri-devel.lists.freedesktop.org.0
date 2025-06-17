Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3CADC098
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466A910EAC9;
	Tue, 17 Jun 2025 04:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TkXbY+Pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7BA10E764;
 Tue, 17 Jun 2025 04:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2tRRZxlKokSpu8yy1Cfs1otLUKZAD55TbxJe+plfD8OrI6NOjYx7MUkpXEXNWHgCT0z/ZN5hplT6L3lVrJGd8eRP1j+iiOG8Eli+xH4Ggm+BX5UniON7ZasU4K3q67bcRRAXe3HlJ5gdb33X5W8nN3quzHL6f5VXwsbOd1sXSjIJaVg8ZGQUZcA6HER7Q9Y4BA0Q9e7Ccc1ZASt0wC2lslUwOWVAvyf/gRLbAEMSLRmUF8b1vQXpr45h6ZqURiADocVrYyYqx5VxFRGhqkbNY/zzxjyPZJEoQrNRrfsJo4tnnYjNa4+MVMM6uJ3CGlBeoZh2/J00Cywu5fl5ac2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qltZzewB7ISfJkvM9kwQIV1ni9o9p1Qh4n4CPhYsC9M=;
 b=e53epGHGGwn4AdfCZYsEn/eJkabZh7xwZAfcRPPyBXpvSK5Ze3dPk1Mlyu8BvJ6A7hnDE577xiEaVDmkfcM1MYxUTEL3jhUAwurKeoKmTkjxWBxkyH8ISWRMAXPnp4Iv0f4NmmzR6upB50QOc/1BZpEXk8LgD/MaGiSEO8uSfWIcOurxz3x/wbrumyh0u6P+zCfeO3lh7e1Ng5jYxPd3bbhFdowo75KLRmqBxwRTT37uCqeOu/XfaKU9rtXcmQ49NxaB278s2DBb2BZ0X03kNA2bb1vGauSm875Z06oMqMU/dCrAbaOSn93E/QwTuAPd3QcCrlUaXOYjZF0Nv/bBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qltZzewB7ISfJkvM9kwQIV1ni9o9p1Qh4n4CPhYsC9M=;
 b=TkXbY+PlIrXqBSHW/4xy72ZSpDXD0aOlrP3eX4aYc921RfZjNVaiWL5hNevv8sONJXKKoA5luF0te0iu269rfmPklBjrfMYQIV5ss18/aEf/JA6ehpsaUTpqNbcf4TXYYoXjfXgc3881A23/xm7J/lGj+Sul+AJX7LFsBX78ETg=
Received: from ROAP284CA0299.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f0::15) by
 CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Tue, 17 Jun 2025 04:29:13 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10d6:10:f0:cafe::a8) by ROAP284CA0299.outlook.office365.com
 (2603:10d6:10:f0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:29:11 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:29:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <arthurgrillo@riseup.net>
Subject: [PATCH V10 46/46] drm/amd/display: Disable CRTC degamma when color
 pipeline is enabled
Date: Mon, 16 Jun 2025 22:17:28 -0600
Message-ID: <20250617041746.2884343-47-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa7c201-a3e8-4b1d-c03b-08ddad57820b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FTAi/5VpvSmc8/3pxblcgyIa+lTSXKAq0GSH9QLhmBAgQHh1r+4pV8CUaKuf?=
 =?us-ascii?Q?Z8zYZPV/zgoCYkvdkz2u0UEHsinimlC3BAAUC5K3QrURn3CPWkk2UATCZpMQ?=
 =?us-ascii?Q?9SIeTJDiT+WMocQR5w9FzwywUPLrDdjff0doiw4j1RnR7Ueeu/MPz9NBD6Fh?=
 =?us-ascii?Q?SCsyCCUR51DOB+RE9oliqCRcGo7y8jSDgClDs6utgHZMOmee5W52fOekq6RR?=
 =?us-ascii?Q?GJBhxc13nJe9+QTTuhMH+WGDVxjylMOcW18rAIHWKtNUL1ZTRPuFHlQAE0mQ?=
 =?us-ascii?Q?exebsRE4F8GZnhpXx/aJSrCh5ggGmmwH7OxQWkpSEmEJEQBMJyi49m/b0LxI?=
 =?us-ascii?Q?RzqYqZTVdtgB7G1d3L1/7DyDcSvhC2+PVsghvohO5rpNfe8vClq9PrgMDRkT?=
 =?us-ascii?Q?yye2AXmzS+HXryX2d4Zaaay7NHAllqyUC0b1ybqDj4KmYaCW1r8KE7ywyetP?=
 =?us-ascii?Q?nZbCRgsL4XBb6clkKUbEQOwryetJ6vHRYopKAavmO+dUAz7ZJD/cBmaKhAqJ?=
 =?us-ascii?Q?KGRPXzSE8YAPk4eGWJkjaoPht3D2IMUVPlkvGlt3+Dvud78msfiFt7LMR+m5?=
 =?us-ascii?Q?6UjH6JxmEFIzBdupbb/hS6CBcTZSvpb838xrUGmxJ6HsxDk1nDjrU2P4DWD1?=
 =?us-ascii?Q?3nBx7+829lxtNP2pE7WRLJilV+TMdGjmpbh2Ii9DbMy1rKOfPs+Hwx2gx9Bc?=
 =?us-ascii?Q?mYVOJ+pCLgvRUaz2Y3aghsyXO58qqyuNrumlbhz5i/3469yVyGsVo4aBUvda?=
 =?us-ascii?Q?kKTAUIQSvTpVcGCSkOi2nS3Aplm4gGoQEbIpSrTmf74Lo6Z2MYsQewd52d3H?=
 =?us-ascii?Q?T5wPKvijvks/bxTcKBhpbyxQse77+t89CBlA+SoQ+zLLERPnVU2EB3K04n88?=
 =?us-ascii?Q?Io9PmORekpEzZ0CRBYSnvhTEqSv93EYrYNEZ4HHnDGLL0f5L0HCtyjvtqQrI?=
 =?us-ascii?Q?iPvuDWY+dlTEvoWFErJH8QOCSsE8PFF6cYmNM/6QUq+JNi0pHwNAYMiNjZ5g?=
 =?us-ascii?Q?ny1TeRo6CHVKBgWAh/nU0CsYkQzRZ2QA51ODw8Wyoj0BJedcFs39YD/6qKC0?=
 =?us-ascii?Q?Nv/vTEdTSVO5d4qPddtiH3td0jl5EQaSdO2l+2AAglWlqReGsDSlbyVps1Q9?=
 =?us-ascii?Q?Vpi9wGR3qfFKs02+ZWrz66m4xYY/8CGZYk2hiUr5TK2WXZDF0g+K086vQj9f?=
 =?us-ascii?Q?kT1+pNlg63OEIEXvfCNpO6utPQPtARuOsD+K/9BEnhkoBPi0R+82lA3wrIEM?=
 =?us-ascii?Q?XZJ7kHI/udZiaeJ8Sd5MytwdumcH/sp/V0QBe3YCGHMC21UQaF92FAvgkAsP?=
 =?us-ascii?Q?8tiq7X9d7TEbcFM2zllX8Ba5iv7zivsWI/Xx+0zMfSAJOdi9xtubs6aQHkiv?=
 =?us-ascii?Q?Sy0BXT2p9wqaa/WyX2Tf70b5cjQvy/dPoF7OdIUxXxVOJ488Fa89aZE1eoaY?=
 =?us-ascii?Q?kwVW4ipXERyvf4PmCKf/CHc58XA5vu3gtPqHDAJmA3QTjqjI3TUi4jEetIwY?=
 =?us-ascii?Q?tS4MsifKqCyBo0JOVd9WuTq8mWOiff6Qpwca?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:29:11.1683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa7c201-a3e8-4b1d-c03b-08ddad57820b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514
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

The degamma is to be handled by Color pipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
V10:
 - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 87058271b00c..62bb4855306d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -685,7 +685,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 {
 	struct amdgpu_crtc *acrtc = NULL;
 	struct drm_plane *cursor_plane;
-	bool is_dcn;
+	bool has_degamma;
 	int res = -ENOMEM;
 
 	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
@@ -724,11 +724,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
 
-	/* Don't enable DRM CRTC degamma property for DCE since it doesn't
-	 * support programmable degamma anywhere.
+	/* Don't enable DRM CRTC degamma property for
+	 * 1. Degamma is replaced by color pipeline.
+	 * 2. DCE since it doesn't support programmable degamma anywhere.
 	 */
-	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
-	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
+	if (plane->color_pipeline_property)
+		has_degamma = false;
+	else
+		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
+
+	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
 				   true, MAX_COLOR_LUT_ENTRIES);
 
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
-- 
2.43.0

