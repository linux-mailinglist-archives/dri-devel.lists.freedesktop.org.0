Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA2C48D0A2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 04:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29F510E545;
	Thu, 13 Jan 2022 03:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2067.outbound.protection.outlook.com [40.107.95.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578D10E48E;
 Thu, 13 Jan 2022 03:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJcUiaqh3iClgCMQdP77Py7VTSgKiJLTBTgNpoGaU8G8VF0mjH25afCIDfwQdcZYQr5lyVsKWcMT7CIn3k+S0CrmjZHW5Vll1QXwoAfJPcS1h/tWoxrUZAqeg7pfLuTlm0EGjucyHtUIMYEk6Plqh3QeJ3LRz9snrnBT3/GMdGwyCvPAcRiNhH/bhIUyWh7lZVlzStjCJT4xud5ISIMclYvk5f+vPEy7LMumespccn1ILmyH34AX0vAo8A2QKJi8pml7/8nk4+738dPXm7Q98f21WpysMRiRGg4lqvDmSazWnliEFaAokqUubg1K0coj7JG6zvHGHS8TtDXXwrZbfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4viI+aXfz7nD7fpTZKJqlOgWM2i8Qh6Zl/CWePEX4U=;
 b=JNCWLW1MeGiOr7qVVNFz31oHEZWZcV3uLccUEZQExc5qBoYjNjHrdfrRoAbUnSrf7bZI5ELfkUzobRsHxLiTpRQvurdYKixDfXyi9xKPqE2zMFGC1Ab/Vrw08jbDoymeodPA0xrtEjXQ1aNKmHtwosnNWC2dVwS3GmTPI8d3BmAfk85l5IQ5bL1gcr8e7EQg6cLwbEwceZDl4Ph6BQdGBZqFzmyA8BzKG4Rf7XVQcDpi2KOoH6hXXTu8sgh8OchwNMxpDzsPAD9VXrqZMceHQcqFe1FgBOKl9hIbe7DxwXBSEPpQgcmzsP+QEadN1VXUvh1+szioqMfULWRl0WHUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4viI+aXfz7nD7fpTZKJqlOgWM2i8Qh6Zl/CWePEX4U=;
 b=2M0pxAxENYPufMh1sUdAA2Ry0PLgglqIkbOf5EWPb1WL/r5OQSiouswgZGLnZRQA2MaJV4vgKDr0Wt0CsQLbN0nljLpDwC7l/RasCJS0fDl+GHXpJkhhPpICGZTZDYWk2BCGNMVTcosMEG4cW44lsV1yzYhdOjAbIFn4c5C2Ock=
Received: from DM6PR02CA0154.namprd02.prod.outlook.com (2603:10b6:5:332::21)
 by MW2PR12MB2489.namprd12.prod.outlook.com (2603:10b6:907:d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 13 Jan
 2022 03:05:51 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::33) by DM6PR02CA0154.outlook.office365.com
 (2603:10b6:5:332::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 03:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 03:05:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 12 Jan
 2022 21:05:49 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.17
Date: Wed, 12 Jan 2022 22:05:37 -0500
Message-ID: <20220113030537.5758-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74d80859-c06b-4242-e6e9-08d9d6419ac3
X-MS-TrafficTypeDiagnostic: MW2PR12MB2489:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2489020AC919F84CB4B8AA83F7539@MW2PR12MB2489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:104;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bmCNGLhQP1/kvIei75zLB61koO5TZ5sdhAPmMs2qowNdcEk0L0ISN57dmUmbETnLGeSaCKvHPnUpLfm106XsDyx3tTieWXwx/zwAwRUgzACYKckGg4vv3v2eL9VMRAOlJt4HrZmW9TQBphRd9VDj3w9pUVE1ddTpxVHPOxGnr5UEGpcUbsm0D20CReVM9zraUY71aquQgP4YJe7ngKIXhOC89F/P8z3Sp3j6MkYSyaMtK4WxnqLWX3nCwiOvYp4thJcOXMQj7rFRwvCyNtasjHYMje465r2Lgps7351DaZ7Vdv0uUmC/tlgOWTF2l4qvm1vu763SOJB/AWgB+QVzCvaAICjFbaQdQx1i3X9Ew4Gdve5HwWC3dCAfwK9tKMpyjRLCxivGTztUfHMWui93AfTPGyKFCeQPBxhC2KF9D8cfaBkVJwLqTTGqAcZDdqU6AZlJCmkCq9gQk1NVTHApx7Oa3VBjHcjtVqY/UyP6aR/o/riZF2e3oDXWhPTdPLF9IqUFUpx43+HlHtWH6qLGAYjB5WVOZVZw6FKtOI1aEHUfCEhfS8xsZ42kB+gC6dW0yuN9HrfifYKDap/DTF5ai4ugdq4RIxDnT44gGPQBE7m8FEcfxUpNkR29M0CdaFO9MAJ5TqgXnyiaszd9eq3Z3tmpkEUvIuJJGqid5/Mxub03o98E02g7ZAq9aGBWhAFbfn5HAQDFLh68tqTfe0xnrIhP0I6Q4/iJR9K3Okq8BoYgrZOlSnv9oTi/E1oSnqVC9mEDBvD8pj7+TE8248Y2JPYdcMtQdrRunKYgvECBWAA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(70206006)(426003)(4326008)(2906002)(26005)(70586007)(6666004)(16526019)(47076005)(36860700001)(7696005)(186003)(8676002)(8936002)(2616005)(4001150100001)(110136005)(36756003)(5660300002)(1076003)(356005)(83380400001)(336012)(966005)(82310400004)(508600001)(40460700001)(316002)(86362001)(81166007)(66574015)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 03:05:50.6290 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d80859-c06b-4242-e6e9-08d9d6419ac3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2489
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

Fixes for 5.17.

The following changes since commit cb6846fbb83b574c85c2a80211b402a6347b60b1:

  Merge tag 'amd-drm-next-5.17-2021-12-30' of ssh://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-12-31 10:59:17 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.17-2022-01-12

for you to fetch changes up to 5eb877b282fecc8b8a6ac6d4ce0d5057f9d3bad0:

  drm/amdkfd: Fix ASIC name typos (2022-01-11 15:44:28 -0500)

----------------------------------------------------------------
amd-drm-next-5.17-2022-01-12:

amdgpu:
- SR-IOV fixes
- Suspend/resume fixes
- Display fixes
- DMCUB fixes
- DP alt mode fixes
- RAS fixes
- UBSAN fix
- Navy Flounder VCN fix
- ttm resource manager cleanup
- default_groups change for kobj_type
- vkms fix
- Aldebaran fixes

amdkfd:
- SDMA ECC interrupt fix
- License clarification
- Pointer check fix
- DQM fixes for hawaii
- default_groups change for kobj_type
- Typo fixes

----------------------------------------------------------------
Charlene Liu (1):
      drm/amd/display: Add check for forced_clocks debug option

Evan Quan (1):
      drm/amd/pm: keep the BACO feature enabled for suspend

Felix Kuehling (3):
      drm/amdkfd: Use prange->list head for insert_list
      drm/amdkfd: Use prange->update_list head for remove_list
      drm/amdkfd: Fix DQM asserts on Hawaii

Greg Kroah-Hartman (2):
      drm/amdgpu: use default_groups in kobj_type
      drm/amdkfd: use default_groups in kobj_type

Guchun Chen (1):
      drm/amdgpu: use spin_lock_irqsave to avoid deadlock by local interrupt

Harry Wentland (1):
      drm/amdgpu: Use correct VIEWPORT_DIMENSION for DCN2

James Yao (1):
      drm/amdgpu: add dummy event6 for vega10

Jiasheng Jiang (1):
      drm/amdkfd: Check for null pointer after calling kmemdup

Jiawei Gu (1):
      drm/amdgpu: Clear garbage data in err_data before usage

José Expósito (1):
      drm/amd/display: invalid parameter check in dmub_hpd_callback

Kent Russell (1):
      drm/amdkfd: Fix ASIC name typos

Leslie Shi (1):
      drm/amdgpu: Unmap MMIO mappings when device is not unplugged

Lukas Bulwahn (1):
      drm/amdkfd: make SPDX License expression more sound

Mario Limonciello (4):
      drm/amdgpu: explicitly check for s0ix when evicting resources
      drm/amdgpu: don't set s3 and s0ix at the same time
      drm/amd/display: explicitly set is_dsc_supported to false before use
      drm/amd/display: reset dcn31 SMU mailbox on failures

Mikita Lipski (1):
      drm/amd/display: introduce mpo detection flags

Nicholas Kazlauskas (2):
      drm/amd/display: Don't reinitialize DMCUB on s0ix resume
      drm/amd/display: Add version check before using DP alt query interface

Nirmoy Das (4):
      drm/amdgpu: do not pass ttm_resource_manager to gtt_mgr
      drm/amdkfd: remove unused function
      drm/amdgpu: do not pass ttm_resource_manager to vram_mgr
      drm/amdgpu: recover gart table at resume

Peng Ju Zhou (1):
      drm/amdgpu: Enable second VCN for certain Navy Flounder.

Prike Liang (1):
      drm/amdgpu: not return error on the init_apu_flags

Rajneesh Bhardwaj (1):
      Revert "drm/amdgpu: Don't inherit GEM object VMAs in child process"

Tao Zhou (1):
      drm/amd/pm: only send GmiPwrDnControl msg on master die (v3)

Tom St Denis (1):
      drm/amd/amdgpu: Add pcie indirect support to amdgpu_mm_wreg_mmio_rlc()

Wenjing Liu (1):
      drm/amd/display: unhard code link to phy idx mapping in dc link and clean up

Yi-Ling Chen (1):
      drm/amd/display: Fix underflow for fused display pipes case

yipechai (1):
      drm/amdkfd: enable sdma ecc interrupt event can be handled by event_interrupt_wq_v9

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  36 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  84 +-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  12 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  40 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  17 ++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  11 ++
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   6 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  23 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   4 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  44 ++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   6 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 145 +++++++++------------
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  33 +++++
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   7 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  | 114 +++++++++++++---
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |   4 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   1 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  16 ++-
 include/uapi/linux/kfd_sysfs.h                     |   2 +-
 46 files changed, 422 insertions(+), 330 deletions(-)
