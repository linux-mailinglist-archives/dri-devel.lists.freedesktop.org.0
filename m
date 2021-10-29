Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4D440239
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 20:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00D06E105;
	Fri, 29 Oct 2021 18:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F586E105;
 Fri, 29 Oct 2021 18:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR/vr0U7vdQCEFypOdXuB6MhPfnD72g2yuzL1toziF26rGuMGuzEgDP5bFVAR5cVQeRv7fCkSk/d/AkZGaBuia1xAAoPXfA90mYlrF/snV56x1A0RiBMr0Iv9rBBxqXVr0IeURrrqQb6yhebCaHOWWUKxn/tkNUCAyOvdkyFrBlVjmHGxjhr/ZZG5bH6Q+kf+9J1JviP2YhGle7Oyc5/9QNtMhkGZlZWk6q7s86hidH6LAr12WdaqMTW4pjO5Zo2JCT0R+wlyF64j9m1NDG4VfZr5dPSdnmTgHkfOvEdvLk+GWtADdtGvjGNfH9d0lpR2LZlg8iD6unBNSKxtM6RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgWvJZ+q6zrtwaTnKZSY27+weL/cy6mIzwOLzQTZlb4=;
 b=UbK1wLdOKyTBHim4Le/O7aOjQ0RNC/J8/kuj3hwoipFT5Ds1obb69c0W8PsTy8+UVVD7WYbMbjXAi9S4K2Q3oETH+sEMGzWRnzkOFifyEySwEJzZ+15fnGSSz6NL7htbu1GV4cHqdxGEAHhlR44TGUKrTfHDGphTZvpAUWZxo16JkwVxebPVzdj9KEupsvadhjFTVCoKvD/4qnjINeyPdjO9ZLy4j2/Pp9t47xc5i4N6M5xUOodoWDcJ62Zx1jOct2r0aV5cq8EQ7dypD1NVmPCbLTzBNaeuHheU/qZGMANRINtugV6VYiLHkYhtooTN9mdlE0so4t85+aL38/vC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgWvJZ+q6zrtwaTnKZSY27+weL/cy6mIzwOLzQTZlb4=;
 b=jtYCL3RC2sfrAcfrA/jJ6yDDXPLlsetGyGETyLoDRbGGqqnNJTPLllqAdqrWI++RwDugDD9VrFxDXXIFW6do4NEoNKGHq3wMPqFOxu4B07Ky5iuS2rkagXOYizN+336nmE62WQim8tGm6WgNFGjR9LtRuSORRY7g3HAnLvfO950=
