Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E2846025
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 19:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401AD10ECF9;
	Thu,  1 Feb 2024 18:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mpe7CLfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382C810EB08;
 Thu,  1 Feb 2024 18:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9TcIkS5uQ/dC8BGRlJ1kYYR0yxhNeGwU7dxD6utXwt9ZN2V9AIgYVs8T+rqQ9nIJKyzN/IMsHA6HK6tqkoPqqsXXpqooTx5B+sB4QdHD5TvxjiU0LmIi2Z56PU4KpyrugDPLbcwMf0whNFAcT+KTRdPh+4os19G7qTBKkRsQRHkUgr2igNGNIuYfLFbCgL9S93E3DZmntWFgN8CK+CxX7lTNs5oxPQ6SHj+zDRQhATbW7Bx9sqorvvxpkwOwco25kdajP8Kqvp8eK97oJ74tstNw0En2DGzX10YcUiyVrR4EOUw/owndT5MOp12f3HESLq0nzm/C3N2NpI1k9iKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHJv/q2WCrtzCKi9MfB38EE8Fl3Ud7vaT6d5VVQ0Mdc=;
 b=F3Ii469636twoeE5h3YBFLUq5NVXCyV7TTv5cjp41lEWXiKrx/dWpk5TxxF7NrVq+v6r2e7jUxo1wBgSfr0yLO0nS5GNA1X+FpPd77E5tZGAemeFCkLy747189HhkfakZ5WgA+i+ExhPe6sHmSRBZ3qqVZONfF0951Zg5ycYyUTiztDPhxfw/qG5FihwKv9KUWEgKY9lX6Qu9H5BjIY1tDVbqCosnGwBVWpXx4BWRnMyTPsWNihsRVmRiHiror1N5sWDx2o9tJcP5TnjLRL880L0l8kIt29hA3l9xvBX2LZppSHKG4+eK7/6qRar3pP1EhY0P1H2KfIUxwGYHf08vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHJv/q2WCrtzCKi9MfB38EE8Fl3Ud7vaT6d5VVQ0Mdc=;
 b=mpe7CLfm/K0Ufr2z41h1qY0ShGhUQ7KI8Hv9fVmERUuYNHCq0RiyHaNjhAg42IiYxjIbJ1AeV90y0gyKG1YS6svPgWrtEFf/QRAL5Dpwrd5plU1Qz/LRK3SZcam2e4EBhuNScnTT5ZOGXoYqTCmxZ/xaybela52Oquq9d/5tChI=
