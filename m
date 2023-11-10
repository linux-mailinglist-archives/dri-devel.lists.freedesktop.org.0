Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3F7E8234
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 20:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F8110E1B3;
	Fri, 10 Nov 2023 19:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B7D10E1B3;
 Fri, 10 Nov 2023 19:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU2JRQfpWEVzW2Cal8wS6APgBFhUDjKb9bG1ycEYgyNC9NXskSEV2ZC+y7ALd8CWTJJK6LO8cJwMj20F0GZsoWhaq+J3sH2czEQwokjdCITeDfGvQ0NkceXYdpGjml+5Qnukk5rcfnAUhIqzkWQMmGvgVQpxr8rphAHOG8HOOvJuaKOa+G7GfuAVdWKufQrA0r7yCmoHEOohmsF6GMCwdWepn3V3EEl6qNxedHpa7nm/x+Ma2DCjPu4+IcnUGvFFNUeZX2q37d/VahQGs7ZT7EtES0VQPSbT4VmqTH83iWf2HDVuBFFMjRQjiG8Q2YJ1ce6gd561WfIhgS9ndCQRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXV5TCTZekmwbmIZDKQJNKhsXYFfTM4M3m9ECjeZXQw=;
 b=hwy7NKlFXtHgxtQ4q0shzNBsrFN0UJyI7U+8TopKBWl+e+ubl2PqGswFtbMZhgveNIQBOHQWGzrqlcq2tugqJqp2nBnmPriwEq8RR0snJPPEwSpki2c/nG8VvEyqfK4eVuOWFEanOcTkBkXEwdmIEqOcyCAC42Yo+AjFzUgTwxvGNPUdZMYzbv6qPyUi0RbQ9IZq8+avXrvxyFxJxNn5dfX4ryXcpPsVK6d26FJCwNapBcxGt4mmG3OHVZsVL5xAhizqdDjsTI4ydxJFAU+rVMjVZCp4+lQ8djbalHJ+KM3GgwRljdIC0l3x6geLHhWSAjSKgu30lqNrrmfbAeHwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXV5TCTZekmwbmIZDKQJNKhsXYFfTM4M3m9ECjeZXQw=;
 b=Jp1vnKBEH32QcwY5K5Ncvn0+R2YY5FPMrI8PTEbwUM9wWYEfPmC6PpVAFf2Nf0Cv1q2gGSt/lJCwr+U09xRRhaFkqatH0TYW6JXv9L7j4BDvzpJiebJQ4+T0QnsRJ4NLTsb5AFBCAD6/XOJ7NqzPTeytwVQ4EwSC5H+iDf4T78E=
