Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D54477D8F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 21:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D16810EDC3;
	Thu, 16 Dec 2021 20:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B08F10E3E7;
 Thu, 16 Dec 2021 20:27:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8KwA0cw3y9M/EW7O2qqtLoOU+fZ0wSDKTOEaBeJohU0zQyds2+w/N+kSk6j9tN8QXVpWMYlK5deh866o4X02kd1K1E5qsV/Y85ZdVmMc83eIdL+msbAH36EHNtUeNNIw6FBA3/LjfC7y2ahQpZXrmSda8fNUU8etQkKAhQKErtF7ywvqd49qHZVGMOszcNsR2fbFu4dwPBykqmtEZBDr5aGqNjdI7S72oOb2HmqQNN0Rg96AzsxL427tyQekWZCNy297RGLoXZLodwZbKSfMTEXkmdAJ7lffc/rUcG8fKPCCpznaZs0dO+LbO1UFU6MLt3A0uVygajm+wZF/LujAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifqDFIoLWOhGQjBiZAPS8IdG/zAbjFkPGJA+ZCZY0rY=;
 b=fXE2FMpw/Bwjv4+/rLkozEJLU51GCTKZ6C5M6zLCMshxrIKvPatQyrGW1FLmYDXnDpYrCHpfSNy4V52aADUhVhcSeZ1j0swDJgS4g7rNK83k3dTYCkPWQYbg1VP0mmrvJGL7ibbmj9MIzXcqaCKd1B1ftVkuOnFwQ0FepAjAhxIxP40FkfsqE9on80o9vHxQiAcbs0eOw9ThXOasIEBUG6f52syfzQwCgsvrNHVctO7V+o4WIFbYZlVXV6dXdabWk3EKeWHCTo4lxhIQcZ/pbH9R0Xq5kpQmv0FYhRl2qN0AuBDufQjgGqpVuRzeTVE+8kWjc5priP+kIHvXYXVDaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifqDFIoLWOhGQjBiZAPS8IdG/zAbjFkPGJA+ZCZY0rY=;
 b=PZ2iO1GLo6gn4n8Q9o/bVOhv4v+3v3SpR00dziqUQd070819Ilp1N0UblrFZXFX06iArbkm1Tf6zBqn/FJaFobK9PgUBpcuVcUI3dvot7JrzRbnYFdNeINyd+Qf1tgRx5ienejWXpKZX547v1u3OzE/Jcw+pyhAki3W3X+mQcTE=
