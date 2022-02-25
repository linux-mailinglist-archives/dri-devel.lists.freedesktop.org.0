Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51604C4DCC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C626F10E922;
	Fri, 25 Feb 2022 18:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793FF10E897;
 Fri, 25 Feb 2022 18:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdHbXqNkVgp3tKTUHcEwiYq7j/2/PANDWqTHipi51hWSN5+/TkTHMqRMSlCCY9NJrST05Lo/BrTzThSm/Oo5Nw2TDlOF6z/ZVFxkILg1+dGTX9P+wCCz/0XP6titUB7ZvfspEd6W+UBERyWdeHnlb4dCUdd92iwQs5G1NYDGml0/SEo+4AGlbcWtKQwhA+adMIEDBPjuI8hsL6pcyoLIRxu7uye0C8RNK7ROtKFZv1KBFKTVWu4/tDVY+vwZSS/1TOckMsTVD25cE1FYSJ5QhZ2D0xqeLPy/WBqWTXevQ6qtoHfI8A6H+SPuFICBCO7OoQDo+0SXFjbcoUU07ylIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+j/ck4WPJAIffsuIzkzGrZXXhp3V50tDYiUG7GmdPM=;
 b=dik0bjLBj7cFBxOCsiMXJL7AaVlVkYliTphsDEUkVH+dotNqk7SOcPvhE4sQXcoP+u69hiZKxHP1jr2B9qVYMrWoTeGxjDIddMSOmlf6bWgAOL7LDCokvxYcIEfx6JBl+KK2mh32p5SphRid75suoHUC4aztRDQKA1L4grIW33GO0/uCKFEkj5rBU30sy99uT/VJ0Eb/4DhII8pmmgoouFOf0wlpH6zUWx8Divn4CoIcRfY9F1W4aedwYhjqDcYPiayo5cf1c0kZYPGG4VaioM0W0/DK2RqOGAOnLmm0FyMoh3P0cXZnmyO2K5Mjiul02a2WrKkfusjiMB5scoeqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+j/ck4WPJAIffsuIzkzGrZXXhp3V50tDYiUG7GmdPM=;
 b=hxqZc351G52VtGJvAZqA0up2nlLNLG424DHEREWAnwV9VET93V28OEXddoaRhwtLfFhmjDKsS3kOixIM4L+/99L29aiLIvtBhiQuiB7EpDLI54/UwzVVT8oNmUf5zKC9oV+D9dN5tFHmjq7jYD7CorUpsdOrP+3z1mV/vCDofaU=
