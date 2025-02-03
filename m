Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD1A261E7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA8710E541;
	Mon,  3 Feb 2025 18:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E6GxBRHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC06A10E541;
 Mon,  3 Feb 2025 18:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVXieqjF2BR3SZtQDMDbYyltE5I108qXKzC6JxLqiDVQ1saBZpHhOwjvFPlmqY7JvyJ1zYMdKVpgARsf+X+MOYwGmLzPtvwkhRh81tQm1SFG35F4mEBnHmRCdZ+BLTXuqv6d/WhLwssS5hPm3EVzwaFE2riB9ZY/c/d7ueiNfcfCjWYvU6MRwNNfQkY2ljo/H65N7Uh0t2c4e8bbnvEKeeT0gEbDrIsV3Nw2tbyg7cmdJCSzf2k3s3mY4tCVKiVD44/VXu4mhdMq4eyqFXYreQlLkJabOxgRI/hHjJqeg7FWZh7ADUDigSoA7UglAGgZzRBVXhp2+WmZVwetyt5e5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YursoAu3Dw88XAlboHsmnzVDp+XDlWwE9Wk0lSArSs=;
 b=eJ7J6PiAu7TEOGiNckRB7spD9qxj4vZh3xg7VInbL3tgkKTw38TNcKjAKE1qVJLpJSPdtux1K5NusfbYDnGg6nxfULfGtKe4FMEEJiPL83cW3cyRuggkhn7HxUkkN4G29Mfjlu6w6m7M2acnUxItRh1o3YgIY2HoYB2oyeGTG5EDriE8bRI3jHpwTtwamCRhTSA+MleuKFuy20tzO2BPnk/jMU0mxcP7VkSShFFMG5oXlSrXRNOxi5Y9L8U6dHu0vFl7Eu5B7S501K2yMeYnPnfcsY3CbFPC/ULb1+524/oQeCOIzqX6Scy86QjoMuQmqjSMAI7psX90NxDe9MC7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YursoAu3Dw88XAlboHsmnzVDp+XDlWwE9Wk0lSArSs=;
 b=E6GxBRHo46ZKClRvv4qVfEChiA6WkD0VfQ28SPHLXnS+aqhwt1ZDQTSHlXhuQFhUtPoyJ6M62fRz+uovSfOJ+7L1pqa9R1GG3cFFafp9wXOgv3+QrbMbAuynQIAAGbATAYDZ24MSOdrn6gRw+5K4t3xZOBxaASeNvslkCU41zwY=
