Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FEA60EE02
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 04:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D7A10E11A;
	Thu, 27 Oct 2022 02:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5CC10E08D;
 Thu, 27 Oct 2022 02:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRanrCBdS5SFMUqRXbTHYvHaNImfnDc64qjOAmD9KnKJs12JdS5cfXcRE+Nfbg9g/rOk4XSTKxHWQBlLGnOztNrqi7+vk7gH81Rc4ltPzdivP4h9TblsoasFZOdYJIiRrXJs9OPkeviI06EfY9vQrf6iJy6VzWi9Mw7kmLsqdz+Us1qrFRfnMVEMWLGt9g91FLrfRbatdXNNiLY6ph+PkJ7YeLgBbU9egI76WA8z4Ee6xqccFxCWaSt+E0ceI6gvTG+ZV4aTLovRyGmlMh3wEWAXAbHE3wsI2BbDnGluBWu0mUk0jYXoggfds++DGTkbxHVyJlnxK7mVJPfhTHuboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDQpXd0W8+4zvURu/EB1Fa6BUkhcqbcr7cIjOCnynhQ=;
 b=UXUCxoODysP8lDX7RpvDAYlFv8oPCAWrvihorKQbe5ncZjX0Xg/fDJhEmYsd4AC2QTPVH/Xdw4u1+0kcXyX4EbYx7iPpx/VohpgtpXmotwfBUbYuaJNo2sSJmlT3MbdhwWKrkptiwsiLHwwqe0qXI2/N6eWjKbEhHyABubGwV1CCxPmLNFXvzp2Ugfpgk04jq1a8MhM/AXIPYG83lgqKL52f2kJTlX+NyH4D56W2fd7OX4YUuBSjgE7hSDnbKgMicZb8Ua+XiiHzwn/lvmDtrhvVZ+6wz26rQ/Yzg5/Qsx9WiLYF8hY3xT4lkMfVAFpUtZFILW3eRAVp079Tr6S4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDQpXd0W8+4zvURu/EB1Fa6BUkhcqbcr7cIjOCnynhQ=;
 b=d9ceQi4/StknOuT7S7HHbBohedW4tm98Ce7rwrrqIBf9c/ZydmUXbyruTJ5E3ZtE5HT5r1bDlzO+aRLApwbv1he5KPYFoYVXQp4/uHIjjpebB4cKHu5eG9AS7Baj65Iz36ifP2CEfkpXi19fIcTCIZ8waPS1WjaOw/P6apTzI8o=
Received: from BN9PR03CA0583.namprd03.prod.outlook.com (2603:10b6:408:10d::18)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 27 Oct
 2022 02:41:28 +0000
Received: from BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::7f) by BN9PR03CA0583.outlook.office365.com
 (2603:10b6:408:10d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Thu, 27 Oct 2022 02:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT069.mail.protection.outlook.com (10.13.176.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 02:41:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 21:41:24 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.1
Date: Wed, 26 Oct 2022 22:41:01 -0400
Message-ID: <20221027024101.6881-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT069:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0a1c45-1510-4de0-033f-08dab7c4bf48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TdLkRX6+cBXn+WoIQglUaOEUf4hQoZtNZPfPe/yrfDX4HYEyFOr8ZZ+Al3nofUR+CS+7y2Ybsq1qisSc4GUhkDMXPbHivsdLJKpKYaxyHBuuPlguD9KYrICewfi+EosQ2XL3T5bwUU77eJJSL5KCxr0BVGa1BBnnpvSlBott5utiTa/Zky/GlOnm6nHLv5Zumep7e8AOykdzd9t6HKRF8VMmFuprwm5jt3iVxQnvSAJWUyJTNi6PHe2tp2WZVPww6n2w9tmYchU+ZH1at80LToidxXr2NURIzV0udZ2zlPXoKwGPhlMQfwYhGGiIw50qyE67jP1pldJe4ymKxvBM8VShiko4/PvMwfMaRPDD3k00IzfmG5ba5caMW2VobVyfgVMbKHGP1A80pOVdavyWgkfU0prDvcS2zHOoFRErbxGhI928x3y4cwmG+WlXL0ikxPkFPmg2HEMu704p2JM++OKBg6idclGnp7J2LWU5mQkZJumP9Eff5LZM3uKAUeNTEGng3AcbfouGp/TmWQFGGIxo2h2eQNE5lbMq4ubByterg7ll4S1mq+4W6qlw7zGDM7wRrjEMMkZOARXh0sLePiwfA/2hLdPUi5fWo4JrZ91GzQnPUtXn4knbYD9Qq92aA5kMDc01vHyX+TJSaVqRqDKZqyU4ciZDRqvsXtnVmoSy4gYyHsofC6tEIkV6CkFFIW4IzJC7ZlL/j+q+HuPz7kz9EUCP5tXmSZ5XwHgFnR0UAR6FrAR+rWgnooXEiiyb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(356005)(82740400003)(36756003)(40480700001)(40460700003)(86362001)(4001150100001)(2906002)(966005)(4326008)(478600001)(316002)(16526019)(110136005)(41300700001)(8676002)(70586007)(70206006)(8936002)(5660300002)(83380400001)(82310400005)(7696005)(36860700001)(6666004)(2616005)(26005)(426003)(1076003)(336012)(66574015)(47076005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 02:41:27.6518 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0a1c45-1510-4de0-033f-08dab7c4bf48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243
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

Fixes for 6.1.  Fixes for new IPs and misc other fixes.

The following changes since commit cbc543c59e8e7c8bc8604d6ac3e18a029e3d5118:

  Merge tag 'drm-misc-fixes-2022-10-20' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-10-21 09:56:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-10-26-1

for you to fetch changes up to d61e1d1d5225a9baeb995bcbdb904f66f70ed87e:

  drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume (2022-10-26 17:48:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-10-26-1:

amdgpu:
- Stable pstate fix
- SMU 13.x updates
- SR-IOV fixes
- PCI AER fix
- GC 11.x fixes
- Display fixes
- Expose IMU firmware version for debugging
- Plane modifier fix
- S0i3 fix

amdkfd:
- Fix possible memory leak
- Fix GC 10.x cache info reporting

UAPI:
- Expose IMU firmware version via existing INFO firmware query

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Don't return false if no stream

Chengming Gui (1):
      drm/amdgpu: fix pstate setting issue

David Francis (1):
      drm/amd: Add IMU fw version to fw version queries

Jesse Zhang (1):
      drm/amdkfd: correct the cache info for gfx1036

Joaquín Ignacio Aramendía (1):
      drm/amd/display: Revert logic for plane modifiers

Kenneth Feng (2):
      drm/amd/pm: update driver-if header for smu_v13_0_10
      drm/amd/pm: allow gfxoff on gc_11_0_3

Lijo Lazar (1):
      drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x

Prike Liang (2):
      drm/amdkfd: update gfx1037 Lx cache setting
      drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume

Rafael Mendonca (1):
      drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()

Rodrigo Siqueira (1):
      drm/amd/display: Remove wrong pipe control lock

Yiqing Yao (1):
      drm/amdgpu: Adjust MES polling timeout for sriov

YuBiao Wang (1):
      drm/amdgpu: skip mes self test for gc 11.0.3 in recover

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  18 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  13 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  28 ++----
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              | 106 +++++++++++++++++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  50 ++--------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  12 +--
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 111 +++++++++++++++------
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   7 +-
 include/uapi/drm/amdgpu_drm.h                      |   2 +
 18 files changed, 259 insertions(+), 119 deletions(-)
