Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7D9C0DB6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 19:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A4710E89D;
	Thu,  7 Nov 2024 18:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EWMNST9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFDD10E895;
 Thu,  7 Nov 2024 18:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYorFYqsQEJeQX43LWqIKfVDnsQzbld+TEjGDxh9SVkClkCas8JAFtoS5uIazSP2UU22IGh/ABQRB4o9vtm573CVXtNPrtVmEO+DzJrvOjwGeli1bLuA1AydYrrsVMlcGKxYWAQHaEmLCtTt0C4km246SC3JRFbMvi4LDZUry3jTLl7kZ9MAW3Bt0N07mkPJy7L8gLwZpvN5X9Ck1g1yjdepbPhotBmRhxsSXXgB1/727wR9q1/U+FI0mLAPA8t4GYR57gR1RP0rtjLQpx6G6W9wIHKQaQ9xOZ+0dGbN3SvX7OIqene0mWI5KTJFsQIMjD9Mmc1K2Re8ldMEbPfOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pJwL8WBEZk5+2DomDukxH+ehYKYdWMeTeYO9K2mf8o=;
 b=yt7vcST46YJ6hd8LWPA0T5jb+FRYtRpeuBIlvSvPvIJqZAjVT+fTZhjpVEwOVeG01FHDmxtCMFBR3jfmVCxKCGBpQGNcrM2c2XCGvGJBNJriayTmURWodrfm/nk/chynYu6EFWs5+I78ky/gLuE2pUggsXM3djw4Lh3U3tI+8o4JDZZjF6gsMIYIBKZEh4pd/ZWHkrAKb1ycBcj6YzBbrK9lM7mTjp/T1TmypH6xlJWezWyUYMdoTSW7sqc/E1kNT3S1wnr8dh+kiPS7DflkLqh/kRxaO5TluoJbgrNEoYG+TBQL6D5mXzjIoBYNu1he+q4ohk08QRPc4hbakeybNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pJwL8WBEZk5+2DomDukxH+ehYKYdWMeTeYO9K2mf8o=;
 b=EWMNST9tlFc00O0eD5BPqlmBFgy8yK3Cysk3HtceO6yCnkeBk0elZD/SnjjSkpULY/+Vw+HPEIORP6a93ZqjrHReT4d1nWqX0xmFDBOodL1OO4vIK0IH0CEvMaIIYYhYCEK9iSYgX0ePu8yEjQpTMAW/AlW64BAXO0BpNcnEFJ8=
Received: from MW4PR04CA0112.namprd04.prod.outlook.com (2603:10b6:303:83::27)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 18:27:38 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::ce) by MW4PR04CA0112.outlook.office365.com
 (2603:10b6:303:83::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 18:27:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 18:27:37 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 12:27:36 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] drm-fixes-6.12
