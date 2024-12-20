Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F79F8B76
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159B510EEAB;
	Fri, 20 Dec 2024 04:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RJ3shkbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E9910EEAB;
 Fri, 20 Dec 2024 04:41:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMy9p8bmdsZCw0ibgxZ2N4qVdajYnHocBHYORyInNJaW96Lac+q/5dXRFCjZm6Tv3gCH7tXlDo2XZ5gTVIE4RIF25OSA++5W8bTrEeA0kLXDWKZt8jLHsZ4xOVPp+CwOT2qRE62oKlQFDGadZjJWaNpJL+Q48RaeavU6B2IvWSSDeitNTc6OzYP5U8oecr4TLhbcKQ5VDhgTxjwPFHOdFliDkBBgus/hBvimR3eBKtAeiv2Yj5DaloEIhRHp2JdxG6099wMTthyfLUj1PiIKfbrXDwiP4Aw50PsqnL2L5bxtx/EDo5K2rkBZJXdMn13M7Rn12r9Y1iZXfIR230hRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwxv7hehYqvHD3ROk2S7ZCE75DY23e+bKJ1E6YlO1Pg=;
 b=aOfXwrRd0yjwACfzB8bEiS/Or5R8+EWFMvdlQbOv3Xq5hYep4KU5wszpG/D1lpdPiMWIVDY4crvxTeFsf1MBRUhqXejr0S0pKjrBeZJH57rRrM63IpbNXmn7czxP6cbeYvm1FO7+bB+QZxQXKP2rnoHYYF9R3NrROGfdMfG+uYKpGOAuZcGIMSdFwuxYrYHXpBtCAMBEiIti6hvyZIwJoUXnqIz/GhtPF354f2qE+ykNTpKKgYmSl4ikFSMPPpgqXaghM4uDU1b64fLq0na8Xn8GrbkbZyDEsfIX/ciBkmWrSWKWnORluzYgLzwD50QsU5yA/X1CQtZ+NCq81wDR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwxv7hehYqvHD3ROk2S7ZCE75DY23e+bKJ1E6YlO1Pg=;
 b=RJ3shkbMul/VODGrhjrDKgtvcRqnPcjG8wLJi4dS+u4142sVXzT0fCS7aYgh9Fx2kLAmHL6mqp/TNdRfa3yFBOpepC52I+OOyecrsYvXzbs15u+5mDbYBmo9hB7Sk9GGITUvrqLXXskcxGZwoVgMyrpl4DTDbZsiJB1MwKp9wEQ=
Received: from BY3PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:217::8)
 by DS7PR12MB5767.namprd12.prod.outlook.com (2603:10b6:8:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Fri, 20 Dec
 2024 04:41:25 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::7e) by BY3PR04CA0003.outlook.office365.com
 (2603:10b6:a03:217::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:41:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:41:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:41:07 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 24/45] drm/amd/display: Add bypass COLOR PIPELINE
