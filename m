Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542565DA16
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F46E10E058;
	Wed,  4 Jan 2023 16:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA4F10E058;
 Wed,  4 Jan 2023 16:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7HnRoHLHlHjIuTamPrxNMbKji06o5QTNi3IGPqrTiWWlhokDXzL+wbE9Xo8ibB0COEvtew8wfM6HRkY/imV0nD6dqI99Kkhn3LXseAPIoqyZn/b+QUfAnl3bxO8I6PDd2CZHVRxqWSBugO6UVtgdOfTBU9mkAFd16FpBRzoMlmB7/UFgY6i/MWqP8pRc7rvDkp6c3TCbaj1vl69FSiA5ayfY35WgrO+cSPnWg2ERuM7Ii9M9CatO3vpyn3POsHJ2+x4QqJDRfmT29PEddvoBK77D+7iwLLr3cHuQa5R2qffxVn2996s9OWHZJEGGnGsRy/zcucNz1v5EBt3ssto+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9ZtlSJ2RDl4RaZPuyDSnQ8cLW4qaEDtGGUikYmvbhc=;
 b=OYGpEMZKdm4IGfReol84evmG9awU9ZQUv/GfuE5njzWC8cFcXr5Il85sJYSSg26B99UJjmUAM7RTslCWrupkYpyoCMx+0FVj4vT1wcC/PWoUyglx+ma4BtTmZoUNlPmW5onrR7NiXxTwTp05ASmL9OMSilTYNuPB6Cv8GeTUfwIHEki1pRhI2qlODOmiK5T5k3YgexjI+6+pJZSDfP6XD2/n/TM8fPSFtMtiX93p8KzP5XAerGrFkwIEZaMDzlPPGxYo0iUhvU51Bw+GbmjhpQPkRw1bvgSclEV4xkFrnv1Q9u2h/cOdzqYp2GCP0gogGt/+138LX721S86EETnIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9ZtlSJ2RDl4RaZPuyDSnQ8cLW4qaEDtGGUikYmvbhc=;
 b=M+6V87bEl6VJyZ3SfpM7LBfMRU0c1dIDvpbjKRJdaxYex2AP5IoPztXA+xQDNh63Ah8juRPDsl/eDovvtUfRfdxrg9zwcCK2WeGbNEhYfyP3MbpfJRCP6W6Dby4Xu3d1RyhkeZfeV3j5aBoatpiqB7lcjxUHtLyNUfBB9su6His=
Received: from DS7PR03CA0314.namprd03.prod.outlook.com (2603:10b6:8:2b::26) by
 PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:41:49 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::3e) by DS7PR03CA0314.outlook.office365.com
 (2603:10b6:8:2b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:48 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:43 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v5 00/45] Recover from failure to probe GPU
Date: Wed, 4 Jan 2023 10:39:49 -0600
Message-ID: <20230104164042.30271-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|PH7PR12MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 424e506a-59de-47c4-2939-08daee72931f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMqKpPoN4otKvPz5OP/+wKVa516QUXpZTOW2H2+YuqiUe8mww3zhdLdbZBPlbTYHZOXybDxczdYPPsDT2Hy5NcKT2sNU5HQwWoXu5j/VgtUOp6fHVg3XQZNkifhOXX8kofmCf3PxcNC5ZEyeg2It1xTFWITgKqfLtUoBL3j5z9o79Xig+29CEkZRJVJID5HWBsH2AF1Br0UciAGN8H/xwxAojRoT19AKlnoW+eGCjXvHCbOtemSty5XUedsZqEF0rskBpMshMDNronwtUPXtZF3kFCAqA/t+3hj790JJwuJCoBn9cKi4T7KSYk+G2k1ad08UKhjvCO8/VBYmZTYeB0Yx4uBOKITZ3Tnt/ftOfzjfGQdoW+377JOSe3g/NW9/XClrrbh04mf6JW6L2o8YADqcmZN2hJGFKLVctDP//886Bk98TyNMJ7ucLPliXVVyEByi65D9OW83R2u8ll7pKYcxLSDO/AO2YaeUEralRwcQcl3zATMWaFu9Ao3VGfFlI2lXpm8eL5kL7eU7FOBeePHmddhoo0YEmzLmXUZHo4tZDDAJCwn3TCUJb4EPmGnaMAn9+FGzQS2m+fkrzt7vBigRuArWS9vuDgaA0dG6HeB61GBdf5qMSDXzFF0HQCeGiuXFi9744ACOngsaX2oHlCvrxZcoUN/PMjl2uo9ZwHsUN0mgzNoO9Joe44YVhGtcxgQtv8nw074NhxjWYF/j+qUsS2MX0KPcxXgybzCeyqQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(54906003)(26005)(186003)(478600001)(1076003)(70206006)(2616005)(16526019)(4326008)(83380400001)(336012)(426003)(8936002)(8676002)(5660300002)(44832011)(47076005)(6862004)(41300700001)(2906002)(316002)(70586007)(36860700001)(37006003)(82740400003)(40480700001)(356005)(81166007)(40460700003)(86362001)(6636002)(7696005)(36756003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:48.7384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 424e506a-59de-47c4-2939-08daee72931f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One of the first thing that KMS drivers do during initialization is
destroy the system firmware framebuffer by means of
`drm_aperture_remove_conflicting_pci_framebuffers`

