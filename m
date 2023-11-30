Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC277FFD8D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 22:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF95110E77B;
	Thu, 30 Nov 2023 21:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA91110E77B;
 Thu, 30 Nov 2023 21:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyP6OhHvWasjaWfDsLEzpeKZ/vkziIKxRNuAhOMLWhOkA91dbQALghWUZKy6cMN5V1QFhT33e6mGjG9eX/pG0OQmzjpKI4UuPDlw8ABW9mW+iDr4NrAFy6bivMVhbm7NsLP1Jqzp+0T1NNVbUWzXkmAyhYUnbq0geEftLBgwuieSdqzIFOf9UFzawZWi6x59yi0fdhZKBnZq5jjR6Gn6X5RR/rFh78Q3U4jx1ekTW6WXU/C0wjujMifHSNlGjO9hKPL1oguCuHxxYp4pHv7nqBa4YLBj89SZ19USE6YPwl8oasVHPP1Wpb2UniGJ8Hb5+gyD+Ws/a+wKXHo29L9X4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIwDgQFKqXsx4E/Cg5JIUXS5Fc0ThDPOSFjSibhjfGU=;
 b=YRUruf5aTcXP6XR+Tr2mqV2+iy+Gb1bPgD5hwACK/XVHC5hUAXJOos0eamoOIt42W7f2Gaq0srurN/hct73TjxmEIhk8iIsoA88QNdmrMIH9OfJC3BcYPd97Rfplb5R4DLwSlmneE4OikGYZr9J7ttWp7JJUeTuRWx0TV0VD+dZOgeYEMQzXANArJeWupFuK+YnrKwe/KhTaD5L4TeGuHs+9cTC46ifrtssSutcUetIJ5ZZNNqo1Z2rs7/AggwowytQl0RwRQhdg0pT1bbCSiTkPPd6Mrf8clY9wDmgm/voFujwnvpFEhT2f3idWqbPZbrhLQ3QV8QeLW4sjlDGdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIwDgQFKqXsx4E/Cg5JIUXS5Fc0ThDPOSFjSibhjfGU=;
 b=Eq4emPBZXvi2/FO0M8GwIL5L1R9WoiD2Lh5Yyok/w6j5TKtvXs1S5DJrecu8QfPPPKIl5pjmONWpuInXWdstKHkyYM4b8hMG4nWlMeOqNXdtS0bGNWAOED5Wx9h/wnvtm7QdjGoJ6WTeWInuo4yBK5jT4ta59xvkR2CvnscvOxU=
