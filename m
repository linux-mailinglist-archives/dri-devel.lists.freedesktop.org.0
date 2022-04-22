Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFDA50BAF7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 17:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572A510F3DC;
	Fri, 22 Apr 2022 15:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BF910F3BF;
 Fri, 22 Apr 2022 15:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPiz/3dBmFH4twARAJ3Ehcy9fSo0wxst+vFjlXoIKjjeiqzQbZEmAvYA94opR4zL1i/CxBRkB0GdAgsHUuFO0KDmfEIPdq6vs/1UpcTuBmYbetP0F37BnDDaZ7gPald5imcaCQ4kfuII4EwhsMhumfmDts6580Q2fumiKbBW/X6UR61IYDRCVri4mCljpw8UC1ZN2MIaW579F99YNjPP1CaGnYBS5eU8vOyQVq5jTj+1GaZdYoEQDKw8HUNsZxfJdeiw99HDvpI/YPxCPoFHdpLit+15X1oowWIxDz6WzSbhI7aFlqMlGlPhOovFs1TM3xdmYkg5Rj8YN7yi3QkRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6igi0b1DOfVXj3AKq+GCxeVrXcDGovoRKBAz4iG4Fxs=;
 b=A2OjdfVcmd4QB1nVRAemU1hA/ONftJ60iabsn9ovOpFIGZF6905e2ok9Te3SoFgOBec2pGzJr1t8S8rTfPW1N80e3QKP6hhgIxNiPLnkkNJKKfNsG2s4CQXQ2WAa2wFsfTA2r4sQkinX3yae/ZYmhJ3bbg00jo180V1RhJdYs8hVZfrSlmveFQGDMlhs5bQ38gG+n/6aF5mSL3qkF3tcF3bjBB3MP3cMCAya+puzvCFhJ3XNnmt+CwcBOKf2X8RN2m9hERt6OsRPap4OHw1bCfgAAlJ5tLx+PlBjvQkjrGjLQ28PmYpi4rX7wv4vUnHdnQgY1n9ep5nQF4TPgC1lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6igi0b1DOfVXj3AKq+GCxeVrXcDGovoRKBAz4iG4Fxs=;
 b=D1KFukPCNUQlVoQK9dlpBT/0tdvFRnojc8S1p+tdnaOdt0e7F2EbdPluu/UJNgCdMm7wzP0ye3WW9brCGKu/6hYuMG5En7WzAn3R9lGA01rqfsUFSbLPElLRFkt/g2X0lDeMDF9uq3PvDa6LIFNG95F8I/hx2PbvstVTTaX5KVU=
Received: from MW4PR03CA0343.namprd03.prod.outlook.com (2603:10b6:303:dc::18)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 15:01:03 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::95) by MW4PR03CA0343.outlook.office365.com
 (2603:10b6:303:dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Fri, 22 Apr 2022 15:01:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Fri, 22 Apr 2022 15:01:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 22 Apr
 2022 10:01:01 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.19
Date: Fri, 22 Apr 2022 11:00:49 -0400
Message-ID: <20220422150049.5859-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79a36972-4504-4949-b336-08da2470eb84
X-MS-TrafficTypeDiagnostic: BL1PR12MB5078:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5078D9579A9D4E9260F7F3A3F7F79@BL1PR12MB5078.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qScPIAGdR6sdpR4++Op5OtFCHbCXxX+tQJ9bPxFWx6ai9FOyuozPMQ5VrteVPcZUL0GbBc5mdnMhDItjF/jgHpzVVeaFLwu7tdZ1DQzhKLLvSdJpfBMWzwouecrJNL0369BvPTmPnL+CHFp63/e7SArJ+21V2+GP/LVQWVn3hUOOQzVg3YvAj3DAe5wkcPNV/0aKvOg7AybUyw+lmU4GRijMO38rudVQMukoC06nQ9WqhzZjhanzsybdxXK5HVhkFbucELrDQyXxjoVSDqsBcI0vECfX8I0HhTDfFkguyYkfcOK2yz7PZWy0IH1wRZvGxurPzanOdZVhWw7ntAwO1MktfkXZJMtmub4RmbI/oxMCccwH8gG2zFCKgCBdob00NTtJZK05rdu+ih4t1AB+3r3C9lcagjTkVgJVbdY2+E+W5qHdicX9nFqFbjl6zA+iJ/xaOwofi89/XJHjbCsAbeSkFLuM6xvuTtWWLEbnc8AcU0WFSxtlgJBodSrXvs/KOhztOzTJJ9afueyGcOwQWyYkPb/0GTI43bPcG3hQ8Yy3leiAH8yv826RCz7gitJ9yxp1/QhiNkGxhk8pWPeghUMY6QbGpSxZQzcgZO/2q9fzYFJ+Rl6A1dGqznIGChW0TY9ArmRP7oykHF2av19Rap7bsTCWdgAdAzgE4bXEjBJwExbYZScbygPgDFsQCldem5qQknuJfHYomLqztDZ2dQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2906002)(186003)(1076003)(16526019)(2616005)(36756003)(356005)(6666004)(7696005)(82310400005)(26005)(81166007)(5660300002)(508600001)(966005)(86362001)(110136005)(36860700001)(8936002)(316002)(40460700003)(47076005)(426003)(336012)(4326008)(70586007)(8676002)(70206006)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 15:01:03.0594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a36972-4504-4949-b336-08da2470eb84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
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

