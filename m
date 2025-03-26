Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228DA72791
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD8810E811;
	Wed, 26 Mar 2025 23:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mK6W9pzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14A210E816;
 Wed, 26 Mar 2025 23:57:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Je8DEH3k+R6RfKoMOeb/uiRdlDU0XPLODhtN4g1bvGmmwO0tr2/3/uNwUIa9NXriwuZ53Iq5QMh/eoMvK5gsqXOKKKE4bVIcmRqlEkoZo0kNZoON2mdEpPgCrhIQ8VftN3EX5XPCQlKGBYI8nS5g41BQC3g+VmbEJ1TlJbAljBsDUOebin6u1ig+6BQwOMFRGIHjfhg5rT+wgr7CgZtxhDTglt1iiRrRK7GRHWkk41tV6IKbbsP/tFTu923X3uCEZdE/GSOqq3m5DsoIXLp8d01jmDRl4gndNx0N5m6dUy8BtnOm7JDO+37YXg1OhVywaoFBtGB5YTaW8Nr3VRs9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKoh6jKuvuoC5BC7afqJaUPlo6mKbK/WdstT9cQh3Hg=;
 b=D4N21pk6BN5vOkdIf9tcB1y2FDA9UJ+fA6PzBBv7HpyC8JG73tsqvHlmflOnyhkAYZ7kzshH959zywl7Avl6OO+Qa/ddqYseRTb7+1g9oTaZyf5xLQvf74fremB4d1yRi1q5ZVQCvOA1jZ7yIwohbI0ANhFp2/rzj33XYvnUNf5WB+EyeDMOtn0i/n2AGYDFpBp7EHpw7pS5qEH8tT3NLALPgnkWBU78CdZMO5SsWW6+wMG7o94dupXriRnCjKa8mc/5seYGsSkLBKDARl58zqpRD4UDESIIqQmByBGWXd6IlaV0xkX1cIDB7lwRA/ZOSRf4UJ+ir2/I7KXKIoEbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKoh6jKuvuoC5BC7afqJaUPlo6mKbK/WdstT9cQh3Hg=;
 b=mK6W9pzdWbA0uOQgXTJJM5XF3tn3fgExG+Mdqssb8C5QTrIZ+gfW5zxp8xykCwhZxgwFZw4+9E8zlCz6G19ZuM0xlKbI4PGEFMionD6qQcgFj6TuEj0kJQIudTTOmNUhTpNy4iXUKhRKG3h6TBI9oH7GrsMm1KBND6kXc1xjy58=