Received: from SJ0PR13CA0165.namprd13.prod.outlook.com (2603:10b6:a03:2c7::20)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 18:03:03 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::e4) by SJ0PR13CA0165.outlook.office365.com
 (2603:10b6:a03:2c7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 18:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Mon, 3 Feb 2025 18:03:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 12:03:00 -0600
From: Alex Hung <alex.hung@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <alvin.lee2@amd.com>, <alex.hung@amd.com>,
 <wenjing.liu@amd.com>, <Austin.Zheng@amd.com>, <aurabindo.pillai@amd.com>,
 <dillon.varone@amd.com>, <mario.limonciello@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Replace pr_info in dc_validate_boot_timing()
Date: Mon, 3 Feb 2025 11:02:03 -0700
Message-ID: <20250203180203.1259237-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: 256ffb77-3cdd-468d-a5a7-08dd447d00c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7O+0vV+vCVFH2skPMvMSGZXSZptseoYsGs5nPC0fYljnSOg1L4X7rwxRPhD0?=
 =?us-ascii?Q?lr7wcq+URyfcBypNu964jyGmvGfVHD/UiWSsmKMlG98wc6B2dn5+dEUbmXkZ?=
 =?us-ascii?Q?KaPlvRc3HAVb+Aau8dX0rfsQLUo9yIEJZT3Zr0gqR+ydUr82IXWt7SRpfcs7?=
 =?us-ascii?Q?g+CwUt/r4VaoC533gPexolrixHW+kTXwksnC7c9Bf2sDADEhELqmdS97z6gf?=
 =?us-ascii?Q?okOEbZOuULGQ0onaGjn61/Gwh2P7Cy+7Km03tAmi02bRdWavCCypYg7sHbh0?=
 =?us-ascii?Q?aj8qMC6tQ1a1RyZFzkrhbvTr3C7GG8wQ9TbhYU2gVcn+h+9sLLYmFZusUCF8?=
 =?us-ascii?Q?YBN98n7Y4uB6/QoqfSvV79WmDgvzYFvQpyEaW7xVKcgKRC1DWCgEzA9PxZij?=
 =?us-ascii?Q?QmT5RgPXqxShleySmRx4yPdEw53Azd1Vyw1lhVYpEFJb7rhS5y4bYwMnTLb/?=
 =?us-ascii?Q?B2lwekmqY9A+0bGfUV5YNYRqv2JOQFZcdAWeid+5e8+55a6fbKPdCGUaFi9W?=
 =?us-ascii?Q?TE1NWv/lQyn4ldgb+/SHfVT7jJQrrBIBudu2h07/3T1LF32kynHeQM0AsgFP?=
 =?us-ascii?Q?c+Wmz6oMd0jmg03A0B5aKIQgy2NDvE0d6yuDaGLiM/LTkgN1Dnm+8PKfIPht?=
 =?us-ascii?Q?TsR3SVq815SCsDfvyVcLnd/0XswuIT+7VSf/pJvQJ/ePcAlv0lAeEj7Z4bFT?=
 =?us-ascii?Q?Bc4gVRLoR3BTTlJHD6e3omtT2A2TvF2lZkczaP0qEjy/fhFiP+oUTEjVyb3d?=
 =?us-ascii?Q?CgDpd/Ncs3E1Bl4h+XXYPU8950UFfYq46PRqAHccysuieD9CB/jlPC4/gxFX?=
 =?us-ascii?Q?Sn9ypsZShfw9sbgYCKXb+FQMwDWcKlAEHVyzEML4vBBGPVF4tspgwaZYB0Yq?=
 =?us-ascii?Q?2sDKunanHlGIbXL/SwtNAGut3YhLGrOlQ1ToyI23Z3ReC0M4uZ+cO9K4ooOh?=
 =?us-ascii?Q?sZqNSOxEe+MXGu9EPmuXCMLcPFyYtJ3w6A0/boPPG87ayrjH1fRbJDHSDyxQ?=
 =?us-ascii?Q?YDfM1BFLi6JYYB0CdiWY4OaIz4kZxWzS9XdWbQw/31Lhc9yublyDIwk7WNC8?=
 =?us-ascii?Q?elxCphsd+6tUxp3ND+y/XnWTdlLFnthoYlfvn28QnqiB5fJn+DNcPY5c3PHu?=
 =?us-ascii?Q?tCOFEUzu7SdgKanpI5WWZrG89+7IXqAyv9EuK53EelBw0uh+tGIsd4soM6qW?=
 =?us-ascii?Q?l2/zd4M2hq7/YirhF8PatvQq9Pi+IuNc3y9K4S9/gzgQj+MxLfK0m8EvMYb6?=
 =?us-ascii?Q?vQ7a9KcYizroPmyfg8CGAsQizx7LqWcdpwk4hkuwfFzRFN4TTTw3KJQMViAt?=
 =?us-ascii?Q?ZMZd+0MFtNZa9mOK+xdkS0HUfh/r2zksR05yC65/pQAe640cYyuDimZjn4/w?=
 =?us-ascii?Q?YUbgEiMR27zaZX8J/5Ee2MtjVmzQefb/QJtt+5S9yW15wppmwthxEzFE1d0D?=
 =?us-ascii?Q?LpfyaY/7FKhkFkKQX/6qXRkCEo1jcZ3CLBn9OMkC7EnsV6PPeo324lbNaQVF?=
 =?us-ascii?Q?Ay7MiI7YAIa/OpbpIFFw6g6J42RUnDd5upoJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 18:03:02.9444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 256ffb77-3cdd-468d-a5a7-08dd447d00c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
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

Use DC_LOG_DEBUG instead of pr_info to match other uses in dc.c.

Fixes: eb8eec752038 ("drm/amd/display: Add debug messages for dc_validate_boot_timing()")

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index a2b0331ef579..793351e15bc3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1865,7 +1865,7 @@ bool dc_validate_boot_timing(const struct dc *dc,
 			uint32_t pixels_per_cycle = se->funcs->get_pixels_per_cycle(se);
 
 			if (pixels_per_cycle != 1 && !dc->debug.enable_dp_dig_pixel_rate_div_policy) {
-				pr_info("boot timing validation failed due to pixels_per_cycle\n");
+				DC_LOG_DEBUG("boot timing validation failed due to pixels_per_cycle\n");
 				return false;
 			}
 
-- 
2.43.0

