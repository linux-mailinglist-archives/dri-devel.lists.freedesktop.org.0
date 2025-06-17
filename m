Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6406ADC062
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE9E10E5E4;
	Tue, 17 Jun 2025 04:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qyLEqjSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB5910E5E4;
 Tue, 17 Jun 2025 04:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4m0KvcuwP8nZx6UmvCfKAhy0B34HeuAOfCfE6c4IbQqoHLM9sOvpYfTYN3UmjWVfFnZzpgvDuPuyD/3NeJLE59EjZ3ilaGAvYP4Stp8Gi69euDVGzmuszVZR/ygRL0mqQiV6F4czNDHyJjGqFqhj2muKnVNtL/2qp/NMuOpZgysNEgulGV3BVo5oLc0vlFtqPyWZ11NwMmspsXiXT4lWHn1FxL8gfnKoHgQngJ3TkhFcetWjmuD3b3IL6s8MBp8MWlrXaeK24DNVcWgoecnMzrK3DA/WQ32sSZd/Mhmf+JHGv32OCTycAG0DFtuxqazFVfoVv36kwz71AzjwycCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHDpaoCQGz5+lzizgx3W8cA9AND3cqmqFonoRY+F5/k=;
 b=UahZ96WVYLyRquIjU42XZVo3cu+MWxE2S0ussbF2fqhAn5Cvx0/2YUL3WUMYD0wyLPF+VvCm/9cHEplp6KfsB5JQ1Bfds2TKJj8dK5dKqjYIarPeIGNZbeq74oynCTe4/IPZS7OpNpQWhXj0sxlEpiZZy41PxiomSA0Nskvi80Bsk5nUhS6U+WstHruyJoWqpVZu75n02A7lZ5j6CHEstLN7B8oRah9uQraCdWMShD/qRCc0AYiK4/ky+Xh68NEU3RReve2+jmyq5KLPX7VHbIJKmtqTnAewMCH3q47I57nOpYtp59Rxfl/PYwkeNHGFSwj0vNTSnl6mC48APW+UFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHDpaoCQGz5+lzizgx3W8cA9AND3cqmqFonoRY+F5/k=;
 b=qyLEqjSeIZFdZNT9ImlOMe1Gt92USPyhpNgnWXjkPM34sP1TXSpl2tKYWagphg5WiUbzjd2tCI42yXbzvgaVRNaEvT7g8bLb2QUwdj4nep4MVcACQnDtBH5E+Kx9+eA4xyiiSW4OGRhKljoZJM7m9hgaNE+fbCHIIlgu1F1fXgs=
Received: from CH3P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::35)
 by IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:24:04 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::31) by CH3P221CA0004.outlook.office365.com
 (2603:10b6:610:1e7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:24:04 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:23:52 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 24/46] drm/amd/display: Add bypass COLOR PIPELINE
