Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C694C257
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 18:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86A710E78C;
	Thu,  8 Aug 2024 16:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cMGM8toK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAF710E788;
 Thu,  8 Aug 2024 16:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aovJuktTXfpy+xcNtx1OA9oQv38N3NaFsx+fAa80QX6RA2rWt1adiFGKCbZYTJNTMwtPFvbPUsUFAxg1mYlHP/Ahv+8kTAEyNHKNqlcgxlhO7HC7xkiiYk/q6VQU1avxGFpGsfYk2PFts6HxszBKq/NNi75X32tng7INeM6a0EGK5/LGdPU1f+t8uhx0wIX5H5rR6AKOaotLfSz5jskh0OBH9XXDBTj2HY44kHYrlAkvIuptbNg3qZDvH4TSL3/NJFpdmtyv902L/c+eeQdeXM989BKejm0X4xiUB8IfNaf1XqhLUbVf+7gjysG+WMfC4rpnGzZv16TnrUmA9jSQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBvEJxOlDVJPcZ5TJTqW7X/1FplDCyG1YKZHlxCaGtQ=;
 b=RPoQDVRMT4x6gnuRtQU7PQj+bIjMSmPXariSdZT57w5NbNEcaFtGlLRgPgVXdMz335Iq1Fl0o7HBtAs5ggQCm32uh7GWb5oF8dUeQudbnSN98v2UIrQIuwSSCJ2a5+v/7OAx6J+B5LAtZDBJBW8RbNbkB2yW4M3ShlTyvIyMgpMAZh0fsUYgjpDxcnUUjuxUjZMKu0WkePNhututKqjK/6LXmKqcNmdrSwIE3cfX0IJyBwPZNGbHHVNA0z9sBxZKj6OPQRmt1z0JWu926Ocpv/CXGR1FacV6Tx6NH7kF2cme0QdesR5igmt649xV7U0sOtlkDJ953QfO7B8RvrAUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBvEJxOlDVJPcZ5TJTqW7X/1FplDCyG1YKZHlxCaGtQ=;
 b=cMGM8toKqpJIIvqEbKGKX91v2XaQoUoIGDHLtxh/G+hF0kkPUUUuFZCnGpeQhehiFjBqlLFCwL/ZwSknaeLiizfzRmdOcGJ98aPpaK29w/FGmEVhGWj132DB5RxJt67s37CL+6EleS91mXEqqebRk9t+N7s/LNMa3hL+Itylz74=
