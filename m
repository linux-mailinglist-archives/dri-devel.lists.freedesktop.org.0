Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC1A12709
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 16:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419710E717;
	Wed, 15 Jan 2025 15:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jga0Y6yO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33C610E713;
 Wed, 15 Jan 2025 15:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPXGfALvrGigN1qG6CwoKZdQVjw+TTnLkOoFO5zyxQ7zGfqVFU8PwEIEjRznip1GP5UxsIrpvOB7MRa84pn/rTsMfLfvvLxWzmuzTjz5CP8H9y89r38NPmkO4dwykK4mae8sh55hRaQJY6m8mfXfGhzGlsKZNOzibrdmdo/99GhbCqcRKmON19mMHgUCZFCoF50mTiI2Im0MvdSu0191qrubQGRcEx9hxd5xo+De1fqiv6m1JnMX+VBl7meNWt3XvDz90grV8DU+j3j8V2HLdB6/oBHb0VSEqUp1ZGKGsHTlsxBnU243H8Yd4b8QEtuuuHHaEEMyPkz7TVkAMIX9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0drhooTjna/JGJl9ChD7f/6VZzhpQZum8XG00Ag2pew=;
 b=czfm7JmA8sMmeJYgLHhtTI4dHyX20Ry5IFC25A0fp1qNaqe3EzA4A5lQyKuBb5f6R6VzD3b1O7iXgq1L0gv9WUnB9FrQAbPCnFQxJv5dYS+K0QflAx1v9/T+yECzX7JOqSCzXyQIvLtNeXao1NVn0L2wkMVraisjd41pYsGyyfC4jaj9jAbw2BxrLV39FKa2hlmcuRP+Qo/Pq71io+tdJ0BiG/cl5j8QiTQrRcaVYPGXfoAPmQlVTr/fqfJQbwkTEjxrpfRiQhmLP1hjORbzDkIJOU5dB7Jyt22fCJtHmvcAnsCX8Nd127NRV3oRfBD7Tr3o36quVqigQs2dTXIyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0drhooTjna/JGJl9ChD7f/6VZzhpQZum8XG00Ag2pew=;
 b=jga0Y6yODgxgo4wvZ8Mgu0iyMEBDDV1qeQ8RzXLCQt6HuW7kxMhDrOduD+JYStZTNGASIPY0FRInIvp7DLQscalIfDfxKb/lO8OJL0OEkNUD3Zup6+vaxIyn7Z4fahZ33wskVm01MuvZrFnUTvy3MW3ZhBYPJYJyNTFxw52icbI=
