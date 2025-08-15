Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7375B27760
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C4F10EA28;
	Fri, 15 Aug 2025 03:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KHDUHd4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B214910EA15;
 Fri, 15 Aug 2025 03:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNv0ows34jRF3pda5TKMGVKTUkPnT7AoioFAQLdnMgdi7rLvUldCWMo0UaGCGwXw/YBF//7+5XEWGqOR1SLvCYPhpAvQf8YnJcSiJ2eZMIrQB9morzq3bQzaWzlkYDEw2O3Mw5kjtLeQitjaPZEXqyOBcLIRFE5/DZqBDRFvm8fsBGOILzpH5bLJ95h/klSa/fsVBcdp3vfVVjkwNSu0pzupb2Bf7CSoIV9MnHv5ftl80EVTthiUP9x3xnuufZHKwUVy0mo1UVKiwrkbdqPT5DmZ1EP2VsugYxVMqgZhOmU3QxLM1ustBqouekOjzCfpXHaBN+/5wapeR1XkVTacfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prIMzeFBT4hG6QXjSESHkH9W0ds41qQn69KV70XHUm8=;
 b=FzAhl3G0WTfEvo2G6ziLupS6/06AkK56ltmjl9HtxzHAjAC11UXikLeipIz5wALP1T6JzPLIYJtzMMg9TSSp4OnARbebWUsJjT32gqmmsI3jGJThcr1kEIbTJiUGEbLqKfLBQIS6+PxlgLwpVMvSM32r3fQ9AArI/K8qGmq4pRl6rNMKpqT1eptASVMGyI9YGYuE+h3fTINQsj1/Oj5ZkfPm15CkPD5j4TtmFsUgK1amrtl9gdlIFQ8QqPIY861S1GS+pTp0fuFXyoo4Yg/cEG0ZFjbHsjH5G7OyJvPE72bvzfpoY4CnHM9YwQNABGNiiFvaEM/j40EIEQOi+5a2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prIMzeFBT4hG6QXjSESHkH9W0ds41qQn69KV70XHUm8=;
 b=KHDUHd4LriR5hbjlPtzx9pGsh2j6UxZlIEO0beY+8hbnQgeQu8EowKzQyOYW6tsoNgL0yx5Etvby74Ls7k52ChFeuuaRb9MlaPACWUErmudGP5cIHgworeeC6Re3vxMdgl+LnUWP3KlQ9zGCsLRGBN6B9uremmyd3wympoO+5eI=
Received: from CY5PR17CA0012.namprd17.prod.outlook.com (2603:10b6:930:17::18)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 03:57:12 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::47) by CY5PR17CA0012.outlook.office365.com
 (2603:10b6:930:17::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:57:11 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:57:07 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 23/47] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Thu, 14 Aug 2025 21:50:12 -0600
