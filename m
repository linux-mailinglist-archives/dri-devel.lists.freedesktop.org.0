Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA883CF36
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 23:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0550910E526;
	Thu, 25 Jan 2024 22:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DEA10E526;
 Thu, 25 Jan 2024 22:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6rC4bt0Rj0b66uQfddtxQmafqwuryhhj9DM8gARnBAWuhbRm7ZJumXEenVtJAYQ42RSpirlzmQxWz9UVJMCs6ezdO9xkbhfTMUnI4ZDAo5pNUy0UH4EDddcsO9V/AKngWXlCvzGAXCCeW+SdtC7jCPTIs3K0LZGWAV1NAMqUdliSNWF7k9WrMmBhiGWlfaoG4H66PlNJbYW2Ptu/yat2WCrnbz2nNkCn+w1ABHxO6mhubiiGW/APvHeyAFfi5na187gQ7GYYfmJIo4IE+J12Mq0+zFaSIhyvPO7V7b1j4EzML0kv4X3dgJlnXy9SrHImTQIKkZl6VmcvFX12obXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af45UNzc21hRtxJDdh6qAQafgbVAMV5FSt/kZBbZmSw=;
 b=ivSQdP+d/BkFOv4NuGLC5My4qa2h6RnVvla/kjb36/SoxNgtSMso2xwT1mw8XD+dppBKZriZsg2fy/CQ7HjtSyS0STurzO9QUqf6R3VzmKEWPwYl14EeifSAQKr0LU3q9DMrG3GcBzavJhHxvFGUElusZrM2EkRHxIoDHOGCUJrLTQaCCgKYiqC1UFNflBZr3gBuQd2e3DaIQACjmZwE/GTUvYEllk7ocEimJwRXFdAWF0dVtFtfMlPjZ+Ko7B1yF2UA5ngUOhnLbb0eXZpbkQV5Ug1XNvNsjGg8JbgleCeH59+pKCk1V4KDQV/Sj+2VBf98rfjmh7jBAkgfsYelDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af45UNzc21hRtxJDdh6qAQafgbVAMV5FSt/kZBbZmSw=;
 b=JiFX8DFTxfE2UxEM59uaflbcNG9RqJeC13cB3mNTt49CA7FKSyV0t6LMItuWuDHmKCtYXWVpcjKkaobZ7R6miJMPo81UPBKi6h98DPKpB0Zq5xSUHEKl5dy2ufrotYKvfzWO2Q9Kg7QoFSEo4kVbGcC4s2coYPREXfyPH83XufA=
