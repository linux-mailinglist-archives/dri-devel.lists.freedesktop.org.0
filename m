Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B36A7AC1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 06:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE92C10E0D9;
	Thu,  2 Mar 2023 05:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A7510E0D9;
 Thu,  2 Mar 2023 05:19:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJmEqpDJqPvyfH8OpLc7hoXZILdWwrQuCwhfx+1S0XVdkN5u9XstHCBz4T5wyaWrV90Xgm4dpG4IfrNXn2w6neXp/ZitSohVtw+ja2Yqt4a/fkJzeMiQoeZYsvIFQbKTeasLR3uE/Fhz8l4vGYlljtwDIqidijW5lK68D76AL13CwV2H1HT8H34sXTKxHF+8d5QwEzLS1ERd2lovfCUWSdyE29AdgcJfoBBKcIVUZ8hF+nfCsaIRoiTNfTAMS/vR2kPE7hX9ekt6w24+pvu7NoEm4g+u1wpSsTW3GFw03sImE0m/XyFJhvrdjNqkPk5hgv7eq98dkuedw8hHXVb/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7og7/eUJEahmWXG+/ohVIkAf96nyBe9FNg3hQeUP5w0=;
 b=EjPT4gK9b9MPbkrlRkzjDfShpiBET++MGGfjDaewmbVm7VBgX4KYD06xOGRnJ7TJjbWAsYh8y97kvYv21B+f54hCWolJfruUIdEurySzGu4OyeTnZZfIRHaDTrseK9TDN6ZQU6AxP875AVmCzvH2a8xJkuCTL7eehxsAm600+UTVpUy4G/uql0MEiKyDf52ziwY7SDYsgx91GGEyF6hK41crF/0nLPqs9Z8Ey4c2vL2Qwpevlr0kI/3yKTNfhCeffjumiMc0UyYOtSRmx6OuEgfZvcN9xPw0eBfm83innb+yeatRuZ8BRH8afUjXCTEvoQMHvAOCHWYLh8qiucEy2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7og7/eUJEahmWXG+/ohVIkAf96nyBe9FNg3hQeUP5w0=;
 b=xQhsC3cqgbpg1E9UBf3q0arPNGUvgHs2LTqDZ+0oo1NHWzSuOl3AHUP3KQP0sABbJzwdcz0zItwDHqyHKiqKZUPGD/3ixyJUi9D04AubKgYfvU5HCwsB2ejqjQ1rcKMFxvRKJQYv9EaM3iO4BbzW30PhuYynxxwh73lmims7FG4=
