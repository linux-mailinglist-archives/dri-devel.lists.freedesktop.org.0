Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4FADF7B6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39CA10E94D;
	Wed, 18 Jun 2025 20:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w/5LLVox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE7810E94A;
 Wed, 18 Jun 2025 20:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoWGiobIrpA17IU6vNM6avBLFlglwV2Q5DzjPe0plX4JhBnxNPu2v5LEvrUrS+sKHJCv6RbqscmT0w2pXKHgmZRtPp93p3bjcvf9VvoD9QtdqMMbUVDwT/o8qCCqY+9UeVcD7JjjKp21UxBHlNtifWAT/SEqy/n4iSu+fHEo3MsZGIKVvDHRgcN1aBg1+pavMWAJYYMQ80maeI33wzB+Hj7WY5vTMuwHLAekpsgeMmjCuVfbApi76Nez5i1f2dfTBJLVwa3zU3NkyL8pIne12NHqKcdQfHSUiQDQUS3Cakb7d2TB6mJIQ2VgX792m9LzeYp/H69HSarE7eUVrBEIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c6o1lRE4ioJzgOQLOe6Zm3n6d46IPFEwePeYvYJhJY=;
 b=DrZxitfhZY1+QiMd6v/dTNIbL5yTS8/Cepw+/yW0tlp3Tt45LTXpojkFuDfD3OeqbsUXS11LOWmBHaZ/kasukQz8OBiB+A1DV12L0SwIkJTa6nBP8A8UD5lt2fiWVtfzgsQQOA+YCWyqsCiXl1DoETGgNNkN8gon5Kua1fvmVERenHP655ZC7ex231LfqzoIRJ08tZWKOuIAhcLqyVsO9gqP2Q4B9j7rmCVzw5puy82IFgPWQrvqrwOKToTMOaqXT1cqtXfVGCwDpkyvdvG+O1m438y3K4XGCu3Um1lWWf8t+HRygxUGdZyo5W1wjXWvEtvnbwskXJvRyckuV0mhNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c6o1lRE4ioJzgOQLOe6Zm3n6d46IPFEwePeYvYJhJY=;
 b=w/5LLVoxDAMwPUHRVxjtJQwxY3gDE5I32qDX8OMElDGAleMCtxJgllgP+zwNJ35EU5UlvcgkCYJ+1ttE7xy+eDT8omvXI1LBJRq61eD0NRGqRupwTFzf9m/MXJeNW/X6gjyT756UGq4fDVmO8Zp8Hf2IXuxK0hAkkc/VPM+myvQ=
Received: from PH3PEPF000040AC.namprd05.prod.outlook.com (2603:10b6:518:1::5b)
 by CH1PPFE5ACC0FD2.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::629) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 18 Jun
 2025 20:31:30 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2a01:111:f403:f912::4) by PH3PEPF000040AC.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.22 via Frontend Transport; Wed,
 18 Jun 2025 20:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 20:31:29 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 15:31:28 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.16
