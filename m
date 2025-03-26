Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BEBA72776
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4347D10E7ED;
	Wed, 26 Mar 2025 23:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vPprmz7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C59D10E7E9;
 Wed, 26 Mar 2025 23:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLVy7OoKJyek311Q7H2cjPIy6zLwXc31gCOKMBM8/C3aze91Et5x4zkAG7zGBTkhsPFcEMaP3uMU6kHJYaf9pGJkpSCLxER5mhGoJB9NO3JRJvlj1Gt/9kMeZ+JwdLhaH3t1ctvYYeFSk75Ay9om7+RTJxobHMgkhPEzIBtgh4cwpePNTULKJQkbwUF+135ZdlJJpG79H7VbVopCvXljZlTRYo76tXodJg7SIb5zWNJp6WmtiR3KbTGeVUmXkejWVLkhUU/Ao2lMCasIN9GtqIbFVxeEJizIYoQ4faKnTA00W7jRKZvAUyNGBUdm07OBr9WNN83kuX+XCtElsH2qZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYnmbRop9eF5mKzO2wQhCbZFPKzIcR1BY2/05eHi/hM=;
 b=oMLaiqdPdDmQmIX8BFJOs0At3B8Zb1VDk0f7ZdrWw9nVRwpXlWbUZcp2WcAWzO6vn2+0nOh/4hRf1L27//q6lb+m96vj4TNEyf/ozYbkkH12eHgEQs3smsYPtr290JvTFAhXqzo6D3RwY0KmYeJhoL3EicApd5qPcXHK8qhbfi0kCiFtJN+zSvPo94OW7MHLogZfL+OvflntO/aKtNDZZAc/lt+E5dR3udl57zpCQQcqCG0pROQqfg2+9/ltMDQPS+50cDv47v58Un4DEhuD8P8dz30Cj5x9ozfBDiQgqcnVR1HaB6ZyMSBfdQwquojJJMsddBYlB2YmDT0apRJFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYnmbRop9eF5mKzO2wQhCbZFPKzIcR1BY2/05eHi/hM=;
 b=vPprmz7qw5rkIQov4EQ8M900wVkAJFRAPU8oyXo7xaSFQUBjAfjMlLokhMpQAfXiKicdKHrhO72yX52ue9pFqqzqhif4X0m5Fpmbe2SE7SJOJrprdH/pi6s8fS33unWamTL789UJJtct3zhYbhXZplXXYid3DfhUBMZ6RhjwDTY=
Received: from BL0PR0102CA0029.prod.exchangelabs.com (2603:10b6:207:18::42) by
 PH7PR12MB7330.namprd12.prod.outlook.com (2603:10b6:510:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:54:01 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:207:18:cafe::aa) by BL0PR0102CA0029.outlook.office365.com
 (2603:10b6:207:18::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.24 via Frontend Transport; Wed,
 26 Mar 2025 23:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:54:00 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:53:57 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 23/43] drm/amd/display: Add bypass COLOR PIPELINE
