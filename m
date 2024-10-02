Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F398D851
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B219E10E754;
	Wed,  2 Oct 2024 13:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ki1tLMiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B4610E769;
 Wed,  2 Oct 2024 13:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVPENNX2uQN84ed6t1EQvM8GyJGsornE65hFRjm66vMM25/tR7uArlwVSP6UN/fdURehCwyejJ5MZngGnS0Q+l2dx1KiwxYKJQibDKvOTLUvQ7B0kP58UBNZpC5XGPr/1+Lu9VMcv8VumJu4LKTt0qh6m8+y2NUO16fFGc/Zg62MFX1y+CX05FjGvGmBinGf2u/91Q65ieejcAiJDaVH0oX0+r26arpLsQYYzzvcfso0llsPfD9emaOApTwkY4A5bvoTy1NI4R0HodrYR++W05PO8o/llpIfz7Gjt8BMdaZq06XE7nzGoQjkyjbiLRHS9gICBT8SggGfJ6gApgs4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kF3v67WenitCe/nHoSl+miP0b2nD2wR746B1HuS+aM=;
 b=FL1P7urWGbjna9HWVdiQkMDcE4e37HdMGFAsesNQyiJc+6+w9pbWkg+jk7U8ftR/AKlHfFxRP/krj81QZZIbzDQcHW4++3ozU7NKygR/EH7kRcamoLWZO+Zz3ChC6jYQss20hPRJq2UPUAm+Y1CzBwUNbTLNngHgMdtCUg7HrlbccBFCUmb+BU338WuxEhWHvDsy/aJIpMGiihHphEd77fi0867wtRM8S4FNdONe9/A7YIOQJrXBhWXIbQ5kZKqlWz16VUjLDOf6jnu1B1WfB/8Gh86I3G6z+jS96NEqxV4Vt+bctKD8aULofOveBQM6E6y1P7rgeusHTU+xZyopSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kF3v67WenitCe/nHoSl+miP0b2nD2wR746B1HuS+aM=;
 b=ki1tLMiVwiSq2/Hm2dyIYKgO8e7sSHTwqis654llYSFgDCfEwKI+CxIIWL5PTpbGv1XkGHZnI6cuirm6TFzEGMRqcTD6BJ8lK2sHYFl8X0aSZTuvazy9SV2cWWB7MHMnenQlUfL2zZtNE2JBajHecWY2Pq8wZwvXZzrwFSVV19Q=
