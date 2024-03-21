Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B187C8862DE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 23:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A1C1121AC;
	Thu, 21 Mar 2024 22:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k7evIxzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C331121B0;
 Thu, 21 Mar 2024 22:05:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqW/XFPRr5qrbZgGOMm8G+IrSji061m3w3qX6aPt/qo9mfMlrToNDd3Yv6FzWjuZne3UyQcV1zUs+lh/nUGFcR1Sb61EtFIhJFpLRZ1zxMvinlpNTtzovJ8SuXxyfke9VDGLu/7t79MM71x9ehlFoH1lhEjxrHazsyBuobVrNgezuvjT6Z6ewjisdH+yNlF9hszxZBzlQRL0dDxcFLvgJVStLUV4qHqR6TI0rEsnqm50o68Uj3jFaxso/xv37PdX9LRPeHuXlv0aUu8oWmOEsJdm/TTPZEnDVWLoZC82n6SUGbmkVjuRQFL9+ZBbgqSSRz4UWbOi2x0kGR2Lj8F34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Er8Igw7wPkVBcr3gJTr3qzADbf/lAFkEXpACMWpRa4=;
 b=Xw+kLbOfRjAysopCLKHKPr9sctlPr3afzBh00CMDV6TzBL0EKCQcanKZUC0HO2kX+XWFq4XhHGuyg2qnZB7ivPVJGqYuJxCAZVRuoUsDY3jF4/izKpx/sWvcO4Uo+bd5L6hlsEPzaAG+I3qtjAgI7CMp8BK/CGze9ncd3Kvjvxcp6+JJazkN4AF8oiEWageCAyoRsk4YIGd0QIgFW3xjfqvjgksGttVdc7XdlwSVJue+a3843slCEAM2XW2kAR0aLA3A22NIeyLpuB9Yahi6XJcjg6LIevNuE0BiqJVMxzK6cLiEogdWDFnUZF0xEQ6nBjFWfuJLJCoCkZStnX39XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Er8Igw7wPkVBcr3gJTr3qzADbf/lAFkEXpACMWpRa4=;
 b=k7evIxzhDPF8ZNCJcCNiNe5lEWE6ahnQ8uJjeHpdVCY7Og8HGwyWCvX8DFbeNX6ahlKBHAW6sfp15hZiOl3CeCm3KrejrSbKA7sPHoS0A2oW9CSQi+ymb+ets6oOCBH0WDn+AOgByE348wryYD2Xyy5pDT5wP2q0UvLJNN1ZY6Y=