Received: from BN8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:408:ac::35)
 by SN6PR12MB4719.namprd12.prod.outlook.com (2603:10b6:805:e9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 18:43:53 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::ba) by BN8PR07CA0022.outlook.office365.com
 (2603:10b6:408:ac::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 18:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 18:43:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 13:43:51 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-5.16
Date: Fri, 29 Oct 2021 14:43:38 -0400
Message-ID: <20211029184338.4863-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6abfa0-013c-4040-80ef-08d99b0c0e37
X-MS-TrafficTypeDiagnostic: SN6PR12MB4719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB471941789701832F38C7BC00F7879@SN6PR12MB4719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBYpu21SCPpdDj2+3QfB0puR4yGEAbx5gPXk6pH/V1QRu6f1sxG/L+4tXB4pBeIh7EcwO2nhR+6aOmjWNg8FBsVMgul2vl7+qajaUo21ba4W4RIFKcu43CXN4ALPhZ9//SuWmVTSRKXIcdEgZSHw0JJEpKXNOoGjIfHeqWJn6CWY2boYz5XsrbOEuMZw+LYpeNpOVm+6LL7Sz+8f7dVuSQ4gj5lY8IbQORM7v0HQX1HryXBQsp/FbBvWdP7Pk1xcphfKwmRhQbxX0FAQ+CrCmvFJd4ntN0wWFnELDujXuZI6VzpDRhU0OfM/0VXamqipYdJKdk3pvTsBlwEDPkggjpW3FrMwE6psJEc26U8py++xPAkdutzKx4KUy2TZ0H4nxtCs/S3iVUv6Q/thZvalnsxT9fOCLGC+wAHUMifIPf5RbNdjdcNcUa5/Jz667pn83kvtMUJGrs1jNsI8RDNSkVXx6WC5ampHd00Lz+jrLolq3zVg5Px0Xvv+t7qYnkZaOxtlZjKmTZ3uYEA1tzAaW7o//U30zHmqbsA4d70ZtQLvOcn5x0pSFLyb2jP82hvMPkRlK46JW2o952lVK4Q0TLpVYs55RfbPx+KrlPCXJmNJ2Q1IGBfRGn8XZb0J6fjOJ7PF1UggJ59XeXLj4Jt3i2ACuOFNvj3hFVmgguwGvKBjSqOUQcUMmEm6IQtoyqIz9DfOOrAIuVJebZKveKMaUag5oBeQ75xzzfqKfwrMS18=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(2906002)(356005)(4326008)(508600001)(6666004)(5660300002)(36756003)(426003)(186003)(16526019)(36860700001)(2616005)(47076005)(336012)(70586007)(81166007)(4001150100001)(26005)(8936002)(83380400001)(70206006)(110136005)(8676002)(82310400003)(316002)(1076003)(7696005)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 18:43:52.9647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6abfa0-013c-4040-80ef-08d99b0c0e37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4719
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

Fixes for 5.16.

The following changes since commit 31fa8cbce4664946a1688898410fee41ad05364d:

  drm: Add R10 and R12 FourCC (2021-10-28 17:20:45 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.16-2021-10-29

for you to fetch changes up to 403475be6d8b122c3e6b8a47e075926d7299e5ef:

  drm/amdgpu/gmc6: fix DMA mask from 44 to 40 bits (2021-10-28 14:27:00 -0400)

----------------------------------------------------------------
amd-drm-next-5.16-2021-10-29:

amdgpu:
- RAS fixes
- Fix a potential memory leak in device tear down
- Add a stutter mode quirk
- Misc display fixes
- Further display FP refactoring
- Display USB4 fixes
- Display DP2.0 fixes
- DCN 3.1 fixes
- Display 8 ch audio fix
- Fix DMA mask regression for SI parts
- Aldebaran fixes

amdkfd:
- userptr fix
- BO lifetime fix
- Misc code cleanup

UAPI:
- Minor header cleanup (no functional change)

----------------------------------------------------------------
Ahmad Othman (2):
      drm/amd/display: Add support for USB4 on C20 PHY for DCN3.1
      drm/amd/display: fix a crash on USB4 over C20 PHY

Alex Deucher (6):
      drm/amdgpu/display: add quirk handling for stutter mode
      drm/amdgpu/pm: look up current_level for asics without pm callback
      drm/amdgpu/UAPI: rearrange header to better align related items
      drm/amdgpu/discovery: add UVD/VCN IP instance info for soc15 parts
      drm/amdgpu/discovery: add SDMA IP instance info for soc15 parts
      drm/amdgpu/gmc6: fix DMA mask from 44 to 40 bits

Anson Jacob (2):
      drm/amd/display: dcn20_resource_construct reduce scope of FPU enabled
      drm/amd/display: Remove unused macros

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.89
      drm/amd/display: [FW Promotion] Release 0.0.90

Aric Cyr (4):
      drm/amd/display: Handle I2C-over-AUX write channel status update
      drm/amd/display: 3.2.158
      drm/amd/display: Fix 3DLUT skipped programming
      drm/amd/display: 3.2.159

Candice Li (1):
      drm/amdgpu: Update TA version output in driver

Dmytro Laktyushkin (3):
      drm/amd/display: clean up dcn31 revision check
      drm/amd/display: restyle dcn31 resource header inline with other asics
      drm/amd/display: allow windowed mpo + odm

George Shen (2):
      drm/amd/display: Implement fixed DP drive settings
      drm/amd/display: Add comment for preferred_training_settings

Guo, Bing (2):
      drm/amd/display: Get ceiling for v_total calc
      drm/amd/display: set Layout properly for 8ch audio at timing validation

Hansen (1):
      drm/amd/display: Set phy_mux_sel bit in dmub scratch register

Jimmy Kizito (1):
      drm/amd/display: Add workaround flag for EDID read on certain docks

Jude Shih (2):
      drm/amd/display: Fix USB4 hot plug crash issue
      drm/amd/display: Enable dpia in dmub only for DCN31 B0

Kent Russell (2):
      drm/amdgpu: Warn when bad pages approaches 90% threshold
      drm/amdgpu: Add kernel parameter support for ignoring bad page threshold

Lang Yu (4):
      drm/amdkfd: Separate pinned BOs destruction from general routine
      drm/amdgpu: fix a potential memory leak in amdgpu_device_fini_sw()
      drm/amdkfd: Add an optional argument into update queue operation(v2)
      drm/amdkfd: Remove cu mask from struct queue_properties(v2)

Lewis Huang (1):
      drm/amd/display: Align bw context with hw config when system resume

Martin Leung (1):
      drm/amd/display: Manually adjust strobe for DCN303

Meenakshikumar Somasundaram (3):
      drm/amd/display: FEC configuration for dpia links
      drm/amd/display: FEC configuration for dpia links in MST mode
      drm/amd/display: MST support for DPIA

Michael Strauss (3):
      drm/amd/display: Set i2c memory to light sleep during hw init
      drm/amd/display: Defer GAMCOR and DSCL power down sequence to vupdate
      drm/amd/display: Fallback to clocks which meet requested voltage on DCN31

Nicholas Kazlauskas (1):
      drm/amd/display: Fix deadlock when falling back to v2 from v3

Patrik Jakobsson (1):
      drm/amdgpu: Fix even more out of bound writes from debugfs

Philip Yang (1):
      drm/amdkfd: restore userptr ignore bad address error

Qingqing Zhuo (2):
      drm/amd/display: move FPU associated DSC code to DML folder
      drm/amd/display: move FPU associated DCN301 code to DML folder

Robin Chen (1):
      drm/amd/display: dc_link_set_psr_allow_active refactoring

Tao Zhou (2):
      drm/amdgpu: skip GPRs init for some CU settings on ALDEBARAN
      drm/amdgpu: remove GPRs init for ALDEBARAN in gpu reset (v3)

Wenjing Liu (5):
      drm/amd/display: adopt DP2.0 LT SCR revision 8
      drm/amd/display: implement decide lane settings
      drm/amd/display: decouple hw_lane_settings from dpcd_lane_settings
      drm/amd/display: add two lane settings training options
      drm/amd/display: fix link training regression for 1 or 2 lane

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  62 ++-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   5 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |  32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |  19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |  35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  26 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 109 +++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  24 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  72 ++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  18 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  10 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   2 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |  16 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  13 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  71 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 146 +++++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |  15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 498 +++++++++------------
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |  57 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  14 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  29 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   5 -
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  13 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   6 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  34 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |   3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |  20 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |   1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |  12 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   6 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  19 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  14 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  35 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |  26 --
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    | 349 +--------------
 .../drm/amd/display/dc/dcn301/dcn301_resource.h    |   3 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  14 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   5 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  11 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |  10 +
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |   2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   6 +
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c | 390 ++++++++++++++++
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h |  42 ++
 .../drm/amd/display/dc/{ => dml}/dsc/qp_tables.h   |   0
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   | 291 ++++++++++++
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h   |  94 ++++
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |  29 --
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       | 259 -----------
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |  50 +--
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |   1 -
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  16 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |   2 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  82 +++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   3 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   1 +
 .../amd/display/include/grph_object_ctrl_defs.h    |   1 +
 .../gpu/drm/amd/display/include/i2caux_interface.h |   3 +
 .../drm/amd/display/include/link_service_types.h   |  29 +-
 .../drm/amd/display/modules/freesync/freesync.c    |  15 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   6 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   2 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 include/uapi/drm/amdgpu_drm.h                      |  13 +-
 89 files changed, 2054 insertions(+), 1334 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/dsc/qp_tables.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h