Received: from BL1PR13CA0214.namprd13.prod.outlook.com (2603:10b6:208:2bf::9)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 21:31:54 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::35) by BL1PR13CA0214.outlook.office365.com
 (2603:10b6:208:2bf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Thu, 30 Nov 2023 21:31:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 21:31:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 30 Nov
 2023 15:31:52 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, drm drm-fixes-6.7
Date: Thu, 30 Nov 2023 16:31:35 -0500
Message-ID: <20231130213135.5083-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a7547e-9c2e-4d45-a174-08dbf1ebc5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V7R5wNcQwyPt1dmi8Q736w6Sg+GX/bDuXhbzxfC2NENRqJ+a2YA76SMF8Ql96HZtcIi64bxrDiwwF0IZoZ1GlB3bztsi7VnXbeuiAjk71tTVLyql9WyfJ4zibRG1nEcfMtrP5e4OiDEb8G8AsBitx7O5rmn2+Oxl9K30he9H0Ob4JGll57PxpYwZgPVxuHgI2maoL4KPSWyQbDccs9mkOI6DM1PqXUOEzBU6R5AJUzGB35h3DF0FUhlm6rJyHktMAk24C5cjoOgMbwD+PBGIwyreEj01R1kWQ8lTYZk4hxXvPHltfbqg1wKo6+G7kC1P37tXBtSlFoklvkCURr6/qvnidnFAzN6KDTYvJ4cH544xh67ol65/QGLeUyMjHXBMXK9coCJ3DTHXPK+Iwh4eqfnUup2IQbzBxQzKnv02XxZEwMLcSvWO719Yv3a2vt2oxpcUR5zudlfprw43q0C2QTsuMtgh5+uU9kJ8K2VTYi9r6/UDC8H1VZ6GiioEFN6+KnmV9SVm23gWowQKVn3lyNYOr9o94lEjl6zNpuwsrHcg92fFQ6u8SG34YujqRyxkWCjAgFeQ/C69mBQmFD3ma3tSRHw4EsGT0BSR1uvWiltOeMLNUK3FkeWXRfC1+htNizDIMfYtiQMCJ2eplfzJeLlcv0nJPYfkT+QziFGv9CkBppcOij3AnEbMjHaoRP+JEcKNIBzqq75N1PESLvneKScTwCLjHEp5k4PC+YlWMfrbXmNvfmHAVuLb5Kn1mi00
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(16526019)(6666004)(1076003)(7696005)(2616005)(336012)(26005)(426003)(478600001)(83380400001)(47076005)(36860700001)(4001150100001)(2906002)(8676002)(5660300002)(41300700001)(966005)(4326008)(70206006)(8936002)(316002)(110136005)(70586007)(40460700003)(86362001)(81166007)(356005)(82740400003)(36756003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 21:31:53.7402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a7547e-9c2e-4d45-a174-08dbf1ebc5b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852
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

Fixes for 6.7.  Mostly fixes for new IPs.  Also including a revert of
the unexport of the currently unused prime helpers for fd/handle conversion
since amdgpu will use them in 6.8 so I see no reason to remove them only
to re-add them again in 6.8.

The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.7-2023-11-30

for you to fetch changes up to 0514f63cfff38a0dcb7ba9c5f245827edc0c5107:

  Revert "drm/prime: Unexport helpers for fd/handle conversion" (2023-11-30 14:46:04 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.7-2023-11-30:

amdgpu:
- DMUB fix
- DCN 3.5 fixes
- XGMI fix
- DCN 3.2 fixes
- Vangogh suspend fix
- NBIO 7.9 fix
- GFX11 golden register fix
- Backlight fix
- NBIO 7.11 fix
- IB test overflow fix
- DCN 3.1.4 fixes
- fix a runtime pm ref count
- Retimer fix
- ABM fix
- DCN 3.1.5 fix
- Fix AGP addressing
- Fix possible memory leak in SMU error path
- Make sure PME is enabled in D3
- Fix possible NULL pointer dereference in debugfs
- EEPROM fix
- GC 9.4.3 fix

amdkfd:
- IP version check fix
- Fix memory leak in pqm_uninit()

drm:
- Revert unexport of prime helpers for fd/handle conversion

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: fix AGP addressing when GART is not at 0

Alex Sierra (1):
      drm/amdgpu: Force order between a read and write to the same address

Alvin Lee (3):
      drm/amd/display: Include udelay when waiting for INBOX0 ACK
      drm/amd/display: Use DRAM speed from validation for dummy p-state
      drm/amd/display: Increase num voltage states to 40

Camille Cho (1):
      drm/amd/display: Simplify brightness initialization

Candice Li (1):
      drm/amdgpu: Update EEPROM I2C address for smu v13_0_0

Dinghao Liu (1):
      drm/amd/pm: fix a memleak in aldebaran_tables_init

Dmytro Laktyushkin (1):
      drm/amd/display: update dcn315 lpddr pstate latency

Felix Kuehling (1):
      Revert "drm/prime: Unexport helpers for fd/handle conversion"

Hamza Mahfooz (1):
      drm/amd/display: fix ABM disablement

Hawking Zhang (1):
      drm/amdgpu: Do not issue gpu reset from nbio v7_9 bif interrupt

Ilya Bakoulin (1):
      drm/amd/display: Fix MPCC 1DLUT programming

Jonathan Kim (1):
      drm/amdgpu: update xgmi num links info post gc9.4.2

Li Ma (1):
      drm/amdgpu: add init_registers for nbio v7.11

Lijo Lazar (1):
      drm/amdgpu: Use another offset for GC 9.4.3 remap

Lu Yao (1):
      drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null pointer

Mario Limonciello (1):
      drm/amd: Enable PCIe PME from D3

Michael Strauss (1):
      drm/amd/display: Do not read DPREFCLK spread info from LUT on DCN35

Mukul Joshi (1):
      drm/amdkfd: Use common function for IP version check

Nicholas Kazlauskas (8):
      drm/amd/display: Add z-state support policy for dcn35
      drm/amd/display: Update DCN35 watermarks
      drm/amd/display: Add Z8 watermarks for DML2 bbox overrides
      drm/amd/display: Feed SR and Z8 watermarks into DML2 for DCN35
      drm/amd/display: Remove min_dst_y_next_start check for Z8
      drm/amd/display: Update min Z8 residency time to 2100 for DCN314
      drm/amd/display: Update DCN35 clock table policy
      drm/amd/display: Allow DTBCLK disable for DCN35

Perry Yuan (1):
      drm/amdgpu: optimize RLC powerdown notification on Vangogh

Prike Liang (1):
      drm/amdgpu: correct the amdgpu runtime dereference usage count

Sung Joon Kim (1):
      drm/amd/display: Fix black screen on video playback with embedded panel

Taimur Hassan (3):
      drm/amd/display: Remove config update
      drm/amd/display: Fix conversions between bytes and KB
      drm/amd/display: Fix some HostVM parameters in DML

Tim Huang (1):
      drm/amdgpu: fix memory overflow in the IB test

Wenjing Liu (1):
      drm/amd/display: fix a pipe mapping error in dcn32_fpu

ZhenGuo Yin (1):
      drm/amdkfd: Free gang_ctx_bo and wptr_bo in pqm_uninit

Zhongwei (1):
      drm/amd/display: force toggle rate wa for first link training for a retimer

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |  18 +--
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   5 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  54 ++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   8 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 159 ++++++++++-----------
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   4 -
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |  10 ++
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  15 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  23 +--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  84 ++++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |   2 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  16 +--
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  60 +++++---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   2 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   6 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   3 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |   6 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  16 +--
 .../dc/link/protocols/link_edp_panel_control.h     |   1 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   1 +
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |   2 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |   2 +
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |  29 ++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  18 +++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  10 ++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   5 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   1 +
 drivers/gpu/drm/drm_prime.c                        |  33 +++--
 include/drm/drm_prime.h                            |   7 +
 54 files changed, 464 insertions(+), 249 deletions(-)