Date: Thu, 19 Dec 2024 21:33:30 -0700
Message-ID: <20241220043410.416867-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DS7PR12MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: e09f0967-809b-4daa-b3fe-08dd20b08f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e8OkgGeZCMalqhx8CyZKJvirrXuf9wbHCE3p8n0epWSj8juvRFNxybLDkfEo?=
 =?us-ascii?Q?3u3Uw73YctprvYriA2qski1bxk1M9/Nc8SBtYtgTAzsndH0HrzNW1hpRxuRy?=
 =?us-ascii?Q?6ozx5dvrJwM3R0zsI7O28w+5N5f+zK2e7wPTB2nTHwMHKfsg/B66gnzY9uQi?=
 =?us-ascii?Q?dozKK7kD9ZJAR/anY5knvLvKQi3cxVPUoW7MlcZ+9bOKjML5Lcse6YfMbhFN?=
 =?us-ascii?Q?k2sXAbchsN6+xSIC5gLbNoe8ZUt4Jv/6obGpxskMII0RyYwRqWPCVhHl+/X2?=
 =?us-ascii?Q?I+qrsnguMG9/P9z7c/iCaW0CjRIlSgfjORLdZYmbyLaTlpBrBxfCipn9YPAD?=
 =?us-ascii?Q?FGuBzrSXkLFxqco34JPNHMEvflEyLwQNNH4kYfnIzFRgjtgumZCa++P1EmZp?=
 =?us-ascii?Q?NAWxFoi5F9MKlq8oZiqtNaDggfxZyKgcQr9sZDXrMyXO1f9gmqpdmrdoVeBB?=
 =?us-ascii?Q?0zF93UCyuVVr7OsjUmfETlnebasdU2Y9mJKmo7l5p+WLtOTGu6lm/Uwoy8wa?=
 =?us-ascii?Q?oplO6Xgxo5Rwc0B6zZ0kPTo8tnP1LqH3STwvghGsCDhgRaVzd2jYu0bzE0s0?=
 =?us-ascii?Q?qJRj7wjDq4/pUutzUG824qACzwTb6OHfu4rAoPqSJPPH9eYTNjfYMJ57EMAv?=
 =?us-ascii?Q?4S3F1idaFymO4xB/7joIjd3KEQjx6Apz1K11IHVMWJFEn2nXjfFIFRoVkNZ1?=
 =?us-ascii?Q?bjg4G09/WXwBugmccgNCCg6mAJ5CvGUQgqh86o7M6ovkKISSqz8yfRT+pWRt?=
 =?us-ascii?Q?wsu5JR2H4o4jr9fc58l2akeRLKy4w9GBbWorrDG4AzmkQvykSj5BieQakMMZ?=
 =?us-ascii?Q?NAvMd+DttUJlHwUW3Zz43n8oYHPeCx2SMZKURu7sF/ls71Hr0uzs8OeajQjG?=
 =?us-ascii?Q?NqPMu2rLap+R5WDzAFPyWmxPT9P2xCP2dNU1DIdwXnVibXYlg8+//RQxu5IQ?=
 =?us-ascii?Q?vrQVEu8k92Uu0ZWYmVQvAFOBUwSEFTo5JfMizKotLoyA0btCUff9mVKIU+O2?=
 =?us-ascii?Q?R0m2Iu6t01ugcojyjn62p5kJxJof1jV2tJDjnwb85sYzhQV1f3Np9JZRqEJs?=
 =?us-ascii?Q?pWUt6BZkobZSQk323/CMrpjX3Y4j/KjCwGp2MH7hfR74etBEmOYT/0UD9Orq?=
 =?us-ascii?Q?bGAbed66QYox2Mbtwtgor4qFzdc0dnVTETItcozUA5zzsQX1DrmjOQp1mp1h?=
 =?us-ascii?Q?9o3Fh/yW7cBG/800vODLOzyMgIr7S7SGpbibDtjODKKS3cpiQh16nSuMsQBy?=
 =?us-ascii?Q?UMFnc9xl7sbE0ULGvhvphb1QIGWzNGiuCk0wQQfGSNnPHKTN/HcmoHTnsERG?=
 =?us-ascii?Q?ARsrlu4wKZCEg+wvt2PKzkIY5YsKPQ3h6E78VUQ/AN1IR83V7NXAsCS/Jzmt?=
 =?us-ascii?Q?8rd51UD9xMupVo6GV/MA3549doxgzqKFgzq/8zQfohtpUO9vjvfZWR7ULNVE?=
 =?us-ascii?Q?Nv5CVW3LI6ajaULA03/H018JmE9qxis4rHnjNjfjKFT3xrWu0bPwehP6oAXO?=
 =?us-ascii?Q?KWBZAzYet+yixT0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:41:24.4666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e09f0967-809b-4daa-b3fe-08dd20b08f37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5767
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

From: Harry Wentland <harry.wentland@amd.com>

Add the default Bypass pipeline and ensure it passes the
kms_colorop test plane-XR30-XR30-bypass.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 495e3cd70426..22ff9a31b592 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1756,6 +1756,20 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 }
 #endif
 
+#define MAX_COLOR_PIPELINES 5
+
+static int
+dm_plane_init_colorops(struct drm_plane *plane)
+{
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+
+	/* Create COLOR_PIPELINE property and attach */
+	drm_plane_create_color_pipeline_property(plane, pipelines, len);
+
+	return 0;
+}
+
 static const struct drm_plane_funcs dm_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -1859,7 +1873,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 #ifdef AMD_PRIVATE_COLOR
 	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
+#else
+	res = dm_plane_init_colorops(plane);
+	if (res)
+		return res;
 #endif
+
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
-- 
2.43.0

