Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5E4988B3D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 22:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F7010ED18;
	Fri, 27 Sep 2024 20:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="14Fprj+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E3010ED17;
 Fri, 27 Sep 2024 20:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEhflLaevNCErS8+sbmcL0JPHhZqMrCxMSvtPNbrFApgKofRVVbo+bQbzlJlc54AuPLvMaMZJFTLao6+zPQC/GezQODrxMY7MJ3+1EpEVSwWfT1cXfPc0/Pt6gn2VVQhpoQay/0poh+A3OVzUiyJ4m6LnXT0twQmtrzE5IJ3pITfpqePZZtDD6TlO0LSkiotYlYxiiCH6lYG70tj6TM5aeDOII+7eAcUQyRqTUKezLdJknfJoph6we91RhONHvPj1VP1CKOWRQaTvgq9Jf6RlrrcIbvXkXg2iYpRSOkZo+gnNWRURKXuMjs7sPixo8A+kXgWh77NL6FylhticvXTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o711O5DTIJL+kiJf7mtckwz2zikfF1kDonLhti48jPo=;
 b=Eu1gakhGeFDkj+lfb3ANZOZBAgsmVE/8wIlPk+kqPUFm3ntznhcMeuuOrlQjCx4+CDvf+mwO0Q8cC+lMqAwfWD52C0mbRQCRl+vLSyItkH/b7q0hqq9rvpCG9l34gNWletUFPJrTJjxySLICOBtsdC8ybIwAjWcoqg478cwtGy0WaOPQ2CIJZ+BmkkadtA010BpMu2CFmacrovXR/QTgTiGGZdfa0BBzwMsI1YfAFUykBPh85W+YFnXl91iYAnpDMPExIA6kKXHSlSkkpSSJi57c/NcjZZrFoBpUEoLnSZHNFeSCFT6+Lwpfti1r4FF65rXNwpZOwJMPOspQNrnUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o711O5DTIJL+kiJf7mtckwz2zikfF1kDonLhti48jPo=;
 b=14Fprj+89ZBCeAyS3uLpL2W+y38OsYtlRZ3ull+Rzz4Lzr7/7hD/QPxyl68lYVFhq9u9yb3Lav2XD7upky92OW4lBkUIcVORVLor1yxa5DiZjkyxaPkMX4VSSyvZMyP+jzGt6aOLj5ZCUP8p769qVDTJMjLxQmXhTjTTaluj/NM=
