Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C89AA4058
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7343910E643;
	Wed, 30 Apr 2025 01:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QrIz/qkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD9F10E63E;
 Wed, 30 Apr 2025 01:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLNbtVJqGqgCvnFXb1hVyQz5QzSNQ7dcKTpX9geM4PsIgLDOn3e+rzj+P/Kqy78TDjD5BhrropYgealiLxu/YUOy5eJ99zZHexvPoJJtY3g9P0Sbkv5+9/llXiupRBgNKKKmH+/4Gjq1at5gYnrsDG9A+g75C8HimZ7O2Q7JXKj9Kv/Dx4lNYQtsewsgd2YOL502EAeVzP5dBoAYrYYTMiue8rkVO11OIPGizCSgyatm/a/Zf1Cd6jeIg1R1DZ3HqoI1gajH+EgXWExiQaWHU2+5oPFckQ2oBjw7OuQcCDY/k9JpCPGlRqlc5CDnxnCNkwlaAXkH0tM4CFgRhDIpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/fDi3BcuZ5d0wmHQisTUISth4sBhGTVBM2G8VqzYWM=;
 b=U3Bp2ajYR+3wmoCg17CMJZqxVSUo9lOCp7+geMMzQX+DEvIoNU02h1Gzy7tS1Iy3kQCEm+C8znFzKdjoqIpzQtvfoUhoYnZdXGW4irE/xTN9qokIFWNkFO7+7THkyHFq+gx4ITWd+HkY3leaw5uwoJm1FmA342Pft3OAhK+7mizLocGr+GvA5Z8g4YE+GJCM6pebc0qwNm/5l+rhqYwZd7Lhdhm+AYWdGEYabCNvroJS1pCGEFBT4Dqa7XqO0S15rYnd91wtqCgJr5voiPRp0qXpmJkdYULwhq1QrK4FCAH7a2vKbHyb8MhITWIkzVrvyyS6JkBN14VznWO4C0Ul2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/fDi3BcuZ5d0wmHQisTUISth4sBhGTVBM2G8VqzYWM=;
 b=QrIz/qkKGLP1vrjxyR0Qtic5WQ3WN/onhgUfTctlq9cHfhKZ41hflfpLD5zre/oiWU3Gdhz+iJDuB4CC0TjCFLvH4hHne1mqBybu2/s8VAGk8MXfnOawfsPriBTAhaAIv6mdj2hbO2QAxnfvWhKh26ZKTsoMpybNHfcQy++qfeU=