Received: from MN2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:c0::31)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 19:07:17 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:c0:cafe::d9) by MN2PR05CA0018.outlook.office365.com
 (2603:10b6:208:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.10 via Frontend
 Transport; Fri, 10 Nov 2023 19:07:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 19:07:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 13:07:16 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-next-6.7
Date: Fri, 10 Nov 2023 14:07:03 -0500
Message-ID: <20231110190703.4741-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf32274-b1a6-43e6-b3e8-08dbe22041c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cU6LH4o0JOc0O+nCSKRAq1W+ZZ4w1+XoC9dVADyW86WbvwwbbqtDkh0A6BIVfYbMo7zl3a7qOMSuTw6pYu1SxP9cxnkaALud0szAemEPmFL/ZxcmkMfPiNsStdvNkIZIo+KiXlNKvo6JxMBJvROTvLVxue/Lr6OZJRHIl8WqE/LxXzKxHmqWGGBV8P3greaqjuB+KLeFadD4TfYyX6WZ7MOa+Uld5yZP3SCw6CuppfmDhAzTSclFBgxUYQcZl2SFakqLAs36NULa9LUYxRCuIZlWQZH0KXPv8CZ+FLFzX+EfTR3i2F2IMw3JauXVjNsd19pa04OQ2djCQKMBL+90YW2RdHt5No+3673lF4Q9Pm+dZGTUEticvf0AcaNwiJg0u31r/IuqbSKtnDvBAejxcBYlz2O+nYnQ93CEsiqjxl4qcHZk8mSBHA6RmGjjN9cyG0wB7NB5bqoCjGJqe7STchHDJbbj8TqkSsOKTHoakmuKEiEh8dJEXF7HF0mobuc/7GoRYq0G4oaTsajyDIVcKcHvvJmzIS9N0XNFED7wz7nzF93bHW/pINNVYeBIFWRnySCYO7c2PoIhOZLx/Jaxx0OARfE/skrbv0oEoysyYpq8bAlYZU5zEJbs1/B9/vSagRJlDi8vivxcF/3HTGNLNatyAEN9tnFdFOjvXH7vy3CfqINgKcAz6F2MTMSQw6hyLxGsBwx+oKbVGScVKJaMxNhLXS9xlJUlnpnAHxmN6xIyAXx7ey9+7b0l5chqjhifof2Azn/O9huns4VaGxmXWpamLEMx0yk8bh1LXzYfXq6OCnEHRBSqE3aXDFenD0RbEdqluivUaGvsPAViMkgMcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(4001150100001)(7696005)(40480700001)(40460700003)(966005)(2616005)(6666004)(478600001)(36860700001)(36756003)(82740400003)(356005)(86362001)(16526019)(5660300002)(70206006)(316002)(47076005)(4326008)(26005)(66574015)(110136005)(1076003)(41300700001)(336012)(426003)(2906002)(81166007)(70586007)(83380400001)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:07:17.2855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf32274-b1a6-43e6-b3e8-08dbe22041c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359
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

Fixes for 6.7.  A bit bigger than this would normally be at this point, but these
are mainly fixes for new IPs added or enabled in 6.7 so they should be mostly
self-contained. The rest is the usual general fixes.

The following changes since commit 9ccde17d46554dbb2757c427f2cdf67688701f96:

  Merge tag 'amd-drm-next-6.7-2023-11-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-11-06 11:25:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.7-2023-11-10

for you to fetch changes up to 8473bfdcb5b1a32fd05629c4535ccacd73bc5567:

  drm/amdgpu: fix error handling in amdgpu_vm_init (2023-11-10 11:33:28 -0500)

----------------------------------------------------------------
amd-drm-next-6.7-2023-11-10:

amdgpu:
- SR-IOV fixes
- DMCUB fixes
- DCN3.5 fixes
- DP2 fixes
- SubVP fixes
- SMU14 fixes
- SDMA4.x fixes
- Suspend/resume fixes
- AGP regression fix
- UAF fixes for some error cases
- SMU 13.0.6 fixes
- Documentation fixes
- RAS fixes
- Hotplug fixes
- Scheduling entity ordering fix
- GPUVM fixes

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix AGP init order
      drm/amdgpu: move UVD and VCE sched entity init after sched init

Alvin Lee (1):
      drm/amd/display: For cursor P-State allow for SubVP

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.189.0
      drm/amd/display: [FW Promotion] Release 0.0.190.0

Aric Cyr (3):
      drm/amd/display: 3.2.257
      drm/amd/display: 3.2.258
      drm/amd/display: Promote DAL to 3.2.259

Bragatheswaran Manickavel (1):
      drm/amd/display: avoid variable reinitialization

Chaitanya Dhere (1):
      drm/amd/display: Remove references to unused dml arch version

Christian König (3):
      drm/amdgpu: fix error handling in amdgpu_bo_list_get()
      drm/amdgpu: lower CS errors to debug severity
      drm/amdgpu: fix error handling in amdgpu_vm_init

ChunTao Tso (1):
      drm/amd/display: amend HPD handler for Replay

Daniel Miess (3):
      drm/amd/display: On boot disable domain22 force power on
      drm/amd/display: Enable RCO options for dcn35
      drm/amd/display: Enable physymclk RCO

David Yat Sin (1):
      drm/amdgpu: Change extended-scope MTYPE on GC 9.4.3

Dennis Chan (2):
      drm/amd/display: Introduce flag for disabling Replay desync recovery
      drm/amd/display: Revise Replay Desync Error IRQ handle

Fangzhi Zuo (1):
      drm/amd/display: Allow 16 max_slices for DP2 DSC

Felix Kuehling (1):
      drm/amdgpu: Fix possible null pointer dereference

George Shen (3):
      drm/amd/display: Update test link rate DPCD bit field to match spec
      drm/amd/display: Update DP HPO MSA with colorimetry from test request
      drm/amd/display: Set stream's DP test pattern upon test request

Hawking Zhang (2):
      drm/amdgpu: Support multiple error query modes
      drm/amdgpu: correct acclerator check architecutre dump

Hunter Chasens (1):
      drm: amd: Resolve Sphinx unexpected indentation warning

Ilya Bakoulin (1):
      drm/amd/display: Fix missing blendTF programming

Jiadong Zhu (1):
      drm/amdgpu/soc21: add mode2 asic reset for SMU IP v14.0.0

JinZe.Xu (1):
      drm/amd/display: decouple dmcub execution to reduce lock granularity

Joshua Aberback (1):
      drm/amd/display: Remove unused duplicate register definition

José Pekkarinen (1):
      drm/amd/display: remove duplicated argument

Le Ma (1):
      drm/amd/pm: raise the deep sleep clock threshold for smu 13.0.6

Lijo Lazar (3):
      drm/amdgpu: Fix sdma 4.4.2 doorbell rptr/wptr init
      drm/amd/pm: Hide irrelevant pm device attributes
      drm/amd/pm: Hide pp_dpm_pcie device attribute

Mario Limonciello (1):
      drm/amd: Explicitly check for GFXOFF to be enabled for s0ix

Ovidiu Bunea (1):
      drm/amd/display: Disable OTG for mode timing switch on DCN35

Rodrigo Siqueira (1):
      drm/amd/display: Create optc.h file

Roman Li (1):
      drm/amd/display: Add missing dml2 init value for dcn35

Sung Joon Kim (3):
      drm/amd/display: Fix FRL assertion on boot
      drm/amd/display: Enable more IPS options
      drm/amd/display: Fix handling duplicate planes on one stream

Surbhi Kakarya (1):
      drm/amd: Disable XNACK on SRIOV environment

Taimur Hassan (1):
      drm/amd/display: Fix OTG disable workaround logic

Tao Zhou (3):
      drm/amdgpu: handle extra UE register entries for gfx v9_4_3
      drm/amdgpu: add RAS reset/query operations for XGMI v6_4
      drm/amdgpu: Don't warn for unsupported set_xgmi_plpd_mode

Tim Huang (2):
      drm/amd/pm: not stop rlc for IMU enabled APUs when suspend
      drm/amdgpu: move kfd_resume before the ip late init

Victor Lu (6):
      drm/amdgpu: Add flag to enable indirect RLCG access for gfx v9.4.3
      drm/amdgpu: Add xcc param to SRIOV kiq write and WREG32_SOC15_IP_NO_KIQ (v4)
      drm/amdgpu: Skip PCTL0_MMHUB_DEEPSLEEP_IB write in jpegv4.0.3 under SRIOV
      drm/amdgpu: Do not program PF-only regs in hdp_v4_0.c under SRIOV (v2)
      drm/amdgpu: Use correct KIQ MEC engine for gfx9.4.3 (v5)
      drm/amdgpu: Change WREG32_RLC to WREG32_SOC15_RLC where inst != 0 (v2)

Vitaly Prosyak (1):
      drm/amdgpu: fix software pci_unplug on some chips

Wenjing Liu (1):
      drm/amd/display: save and restore mall state when applying minimal transition

Yang Wang (7):
      drm/amdgpu: correct amdgpu ip block rev info
      drm/amdgpu: correct smu v13.0.6 umc ras error check
      drm/amdgpu: refine smu v13.0.6 mca dump driver
      drm/amdgpu: disable smu v13.0.6 mca debug mode by default
      drm/amdgpu: add pcs xgmi v6.4.0 ras support
      drm/amdgpu: correct mca debugfs dump reg list
      drm/amdgpu: add smu v13.0.6 pcs xgmi ras error query support

Yihan Zhu (1):
      drm/amd/display: DCN35 Disable cm power optimization

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   3 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |  40 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  42 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 114 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            | 182 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |  60 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 102 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  35 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           | 218 +++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  49 +++-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  35 ++-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  27 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |  14 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   3 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   4 -
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |   5 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  21 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  27 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  74 +++++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   8 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |  15 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  | 186 +-----------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |  10 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |  73 ++---
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |  10 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |   1 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |  37 ++-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   2 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  61 ++--
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |   4 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  55 +++-
 .../amd/display/dc/dml2/dml2_translation_helper.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  18 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  11 +
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |  18 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  17 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  34 ++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   5 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       | 219 ++++++++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   2 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |  17 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  15 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  25 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  12 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  29 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 315 +++++++++------------
 85 files changed, 1688 insertions(+), 773 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h
