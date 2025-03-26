Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73193A72773
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE4410E7E4;
	Wed, 26 Mar 2025 23:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X8FHA4C9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7944210E7E4;
 Wed, 26 Mar 2025 23:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqAhGKL6vSEe0Ee/zZSJ28x/lioTHwoy4UzSCrPMKQntd6DGP2HYevlQfMCMr4lzxg6+liPYvVuKmcxiNVF4TZtkwwRrCU3tZn0IR4NEPYq9Urqb+0S3y7u/9PBUwVfQ0c+IygpVSREZqVz5b1IxGDQoc1KnwXHEqiRoHCXox6CfB5aQpg3e+Zt5LM6ECzOHTzRR+6dCa5+FgG80hd43DFrYza5Z129QHSOpYCVK1M0IPAEzNKTphuePEA5zuXsVPC7uVp0t0EyNVonHXTp304UT0TXNVTHsNDzIkT8GvnlMC4PU6VhxWs0/AYds8TTH/Gwv2Gy0MJHuHgsWbJJNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1A5pD7cUqKotl4WjbVb76QosJDCxsX//VPVZa9qwuQ=;
 b=Ppjb4+AY12piCOBIzGvwRamBaFQ3+hl60BKcTdeT6EtaHSGCiKP3oBI7JK5/Ae/59z3BAwqL9dnJ7kIipTwqDrgjCj0PIlrMI1x06+WBt7OorH6kc7TSUUMHsjxO0KRbxHWInbnt6UXvJjS57BFnKZC0wQL0LXrtrUNI9h3k16FHAjwRFB2mVKBlroY2wbUO8ZPVPo7NohvpBAj1bhxxMWa9sgIJZV3OGZn6aELpU9rZuvi9RDzjnooYWwaLy47D5fTEQ/WxToIr3a6nW9XLkyKMa2QI6NBe5G9II3lECG5Fgej0698NSY8CFHLFsAfu7OUK0nh/dpWzIzT4ci1n8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1A5pD7cUqKotl4WjbVb76QosJDCxsX//VPVZa9qwuQ=;
 b=X8FHA4C9DJdEuqzgLVpD7aD6Hco4ZwM0xbM1eISr2G01ggwCvjQTuOMSSCsYwuS97PnqnJEgvRC1rnT+Klsfzqkb4Atcam3qLXpGHnQpELr530im8hoSQ4+5sUAWXlrxrkmzgk1n4QX3Aebpq1VQJPwGTacQr0xUZas59v7YSH0=
