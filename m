Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB2856DA3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 20:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1386B10E936;
	Thu, 15 Feb 2024 19:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rs17/uYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B68010E908;
 Thu, 15 Feb 2024 19:25:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcnH1EBKdEx12DuYdr+WYwbSdqbFK6JgD3oBzpLZ9Nu2lohIrxeMzv6tvssiDpKQ+pAo9Ll1hpZqw2xI4sxY3jyR4muKm8Xbq2jdf2OWv7UQDFPvclFrbj8pdDaXOlK7o5+OhsNff5dU7oY+/1p1LHoOLrX7KLNmvJtOoS998K7WGHxvNGPSu1biSYmBjgzLOhRAEEhY0jNaJ7gdLCJI5nSVIfeJIiRiC2ZDqiOtM9Y+YYVj13mB07Oh+f9KTOYtM7VsE3Dr72uO8hh4RFRhZhVGqNBhDVyIlVDvUSgi6c9rY9HbKvxGjwxn7OE2GFm3sj9m+Um9yYZ/2Y/gtewe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aQ/HAysVaqHPp/azgOB0TR0rx3tiZV3s0brCgkTtGY=;
 b=gRmHcE6Qr5AEUmSgttk4lRDLIwKvryBChsmCD2uSzOTH7gsr7zYpp++XSy7+KOawtGUL6mFFLaFpre5QkuebgQYJZ0KtZwskmU4ggML5zkwO7o6zDIPjzLqXVkv8YVs3IzaiEUwUm9OiwzvNlt3iqDfCsG0OTnEwbSuq8Od26OwAVs6pddniS4HnbbiSVCeU4uZAtB4uvWI3hl1V1Rsn5fqYfQLbXwctkcpSRnAEypq4AJTRfJHf2rkNrVRCiuzha47y3rDw545320x12BV6JGngtU72v/nFh5fOFhYAMgcqysH+QuQvmmx4f9jqXecugeT2Suv10F2qK5NkoaFsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aQ/HAysVaqHPp/azgOB0TR0rx3tiZV3s0brCgkTtGY=;
 b=Rs17/uYSJduGFppdbWWEjcqlr09/ER0Akzv2N2ro9esyQRrb6gLCFPvB+/mlJgUM1tBNWkqVhhZXfiETSn8v0R8J/L8/9Alqwdrl1QqLdDn7LZTR0PjnHn+sFnsfPzhkI2TXz2iKlBNvJ3pML7wsjUT1F7n+eARv8jW/RuOrLb8=
Received: from BYAPR06CA0047.namprd06.prod.outlook.com (2603:10b6:a03:14b::24)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Thu, 15 Feb
 2024 19:25:08 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::79) by BYAPR06CA0047.outlook.office365.com
 (2603:10b6:a03:14b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 19:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 19:25:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 15 Feb
 2024 13:25:06 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull v2] amdgpu, amdkfd drm-fixes-6.8
Date: Thu, 15 Feb 2024 14:24:52 -0500
Message-ID: <20240215192452.11805-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: a455bf44-32e7-431a-8ac6-08dc2e5bd21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTCcMex0eBhh9bEHn9M7Nx+3uiX2ss/imQEI8jyuq933wR0UeRyc7BjW8A6cJVGQ4S+hkhmHKtefyPIOn9FxgPjv5q3oqeRlXIZp8cFw0gMJy+AbhMJ+od+Am409CERNSeCVfS1d3NsF9aV0Mui5Rirax1HSoTwiHyQ1/J/MnhAWEtDSzRUxHtwj+b3gT6sYkF/KmsNV+ESrBPH9kJFmVyxoZyPa6mUmitRXA1QM7RDToMcapaTbZsSa3ixG1kpdXL+nHA8dqfiyLzP89tEKsmR5hQRzC3IK1mdAX1oIZ6MzwH0FZCMv5wfl2HHS0Pkf3tuHBGt84B1YoiXroqaM9fGVIASxaU5b0cE4W/PdZKV50sNO4dQLy/SqSbNkyRevmAp20fMYLSNK5cm+GZgSbTfFGOlEmDVJW4azIHHOrH/2qzDTRmDqUYUBMutsGfT8YGNzN9b+qlg3QebPTIK6vLQPldVA7ePvL30js1JyAxW/ztDccTrjij0+S/G2HqorCFxvAvJM16VZujW6h07Zd3ozl0Kjdi9usgaqSdiHVqgLzLOPv9XedGqXA0lz5w1YzmKvdlcYpksqaqGgT85WMz2777llPkC/z8gb1FdfJtozLZ+7fpnzLLTL8yxjYOEy+hxFlMs0GMX2tdr8lotu8g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799012)(186009)(82310400011)(36860700004)(451199024)(40470700004)(46966006)(8936002)(8676002)(2906002)(5660300002)(4326008)(2616005)(336012)(426003)(83380400001)(16526019)(356005)(82740400003)(36756003)(26005)(1076003)(81166007)(70586007)(6666004)(316002)(110136005)(86362001)(70206006)(7696005)(966005)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:25:08.0570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a455bf44-32e7-431a-8ac6-08dc2e5bd21d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
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

Hi Dave, Daniel,

Same PR as earlier today, but drop the panel power saving debugging patches
for now at Harry's request.

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-02-15-2

for you to fetch changes up to a8ac4bcaeb660c5eeb273507e8dbf713ba56de44:

  drm/amdgpu: Fix implicit assumtion in gfx11 debug flags (2024-02-15 14:18:44 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-02-15-2:

amdgpu:
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

Hamza Mahfooz (1):
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

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                      |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c                 | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c               | 12 +++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                  | 13 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c                  |  9 ++++++++-
 drivers/gpu/drm/amd/amdgpu/soc21.c                       |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c         |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c          |  9 +++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h                    |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c   |  4 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c                | 10 ++++------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        | 11 ++++++++++-
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c        |  2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c       | 16 ++++++++++------
 .../gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c   |  2 ++
 .../gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c | 15 +++++++++++----
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c      |  5 +----
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c     |  2 +-
 drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c  |  4 ++--
 drivers/gpu/drm/amd/display/dc/link/link_validation.c    |  2 +-
 .../drm/amd/display/dc/link/protocols/link_dp_training.c |  5 ++++-
 .../display/dc/link/protocols/link_dp_training_dpia.c    |  2 +-
 .../drm/amd/display/dc/resource/dcn35/dcn35_resource.c   |  2 +-
 23 files changed, 114 insertions(+), 38 deletions(-)