More stuff for 5.19.

The following changes since commit d68cf992ded575928cf4ddf7c64faff0d8dcce14:

  drm/amd/amdgpu: Remove static from variable in RLCG Reg RW (2022-04-14 15:29:20 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.19-2022-04-22

for you to fetch changes up to e15c9d06e9ad70df41285ca41d535de6215e0b21:

  drm/amd/amdgpu: Update PF2VF header (2022-04-21 16:00:14 -0400)

----------------------------------------------------------------
amd-drm-next-5.19-2022-04-22:

amdgpu:
- SMU message documentation update
- Misc code cleanups
- Documenation updates
- PSP TA updates
- Runtime PM regression fix
- SR-IOV header cleanup
- Misc fixes

amdkfd:
- TLB flush fixes
- GWS fixes
- CRIU GWS support

radeon:
- Misc code cleanups

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: don't runtime suspend if there are displays attached (v3)
      drm/amdgpu/display: make hubp31_program_extended_blank static

Bokun Zhang (3):
      drm/amd/amdgpu: Update MIT license in SRIOV msg header
      drm/amd/amdgpu: Properly indent PF2VF header
      drm/amd/amdgpu: Update PF2VF header

Candice Li (2):
      drm/amdgpu: Use indirect buffer and save response status for TA load/invoke
      drm/amdgpu: Add debugfs TA load/unload/invoke support

Darren Powell (1):
      amdgpu/pm: Clarify documentation of error handling in send_smc_mesg

David Yat Sin (2):
      drm/amdkfd: Fix GWS queue count
      drm/amdkfd: CRIU add support for GWS queues

Haowen Bai (1):
      drm/amd/display: Remove useless code

Huang Rui (1):
      drm/amdgpu/pm: fix the null pointer while the smu is disabled

Keita Suzuki (1):
      drm/amd/pm: fix double free in si_parse_power_table()

Lang Yu (3):
      drm/amdkfd: move kfd_flush_tlb_after_unmap into kfd_priv.h
      drm/amdkfd: only allow heavy-weight TLB flush on some ASICs for SVM too
      Revert "drm/amdkfd: only allow heavy-weight TLB flush on some ASICs for SVM too"

Miaoqian Lin (1):
      drm/amd/display: Fix memory leak in dcn21_clock_source_create

Tales Lelo da Aparecida (3):
      drm/amd/display: make hubp1_wait_pipe_read_start() static
      Documentation/gpu: Add entries to amdgpu glossary
      MAINTAINERS: add docs entry to AMDGPU

Tom Rix (2):
      drm/amd/display: add virtual_setup_stream_attribute decl to header
      drm/radeon/kms: change evergreen_default_state table from global to static

 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |  13 +
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 105 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  54 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  26 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         | 308 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.h         |  30 ++
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |  99 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   8 -
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  83 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  10 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  10 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   2 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |   1 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |   3 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.h |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   8 +-
 drivers/gpu/drm/radeon/Makefile                    |   2 +-
 drivers/gpu/drm/radeon/evergreen_blit_shaders.c    | 303 --------------------
 drivers/gpu/drm/radeon/evergreen_blit_shaders.h    | 278 ++++++++++++++++++-
 27 files changed, 887 insertions(+), 477 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.h
 delete mode 100644 drivers/gpu/drm/radeon/evergreen_blit_shaders.c