Received: from CH2PR18CA0036.namprd18.prod.outlook.com (2603:10b6:610:55::16)
 by CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 18:41:31 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::a6) by CH2PR18CA0036.outlook.office365.com
 (2603:10b6:610:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Thu, 1 Feb 2024 18:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 18:41:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 1 Feb
 2024 12:41:30 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.8
Date: Thu, 1 Feb 2024 13:41:08 -0500
Message-ID: <20240201184108.4923-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CH2PR12MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b20bc8-7178-4199-017c-08dc235568a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxKZn4IdplA1a/ukJmOMwSAajNcYt58DeyfMkrGvwmffccIPVRQHsu/8i58iyNf0rXDzUFfMa4a/uxFVMEpFBMRIzA76N2ZWzTzIM5wGD459lsHNBUsY6gAFqJF9f5DXynA3+CHHr0zym7aqN+cxFa6zZ22AXYF/LROZWHCJClaoyelOZ6ISR3aiayIjI5b1kYLarAYsXYiNUVSaQ8fHiyJEkOFIwAzwrmOixxc9CFXAncLcK0CQ2CMUZ2VcDZWO+JBbFwGg6RGR362Dv/03P/rKPdHjRR/ms8pU/F5gwennetdJ3tYSG5sq6ATSlUtGJVjGfnAZZxcjk1pVXn2eryWmemwSbR7VCkd2ymuArcQfVcQ2rM8YjfdRxiHHbyW2tX3+9lJYIS9zFUkn++1WJBpryUQHaEkzd+PJ9oq9wKIVaD48KlDNux0wJREbGqxEtPI4gPlxSF0Ud8rXx+vwDMLJK4K/2miowckUzCUcx12296+OtsquFVoDyLPXJA6HCxLB3yXaa4WbAGAIORn06Li4hPV4VT0yCFGzKwD6D17fvY6ELmpmJOT2BENyfMNthIllHyqtY+ssZuWs8PVRt3SzYzEPv2PhqTWO4Ch72973iPEAlwfF1M0cw8ZeuuY5UNjYc3WXXofEFyjDHvstupEa2579hf5ZN/lNbMVGZXUGhIu2e5fdLEu4JGHx1B8q2B3tuDLxzDccFn3iVhzlbJKTYwmD1ADssqXjhrzo+tHhnwGKWjovmJbEPs+hXmPLDT2jJPfl9kjHsUr0F8CInE9WbKxIwFWl20epElm+Hts=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230173577357003)(230922051799003)(230273577357003)(82310400011)(64100799003)(186009)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(47076005)(426003)(336012)(70206006)(86362001)(316002)(110136005)(70586007)(4326008)(36860700001)(356005)(8936002)(8676002)(81166007)(66574015)(478600001)(2616005)(16526019)(26005)(5660300002)(82740400003)(40480700001)(966005)(40460700003)(83380400001)(1076003)(6666004)(7696005)(36756003)(2906002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 18:41:31.3888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b20bc8-7178-4199-017c-08dc235568a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5001
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

Fixes for 6.8.

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-02-01

for you to fetch changes up to 6813cdca4ab94a238f8eb0cef3d3f3fcbdfb0ee0:

  drm/amdgpu/pm: Use inline function for IP version check (2024-02-01 09:11:38 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-02-01:

amdgpu:
- Fix reboot issue seen on some 7000 series dGPUs
- Fix client init order for KFD
- Misc display fixes
- USB-C fix
- DCN 3.5 fixes
- Fix issues with GPU scheduler and GPU reset
- GPU firmware loading fix
- Misc fixes
- GC 11.5 fix
- VCN 4.0.5 fix
- IH overflow fix

amdkfd:
- SVM fixes
- Trap handler fix
- Fix device permission lookup
- Properly reserve BO before validating it

----------------------------------------------------------------
Charlene Liu (2):
      Revert "drm/amd/display: initialize all the dpm level's stutter latency"
      drm/amd/display: fix USB-C flag update after enc10 feature init

David McFarland (1):
      drm/amd: Don't init MEC2 firmware when it fails to load

Dmytro Laktyushkin (1):
      drm/amd/display: Fix DPSTREAM CLK on and off sequence

Fangzhi Zuo (1):
      drm/amd/display: Fix dcn35 8k30 Underflow/Corruption Issue

Friedrich Vock (1):
      drm/amdgpu: Reset IH OVERFLOW_CLEAR bit

Jay Cornwall (1):
      drm/amdkfd: Use S_ENDPGM_SAVED in trap handler

Lang Yu (1):
      drm/amdkfd: reserve the BO before validating it

Le Ma (1):
      drm/amdgpu: move the drm client creation behind drm device registration

Ma Jun (2):
      drm/amdgpu: Fix the warning info in mode1 reset
      drm/amdgpu/pm: Use inline function for IP version check

Mario Limonciello (1):
      Revert "drm/amd/pm: fix the high voltage and temperature issue"

Mukul Joshi (1):
      drm/amdkfd: Use correct drm device for cgroup permission check

Nicholas Susanto (1):
      drm/amd/display: Underflow workaround by increasing SR exit latency

Philip Yang (1):
      drm/amdkfd: Correct partial migration virtual addr

Sohaib Nadeem (1):
      drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz

Srinivasan Shanmugam (3):
      drm/amd/display: Add NULL check for kzalloc in 'amdgpu_dm_atomic_commit_tail()'
      drm/amd/display: Fix buffer overflow in 'get_host_router_total_dp_tunnel_bw()'
      drm/amdgpu: Fix missing error code in 'gmc_v6/7/8/9_0_hw_init()'

Wenjing Liu (1):
      drm/amd/display: fix incorrect mpc_combine array size

Yifan Zhang (2):
      drm/amdgpu: drm/amdgpu: remove golden setting for gfx 11.5.0
      drm/amdgpu: remove asymmetrical irq disabling in vcn 4.0.5 suspend

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         | 32 ++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  4 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 20 ++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 36 ++++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  4 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           | 12 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |  6 ++++
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |  5 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  2 --
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 22 -------------
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |  4 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  4 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  4 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  4 +--
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |  5 +++
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |  6 ++++
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |  7 +++++
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |  6 ++++
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |  6 ++++
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |  6 ++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              | 17 ----------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            | 19 ------------
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |  6 ++++
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |  6 ++++
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 14 ++++-----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |  2 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  4 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  9 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  4 +++
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 32 +++++++++----------
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |  4 +--
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |  4 +--
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  4 +--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  4 +--
 .../amd/display/dc/dml2/dml2_translation_helper.c  | 33 ++++++++------------
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 11 +++----
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  2 ++
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 33 ++------------------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  1 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 10 ++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  8 +----
 48 files changed, 217 insertions(+), 225 deletions(-)
