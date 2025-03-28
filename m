Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B33A741E5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 02:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0471F10E19F;
	Fri, 28 Mar 2025 01:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h3mHBHcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63FD10E19F;
 Fri, 28 Mar 2025 01:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxIkU6F+c3aKspIwTrktPw64mdDGPOYOO73qf63KGPapLN6eWShk8HDqljq2RviKsmwcuZ2QeVnH+fftKG1YbcTzCj7aJZeXeFzEaseJ58BaMiZk+xAC/Mm44GSrYQUQv2gT6SAMa2wMECvdia3JOxPwhiYLK6oGu+sBny6vEDvEcsdEVJx1hbOKwZou7ksSG13iFcfJrdoG2FewGlCxDRQ1AkEa6nv2sWcGXVBhub7XCtsW1w0y2rsYS1en7LVc/SviNwzOuiJULVXko+SDCHXHD+yfztnMXylksjoqrjWVwKGED9k1OnzOQrpTdJGCjgiZ099U1BB8T4qhV/w0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8LPTp2PhPO5hqrUplE08Hyy43kSkJOJlHJePHqeya8=;
 b=K4zmkkHJVhtGR8DXncGem36mCIrGFJ7V0dVGUbos7/iI51ETIgE5U2bQDWxNewvTJtK85Y/if9EPbedRQVNOayE0I6yOGrwgc3LVglHjlqypLUa91LjBDFgV2cYaUHNDwkIJJ8EQLacLdWtcPNkCg8QLNSzz8jvhFa/v8WBhwuHR4WuPkOui/tQedk0JPXy94Vn8r5rSTmKRuHFJz77T82dT9IrmQP/HNYo8b4SsCTaV8PAFk5Pa0eMqdhAJF6M/BZX5MON9tqm2Lqyxq/+88TnyFyYBR6UbhiL6hCnTLGbIc74U6JsoWWPz+bI7vX9MOm/BgtbzDSsdt6fma/U/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8LPTp2PhPO5hqrUplE08Hyy43kSkJOJlHJePHqeya8=;
 b=h3mHBHcJwwPw4ayaWMTbMx74HTjwWx303vcPS/7xYoBj8ukmg2lOuGTPbeDBsTB9HWHgP75BYKT7Po6ABrO9T+zXNT+GSBWznJENKJgdrrfD4BCVoMi4xJAZl1ZgOq6kkueUcaUcinjTbj+Bx4n6wy0tgmtjpPQQ7d3lQRXTW98=
