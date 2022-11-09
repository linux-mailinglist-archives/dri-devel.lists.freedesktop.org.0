Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD16237A5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 00:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC4A10E62D;
	Wed,  9 Nov 2022 23:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F12510E62D;
 Wed,  9 Nov 2022 23:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0xd77ZyqklQUztxAIU1RHz7s/zyl/CvuNLYt6cK4Jpt7fSB5h/8GWVYMqSAINrY4GOgEmfH7HwlYNqaT6T9zuD0UCm9VxxJDs+SPVW3panuaZYHtZufmH03ca0JPPbt6+RwHXqKnhR104bIFpruBMNnFlrqJmRmziZMeGZCpolsvntuyphh+yJKBanwWUZpXy1qFcP7A2Uoef0T9V4Li7ugAIZ6XrBn4J+BQTJ3rIx3iH3d5n825ytXo9DiXkNqTpAetKsVPyNvqh8KPZmP2skc/WopkcpclHamyzZUTUk/N/15p956Q+qH6iF1kojRY4WcMS0jIhAp8ibD6TIhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHIFcHO55Wm/EmfPah4QKXzTmLBdb0YtlLEX3WYWevw=;
 b=DrIAYYJbNjKpJxv4ciVHNdrU63FeSfjPe5enYdRNlf/FwLkZU7YW4qtc2808N9Ubq5+c4DP1F69q3Bt5FDvRaJCFXQfu3BU+Af3frDt4UBJYJf/sTzRGxVu3hBp/VJpCT0RMwK+MFJMdJFTIeQGJH1wskxA3vo5AVk1EKOou72k9zBrvVb1RTZY9NbfK47g1x2AyWAtTO4e+zQEhqccCmtCX5LwQCVV7aAKURzsyYteLQDLQrgrUZBJAEz2GkD82uGqlCQJ57cHDBcmCyr8r+EeSM/MQ8vcNSwpTRhOp63e8dpKT2SIl1PfFIGtOHKOW45m48UOQykXBdwzCyG+rQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHIFcHO55Wm/EmfPah4QKXzTmLBdb0YtlLEX3WYWevw=;
 b=VR7D6YgNIArAfIoCa5VxW2jPMtjZljb+cEXloa1GyzJ3piS8L38mOUpYv+ETuDNl34TY9LwAQiSEyO4vTBWWcnOyesCjBfpaFZzIp5OUIVeg6u9uWUwz9q3WLt4BsU31/N3yDFBVSw9nSICqpOZqWUrzWGlkyIi2WoEueBnsA5U=
