Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0F52C4CA
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 22:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5FB10EA53;
	Wed, 18 May 2022 20:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B853810EA08;
 Wed, 18 May 2022 20:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nydBSFVtSFdRPKEhu/A4GDIMPxnlxOgd27Z1q4WdZFolzJ21lWuE/kKf5sMo5eHwTsgS03DKMSKxKgulgvz9srIdKmhQBz59CxzGER4pfpuJDWEDY4oo1W/+ZY6y04h1WbzLugVMfM+tMy9rO5z3w+8Ro/KkXO/p+msd3fbmjqayrJ73u7zNzZy8pdY3AKFhFjrcj3adWtVPHvgt3fv3kepyX1N50UhRIk8dtXSrAA/wgSGiJYXBiQu2mti9vmspIcyEpGUzx0ovP+RPwdbj0E9leyy3hf1XAc5NX/shyQwqtcFySGmlAWeWtYGvvh0JPnbBN6W2Hr48IVYWLT28yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO3XRyvhWlRM/n/IfV8uyVRJg3FqqNx0RGl0PYzuwbw=;
 b=X2hDYwp4F4au8J411cIk4kzgGjPm3wvCNCTxo/AXz42F9OsiZtCHWxzHZaxyH80Qtz5vIuaJfY2E481OUInZkpgeF5TZBWuoFbbnRMkUh+fUhjcSKnOcCayF8MBXx1MkpF8vuoOIVI464KG9Xs7M+fjg2Ln/cFBMSoXqO3hmRS2L9DDq1PRHLCianj3TEfnkINWnQc3mfl/U4+aQOSWauei5xU0MaeB8FN5Iekyen6axSF5ssWsUXoRXRnN7OGxSUycbuam+nGx+Q7RPc0sU4VIRfVlXtCb1VxZldGA59ka9/aeMiJOI3vh61k2YyK+Hu67GXYo8kPweevQI9rKlcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LO3XRyvhWlRM/n/IfV8uyVRJg3FqqNx0RGl0PYzuwbw=;
 b=h4dEVQqQheOQGKjq+qbZMn5sH1d9nZCj48bbenvEsWsLHqkAW8lmd/GJX3525E2jf9Y7r976GXFSp9nq9Ep1+1OX0XW6R/iaJaP7QRBKEgw4qFt3ZAu0MN9f7PgleOafiuqvUCvmVhVn033eH6Fo20oRr63O9cqUk0xQH1SdYY4=
