Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718004D0826
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A77910E15F;
	Mon,  7 Mar 2022 20:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B023210E15F;
 Mon,  7 Mar 2022 20:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyRlNECiX7kSjjvUGwPHQjgRhBxKGl/D4Tv5SlOQdbk5He94/rsGKqdgP9KB4MeZazyKAXqGKZZd9UPEFGqsdGgxZGsMKBax0qR3FYBFiQkmjmo1PRo4qKOpJyACki9V0UTOcXyjhxlg0omzzgpC109/f+RVe9OTbPEANy5ej4BHr6ip/cXC2O/XGZkzIX/h5xCJ4NYwq7NJnaRjcXGhDeQHzxkAHNTJl+tAcpIiLXyn/cXBwvjEh9AOUsGPwJxrUIec4qFoQEJ7gPfhNhwo79lpSxCKNvgjWjy3CygGNYTPRZgzv0JXb6f8A5y+YzLnmrKkPyIGbsFN0RnhYC/jxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5f6GjSJImpLzzASidsVR6XcBPa/guj8wdFVu0OVR9s=;
 b=bwmp70W6OKH4CazbEzPmBtS9B/0omorIiK+yHnpJ36o1dGhwDosPrg5W1ioeOhyY885GIPgxcuxPVwhS9+ZYKMhcO5sryB7DzrqMSkAU06vSYOn5YRvfOiSgfPv5ioDnmwXCeW8pewCaNc0GJ+YEdZcP+sUNbOfHeB1g8+lnRD4EpfJzSdxxtM2vyQq5I6WnK65Rc0GOB46YBtqigCah4USdsP+cCPjLtPslXIYWSKGXAMDBrTLftUlUzUdfbI3ptpHiuEkjheHiLwazx5sD3DZZNX3oYmyY54zGvNCRUsclG3BrYbwgG0wxMwNWRYhVpomoHERvhUwthIDif5c6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5f6GjSJImpLzzASidsVR6XcBPa/guj8wdFVu0OVR9s=;
 b=jTK2rjG4VCER3v+91RvenA1F8m1Vgb37+pL3S580rLe/oTD8SopZr6SSRdz+zCz5sHUYVPTRrnYDtlUtaqfvCWt5CHFRYDM5XWWSndbRt15WTd9QolhXbBmY3HmmHutrlaUg3TPmHenOZ8MXqcUgAf0/P10CS2oMs0XgHBL422M=
