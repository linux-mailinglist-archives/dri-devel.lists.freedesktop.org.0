Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C275AA4059
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BDD10E646;
	Wed, 30 Apr 2025 01:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hqM+BDSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B88910E644;
 Wed, 30 Apr 2025 01:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hO/g6N+/Okoo1sW8aCdJjhO73m/2aHAhrXwlYFzIYgSmsUQ0hISZWX9DPVrdIWxQmKuh7lhoV5yUZkgOSqKznkg/OdW5CtkMmNXSvELc2R3Su6fH0G3rRjNXiZtFFwr7JwNCa+RcsBpd8Y0nZNu88qMK9DUsuvLbYL4FkiXH6AbgsN5iGUBVB5hNVYS8TYSRBkFoqmr542ZU0dP3umpQlr7/U1Zj1hD6UxWBp6fz+g32di5Ad22mRN7qH0njVeeRj8fdQnQdww6P/kw+FrKiUW9B90hk60z60bUW+HC1bfxs8C1ixtvzdXfu/3VDTZMHXndCvIlKhFpvQXaWhcyV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN4E4ekhqaAI9oPR8QgOYVq8eYFyJ/MD1h70a0WqV6A=;
 b=QekqMculL9Ro1A7W/YjeNz54OiR5mK/XRZ5hlJZGuR/FF70ktaDdc0ANXQENLkO+MB4aaSF694BrcrnGPDsEtzqSNNlLOKzsWC1WoJyAB0Hj8D1SkY9LA2fyNmKZg8DVp1aKAP97FuRWQfKcb2fSNxvD2Uejbl8cndA8v2l7LHIkza10PZgwftcbUDNzrIIpontmvI3TLh6lFkyzGR5b9O1yzD5cJUzeDxlP4+TQ5OVcisSJQa8DEoHO/TVfhtX/YchWrtk/I32M6ucaMsopq5VdkfjuJ7hEQK5uCbHJBr79b6EIQaKqqDo9Va4lunl4qRPyxduLOVIwwRh3PHgZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN4E4ekhqaAI9oPR8QgOYVq8eYFyJ/MD1h70a0WqV6A=;
 b=hqM+BDSmmZ14TkR9ehbDT38mVTPU9kmL997qeqRRIleU+Mn0g5v2tM7IY+1wcjtafsjNQTdtf+OWXMdg3tMQ7XBENFl2Tlx5AL+FCwVxLHgPhfTjvUPDPBKCng+CUewAUYjtx2xNCgFyJrfjBj5VLESG+NBIjBOzKShztDH4oDs=
Received: from BL1PR13CA0121.namprd13.prod.outlook.com (2603:10b6:208:2bb::6)
 by SA3PR12MB9107.namprd12.prod.outlook.com (2603:10b6:806:381::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:17:49 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::61) by BL1PR13CA0121.outlook.office365.com
 (2603:10b6:208:2bb::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Wed,
 30 Apr 2025 01:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:17:48 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:17:44 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 24/43] drm/amd/display: Add bypass COLOR PIPELINE
