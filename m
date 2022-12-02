Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75B640A33
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 17:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C31410E6FF;
	Fri,  2 Dec 2022 16:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896910E700;
 Fri,  2 Dec 2022 16:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5+6/ENVISlkGVFvRy43MJr8CKnl8H91B3NRmoMvfHV0DDFXGflQMW6Hl43QJt43zI50TdU+ufha93RnJhp3UuQRj0fm7pl+lQOzukOIE431bURN8l92d2nuK5z/kqvwOU0YNVPHXdRoN6qI5TszxoWkydxuPchoWF2rbUc5yufpwP/cJ+k99piEelPnpJ3f30+nm7GffveeiJBSO85W8Ag3budDXpSg64q4gON3rZcPzmksOgBI8m6CPfQAR4kEsdcOdq4gvHpVKprq7bb7Fovhzlt57rsk+2SakZ/AcDmu0GLncMcAXepmgk351qSuikT8faFVEXnUPgRZ4XV0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecQp3c8SgGoAT14n+w/vnpVMH1VfSflk8cbzVsjUkFg=;
 b=KsxtLNxgFAgE7jIZbdengIefVxf9sOQIisLJSICIStCe32MUcG2omGSQCSJ29M9/fomzI8AqWSLOyz+mBQqbtBzWp6Ly640zGzqfbMCWWXgqgZO0X7gHvxPNCooLDxQSvoRUWQSwf+IBK89PV0RUJ3r4/lQCTYo9rq8vJ8lkRO2L3LEKuR996ylpy6PaZfbr+oSt2nBAUqJvDxNepGZztoVbQD0xz1hZKEsBuZuIuigozghzEfg89EVJ8t2zPXgWdJxs7ue23cP3PI9dJVDEYe8OQta7zfQNsRU+cTnbs/Sa9VjOATBdsceoXR0sgqJlXpoHXz8XEZpTCQTotBhaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecQp3c8SgGoAT14n+w/vnpVMH1VfSflk8cbzVsjUkFg=;
 b=O64PSBWUJxXLwSUeyIYfWScEnc6ANJIc2Ry8REGZ4jOc4rzy5UZRYlK6dl/EHXbQTPZzJQrw/8IASsWJL85LdWqtSVLtTk05jShDbQ+eBWpsEnIasvuCCIffp9ZOg0FnS2OvjMfPC091tnZdPRn3CShjlOvnPN9QV6s9fYLNKhE=
