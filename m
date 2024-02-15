Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37185671C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 16:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547C10E94D;
	Thu, 15 Feb 2024 15:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZKAifin/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FE210E947;
 Thu, 15 Feb 2024 15:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiGDWHK1dIbFDhrks1d9g4ddguk5bbMAYwqRa/V87l7CqpuiJdfGsRahW5BwYS+7pH0pf9imgsqSuKqqsvVEx/vrdqKWeV4AgPEtczgaApRuNhH7luIQGgMEA7jm9hyyuSZ9XLkSRgaa7mtkzpwNvneVHbTBWtJZLRhac3lZR34dOsvr2Tu9+Z2iFcsqadODYk2lS1yNKcswMpQcaXjPJ3NQ9vxY6eQRq6ZS0xAQ4itt80YBacpN1n057rhW+OwOKfocrasgiP2jG0fbBEbOdbRVikEQv3ejSoj/TLq0r6+mAE+WBR+Euay98zI269fSwbAU4Ppi/c7yOmmMmKaw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iq0f0LedFlbDAJHYta/GXcBPifDGivzvIfrN/Ud1/rQ=;
 b=WvynKBCKi82lak25vAywZXn/o3mjhqpE2wl8SkyKlbLvowmHdPAAjcn0IDmPyuwh/bBgek7wrTVrjkhYv8JZ31kFC4AHEuGcscXdgxa4D5qc/VA3JU1CSiECR1R6OXkdBSIiuuPXpu3NaezKOB8YUYSV4rEVXAmFsvC5GhXLri3NuithKaZkcRzpEsTe3WyxSKh0bOD3JS1pMBx8OZdKkdsukM8QcqF5kJ5H3xEzQPNsjj26i1YDNE2e53zLv9IJUOmdZ2A41yflJC9gG2k1RVEAwI+qXkTeYta42iqv9gxXuM5Ybq7iRKsN7sZYZdpB+OSGykvaJt6GC+/YzKVcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq0f0LedFlbDAJHYta/GXcBPifDGivzvIfrN/Ud1/rQ=;
 b=ZKAifin/Y8FKC3JQd6qYxnAgRP9GLtE3enQ3QjfGrtcm3ASiZKLxjMvNsOGPG3TPcdbnoSVJqkAGrmMbEOdL7QMV3eIWQXaWBOPX45Y4RRZfkx/CvdnM9zATKryBMh93TXzXqHHCM5/fWZ3NOiNgzEhQ8IzQje1nrcNodjdV2Bw=