Date: Tue, 29 Apr 2025 19:10:54 -0600
Message-ID: <20250430011115.223996-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SA3PR12MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c7fc63-e2c7-4313-d660-08dd8784d23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZDnEn/wBYew70w8gTYntoMr55sqMnw3KqvW3wu8Z8GYnEzkuIffQrOWsSFGQ?=
 =?us-ascii?Q?jd513BkEQ0Br6GBZKCCzEACwL4jek/ge73Tgn8B0ahHAFXrxGd35hY7FhECd?=
 =?us-ascii?Q?4iBzVP0hNPO7tDM3LJmKlZRQ3cE2GePeLHMRn3ONaajsO308fJzuckGZm7F2?=
 =?us-ascii?Q?GpIPxb3NNGGh5lsZqwibzdzIm65FMW9piloRDZBE4DZw1uBWdPlhrR9ve9+4?=
 =?us-ascii?Q?KgkeJweL7NY4KFsoNPGHL3TmGIYLHTb1Ca+oTCLkIbr7k1n+zAi7ijflzccU?=
 =?us-ascii?Q?tpMYA0qsNJnf6CD194iI5GL4Dg2kODt+TzVA/JNvPpSLXRF/CJHjBBWSBC2Q?=
 =?us-ascii?Q?tSuLDzK47ueV8DWvsZXgpKYQbfmCcxUyIOpHVqxEkch1dyfH9wmMWlvaAe30?=
 =?us-ascii?Q?OF2Vkw8CvL1jyYD6++RqUCnNQ5vuEuNmtbfIhOY8rK7LNuVTsZfKHO1K3yoF?=
 =?us-ascii?Q?Z9kRkEZFn1u8jvUlDBmXe7dlAtAsetOmK52v859EClWiE7iJVwfO6dcCN8Gj?=
 =?us-ascii?Q?DCIIbXp/7R3BQyzQ3lpZSuFY5N16rLMpxQKslFxf6HO3V5EEh1Fvu0J12WB8?=
 =?us-ascii?Q?owH6tSKmcBEfR+m4F/pazFZxDNNeXGkq69Y7fJL5FmFye8u5wcHFHPjwR8dS?=
 =?us-ascii?Q?by8jONKik7DrjAAeYk4+TA2Q7mcGCc94JDcPaQ0537j5nElDqZzhZvvNGgkc?=
 =?us-ascii?Q?ueZwnJHdORRzqp/EOTNVru7jA/9L6YbWubG+eu1AjzGF42Z+5haxQJ6Ywkeq?=
 =?us-ascii?Q?fYwq86BysuLb08t+IAxVdDVCVJJKmqs67oJc7Q7PHASruklylLb9rs/nlFP8?=
 =?us-ascii?Q?oCqNFn6YkjYQEgR3lfBTibUbe7idESHAeOoM6zEozUNZMjlXA+xpLktyDlHx?=
 =?us-ascii?Q?QGRoLzcYrVXxMKwOpoxYUWQeBFtOOtIHUKg9/10mrCx0vBmOtPCdJqDhy4bZ?=
 =?us-ascii?Q?czcrYf81nUAiW8GTxKIIMheRwKJ/4dwehLUeao0g8+0GryVlZ80QpQLtqcuq?=
 =?us-ascii?Q?P/nONuEATafdegSaOaDn0BZFiPKhvbXwQ+TMHRu/eUx6CWJ0VSbMF13EP6ch?=
 =?us-ascii?Q?JWERVZIQik22Vhg3WHGhUULpwPnGB1f2lf433x22tXb8fK6OUZcgYq3pbSz8?=
 =?us-ascii?Q?RxwMfc7YfH+l9BOaRTAWqzhvcBhaEJzYVaE7VP1rPffdU+yW/maR7Ebnn3k+?=
 =?us-ascii?Q?d8r96u8gdnf3wQ/jelqj8Nrq8tEJRqFihL0o5YM3oYtaw9LQTz94TRTGrBwV?=
 =?us-ascii?Q?owm5Ar8YZMlOxyn9oUKDIksI7jVVP0FaaRagjAeTpaJzF3PABPidhVlXIioj?=
 =?us-ascii?Q?HaFdDzR0vO+10vsvDehejV/FFIhM7QxREWd3e6TDGwlyPq+naAhHoP5KDR6k?=
 =?us-ascii?Q?REuekMfNJ5fO7pcHf+DJgmmm1Ee/1sZlP1IG6krNqe4XeDlMDd2PdTaetEX0?=
 =?us-ascii?Q?pMcd1P3/O6S2UmhAN24OST16KBjD110tAlDSeQq0mwxfuiuX5RXJnUEaf/vK?=
 =?us-ascii?Q?9t8X8byPLUnC94iepJ2Gy3vDw7dqXwolp/5X?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:17:48.8849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c7fc63-e2c7-4313-d660-08dd8784d23c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9107
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
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 3e0f45f1711c..fb6f07603050 100644
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