Date: Wed, 18 Jun 2025 16:31:15 -0400
Message-ID: <20250618203115.1533451-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|CH1PPFE5ACC0FD2:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e63684-6243-4ae1-b5c3-08ddaea71b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5pcACS6TBn0Ulm5VzPHXJQ7hca7b8xsoSF1/Jo8M/Z2Rbn5KeAuDQWebe4A0?=
 =?us-ascii?Q?7Y95jXR2LdmFqNpD9STBDUnxAqcneGB1FmiO7LfnKCgPuyEvQKUwF2bTWBO9?=
 =?us-ascii?Q?+apJIDrHH08Ue6ZrR6MLdPfjw6BqWX+3P8WIF3oRaHDgcuDmRp1wn5tJ/ohi?=
 =?us-ascii?Q?LcMwQUwqcyX5078ChJw/xwGflkh5jOwUPM+scADuXijXT6Lj6PcfrHLiwuMK?=
 =?us-ascii?Q?DH2q39lB7FLMxMPLT9uIoUJXnopQvLTbdIMTOafJHQkXokGte4NS4+X9ahvV?=
 =?us-ascii?Q?WVaUj0m47nYw34ugyYvouw4qnuHSbX9eGF2QgfixXVAd8wZxqm9TxG+l7eKM?=
 =?us-ascii?Q?gnCvH4wG9lREimFCKB9OXVqBRE6MJd2LW45imT75Y+7izyzg/UnsfnJx6RPR?=
 =?us-ascii?Q?gZ4EQ4y1BOUIHnK7fjDP5OeOd5CE375/WgnDpKcW+vY3cejgNdlyjX3qWiD5?=
 =?us-ascii?Q?vOFkTNlzg4Y1jSDhHhzhRTCe+Mq6oivxIXMUrHGMdjVxzZwQMNs0faWLsotM?=
 =?us-ascii?Q?6PS1iJ2UyskiVtGm24C1qC6m64sky+iUe2vWq1zPlu16ZxRkSoHIEanquyry?=
 =?us-ascii?Q?k/hXLTxA4uHV3pXHXs5fM4rrZdcZgsOl1sJFSr1K0yYUz2hg4cgyN/Cd+YDw?=
 =?us-ascii?Q?hXeU3eKMSa7ScVfO3SET7yRnba9uq+tBSst2oeCUtDTnP4FdPh6PrKqgX0Tg?=
 =?us-ascii?Q?nP0YT2SmmgHxCOIVfoj1BUYO8SZevYH7T3vGyDzo5tOA3Z+M76O2T74+/xkV?=
 =?us-ascii?Q?yQf83HdC7jF7ahpynCEgR1FEHxBJ6qg5za1KBIA4pBwPIpRDDIzj93f8N0iy?=
 =?us-ascii?Q?Z2GjkUvWtstxlxVYSzgq4SufQtvDwyA5fkgElAKLdbJlscSl+XL4KOZ0daw/?=
 =?us-ascii?Q?zXteOKKHI0e9y9KQkfLlt+PrYqhzcql4IjHVIHMFnY5XAA3p1+tkIMIKKzzH?=
 =?us-ascii?Q?0gpHFxgq9emSsC8gKLqi/GNJEXPIrOpZUrcH7uDtfHIRrcU3jX9wHuCZ7JAG?=
 =?us-ascii?Q?0BB8a8l9cqEQ89vyzPhTZ6jZ9Dg5rwK5v2b9tud26k8TdOSOgjHcUJxiBoTJ?=
 =?us-ascii?Q?yxCQWmHzTRtSoAVzWtVUavmlfP2miLxbS0dT0+NjjcqLnoSoniEiEsLQrEly?=
 =?us-ascii?Q?2YwMoitG4ct6K7bCkFwp39gP7bfd5mqr8K10O/2l+zVCv8t3XnJlhHqPM4mD?=
 =?us-ascii?Q?Ydi8EkkEx/+fxu9pA2BjUUW4Z5YscN44Cfu7uRGycCp/wJ0FPKuv5OaxIF9X?=
 =?us-ascii?Q?zYDrFUteu5jL9+ZQ6uMlmZyiYRxhklRgGau3sXHzLOVUqa34dJgve170LYQC?=
 =?us-ascii?Q?82U3PJnmmSipJpUdSPB+O468+EBMqcMTwXOWGv1KYXA9FVDO0JK11I08xRsd?=
 =?us-ascii?Q?Ikw+1fPZeQK11vvPOy23pMUhlc19SENpbmA1sdi2WSTlRnGh7oeCWhWH9Ssl?=
 =?us-ascii?Q?k1NDljDELgYi9JinKmR692OrGPDzVotvuGCV3JWXK3eKg41xGrD6gQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:31:29.2200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e63684-6243-4ae1-b5c3-08ddaea71b0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFE5ACC0FD2
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

Fixes for 6.16.

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.16-2025-06-18

for you to fetch changes up to fe79ef3530d3c681ef2d5644a9d1d1a67b21426a:

  drm/amdgpu/sdma5.2: init engine reset mutex (2025-06-18 13:17:49 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.16-2025-06-18:

amdgpu:
- DP tunneling fix
- LTTPR fix
- DSC fix
- DML2.x ABGR16161616 fix
- RMCM fix
- Backlight fixes
- GFX11 kicker support
- SDMA reset fixes
- VCN 5.0.1 fix
- Reset fix
- Misc small fixes

amdkfd:
- SDMA reset fix
- Fix race in GWS scheduling

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: switch job hw_fence to amdgpu_fence
      drm/amdgpu/sdma5: init engine reset mutex
      drm/amdgpu/sdma5.2: init engine reset mutex

Alex Hung (2):
      drm/amd/display: Fix mpv playback corruption on weston
      drm/amd/display: Check dce_hwseq before dereferencing it

Frank Min (2):
      drm/amdgpu: Add kicker device detection
      drm/amdgpu: add kicker fws loading for gfx11/smu13/psp13

Jay Cornwall (1):
      drm/amdkfd: Fix race in GWS queue scheduling

Jesse Zhang (3):
      drm/amdgpu: Fix SDMA engine reset with logical instance ID
      drm/amdgpu: Use logical instance ID for SDMA v4_4_2 queue operations
      drm/amdgpu: Fix SDMA UTC_L1 handling during start/stop sequences

Jesse.Zhang (1):
      drm/amdkfd: move SDMA queue reset capability check to node_show

Lijo Lazar (1):
      drm/amdgpu: Release reset locks during failures

Mario Limonciello (2):
      drm/amd/display: Only read ACPI backlight caps once
      drm/amd/display: Export full brightness range to userspace

Michael Strauss (1):
      drm/amd/display: Get LTTPR IEEE OUI/Device ID From Closest LTTPR To Host

Nicholas Kazlauskas (1):
      drm/amd/display: Add more checks for DSC / HUBP ONO guarantees

Peichen Huang (1):
      drm/amd/display: Add dc cap for dp tunneling

Sonny Jiang (1):
      drm/amdgpu: VCN v5_0_1 to prevent FW checking RB during DPG pause

Yihan Zhu (1):
      drm/amd/display: Fix RMCM programming seq errors

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 82 +++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 30 ++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            | 12 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 16 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           | 16 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          | 17 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  6 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  5 ++
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |  9 ++-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 10 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 55 +++++++++------
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 33 +++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  8 ++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  4 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  1 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  5 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 28 ++++++++
 .../display/dc/link/protocols/link_dp_capability.c | 38 ++++++++--
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |  3 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |  3 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  3 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |  3 +
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 12 +++-
 35 files changed, 327 insertions(+), 110 deletions(-)
