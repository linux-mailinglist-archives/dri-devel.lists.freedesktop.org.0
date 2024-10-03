Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925498F7B5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA4D10E958;
	Thu,  3 Oct 2024 20:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GaAwzt3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E267A10E93D;
 Thu,  3 Oct 2024 20:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZQbNCWjhdBN6T1+LHEw0p5wsR+jb+ctDAE9lZBNHqscnWg2yzYWuVISYY8MEm8WfEdipLP/UoqgBCNjPFFy19c7zeXSTlcOMYfCqEPMK8fviEnGKPZy9e+1lBUodbHFXXEHIC1AHO8TUROArSkHLH9jsXnjRjfTGHTPKuryUHkTD9aUsdBALGm61xCKIRXDwSaKHMksG6wQ32a5LzurBw4J42jrqMgLLDciEkXjcuSxILQ+of3RSANa09y1BE1JtIDN66w0d6ijLwr/8BBUEoWNZSAMN984BjBqbgQ/ybQk63yh7NHo2vfwj1SgTVaJu9QPiBK73j8/HjkVsN+7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv06hQRa4CkVxvu8SwVXdopD9lQOA77m2L2Toxla8vc=;
 b=roODEySo5DWXlR1fGffdYTfKL9XCkXYlOzFvJ/Whktu9JL9i0eiZMj8ZlUHGc3MeLLa8BTwy9pNxnl5+lwanM1DDJwEA+k0ATjmvwmd9T0upt4uj6PcpRT8aqubDoV6zwDFfAONmH+NZHVuwhHAIler1E//MeZvVZKD7lqp18Ti6TYAXCj8BwXczgvAUc8eXfLMoohi2hqRY5M4aoJlXRM+U0v+dbaMKIpX3nv5gXmZ9NqcUIo4TtGuqpwLd6J1ELMtbRoOHUdsKi3OAv/ELM9pjGA79om0CboAx1UT9NacsGcW4x3KsGVYLK1ER78uGsDgYs/UhF9ORwEa3Qsxzeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv06hQRa4CkVxvu8SwVXdopD9lQOA77m2L2Toxla8vc=;
 b=GaAwzt3FBM+GU8cUTm0w7vqhRZ0gCaeQLXuFkqEs1ZYCCM3v9S4pRlHox1lrytQZhwMfXGLi/360C2DqGKE5i2P51eMb6gNC6OI9twQ9FehlVlCj+LGydk+NM2CYfmXw/BCXO2iCEqAXZdYYUpC/R5SWmxU2Th+wJB49vl/wG7s=
Received: from CH0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:610:e5::33)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:01:51 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::19) by CH0PR03CA0268.outlook.office365.com
 (2603:10b6:610:e5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:46 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 24/44] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Thu, 3 Oct 2024 16:01:06 -0400
Message-ID: <20241003200129.1732122-25-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 382d7d18-79b4-40d1-347a-08dce3e63895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZqXDnDBtQjkZ85PS+Fi1AferGkvZWYBTMVs9BMWaL1TW2QI2Oe3H+2sML+dr?=
 =?us-ascii?Q?BtSkyzoVb+3JZhbIYGPhlflS0C8qBq+Xd+rGacMnsxjDQT+p60wqCzVAJG38?=
 =?us-ascii?Q?R3mlxHdNDxPlQAZhJDcxMoGUtm2FeI7Zv6X3VywkeYBoJbon0vSeKohiCKP2?=
 =?us-ascii?Q?qrtFotehBkwBYrTj8zFXIvBoVEPdDag0vW20v1NaUtryxiuUdPzwkISF2tTf?=
 =?us-ascii?Q?iLKNXonZ3W/51WBzTy6n9NqwPHXDsKKJLvVV5fBqfXmcaFqg8Es4MrE2ZDzf?=
 =?us-ascii?Q?WMu7eaNxw6tRqLLE5U93guUXtl1nbE7vQVsvGzRNKuoBQ4tSjkLzb1abQMOS?=
 =?us-ascii?Q?cM00M+rErkpGq4ciim4Xcfj+b1ZeJAqiId8vFmO4pkulj6tGdvVBhDyMoGV/?=
 =?us-ascii?Q?exnEas5EvM03Vu+l1InGvB1oKUjAttfxJdo35VjvuG01nrfO9wHMvGgdT7N/?=
 =?us-ascii?Q?YCpgRf8l9sCxbsIQ0V8jicRMULxajdwg0YGV16pXflF9DxBhONVz65+WBoQd?=
 =?us-ascii?Q?XGY8efjXhi/dX+jc2rGwZfjh/LZU0KC3Gg78hFBT+Yi1JZX75ud+Xxjfleaq?=
 =?us-ascii?Q?U8VckK08f2x2Dzp73QkQ4sfWJPYN/pWtrpqPKRqvRNyb7FfAJ5q0w/wZ3jCj?=
 =?us-ascii?Q?zyaYKRs0A8dwsPGMmuuRk19t3c/8QxLrZi66EMnYxnD+BLmyL7MLtltA/f+o?=
 =?us-ascii?Q?8q6DrsIgGFb8Rx7cZGgb93xFnd+2WxvWEkPCyHKLe9p1HTLH7T2bn0blin/F?=
 =?us-ascii?Q?oShoaZAuch/Q6265vI8uLCZlpukaHDcp8y91bFXT+2fboav8KEPbhwJCpD+E?=
 =?us-ascii?Q?uOC32HntT5xe9K4EPayh9oiO3ggcGnnqMILmgXYM9Zy049cWlUESvnQYW0YZ?=
 =?us-ascii?Q?duMRp73lkvPBVmw0NVUf7JfWg7OG2HMUZLqlMSxHJjyzgVEFjKJ/zbbrSvnH?=
 =?us-ascii?Q?9kEEHc5BRp1m5DWGZr1t2JFyXv/4F92MUo3wUjPZNHDAYppfSr8UxRdq+Lvp?=
 =?us-ascii?Q?jyDEY3q7yrWC0PwQymdCIzMy8k7lzLZ/Ax5Eqt15X46QStOS5U8qbVxSidU8?=
 =?us-ascii?Q?GaA2t89mcbXEGaxVIPz6kUfPSNqzIMDjUepDQtBZqmnp8fpgCCcW4vf55qCv?=
 =?us-ascii?Q?Xcn61LPSx1m3FiRzpv9fTclq+N4viwu1+j5mzipgabr8SizabAZ1j9UP/Yrx?=
 =?us-ascii?Q?RjkHBWnFD6vDGNsNGogQSSRjLTRC8OeWm7xk622HBYVLaTkFO0N2qfrZqpaB?=
 =?us-ascii?Q?ZCC4lBGPJJtSSVDzDVY7tORbcL/l6sZtZJDdkt9AhxawaJREZg0jsk49Sa3W?=
 =?us-ascii?Q?r8ayITRy1w7ubq/OEoRR4qdO3zsvVmFHz011jSfvLg1YVpDOFuuG4gc8c/+u?=
 =?us-ascii?Q?CbK1d16Bg/hWzPGwWg1bRfING4MJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:51.0115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 382d7d18-79b4-40d1-347a-08dce3e63895
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
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

When the plane_color_pipeline bit is set we should ignore
deprecated properties, such as COLOR_RANGE and COLOR_ENCODING.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6e79028c5d78..575eacfc12e6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5420,6 +5420,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
-- 
2.46.2

