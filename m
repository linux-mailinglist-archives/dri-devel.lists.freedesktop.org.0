Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA7B51DA6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFAB10E2E1;
	Wed, 10 Sep 2025 16:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f4vUCntN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3891B10E964;
 Wed, 10 Sep 2025 16:29:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPrIAA7AJqH8tggntaoGAckoRImJl29DwtBAg06N45hrt5OlP8G01HaHWM1/t4TcFN5WqfSZ1gPIt1oIOOlnC0dKNOYX3jeB9Mp2nFnWuZF4uau8TBYATno5zwHCxNiXCqc2YyZsT8bsArGeQRjNyIDPLz4gClLf0+cJnsWw9y3/k4XMfYkHrElLCdjHFvfB8dAoIRH816Wj/uglED2C6o1h4ur/jhOTRvevx4bsIT4pXJ7cnTVDmiEgKhhKpHC+oR8G6BgnF4QSAcnyMXvDp1ege0/dQlq9BwbRhkQoxFEruKi3BiBHyyN7ZHtp/mFXP+pG+ScvN4Qxq9EtV+3hxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBc/aUN8iyE/D4LP8Lnn38bYDfSjxt9umbUih3Iuc+4=;
 b=OGMe1+mBQK1hxXM6e7KOONm6H3ltyavg4q2Ojxhj2pSnPZd30/PVuMtv/tNhBcuH/0GkEtb/7ilfT0I83dhPmQl6eV7VGibvY+/wzMmO71VE3n7+946pdVVXmgwjN2VSo5ZS0s8wYGTxLzUcDHVREdSxQ6tS8Q66MntxSBVRf2oCjkJvSQJsypSNd6dCNtxgskxG51o53gPZpDOSJZzUli9NqZJdUDp0rIXr7+LhuJOznTHK6jcCh4oK0EBwYYmEGsgwfjyXLKnF+O868WDsdmM6LngsZ+vGZ3mSp8KBpbIEAT2zMxro17d2Gm2E0EkQ3CO5E605RB3WuGt9gln34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBc/aUN8iyE/D4LP8Lnn38bYDfSjxt9umbUih3Iuc+4=;
 b=f4vUCntNyZOWNoR89qYPX5yjTH/cRoRN+GfQMp+Fu2v01FvJMod3g7EkM3NHnUCT7dt0I4n0Z/1A0WWkdmdYVPMtXdV4MYCX3PlCoggov7fscqQStiYvteWibfHaAgQpwQ4qHBdGtZDj9hTqCO3yU8CBsAx6sg4Ib8ldj1Y95js=
