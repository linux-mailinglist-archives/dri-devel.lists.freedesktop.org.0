Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629682E3FC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 00:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE0710E3B5;
	Mon, 15 Jan 2024 23:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5576610E3B5;
 Mon, 15 Jan 2024 23:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB1YHBBDTGjJpMQuHx+9fqy0U/qr5dTlP3CQCx0p9WeOQy4TIlIkXlW5hY2eAs2n+3e1KikIPGH3DM4h0lCzKaz8j5mwhSK/oOnkywrFnnQUfmQI5ie+Pg8NmG7U7amAF8m7ngwIoquTMUZ/Wnme/VUUf5TfznLpsBCpw4ZdEtPnl+IHLozppgyJvnEyroIwxlwzb3UQJ+T1quA9g2JTwc8elQZ4ySFmCEYZ9PcNz96aApmcm3xvPCnPJQZuress2qYZtQhy6Zy6De7S4Ovdz/cCx408u/UtYW2ite305qqYGADq8au7SO4Por/Wwz3UX+VJnSOF1wYxZBZ68tXvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NZjO3f6ID2iFeeagQ6z8R3jApU1BT8oESNw3oRZMQc=;
 b=gNoFz8MQ9AfuAY/0B+837DlEZbuLlVOpWRjqj7Pw99OzAMG/C9iUHfnD6f42PZnfKo9pyT22bUG3jEa+mu2xNxQIbqXO2kHVM9LPlBLgIQRPBoHhVx7vUY4sCVzUtFP/1igzFp3lg27qoOGDOAwPtEXG8Y6YNQAoMk4fp0bV63nyp23N70S8c4LNZsdRJeOyDrGDe/fiNkE5eVeYLw7kHUBjNn0geEWRq3v4pixMn74OjUtv1i4QJwapK/dy335xQIVnlCePSrqH5hy8WfglkIkXGyfjgtAErTzy+aqoFyo8eV106FIf3wcmplzGANyN558pEiKGCcqIvhV43Xqsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NZjO3f6ID2iFeeagQ6z8R3jApU1BT8oESNw3oRZMQc=;
 b=PbdMW5tq1hhraD7ld/5oQyquC3kp1ok44pPsJKDdIC1hIICkeAwXRwYf1VO8ujd+/U349LH4riGQyXE5daDlxO2gHGXsAMiIzkWemlSkq4lgwtxnShuPFtAJBksKM7EtRaFrUgaBtW19JCEhDUBdpkmKwO7bMgkjGNkXy8zOEcg=