Received: from BN9PR03CA0407.namprd03.prod.outlook.com (2603:10b6:408:111::22)
 by DM6PR12MB4925.namprd12.prod.outlook.com (2603:10b6:5:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 23:46:10 +0000
Received: from BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::55) by BN9PR03CA0407.outlook.office365.com
 (2603:10b6:408:111::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 23:46:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT110.mail.protection.outlook.com (10.13.176.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 23:46:10 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 17:46:09 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.1
Date: Wed, 9 Nov 2022 18:45:54 -0500
Message-ID: <20221109234554.6028-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT110:EE_|DM6PR12MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d314a9-d51b-4daa-7730-08dac2ac9471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dE+G8q4YonaZeQyhogBv79j+9HsvpVEPUoZ4xJBGLNLamN4VhGNz5SFJS5eNAJNbq7FLGPHZHWtz3vKZFGKK41JIHq/CJ0SjeTTJQIfS2dTdQZzWQFe6mnJ+audoGxf2iKhcZsHUNKp1YjGz8xd68y+f1axWPQoY9u1D/UAnYH8r3X0DC1KRoZV+AxwB3/mczMhX9Mfg3N8m4eWUUg4ex87lAl/tBMDbC6XbfD2b6x6v7XN77X3tjeQ02g9qLpx6DYNdmcpB8di0ePYi31ZpdtxS7714mFBHaZSbRAfcHoj5kEfrkY01uvyi7/liaYviBw2ZZpyBdpFdRJotjDKTUQhIobSY5qDhBkYDXozqJNuSrXKA0HWquupWuKcb+XiLMzqn/LagwmHAk9KpK6og8fiwY7AZgzBdQ/n529DFIqNYNvV65JFK2CmOn9mquGL3I6ODDpFfSjmef8c5+hHVZGfH2/V7wELdI99HajHDngbVjeoYa0QgWjPstf0qWGFb/dRrdyiOhxCkwisaJtUM1Nr2yDp2qez9zVbu03yj/CiW2Bh+LDcZwrItOR/XNF0HQ5Ow/mPIK2YN4yVV2u1yjILdVZYQIYVDINYIWITNYKiPqCe65SiGQbCtFod1MsujcX2w+RgWQ0r3b3j3oLfEy8dh3HzdFUa5bsumqK2ArO5F0+Ay3mAdDwCLFBynaM3MVTzGLvyUjuFyJ9au22EDg1epfrHRr7yeudyNZmzHNGsZeetVu7NOqyJUYeNVXMPo
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(6666004)(478600001)(966005)(7696005)(70586007)(4326008)(26005)(316002)(5660300002)(70206006)(2616005)(16526019)(186003)(1076003)(36756003)(8936002)(110136005)(41300700001)(40460700003)(336012)(82740400003)(2906002)(40480700001)(66574015)(47076005)(8676002)(426003)(83380400001)(36860700001)(356005)(81166007)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 23:46:10.6505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d314a9-d51b-4daa-7730-08dac2ac9471
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4925
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

Fixes for 6.1.

The following changes since commit 6295f1d8b4503ad8a18519b781dd2d1fe5e88c52:

  Merge tag 'drm-intel-fixes-2022-11-03' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-11-04 09:30:18 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-11-09

for you to fetch changes up to 675d84621a24490e1de3d59a4992a17fa9ff92b5:

  drm/amd/display: only fill dirty rectangles when PSR is enabled (2022-11-09 18:07:59 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-11-09:

amdgpu:
- SMU 13.0.4 update
- GPUVM TLB race fix
- DCN 3.1.4 fixes
- DCN 3.2.x fixes
- Vega10 fan fix
- BACO fix for Beige Goby board
- PSR fix
- GPU VM PT locking fixes

amdkfd:
- CRIU fixes

----------------------------------------------------------------
Asher Song (1):
      Revert "drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly""

Aurabindo Pillai (1):
      drm/amd/display: Zeromem mypipe heap struct before using it

Chaitanya Dhere (1):
      drm/amd/display: Fix FCLK deviation and tool compile issues

Christian König (1):
      drm/amdgpu: workaround for TLB seq race

Dillon Varone (1):
      drm/amd/display: Enforce minimum prefetch time for low memclk on DCN32

Felix Kuehling (2):
      drm/amdkfd: Fix error handling in kfd_criu_restore_events
      drm/amdkfd: Fix error handling in criu_checkpoint

Guchun Chen (1):
      drm/amdgpu: disable BACO on special BEIGE_GOBY card

Hamza Mahfooz (1):
      drm/amd/display: only fill dirty rectangles when PSR is enabled

Nicholas Kazlauskas (2):
      drm/amd/display: Update SR watermarks for DCN314
      drm/amd/display: Fix reg timeout in enc314_enable_fifo

Philip Yang (2):
      drm/amdgpu: Unlock bo_list_mutex after error handling
      drm/amdgpu: Drop eviction lock when allocating PT BO

Steve Su (1):
      drm/amd/display: Fix gpio port mapping issue

Tim Huang (1):
      drm/amd/pm: update SMU IP v13.0.4 msg interface header

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 26 --------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             | 41 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           | 34 ++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  7 ++--
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 32 ++++++++---------
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  | 24 +++++++++----
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  1 +
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |  1 +
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  4 +--
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  2 ++
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  5 +++
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |  3 ++
 .../dc/dml/dcn32/display_mode_vba_util_32.c        | 14 ++++++--
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |  3 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |  2 ++
 .../drm/amd/display/dc/dml/display_mode_structs.h  |  1 +
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   | 14 ++++++++
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |  9 +++--
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    | 25 +++++++------
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h   | 15 ++++----
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  4 ++-
 25 files changed, 171 insertions(+), 103 deletions(-)