Received: from BN0PR04CA0156.namprd04.prod.outlook.com (2603:10b6:408:eb::11)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 16:07:32 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::7f) by BN0PR04CA0156.outlook.office365.com
 (2603:10b6:408:eb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Fri, 2 Dec 2022 16:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 16:07:32 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 10:07:30 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.2
Date: Fri, 2 Dec 2022 11:06:59 -0500
Message-ID: <20221202160659.5987-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT007:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: babd3885-1b23-4a8b-2da7-08dad47f51c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWlLj4cFdOWkihJys+O0WkuoccjxTRyXeA0NFcuzGCxgd9Kz/VdYBPFfTuuMRodQgyIMMerraHF3V/XjXmH2AHL9GZZO5VsuFMeYrKsDkjFzUxMmw0WvpKGdxsdJ/hcQ9VLuLJPCRr/EpbsfXvHCuNAjKTgdyJg/IebfJQlrfmv8vRQq6xXCR5x4nyWa5DF4O3yflGxNDCXrY7EWK1sP9a/XSdSjmNAnnVPF0BU8LVuDhtrsFcutouDSQlBw0tMu64ABiPTW40s3c5gOYVC8Onp3L9MNUleM0qzmkfYNOE6ULlT1/hEk0WIGkVuFWsBMm7hWd51gU7Cyz4HevxpK/r/gcnasKaNAe7jPInlfQg+T3kE4bMnQXeJhF+6KqBqH/8HDJ81dZ4eDS7/u+fNc0eU/eucmdQ2K+2hQVx+h3BW3+22dKfGNeZdjhp4f/msNjIZnVDC4g6cRqVswcwUb+IU/mxgGtlOKbAFq3v/TkTw622npdQ9nNF+MoBrt2qX+8u0Gua87UVhczKhaO1m27OT5qNbQAROxUMOivzcFE999kpjk/MIV/sgoJpugUmu+29hpnFA9faJj+2+awCnAvT5BGeQ9gxSwJdGsLm3nzdmE+XFTNCbMnpZGsXIDG8u7XBS2BIvgjz0KVXZxSkeMaMPwXGBB9KsO2vQO8lrAjKKord1WhdebDjDqv0TZW1PwoIZHoAZVJcoOKycTx1sHRQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(36756003)(356005)(81166007)(2906002)(4326008)(40460700003)(8936002)(41300700001)(5660300002)(4001150100001)(82740400003)(83380400001)(36860700001)(86362001)(70586007)(70206006)(478600001)(966005)(1076003)(2616005)(110136005)(316002)(40480700001)(82310400005)(6666004)(186003)(47076005)(16526019)(336012)(43170500006)(8676002)(26005)(426003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 16:07:32.3714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: babd3885-1b23-4a8b-2da7-08dad47f51c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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

Last pull for 6.2.  Support for some new GC 11.x variants and preemption
support for GC 9.x.  The rest is bug fixes.

The following changes since commit 10d2d1fc05f03ee1626b60761a3425622767513e:

  drm/amdgpu: Partially revert "drm/amdgpu: update drm_display_info correctly when the edid is read" (2022-11-23 10:31:31 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.2-2022-12-02

for you to fetch changes up to 4670ac706ff9b3d0adb766ef9e93cc36d9dda474:

  drm/amdgpu: expand on GPUVM documentation (2022-12-02 10:06:00 -0500)

----------------------------------------------------------------
amd-drm-next-6.2-2022-12-02:

amdgpu:
- Fix CPU stalls when allocating large amounts of system memory
- SR-IOV fixes
- BACO fixes
- Enable GC 11.0.4
- Enable PSP 13.0.11
- Enable SMU 13.0.11
- Enable NBIO 7.7.1
- Fix reported VCN capabilities for RDNA2
- Misc cleanups
- PCI ref count fixes
- DCN DPIA fixes
- DCN 3.2.x fixes
- Documentation updates
- GC 11.x fixes
- VCN RAS fixes
- APU fix for passthrough
- PSR fixes
- GFX preemption support for gfx9
- SDMA fix for S0ix

amdkfd:
- Enable KFD support for GC 11.0.4
- Misc cleanups
- Fix memory leak

----------------------------------------------------------------
Alex Deucher (3):
      drm/amd/display: use the proper fb offset for DM
      drm/amdgpu: add GART, GPUVM, and GTT to glossary
      drm/amdgpu: expand on GPUVM documentation

Alvin Lee (3):
      drm/amd/display: Don't overwrite subvp pipe info in fast updates
      drm/amd/display: Retain phantom pipes when min transition into subvp (#7358)
      drm/amd/display: Fix DTBCLK disable requests and SRC_SEL programming

Aric Cyr (1):
      drm/amd/display: 3.2.214

Dan Carpenter (1):
      drm/amdkfd: Remove unnecessary condition in kfd_topology_add_device()

Dillon Varone (4):
      drm/amd/display: MALL SS calculations should iterate over all pipes for cursor
      drm/amd/display: Fix arithmetic error in MALL size calculations for subvp
      drm/amd/display: Use DCC meta pitch for MALL allocation requirements
      drm/amd/display: program output tf when required

Dmytro Laktyushkin (1):
      drm/amd/display: set per pipe dppclk to 0 when dpp is off

Guchun Chen (4):
      drm/amd/pm/smu11: BACO is supported when it's in BACO state
      drm/amd/pm/smu11: poll BACO status after RPM BACO exits
      drm/amdgpu: add printing to indicate rpm completeness
      drm/amdgpu: use dev_dbg to print messages in runtime cycle

Hamza Mahfooz (1):
      drm/amd/display: add FB_DAMAGE_CLIPS support

Jack Xiao (2):
      drm/amd/amdgpu: update mes11 api def
      drm/amdgpu/mes11: enable reg active poll

James Zhu (1):
      drm/amdgpu: fix stall on CPU when allocate large system memory

Jiadong.Zhu (4):
      drm/amdgpu: Introduce gfx software ring (v9)
      drm/amdgpu: Add software ring callbacks for gfx9 (v8)
      drm/amdgpu: Modify unmap_queue format for gfx9 (v6)
      drm/amdgpu: MCBP based on DRM scheduler (v9)

Konstantin Meskhidze (2):
      drm/amdkfd: Fix memory leakage
      drm/amdgpu: Fix logic error

Leo Liu (1):
      drm/amdgpu: enable Vangogh VCN indirect sram mode

Liang He (1):
      drm/amdgpu: Fix potential double free and null pointer dereference

Likun Gao (1):
      drm/amdgpu: skip vram reserve on firmware_v2_2 for bare-metal

Peter Maucher (2):
      drm/amdgpu: improve GART and GTT documentation
      drm/amdgpu: mention RDNA support in docu

Prike Liang (1):
      drm/amdgpu/sdma_v4_0: turn off SDMA ring buffer in the s2idle suspend

Randy Dunlap (1):
      drm/amdgpu: update docum. filename following rename

Saleemkhan Jamadar (1):
      drm/amdgpu: Enable pg/cg flags on GC11_0_4 for VCN

Stylon Wang (2):
      drm/amd/display: Fix race condition in DPIA AUX transfer
      drm/amd/display: Create debugfs to tell if connector is DPIA link

Tao Zhou (1):
      drm/amdgpu: enable VCN RAS poison for VCN v4.0

Tim Huang (4):
      drm/amdgpu/discovery: add PSP IP v13.0.11 support
      drm/amdgpu/soc21: add mode2 asic reset for SMU IP v13.0.11
      drm/amdgpu/pm: use the specific mailbox registers only for SMU IP v13.0.4
      drm/amdgpu: enable PSP IP v13.0.11 support

Tong Liu01 (1):
      drm/amdgpu: add drv_vram_usage_va for virt data exchange

Veerabadhran Gopalakrishnan (1):
      amdgpu/nv.c: Corrected typo in the video capabilities resolution

Wesley Chalmers (1):
      drm/amd/display: Use the largest vready_offset in pipe group

Xiongfeng Wang (2):
      drm/radeon: Fix PCI device refcount leak in radeon_atrm_get_bios()
      drm/amdgpu: Fix PCI device refcount leak in amdgpu_atrm_get_bios()

Yifan Zhang (14):
      drm/amdgpu/discovery: enable soc21 common for GC 11.0.4
      drm/amdgpu/discovery: enable gmc v11 for GC 11.0.4
      drm/amdgpu/discovery: enable gfx v11 for GC 11.0.4
      drm/amdgpu/discovery: enable mes support for GC v11.0.4
      drm/amdgpu: set GC 11.0.4 family
      drm/amdgpu/discovery: set the APU flag for GC 11.0.4
      drm/amdgpu: add gfx support for GC 11.0.4
      drm/amdgpu: add soc21 common ip block support for GC 11.0.4
      drm/amdgpu: add gmc v11 support for GC 11.0.4
      drm/amdkfd: add GC 11.0.4 KFD support
      drm/amdgpu/pm: enable swsmu for SMU IP v13.0.11
      drm/amdgpu: add smu 13 support for smu 13.0.11
      drm/amdgpu/pm: add GFXOFF control IP version check for SMU IP v13.0.11
      drm/amdgpu/discovery: enable nbio support for NBIO v7.7.1

Yu Songping (1):
      swsmu/amdgpu_smu: Fix the wrong if-condition

YuBiao Wang (1):
      drm/amdgpu: Add nv mailbox irq in soc21

Yushan Zhou (1):
      drm/amdgpu: remove redundant NULL check

ye xingchen (1):
      drm/amdgpu: use sysfs_emit() to instead of scnprintf()

 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |  23 +
 Documentation/gpu/amdgpu/driver-core.rst           |   4 +-
 Documentation/gpu/amdgpu/index.rst                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  54 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |  50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       | 516 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h       | 103 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  54 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   2 -
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 296 ++++++++++--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  28 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  24 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  24 +-
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  30 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  24 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 281 ++++++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  17 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  23 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   4 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  23 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  11 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  30 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  34 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   8 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  66 ++-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  13 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  15 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   2 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   3 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   9 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   4 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  28 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  17 +-
 drivers/gpu/drm/radeon/radeon_bios.c               |   1 +
 67 files changed, 1697 insertions(+), 364 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
