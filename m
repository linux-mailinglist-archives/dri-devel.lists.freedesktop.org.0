Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A41B919A75
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 00:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7D210E166;
	Wed, 26 Jun 2024 22:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f4J+t/ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE1510E166;
 Wed, 26 Jun 2024 22:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUxOr/yedmpuf2pO/0vUsPph0lT3TuzP9ATNPT0bRtlW3X+Py9Ryd3ue4j6DSUnqYGPqcT1WzMFFV34T4BlmXmYAaklnJEDkW89iLotGrkcsjmMjYVLHttnNHNhTLHMv+G7jKngv74hsZeZsk/vYUx6oIFUjBQ8byLwuR01pFOmv5IEJNCGXbPcFQH8kWQW68K3n8+I08dnS/NhS7NwphKDFntSTRMw9sAWRP1sOtQMWlKLRNGaNbD0nX8cjjc9CBbBTXJ2kXVrMtc2/6At18CEDQx+O3p2L4O1De+cX3738yxaBPTCoG2LvGYG2ib4rMNrU3Zn3geUxFAEAHf7h1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eD4PxsAvMnDFBFe6sHS0FCKSnmh9LwiJ3x4pGxrw+0s=;
 b=hn7y8M/hzSFzBJM1Kh3XADrKHL/ztN083raomzbLfw8J6qsIwUZvoX+Flk8KP9IDNv6m2me8sMyzTPOHWa+7eMIY/Ed5wLnUdEl+ZKZeV5oHAeAwt1bT1Xev+FU0o4kNHvioG3O+RewR/IxCnMUOmf4rg9wD8CYVa24+v6mpsuOHfT1FVy7x2sg8zmHT5q16s87yVSuZs4DiITlMPuJR0kNfWY7D4IwiedRr/fyO7FaOrf06U/H63FiYL4fit5RDxALJSsjlH5L1AaU9oeT+ycrJEnqauo7hzu5CXowkWBZ3u/Wnhbg9er33DAnBiQD4gRF0KlyLXsE8Gn7Yg8a2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eD4PxsAvMnDFBFe6sHS0FCKSnmh9LwiJ3x4pGxrw+0s=;
 b=f4J+t/maNjmWhnPhxg/xF3pOsMC+UO62IwzRFrTyAWeKNy83+Ji5YdLgDBaCSlODNdX4EyXS68avF7mLja4BHyWB5ah+SkVAqtloj2PxGDaGpGpzcUriWUTEA+uwy7c+4CR7T69L2EiMBhqq9m5RwiSJ8Qli1lpCMMp9f1VYhBQ=