Received: from MW4PR03CA0094.namprd03.prod.outlook.com (2603:10b6:303:b7::9)
 by BL0PR12MB4740.namprd12.prod.outlook.com (2603:10b6:208:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 18:35:52 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::bb) by MW4PR03CA0094.outlook.office365.com
 (2603:10b6:303:b7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24 via Frontend
 Transport; Fri, 25 Feb 2022 18:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 18:35:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Feb
 2022 12:35:50 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.18
Date: Fri, 25 Feb 2022 13:35:35 -0500
Message-ID: <20220225183535.5907-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83b98c65-af15-48d3-7e64-08d9f88da6a3
X-MS-TrafficTypeDiagnostic: BL0PR12MB4740:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4740D269F1E16BA1387A8850F73E9@BL0PR12MB4740.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pkZG8Iuf3mEwGRVj9aBhsHMpLxnbBJiBgston2iJFY2S84aawDWNc9p/SFsHfI+ySERifiP/wtkdlUDXdkbXtPL9x8wfrBCe99hmDrBGd1AZVHMLCOS07eCPz7BFvx+8BixGplRt9Ys7z3ippCuiOQ2+QpcZqBFheiL50P3tJKLEPCvFQ/tufyJhJZXnfuOyWHA7cMRAEvFXKQZefQU76KgtKdBrMAOgaMtBn3p8TU/a5aF4J1dB/oc9y+/Y8Zj6e0gdzmbgPINAtKxxICuRKWcqU2ozrVLTnqWjyOPlKX1GszdPAuylUSREwaVpcJTiN+ZzKlX903WSLpg428TVKmPb+nznCbIldimC9mcdcKHUMq8MPQApVnwwX+pb5DCvbmIYojv6fOeJDy355pu7gw5m7ot3pkAo0osyxiDhjJzN7MVPYxmNGIQuvwvAjNRinpGSarWCcMxVh7pSCamHgHEa3IRPcTD1vU6AwZYs5x0G9T/fXwnrSfIbdytsSE34CqcOmsHl60BnvFLinZX1a35lX4r8E3+WItelPeIUJsKl7qJtFanMLyVp+jpW87i6MyeRB7bG8A/uyiFK81EuyhQ/h5OBXoCMM4UDwJAa1JZfUf25M0ZABeGy2hKg6LqY3jy5BLhmC0x3nOjDurdXTav43cXUwnmnONkn62ERakwrqDfuEFilSZDPrnvZVjGGwizqDIUBGLrILztiGcTDEQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(110136005)(82310400004)(1076003)(966005)(8936002)(86362001)(36860700001)(40460700003)(2616005)(6666004)(16526019)(186003)(4326008)(356005)(8676002)(26005)(508600001)(83380400001)(81166007)(70586007)(7696005)(316002)(426003)(70206006)(2906002)(336012)(5660300002)(30864003)(66574015)(47076005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:35:51.7414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b98c65-af15-48d3-7e64-08d9f88da6a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4740
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

New stuff for 5.18.

The following changes since commit b63c54d978236dd6014cf2ffba96d626e97c915c:

  drm/amdkfd: Use proper enum in pm_unmap_queues_v9() (2022-02-17 15:59:06 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-02-25

for you to fetch changes up to 111aeed25ec6bf4d5b4a7b4cb5654f002ba9f795:

  drm/amdgpu: add gfxoff support for smu 13.0.5 (2022-02-25 11:51:18 -0500)

----------------------------------------------------------------
amd-drm-next-5.18-2022-02-25:

amdgpu:
- Raven2 suspend/resume fix
- SDMA 5.2.6 updates
- VCN 3.1.2 updates
- SMU 13.0.5 updates
- DCN 3.1.5 updates
- Virtual display fixes
- SMU code cleanup
- Harvest fixes
- Expose benchmark tests via debugfs
- Drop no longer relevant gart aperture tests
- More RAS restructuring
- W=1 fixes
- PSR rework
- DP/VGA adapter fixes
- DP MST fixes
- GPUVM eviction fix
- GPU reset debugfs register dumping support
- Misc display fixes
- SR-IOV fix
- Aldebaran mGPU fix
- Add module parameter to disable XGMI for testing

amdkfd:
- IH ring overflow logging fixes
- CRIU fixes
- Misc fixes

----------------------------------------------------------------
Alex Deucher (13):
      drm/amdkfd: make CRAT table missing message informational only
      drm/amdgpu/benchmark: use dev_info rather than DRM macros for logging
      drm/amdgpu: plumb error handling though amdgpu_benchmark()
      drm/amdgpu: print the selected benchmark test in the log
      drm/amdgpu: add a benchmark mutex
      drm/amdgpu: expose benchmarks via debugfs
      drm/amdgpu: drop benchmark module parameter
      drm/amdgpu: drop testing module parameter
      drm/amdgpu/display: split dmcu and gpuvm handling logic
      drm/amdgpu: derive GTT display support from DM
      drm/amdgpu: use kernel BO API for benchmark buffer management
      drm/amdgpu: use ktime rather than jiffies for benchmark results
      drm/amdgpu: fix typo in amdgpu_discovery.c

Alex Sierra (1):
      drm/amdgpu: Add use_xgmi_p2p module parameter

Andrey Grodzovsky (1):
      drm/amdgpu: Exclude PCI reset method for now.

Aric Cyr (1):
      drm/amd/display: 3.2.174

Boyuan Zhang (2):
      drm/amdgpu/vcn: add vcn support for vcn 3.1.2
      drm/amdgpu: enable vcn pg and cg for vcn 3.1.2

Charlene Liu (1):
      drm/amd/display: add debug option to bypass ssinfo from bios.

Chen Gong (1):
      drm/amdgpu: do not enable asic reset for raven2

Danijel Slivka (1):
      amdgpu/pm: Disable managing hwmon sysfs attributes for ONEVF mode

David Yat Sin (1):
      drm/amdkfd: Fix for possible integer overflow

Dmytro Laktyushkin (2):
      drm/amd/display: limit unbounded requesting to 5k
      drm/amd/display: revert populating dcn315 clk table based on dcfclk

Duncan Ma (2):
      drm/amd/display: Set compbuf size to min at prep prevent overbook crb
      drm/amd/display: Set compbuf size to min at prep prevent overbook crb

Fangzhi Zuo (1):
      drm/amd/display: Ignore Transitional Invalid Link Rate Error Message

Felix Kuehling (2):
      drm/amdkfd: Fix criu_restore_bo error handling
      drm/amdkfd: Use real device for messages

George Shen (1):
      drm/amd/display: Refactor fixed VS logic for non-transparent mode

Guchun Chen (3):
      Revert "drm/amdgpu: add modifiers in amdgpu_vkms_plane_init()"
      drm/amdgpu: bypass tiling flag check in virtual display case (v2)
      drm/amdgpu: read harvest bit per IP data on legacy GPUs

Harish Kasiviswanathan (1):
      drm/amdkfd: Print bdf in peer map failure message

Ilya (1):
      drm/amd/display: Fix wrong resolution with DP/VGA adapter

Kent Russell (1):
      drm/amdkfd: Drop IH ring overflow message to dbg

Leo Li (1):
      drm/amd/display: Fix DC definition of PMFW Pstate table for DCN316

Lijo Lazar (1):
      drm/amd/pm: Fix missing prototype warning

Magali Lemes (4):
      drm/amd/display: Adjust functions documentation
      drm/amd/display: Add conditional around function
      drm/amd/display: Use NULL instead of 0
      drm/amd/display: Turn functions into static

Maíra Canal (9):
      drm/amdgpu: Change amdgpu_ras_block_late_init_default function scope
      drm/amdgpu: Remove unused get_umc_v8_7_channel_index function
      drm/amd/display: Remove unused temp variable
      drm/amd/display: Remove unused dcn316_smu_set_voltage_via_phyclk function
      drm/amd/display: Remove vupdate_int_entry definition
      drm/amd/display: Remove unused dmub_outbox_irq_info_funcs variable
      drm/amd/display: Remove unused variable
      drm/amd/display: Add missing prototypes to dcn201_init
      drm/amd/display: Turn global functions into static functions

Paul Hsieh (1):
      drm/amd/display: lock/un-lock cursor if odm pipe split used

Paul Menzel (1):
      drm/amdgpu: Fix typo in *whether* in comment

Po Ting Chen (1):
      drm/amd/display: Refactor PSR DPCD caps detection

Prike Liang (4):
      drm/amdgpu: enable TMZ option for onwards asic
      drm/amd/pm: validate SMU feature enable message for getting feature enabled mask
      drm/amdgpu/nv: enable gfx10.3.7 clock gating support
      drm/amdgpu/nv: set mode2 reset for MP1 13.0.8

Qiang Yu (1):
      drm/amdgpu: check vm ready by amdgpu_vm->evicting flag

Qingqing Zhuo (11):
      drm/amd/include: add DCN 3.1.5 registers
      drm/amd/display: Add DCN315 family information
      drm/amd/display: Add DCN315 CLK_MGR
      drm/amd/display: Add DCN315 GPIO
      drm/amd/display: Add DCN315 IRQ
      drm/amd/display: Add DCN315 DMUB
      drm/amd/display: Add DCN315 Resource
      drm/amd/display: Add DCN315 Command Table Helper
      drm/amd/display: Add DCN315 blocks to Makefile
      drm/amd/display: Add DCN315 CORE
      drm/amd/display: Add DCN315 DM Support

Somalapuram Amaranath (2):
      drm/amdgpu: add debugfs for reset registers list
      drm/amdgpu: add reset register dump trace on GPU

Sung Joon Kim (1):
      drm/amd/display: increasing DRAM BW percent for DCN315

Wayne Lin (1):
      drm/amd/display: clear remote dc_sink when stop mst

Wenjing Liu (1):
      drm/amd/display: add cable ID support for usb c connector

Xiaogang Chen (1):
      drm/amdgpu: config HDP_MISC_CNTL.READ_BUFFER_WATERMARK

Yifan Zhang (13):
      drm/amdgpu: add support for sdma 5.2.6
      drm/amdgpu: add support for nbio 7.3.0
      drm/amdgpu: add smuio support for smuio 13.0.10
      drm/amdgpu: add support for psp 13.0.5
      drm/admgpu/pm: add smu 13.0.5 driver interface headers
      drm/amd/pm: update smc message sequence for smu 13.0.5
      drm/amd/pm: add smu_v13_0_5_ppt implementation
      drm/amdgpu: add mp 13.0.5 header files
      drm/amdgpu: add dm ip block for dcn 3.1.5
      drm/amdgpu: add mode2 reset support for smu 13.0.5
      drm/amd/pm: fix mode2 reset fail for smu 13.0.5
      drm/amd/pm: refine smu 13.0.5 pp table code
      drm/amdgpu: add gfxoff support for smu 13.0.5

yipechai (1):
      drm/amdgpu: Fixed warning reported by kernel test robot

 drivers/gpu/drm/amd/amdgpu/Makefile                |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c      |    244 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    105 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    132 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_test.c           |    250 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |     16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |      8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |      9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |      3 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |      3 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |      4 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     22 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |      7 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     11 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |      4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c              |      7 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |      8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |      1 -
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |      2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |     61 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |      6 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |      1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     24 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |      2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     58 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |      1 +
 .../amd/display/dc/bios/command_table_helper2.c    |      1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |      9 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     23 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |      2 +
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |      3 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |      2 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    617 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h |     49 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |    314 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h |    126 +
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |     13 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |     18 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h |      9 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |      6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |     35 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |      3 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    230 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     10 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |      7 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |      9 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     31 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |      8 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |      4 +-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |      2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |      3 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |     12 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dcn315/Makefile     |     56 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   2304 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.h    |     42 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |      1 +
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |      8 +
 .../amd/display/dc/gpio/dcn315/hw_factory_dcn315.c |    260 +
 .../amd/display/dc/gpio/dcn315/hw_factory_dcn315.h |     31 +
 .../display/dc/gpio/dcn315/hw_translate_dcn315.c   |    374 +
 .../display/dc/gpio/dcn315/hw_translate_dcn315.h   |     33 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      4 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      4 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |      2 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |      8 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |      2 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |      5 -
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |     14 -
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |      2 +-
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.c |    438 +
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.h |     34 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |      1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |     44 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn315.c |     62 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn315.h |     68 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |      9 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |      6 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |      1 +
 .../drm/amd/display/include/ddc_service_types.h    |      1 +
 .../amd/include/asic_reg/dcn/dcn_3_1_5_offset.h    |  15191 +++
 .../amd/include/asic_reg/dcn/dcn_3_1_5_sh_mask.h   |  62061 +++++++++++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_2_offset.h  |  11957 ++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_2_sh_mask.h | 103633 ++++++++++++++++++
 .../drm/amd/include/asic_reg/hdp/hdp_4_0_sh_mask.h |      2 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_5_offset.h |    455 +
 .../amd/include/asic_reg/mp/mp_13_0_5_sh_mask.h    |    672 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |      4 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |      4 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h |    140 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_pmfw.h    |    126 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_ppsmc.h   |     74 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |      3 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |      1 +
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |     12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |      2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |      4 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   1057 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.h   |     29 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     82 +-
 113 files changed, 201304 insertions(+), 720 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn315/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_translate_dcn315.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_translate_dcn315.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn315.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn315.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_5_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_5_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_5_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_5_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.h