Received: from DM6PR03CA0019.namprd03.prod.outlook.com (2603:10b6:5:40::32) by
 IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.26; Thu, 25 Jan 2024 22:15:22 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::9b) by DM6PR03CA0019.outlook.office365.com
 (2603:10b6:5:40::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Thu, 25 Jan 2024 22:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 22:15:22 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 25 Jan
 2024 16:15:21 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.8
Date: Thu, 25 Jan 2024 17:15:03 -0500
Message-ID: <20240125221503.5019-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: f3747dcd-2fbf-412e-c4f5-08dc1df31f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cci3NwmIb5EpW1Y35mEaGF4SM5Ur1LqWv/y+sf29iYWTVDg6b9gv9ijyUlkPYtUeXzAN0Qnn3qMJ8chBvqcBM2y6sNLkNI495lLdDb0VjwBSieNnH/ohttJ3r2Yk2wWYUAY3FtS97SAdLJiYlLYFtK9z2wpQlpZOBzlHhGrMhhzLCegVEFONfDbSvMqrSU693IYz4eKy8N5fDp3P5Cyx6RCyXDdk4qFcxQIcrnHA127saAkPXDX3UZ9/nf2u+1cyQqD4jun/qYOE78VCwVoSrQik78dkNoW+4PetxZC9XKOblvOc/xeZfR3KhRzH9kSuQASfZrTOhfD2R3s0m75VK5v29W5s1rF9svXS6oGIam7ff564d0oON0WqpHinfCZjj0NYw06LNT7jeGWuCwqqfZxyErHztXKzJQizfPBR995n8w/mzikq5T9yLk1ZuHfwcI/RK777A+B9DaSZXzfZl8V+s8KAH7OiFIXzaLBNoMuEPoKoZPbP+5z9Azsh3kz0Q4rAAk96apwS0UkXmkZZeONxq+7zhgb2ZiHNxV1KXaimlr8N+YE4wA6ePLlYPFYgMRQKi4/2lMXWMamB7vhrGfV+Zxtt9pdYmAyPoOW+YzBnuzITTCZDDhLTHtibdogFSUM6rSAdAR230BxeI02vaHjtwo7X4+ryoSOdQoICvPWF6fmLZG0GCYOlWe/jNSVCLHkYecU3fNHhucpyEl6rGg3ERlP+Q1ahrZs+dYeceUoVmiSoZYFz+Su7sg8boNQp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(36840700001)(40470700004)(46966006)(41300700001)(8676002)(8936002)(1076003)(2616005)(26005)(6666004)(7696005)(4326008)(83380400001)(16526019)(426003)(336012)(5660300002)(110136005)(966005)(478600001)(70586007)(70206006)(316002)(36860700001)(86362001)(82740400003)(81166007)(356005)(47076005)(40460700003)(40480700001)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 22:15:22.0991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3747dcd-2fbf-412e-c4f5-08dc1df31f74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263
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

Hi Dave, Sima,

Fixes for 6.8.

The following changes since commit b16702be210bb49256f8a32df2c310383134dd57:

  Merge tag 'exynos-drm-fixes-for-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes (2024-01-25 14:22:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-01-25

for you to fetch changes up to c82eb25c5f005b33aebb1415a8472fc2eeea0deb:

  drm/amd/display: "Enable IPS by default" (2024-01-25 16:00:24 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-01-25:

amdgpu:
- AC/DC power supply tracking fix
- Don't show invalid vram vendor data
- SMU 13.0.x fixes
- GART fix for umr on systems without VRAM
- GFX 10/11 UNORD_DISPATCH fixes
- IPS display fixes (required for S0ix on some platforms)
- Misc fixes

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gfx10: set UNORD_DISPATCH in compute MQDs
      drm/amdgpu/gfx11: set UNORD_DISPATCH in compute MQDs

Alvin Lee (1):
      drm/amd/display: Add Replay IPS register for DMUB command table

ChunTao Tso (1):
      drm/amd/display: Replay + IPS + ABM in Full Screen VPB

Hawking Zhang (1):
      drm/amdgpu: Fix null pointer dereference

Kenneth Feng (1):
      drm/amd/pm: update the power cap setting

Lijo Lazar (3):
      drm/amdgpu: Avoid fetching vram vendor information
      drm/amdgpu: Show vram vendor only if available
      drm/amd/pm: Fetch current power limit from FW

Ma Jun (1):
      drm/amdgpu/pm: Fix the power source flag error

Nicholas Kazlauskas (1):
      drm/amd/display: Allow IPS2 during Replay

Roman Li (4):
      drm/amd/display: Add IPS checks before dcn register access
      drm/amd/display: Disable ips before dc interrupt setting
      drm/amd: Add a DC debug mask for IPS
      drm/amd/display: "Enable IPS by default"

Srinivasan Shanmugam (1):
      drm/amd/display: Fix uninitialized variable usage in core_link_ 'read_dpcd() & write_dpcd()' functions

Tom St Denis (1):
      drm/amd/amdgpu: Assign GART pages to AMD device mapping

Yang Wang (1):
      drm/amd/pm: udpate smu v13.0.6 message permission

 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  8 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       | 17 ++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 21 ++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  5 ++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  9 +++-
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |  4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 47 +++++++++++++++++++
 .../drm/amd/display/modules/power/power_helpers.c  |  5 ++
 .../drm/amd/display/modules/power/power_helpers.h  |  1 +
 drivers/gpu/drm/amd/include/amd_shared.h           |  1 +
 drivers/gpu/drm/amd/include/amdgpu_reg_state.h     |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 14 ++----
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 54 +++++++++++++++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 54 +++++++++++++++++++++-
 24 files changed, 229 insertions(+), 36 deletions(-)