Received: from SJ0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:2c0::15)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:57:20 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::54) by SJ0PR13CA0010.outlook.office365.com
 (2603:10b6:a03:2c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.26 via Frontend Transport; Wed,
 26 Mar 2025 23:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:57:20 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:57:16 -0500
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
Subject: [PATCH V8 37/43] drm/amd/display: Swap matrix and multiplier
Date: Wed, 26 Mar 2025 17:47:18 -0600
Message-ID: <20250326234748.2982010-38-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 6931c94f-2593-4360-e730-08dd6cc1f23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ye/1yzKG/LOlkRCeDb7nQdnJ2ygmf8lG5j6CpLzjq+o9jLXrumEHZNahTiQl?=
 =?us-ascii?Q?kmZGYxer2ZDQYV/p7bdVihk/3cEi9K9X3L2wD8OZQTexm3k9KSq3/lQJvZY8?=
 =?us-ascii?Q?8lq6fMNEfKWLtdRwMtNswjkVSb9g/Wzm2NEzI5TEG5ZcsTYTE+60ZP+wt/AZ?=
 =?us-ascii?Q?m7nOeQJK6IdUHVBhHRKlkBoI2d3/YZq4RUgEbtRqDsY0ph1bvs50FBcS06XE?=
 =?us-ascii?Q?ZE3SYzNaXRHtBYK0d3XyQO8oArdbAT4xdbV/HOBaDV5ddXrlcK89JVxOqJVT?=
 =?us-ascii?Q?ci2u5GOrUhJR7dEFF8Q66GyJb0UDX0fb1UEQnTx2P9zgvcSRfUunEvzknxEI?=
 =?us-ascii?Q?a4wOh82vMmtWzULbV6wkinTQf2hiT/TAKq//XCcDE8vhpE2gP92k17fCLBQj?=
 =?us-ascii?Q?neTlxEavM5eQqsdMsZ14H38DveJkKBVGYRWgCd32AfD5UOjhEEoL1esZLcc4?=
 =?us-ascii?Q?qSaSeFze6AxlyStJPuIxICGUXqqWGE+mbx7T19/XUkIpSC0SYfNaHGgjm66a?=
 =?us-ascii?Q?GULFdNQGrNTf832dPSdQc6ydna4IY2kf1c5u1oJgpxL83Z/VzrPlg7pjTWwy?=
 =?us-ascii?Q?Gw67Fh+cX1LFE22IyA7JqZFVcWcNqbEnQ5MEQtclWJaIuKNCPs2X0H6fTMCd?=
 =?us-ascii?Q?N+EyWmjJoWSSoMn0RMm0RQWX4ojuG8jB40s49ip4zu7xdVwMILzSsCzEq0q1?=
 =?us-ascii?Q?PMVWBMoVN19nFM6SZjEBEYaeBwmULlWRHipfsVxS6eZask/afpsViH6cRf8B?=
 =?us-ascii?Q?KuXrrUEn0SZD6MgSTt5ncpL6UAIRjsz/4l5FiowqRENYgi31WQmxc5K5QHLM?=
 =?us-ascii?Q?SD7pJeoWRqtNPulkFFEMy1B3nNx7OHBnBJbSOj6nDEpraTHvM8/7myo/4r6H?=
 =?us-ascii?Q?stiLJmvH9y02IqR2Swo3FM4/qlWktGWLer3Jh8xVXwHgnTsh8VIcBWy7cd9U?=
 =?us-ascii?Q?ETOG26uvYC3dVFmahAEHmcIWHuzDiz31n0BuF0hskieOCOgGOeBNdQa8BYon?=
 =?us-ascii?Q?a4fevVvikowS8MQZ2HLDQAQXWEL8Ofm6qWLpkm1D4m4LS1jsqyKtePwBzg5d?=
 =?us-ascii?Q?VgWXprLrxnERfk4p2ufZ5r2faAkyU1YMJrMpiBMXWvJJRZcNPTylf8eWdADU?=
 =?us-ascii?Q?6qOlrew1ii5fTB/Y4UAHlRK891uuv7topy8jOc0u/taeZLdkDK0xQL34qlbN?=
 =?us-ascii?Q?I5YS0IbEL7c1ACtT1vTp46p2utx87nA9OumWuQmnsDsN+Nq8XNUiyLA+5IEz?=
 =?us-ascii?Q?jmFIF6YRghR+N3U/j7K2mARdrLa5BO6QLYo0ccs/556M6XUCo6t4oxPvhkev?=
 =?us-ascii?Q?7ffytUfZ5NDTbpX2s3+Hz9kbe0nHDPSzcnWwqq8YPHlBJ5HEX7YzHMZKJfRy?=
 =?us-ascii?Q?gytTDh/1rV/DLgu/J1MR+ZCcHA70gbVpPT0Tx2pOmhTZYcIGwMo5sxoPLCyh?=
 =?us-ascii?Q?3b2ivUIAeKf6WwSTK2hJ7AXGp6CalW5RVa8H7yXD9dZw9fz9D3/dxxKh44Bf?=
 =?us-ascii?Q?cyoqasr83fmYn3c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:57:20.3506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6931c94f-2593-4360-e730-08dd6cc1f23a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758
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

Swap the order of matrix and multiplier as designed in hardware.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 12 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index e3ae0c32da2b..1bf40f39bd0c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1484,25 +1484,25 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		drm_dbg(dev, "no multiplier colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no multiplier colorop found\n");
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 33156531d751..d0777691862b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -75,7 +75,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		DRM_ERROR("KMS: Failed to allocate colorop\n");
@@ -83,7 +83,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_mult_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
@@ -91,7 +91,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		DRM_ERROR("KMS: Failed to allocate colorop\n");
@@ -99,7 +99,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
-- 
2.43.0