Received: from BN9PR03CA0913.namprd03.prod.outlook.com (2603:10b6:408:107::18)
 by PH7PR12MB5655.namprd12.prod.outlook.com (2603:10b6:510:138::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:17:34 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::2) by BN9PR03CA0913.outlook.office365.com
 (2603:10b6:408:107::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 01:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:17:33 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:17:29 -0500
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
Subject: [PATCH V9 23/43] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Tue, 29 Apr 2025 19:10:53 -0600
Message-ID: <20250430011115.223996-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|PH7PR12MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c62f0f-b286-435b-fa90-08dd8784c91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NiwXWf7tmxg4K/gb8kLSxKFS+MxZuEmuPKjuG23vNs1D04jmndwX/IjRAIFh?=
 =?us-ascii?Q?pX/QrH3JSNDf33wQZIqDTOxCFYcVNZS2j7it7g81U7uBl3qHi1zHajeaLyFl?=
 =?us-ascii?Q?iHsJpEGKQq9Vs5qzSugnTyheUr1HXjLjJb6Nmk9HFFcOspYaCJV/YQkuJtER?=
 =?us-ascii?Q?bOtm0Y5mOWTdRjGWmCVZzYlrJwisJ3x9tq+vqHzeTK7zJ6Ss6bfXRvJg/Bwc?=
 =?us-ascii?Q?PiEx/42YH/q6xMkUL9BvPmFJo3rYlJjRWxU2LWYET1oomxXuhVyLXpgUUHBq?=
 =?us-ascii?Q?dC7e91fm//555vQrEblymm0SQ2/P6RIStY7EY7jgAdN2cfJbLFnzI+HM4zl4?=
 =?us-ascii?Q?pjfToQcWNQJuwM0z39wdUUBtxjKP3PyJXpj/iLg4VhSAJGp33MGAawySYnUT?=
 =?us-ascii?Q?aNTmLHT8UeVD6gVo4FXD8hyBpnP3Vmyng+uYLd29eyiPYt4YvbRERoxZ+/eD?=
 =?us-ascii?Q?tJI9di2/oL3v8Q5Mqg9m2pVieDGqOBZ6eyxBe5YjyBcEDEo8b0OEjCjc9T4F?=
 =?us-ascii?Q?TPYoKR7m5sJH9nl6GCDsufSMt59eFHLrGM5OLFTtyqs4Zbzyg9soRqk6HnCS?=
 =?us-ascii?Q?TcjZdeNP61MHfuCTHZ2ansi20CWOv4E2eSjBBuTrwPUOZBjocVcBMcS6LtEg?=
 =?us-ascii?Q?IZawsuiC+QMkf/E215hDpuiQiUFo92eZoMsviI2D17gcx8nTj5EBjspoSvXX?=
 =?us-ascii?Q?3hwNmg9NyDPHN3N4biJvNTBRXEyyJSVI7yPCEkXugfuSdsZmfOLP0Ix9Nd6P?=
 =?us-ascii?Q?ljRbPGqSK7APiTueomx0/+C1Wq7zT3t7cy/bsHaumf6iukiDSwdyha7whcUZ?=
 =?us-ascii?Q?m0rlxSMn6Z+T/NpXNUA38EVVC2ArZ7VVL4Rg3md6BNHAcRW7U3Fby8LbrBVc?=
 =?us-ascii?Q?305p4FzMg5bsW5VMkRNBkkfub3Lgb2VBu7CM/nZEaaCNUe1refvO/5zgjjBN?=
 =?us-ascii?Q?6ybkJvXLIgBrI0HcZ4KHTaUdg67QCcKMzQH2X4LaiohELgnCoORahB/YsJ4z?=
 =?us-ascii?Q?CvnzbLOi8OnKa21qHAsAPXUFBeD4GIiVTGDYtA2/mzH6tCdTqS3OxyVHV8WD?=
 =?us-ascii?Q?Y+kjK+uGH7zBUkjZ/gSj03f/nMXkT24cgL0vvYjhgkBWwWhdxsyqPkgcsBJz?=
 =?us-ascii?Q?qrjpdoQ8ixhTYCGYT/nSlMbWHwu/eJ0vVT+0J1FxgQWgrqyhTOW46P9uwg3T?=
 =?us-ascii?Q?iQTdgUJiH2PD7hr6UJO9TVecrW6rGyCje+wi4ycbVzBLmrakoTvnaq5SIsBQ?=
 =?us-ascii?Q?V1MPVk01X5bZ1Q1AvEB6QlU0UsPjJT17nAqeWMnOq9gvTB5+C/9vm28O1x5X?=
 =?us-ascii?Q?B+BEvJ5vpjD968BYr2WtGlQKIUacLY4UVnje7NeRWBd/Nm/qp7H3oFLeuZB9?=
 =?us-ascii?Q?yNwaCU/fbu0pw6tJn6kAyRF/Jk1UheE74K8Gdr9JTQN6nQC72L8ssroqIMJo?=
 =?us-ascii?Q?KLkMsnx04N4JEHfP2c91eH0ZEGC4A0M2BQB60Wdeq9g+q8PhHhxVHOldkz3s?=
 =?us-ascii?Q?CcOD/gozoGgC1Vc5XeJ546t0gi+fbP7M4IcK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:17:33.5964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c62f0f-b286-435b-fa90-08dd8784c91f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5655
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
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9fed4471405f..4d3f24313905 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5739,6 +5739,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
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

