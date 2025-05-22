Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954CAC1379
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 20:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C450710E06D;
	Thu, 22 May 2025 18:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p2tdHne/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9343B10E00C;
 Thu, 22 May 2025 18:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFpYVsvuC1dUNZV9wtDVr+LkKC0w8dbT8sOEkWZMb4DA5LeDsOz3l/haRoBlY/jIEJ1Na61V7BmMq2mAlr15RR+aWXEEaqf/eyX0Tj0Q00W5y6Ur3GGPkjQDIF2Op9T3BwCsmsEu2IECqpgkW/RORtEtfCpJw/SZ/CyuZoa/n2P4Ief0H+gfQp1hY/MIe4tinRtozOth56Q0JUEoQRpiuD5V9dsjfjPFC+C4lQOP7w86pUCMiyqu5QXwARFxIKkmyTHlpfe2C+HO1e5Oj5mjOlbHb1aYDzKyvIlTvjiEA6tBfQiuEciMcPBXNCmW2UZksREi8TBX26zLXTgG5x/7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIdEnSmmO8FdEXFQaNkgCSNRBr4VcSbUGAUB8BqV1dA=;
 b=tHTYQiw6qyZpEwimj70c9L7DMG+zNoi0aDysFI6MPQiZRhU0dl1AXBckA3Wxh1gIK+XdnlHndjsm4yf/sJhI5i3JzyvgkDjqLYjjJURy+tVGSjrLAaJqaz3y04VkGJgVGMVNpR460OBnW6MmTiDydqHZqA8hGq9lEbjHhGrXh1QMUHlF71BauWR3VK+g8UtD5m3/9ldqMxSgw4ceTtft2Hla7Ujq82IdDpo7nXu83/OKJUtjshiVY4jdFijfpJWfoTybpR8tXMKlPsTwA+WOYlbnPkbLJVX63IYzs2Pw8F88TOSBAZxG96BSkLAWZYBrooteWEkiu2ireVhr0i7XJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIdEnSmmO8FdEXFQaNkgCSNRBr4VcSbUGAUB8BqV1dA=;
 b=p2tdHne/wkKNw830F9pYj7GadhKGLiyjPhj+/4Wts0rtEaPRfk1L7GkHW2Zjvb/pIXu/vnwLU6fxC2pnsQCuiAYOJdrz4KcSTSiHCHvRlCxWQ90xA//GHMoYKjY13u9t+8sEPro15fKotTakzv2pGGKasnnaJgeaCHpBQTOLeOQ=