Date: Mon, 16 Jun 2025 22:17:06 -0600
Message-ID: <20250617041746.2884343-25-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f302c95-7460-4284-2b55-08ddad56cb04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aeQuqm7TONrMRFpYtTNnEC+J+4LrvGwLi71a3j1Y4KbX63yHAvmJJy1/xJQQ?=
 =?us-ascii?Q?FYG24vV3flkgjA9Xe+sG05w4m+iBLNLTmKLQV5CtBDDZENGfkzfLih8WLKCS?=
 =?us-ascii?Q?5mZKCO2L6wBRENW49Zs8qB0b3JKMIMNSMe2wXa8E8qyixel6HgLaNxDpCuON?=
 =?us-ascii?Q?pkF/30Jt6HiMnaAWbMnhHZiZ4TMx5f8LFnzbsFOgNWqki3+WPNmf+YBpn2FR?=
 =?us-ascii?Q?kVtvkNvZOflPbt7MFMuCzPXiZ3omn8F1l28QDxFvgFqmW4+NbZj8yUZ8+DoD?=
 =?us-ascii?Q?90bdUoZ4c60wTU1dMjb11jZqOttxnSk0m68O2fivLbGHJhvbe9EBB3KDj021?=
 =?us-ascii?Q?MgaFwffKyfM+pBP5hF7Hmt3YaJmzVw5JkLk9O+YkriVE1Re2osDkbPKz68zF?=
 =?us-ascii?Q?eljID3HLpuXHof6a0gf3+Gz/C60OooISPbu1Hq/zPvOdEToC3Oy2qoR5wKzp?=
 =?us-ascii?Q?eWhMoOK5c+C+8fqnBwa7VJK1hBi6F78NAEpsL1PM7oJhie8HWja9cGpKYU7+?=
 =?us-ascii?Q?wxTPO/jIfFsrfFbi/ImDZOYUwATUABtR/R33cBnxqmXkHq5PPx5FYbU0HRtD?=
 =?us-ascii?Q?PWSar2j9K3mhX87DX1SsaO2fYIXDxWHQ8a50PDMcqzAejby50joDR/Mdi1wO?=
 =?us-ascii?Q?rE9bmkf3bjJbUd1MA+sv9XV2G6U7Hkf/smO2jh8q+1AE/F16fmjqhr0D5GWb?=
 =?us-ascii?Q?8e45xWXTAEnTEMkY984FWllUEBJP8B0OTzpg5qBr/eCmMyNwedtFGuqhi9CE?=
 =?us-ascii?Q?HVfyH6FFyJdhj534zyLYQBXtv1nlbgD22nRNC/L2BHo8Mdw02WYGZ7/ofA/n?=
 =?us-ascii?Q?QtQe4ILuQKS4FFuryUt2ekzsQjvHR66d5n9gHyG8ywN5ZuiKT3lXPDs80bGA?=
 =?us-ascii?Q?Idj7mj0zk19QBQKmdxmRAxH9FI4OgoR/qot1eL6yl8tCvrCK/MeeOhyonH0F?=
 =?us-ascii?Q?s4MfJWpP0YLNpMVIlp/n8yas44zngxhpHc2Nxy3KCUa+ZDSAleTa6frZ73mb?=
 =?us-ascii?Q?C1x3POEoM9qHtsdQ03fwoj/HBIuvoXiu9qNHvb0RjpIaPtTGaEf16lh+ZoUQ?=
 =?us-ascii?Q?uHBAr8OLdRSgag8qkOgFbQCDzCoX38XIdqRBZzTeVSgsHHFfitGc0pVWLg0R?=
 =?us-ascii?Q?CrZafnQR6u1nKqRLxIRLaFkBYZWtWHq8ITd1apMp3HMEZA0TUeiYO7FcH4P0?=
 =?us-ascii?Q?wRt6gQJnl/xUTMhER7K8oGuXnYkmfqb0ZzM+YYA8zb90NBFdrH7figNagkiH?=
 =?us-ascii?Q?uQpJjkop+2eW+fbcktbn6vF31ckHYsGKs9JOcjLBmDe3WHcQxbkDho67pfKr?=
 =?us-ascii?Q?ZNOvam6UoNp3AAyzQJJFgnbdSeBVwfgDEHFjzztJfPglI4qZcOpIcRVaRkel?=
 =?us-ascii?Q?BHlgMMfc5U0TxfbYeO1z5p11cU7FhwB6BhknutFGpXpCLRi0TZXkuUTfMExE?=
 =?us-ascii?Q?kModzxKeSstQ+BL2EO8Vj+H0NFdvw8l+qbWU8fC5vk1S7e0YJOHvVj/+lJ96?=
 =?us-ascii?Q?kLk3kUkY0jPWX1ex1T8R/ex1+OzL/NdhBjGJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:24:04.0779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f302c95-7460-4284-2b55-08ddad56cb04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - guard "dm_plane_init_colorops" function when !AMD_PRIVATE_COLOR (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index b7c6e8d13435..580af6e85c81 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1782,6 +1782,21 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 
 	return 0;
 }
+#else
+
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
 #endif
 
 static const struct drm_plane_funcs dm_plane_funcs = {
@@ -1890,7 +1905,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
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

