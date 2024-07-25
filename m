Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1ED93C98B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 22:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D974710E305;
	Thu, 25 Jul 2024 20:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w7DEsZHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2046.outbound.protection.outlook.com [40.107.212.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D9710E2F7;
 Thu, 25 Jul 2024 20:29:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TG0W0E51piUqdnGFP2Jfx3xajhZ3oxJQsxVup+Wq0PVwajP59AWM+Lrc1JYg9G0eKfD58suSdlmBhCQshWKkIGLsYPhuNsIT7FU9ttc0vu1IwUCYzzk5LSzQPTH/7Iid0xnRrwO8fXrcmhUW4Kc3rdAJWqRyb3EpLdq9/oPVsuMau5/h87sg9K+cfjzaEpdS94Qq9+5cqtVyrputQZjzCc0SRqkzuO3RhBnBnt05hKRKY6ChQe6PdRypF/IhGR1cVWQMkF2mlDcvzKpdRkrLmMNzKMOZLYcMTqZ0estYhMy8w8ztouK/pSX2p9vNXT9egZBvQAYg3dDT9prgbf9Ujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vbj7KB1OO6p06xvqOlyxgx9LKHGVgxyuvl3js5FcRQw=;
 b=YDwWgCqHEkqv93u55FZJlUvOnBXDCTXYIWeXPgw2kM6CtvPUOd3IhKEaRGgi0SNaWPcdbgH7CUo5qs6QquJBWm1FnDJxqcVmdmAAizWh3kfkkpGqL1GAS6ytvNFIgNFcalWAaLVvTtNFI+FPPSaSeIuV7sAGr5PzMusT5HcVVcx4PSrmDBoSDmKdhunon6UtjNyJlqCK1/lEK3r7tPhnABHFrmVexwgfDVTdrbNDdADuIAub0gPsn7KxC4qz0o349nf0xCmpRm8OjnP+50v2rwi7M49G+D+Z21tZnxRTAySdbEFuSTU44KvZTWK6k1RMLW9XuCRdqrC0uHSpoc0j4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbj7KB1OO6p06xvqOlyxgx9LKHGVgxyuvl3js5FcRQw=;
 b=w7DEsZHPcLnxAnla+RmXcW7nd8T5YvwfrqqOaEbGeZnmwyoDCFn+J6W5AuXKCePnRbWlxnXIF2jZDSX802qODhKEUUGTr9Z4X5D9EP9yLCrxtepjCbFjWr/2AHr/Wsx4Sx5OIwWgDMByx6Fd+DJwrNHqaZXNYSXF1kPc1HbRaWo=
Received: from BY5PR20CA0007.namprd20.prod.outlook.com (2603:10b6:a03:1f4::20)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 25 Jul
 2024 20:29:50 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::2c) by BY5PR20CA0007.outlook.office365.com
 (2603:10b6:a03:1f4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Thu, 25 Jul 2024 20:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 20:29:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 15:29:49 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.11
Date: Thu, 25 Jul 2024 16:29:00 -0400
Message-ID: <20240725202900.2155572-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 0848f1c6-f760-47e4-c808-08dcace888ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVJnMURKTmt6MW1leXpBcWR3ZGVjRXNxSGxrTEJieVVkSE9qcDBvRGNKS2I5?=
 =?utf-8?B?aGZVYW4rc1MvVDdmQ2MzRjg2Vy9MRlZ4QkdjRXFWODBaSkNQc2FmS1I3d1gw?=
 =?utf-8?B?VmVsTVZZTlhQNDRQSnB3b3lWMForSXgyMDQyT204MjRyUW5iL2szb1MxTmtL?=
 =?utf-8?B?dHRsYnpMRTUyZHJQUHdya0dzZEdGK3huWmhHZHVHM0daSytETE5aNzZaUWJ4?=
 =?utf-8?B?U3lsMVFReUdiYUZqc25iT2JaZnM0NFpRQTFNZ2p5cUtHOVlGdHBxQ0hYVGxY?=
 =?utf-8?B?MmgvdHNiRkw0eG9TWXBqZ3N4UGhZcGZjbmZyOTUwZTA3WklpUGN3MGRtZlN5?=
 =?utf-8?B?TzAyRHZ2N3hWTjBKcWw2a2FGRmRMVUM2bmhSZGs0MStMU2t3enkyVXFIaTBj?=
 =?utf-8?B?RDFjamd4eFlaeGRvOXBaRS9qV2ExWDAzTlpRNitoSFFtUWt6OWpFeEh0QU0v?=
 =?utf-8?B?SU1lMktscnRRekhjYWtnSkxQNi91dDhsV2tUU2FzYUpjd040MTJKdU5FN2l6?=
 =?utf-8?B?Ly9xNkZHamdsaVdFRTV5aHFvVFNwVjJXZXM2Z2R1SjByRFFNQWJDdVF3c3p0?=
 =?utf-8?B?OGJnRHkrbG5WRWtzRUVWaTJOVG1BS0tFenE1b2dDU0JsTDJNSXljVnA2UXBJ?=
 =?utf-8?B?OWc4YU1BNnVLTWUraXBVc1NybzhhaWRENzgvUnVBUnF0UW5BWm8wUk9QdW1Q?=
 =?utf-8?B?Mjc0NXVmT1RmVlFTWTBOVUx3NnJsSXhJYm93dW9JeHAyblJJNWNPelBPT2Jx?=
 =?utf-8?B?Sy9VTldhL2VNR05BOGFFcnJHZ293MUZyWjNKVG4yYWo5cXJ0ZmN2alRxTmRJ?=
 =?utf-8?B?b29pekFlR2NVLzBWTlFrNkUxS3FUYkc2Z1Vsb0xhdnlQRERhSnlXNjFRRUZM?=
 =?utf-8?B?dStsL3I0Sy9WYUJmVXR1d2tEeEUyeHNoZnlkaCtTaFFtSHRZN1BCZGJXcERG?=
 =?utf-8?B?T1dwNzYreXFaZDdST3h5ODREdjluMEllSTlpK2R3VFl1b3pvTWJFdDU3MEd2?=
 =?utf-8?B?dG14NEtXSnpScUhOd0RLaW44SzBVam5HTDNhaFNzY2hMM0srQU9Mb0RQZ0Rq?=
 =?utf-8?B?T0ZLZlJhTkE2Z2dxeDVYeDJMdUVxdnZWNDA4Y1l0d040VFY2K2tKOWFKTktY?=
 =?utf-8?B?eitlaUFrbDN1WjNVTGFPbHZJbjZjVVBoYU9MTzNUS3dVcS9ib1NuTGFpMXE2?=
 =?utf-8?B?ZUlDMmRXWHdtdFlhQmJNbCtsdWVYY01Oc2cyVDBhVzhjaEJ0K2JreUEwd0NH?=
 =?utf-8?B?NkI0cnB6dy9WRy9WT29jWlkvL1ROVzVTZXlQdXR2dlg0MmpEZUIraDV1UnBt?=
 =?utf-8?B?eExKRFJYUndvelBOOThveWJBTnJFVjU1RUdYbmpjdDRqbGlGNjljaHpUYmp3?=
 =?utf-8?B?akhkZVdGd2J5MEprejB3SnduekNIMVZhbENjTkJuWXBmSUpZaFNOYmhaT05u?=
 =?utf-8?B?T1N0WFlNQmhmdHpPazNJZXA4bkRXTEhhNFFwajNCM2xuWmtPSVRIa3lnYTBa?=
 =?utf-8?B?TmdIUnFQN3VVbWdKd3RDd3lMZkZkNkxSOUVqQXhoWlpQK1ovUFpvV29FcUVF?=
 =?utf-8?B?Tk43OHEyZ2JXQUhadVEybUVocVBDV1I2eDZldlFBQkIrTFdKYm1Gb3pleXR2?=
 =?utf-8?B?bk5kVE93ZUNRelRHVVlNbHk3eFIzcmt5WlpIa3BmV2p5WkJ4Y0JvZTN6VjNH?=
 =?utf-8?B?QlVoSDlZNDlNazN5ODVTZE0vbndTR0s0VTJ3ZTdqelh1YlB2WmlrZ2M5SG1x?=
 =?utf-8?B?bW5Ya1FZallHTXpHc0FmK0UzRDNvM0x4d1BJbEJVMnJrbnc0cXdCTEwzVnM0?=
 =?utf-8?B?ZWoyQy9UVzhjQXIwZGludDBRMDJ5ZGJCd0xhYmZDRnU3cDFqR3JhTmtrL09u?=
 =?utf-8?B?TUZIVU5YcXRRK2puZVNQNkdhRjJNWFRJZHF1OHZyYVJ4Y1E9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 20:29:50.4336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0848f1c6-f760-47e4-c808-08dcace888ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346
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

Hi Dave, Sima,

Fixes for 6.11.

The following changes since commit 627a24f5f25d689682f395f3df1411273be4436b:

  Merge tag 'amd-drm-fixes-6.11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-22 13:03:50 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-07-25

for you to fetch changes up to 5659b0c93a1ea02c662a030b322093203f299185:

  drm/amdgpu: reset vm state machine after gpu reset(vram lost) (2024-07-24 17:30:49 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-07-25:

amdgpu:
- SDMA 5.2 workaround
- GFX12 fixes
- Uninitialized variable fix
- VCN/JPEG 4.0.3 fixes
- Misc display fixes
- RAS fixes
- VCN4/5 harvest fix
- GPU reset fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell

David Belanger (1):
      drm/amdgpu: Fix atomics on GFX12

Jane Jian (1):
      drm/amdgpu/vcn: Use offsets local to VCN/JPEG in VF

Lijo Lazar (2):
      drm/amdgpu: Add empty HDP flush function to JPEG v4.0.3
      drm/amdgpu: Add empty HDP flush function to VCN v4.0.3

Ma Ke (1):
      drm/amd/amdgpu: Fix uninitialized variable warnings

Rodrigo Siqueira (1):
      drm/amd/display: Remove ASSERT if significance is zero in math_ceil2

Stanley.Yang (1):
      drm/amdgpu: Fix eeprom max record count

Sung Joon Kim (1):
      drm/amd/display: Check for NULL pointer

Tim Huang (1):
      drm/amdgpu: add missed harvest check for VCN IP v4/v5

YiPeng Chai (1):
      drm/amdgpu: fix ras UE error injection failure issue

ZhenGuo Yin (1):
      drm/amdgpu: reset vm state machine after gpu reset(vram lost)

 drivers/gpu/drm/amd/amdgpu/Makefile                |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_df.h             |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  9 ++--
 drivers/gpu/drm/amd/amdgpu/df_v4_15.c              | 45 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/df_v4_15.h              | 30 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           | 27 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             | 12 +++++
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |  4 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  6 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            | 54 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  6 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  6 +++
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |  3 +-
 .../src/dml2_standalone_libraries/lib_float_math.c |  2 -
 .../drm/amd/include/asic_reg/df/df_4_15_offset.h   | 28 +++++++++++
 .../drm/amd/include/asic_reg/df/df_4_15_sh_mask.h  | 28 +++++++++++
 20 files changed, 261 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_15.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_15.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_15_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_15_sh_mask.h