Received: from CH5PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:1f1::28)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 20:28:34 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::5e) by CH5PR03CA0016.outlook.office365.com
 (2603:10b6:610:1f1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24 via Frontend
 Transport; Fri, 27 Sep 2024 20:28:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 20:28:33 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 15:28:32 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.12
Date: Fri, 27 Sep 2024 16:28:18 -0400
Message-ID: <20240927202819.2978109-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DS7PR12MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b5888c-c1a9-475f-fbbd-08dcdf32f567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1VUbTI4ZHEzSWYwZHNOVUZoZUZQSzQ2VjFSdWZlWjlGelBrUjBEVjd6ZG0x?=
 =?utf-8?B?cDhHODRuUHdMMmlVVWp5UGxjQ1d3N0NtUU1LVXQvT2dpajJHak9VZjV3UXRW?=
 =?utf-8?B?b21hTG01ZHhSYkxPK3NDN0FpVDFvMXcwYktxVlE4QWQzbFlKNU8xVEM4K0wz?=
 =?utf-8?B?THdSbG1jai8xT29jWHJyNXRuMTkrV1RqYnZ5RThRWDRFRktLSkJlSEZYTEpn?=
 =?utf-8?B?REVYZ2R3TzdJUDZ1RTZCTE1WaTd0QUplQmE0aTIvTlMxTVorUnF5dHpVUXB0?=
 =?utf-8?B?b1BQRE1qZHN3bzZ4TW15SXBCaXdsVUJLcTBiZVVBbGFad3hhdFJiY3MwQ1M3?=
 =?utf-8?B?b0YzQ2RLUlNVUnlZb1RYY21tcEJtL2h4cGFvcVdJUWs4SjJyZmRPZWlkUk5Q?=
 =?utf-8?B?Ui9LSHlqc2pwNEtDb1JrTmFwbVN6d0NWdTBTOElYdm1TK2FtOG80Q1ZDU2Fw?=
 =?utf-8?B?S1lLclVKVU05MGdrekFGSnIvQmhqY2dqYWZQUDBlZkJqSW9Yc1IrSTVnNU54?=
 =?utf-8?B?VGpzNE05czkwTGY2eUtsUVpaSDFCOHhQV2hyeVJ0SGE0aytmdlFqSjExZ2dz?=
 =?utf-8?B?S29OdWM1N25ENURTbkQ1N2oySmpQY1EyUEpNUlVzZzRPWmF4cEZydmJEdTA5?=
 =?utf-8?B?VTdJaFh3bDFvb3hHM2FjSTUxR3ZMNzR6MldSeVVBVXRQNGMxcDh6Rms3UDVF?=
 =?utf-8?B?SWRoRDZCSlJRbFBNK3V6L0w1REYzMEpiTUZNUE1jaFpvcHFTSmVia1o3QW4w?=
 =?utf-8?B?Rnh3K0pQcDNRNkZXSmFDTVJPVXgyMno5SzRteXhqTk50Yi9BdzF0MW9seWc3?=
 =?utf-8?B?cnREWmhYTkxUeDFlWEt3K3BIWEhIUW4xTDdtbEJtQ1lYS21xamJraWJhcU5U?=
 =?utf-8?B?MXFlaXBRTXF4NkJ6ZHBJVERSd1o2MW9EYklMeUdCRFE1b2NRa3VEbktXTWN6?=
 =?utf-8?B?MzdoTG1BellUSjErV3BENGFLT2RtRi9rN1grN3pKYzlISDhhdTAwRXl4NnpW?=
 =?utf-8?B?TUtXR3NBc29VV2lKa1BLMGVxOVVBa29mdmhHY3BVSEQ3WXZhRnluSWRrZWsy?=
 =?utf-8?B?djNudXIrNjRubEd3allxYVg2WDczQkNZNUkvWHBkazBYcjNKZW9GZk1JMzZm?=
 =?utf-8?B?NXUyZHZobkxqMVE5WmJGL1c0K3F5eG16TWN3cXFhTWgwZ3hNVFpCUWtoVUdL?=
 =?utf-8?B?U3VGcHN6K1drVCtzeUswRHErdWpWdjI5S1drUCs0QWY5V2RNWWZzZGhldDh3?=
 =?utf-8?B?bHhzSWhvbzUxUUVUTndzVkdoc2Q2VThYYjd5T3VTaXNjeWZiVzNrNGZGTjla?=
 =?utf-8?B?eVF2dGQ2QitDR1ZTMitOT1BqSklXQlhSTVBUNFBiNWFhWUs2czhYK3B0RGJx?=
 =?utf-8?B?SjcvbUVIaU43TWx5VnIvdkE4NUhUMDRLTnkxbzY4RStyeFlkZGFTUENEQlJw?=
 =?utf-8?B?ZlhDT0FOcnFaelMzajVWSDdVekl3VTZzTk92Qjlobm5taHdPL1FTTXRYQkts?=
 =?utf-8?B?ajBteXBPYnpiamN2TjYybzB3cS8xbVdTS2JsL05YK2o5SnN5NVFQckpkMmZO?=
 =?utf-8?B?c0J2YlZhdmpsSm80YlVEanJXaHhvN2JHQ3JiUmJlQWYxSzEzTnl1YUo5WU96?=
 =?utf-8?B?U0pabG8zWmFlK2ZXRU5RVHZxQ1BwdEY1VjJ6dm9tVEFGL0c5V1YwUGZyaENI?=
 =?utf-8?B?RFRHSnR3TW5pNjJTRjZJdTVrS3k5R2I3Snd0VTU2azhPVDFuZ1JzMFNCLzlR?=
 =?utf-8?Q?9+XueJxXqsp9FIGgfSKuui5pBit84gH4+wngX/W?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 20:28:33.7109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b5888c-c1a9-475f-fbbd-08dcdf32f567
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815
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

The following changes since commit 84f76408abe989809de19d02e476b044fd985adc:

  drm/amdgpu/mes12: reduce timeout (2024-09-18 16:15:13 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-09-27

for you to fetch changes up to d7d2688bf4ea58734d73e18edcbf4684b1496d30:

  drm/amd/pm: update workload mask after the setting (2024-09-26 17:05:10 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-09-27:

amdgpu:
- MES 12 fix
- KFD fence sync fix
- SR-IOV fixes
- VCN 4.0.6 fix
- SDMA 7.x fix
- Bump driver version to note cleared VRAM support
- SWSMU fix

amdgpu:
- CU occupancy logic fix
- SDMA queue fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix vbios fetching for SR-IOV
      drm/amdgpu: bump driver version for cleared VRAM

Christian König (1):
      drm/amdgpu: sync to KFD fences before clearing PTEs

Frank Min (1):
      drm/amdgpu: fix PTE copy corruption for sdma 7

Jack Xiao (1):
      drm/amdgpu/mes12: set enable_level_process_quantum_check

Kenneth Feng (1):
      drm/amd/pm: update workload mask after the setting

Mukul Joshi (2):
      drm/amdkfd: Update logic for CU occupancy calculations
      drm/amdkfd: Fix CU occupancy for GFX 9.4.3

Saleemkhan Jamadar (1):
      drm/amdgpu/vcn: enable AV1 on both instances

Sreekant Somasekharan (1):
      drm/amdkfd: Add SDMA queue quantum support for GFX12

ZhenGuo Yin (1):
      drm/amdgpu: skip coredump after job timeout in SRIOV

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  | 108 ++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  30 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            | 165 ---------------------
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  24 +++
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  30 +++-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |  10 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   3 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   6 +-
 19 files changed, 186 insertions(+), 242 deletions(-)