Received: from CO2PR05CA0093.namprd05.prod.outlook.com (2603:10b6:104:1::19)
 by DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 20:27:54 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::92) by CO2PR05CA0093.outlook.office365.com
 (2603:10b6:104:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.8 via Frontend
 Transport; Thu, 16 Dec 2021 20:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Thu, 16 Dec 2021 20:27:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 16 Dec
 2021 14:27:51 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.17
Date: Thu, 16 Dec 2021 15:27:31 -0500
Message-ID: <20211216202731.5900-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17df2668-96b8-41f3-3339-08d9c0d289f3
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5549545CD7957D0EDBEE88DDF7779@DM6PR12MB5549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2Bt0FzIIN+/it6FiCIMh4vDQE1Gaxs4MjbL86I2P5wIWXHcVaEKJ9KO9dqiVvstYndSeZ3Cn8uY9y1RdK5fYgm2+cCnLQQxeXbJXqC4tFTrkKdgwHFccHTuDmTu/XKB9vkhqxH1lmnO8Nxcl4W4BWRSjZiD2+giSK1hmJYceVXe2WZqsEWPCBvmQzbopLTEODiLfy5aD9OTMQZSlvGnFJh6/7EymiIOoOsTS/uChr4wX9nSL8Yx1ZagEErDBqYVgp/+LvwhIf7KfkPuL7aWYz1X4oXgfvLaX8E3Ym3qB7Amd0eSilGw4wcsUJf0c84SE1YcIVo+dCtkqdWY0vI3Pi/Md46by606c0KiYkRIrkYwUvg6ABANSCj+8ZkcoNvut4MAVnxTTJDpox5GiaceLMBc5AnTItzpujhzDusDlQfbHoK93dWOg5mcwGIbIdqkTKHZZ3Z0dCYmdxJdSf94SdCTgwTLdGg3CjAyj1v1XQU233r34v9/RG/2zaySZnS7jxyCBchaltN0dt9RcyaVSfrCmh2UHOYImBnK9xuCEofjAgjggVUFAWFl8Ldqqdae9dxiXt4d0bFhK/1Hj8mLDh++TK6WBqs/ek1/4E6c2hWSxJoiGoFI6TlISzqNGzZNvuoowezg1hu4bQycdD2xn1czmVp+hJkPzAk3CfKhNykJrbNn6AxuE7Ng9uv8VUMoJ1YhN6tdW9uf5P0VcZdmRjr9xIdgSDk//xue8RpUehN5HV4svdQdtI/iRUWO6a0KuE4aXVVHEm63zUxh0haSJrDVxAil79eFf4k5imudp7A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(6666004)(70586007)(4326008)(36860700001)(110136005)(5660300002)(19627235002)(7696005)(316002)(16526019)(83380400001)(8676002)(1076003)(2906002)(26005)(4001150100001)(66574015)(70206006)(30864003)(8936002)(2616005)(81166007)(186003)(336012)(86362001)(426003)(47076005)(966005)(40460700001)(36756003)(356005)(508600001)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 20:27:53.8155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17df2668-96b8-41f3-3339-08d9c0d289f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5549
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

More updates for 5.17.

The following changes since commit 3c021931023a30316db415044531b116b85e6ebd:

  drm/amdgpu: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi (2021-12-07 13:13:07 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.17-2021-12-16

for you to fetch changes up to a342655865b2f14d1fbf346356d3b3360e63e872:

  drm/radeon: Fix syntax errors in comments (2021-12-14 16:11:02 -0500)

----------------------------------------------------------------
amdgpu:
- Add some display debugfs entries
- RAS fixes
- SR-IOV fixes
- W=1 fixes
- Documentation fixes
- IH timestamp fix
- Misc power fixes
- IP discovery fixes
- Large driver documentation updates
- Multi-GPU memory use reductions
- Misc display fixes and cleanups
- Add new SMU debug option

amdkfd:
- SVM fixes

radeon:
- Fix typo in comment

----------------------------------------------------------------
Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.97

Aric Cyr (1):
      drm/amd/display: 3.2.166

Aurabindo Pillai (1):
      drm/amd/display: Add feature flags to disable LTTPR

Eric Bernstein (1):
      drm/amd/display: ODM + MPO window on only one half of ODM

Evan Quan (2):
      drm/amdgpu: move smu_debug_mask to a more proper place
      drm/amdgpu: correct the wrong cached state for GMC on PICASSO

Fangzhi Zuo (1):
      drm/amd/display: Add Debugfs Entry to Force in SST Sequence

Felix Kuehling (4):
      drm/amdkfd: Fix error handling in svm_range_add
      drm/amdkfd: Fix svm_range_is_same_attrs
      drm/amdkfd: Don't split unchanged SVM ranges
      drm/amdkfd: Make KFD support on Hawaii experimental

Graham Sider (1):
      drm/amdkfd: add Navi2x to GWS init conditions

Guchun Chen (1):
      drm/amdgpu: use adev_to_drm to get drm_device pointer

Hawking Zhang (6):
      drm/amdgpu: add helper to load ip_discovery binary from file
      drm/amdgpu: rename discovery_read_binary helper
      drm/amdgpu: add helper to verify ip discovery binary signature
      drm/amdgpu: read and authenticate ip discovery binary
      drm/amdgpu: don't override default ECO_BITs setting
      drm/amdgpu: check df_funcs and its callback pointers

Isabella Basso (10):
      drm/amd: Mark IP_BASE definition as __maybe_unused
      drm/amd: fix improper docstring syntax
      drm/amdgpu: fix function scopes
      drm/amdkfd: fix function scopes
      drm/amd: append missing includes
      drm/amdgpu: fix location of prototype for amdgpu_kms_compat_ioctl
      drm/amdgpu: fix amdgpu_ras_mca_query_error_status scope
      drm/amdgpu: remove unnecessary variables
      drm/amdgpu: re-format file header comments
      drm/amd/display: fix function scopes

Jingwen Chen (2):
      drm/amd/amdgpu: fix psp tmr bo pin count leak in SRIOV
      drm/amd/amdgpu: fix gmc bo pin count leak in SRIOV

Jonathan Kim (1):
      drm/amdgpu: disable default navi2x co-op kernel support

Lang Yu (5):
      drm/amdgpu: remove power on/off SDMA in SMU hw_init/fini()
      drm/amdgpu: only hw fini SMU fisrt for ASICs need that
      drm/amdgpu: introduce a kind of halt state for amdgpu device
      drm/amdgpu: add support for SMU debug option
      drm/amd/pm: fix a potential gpu_metrics_table memory leak

Le Ma (1):
      drm/amdgpu: correct register access for RLC_JUMP_TABLE_RESTORE

Leslie Shi (2):
      drm/amdgpu: add modifiers in amdgpu_vkms_plane_init()
      drm/amdgpu: fix incorrect VCN revision in SRIOV

Lijo Lazar (1):
      drm/amd/pm: Skip power state allocation

Mario Limonciello (4):
      drm/amd: add some extra checks that is_dig_enabled is defined
      drm/amd: move variable to local scope
      drm/amd/pm: fix reading SMU FW version from amdgpu_firmware_info on YC
      drivers/amd/pm: drop statement to print FW version for smu_v13

Martin Leung (1):
      drm/amd/display: implement dc_mode_memclk

Michael Strauss (1):
      drm/amd/display: Force det buf size to 192KB with 3+ streams and upscaling

Michel Dänzer (2):
      drm/amd/display: Reduce stack size for dml31_ModeSupportAndSystemConfigurationFull
      drm/amd/display: Reduce stack size for dml31 UseMinimumDCFCLK

Mikita Lipski (1):
      drm/amd/display: parse and check PSR SU caps

Nicholas Kazlauskas (2):
      drm/amd/display: Set exit_optimized_pwr_state for DCN31
      drm/amd/display: Reset DMCUB before HW init

Philip Yang (3):
      drm/amdgpu: Handle fault with same timestamp
      drm/amdgpu: Detect if amdgpu in IOMMU direct map mode
      drm/amdgpu: Reduce SG bo memory usage for mGPUs

Rodrigo Siqueira (6):
      Documentation/gpu: Reorganize DC documentation
      Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs entry
      Documentation/gpu: Document pipe split visual confirmation
      Documentation/gpu: How to collect DTN log
      Documentation/gpu: Add basic overview of DC pipeline
      Documentation/gpu: Add amdgpu and dc glossary

Solomon Chiu (1):
      drm/amd/display: Add src/ext ID info for dummy service

Tao Zhou (1):
      drm/amdgpu: enable RAS poison flag when GPU is connected to CPU

Victor Skvortsov (1):
      drm/amdgpu: SRIOV flr_work should use down_write

Wayne Lin (1):
      drm/amd/display: Add debugfs entry for ILR

Xiang wangx (1):
      drm/radeon: Fix syntax errors in comments

Yann Dirson (5):
      Documentation/gpu: split amdgpu/index for readability
      Documentation/gpu: include description of AMDGPU hardware structure
      Documentation/gpu: include description of some of the GC microcontrollers
      amdgpu: fix some kernel-doc markup
      amdgpu: fix some comment typos

Zhigang Luo (4):
      drm/amdgpu: skip reset other device in the same hive if it's SRIOV VF
      drm/amdgpu: added PSP XGMI initialization for SRIOV VF during recover
      drm/amdgpu: recover XGMI topology for SRIOV VF after reset
      drm/amdgpu: extended waiting SRIOV VF reset completion timeout to 10s

chiminghao (1):
      drm:amdgpu:remove unneeded variable

 Documentation/gpu/amdgpu-dc.rst                    |   74 --
 Documentation/gpu/amdgpu.rst                       |  324 ------
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |   87 ++
 .../gpu/amdgpu/display/config_example.svg          |  414 +++++++
 Documentation/gpu/amdgpu/display/dc-debug.rst      |   77 ++
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |  237 +++++
 .../gpu/amdgpu/display/dc_pipeline_overview.svg    | 1125 ++++++++++++++++++++
 Documentation/gpu/amdgpu/display/dcn-overview.rst  |  171 +++
 .../gpu/amdgpu/display/display-manager.rst         |   42 +
 .../gpu/amdgpu/display/global_sync_vblank.svg      |  485 +++++++++
 Documentation/gpu/amdgpu/display/index.rst         |   31 +
 Documentation/gpu/amdgpu/driver-core.rst           |  182 ++++
 Documentation/gpu/amdgpu/driver-misc.rst           |  112 ++
 Documentation/gpu/amdgpu/index.rst                 |   17 +
 Documentation/gpu/amdgpu/module-parameters.rst     |    7 +
 Documentation/gpu/amdgpu/ras.rst                   |   62 ++
 Documentation/gpu/amdgpu/thermal.rst               |   65 ++
 Documentation/gpu/amdgpu/xgmi.rst                  |    5 +
 Documentation/gpu/drivers.rst                      |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  139 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  116 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c          |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            |   19 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    5 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    1 -
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    1 -
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   29 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    2 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |    2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    2 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    2 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  231 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   32 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |    4 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  164 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  101 +-
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |    4 +-
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |    2 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |    2 +
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   43 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   26 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |    6 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   44 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |    6 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   20 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    7 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   92 ++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   81 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    5 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    9 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   25 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |    8 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |   97 --
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   29 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |   30 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |   20 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   18 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |   14 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   21 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |    1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   16 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |    4 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |    2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |    9 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   57 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c    |    3 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c    |    7 +-
 .../amd/display/dc/dcn201/dcn201_link_encoder.c    |    6 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   16 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |    2 +
 .../drm/amd/display/dc/dcn21/dcn21_link_encoder.c  |    9 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   31 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |   18 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   36 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |    1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   11 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |    5 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |    3 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |    2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   23 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |    2 +
 .../drm/amd/display/dc/dcn301/dcn301_panel_cntl.c  |   10 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   45 +-
 .../gpu/drm/amd/display/dc/dcn302/dcn302_init.c    |    2 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |    2 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    2 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    3 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |   10 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   10 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    8 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  489 +++------
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    7 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    1 +
 .../amd/display/dc/irq/dce110/irq_service_dce110.c |   10 +-
 .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |    7 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    7 +-
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |    7 +-
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |    7 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    4 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    2 +
 .../gpu/drm/amd/include/cyan_skillfish_ip_offset.h |   10 +-
 drivers/gpu/drm/amd/include/yellow_carp_offset.h   |    4 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    8 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |    1 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    5 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   10 -
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |    3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   10 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   30 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |    2 +-
 include/uapi/drm/amdgpu_drm.h                      |    2 +-
 156 files changed, 4569 insertions(+), 1622 deletions(-)
 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
 delete mode 100644 Documentation/gpu/amdgpu.rst
 create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/config_example.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dcn-overview.rst
 create mode 100644 Documentation/gpu/amdgpu/display/display-manager.rst
 create mode 100644 Documentation/gpu/amdgpu/display/global_sync_vblank.svg
 create mode 100644 Documentation/gpu/amdgpu/display/index.rst
 create mode 100644 Documentation/gpu/amdgpu/driver-core.rst
 create mode 100644 Documentation/gpu/amdgpu/driver-misc.rst
 create mode 100644 Documentation/gpu/amdgpu/index.rst
 create mode 100644 Documentation/gpu/amdgpu/module-parameters.rst
 create mode 100644 Documentation/gpu/amdgpu/ras.rst
 create mode 100644 Documentation/gpu/amdgpu/thermal.rst
 create mode 100644 Documentation/gpu/amdgpu/xgmi.rst