Date: Wed, 26 Mar 2025 17:47:04 -0600
Message-ID: <20250326234748.2982010-24-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|PH7PR12MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 7630a09d-14b7-425a-cee8-08dd6cc17b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTORr8UnqbFicByA/TalXgsAUmamCNbkpoT8uOuJXtIJsGRGVW10/GnolfhR?=
 =?us-ascii?Q?GdyX/b+vRHZ3Mlzyd3Bucp90XkMLKhZa5MUWvqlfg0QzDCodlhe36wZ8buD7?=
 =?us-ascii?Q?/rc7V/DMc02L/OoXQMYBeBP2d3F8VO0vud0Jgdgd1a30CrY63MA3nyMP9RX6?=
 =?us-ascii?Q?kOC9IojVB8Li3fVCCl19tceizI+fQhSpPGP5zKdeZWfxw8I1yrcz8icD/dU2?=
 =?us-ascii?Q?d/pXplP4ARH8lDHaSSv9JLDg50UjdRx7ENxWq7PelKSXNlW5VDbD/1KIafTd?=
 =?us-ascii?Q?+9j0xYexmtVa+38ulWKQZhBvq6IInQXQj3qklCTh3L1zPWtBPdAAmEVl6yvB?=
 =?us-ascii?Q?WWcnahmniK5gNFcgUk397ZepFPAJ5M0qiGXWpn9qdFY7jdQUUbNIRowiXSFK?=
 =?us-ascii?Q?OvZXht28kbZ3AJVDlw/sFWP6TZPbmRPWgdeP3p2ZGE/ez8VRTMLNm/vBs9u8?=
 =?us-ascii?Q?ZQau64aeoZ9f4ppzhiyJOjz0bj7MU9GH6SNYSZffI6k+mWQocmOmBI0ZLsSF?=
 =?us-ascii?Q?QlhC6w2uEKzoRluIWrzRohZ0LLV34JBVv3WRL/CNCoDy1kfs6UI56mgAwpwk?=
 =?us-ascii?Q?d4Qv9pfmfthdW1DrfEXWQSc8fA/aer1EJTRWfUcpUjI7OybSBPFDJxfiWCHY?=
 =?us-ascii?Q?mRbRqi6sGdax0PXr13IZLrpkeIul0AVGWgzHDae8efXX267xY7nP3umRRu8E?=
 =?us-ascii?Q?o6Rm+nRzcdfPKWcQWqrrHsy9qIY2bgqiNMDew+6mi9FnhvB3kaCGMJx8X9zH?=
 =?us-ascii?Q?MRcP82bU4s9T9nSzS10ppnwpR4uBqxsh/9HELFpOp7VUumdoaXJKDf1RCAqK?=
 =?us-ascii?Q?D/TJ9Dnl9jC2WqYFSsnLerp5eWzeAGMTx85FwGS/Cx9GedFTt6LXsHcOwHFp?=
 =?us-ascii?Q?ubqpWbdAIJqwIo/35h7LeosEpdUVwtmoGZGYvWIlaopX4boFiQc8Y2oUd0Y3?=
 =?us-ascii?Q?lU28IANHDcJitehksOxjMyIhxBHOT7te8HexzH171V1f81nyr1H+lTPbIqIE?=
 =?us-ascii?Q?7JLcFNmKtj6vA/l9SaTGFUbW336mtHNsQxdu2wC/FSCpFHPGkWjY/uGf0t5+?=
 =?us-ascii?Q?xgsKYP9V/XM7Hc5+glRqxMIz9IOhMkdb4semEzS12NN+0XOH3U6dcNT0Otde?=
 =?us-ascii?Q?q3GqeMw2eXWXDR5n90c7f8wFzjvMTufL/uMWwx8gb7trG8mjV9KV5npIkosc?=
 =?us-ascii?Q?PMOpYxGit/rm0mBzDszKNpTdQCqMbsQW6xVWEBUbuCYJ4HMU3xph11Edoc68?=
 =?us-ascii?Q?1YwiO4OjROmsEBIUx+JFEHVGCtXsUh5KCfNU98HpfUnJpPlI2px6Nm/ajHpV?=
 =?us-ascii?Q?1c6wcSz5Oa81Z2NZnp/kkv52LDMbqyYIsMvVUWbB3jP15j2NFaPDSQckLWNC?=
 =?us-ascii?Q?qHLpL2MQeYuZKPYhn1BWdMp0qspR91GFszEOTwL347PX5bQdzLVJfSoAM72l?=
 =?us-ascii?Q?3NgJNIk4mRqAYWyKjWO6U1VlKRCHK2FBh9x9/ZiLvO5OJ/ONJP/jjCyopYM1?=
 =?us-ascii?Q?xWufIYEQAeUtyO0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:54:00.7097 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7630a09d-14b7-425a-cee8-08dd6cc17b2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7330
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
index 0090e08d5057..9632b8b73e7e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1784,6 +1784,20 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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
@@ -1890,7 +1904,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
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

