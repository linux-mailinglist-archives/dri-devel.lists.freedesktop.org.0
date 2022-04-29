Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9E514E2F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABBF10E840;
	Fri, 29 Apr 2022 14:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66B10E74A;
 Fri, 29 Apr 2022 14:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXWbOIpEmGoF65CPKk3lonyxX3PNkNNPrfKLM5pMN0lonmtmjBr1UxYxXtSfGv4J3NG6wy+Q8/Ltnu8VKHgG6aLHAP2GnMjlgEI1FjHnG/SyIhKTFaJepWEGD7yIqFzXpoh0Q0O0HaBmFIbILrvMlYK5/2Rq1P1Sb98XWwve3ss/7jVTVaskTGn0Va4vXa6irIGjBhTXi0+JrJDayIn0QHCo8HVYWDCnFLxUFWezNU5fp3CBygmHRxQwBUZZxbkVgZ4Nzkoni/MkQ/AhWVfSt9tlB5/hSunPCQkgiwuHl1EOjzJXHmpKphiQQo5T9UXithmXsZYGwR2aVJZSGk3zkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5s6cj9LB90EKes5mefqUk5NZn3GKgfp+Z3lhUcerzM=;
 b=ZyYW3vTjxjFMnl/AkUAaT3dylB/gczBpVZ4vzNSC0HkbzpOEbnqe3ZiRUX6g/0nP8MinJ2i9dB8GASyX/iqHfY2fkFeXnmYqZ8tSg+eFU5TjUhdeNdyknuuh3TpkxqZUYQgEXRvBxKHDG2WhgUBfygusfViutp0hVnWsVkAqJh17prIwJ52Y9qksgtC7/jzNaNfQDCu4fP/0q2VDg0xpNLlvPlQ6BZG01Pl2owCZjfNxW4FLfgfRq7h7REvQFsNI0W6uDg9t33Au6WuIrGm1esP5V5Ygy7UATaHqysF2pCfq3wsJtWeJTGG+DAZp0cevEquLdyQk8nYBkZka+XKing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5s6cj9LB90EKes5mefqUk5NZn3GKgfp+Z3lhUcerzM=;
 b=MlrAwqgWxrZ/Z8FJoKR0debWRsevQDuNoo7shF6saLPea+7TPNrCKEOaWPYFSaTimqqed6yhv1OpIa16rGMKnn++orjxtV3nD8MvvOYQoHMDoZilAUC7LD8xpMARFVModI29+E77HJXOB84a5/BKpjjoBJJt5RkpaRpnvcglGB0=
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by BYAPR12MB2807.namprd12.prod.outlook.com (2603:10b6:a03:6d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 14:49:09 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::df) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Fri, 29 Apr 2022 14:49:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 14:49:09 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 09:49:07 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.19
Date: Fri, 29 Apr 2022 10:48:53 -0400
Message-ID: <20220429144853.5742-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 098823fb-8fb0-4d30-8f30-08da29ef6ae0
X-MS-TrafficTypeDiagnostic: BYAPR12MB2807:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2807A98E3FB831050388BB67F7FC9@BYAPR12MB2807.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4waVPG9oE83n3hLJB5stdvngg2ZlYze2D6S9p7vlk45aFq+rjUlyPhBoITVRKypLWEW6fqq0bs903OD/ITOrMdRU1GpiF1qJtUyM9CIDTH0eVaP9Ga83ETPitJWXDpXeTpGMLhiUejb62DsxfPmvVDfW/Fc93xXeg3yCAQFUbvkx9JlNzowPVqXKT9aMczfk0P1vHVykB5orWceJvkkdqNn7th047UBrVWpTv/3ziMxNlazFUtgQX8f9qA+Jcm6BporM/vt9VnTWmmrF1ngf3rE09e5rcEXpWzmDVu6FaSiF8FGttHOgZObI6PTRKtB0+HKOwEh0ji7KBXd0hQqfzEg38AnuPBuFNHuyLrsPxQ7PG6NrD3VRWj7HiZ4poVgshnmE4ki7xV3zE8uTrUr4hziSEKUIaR30MV4gXOAGozG7gbTJ+srjdxBGqnDbBinKsgWk5Sx3kj09R8C9qzWowx6Q06KLoyQQIvT/RqwMQCdKkWDOfmYpVlZ3aiKPHMrKJJOYz5RN0Rtg7alPmayJIDhnrD1ArjjIGvfd9qBoOllE8uOYhgztdc8yiogo7TC2jKa0vWSxDQU1XLvoW96DQkG2lz35gHeYrKrlMedmZjYZYkyCVS/yeYGdUr0IgaQFJxDmJMGGN5/8u/2oTnOmtIrib6y61ijRJHs8sRZbsznOW4xHzk7dI7rpGwS3h8mRYVAFWTl62DEAfSBOZkghpA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(966005)(2616005)(1076003)(110136005)(508600001)(70586007)(186003)(16526019)(336012)(316002)(47076005)(66574015)(426003)(70206006)(8936002)(26005)(7696005)(6666004)(36756003)(30864003)(81166007)(86362001)(4326008)(2906002)(5660300002)(82310400005)(356005)(40460700003)(36860700001)(8676002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:49:09.1495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098823fb-8fb0-4d30-8f30-08da29ef6ae0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2807
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

More stuff for 5.19.

The following changes since commit e15c9d06e9ad70df41285ca41d535de6215e0b21:

  drm/amd/amdgpu: Update PF2VF header (2022-04-21 16:00:14 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.19-2022-04-29

for you to fetch changes up to 3da2c38231a4c62dafdbd762a199cfacaccd0533:

  drm/amdgpu: Free user pages if amdgpu_cs_parser_bos failed (2022-04-28 17:49:04 -0400)

----------------------------------------------------------------
amd-drm-next-5.19-2022-04-29:

amdgpu
- RAS updates
- SI dpm deadlock fix
- Misc code cleanups
- HDCP fixes
- PSR fixes
- DSC fixes
- SDMA doorbell cleanups
- S0ix fix
- DC FP fix
- Zen dom0 regression fix for APUs
- IP discovery updates
- Initial SoC21 support
- Support for new vbios tables
- Runtime PM fixes
- Add PSP TA debugfs interface

amdkfd:
- Misc code cleanups
- Ignore bogus MEC signals more efficiently
- SVM fixes
- Use bitmap helpers

radeon:
- Misc code cleanups
- Spelling/grammer fixes

----------------------------------------------------------------
Alex Deucher (11):
      drm/amdgpu/display: Make dcn31_set_low_power_state static
      drm/amdgpu: update latest IP discovery table structures
      drm/amdgpu/discovery: populate additional GC info
      drm/amdgpu/discovery: fix byteswapping in gc info parsing
      drm/amdgpu: store the mall size in the gmc structure
      drm/amdgpu/discovery: store the number of UMC IPs on the asic
      drm/amdgpu/discovery: handle UMC harvesting in IP discovery
      drm/amdgpu/discovery: add a function to get the mall_size
      drm/amdgpu/discovery: add additional validation
      drm/amdgpu/discovery: add a function to parse the vcn info table
      drm/amdgpu/discovery: move all table parsing into amdgpu_discovery.c

Aric Cyr (2):
      drm/amd/display: 3.2.182
      drm/amd/display: 3.2.183

Candice Li (1):
      drm/amdgpu: Fix build warning for TA debugfs interface

Christophe JAILLET (2):
      drm/amdkfd: Use bitmap_zalloc() when applicable
      drm/amdkfd: Use non-atomic bitmap functions when possible

Dan Carpenter (2):
      drm/amdgpu: debugfs: fix error codes in write functions
      drm/amdgpu: debugfs: fix NULL dereference in ta_if_invoke_debugfs_write()

David Yu (1):
      drm/amdgpu: Ta fw needs to be loaded for SRIOV aldebaran

David Zhang (2):
      drm/amd/display: read PSR-SU cap DPCD for specific panel
      drm/amd: add dc feature mask flags for PSR allow smu and multi-display optimizations

Dillon Varone (1):
      drm/amd/display: Remove unused integer

Dmytro Laktyushkin (1):
      drm/amd/display: update dcn315 clk table read

Evan Quan (2):
      drm/amd/pm: fix the deadlock issue observed on SI
      drm/amd/pm: fix the compile warning

Evgenii Krasnikov (1):
      drm/amd/display: Reset cached PSR parameters after hibernate

Felix Kuehling (1):
      drm/amdkfd: Ignore bogus signals from MEC efficiently

Gary Li (1):
      drm/amd/display: Maintain current link settings in link loss interrupt

Guchun Chen (1):
      drm/amdgpu: disable runtime pm on several sienna cichlid cards(v2)

Guo Zhengkui (1):
      drm/amd/display: fix if == else warning

Haohui Mai (3):
      drm/amdgpu/sdma: Fix incorrect calculations of the wptr of the doorbells
      drm/amdgpu/sdma: Remove redundant lower_32_bits() calls when settings SDMA doorbell
      drm/amdgpu: Fix out-of-bound access for gfx_v10_0_ring_test_ib()

Haowen Bai (1):
      drm/amdgpu: Remove useless kfree

Hawking Zhang (10):
      drm/amdgpu: add helper to execute atomfirmware asic_init
      drm/amdgpu: switch to atomfirmware_asic_init
      drm/amdgpu: add vram_info v3_0 structure
      drm/amdgpu: support query vram_info v3_0
      drm/amdgpu: add atom_gfx_info_v3_0 structure
      drm/amdgpu: update gc info from bios table
      drm/amdgpu: update query ref clk from bios
      drm/amdgpu: add mp v13_0_0 ip headers v7
      drm/amdgpu: add gc v11_0_0 ip headers v11
      drm/amdgpu: add nbio callback to query rom offset

Ilya Bakoulin (2):
      drm/amd/display: Add Audio readback registers
      drm/amd/display: Keep track of DSC packed PPS

Leo Ma (1):
      drm/amd/display: Remove ddc write and read size checking

Likun Gao (2):
      drm/amdgpu: increase HWIP MAX INSTANCE
      drm/amdgpu: add function to decode ip version

Marek Marczykowski-Górecki (1):
      drm/amdgpu: do not use passthrough mode in Xen dom0

Melissa Wen (1):
      drm/amd/display: protect remaining FPU-code calls on dcn3.1.x

Michael Strauss (1):
      drm/amd/display: Don't pass HostVM by default on DCN3.1

Mukul Joshi (2):
      drm/amdkfd: Fix updating IO links during device removal
      drm/amdkfd: Fix circular lock dependency warning

Mustapha Ghaddar (1):
      drm/amd/display: Fix HDCP QUERY Error for eDP and Tiled

Oliver Logush (1):
      drm/amd/display: Insert smu busy status before sending another request

Philip Yang (3):
      drm/amdkfd: Add SVM range mapped_to_gpu flag
      drm/amdkfd: Update mapping if range attributes changed
      drm/amdgpu: Free user pages if amdgpu_cs_parser_bos failed

Prike Liang (1):
      drm/amdgpu: keep mmhub clock gating being enabled during s2idle suspend

Randy Dunlap (1):
      drm/amd/display: fix non-kernel-doc comment warnings

Rongguang Wei (1):
      drm/amdgpu: fix typo

Stanley.Yang (2):
      drm/amdgpu: add new write field for soc21
      drm/amdgpu: add soc21 common ip block v2

Tao Zhou (3):
      drm/amdgpu: add RAS poison creation handler (v2)
      drm/amdgpu: add RAS poison consumption handler (v2)
      drm/amdgpu: add RAS fatal error interrupt handler

Tom Rix (2):
      drm/radeon: change cik_default_state table from global to static
      drm/radeon: change cac_weights_* to static

Yang Wang (1):
      drm/amdkfd: use kvcalloc() instead of kvmalloc() in kfd_migrate

Zhenneng Li (1):
      gpu/drm/radeon: Fix typo in comments

oushixiong (1):
      drm/amd: Fix spelling typo in comment

 drivers/gpu/drm/amd/amdgpu/Makefile                |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   371 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   291 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |     4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |     5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |    62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.h         |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   125 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    33 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |     3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    28 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     5 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    13 -
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |     8 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   620 +
 drivers/gpu/drm/amd/amdgpu/soc21.h                 |    30 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    30 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    33 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    15 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    66 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    17 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |     2 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |     2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   114 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |     6 -
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    15 +
 drivers/gpu/drm/amd/display/dc/dc.h                |    10 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     2 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |     1 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |     8 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |     2 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |     4 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    34 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |     9 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     4 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     4 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   145 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |     1 +
 .../drm/amd/display/include/ddc_service_types.h    |     2 +
 drivers/gpu/drm/amd/include/amd_shared.h           |     2 +
 .../amd/include/asic_reg/gc/gc_11_0_0_default.h    |  6114 +++
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h | 11670 ++++++
 .../amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h    | 41635 +++++++++++++++++++
 .../drm/amd/include/asic_reg/mp/mp_13_0_0_offset.h |   461 +
 .../amd/include/asic_reg/mp/mp_13_0_0_sh_mask.h    |   682 +
 drivers/gpu/drm/amd/include/atombios.h             |     2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |    80 +-
 drivers/gpu/drm/amd/include/discovery.h            |   114 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    39 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |    14 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |    10 -
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |    35 -
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    10 -
 drivers/gpu/drm/radeon/Makefile                    |     2 +-
 drivers/gpu/drm/radeon/atombios.h                  |     6 +-
 drivers/gpu/drm/radeon/cik_blit_shaders.c          |   246 -
 drivers/gpu/drm/radeon/cik_blit_shaders.h          |   219 +-
 drivers/gpu/drm/radeon/si_dpm.c                    |     4 +-
 86 files changed, 62821 insertions(+), 851 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc21.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc21.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_default.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_0_sh_mask.h
 delete mode 100644 drivers/gpu/drm/radeon/cik_blit_shaders.c