This means that if for any reason the GPU failed to probe the user
will be stuck with at best a screen frozen at the last thing that
was shown before the KMS driver continued it's probe.

The problem is most pronounced when new GPU support is introduced
because users will need to have a recent linux-firmware snapshot
on their system when they boot a kernel with matching support.

However the problem is further exaggerated in the case of amdgpu because
it has migrated to "IP discovery" where amdgpu will attempt to load
on "ALL" AMD GPUs even if the driver is missing support for IP blocks
contained in that GPU.

IP discovery requires some probing and isn't run until after the
framebuffer has been destroyed.

This means a situation can occur where a user purchases a new GPU not
yet supported by a distribution and when booting the installer it will
"freeze" even if the distribution doesn't have the matching kernel support
for those IP blocks.

The perfect example of this is Ubuntu 22.10 and the new dGPUs just
launched by AMD.  The installation media ships with kernel 5.19 (which
has IP discovery) but the amdgpu support for those IP blocks landed in
kernel 6.0. The matching linux-firmware was released after 22.10's launch.
The screen will freeze without nomodeset. Even if a user manages to install
and then upgrades to kernel 6.0 after install they'll still have the
problem of missing firmware, and the same experience.

This is quite jarring for users, particularly if they don't know
that they have to use "nomodeset" to install.

To help the situation make changes to GPU discovery:
1) Delay releasing the firmware framebuffer until after early_init
completed.  This will help the situation of an older kernel that doesn't
yet support the IP blocks probing a new GPU. IP discovery will have failed.
2) Request loading all PSP, VCN, SDMA, SMU, DMCUB, MES and GC microcode
into memory during early_init. This will help the situation of new enough
kernel for the IP discovery phase to otherwise pass but missing microcode
from linux-firmware.git.

v4->v5:
 * Rename amdgpu_ucode_load to amdgpu_ucode_request
 * Add and utilize amdgpu_ucode_release throughout existing patches
 * Update all amdgpu code to stop using request_firmware and
   release_firmware for microcode
 * Drop export of amdgpu_ucode_validate outside of amdgpu_ucode.c
 * Pick up relevant tags for some patches
v3->v4:
 * Rework to delay framebuffer release until early_init is done
 * Make IP load microcode during early init phase
 * Add SMU and DMCUB checks for early_init loading
 * Add some new helper code for wrapping request_firmware calls (needed for
   early_init to return something besides -ENOENT)
v2->v3:
 * Pick up tags for patches 1-10
 * Rework patch 11 to not validate during discovery
 * Fix bugs with GFX9 due to gfx.num_gfx_rings not being set during
   discovery
 * Fix naming scheme for SDMA on dGPUs