Received: from BYAPR08CA0009.namprd08.prod.outlook.com (2603:10b6:a03:100::22)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 00:48:04 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::17) by BYAPR08CA0009.outlook.office365.com
 (2603:10b6:a03:100::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Fri,
 28 Mar 2025 00:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 00:48:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 19:48:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-next-6.15
Date: Thu, 27 Mar 2025 20:47:48 -0400
Message-ID: <20250328004749.3392457-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: b772c3ec-bef9-4328-62a3-08dd6d923274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWdRZi9Wa1JLTm9oYWpEQ3EvSWtFODFvUjVkckZjYzNqTDYxbUp3T0xPdTNx?=
 =?utf-8?B?QmpFNVNLaFJURHVWem9LV0N6N0hGaHN2a3E1MEd3K1grTGFJa2dxWk1zekhO?=
 =?utf-8?B?ZlEvekRjTEg1WFBHRnRETi9jenErSGFJZ3JGRS9OMXRMMHkyUFpXTDkrVkJV?=
 =?utf-8?B?TURraU1RVnMyb0l5RDVCelZCdHl5V3Z1cHhnMjc5cEREWmY3WGtFNVVmNE1q?=
 =?utf-8?B?YXY1S1E3clY4QlRadkdyZnpGaU5rU0FyNEhhMThJbWFPTVZiWHhMdlkvUFlQ?=
 =?utf-8?B?cFk5WENwcG5XOFV0RWo3SVQ4SXNOTFZFak9seHVwR0Z4anVZVEFOdy9CNWYw?=
 =?utf-8?B?WHVHbUl4RnlDK3J0QmNWYTZHRE1pRWY2dkVldHJ2amR3RUZibkhqcEhsYkxq?=
 =?utf-8?B?ajd2SWp2dmlHS1p4a3VNR3BFQmxtVndZZ29wWTc5VWQwam12MGdtTEJqMDJw?=
 =?utf-8?B?T2YxS0xHaUNPQVpaQjIyMmt5VllQYStmbEZZR210TG5qNFVER3lYcWZNaDBv?=
 =?utf-8?B?c21ITHN1NzFudGF4ZjNCb2RkQVNqQUprY2RTcEdQeFFtWjBic0JEenJ5QXFD?=
 =?utf-8?B?R1FRYjRnejQrNHl6QmpGYVBZcWZOb2h5WWdkVXVYTlh6d0N6bEJxQ2hCcjVF?=
 =?utf-8?B?clBEK2NieTBCaUhJcTJ3RGpNa0owUWF6UmNMUVY0S3ZPMmY1OU81VWVmcFN4?=
 =?utf-8?B?Tkh4dUxMODNFZGdINitPWjBiM1YzaHQ3M1JwcHN1VzhUQTc0MFp4WlBMMDdF?=
 =?utf-8?B?K093MDdGb0lZanNydTBNdkpKYjV1UkQwcjdZenpxZXZXWmoyU0FubFBQUDdo?=
 =?utf-8?B?eE9UVW5jOEx1N1VjM1FRV0U5TUh3a1dOaDZCRHJDamhlNTJLdFlRR3kzREpT?=
 =?utf-8?B?VmxvK3FKL3kwTkErVk8vNWt2YlZ6aGZZMjZ6SWxXUmtJYTRWNEFOK24zb1Jz?=
 =?utf-8?B?NG5sWGhaaVVnUDl4bUN2djJFMHVJcHZWVFpQZG9iZVE0aWprZU9KRzhEMmRH?=
 =?utf-8?B?REFkNGVXaVpXL3VNb2tZNEhGeUNVcVZIOWFYVUZBM3ZxbGNZT2pGM0dIeHRm?=
 =?utf-8?B?SFA2WXhOcFl6TnRpNVZCcENGUnZsMVk5SC8zRTdrQ2xITFJxR3ptSzNiaWFZ?=
 =?utf-8?B?N1VVWDlteXJxdjhvM0J2dU9Hd2VEc2h0RUk1VlljbUdPSWNDYlBpODNMMGdQ?=
 =?utf-8?B?UW96U05ZbjErMEFHYzAzWkpaK1RWbkp5a21FK1lqVGRiTTRPVkFMN1c1cmFq?=
 =?utf-8?B?NnVubDNCVEM4QU92NXhSQytwOVNwd2d4Vjh1OE1ISmpsRlVreVBwZnJZOVFE?=
 =?utf-8?B?T3Y0MWJ6aXRZT291by9QcENaR3NNZEdQaGRGYXE3bUxUTlZWbE05dUtPM1RF?=
 =?utf-8?B?bjRSdnJobUxqaE5MSTZFaGVZZEI5VEh0dWRPSjdJV1drR3V3Zk5McXd0SUlX?=
 =?utf-8?B?Ykc1UGd4S21PWkpua3lGT1FwODVBTXFjRkZLU2FxVzhCSlUySnpWQVVVRG5S?=
 =?utf-8?B?dlBiREp1aXQ1Q2JHcEFMSnZ0MXZxaEx3bk5sNmVFeDJVUWhqdFNDUEZQckYy?=
 =?utf-8?B?dlVOUHpFTVV6UWhYaHk1cWptbC9kN2tqdmNOemNHZHNNNU1kL1laNUt4VnVU?=
 =?utf-8?B?eXIvUDc4T0dwYXI2YmZHNjVoZTZWS082Z3RER3RVSkFMTlBqL2p3TVBkSWx0?=
 =?utf-8?B?bXB6T2xyc0M2M2o5UG9wUG8xRGh2NnNCU2VnaGNUZFZzU2tGT3luUVNUZ3VS?=
 =?utf-8?B?VU9mNDVtbzkrbHZocHBDVFVnS2x2MDU1WGRXTFJvQUQzQ0FQdVpLUXJ6Qmc4?=
 =?utf-8?B?N2QyNDNUcDd6S3ZQTXljV1F6dnlVcEIzNFkwWXV3V29uaTFCenNCZ1NEbUtB?=
 =?utf-8?B?UGMrejhwV044Q0VRQnBwdlJPdnpqRGNWUGxyWENjQ29ud3dBV2lJVHNSLzVP?=
 =?utf-8?Q?RBcTWqhqr+g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 00:48:03.4213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b772c3ec-bef9-4328-62a3-08dd6d923274
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073
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

Fixes for 6.15.

The following changes since commit cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c:

  Merge tag 'drm-intel-gt-next-2025-03-12' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-03-25 08:21:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.15-2025-03-27

for you to fetch changes up to dce8bd9137b88735dd0efc4e2693213d98c15913:

  drm/amdgpu/gfx12: fix num_mec (2025-03-26 17:47:18 -0400)

----------------------------------------------------------------
amd-drm-next-6.15-2025-03-27:

amdgpu:
- Guard against potential division by 0 in fan code
- Zero RPM support for SMU 14.0.2
- Properly handle SI and CIK support being disabled
- PSR fixes
- DML2 fixes
- DP Link training fix
- Vblank fixes
- RAS fixes
- Partitioning fix
- SDMA fix
- SMU 13.0.x fixes
- Rom fetching fix
- MES fixes
- Queue reset fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gfx11: fix num_mec
      drm/amdgpu/gfx12: fix num_mec

Asad Kamal (3):
      drm/amd/pm: Remove host limit metrics support
      drm/amd/pm: Update smu metrics table for smu_v13_0_6
      drm/amd/pm: Add gpu_metrics_v1_8

Brendan Tam (1):
      drm/amd/display: prevent hang on link training fail

Candice Li (1):
      Remove unnecessary firmware version check for gc v9_4_2

Charlene Liu (1):
      Revert "drm/amd/display: dml2 soc dscclk use DPM table clk setting"

Christian König (1):
      drm/amdgpu: stop unmapping MQD for kernel queues v3

Denis Arefev (5):
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero

Jesse.zhang@amd.com (1):
      Revert "drm/amdgpu/sdma_v4_4_2: update VM flush implementation for SDMA"

Leo Li (2):
      drm/amd/display: Increase vblank offdelay for PSR panels
      drm/amd/display: Actually do immediate vblank disable

Lijo Lazar (2):
      drm/amdgpu: Add NPS2 to DPX compatible mode
      drm/amdgpu: Prefer shadow rom when available

Mario Limonciello (1):
      drm/amd: Handle being compiled without SI or CIK support better

Stanley.Yang (1):
      drm/amdgpu: Update ta ras block

Tomasz Pakuła (1):
      drm/amd/pm: Add zero RPM enabled OD setting support for SMU14.0.2

Xiang Liu (2):
      drm/amdgpu: Use correct gfx deferred error count
      drm/amdgpu: Parse all deferred errors with UMC aca handle

 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |   8 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |  34 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  44 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  58 ++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  88 ++--------------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  90 ++--------------
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 104 +++----------------
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  45 +-------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  58 ++---------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  68 +++---------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  79 +++-----------
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   3 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_sdma_pkt_open.h  |  70 -------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  43 ++++++--
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   7 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 114 +++++++++++++++++++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |   2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  15 ---
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  55 +++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 36 files changed, 393 insertions(+), 649 deletions(-)