Received: from SJ0PR13CA0236.namprd13.prod.outlook.com (2603:10b6:a03:2c1::31)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 22:05:30 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::1d) by SJ0PR13CA0236.outlook.office365.com
 (2603:10b6:a03:2c1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11 via Frontend
 Transport; Thu, 21 Mar 2024 22:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 22:05:30 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 17:05:28 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.9
Date: Thu, 21 Mar 2024 18:05:14 -0400
Message-ID: <20240321220514.1418288-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3ad484-0ca0-4e7a-4f38-08dc49f3060f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fMskdFh3O8q/Vlc0G+OkDV8/hE8tqsiD9ZtPPdzfK41Gcf8rMO9Z6W4/fzQbe17oOUv3Ldvok8a/CH2o44ARX8EcrHuNtGls77ZrowCrzhho5RQlCUbcVJ8cSUn3H/KYcGMZ+m0cqxvT1uipqwyO1E35yAl+cS0C/UqIJqy9KAhFez+Yi5joTKlXRgbd9ix0vONyiDLtRaeATxwekZU81GP7QeJAz632l6sUKCNAT4GZYuiwcI1qHny4v3+rs9fV0B0RBxDdVYSMBGh1EaEVP2JCjWrE43M2eHkaoLlEQo6liFSBB5ubmyJ9wksroAi9ZnOsHUBJAiJg6h51zWDt6PQCrJ4f/d2n7+0snF/yg2fI8nVbs3ZfHD0rh5MtLRR71C7bS4mr8sQXWX72nY2iS+ME48JQ76aahhmdbPOh8A3mzWXQclkSXYVWzhRMIocVi9OKQ6uVAcgkbyeURgqHWLR12AAuZ8RkrsFtdZMPiUp4XiWr4cCy6BTmkLU8MSQfq9BC3OWPaDsSBGhT7dSLrshwJHXtiBiHzbntEG1bqmxRH6NUb7vIdyPx7BpdivikwjMlKIhe6wMRuOlImLRlK3P4UgBsH3QcdfYQCv/xiPqtzgPbkjVn6u0bh5qQDG65yCS7AI3ZRvOIb/mPIywrCRmvn4UncR6prYY7K6j43eETkDFiD6aj5DRVM0s8utBQuJE+7Xd+X55OV0DgoKHlQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 22:05:30.3877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3ad484-0ca0-4e7a-4f38-08dc49f3060f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
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

Hi Dave, Sima,

Fixes for 6.9.  Fairly big because it's about 3 weeks of fixes.

The following changes since commit 119b225f01e4d3ce974cd3b4d982c76a380c796d:

  Merge tag 'amd-drm-next-6.9-2024-03-08-1' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-03-11 13:32:12 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-03-21

for you to fetch changes up to bc55c344b06f7e6f99eb92d393ff0a84c1532514:

  drm/amdgpu/pm: Don't use OD table on Arcturus (2024-03-20 13:36:29 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-03-21:

amdgpu:
- Freesync fixes
- UAF IOCTL fixes
- Fix mmhub client ID mapping
- IH 7.0 fix
- DML2 fixes
- VCN 4.0.6 fix
- GART bind fix
- GPU reset fix
- SR-IOV fix
- OD table handling fixes
- Fix TA handling on boards without display hardware
- DML1 fix
- ABM fix
- eDP panel fix
- DPPCLK fix
- HDCP fix
- Revert incorrect error case handling in ioremap
- VPE fix
- HDMI fixes
- SDMA 4.4.2 fix
- Other misc fixes

amdkfd:
- Fix duplicate BO handling in process restore

----------------------------------------------------------------
Ahmad Rehman (1):
      drm/amdgpu: Init zone device and drm client after mode-1 reset on reload

Allen Pan (1):
      drm/amd/display: Add a dc_state NULL check in dc_state_release

Aurabindo Pillai (1):
      drm/amd/display: Enable DML2 debug flags

ChunTao Tso (1):
      drm/amd/display: Amend coasting vtotal for replay low hz

Dillon Varone (1):
      drm/amd/display: Init DPPCLK from SMU on dcn32

Friedrich Vock (1):
      drm/amdgpu: Reset IH OVERFLOW_EN bit for IH 7.0

Hawking Zhang (1):
      drm/amdgpu: Bypass display ta if display hw is not available

Josip Pavic (1):
      drm/amd/display: Allow dirty rects to be sent to dmub when abm is active

Lang Yu (2):
      drm/amdgpu: fix mmhub client id out-of-bounds access
      Revert "drm/amdgpu/vpe: don't emit cond exec command under collaborate mode"

Le Ma (1):
      drm/amdgpu: drop setting buffer funcs in sdma442

Leo Ma (1):
      drm/amd/display: Fix noise issue on HDMI AV mute

Ma Jun (4):
      drm/amdgpu/pm: Fix NULL pointer dereference when get power limit
      drm/amdgpu/pm: Check the validity of overdiver power limit
      Revert "drm/amd/amdgpu: Fix potential ioremap() memory leaks in amdgpu_device_init()"
      drm/amdgpu/pm: Don't use OD table on Arcturus

Mario Limonciello (1):
      drm/amd/display: Use freesync when `DRM_EDID_FEATURE_CONTINUOUS_FREQ` found

Mukul Joshi (1):
      drm/amdgpu: Handle duplicate BOs during process restore

Nicholas Kazlauskas (1):
      drm/amd/display: Fix idle check for shared firmware state

Philip Yang (1):
      drm/amdgpu: amdgpu_ttm_gart_bind set gtt bound flag

Prike Liang (1):
      drm/amdgpu: correct the KGQ fallback message

Rodrigo Siqueira (1):
      drm/amd/display: Return the correct HDCP error code

Ryan Lin (1):
      drm/amd/display: Add monitor patch for specific eDP

Saleemkhan Jamadar (1):
      drm/amdgpu/vcn: enable vcn1 fw load for VCN 4_0_6

Sohaib Nadeem (1):
      drm/amd/display: Override min required DCFCLK in dml1_validate

Swapnil Patel (1):
      drm/amd/display: Change default size for dummy plane in DML2

Vitaly Prosyak (1):
      drm/amdgpu: fix use-after-free bug

Wenjing Liu (4):
      drm/amd/display: Update odm when ODM combine is changed on an otg master pipe with no plane
      drm/amd/display: Lock all enabled otg pipes even with no planes
      drm/amd/display: Implement wait_for_odm_update_pending_complete
      drm/amd/display: Revert Remove pixle rate limit for subvp

ZhenGuo Yin (1):
      drm/amdgpu: Skip access PF-only registers on gfx10/gfxhub2_1 under SRIOV

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 14 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 16 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            | 20 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 18 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 38 ++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  3 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  8 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |  3 +
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |  6 ++
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |  7 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 23 +------
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  8 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            | 10 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 25 +++++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  6 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 14 +++++
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 71 +++++++++++++++++++---
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |  1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c   | 14 +++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h   |  2 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c |  1 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  6 ++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  1 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  | 18 +++++-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c | 28 ++++++---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |  3 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 45 +++++++-------
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    | 12 +++-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 30 +++++++++
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |  2 +
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |  2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |  3 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |  1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |  4 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  4 +-
 .../dc/link/protocols/link_edp_panel_control.h     |  4 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |  3 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |  8 +++
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |  1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  3 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |  3 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |  2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  8 +++
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  3 +
 .../drm/amd/display/modules/power/power_helpers.c  |  2 +-
 .../drm/amd/display/modules/power/power_helpers.h  |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  | 28 ++-------
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 19 +++---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 31 ++++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 18 +++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 18 +++---
 64 files changed, 456 insertions(+), 215 deletions(-)