Received: from BN9PR03CA0492.namprd03.prod.outlook.com (2603:10b6:408:130::17)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Wed, 2 Oct
 2024 13:58:47 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::e2) by BN9PR03CA0492.outlook.office365.com
 (2603:10b6:408:130::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Wed, 2 Oct 2024 13:58:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Wed, 2 Oct 2024 13:58:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Oct
 2024 08:58:46 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.12
Date: Wed, 2 Oct 2024 09:58:31 -0400
Message-ID: <20241002135831.2510790-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7f8658-8367-471a-154e-08dce2ea55f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OgU3UFqhQJrnPZVirdvpK2lczbpRfN/23l7SwcTwCy7qvCDv/iYtOlaFIJe/?=
 =?us-ascii?Q?dYC/RRwzI+xklUJ2NchSg9AJOGmj+GW4vhKe5lzL3qJFSQ8EQbxjF9PpPDRw?=
 =?us-ascii?Q?6kPgdN4V5DP1ONZa5YGNAkWKgZggfFp0akjWJ/8xAFqJjh5H9SVl//mK2MiT?=
 =?us-ascii?Q?OF70Y1e1CplWtTqZAxXC1KbdKRRX77FSsw4bXh7MJH8j2El3O2nc8ChL4gdZ?=
 =?us-ascii?Q?nQugVTKMT/Mycs1AXi0MRpriJ4iiEeH8GM7qMEGyV3jYakArvK+S7XVXWgqh?=
 =?us-ascii?Q?4O9DrM0P5Ore5NL2b/IWSBJ+GicgIK8gBwKEu1QCkhNl7R++0eMQTTMIpvMo?=
 =?us-ascii?Q?xJSKB6Y93ggbB8PJg/NOovW5VX+iNEjAslo/m9TbkqZWE+DiAED7FzyG954N?=
 =?us-ascii?Q?ldC0e5Dr3h38v36EzPa8JSYwlo9pp8Hlp6C+nlp+52UHqsTwGRZs1uKYoCdI?=
 =?us-ascii?Q?OtBpBYZJ9NbsPuk9QBYAQlH/ujr7rHP7LQA/QZ5MzUbsyAOmgbY3FBwRZp+x?=
 =?us-ascii?Q?OQ6CKTIM6K2KJOQJeLrp4hzOxbm8DVTJg++zjBWiATDrcrupekYKRGEePSGg?=
 =?us-ascii?Q?vTwwL8wTYN/Uos5xMvOS/pj2Dp0Kdm3CM3b10SEuqPm1K0I8pEMRYB0kKB0U?=
 =?us-ascii?Q?SKgwV6StZrAtln93kOyh0K9mCiu/w7GQ2kP8F4FyEWSYC+j0+YpLGAZX5Q8a?=
 =?us-ascii?Q?P/Ry7/ZNEOv1srxc3FN5e1CqXhRg36bd+S/oR0ArBxzfeYaFGcnCurQw8Kxq?=
 =?us-ascii?Q?ZpJMyiMVKtON8vh/qSDQRLTbFsgmX2Fl12LwJcPM1FR0coAOEn1SWxiBdAoA?=
 =?us-ascii?Q?HPdEgWMQR4vwB80wAZSHI8UFy17d86f6ChxJrH+CkB3Gkiil71/JKnoH7kjh?=
 =?us-ascii?Q?4y0DDnYIKdOk3ZMu2FPiyX97ptKNYbv+FWAv1wCmheraemnoyd2t0gA0i5eU?=
 =?us-ascii?Q?jzqbnwXLD0NtCQhUM6JXX1hvcc5ecpfO4GSazmF9srV0ZKCg5dJAPjLN49eK?=
 =?us-ascii?Q?PZwRr+i4Ev96cN2vU/1K7mL5Ev/hL4pXRQO62wQwsSUJmoWDF0A98CDxMo9n?=
 =?us-ascii?Q?5Atf8jhu3VefYHMOQ1Nwy/EVZmWr59aDMNWlQzoTlp0LAm6dPgpHdSUVzTxu?=
 =?us-ascii?Q?oXQL3G+5PGHNrQnjvTadvQLXqOQv81F86m4PaMqIrH0nAHWwJczBKRxQhjju?=
 =?us-ascii?Q?xPxrXuJoiUjZbmkUFP/4nLS5B6ZWJEdkIFrW5cXT0zvwpZ+5OF+kA1y33SX5?=
 =?us-ascii?Q?+n+Om62Qa9A8AetZAmm7wQkqvq/7VwJ9B941FaZD5xL+T0QnST6ET/uk3gW1?=
 =?us-ascii?Q?wOvj/UeK2tKBXT83kt54WW+f?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 13:58:47.1754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7f8658-8367-471a-154e-08dce2ea55f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931
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

Fixes for 6.12.

The following changes since commit d7d2688bf4ea58734d73e18edcbf4684b1496d30:

  drm/amd/pm: update workload mask after the setting (2024-09-26 17:05:10 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-10-02

for you to fetch changes up to 52d4e3fb3d340447dcdac0e14ff21a764f326907:

  drm/amd/display: Fix system hang while resume with TBT monitor (2024-10-01 18:13:19 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-10-02:

amdgpu:
- DML2 fix
- DSC fix
- Dispclk fix
- eDP HDR fix
- IPS fix
- TBT fix

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Add HDR workaround for specific eDP

Charlene Liu (1):
      drm/amd/display: avoid set dispclk to 0

Fangzhi Zuo (1):
      drm/amd/display: Restore Optimized pbn Value if Failed to Disable DSC

Leo Li (1):
      drm/amd/display: Enable idle workqueue for more IPS modes

Tom Chung (1):
      drm/amd/display: Fix system hang while resume with TBT monitor

Yihan Zhu (1):
      drm/amd/display: update DML2 policy EnhancedPrefetchScheduleAccelerationFinal DCN35

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 20 ++++++++++++++++++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c    |  4 ++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 17 +++++++++++++----
 drivers/gpu/drm/amd/display/dc/dc_types.h            |  1 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c    |  1 -
 .../amd/display/dc/resource/dcn351/dcn351_resource.c |  1 +
 6 files changed, 37 insertions(+), 7 deletions(-)