Received: from MN2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:208:23e::12)
 by SN7PR12MB7853.namprd12.prod.outlook.com (2603:10b6:806:348::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 22 May
 2025 18:40:14 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::1e) by MN2PR14CA0007.outlook.office365.com
 (2603:10b6:208:23e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 18:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 18:40:13 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 13:40:12 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.15
Date: Thu, 22 May 2025 14:39:41 -0400
Message-ID: <20250522183941.9606-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SN7PR12MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d39410-4dd0-44fc-3d54-08dd996016c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A6JH0evaf/w+AHSkbyRGGtJbEFTm2yyWuNHOc0GOOxoqe+sjmU+aCq20GpYC?=
 =?us-ascii?Q?lD91l+eDVEiQMcKZmqYsxS6l76d0250dBohfFXx4V7yuY4/WWhQu1FSLoQif?=
 =?us-ascii?Q?ZV6MRvagmkyPp81mcFkOSTreB8sLjbLctBWJO1aw1HIEhVS+yF4QERcZPPUO?=
 =?us-ascii?Q?7EvpHI3dFu1Ra+cCQpkcmQkgI1cDMzsmLBbX/DTzF37xo0TgHQtpMSRgMtrs?=
 =?us-ascii?Q?WaB4oLV/DCu3b9bDd9+bK3YLF+QDD8eTOKMXzT7SMfYZvgxxGigSIzwzSWUR?=
 =?us-ascii?Q?pMeWYsN7ImThd/dvlparc9xHBoqrxWEYbYJKigRBFJ7Uj/rv+3uSoKtm5kmn?=
 =?us-ascii?Q?HiVTc9hHlZWs8loK8jFR6/C18ZDfEa/Qeo3Sz67//g8AahGh2qb5rHRkltO+?=
 =?us-ascii?Q?nx6ZTnDB3LGx3nAl7DeW85IyUGqBRIZ3/hrC+WuQ7090T36nz0TG4XbmUZAy?=
 =?us-ascii?Q?MlIN4vVF4yYwbE3mp9r7np98gn5Gl86qmHHMshmJt2yy1/zSUFoYHD0i3/2F?=
 =?us-ascii?Q?0cvYc3DaYOpyHV8rVfLaRgWj4oHVCEI4zxoY4sr1rdfOGdRiSGuTVSGtn25V?=
 =?us-ascii?Q?vaUSQUwmXRm4faod9utJHZf5Hs/yPQVEElDkqymNd9jx4GhBbfKLVKOi9UxH?=
 =?us-ascii?Q?vW+wofA5JmlnDkc+yC/DXJ7+6OuZDfZ2m0+luXUq3AINFr3tFO8K3+Xje9Fn?=
 =?us-ascii?Q?KAUBTYO7IUeDip+Y6F0Kn4MV13g0XtOfeafGIOK9elwtve0chKmmCJMj32Fn?=
 =?us-ascii?Q?Tm1ejxNsBf1RPX9F9cClT61mcakNEv9XR572xaTC+T1a5tyPMMHAqYlWGkSh?=
 =?us-ascii?Q?r9XzycWFyWH+Qz2TB5F43cZD73BP22L9sJDCS3Z6EyCN4T4TwwAIwhNUsMXc?=
 =?us-ascii?Q?15xWd5eKb0csa0S+DHgodkXdkWEOgOCUXzoYkkFPmvdt2I+9ovGEwRvPbpBx?=
 =?us-ascii?Q?mTbCVzgXjqWHoK2ZIJHVyry/aVvGvZ2hG0qzq+ET8VtvyYNPlmyeKoWjOZKb?=
 =?us-ascii?Q?YU5mhCuGLDXS6Qa+vERxUp0QmrqR+ptIPo7HQ4G7iMfvo1I6gVe2L1umLP1Z?=
 =?us-ascii?Q?2e9y0qsX5/+zsqiKj7/q0i5u021PIFBdAE0lKUa5aiPRJ5F9DVWBbAY5hUe6?=
 =?us-ascii?Q?KqSHu/DNXov3qTUoIuiLzsLQq2QzBijplNGGca8vChNXV7VbV0p18tZ+jr7Z?=
 =?us-ascii?Q?TRCS0fojrzCyM1ckWpKwstujBxHmjhY3P0sMht1m7MhvYh/3/Eewwdm8JuPL?=
 =?us-ascii?Q?YSRWtFCunWVWUAVUZKx/xyk1bEK0HKslz+OfTPGZF/w+iDq7GQBhzyfdH4nM?=
 =?us-ascii?Q?K8r7kR7USjgmyo0WNUWvGImWH9zwJHg/FAecWXVhNWrJESucF49o1MV8kX/5?=
 =?us-ascii?Q?/sMc1Dx11/oLT7DL5Jw900dXZvd1vZbYX7Nem6N/RH3BWLQImEREIt1XARrC?=
 =?us-ascii?Q?7i1wH0HETLq1QPAkIi/3ytuYN8BuRzNrQnWpGxniUEeQKDYJtcpptg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:40:13.3649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d39410-4dd0-44fc-3d54-08dd996016c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7853
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

Hi Dave, Simona,

One fix for 6.15.

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.15-2025-05-22

for you to fetch changes up to 7e7cb7a13c81073d38a10fa7b450d23712281ec4:

  Revert "drm/amd: Keep display off while going into S4" (2025-05-22 12:13:51 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.15-2025-05-22:

amdgpu:
- Hibernate fix

----------------------------------------------------------------
Mario Limonciello (1):
      Revert "drm/amd: Keep display off while going into S4"

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 -----
 1 file changed, 5 deletions(-)