Received: from CH2PR07CA0066.namprd07.prod.outlook.com (2603:10b6:610:5b::40)
 by DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 16:11:50 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::ba) by CH2PR07CA0066.outlook.office365.com
 (2603:10b6:610:5b::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 16:11:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 16:11:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 11:11:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, drm buddy drm-fixes-6.11
Date: Thu, 8 Aug 2024 12:11:34 -0400
Message-ID: <20240808161134.1227671-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|DM4PR12MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 168de2b5-1779-487c-a15e-08dcb7c4cfcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K8c8upNMMXHmoe6Pw0xNJ/nhj3CY7YZGXSOOgfSE7mQb65Nkzpl2v6HlNRBK?=
 =?us-ascii?Q?D0BDLpYpfMTTze5T15nRA86Lmw1dOmZqR35PgQfGQICUIgiqoEuMStZ0JXK2?=
 =?us-ascii?Q?Ii8cwoG2S39P+EAWd3XGrYrKe2w24vGqB46k7DNtD/mj3dGWh688qVD6aX9G?=
 =?us-ascii?Q?mY16GgLHPnysq0TJBcW3n9yndkp6n4+6YhSWG3DjwdxClCX/KW3tozBnk3xQ?=
 =?us-ascii?Q?xmqv9Lxc0gvsV+XqCq7aWfpVHHWL5fcHfm20kUtaL3+oTXlsfa2ZU998rKoj?=
 =?us-ascii?Q?ZkwOnWwL+kEeo4pp6lJOAl1eQuAEtzcs01DrOeAaU8LsijNP/XlTKpwPlIPB?=
 =?us-ascii?Q?PCtDSKPuQmV5ZMTux+dkdBqlei/QwQ6guzFSsMzttcfSyE81gVvlrCZaUZ1R?=
 =?us-ascii?Q?lXjNxmsugNLswj8o3+UgRKC833LHwNgfATEHXMQPXhVk6cbGSuxt5nA2lzWT?=
 =?us-ascii?Q?HUfv0o0kFicqGbpwmW1xpNCe6RFaX7BB7lBpH9jkh+mSN813PJ5+URv0PIAn?=
 =?us-ascii?Q?1cq6KvRvIglEa4MjjiMtYGfC0KoIOrQKtzAW6mqeERhZjuNne4R0sf/klHwj?=
 =?us-ascii?Q?HL/2a7nYPjt3X9rvH2nfRcWUfxPYOkb08M/fwr6hEGaUD1ShRJa2C8zQ9+rF?=
 =?us-ascii?Q?pFaamzlub25oBr7DyPon2MYrUanp7uT7zfXC0ATd5t13MiXF9PS//IiSTbhH?=
 =?us-ascii?Q?ub5lPoU2hCK0zARdFzKzC7YiEBalj2FKgbq0Rp/58Vtx5807q7uGbJscf7+E?=
 =?us-ascii?Q?aZsXhgGZWyEvq2aAm7nb5I/4FwxM5EfbENiswF9CTXeoSW9MqpGsftgukg0+?=
 =?us-ascii?Q?RbRnT3v9HqbG3qQbvLxvKgJ3Ziy3quepiG8jbkkRqS7LLKJa/CXNG6pGZU6r?=
 =?us-ascii?Q?BvGPTpK4dQgBWDLYzNyFXVrpD4dBcq3AIqY47pfH6F7eefgWm3zlokywn8A1?=
 =?us-ascii?Q?0HLyVihnDHp0OJUKWVE7UbMAmIdJej9psSyQh8TkaFEWJJUownKUC3GrSkAX?=
 =?us-ascii?Q?akhGuqmpdsNsH3Oft6aMWA3yWKe+455fB/MEDBNfxTLnSUJfEktZyZqkcx8D?=
 =?us-ascii?Q?eUThkauQtraF7bxJDvtoYtP3QRR/CBAwG4ymDeVqvWmxkDVuxXzXccts62SX?=
 =?us-ascii?Q?OXtZUMexlSn0j7pLxLuuP4AiBYgDL+KqlKpjkF93W0Qs/mXXd5LdURoB2mZM?=
 =?us-ascii?Q?uABxvEz+8Kjv1yw1nbGuUD3OFWnaVIHso4BF8nxAqk0kmzI3Sgxwm3v9CQad?=
 =?us-ascii?Q?gjXdTXfzJ85xM4I1ndpsvzdbCKIO0DU5en4wgxwBziZ/zQRfL6/DZs/tV9AV?=
 =?us-ascii?Q?Q1w8yG4dqFBuqDw96+wb+jDn7gm87Ropaw5aRtg61Q9nZlM60PPS/Ey39rTO?=
 =?us-ascii?Q?avu1oPwuDCYvD4L7dJmjpGM6W5YM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:11:50.6638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168de2b5-1779-487c-a15e-08dcb7c4cfcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718
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

Fixes for 6.11.  The drm buddy fix is needed to handle weird alignment
requirements for DCN 4.0 when DCC is enabled.

The following changes since commit 27ce65f65258cf2f2855162cbeef59659a81fac4:

  Revert "nouveau: rip out busy fence waits" (2024-08-02 14:38:28 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-08-08

for you to fetch changes up to 6ad9dafba19f15a64f71c2e1a9e3b6932f96628e:

  drm/amdgpu: Add DCC GFX12 flag to enable address alignment (2024-08-07 18:23:59 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-08-08:

amdgpu:
- DMCUB fix
- Fix DET programming on some DCNs
- DCC fixes
- DCN 4.0.1 fixes
- SMU 14.0.x update
- MMHUB fix
- DCN 3.1.4 fix
- GC 12.0 fixes
- Fix soft recovery error propogation
- SDMA 7.0 fixes
- DSC fix

drm buddy:
- Add start address to trim function

----------------------------------------------------------------
Arunpravin Paneer Selvam (3):
      drm/buddy: Add start address support to trim function
      drm/amdgpu: Add address alignment support to DCC buffers
      drm/amdgpu: Add DCC GFX12 flag to enable address alignment

Fangzhi Zuo (1):
      drm/amd/display: Skip Recompute DSC Params if no Stream on Link

Frank Min (2):
      drm/amdgpu: change non-dcc buffer copy configuration
      drm/amdgpu: correct sdma7 max dw

Joshua Ashton (1):
      drm/amdgpu: Forward soft recovery errors to userspace

Kenneth Feng (1):
      drm/amd/pm: update powerplay structure on smu v14.0.2/3

Likun Gao (2):
      drm/amdgpu: force to use legacy inv in mmhub
      drm/amdgpu: add golden setting for gc v12

Rodrigo Siqueira (6):
      drm/amd/display: Replace dm_execute_dmub_cmd with dc_wake_and_execute_dmub_cmd
      drm/amd/display: Add missing DET segments programming
      drm/amd/display: Add dcc propagation value
      drm/amd/display: Add missing mcache registers
      drm/amd/display: Add missing DCN314 to the DML Makefile
      drm/amd/display: Add missing program DET segment call to pipe init

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  6 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       | 36 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 27 +++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             | 18 ++++++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  7 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  3 ++
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  2 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  2 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |  1 +
 .../display/dc/resource/dcn401/dcn401_resource.h   |  4 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h | 52 +++++++++++++++++++---
 drivers/gpu/drm/drm_buddy.c                        | 25 ++++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |  2 +-
 include/drm/drm_buddy.h                            |  2 +
 18 files changed, 178 insertions(+), 20 deletions(-)
