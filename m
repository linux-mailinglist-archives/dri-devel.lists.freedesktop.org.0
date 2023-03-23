Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0EE6C6D42
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 17:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4C310E480;
	Thu, 23 Mar 2023 16:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8CB10E045;
 Thu, 23 Mar 2023 16:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S324par6u8GZkaLhzO85ICAZUCyFzN3qkGq3Y3T5d1HJq2khMJJvdb0gtVtakI+OuIOWJwK9tiZgK8uQ+sRhfLMwBilu0CYqo6TkRMu7+tiZv7Dm1fndP0vzTLe43QcSbdz72ng/X3LqkgpgcCcqZ3J1VLouqzIAetjn4988mYwWpFvR6YjFabnSiWolF+0iwlmTYTWKEuZv1tfYCK/bezny8xu2KVyZbfeNgW6fBdJYnezUdINmhM5x4dmM+wAIqBkONvSRR5dCIUzzH/Nru8QyeCSIYZXMEHqIVg9pQj8w7/e6OplYL1qpabG5jARZFU+Psi8HQ6k0A1/YdteHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfynR2Gu/WofzWgVkuhdC4/YYc3EcgVyXbS8ysxNxYU=;
 b=EhizqAr/7LVMSFSl1fGpbt6Snp99LinO8AcEFbFkmLP1jk6sAoDzxaBbsN31pDukyX8yXb1HnB8VZlqBRepY46R9sivrUN8NHpDaJo2HMR5+j4uq7oHtIUhII3CFAcGWzlZqhMHAMLKAoSoxpMU5RWMkRF/p8w68p0E40xa7MBPRtFXcpRMC3vqMFHTqEKb6wZdSkJaZvw+3dlvXS2m/qLFN1GIZ6YP9NnhDCXwj4RN/E/XXYCpYiAJYhKynGo/NQfjKlPI0iOKyPS0rOxzmbegD4A5CHcL/Op88yqXyWy782PBFZh7Z8XJ5vClkQMhkWOH/GJX/K45P5FheDUApnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfynR2Gu/WofzWgVkuhdC4/YYc3EcgVyXbS8ysxNxYU=;
 b=CYFWa1rv9oPbXFPj71K57DGEKewlH/EDOxjRZdyj8SjVhq69FtuH43OvkXUrjbFm4VC+BhuIAHgW6San/oGPUYIjE/UNaBg24sUsZjVYMnP18ImNqddr4h3j+QcbG00Z+hVDcYTChne8VaOpCy7Z+z0+WVXsDiO8Vxu04ALvghE=
Received: from MN2PR11CA0023.namprd11.prod.outlook.com (2603:10b6:208:23b::28)
 by CH3PR12MB8282.namprd12.prod.outlook.com (2603:10b6:610:124::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 16:19:54 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::28) by MN2PR11CA0023.outlook.office365.com
 (2603:10b6:208:23b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 16:19:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Thu, 23 Mar 2023 16:19:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 11:19:53 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.3
Date: Thu, 23 Mar 2023 12:19:39 -0400
Message-ID: <20230323161939.7751-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|CH3PR12MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 1848ff71-eb2e-4ee5-2a61-08db2bba6f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N8S3va8Le39mgCzYvT0pEhGm0IUI7ue7yGkaxJNe07iAgojyMxVB1BXPcRq3aoPiNmrGLN60S491N9kIjJT53Myd30z9SqHrK81nRe/QzvVFmL25F0vifCkK0QS1pWMD97cHFKJNVKLshXZs+zW6jtTMBGiM7i1h7A37EP6bQKqF8JBzh6eXGr8k0wHEh5wYJphRUOLsAxiRdh0wFWN2kLI7/9z21Zogy7Z3poIT2drfWVppdV853cp8vKZcC3blwEwLiYhSaO1zRb7CvI8KzMKEqBOQezOAmWHMAa/lj9GuBr7Hpc2YAV3EEsJ8g+bV48wR2jFkWKkFwK9k77q6tGHjhdoJnOxrPs7H72gsZ/3J+Kdt4FDYDhk+M4+eXwni4taEtDAlRYSo9jDkkbQZEKpnkXypHrSOa32ew2x5y9IWLeh8B0RKP1A0gMKakblE2Nii2UPBvSYGCahRwjXfoYouI1qW65SNoMNPH04J2PIW7ihcB1wJAeWbZjlJvPjeFNxdpbnrjY81J/jjkeFj4/AZj5TxHL6mJ5geaGGjStGDBy/0D6mVPsHnJ3NJKCREcCwIDTPz0S0n+kT3pCXGnMabLB2GraN0jCMiZMXYeTMpTP6QWGqa/Yi68qvEMI3fcND0orpwogMNMAw/rV2lJwFp6q/betiJTy5eUFQJnbLU3JnLBRK+UBGPNEtJQjHg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(2906002)(356005)(40480700001)(478600001)(40460700003)(7696005)(966005)(83380400001)(336012)(186003)(2616005)(16526019)(86362001)(82310400005)(36756003)(110136005)(316002)(36860700001)(8676002)(4326008)(70586007)(70206006)(5660300002)(47076005)(6666004)(426003)(26005)(1076003)(8936002)(81166007)(41300700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:19:53.8480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1848ff71-eb2e-4ee5-2a61-08db2bba6f94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8282
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 6.3.

The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:

  Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-23

for you to fetch changes up to f9537b1fa7fb51c2162bc15ce469cbbf1ca0fbfe:

  drm/amd/display: Set dcn32 caps.seamless_odm (2023-03-23 09:39:34 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-03-23:

amdgpu:
- S4 fix
- Soft reset fixes
- SR-IOV fix
- Remove an out of date comment in the DC code
- ASPM fix
- DCN 3.2 fixes

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: remove outdated 8bpc comments

Hersen Wu (2):
      drm/amd/display: fix wrong index used in dccg32_set_dpstreamclk
      drm/amd/display: Set dcn32 caps.seamless_odm

Jane Jian (1):
      drm/amdgpu/gfx: set cg flags to enter/exit safe mode

Kai-Heng Feng (1):
      drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi

Tim Huang (2):
      drm/amdgpu: reposition the gpu reset checking for reuse
      drm/amdgpu: skip ASIC reset for APUs when go to S4

Tong Liu01 (1):
      drm/amdgpu: add mes resume when do gfx post soft reset

YuBiao Wang (1):
      drm/amdgpu: Force signal hw_fences that are embedded in non-sched jobs

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  5 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 41 ++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 15 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  9 +++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 14 ++++++++
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    | 17 +--------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  1 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |  3 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  1 +
 11 files changed, 72 insertions(+), 41 deletions(-)