Received: from SA9PR13CA0033.namprd13.prod.outlook.com (2603:10b6:806:22::8)
 by IA1PR12MB8406.namprd12.prod.outlook.com (2603:10b6:208:3da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Mon, 15 Jan
 2024 23:43:42 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::65) by SA9PR13CA0033.outlook.office365.com
 (2603:10b6:806:22::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.12 via Frontend
 Transport; Mon, 15 Jan 2024 23:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 23:43:42 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 17:43:41 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.8
Date: Mon, 15 Jan 2024 18:43:21 -0500
Message-ID: <20240115234321.2206842-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|IA1PR12MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 076dc334-0a6d-466b-9bf2-08dc1623ce58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0JMdWGsvvGpXFU8aGJKyyJ1Zcmf5mVp2+Q4NC6VzkXldUNnUNSbR1SkC94H9wVEc7/bbCPFZiBBmd0xptaJFE0CWHt8le4Fv5yEzS2y6hUTd5xNgXDrJyn3zi8ZyN057paZaMQ44L8G51hHmhWxGh+++onJztjSVchaj7phBpAqODhxFzmg6pKGVLNfvMcFN3waihs41pPEjIRu+A/PHZbkXpxkW1gs2Eln6wewzkcix+74P3VtQ/xVHA+dJyOxSpx+OlHPM0Jlk23Dpfktzavn8cimgrVyNFQ7Z02AVkDHgLl1ofYlAk+aCtsDiNr3q7C1Lvo1+ppDk3M8R7rGyvN0Jbtlf3wnQ/hO/Bb0/R/4paccVlMtxXYCKz5eMfIErvCJzcAmnLVXWnaS2E+QdlWWI0+KJxbRb5wNLqL7lENiU8rYNdJu/5eUEUWTegNhJz3fi0ipJC9qqu7go3XpXa0eT8o1ZXyK6TktCV1XAK7A7pijy4Hl/lJCQPfbbc3sOrH/+Lo9Pwk91pSslDmewS+u0HhB/9aGGKhq5Rbwhv2uYXfyWlWf+yIY2exEoFXKpvkitCqY67B0wo6XUZXXiZEpam8I+nrwwtq3fAP8UUJy14/r6ASEGtEsiw+Q5YqhB7S3qFvD7vUWSCECJIWX/6f6U+j0wCat5nYGHJmRlvNXcDechDJAV5BDZJZxer5HO1PDJxmabx+NpPY/KzCYp3lGZtif/4klsCNe+8wdjdIGF8T7Xvaa2Ss+/zVLr/sKC12FGHTTpQaH5BImlM3ffpmGZLPz/C4UejqgxoFjjQkBjbxMTVNNixRj+mPoTUTnv1v8ypDmWFQRmuCi4bPhqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(46966006)(40470700004)(36840700001)(5660300002)(70206006)(40480700001)(8936002)(40460700003)(8676002)(4326008)(2906002)(316002)(70586007)(110136005)(7696005)(6666004)(966005)(478600001)(36860700001)(47076005)(83380400001)(81166007)(16526019)(36756003)(2616005)(336012)(426003)(1076003)(41300700001)(86362001)(82740400003)(356005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 23:43:42.0722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 076dc334-0a6d-466b-9bf2-08dc1623ce58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8406
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

Fixes for 6.8.  Same PR as Friday, but with new clang warning fixed and
dropped KFD changes at Felix' request.

The following changes since commit e54478fbdad20f2c58d0a4f99d01299ed8e7fe9c:

  Merge tag 'amd-drm-next-6.8-2024-01-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-01-09 09:07:50 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-01-15-1

for you to fetch changes up to d7643fe6fb76edb1f2f1497bf5e8b8f4774b5129:

  drm/amd/display: Avoid enum conversion warning (2024-01-15 18:35:07 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-01-15-1:

amdgpu:
- SubVP fixes
- VRR fixes
- USB4 fixes
- DCN 3.5 fixes
- GFX11 harvesting fix
- RAS fixes
- Misc small fixes
- KFD dma-buf import fixes
- Power reporting fixes
- ATHUB 3.3 fix
- SR-IOV fix
- Add missing fw release for fiji
- GFX 11.5 fix
- Debugging module parameter fix
- SMU 13.0.6 fixes
- Fix new clang warning

amdkfd:
- Fix lockdep warnings
- Fix sparse __rcu warnings
- HMM fix
- SVM fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: fix avg vs input power reporting on smu7
      drm/amdgpu: fall back to INPUT power for AVG power via INFO IOCTL
      drm/amdgpu/pm: clarify debugfs pm output
      drm/amdgpu: drop exp hw support check for GC 9.4.3

Aric Cyr (1):
      drm/amd/display: 3.2.266

Candice Li (2):
      drm/amdgpu: Drop unnecessary sentences about CE and deferred error.
      drm/amdgpu: Support poison error injection via ras_ctrl debugfs

Charlene Liu (1):
      drm/amd/display: Update z8 latency

Dafna Hirschfeld (1):
      drm/amdkfd: fixes for HMM mem allocation

Daniel Miess (1):
      Revert "drm/amd/display: Fix conversions between bytes and KB"

Felix Kuehling (2):
      drm/amdkfd: Fix lock dependency warning
      drm/amdkfd: Fix sparse __rcu annotation warnings

George Shen (1):
      drm/amd/display: Disconnect phantom pipe OPP from OPTC being disabled

Hawking Zhang (1):
      drm/amdgpu: Packed socket_id to ras feature mask

Ivan Lipski (1):
      Revert "drm/amd/display: fix bandwidth validation failure on DCN 2.1"

James Zhu (1):
      drm/amdgpu: make a correction on comment

Le Ma (3):
      Revert "drm/amdgpu: add param to specify fw bo location for front-door loading"
      drm/amdgpu: add debug flag to place fw bo on vram for frontdoor loading
      drm/amdgpu: move debug options init prior to amdgpu device init

Lijo Lazar (2):
      drm/amd/pm: Add error log for smu v13.0.6 reset
      drm/amd/pm: Fix smuv13.0.6 current clock reporting

Likun Gao (1):
      drm/amdgpu: correct the cu count for gfx v11

Martin Leung (2):
      drm/amd/display: revert "for FPO & SubVP/DRR config program vmin/max"
      drm/amd/display: revert "Optimize VRR updates to only necessary ones"

Martin Tsai (1):
      drm/amd/display: To adjust dprefclk by down spread percentage

Meenakshikumar Somasundaram (1):
      drm/amd/display: Dpia hpd status not in sync after S4

Melissa Wen (1):
      drm/amd/display: cleanup inconsistent indenting in amdgpu_dm_color

Nathan Chancellor (1):
      drm/amd/display: Avoid enum conversion warning

Peichen Huang (1):
      drm/amd/display: Request usb4 bw for mst streams

Philip Yang (1):
      drm/amdkfd: Fix lock dependency warning with srcu

Srinivasan Shanmugam (6):
      drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
      drm/amdgpu: Fix with right return code '-EIO' in 'amdgpu_gmc_vram_checking()'
      drm/amdgpu: Fix unsigned comparison with less than zero in vpe_u1_8_from_fraction()
      drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
      drm/amd/display: Fix variable deferencing before NULL check in edp_setup_replay()
      drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'

Victor Lu (1):
      drm/amdgpu: Do not program VM_L2_CNTL under SRIOV

Yifan Zhang (3):
      drm/amdgpu: update headers for nbio v7.11
      drm/amdgpu: update ATHUB_MISC_CNTL offset for athub v3.3
      drm/amdgpu: update regGL2C_CTRL4 value in golden setting

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 15 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 21 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 26 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            | 10 +--
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |  8 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           | 10 +--
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  7 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 42 ++++++-------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 71 +++++++++++++++++++++-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h | 11 ++++
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 14 +++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 14 -----
 drivers/gpu/drm/amd/display/dc/dc.h                |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          | 12 ++--
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |  2 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  9 ++-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 14 +++++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 11 ++--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  6 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 18 +++---
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 45 ++------------
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |  3 -
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 42 ++++++++++---
 .../gpu/drm/amd/display/dc/link/link_validation.c  | 60 ++++++++++++++----
 .../amd/display/dc/link/protocols/link_dp_dpia.c   | 36 ++++++-----
 .../display/dc/link/protocols/link_dp_dpia_bw.c    | 60 +++++++++++++-----
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |  9 +++
 .../dc/link/protocols/link_edp_panel_control.c     | 11 ++--
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c | 19 ++++--
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 12 ++--
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |  3 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |  2 +-
 drivers/gpu/drm/amd/display/include/audio_types.h  |  2 +-
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |  8 +--
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 28 ++++++---
 .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |  2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 17 +++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 15 +++--
 60 files changed, 492 insertions(+), 265 deletions(-)