Received: from MWHPR10CA0066.namprd10.prod.outlook.com (2603:10b6:300:2c::28)
 by BL0PR12MB4914.namprd12.prod.outlook.com (2603:10b6:208:1c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 20:08:30 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::9c) by MWHPR10CA0066.outlook.office365.com
 (2603:10b6:300:2c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Mon, 7 Mar 2022 20:08:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 20:08:29 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Mar
 2022 14:08:27 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.18
Date: Mon, 7 Mar 2022 15:08:13 -0500
Message-ID: <20220307200813.77378-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21d87e00-e8c3-43a2-d06d-08da00763f72
X-MS-TrafficTypeDiagnostic: BL0PR12MB4914:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB491469250F436F4C5613B868F7089@BL0PR12MB4914.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fKbJfgQ2LQ0vhYA9KB/w1ksboS2P2e2EoEivgx4GB8nwnvWCyomWtGHIvckylBVFM+1inlkRhUjAJJWJm8CH4xAxOP9/dAgi9aJlE7iazHZ4x4VIvOJxZa5BNvecZdmGpjoAxXPGkCdvDlmEWCI1EI5JkO5MUkw2FUXmozRfY5cSBVib6b8SnXYHbXamO7PGC5xZt0w1f/x2JD/rQn2JQN57s77YBmfAKP1j+lb8NqDj88sRrTij9/sSg041LRyP5BR9C2bxbISy+ta4IIWvf8nK0kaGBzNhr/L2CY3/HyHB6oj9OgWCbcBwW00O6zTApJR5jht7kIvDmRCAQNShaKtqsaZUeGFS+aUNuqGmT8ik+CS89/AzkqGcAiSQ1H2aqkSfgM9BCNmXv+hOj36tP6+UD8sT0FxLiTQUXPCFEckAH3l5xyMFtRgIb65Dqm7lDorrHcwkcDtvQh9i+InXu6WnBssZc5VF2ilnAHgnsRLEXDAJfML7dtIJ/j02pcMZ8vRFpSAFr9aP9TSZMCwz8FsHLkXpx6vqWHNLWsDvNV4C5EuJT8cXK+top7PhN/xzpSVLTXC/JEF6IY9roEgh3B7gjFu6ZVo4kf2UfW0hUYwNRhwqPwSWq3ntoh4W8ipWqQ0iJNdhMj+EUPrHDCUbwRr7NDI/gRHIehonG2aILw2y14qTSB1L3u6+/lLCW9Vuek4vw49dPxp59ryz9YGotuCBLkfsPEsViTF4NLrc9k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(70586007)(8936002)(81166007)(426003)(336012)(356005)(66574015)(40460700003)(316002)(5660300002)(82310400004)(26005)(508600001)(110136005)(4326008)(8676002)(1076003)(186003)(86362001)(16526019)(6666004)(966005)(36756003)(7696005)(47076005)(36860700001)(2906002)(83380400001)(2616005)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 20:08:29.5257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d87e00-e8c3-43a2-d06d-08da00763f72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4914
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

Same PR as last week, just fixed up a bad Fixes tag.

The following changes since commit 38a15ad9488e21cad8f42d3befca20f91e5b2874:

  Merge tag 'amd-drm-next-5.18-2022-02-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-01 16:19:02 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-03-07

for you to fetch changes up to 53b97af4a44abd21344cc9f13986ba53051287bb:

  drm/amdkfd: Add format attribute to kfd_smi_event_add (2022-03-07 14:59:59 -0500)

----------------------------------------------------------------
amd-drm-next-5.18-2022-03-07:

amdgpu:
- Misc code cleanups
- Misc display fixes
- PSR display fixes
- More RAS cleanup
- Hotplug fix
- Bump minor version for hotplug tests
- SR-IOV fixes
- GC 10.3.7 updates
- Remove some firmwares which are no longer used
- Mode2 reset refactor
- Aldebaran fixes
- Add VCN fwlog feature for VCN debugging
- CS code cleanup

amdkfd:
- SVM fixes
- SMI event fixes and cleanups
- vmid_pasid mapping fix for gfx10.3

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: Use IP versions in convert_tiling_flags_to_modifier()
      drm/amdgpu: remove unused gpu_info firmwares
      drm/amdgpu/gfx10: drop unused cyan skillfish firmware
      drm/amdgpu/sdma5: drop unused cyan skillfish firmware

Andrey Grodzovsky (2):
      drm/amdgpu: Fix sigsev when accessing MMIO on hot unplug.
      drm/amdgpu: Bump minor version for hot plug tests enabling.

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.106.0

Aric Cyr (1):
      drm/amd/display: 3.2.175

Charlene Liu (1):
      drm/amd/display: add verify_link_cap back for hdmi

Chris Park (1):
      drm/amd/display: Reset VIC if HDMI_VIC is present

Christian König (5):
      drm/amdgpu: install ctx entities with cmpxchg
      drm/amdgpu: header cleanup
      drm/amdgpu: use job and ib structures directly in CS parsers
      drm/amdgpu: properly embed the IBs into the job
      drm/amdgpu: initialize the vmid_wait with the stub fence

Danijel Slivka (1):
      drm/amd/pm: new v3 SmuMetrics data structure for Sienna Cichlid

David Yu (1):
      drm/amdgpu: Add DFC CAP support for aldebaran

Dillon Varone (2):
      drm/amd/display: Add frame alternate 3D & restrict HW packed on dongles
      drm/amd/display: Modify plane removal sequence to avoid hangs.

George Shen (1):
      drm/amd/display: Refactor fixed VS w/a for PHY tests

Hansen Dsouza (1):
      drm/amd/display: Remove invalid RDPCS Programming in DAL

Harish Kasiviswanathan (1):
      drm/amdgpu: Set correct DMA mask for aldebaran

Jingwen Chen (1):
      drm/amd/amdgpu: set disabled vcn to no_schduler

Lijo Lazar (1):
      drm/amdgpu: Refactor mode2 reset logic for v13.0.2

Luben Tuikov (1):
      drm/amd/display: Don't fill up the logs

Meng Tang (1):
      gpu/amd: vega10_hwmgr: fix inappropriate private variable name

Michael Strauss (1):
      drm/amd/display: Pass HostVM enable flag into DCN3.1 DML

Nicholas Kazlauskas (1):
      drm/amd/display: Make functional resource functions non-static

Philip Yang (4):
      Revert "drm/amdkfd: process_info lock not needed for svm"
      drm/amdkfd: Correct SMI event read size
      drm/amdkfd: Add SMI add event helper
      drm/amdkfd: Add format attribute to kfd_smi_event_add

Prike Liang (4):
      drm/amdgpu: enable gfx clock gating control for GC 10.3.7
      drm/amdgpu/nv: enable clock gating for GC 10.3.7 subblock
      drm/amdgpu: enable gfx power gating for GC 10.3.7
      drm/amdgpu: enable gfxoff routine for GC 10.3.7

Qiang Yu (1):
      drm/amdgpu: fix suspend/resume hang regression

Robin Chen (1):
      drm/amd/display: Pass deep sleep disabled allow info to dmub fw

Ruijing Dong (2):
      drm/amdgpu/vcn: Update fw shared data structure
      drm/amdgpu/vcn: Add vcn firmware log

Shah Dharati (1):
      drm/amd/display: Adding a dc_debug option and dmub setting to use PHY FSM for PSR

Tom Rix (1):
      drm/amdgpu: Fix realloc of ptr

Weiguo Li (1):
      drm/amdgpu: remove redundant null check

Wesley Chalmers (1):
      drm/amd/display: Program OPP before ODM

Yifan Zha (1):
      drm/amdgpu: Move CAP firmware loading to the beginning of PSP firmware list

Yifan Zhang (4):
      drm/amdgpu: move amdgpu_gmc_noretry_set after ip_versions populated
      drm/amdgpu: convert code name to ip version for noretry set
      drm/amdkfd: judge get_atc_vmid_pasid_mapping_info before call
      drm/amdkfd: implement get_atc_vmid_pasid_mapping_info for gfx10.3

jinzh (1):
      drm/amd/display: refine the EDID override

yipechai (12):
      drm/amdgpu: Modify .ras_fini function pointer parameter
      drm/amdgpu: Optimize xxx_ras_fini function of each ras block
      drm/amdgpu: centrally calls the .ras_fini function of all ras blocks
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in gfx ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in mmhub ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in nbio ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in umc ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in xgmi ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in hdp ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in sdma ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in mca ras block
      drm/amdgpu: Remove redundant .ras_fini initialization in some ras blocks

 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |  66 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  98 +----------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |  80 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  24 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  25 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  21 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  28 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  58 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  37 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            | 117 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 134 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  30 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   8 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   7 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   4 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  15 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |  18 --
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  15 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   8 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 -
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   7 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  22 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  21 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  51 +++---
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  74 +++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   9 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  14 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  49 +++---
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  21 +--
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   9 -
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |   5 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   3 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  68 ++++----
 .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |  58 +++++++
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 181 ++++++++++++++-------
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   1 +
 include/uapi/linux/kfd_ioctl.h                     |   1 +
 84 files changed, 991 insertions(+), 679 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