Received: from SJ0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:33b::7)
 by MW4PR12MB7358.namprd12.prod.outlook.com (2603:10b6:303:22b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:29:22 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::c7) by SJ0PR05CA0002.outlook.office365.com
 (2603:10b6:a03:33b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 16:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 16:29:22 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 09:29:08 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.17
Date: Wed, 10 Sep 2025 12:28:55 -0400
Message-ID: <20250910162855.2507853-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|MW4PR12MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 803caafb-2594-435c-b2a4-08ddf087330e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IPjVWkQQ6ejghzVd1LmlPyJBpeG242UNx43M6kfw4XuPYzSqPhHon3n8hpag?=
 =?us-ascii?Q?H5gqoVNSin50CrNUvJok3Ok88BHQEx84rlKmGrfaAQgjdhnJueecqMVdh4qf?=
 =?us-ascii?Q?48PkwY/HH2mlc1dP71ZGHkjODiVA+8gLn1EonlhUANJKpizgqyXkaJvihZVx?=
 =?us-ascii?Q?3BtP9ML7Hyqn88MFcMXgq/FTVc9qEJnRKnWttZ7fdoSyq9kzjl3MHR3XHKdg?=
 =?us-ascii?Q?0KymKmBU2mx+FAIKe7U7Edh1QiNlZLf5krnKGfp9o5X4yJyGHyxchdoVEQB1?=
 =?us-ascii?Q?pOF3BVYAuMIOPNGpyHuu+Tdrblklcq6ydufqrXX3ePgGDyG+M2h7DUom8Xv5?=
 =?us-ascii?Q?upzhXl2yOlmzznxOG5QvN2Z7Vd13kpnQEc+8kYgUJfEFg0pzf0vU1g0WXs3q?=
 =?us-ascii?Q?XhmYs94tQdHz0xRw6GlqR0Otdt6s88mZRGa2j5f4zz8vKAjee7fW+W+eE0Qv?=
 =?us-ascii?Q?TQV/TIOklJqgHf4VlqYYZItbavHDm67jDrf1jy+GWAoSDhsO2pPwGNBU3X6o?=
 =?us-ascii?Q?dickbXEHQD2xuez1ZlATpLp0EU/m+4AVYDjMUKe/pa2QzSCFFOfKffxpJOof?=
 =?us-ascii?Q?j1yCshISBFFs97a5LWd41cFBlNqs9BcvMEWOJXbDQ01km9a9Ihps1rPx2n4F?=
 =?us-ascii?Q?we0vvi4nNqlO2rRpQHPetiOuMUCWYSQXya57y+6D9xQAh0MwxbXTOkQS00pL?=
 =?us-ascii?Q?PNl7i1Xk8ihuSgairs2ue5wlSdhK30MnCbUBSvpiC8vsLNjAKV2Doa41Pery?=
 =?us-ascii?Q?PkRowdKVMiATS0rPFD2Fn3VPq38r+v5f7kZO8YoM2lmKth1zY2BPKxXIoQd3?=
 =?us-ascii?Q?I0C8x7Jz2GuHWwfLGAhROqnt+h+4Lq1TfocpCRUlTJwSBGqvwRDdCWuntyUP?=
 =?us-ascii?Q?4UxljBA7Ar186JzbImq8dGd/6lnWvUUhVHEDFpeUzeG/mWpD5PtQf8HR/4UD?=
 =?us-ascii?Q?Q3q0zWSsDtGFrgjvoW3MyVqD/f5zhpfiVRJp2unfzDjWvx/f6E5SAYtMEWfm?=
 =?us-ascii?Q?40xtxFq5DnAn2sNN+8LexgLQ9nNpTZ77j/Fa0USrHC42s/SZL5r7oaVOhGX4?=
 =?us-ascii?Q?K9Yi8r4qEa/Ilq/04ED7Ao5QIX9sOgMy4XQ3UnVBIi5aAfdXnaXJjetgesEq?=
 =?us-ascii?Q?RVFmNPxDqeRRKs2YXetVLDDs3TihWGGNHR6lAdbO2y38LX0KbvaxyA4R9pWO?=
 =?us-ascii?Q?NOdYstifEZ/0ys3MZjw02tmRXVnNxpS4QT5p27NLVukMj3+wb8aszXwVLs5B?=
 =?us-ascii?Q?/57KlsHCo/XqzO4/bFiRs+9NfgqpaosZO/L2pYtkV6j8JCPxlZpnY/gCvmER?=
 =?us-ascii?Q?edwY3Evd4ToQ1y27sBtKIgyky9srbC/GlAqHH1w1OzkbvnOY4sNQOBrfHMp+?=
 =?us-ascii?Q?wh6j4sSoKvRffCjWkuY90DxblMwopLnKYIVNXv6lSrJXlzxIVbNDdhUEncNa?=
 =?us-ascii?Q?JJ5dKk564lj2lpZ/3KttJN2O8Fi1ZxnUyNUGP5wMHD9aKe1WNDFsTg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:29:22.2985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 803caafb-2594-435c-b2a4-08ddf087330e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358
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

Fixes for 6.17.

The following changes since commit 8b556ddeee8da9420699ce221b6267f395e7d72b:

  Merge tag 'amd-drm-fixes-6.17-2025-09-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2025-09-05 08:06:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-09-10

for you to fetch changes up to 3318f2d20ce48849855df5e190813826d0bc3653:

  drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time (2025-09-09 16:42:26 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-09-10:

amdgpu:
- PSP 11.x fix
- DPCD quirk handing fix
- DCN 3.5 PG fix
- Audio suspend fix
- OEM i2c clean up fix
- Module unload memory leak fix
- DC delay fix
- ISP firmware fix
- VCN fixes

amdkfd:
- P2P topology fix
- APU mem limit calculation fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix a memory leak in fence cleanup when unloading
      drm/amd/display: use udelay rather than fsleep

David Rosca (2):
      drm/amdgpu/vcn4: Fix IB parsing with multiple engine info packages
      drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time

Eric Huang (1):
      drm/amdkfd: fix p2p links bug in topology

Fangzhi Zuo (1):
      drm/amd/display: Disable DPCD Probe Quirk

Geoffrey McRae (1):
      drm/amd/display: remove oem i2c adapter on finish

Lijo Lazar (1):
      drm/amdgpu: Wait for bootloader after PSPv11 reset

Mario Limonciello (AMD) (1):
      drm/amd/display: Drop dm_prepare_suspend() and dm_complete()

Ovidiu Bunea (1):
      drm/amd/display: Correct sequences and delays for DCN35 PG & RCG

Pratap Nirujogi (1):
      drm/amd/amdgpu: Declare isp firmware binary file

Yifan Zhang (1):
      amd/amdkfd: correct mem limit calculation for small APUs

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  44 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   2 -
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  19 +---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  12 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  64 ++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  34 +++---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  74 ++++++-------
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 115 ++++-----------------
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   3 -
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   3 -
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   1 +
 .../drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c    |  78 +++++++++-----
 17 files changed, 202 insertions(+), 256 deletions(-)