Received: from DS7PR03CA0183.namprd03.prod.outlook.com (2603:10b6:5:3b6::8) by
 DM5PR12MB1643.namprd12.prod.outlook.com (2603:10b6:4:11::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Wed, 18 May 2022 20:56:38 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::de) by DS7PR03CA0183.outlook.office365.com
 (2603:10b6:5:3b6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15 via Frontend
 Transport; Wed, 18 May 2022 20:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 20:56:38 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 18 May
 2022 15:56:37 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.19
Date: Wed, 18 May 2022 16:56:21 -0400
Message-ID: <20220518205621.5741-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10c77041-fef5-4e87-6260-08da3910e705
X-MS-TrafficTypeDiagnostic: DM5PR12MB1643:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB16439077CCC8AEE3BACF5AC5F7D19@DM5PR12MB1643.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7z6Nk6AklGeJo2qPaYwTqO8Vf0qkQcJJ8HUCt8izQ1bvye37BFho2326/pEdtMlHzSr/UQuZ43/9r+R1BT2S7j/7OsIB+JQmsZYSnBHu13uWyKkBG7rkdvpRqVYWMeUfYy/BjYflVkEDm2CWQGMUPbiJRRhIdbJ5C2LT9Z0njoEYO+iw2KuMO7aLdlpR7cl+5rYxh6cC4biERutS2CgmU/zGUuyXK8xI6rHEAFyw3lH5Wim+9x0Vgc4w024J5xCeEeMK9FNogfZdgY2A2ijx6KIkffL8Mh6qg4DI3O9FmQJz1N7uPsfXmDx4OdE/ymo0Hqgpl3FUsYruqMFyN1Vy8H6vM2fAJL65tNOLR09gX7qn3X6duiJoGVghS8YjZ/Pc8GNo+WY/qh/BWyPf/xqM9l6pTQvUMXRSpJblKlCk7ydDcoB47IiZNxbpCGpxcql4qrp5H2QsCm4oczF/mqzWUEwilXsNErWY4nLN69pLjmZcGhStj44/yfuPJ8mAZvE9sC5AiWPhfCRBweeTm4r2AEzLm15mrMclzRbqxsgScAW0N3YWjgfEBUAFvuHOeuMCxeSCXzhc2QkLp7XA1WRnwbtqmvqDRbph/hXA35KZrrfmbQ8i2aoiI6xNU3Krc+K96+tfdJJOrXLkbi0I20i2KBsHX7e0YWoCz071hP+XtkuMW1ATUDus4qI5RbBMBSi2JMyyxMmga+6nLnPvZcDMFQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(966005)(508600001)(16526019)(47076005)(8936002)(36756003)(83380400001)(110136005)(7696005)(82310400005)(6666004)(86362001)(356005)(316002)(36860700001)(81166007)(2616005)(4326008)(8676002)(26005)(70206006)(70586007)(1076003)(5660300002)(40460700003)(2906002)(336012)(426003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 20:56:38.3558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c77041-fef5-4e87-6260-08da3910e705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1643
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

Stuff for 5.19.  A bit late for new stuff, but it's just additional enablement
for new IPs so they shouldn't affect existing parts.  The rest is just the usual
fixes.

The following changes since commit 81c5495910e81c2cadcb9118ca0c8803ab3bde61:

  drm/amdgpu: Remove duplicated argument in vcn_v4_0 (2022-05-10 17:53:13 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.19-2022-05-18

for you to fetch changes up to 0223e516470aa0589da6c03e6d177c10594cabbd:

  drm/amd: Don't reset dGPUs if the system is going to s2idle (2022-05-18 15:20:18 -0400)

----------------------------------------------------------------
amd-drm-next-5.19-2022-05-18:

amdgpu:
- Misc code cleanups
- Additional SMU 13.x enablement
- Smartshift fixes
- GFX11 fixes
- Support for SMU 13.0.4
- SMU mutex fix
- Suspend/resume fix

amdkfd:
- static checker fix
- Doorbell/MMIO resource handling fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/ctx: only reset stable pstate if the user changed it (v2)

Graham Sider (1):
      drm/amdkfd: Fix static checker warning on MES queue type

Hans de Goede (1):
      drm/amdgpu: Move mutex_init(&smu->message_lock) to smu_early_init()

Haohui Mai (1):
      drm/amdgpu: Ensure the DMA engine is deactivated during set ups

Huang Rui (1):
      drm/amdgpu/pm: add smu v13.0.4 driver SMU if headers

Jack Xiao (2):
      drm/amdgpu/gfx11: fix me field handling in map_queue packet
      drm/amdgpu/gfx11: fix mes mqd settings

Jiapeng Chong (2):
      drm/amdgpu: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

Lang Yu (1):
      drm/amdkfd: allocate MMIO/DOORBELL BOs with AMDGPU_GEM_CREATE_PREEMPTIBLE

Luben Tuikov (1):
      drm/amdgpu: Unmap legacy queue when MES is enabled

Mario Limonciello (1):
      drm/amd: Don't reset dGPUs if the system is going to s2idle

Sathishkumar S (4):
      drm/amd/pm: support ss metrics read for smu11
      drm/amd/pm: update smartshift powerboost calc for smu12
      drm/amd/pm: update smartshift powerboost calc for smu13
      drm/amd/pm: consistent approach for smartshift

Tim Huang (5):
      drm/amdgpu/pm: add EnableGfxImu message dummy map for SMU IP v13.0.4
      drm/amdgpu/pm: add some common ppt functions for SMU IP v13.0.x
      drm/amdgpu/pm: add swsmu ppt implementation for SMU IP v13.0.4
      drm/amdgpu/pm: enable swsmu for SMU IP v13.0.4
      drm/amdgpu/pm: add GFXOFF control IP version check for SMU IP v13.0.4

Xiaojian Du (1):
      drm/amdgpu/discovery: add SMU v13.0.4 into the IP discovery list

Yang Wang (4):
      drm/amd/pm: add smu pp_feature_mask callback for smu_v13_0_7
      drm/amd/pm: add smu feature map support for smu_v13_0_7
      drm/amd/pm: add smu feature map support for smu_v13_0_0
      drm/amd/pm: add smu power_limit callback for smu_v13_0_7

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   20 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |   17 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  109 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    7 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  130 ++-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    8 +-
 .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |   63 ++
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |  267 +++++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_pmfw.h    |  137 +++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h   |  138 +++
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   26 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    9 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  161 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   60 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  107 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   69 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   | 1044 ++++++++++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h   |   28 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   99 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   62 +-
 30 files changed, 2364 insertions(+), 274 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h