Received: from BYAPR01CA0023.prod.exchangelabs.com (2603:10b6:a02:80::36) by
 CH2PR12MB4939.namprd12.prod.outlook.com (2603:10b6:610:61::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.14; Thu, 15 Feb 2024 15:18:31 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::be) by BYAPR01CA0023.outlook.office365.com
 (2603:10b6:a02:80::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Thu, 15 Feb 2024 15:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 15:18:30 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 15 Feb
 2024 09:18:29 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.8
Date: Thu, 15 Feb 2024 10:18:15 -0500
Message-ID: <20240215151815.4976-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CH2PR12MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a01a1cd-7d35-488a-00b8-08dc2e395e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XOqduWISL4JBDYmYadYXJ5eWkJKA3xGlNwkdpwzIMLxXr/VXYOv70/Rr1Cmw2zH7UE7rMWo2HV75180KRKeEXqXBmBd/oZFev3Xcx4NPlOrByR3VJrhFZo1h/Qmnfa+flEqeRPqoO5mBfmZWGVYnn6o30dxTh0TLxGPAA9STUPxiQJguoGKHRlrPOXaphtlQ+t0AUPbcRZ21TgwHZ8eO5Ggi4RWB2vLNqAdEVJH+amxwKOPy2Pn7UJJCgGEF+e/5VxOXBCcsU5CwqQYF5Vc/FrxCvpLr2D+WXcjA6nbrAj851D+6X90SBGPYRZKmyEKvxDUArvte5YzT1eFDqJnZMMFUa/mkxV8pbdTM+tJFmzXinsMGjOHOmeCeQ7AObOAkRWvNyJTQMEMV/SNtcdNSU7ciJZ/K+se/lUjbLxCGkK9faBJY3YFYk49vbS1vi4S7X1B3jPXImApFDXns1wJ5sc5syDShxCMNMa2ClR9FZntYMMxiwkf4yijVY33tzr8uHY1/V7H8nOfMNWQ0uKICKgO174Rn2qUL12GEIqme5jDLASJhAjReDQ6RTvSZN7lxcHWjzjmI1BgGFzLf5DQq6tUK08ksvYP3/g9fA0k3gX0+MQbQzyVJPPPZNP8GVPDu+bi9r74RgXPCv+Q7pfCkNA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(36860700004)(1800799012)(186009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(6666004)(478600001)(966005)(41300700001)(2906002)(4326008)(8936002)(5660300002)(8676002)(70586007)(7696005)(70206006)(316002)(110136005)(2616005)(83380400001)(1076003)(426003)(86362001)(356005)(336012)(81166007)(26005)(16526019)(82740400003)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 15:18:30.7612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a01a1cd-7d35-488a-00b8-08dc2e395e3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4939
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

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-02-15

for you to fetch changes up to 86e8af451be2786482e7ba6556bbb8257c5c7ccf:

  drm/amdgpu: Fix implicit assumtion in gfx11 debug flags (2024-02-14 18:02:41 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-02-15:

amdgpu:
- Add some better debugging support for PSR and panel power saving features
- ABM fix
- PSR fixes
- Suspend/resume fixes
- Link training fix
- Aspect ratio fix
- DCN 3.5 fixes
- VCN 4.x fix
- GFX 11 fix
- Misc display fixes
- Misc small fixes

amdkfd:
- Cache size reporting fix
- SIMD distribution fix

----------------------------------------------------------------
Dan Carpenter (1):
      drm/amd/display: Fix && vs || typos

Hamza Mahfooz (3):
      drm/amd/display: add panel_power_savings sysfs entry to eDP connectors
      drm/amdgpu: respect the abmlevel module parameter value if it is set
      drm/amdgpu: make damage clips support configurable

Kent Russell (1):
      drm/amdkfd: Fix L2 cache size reporting in GFX9.4.3

Mario Limonciello (2):
      drm/amd: Stop evicting resources on APUs in suspend
      Revert "drm/amd: flush any delayed gfxoff on suspend entry"

Nicholas Kazlauskas (1):
      drm/amd/display: Increase ips2_eval delay for DCN35

Rajneesh Bhardwaj (2):
      drm/amdkfd: update SIMD distribution algo for GFXIP 9.4.2 onwards
      drm/amdgpu: Fix implicit assumtion in gfx11 debug flags

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dcn35_clkmgr

Sohaib Nadeem (2):
      Revert "drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz"
      drm/amd/display: fixed integer types and null check locations

Srinivasan Shanmugam (5):
      drm/amd/display: Initialize 'wait_time_microsec' variable in link_dp_training_dpia.c
      drm/amd/display: Fix possible use of uninitialized 'max_chunks_fbc_mode' in 'calculate_bandwidth()'
      drm/amd/display: Fix possible buffer overflow in 'find_dcfclk_for_voltage()'
      drm/amd/display: Fix possible NULL dereference on device remove/driver unload
      drm/amdgpu/display: Initialize gamma correction mode variable in dcn30_get_gamcor_current()

Thong (1):
      drm/amdgpu/soc21: update VCN 4 max HEVC encoding resolution

Tom Chung (1):
      drm/amd/display: Preserve original aspect ratio in create stream

Zhikai Zhai (1):
      drm/amd/display: Add align done check

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  15 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  24 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   9 ++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   1 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 103 ++++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  16 ++--
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   2 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  15 ++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |   5 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   2 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   4 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |   2 +-
 .../display/dc/link/protocols/link_dp_training.c   |   5 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |   2 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +-
 23 files changed, 209 insertions(+), 48 deletions(-)
