Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8582CC1E452
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95710E966;
	Thu, 30 Oct 2025 03:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IDS/MuVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012055.outbound.protection.outlook.com
 [40.93.195.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D7E10E94F;
 Thu, 30 Oct 2025 03:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2sMkWkm2SHtNgpzHhrQmNfUBC8IArfWn42/N3hnp6bQ/HC9G9wI3/ELR/+X3C3ZHA+7aHVAMOVHgmGUgha82ztExIvzvs1EkLE3oHUw12EgzurU7zA0jHB5f7J2dAVkiCydmss703N+qkernVfzGioB5it6WBjOsdkupQxeiVjAiLuax6gd6zqGVEtl81dHLPEXtR3EWaqo5hjhWEFEFV3Yp8qdjT/VTsM/YEZnC5fbyUUctux0DenHun6AcCaqDlziBYKWPGu+y9xb/vBRvBdNlOo81vICxkm0HtbSXZDqng+CF2uEW21j/1KnhKw2yA5ieVcnQUXX7uTXmEW2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny7nv1YtFORs7hv8+bovEZnRhqLqhGBzX5hD50+FuY4=;
 b=kF1rbMEFSaLtOjNAYhYBwuD7SINIRr4mbkabR36Mh/lEVbQn1VGrdGz48lwCuD6N1Wimir9zYdWXm45KloWNgZbLB+JpJc1YAhpqm/O5LoxTQuvrrRN626gC660yaxWmb0g8P3iSHNoAJyFC1xzFiAwIIBX9r+W/ngg3jrytV8FhR92f9d20EUNsySZM8YP/1aEQewJ/LmCGg4WfdoL/ZniD7hY6tY6GrdmNXp9XrDpJq2vuiSe3Pa28EwNfJp5qzY+mYoxO6b6qXx7/lLBw8q5GUCAQZNUNT2x1n5sVHRUGcNuFhtVvuPOQfabPqH9UPL+pAAofrC5KGI3VibSu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny7nv1YtFORs7hv8+bovEZnRhqLqhGBzX5hD50+FuY4=;
 b=IDS/MuVP2CizEIbUnhjty5/rlMmXIlAV721px+ACDFXaWuTJ5WdRSBA47XbDMzihE67gS34Wq8YhYiGjRfGWdxESWeYgmj2Lu5v5ilo6sb21jKbPzLZ978Xkc1j49/spi0LjYZnd/aG4j5VIteRUze5cwgoPfHZ83f3t0LCPgu0=
Received: from BL0PR02CA0109.namprd02.prod.outlook.com (2603:10b6:208:35::14)
 by LV3PR12MB9096.namprd12.prod.outlook.com (2603:10b6:408:198::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:50:46 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::4c) by BL0PR02CA0109.outlook.office365.com
 (2603:10b6:208:35::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:50:45 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:50:41 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 24/49] drm/amd/display: Add bypass COLOR PIPELINE
Date: Wed, 29 Oct 2025 21:42:29 -0600
Message-ID: <20251030034349.2309829-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|LV3PR12MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: f759eecf-aedf-47c4-8a05-08de176781aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OYw7GPlSumIVVcD2Nxc/bF+uSW6kf7DIT1enrr1Vgn5MbLKwL9Ib6M3hh5kN?=
 =?us-ascii?Q?nJQrGqfXTkLClQc/aZxB4BcxC8RdSGOVIf2/J/zB/0Qs9M2XMujuNU5/XQbZ?=
 =?us-ascii?Q?LLp233EfmPvPINy8xrYCkBcKN+46iwsj7Jr4MPAQC3DzL2bZ3rHnmzqS4+OR?=
 =?us-ascii?Q?Lvy0pz7EvMKapmj1WymVoSCcPv/xO3AjXDTGs7j/cpbS4QDxBv/NoLIHdPac?=
 =?us-ascii?Q?l0oDO3s/6C7Bd+DplG01aVrz+b3JRCS91El7C5zXDdYuWLTJdztctAbEwh+u?=
 =?us-ascii?Q?Vh4odH4YHlQFBNvz35PcR5E10jzHmEggfFUdnga5DWWjaMqbbpfmcsynPTwg?=
 =?us-ascii?Q?EB+0VVlJqK8CLyzN5rY7+PhF5TESbBo/hSZgeGDS9jAkOancZBgYCkgAXJNV?=
 =?us-ascii?Q?lL3UhLjeZS0Srca8MltAc4laZlpu1X3TE5i/Dl7nkiNC3j4o9lk0am0tMkMX?=
 =?us-ascii?Q?Axiph3oZNzkb+Ik/YHgIBDeHG1CT1hOpIY7fSFYeSIpOpa0CcfCj4G43iM/V?=
 =?us-ascii?Q?1d8P3aBvV/04zERmp8OtsPuPsbSLk0eES8OlogzIdb4n9TPZgO0XMO05N3pz?=
 =?us-ascii?Q?gxGWUIib1Pj1oLlPQtlVabFlhNONb2b4jx2NSFLF3jRl9F6EtrRZ3QYDmi+/?=
 =?us-ascii?Q?miv7jENtXW/tnJGOfct/SZcJyji4/qFh5hLH7pwyOnjRBiULRUpj1OaX4Cwy?=
 =?us-ascii?Q?MVXEmLPMbzzco28hXxPSXrAn/fiOHBhFIKjfDr0DKykInLKrSK+lebJ8AI6u?=
 =?us-ascii?Q?I115cgjhfbOro8NU0KmQcTgEqOi1/bT00oJ9xyDzkI2z7JQfDW6rIDBf/XOR?=
 =?us-ascii?Q?JhN8wkx34TtyfsKIV1BK5PAS4LDf9if2MYveKJJgG+f4P01CauDrAQCjQ1cD?=
 =?us-ascii?Q?omDRapO+wK0XXgo/EggZ3ApsfxvfdzBcT0A42Tl+TiRNHNmAnsP9dMMiRy40?=
 =?us-ascii?Q?ZVqaUlGNwCUbXlB6lz0fnpju55wg5wZpY/N3RYVGU84p4KoZgOdIBU1erZ/t?=
 =?us-ascii?Q?qBJWukztz5IRDSjJKthSWL+G58i3FqpZCI1VkmTKRy9/95D7sq+A02XgK5aD?=
 =?us-ascii?Q?RAGdqG1ws/d0SowY0W8xB/HJAKSkUs4m1oRpAecGwl7pbwKcuVbXru62TFXh?=
 =?us-ascii?Q?ZO+nrOp1TtXdemVvtOwmc94Iq18li8uXawqlsttIIK/ejnphykhMX82WgwrZ?=
 =?us-ascii?Q?n2Bd67WgKL2muzcUyFKelFYk4suaAgUsReq2ZHB98xI/gUBsNPIc0g5/KoCW?=
 =?us-ascii?Q?pBK6/TIb+cAPdPLE4TDtqGLESoihbleZRBthIv1b+2YpWIAByiMlRq/+/UzQ?=
 =?us-ascii?Q?vM+n/lzU7NlTM841286FpIpCPlTMFVpNAnL4Uh//mphqbnJMDc9gO7jYbPdF?=
 =?us-ascii?Q?m28YsJcJkWOpsafjQs17N7u7TrrU3vW9csLoEBEhiceYSorRoSJMTUrIutoq?=
 =?us-ascii?Q?we6DTxXwxrc8tTZ49fduXsP1qd1xEs3isWYPSV7v+kbPMJnnBFC60wQiCcFq?=
 =?us-ascii?Q?C8LwHbY5dXMo3M7wzUs4YDeagn5wE1NPqKzxdKj3RvhY1ilfGQZiFU9h01ai?=
 =?us-ascii?Q?LKfJqhR91a7BrAcXn4E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:50:45.7276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f759eecf-aedf-47c4-8a05-08de176781aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9096
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
index e027798ece03..877fd221c81a 100644
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