v1->v2:
 * Take the suggestion from v1 thread to delay the framebuffer release
   until ip discovery is done. This patch is CC to stable to that older
   stable kernels with IP discovery won't try to probe unknown IP.
 * Drop changes to drm aperature.
 * Fetch SDMA, VCN, MES, GC and PSP microcode during IP discovery.

Mario Limonciello (27):
  drm/amd: Delay removal of the firmware framebuffer
  drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
  drm/amd: Convert SMUv11 microcode to use
    `amdgpu_ucode_ip_version_decode`
  drm/amd: Convert SMUv13 microcode to use
    `amdgpu_ucode_ip_version_decode`
  drm/amd: Add a new helper for loading/validating microcode
  drm/amd: Use `amdgpu_ucode_request` helper for SDMA
  drm/amd: Convert SDMA to use `amdgpu_ucode_ip_version_decode`
  drm/amd: Make SDMA firmware load failures less noisy.
  drm/amd: Use `amdgpu_ucode_*` helpers for VCN
  drm/amd: Load VCN microcode during early_init
  drm/amd: Load MES microcode during early_init
  drm/amd: Use `amdgpu_ucode_*` helpers for MES
  drm/amd: Remove superfluous assignment for `adev->mes.adev`
  drm/amd: Use `amdgpu_ucode_*` helpers for GFX9
  drm/amd: Load GFX9 microcode during early_init
  drm/amd: Use `amdgpu_ucode_*` helpers for GFX10
  drm/amd: Load GFX10 microcode during early_init
  drm/amd: Use `amdgpu_ucode_*` helpers for GFX11
  drm/amd: Load GFX11 microcode during early_init
  drm/amd: Parse both v1 and v2 TA microcode headers using same function
  drm/amd: Avoid BUG() for case of SRIOV missing IP version
  drm/amd: Load PSP microcode during early_init
  drm/amd: Use `amdgpu_ucode_*` helpers for PSP
  drm/amd/display: Load DMUB microcode during early_init
  drm/amd: Use `amdgpu_ucode_release` helper for DMUB
  drm/amd: Use `amdgpu_ucode_*` helpers for SMU
  drm/amd: Load SMU microcode during early_init
  drm/amd: Optimize SRIOV switch/case for PSP microcode load
  drm/amd: Use `amdgpu_ucode_*` helpers for GFX6
  drm/amd: Use `amdgpu_ucode_*` helpers for GFX7
  drm/amd: Use `amdgpu_ucode_*` helpers for GFX8
  drm/amd: Use `amdgpu_ucode_*` helpers for GMC6
  drm/amd: Use `amdgpu_ucode_*` helpers for GMC7
  drm/amd: Use `amdgpu_ucode_*` helpers for GMC8
  drm/amd: Use `amdgpu_ucode_*` helpers for SDMA2.4
  drm/amd: Use `amdgpu_ucode_*` helpers for SDMA3.0
  drm/amd: Use `amdgpu_ucode_*` helpers for SDMA on CIK
  drm/amd: Use `amdgpu_ucode_*` helpers for UVD
  drm/amd: Use `amdgpu_ucode_*` helpers for VCE
  drm/amd: Use `amdgpu_ucode_*` helpers for CGS
  drm/amd: Use `amdgpu_ucode_*` helpers for GPU info bin
  drm/amd: Use `amdgpu_ucode_*` helpers for DMCU
  drm/amd: Use `amdgpu_ucode_release` helper for powerplay
  drm/amd: Use `amdgpu_ucode_release` helper for si
  drm/amd: make amdgpu_ucode_validate static

 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c       |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  59 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 296 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 259 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 103 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h       |   1 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 155 +++------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        | 124 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c         |  30 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         |  68 +---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c         |  94 ++----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 140 ++-------
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |  13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  13 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c        |   7 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 108 ++-----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  99 ++----
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        |  80 +----
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 129 +-------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |  75 +----
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  27 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  14 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  47 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  30 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  55 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c         |   5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 110 ++++---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    |  11 +-
 .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  12 +-
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  51 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  28 +-
 50 files changed, 913 insertions(+), 1561 deletions(-)

-- 
2.34.1