Received: from PH8PR21CA0017.namprd21.prod.outlook.com (2603:10b6:510:2ce::17)
 by SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 22:14:35 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::bb) by PH8PR21CA0017.outlook.office365.com
 (2603:10b6:510:2ce::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.8 via Frontend
 Transport; Wed, 26 Jun 2024 22:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 22:14:35 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 17:14:33 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.10
Date: Wed, 26 Jun 2024 18:14:08 -0400
Message-ID: <20240626221408.2019633-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SN7PR12MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 9537b68a-3536-4dd1-79e0-08dc962d5ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7GPxa5DGsn1XTnY6nWZib0/OUbeOEVe58v60WJ4QCnKWWnAdJ1eTP7dE4hAZ?=
 =?us-ascii?Q?fbOn/hV9uXlUY9WORiKZOJdwFZ5Q/BCo97w1PDMaN2fNi/MO4YOXJ0NM1nbb?=
 =?us-ascii?Q?7IzWULk03OI/C2xGr12btNIJ4RyDj1zWvfybXfynVg+HrNHdA/UPR3RZLdW3?=
 =?us-ascii?Q?y6bj2DK1yhCZfL1XnBueApFxy4ZUGykoFbNBPfIV/e9/Y/FkVSP6XTy8COPG?=
 =?us-ascii?Q?dnLpX2eaY/Mb9IhTtScKIqixXStmJ1D87y/xHFuOfnbp4F/kKZ+ZhGwjbj5Y?=
 =?us-ascii?Q?q8LIWv0N/XUJ3p4No+Wd+Vs1x/FhgOtRTQcN85dHpK1/kEtd7LDpJUD8KFDN?=
 =?us-ascii?Q?rmNGQfAWngDo25w+g9SpzGibhNIkv/ugZcFUE1R4LGcm3mmRp7TKFIoVZykA?=
 =?us-ascii?Q?ZkimSnbngm9MveE6HRs+MvWNG6t3Ip08qz1vVVey3aIRhDyq7mClKeiGluHl?=
 =?us-ascii?Q?nbT8z3pUHFFPsVDGuDqtQ3IiDS/+6GwfwdmC4FHMe0eLShr8JRx8XVjc40o9?=
 =?us-ascii?Q?/j13R9kjvZeHtQwv6PigDc6DyFUWtfNiHXJspWZrxh2j6YSrf3NSK800a2X5?=
 =?us-ascii?Q?qs4/T52B4SVodS0kxHI7exBtVYsEBswyLpXvMSPT9MxvwDAz9VsbKMScRppN?=
 =?us-ascii?Q?l3IeQ9TExq96ZXg8/G2yJjX5sOUQsjgHNMtlH03SVJrIBrN6HsKmF47FRBm4?=
 =?us-ascii?Q?Bhfgek4Pm8yqDPRodZCdoIqwlz+BJa4TjOq0x9SqrymQmvrIY3pXhAdNJOf2?=
 =?us-ascii?Q?+p9+FL7TOa3hyH2bHxDBFxap3sFCTpcpMmq4L0SEcQaADjuCdxepps+PKZ1E?=
 =?us-ascii?Q?BRIV8sOKBZjbjL2fYtPkLUMfgiXfxiG3kPvl4XE6te1Nz754+0WguaHI5NM3?=
 =?us-ascii?Q?b1AAv5vfwIgfsDE/D0TpJrkXA9L4M9fB01AsnplR3j0VOWncQbXUrXWVCqwm?=
 =?us-ascii?Q?XTzSNdBDQhKcvXnVbbMkFLG74vLPClCXVgZRe041t4OdyJZl+IRlNljLn1hW?=
 =?us-ascii?Q?hJmRV1AaVlt6lRAb3X1+jjZie456duF4F2l6oBrqTHgz3MPtb16bMjNeJOk+?=
 =?us-ascii?Q?qbTXffmhjY3EtzIBxnNzvVXx7/t4gtCwLP9lHzdjOiDkCvjEj4x4EsRMBJhq?=
 =?us-ascii?Q?1YlE4hgoA2kpIIj6WsJig7wdYfvDBH9w1ArUfRw0oD6aHWGQmMywof8qBSAD?=
 =?us-ascii?Q?OmJaRueaXzG3rvbXj39AdunX37SbLtFgjeMgYdkrUOUjnxWY5gYU8EPAZkw3?=
 =?us-ascii?Q?btvfdeGYWXr33HSzObTmY/XowhnOI5dalcs2qM6cE1tBUi5WemUbMzfMu1vf?=
 =?us-ascii?Q?sHvCx3PAnDjsJvIz1RUCXWSjLQNZFbvd1NSzV4Lc7rhU3L+CcseU7q+hihXw?=
 =?us-ascii?Q?Gd+6Y6PyVnmMRI/ft4dB6pYC9DC4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 22:14:35.0939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9537b68a-3536-4dd1-79e0-08dc962d5ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6691
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

Fixes for 6.10.

The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:

  Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-06-26

for you to fetch changes up to 48880f9686b1ac2ea0831f65df953a63d1437fc0:

  drm/amdgpu: Don't show false warning for reg list (2024-06-25 14:22:56 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.10-2024-06-26:

amdgpu:
- SMU 14.x fix
- vram info parsing fix
- mode1 reset fix
- LTTPR fix
- Virtual display fix
- Avoid spurious error in PSP init

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/atomfirmware: fix parsing of vram_info

Julia Zhang (1):
      drm/amdgpu: avoid using null object of framebuffer

Li Ma (1):
      drm/amd/swsmu: add MALL init support workaround for smu_v14_0_1

Lijo Lazar (2):
      drm/amdgpu: Fix pci state save during mode-1 reset
      drm/amdgpu: Don't show false warning for reg list

Michael Strauss (1):
      drm/amd/display: Send DP_TOTAL_LTTPR_CNT during detection if LTTPR is present

 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 25 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           | 18 +++++-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |  5 +-
 .../display/dc/link/protocols/link_dp_capability.c | 10 ++-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |  5 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 13 ++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  5 ++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 73 ++++++++++++++++++++++
 12 files changed, 156 insertions(+), 15 deletions(-)