Date: Thu, 7 Nov 2024 13:27:22 -0500
Message-ID: <20241107182722.14147-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7d98f2-7afd-4253-09f4-08dcff59db57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+GMCVY+uHxIGaSpp/4d9s1wHvfhMHPen2V1hBBtetlTM0/EEXPykjtAgDrXN?=
 =?us-ascii?Q?hFt8YPi4SUMft8hR/dfZrUoVqoL3ArTKhvPBsguA5fehF2NR4GQw1t/sIqoN?=
 =?us-ascii?Q?V/RJQpOegUsle+M/AGMjIMh6XPk/gO1E77dOlNrqaAe5L7cAIv2EFInFyrvx?=
 =?us-ascii?Q?fq/J9So/kiZFhQ/oV/LOp0GRUJDIEGNxsPq9EQsg/rK5f3K+Gqubyw6pBdMM?=
 =?us-ascii?Q?Aiunk0o/cVZYejvjAcPbDmesLSubIF6aVUsxMvhRQFV6m3Oe6Ib0dltMZ1yq?=
 =?us-ascii?Q?+rhQo4foZjnY5fjyQgyiQ4sM2OR3AKoANVkUXDomEzG0LAkNVn/4wb+YOsMH?=
 =?us-ascii?Q?2/VCcTNVp4m1TBtqwKfVbZunGlxMo2Pag/Hd6H6w8bOqdyJLeUUpG2W8NrAD?=
 =?us-ascii?Q?vJJlX5n1skg481qUZZNfJlo4guXQ73tf+zrExtK47xXVrFt34GH6fma0Gf3x?=
 =?us-ascii?Q?0sz8FfBTzwLZI90qDYWr1i/2qkgm3ocCxk3awg35yBgur2dovXzumPcNn6kz?=
 =?us-ascii?Q?MxtFvbceLJXgQpeNGO/eAdk2Le/Nu5uRSw30LXOkGP7HtRIatXqiLQwWtkAP?=
 =?us-ascii?Q?HwxVLhMO79LbBWVilD5gZenD+drleUgMDAv9HnrRRqDc4t6lsUVGtz5KKxfy?=
 =?us-ascii?Q?bAdhWd2dfWGqzK6PUmCvdJgKJv2gpVTgt22pxKlczmOn2OM5qPZCag1f01wu?=
 =?us-ascii?Q?eYx/d9d1b1nWhtNR2iG94PdRlGJRFyiaUInK64kE7DoHQjecwFnipGo+SHGY?=
 =?us-ascii?Q?yTpJau5zQpdiPnpGwcfM7XNR+V/LRqfxQYokyTOcKTJjrxLeB4AW/wnYwT+o?=
 =?us-ascii?Q?olw4aGz7bZurlOQNqcVI1RmOEDpjqcvhJ1Byj+dN3ucueGIKQ5BUF/44b7EQ?=
 =?us-ascii?Q?JpNcfjiCgIsAuIXPfcysn0Zpk2eZv5BaYB2U7gwOYlXxpQU/0Eies6uPaR3M?=
 =?us-ascii?Q?MD7fwMyeYwj8J1CMVbz2d3kiNiSrHw3k1m2OZ4f9lWRDGiXL3OpQ2AJ5HdTo?=
 =?us-ascii?Q?0av62O1+EctEjJkZ2DjviImNEFJ5nMS5fKIChj53t0MlrQu4/03kugPrW4OY?=
 =?us-ascii?Q?ZcKGOxj+8QwOamOddfUTnkuo/euK2GHqSJF/TgV5BtAjy2XsPA9M7crRaLDT?=
 =?us-ascii?Q?Cy6uaiCUvyrThBaO4Pugp/t2M1vK3c9U1qbTRhzJDppzAJpMPHgt67IWcGvb?=
 =?us-ascii?Q?VoMn/XwMnSDadvcyG+/7BLCM8xl/QlorBzWLy6RKKUNUk4e4uz2343ucVWR5?=
 =?us-ascii?Q?8Gb9E5Fz6EunbUjFc/shvHriqyYAMIk02eFI+J3pG7fr8F3QoQc0Ue54IfXc?=
 =?us-ascii?Q?PSqu9RwuNZlRQqp6Oj27sW/3K2RZuOCbbS9tdsJRQab31KkcBeXn2MYD429o?=
 =?us-ascii?Q?Mfehs2M=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 18:27:37.5135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7d98f2-7afd-4253-09f4-08dcff59db57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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

The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-11-07

for you to fetch changes up to 4d75b9468021c73108b4439794d69e892b1d24e3:

  drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read() (2024-11-05 10:54:11 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-11-07:

amdgpu:
- Brightness fix
- DC vbios parsing fix
- ACPI fix
- SMU 14.x fix
- Power workload profile fix
- GC partitioning fix
- Debugfs fixes

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: Adjust debugfs register access permissions
      drm/amdgpu: Adjust debugfs eviction and IB access permissions
      drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()

Antonio Quartulli (1):
      drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported

Aurabindo Pillai (1):
      drm/amd/display: parse umc_info or vram_info based on ASIC

Kenneth Feng (2):
      drm/amd/pm: always pick the pptable from IFWI
      drm/amd/pm: correct the workload setting

Lijo Lazar (1):
      drm/amdgpu: Fix DPX valid mode check on GC 9.4.3

Tom Chung (1):
      drm/amd/display: Fix brightness level not retained over reboot

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        | 10 +--
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 15 +++++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 49 ++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  5 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 20 ++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 74 ++--------------------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  8 +++
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  2 +
 17 files changed, 111 insertions(+), 109 deletions(-)