Received: from BN0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:408:ee::29)
 by PH8PR12MB6939.namprd12.prod.outlook.com (2603:10b6:510:1be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:53:47 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::8c) by BN0PR04CA0024.outlook.office365.com
 (2603:10b6:408:ee::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Wed,
 26 Mar 2025 23:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:53:46 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:53:43 -0500
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
Subject: [PATCH V8 22/43] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Wed, 26 Mar 2025 17:47:03 -0600
Message-ID: <20250326234748.2982010-23-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|PH8PR12MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 326400b8-9eb1-4edf-732f-08dd6cc172b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VWZras6cn9ynGv9CqyKAPKmbC7rYjSORF5UaVE6N5XNzZK4k2myplD1oRiMm?=
 =?us-ascii?Q?UGdTy1yXqeKANfjBla4MuMUzaYU9k0MQq/wSXxXoCaWmdxEOglFPgUpfmdh4?=
 =?us-ascii?Q?snUaXzcMwpF5+Yb2PJZhkt2AkEmcYSfUvcid/RQbtaOZLvH10zGcf8N8ZKVJ?=
 =?us-ascii?Q?SztLDFVXwfxjoTRbRNDhoSCXMXPp0yQq6pMbEx4uYusCPVzWxBq9Q7jDVd3I?=
 =?us-ascii?Q?TQ+zKvIaZV6VUYQ07pHTefiqQ9Tcwpo4xBDGgA4jXHHtcOBAnnwKO/ciZhCF?=
 =?us-ascii?Q?t6g6S26WwYCNOdN9p3FUF0Y6cNoccS9cNP5suTX3fBgrLMngreGhtc6nEF+L?=
 =?us-ascii?Q?pdq77OKK9qgJK8sDOsj7Dp1g1DH2rnnL9HoZkHVVO8PxGBJ6r8ak2RB/dBoJ?=
 =?us-ascii?Q?Li9gfYwe79Ee8WSfKPhqWrp1FK6kT9cb5Rw5BRIJYLhdDLCugkB1ldDqUOh5?=
 =?us-ascii?Q?yX69Jg6iIJM3bm9hXEM942wUXb3QkgyE4EYLaSbANm8vIcSPkMD0vbn+unl+?=
 =?us-ascii?Q?X0OLWLF0HuECeiePSveCAVuJP5PSrgvN3rgmt0NmvPsPIoKLwShhI24LhsDk?=
 =?us-ascii?Q?7BeYaBT41CWXZ4usUOanYruSd9d9wkAVEKTB1PDpb2+wpRFzjWDvLJaHKI0P?=
 =?us-ascii?Q?2bQFdOWfLxZJE54Zi/UsiG52pEXAkxDWlYS5fAE6vA8Y7KAPk3UIaGxHv3pT?=
 =?us-ascii?Q?j8p8SiWsINd06HmOnbbPl8LOB73LpHQxVBZZUOaK/6FQrhi8vWNIPG4fZGIw?=
 =?us-ascii?Q?IMMWne48LQw/s6HZ3vr2mKItqugwuWVM25MbRlNDEfjUT16st8zjwmtZdOh3?=
 =?us-ascii?Q?IOtD+F0iYhbvr2DxHuKAXo59SK8eUOc17R6KOoHv1ntSDg3dqLdXCE3LGsTY?=
 =?us-ascii?Q?oIxw0o3JycVRf8n1ZLdit7m7Y5wwhtNSiFLCPVdFhA+/6XHSCYONbYm0a26M?=
 =?us-ascii?Q?Oovsh8lUPla8MEQuW8fbVBBob7qcirCXOXzr4iskU86NM2hvh8aSojaHJHqr?=
 =?us-ascii?Q?tF1svosqL1Vu/XHZY1XcLhJolJ9HdrV3joa+xd3QTrTEGb6p5Sz2XWp1hWvc?=
 =?us-ascii?Q?jqemcqxSHstblIhq58URaRHERJVPHNqrOJWI90ffRdW5XENWZEGoF8l5m7/w?=
 =?us-ascii?Q?6cdJOhsGxErajVWb5dNrwcu/F+2OnS1p26qFbHPtavRDmpj334itT8X24mWu?=
 =?us-ascii?Q?wbRwF94dxTpfzuR9oKZVRwlqOQ7EqtJ8/EyNOHh7sdlBa0wDLOCLb7NDTU5w?=
 =?us-ascii?Q?T0vQF0uHy5KGpHtpEq+vhk0ZnYp8p5Uny2dpngr5HSGWAZVYzyQ07/kmBvVT?=
 =?us-ascii?Q?fnLNBxxxARb+Xp1ZsbTWA83QHWwF/74wYibULqrcXkyaUwGoRfl8rxX2T3EY?=
 =?us-ascii?Q?Ife/M0Rx0y0OtXZnOQFdGvJrggCAAOjC60OO41578sEv4HsfHSH/7UGsZsaq?=
 =?us-ascii?Q?1FiItYw+R6YJbbnAOLeHWRBNW22uWt4SHV6Z47GnwZKVQ5gMld/B8TiqJGkP?=
 =?us-ascii?Q?X7EIGhzYhWZnfDU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:53:46.4795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 326400b8-9eb1-4edf-732f-08dd6cc172b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6939
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
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6a54f1cfa125..b00f760afb29 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5691,6 +5691,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
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