Message-ID: <20250815035047.3319284-24-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: 515ac44f-f338-4219-f05f-08dddbafd021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H1/oLfzrDvIzcKONJRVODEJNHB1VZ4wQq69Qq1nrQgqLyeWwQaoMqH79PwZy?=
 =?us-ascii?Q?oPT5ylDDkFNst2G5ew57ecwMmSI9CjlxblPX91vMg0IjB1pHCXxjQUk99Ahj?=
 =?us-ascii?Q?7RtEB7LGeq10uEVEwHooF10+hcPu0mAUFptaNwRHVAVFYa74uf8G1DP6f1rA?=
 =?us-ascii?Q?cvxZJ4AT+9hu+FuI91W/S3i+H/orF0XQrfL6F6A4EwsuRJiXbOULlF/awVMd?=
 =?us-ascii?Q?DAOpcvsP6z/tNrV6H1YAVYkymd+hVJ3pIKZDeWqmzMIMEkuzn0olvpl/PWNe?=
 =?us-ascii?Q?aaLUKuSncHoZ4kAqS4P4HAPLHNiTjQfCJWqLcQezVscKUJQlO7sS8jNqr1uZ?=
 =?us-ascii?Q?Qn5z6wtx3bMVtaumN498je0wb4IDD4RrAksDTdYFV4PBx4ELHhuMLV+Wxa3F?=
 =?us-ascii?Q?TXX2p80DwHuFxkxLw+yRLBx4WRLCDb9jy0hVphHbeIpPfvAtAfQ5Mnfo6Ztp?=
 =?us-ascii?Q?QW+XkPxfGeXrCi1TYz+0LyBIOHnUel86FRKlfrrOam8azapUYmY5SIBYbG/2?=
 =?us-ascii?Q?sn0GuemyztTq8r4+2fDbTL5kVxdELUY6V5DCUlGvEzLfLGPgHWqKpuJg8rGT?=
 =?us-ascii?Q?uPvfspMDgRpkWRH1R4vIKI28zCHauSLL/Jkcx9sdezuph8zClCOJLlz9IGXq?=
 =?us-ascii?Q?H9x+Ogx0923E2tkKjqqOXLQUbAd8rXWzvjZ4MaLPe5YbVuc0uz9n33JPdFQ0?=
 =?us-ascii?Q?04EWAultEX03rmlnx7wsbSEXTogpMl5vNeX+0s2w0RYyAMrJVCZn2LhS/iQ+?=
 =?us-ascii?Q?/BN0tUWFmpWbXcISH7FSww9ejX7BTwywn/W8ef9yCoQ495Jf/rAobF3qQtU4?=
 =?us-ascii?Q?7ipAEl75pe+s/h9QxgNYhaI61pb41irN4Bedejh+2Zw5098oMbw96XcBFrh5?=
 =?us-ascii?Q?Otu81J0dfsMx7m+ikcwK1w9FruLXLDrKQyvhGdYBNWhEYLT+scDer3tBroYz?=
 =?us-ascii?Q?F8uZjKf7kJLDh47u21jT6GVlO1+T7nVd+UaAbAwstl2bGlagvBzQMUl8GbP8?=
 =?us-ascii?Q?ASfTXwygWBlGxk/ukfurgiE8tw0rqtGvBPWKIFR/8iCSlsJChsa9J0RSkete?=
 =?us-ascii?Q?L3XdUb2ZS3vZyu5VyI8+xyj+9dU9kJ7rP1KKvSo03jbopG3WvUJQKUalxBLi?=
 =?us-ascii?Q?/b9gaXpRMBWxM2pvoD+pjMjM22Td5waQjzPs2WH9yrfmo+JWHNzZyB1FsYvU?=
 =?us-ascii?Q?GJ0GYgKpZ6gmFUSuRmvrrL9pyYefkg5rYFI0Efh9QkbGdoSS+x963n0+Oa1T?=
 =?us-ascii?Q?Or+BY5jtJ0tOZc/pCNin10k7ytOyZQGEQeuPkIqfhcz0VmLm/t2VlDDAANXf?=
 =?us-ascii?Q?AHBTDxRWhBEidAR+OUqfFef4BPGITq31eFbU3QIFPfamHyIWxjuoCRBnRDbN?=
 =?us-ascii?Q?IT0/NZ2SRMDsbh82mfjU9GShS/0kL1BJlUE9myASk5yphzqIcSk6tQ1RM0fM?=
 =?us-ascii?Q?acVSgA5c4yO51Q7y8WRjPQoEkxx9FLKh55zQncJc8perdPxB34etL/BzVR89?=
 =?us-ascii?Q?XYCEjX98Iwb4WtdAgkviVE4r8d0XwmjkSfcg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:57:11.3251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515ac44f-f338-4219-f05f-08dddbafd021
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235
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

When the plane_color_pipeline bit is set we should ignore
deprecated properties, such as COLOR_RANGE and COLOR_ENCODING.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd0e2976e268..cbd9ef23329b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5718,6 +5718,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
-- 
2.43.0