Received: from BN9PR03CA0617.namprd03.prod.outlook.com (2603:10b6:408:106::22)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 15:16:19 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::d1) by BN9PR03CA0617.outlook.office365.com
 (2603:10b6:408:106::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Wed,
 15 Jan 2025 15:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 15:16:19 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 09:16:18 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.13
Date: Wed, 15 Jan 2025 10:16:02 -0500
Message-ID: <20250115151602.210704-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbaadf4-6d9f-485f-77fc-08dd3577901a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1I1YURocEppbWZvVzVldTJyVEhoYUtNM0VjUlZnamozdTk0OEJCSEJvaW8w?=
 =?utf-8?B?VXhPcHNpUXpPcHJkcEVhNFQ3N3JrU1ZOLzdVWWRzOVA0Y08wUzhSQml6aU5M?=
 =?utf-8?B?M2JPS3hMa1MwMk80YzVMZ1Y4ejlVbVFqelVnNjF0L013WGZyMXRvSkpEcjRU?=
 =?utf-8?B?WmgvODVVcHdWbklZOWFCaEJ6MWFRci9vZ3ZDNHQvc2dnN3c2NlBFcEpXcnFp?=
 =?utf-8?B?bHREUm9yYUZkU3FOOE40L3NtQklJalRpeFEwbXVyaHhvd0RnU1poQitncjlP?=
 =?utf-8?B?T240dmloNnVpREJYYzhKUXRxQll3NllqQTRrQk92TVhkWld0QkZhUFJJLzVJ?=
 =?utf-8?B?cE00RFJHck9weUdvQy9tek9lU0dWS3k0NVdpeGwxckRjQzE2VFpja2kyM1VQ?=
 =?utf-8?B?Zis3ZjVxUGJzMnpycUp3aE00c0MwWjRSOHZGRDNycUgyRXNXVFltZE9HZ285?=
 =?utf-8?B?N1Y2NXlIQW93emE3LzlTZXIzOUxQQmF4SjBEYlNqY2dJanYrVWtTaTl6emM0?=
 =?utf-8?B?Q29Zb2VzNGJlUXpNUjMxZEl2RUtCWGlFMWdwUjFwNXVDaS8xcnZjNmNMaDhu?=
 =?utf-8?B?Nmw4NUxUNlcrZU5vY0FYbng0V1FpSDA0MW00Y2VsakE5Yy9uK0RobVVvSXJX?=
 =?utf-8?B?SjhtZm1nRWgrSnMrSWxEbUZpSWNmNE9waTgxLzFiZHpVdWNVWWRoZ0ZaM1Bz?=
 =?utf-8?B?eUJCT2hGMU9IRisxTUFOdmJvSEcxZmZsOWkrdXh4NVNMSVR3bjNjdU1WaVVQ?=
 =?utf-8?B?Y0hhSHZJQklFY1Bac0srZmJmZFF0c2dENUFsZit4MGdlQUFmaFpMYUkvQ1NO?=
 =?utf-8?B?TnlTQWpwOVUzc0lwWWJUVDZtdVFlRUpLYWpSQ3BNRG94UzRuSUw2czRsa0k4?=
 =?utf-8?B?dnAycHRrMkpyTkg4VkM2a2l0QU5KU2g5bldBeVRzWkhaZGxPb0NudXdmMWd5?=
 =?utf-8?B?V2ZPWkhFZU4wTEpaa1loSnBrRmtRL2hLeXdpYm5BTWFVdkMvcFdHdlV0TnlY?=
 =?utf-8?B?OGtKYVlhQngzRW50Ny9pZzNBQkhOcmVaUWpTd1hWK0RQNzhZcm9LZkhXVm0w?=
 =?utf-8?B?cW51ODR5clNnYnVGb2FCMjlJVXNWVEtObXhuZzJ3a1dsbStVTTZkRHFVZjZY?=
 =?utf-8?B?T2E0eitGR09iRXFxK0ZhUzJTWkczR2hTU1hwUjNFb3N1Y0lYQjJqMWVyRm1l?=
 =?utf-8?B?QTVDOGNkZm1IWUVBc3ljWkl6dzlqQlozemZHa2d4OUFmNHgyaHFPOU9BNnpl?=
 =?utf-8?B?RjFUNHJTWEovYnVtUDdxUjlCcFZ6Ni9ScjdOaVhzVUF2WWY2NU01NTYrYkJy?=
 =?utf-8?B?NTIxVU5oNVJXczhIcHJWRVVSZ1pFSWo5djlTeDBIVG1VM3M0YnBVbzg0NnJU?=
 =?utf-8?B?MlcyNnlycktIcmFERlh5ODZGd2wyRlVxa0cvbnpQaDFIWTdzNllTTXhMd1d4?=
 =?utf-8?B?SUk5dk5ZK2hVS1kwTDJpTnNJZ0VnWGNNWDBvcjVBd2I3SHRRMzRFY0FTV1JV?=
 =?utf-8?B?MG5JK1hVSjZJWCtaMFNDVjVFdTN3QWZKMkQzeE5uNEZVcmJIME5IWGh4Nzha?=
 =?utf-8?B?NklzSWFGYUlWRkZyMmwranFxS0Y1N2daYTJ1NnFmRFE2cCtVQWVoTjlzT0hy?=
 =?utf-8?B?QmRvb3RuWGxsbkFTZU1sdGErbFB4bS9XS1VDdHZ6cThwK1ZQR3IybWllSUxu?=
 =?utf-8?B?djh3VExzelFtOC9LVFRuVWh6K0lkYTFwWDVTb0Z6bWljN3Zoc1JycUdGNHZ0?=
 =?utf-8?B?R1NOSVdKam9lRzYxMlo0bkxOWWxvUEREMU44Q1pObENjdDRKRWpRS0hIWVlR?=
 =?utf-8?B?cG5WaVVPdmNoT1pHOE1aQW9tR0xCVXlhcXBtNExDVTV6Mkk0MXdrMm5QcGUv?=
 =?utf-8?B?WTZrS1J3d3RoKy8weDZnRmFlTFkySWwzU1pBbit1U0pRNlc3UlF4U1BaMmFL?=
 =?utf-8?Q?VOaLTycZrQY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:16:19.0731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbaadf4-6d9f-485f-77fc-08dd3577901a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
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

Fixes for 6.13.  A little bigger than normal.  Lots of stuff that
built up over the holidays.

The following changes since commit fddb4fd91a955636baa451fe82ad0266f55c7ede:

  Merge tag 'mediatek-drm-fixes-20250104' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-fixes (2025-01-10 16:57:59 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.13-2025-01-15

for you to fetch changes up to bd275e6cfc972329d39c6406a3c6d2ba2aba7db6:

  drm/amdgpu: fix fw attestation for MP0_14_0_{2/3} (2025-01-14 11:55:54 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.13-2025-01-15:

amdgpu:
- SMU 13 fix
- DP MST fixes
- DCN 3.5 fix
- PSR fixes
- eDP fix
- VRR fix
- Enforce isolation fixes
- GFX 12 fix
- PSP 14.x fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu13: update powersave optimizations

Alex Hung (1):
      drm/amd/display: Initialize denominator defaults to 1

Christian König (1):
      drm/amdgpu: always sync the GFX pipe on ctx switch

Gui Chengming (1):
      drm/amdgpu: fix fw attestation for MP0_14_0_{2/3}

Kenneth Feng (1):
      drm/amdgpu: disable gfxoff with the compute workload on gfx12

Leo Li (2):
      drm/amd/display: Do not wait for PSR disable on vbl enable
      drm/amd/display: Do not elevate mem_type change to full update

Nicholas Susanto (1):
      Revert "drm/amd/display: Enable urgent latency adjustments for DCN35"

Srinivasan Shanmugam (1):
      drm/amdgpu: Fix Circular Locking Dependency in AMDGPU GFX Isolation

Tom Chung (3):
      drm/amd/display: Use HW lock mgr for PSR1
      drm/amd/display: Fix PSR-SU not support but still call the amdgpu_dm_psr_enable
      drm/amd/display: Disable replay and psr while VRR is enabled

Wayne Lin (2):
      drm/amd/display: Validate mdoe under MST LCT=1 case as well
      drm/amd/display: Reduce accessing remote DPCD overhead

Yiling Chen (1):
      drm/amd/display: Remove unnecessary eDP power down

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 12 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 41 +++++++++++++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 25 +++++++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 48 +++++++++++++++-------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  | 35 ++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |  3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  3 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  4 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  4 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 12 +++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 11 ++---
 18 files changed, 157 insertions(+), 64 deletions(-)