Received: from DS7PR03CA0111.namprd03.prod.outlook.com (2603:10b6:5:3b7::26)
 by BL1PR12MB5319.namprd12.prod.outlook.com (2603:10b6:208:317::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 05:19:10 +0000
Received: from CY4PEPF0000B8E9.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::7e) by DS7PR03CA0111.outlook.office365.com
 (2603:10b6:5:3b7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 05:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8E9.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.4 via Frontend Transport; Thu, 2 Mar 2023 05:19:09 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Mar
 2023 23:19:04 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.3
Date: Thu, 2 Mar 2023 00:18:43 -0500
Message-ID: <20230302051843.7793-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8E9:EE_|BL1PR12MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a998a77-6593-4fdc-088a-08db1adda726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkUfmQ1sQUPh1DwWHNuxbDE2Sweh2QGorm5ctfx9dJ2tDyRqpc2NI0w4h/7qZdr3CQv7hIhZ7wCa4yxcJ4iM6AKGDP+u5bMaYefLjsnDv8V9SqWXhPokZvvlD0BK3TjPK5VFlgEpbENC5d4mW50JYoMy8cJ+8jKR5VMSwu86VWPIgjGJ+eHjmJUsZ/TV6QJbvwMbuzJDHviVbgFs1PYAZ64udPmGJlef6r7rPw30/BAY62lpb/PiJ5c+Kj6l40uPSTul1trE9tckG31a6vdOIL209oIzfDxN30pn48uQ00rqpHGOzQ4b9dU7aRXQoW/o3xjfm9v0V1224eCz8IqZGW5/GAs495vUHV6FhEqeCw/eERL7x0zZv1XsBreI5H//Bw6HV6oqKx8AWDniVI6d0jQ596dHLuVpSaW7+ulexsMkMP+tltLHTvTykFl8/bGipZm1DN+8Br5s1/Ff+9WGR5EyqE9JpCGYc60UkdTbjTfty2pS9aLaMlWWBd/7zdc0cgp2M4klI7/dcgaMJb4Lx+M+R3R2XfBvgg8r8Gf6ogtiLz60Hwvdz+1i5E+gPUW+YAxOCCQ6+KmalTbHIHxrqSonGmpIe2Z9IKXOMjFKmqgc25gUmw7MsYqvvhnGO535O+y3JRa/5uYhlWb5O+dDiXBFJafsV2G7QBvULP4D382jkajWS779CoQrkfknUi31
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199018)(40470700004)(46966006)(36840700001)(36756003)(40460700003)(47076005)(6666004)(966005)(1076003)(26005)(2616005)(186003)(16526019)(336012)(316002)(4326008)(110136005)(41300700001)(70206006)(70586007)(7696005)(2906002)(8676002)(5660300002)(478600001)(82740400003)(81166007)(8936002)(86362001)(40480700001)(82310400005)(356005)(36860700001)(83380400001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 05:19:09.5564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a998a77-6593-4fdc-088a-08db1adda726
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5319
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

Fixes for 6.3.  A bit bigger than usual since it's two weeks worth of fixes.

The following changes since commit a48bba98380cb0b43dcd01d276c7efc282e3c33f:

  msm/fbdev: fix unused variable warning with clang. (2023-02-23 09:48:05 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-02

for you to fetch changes up to 6bb811d0ee3e1fe9f22a028c89b3472c999b70bc:

  drm/amdgpu/vcn: fix compilation issue with legacy gcc (2023-03-01 22:45:08 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-03-02:

amdgpu:
- SMU 13 fixes
- Enable TMZ for GC 10.3.6
- Misc display fixes
- Buddy allocator fixes
- GC 11 fixes
- S0ix fix
- INFO IOCTL queries for GC 11
- VCN harvest fixes for SR-IOV
- UMC 8.10 RAS fixes
- Don't restrict bpc to 8
- NBIO 7.5 fix
- Allow freesync on PCon for more devices

amdkfd:
- SDMA fix
- Illegal memory access fix

radeon:
- Display fix for iMac11,2

UAPI:
- Add some additional INFO IOCTL queries for GC 11 fixes
  Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21403

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: fix shift-out-of-bounds in CalculateVMAndRowBytes

Aric Cyr (1):
      Revert "drm/amd/display: Do not set DRR on pipe commit"

Candice Li (3):
      drm/amdgpu: Add convert_error_address function for umc v8_10
      drm/amdgpu: Add ecc info query interface for umc v8_10
      drm/amdgpu: Make umc_v8_10_convert_error_address static and remove unused variable

Evan Quan (2):
      drm/amd/pm: correct the baco state setting for ArmD3 scenario
      drm/amd/pm: no pptable resetup on runpm exiting

Guchun Chen (1):
      drm/amd/pm: downgrade log level upon SMU IF version mismatch

Hamza Mahfooz (1):
      drm/amd/display: only warn once in dce110_edp_wait_for_hpd_ready()

Harry Wentland (2):
      drm/amdgpu: Select DRM_DISPLAY_HDCP_HELPER in amdgpu
      drm/amd/display: Don't restrict bpc to 8 bpc

Hawking Zhang (1):
      drm/amdgpu: fix incorrect active rb bitmap for gfx11

Horatio Zhang (1):
      drm/amdgpu: fix ttm_bo calltrace warning in psp_hw_fini

Jane Jian (1):
      drm/amdgpu/vcn: set and use harvest config

Jesse Zhang (1):
      drm/amdgpu: add tmz support for GC 10.3.6

Kenneth Feng (1):
      drm/amd/pm: re-enable ac/dc on smu_v13_0_0/10

Marek Olšák (1):
      drm/amdgpu: add more fields into device info, caches sizes, etc.

Mario Limonciello (2):
      drm/amd: Don't allow s0ix on APUs older than Raven
      drm/amd: Fix initialization for nbio 7.5.1

Mark Hawrylak (1):
      drm/radeon: Fix eDP for single-display iMac11,2

Qu Huang (1):
      drm/amdkfd: Fix an illegal memory access

Ruili Ji (1):
      drm/amdkfd: To fix sdma page fault issue for GC 11

Ryan Lin (1):
      drm/amd/display: Ext displays with dock can't recognized after resume

Shane Xiao (2):
      drm/amdgpu: remove TOPDOWN flags when allocating VRAM in large bar system
      drm/amdgpu: optimize VRAM allocation when using drm buddy

Sung Joon Kim (1):
      drm/amd/display: Extend Freesync over PCon support for more devices

Tao Zhou (4):
      drm/amdgpu: add umc retire unit element
      drm/amdgpu: exclude duplicate pages from UMC RAS UE count
      drm/amdgpu: change default behavior of bad_page_threshold parameter
      drm/amdgpu: add bad_page_threshold check in ras_eeprom_check_err

Tom Rix (1):
      drm/amdgpu: remove unused variable ring

bobzhou (1):
      drm/amdgpu/vcn: fix compilation issue with legacy gcc

tiancyin (1):
      drm/amd/display: fix dm irq error message in gpu recover

 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  23 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  23 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  83 ++++++---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   3 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             | 202 +++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  25 +--
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  15 +-
 drivers/gpu/drm/amd/display/Kconfig                |   1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   3 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   5 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |   1 +
 .../display/dc/link/protocols/link_dp_capability.c |   2 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  25 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |   5 +-
 include/uapi/drm/amdgpu_drm.h                      |  11 ++
 39 files changed, 420 insertions(+), 128 deletions(-)
