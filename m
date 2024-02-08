Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C984E590
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 17:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1588210E997;
	Thu,  8 Feb 2024 16:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qf+WhVEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C9B10E997;
 Thu,  8 Feb 2024 16:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkU66UHdZ7CGm2y1P1YUxcUu4CvOXKQZsHH/ehgmb7mokn5faWjum6plG+k//UdZHnpsvfxCxZP0nGARQnU2lMChegoTd3CXkopPsgZCoOuAjze3Mn5Vwn4VsfmhizJqlutTl5hSq3yWBM+5PapwQjnN1RyNEOtogqd4mNvaZoCd53eUVYOf+3+N2ynuGQdQLj7110Jqv7F3dBX9sO8QgNyGxthbqwvTW+cStX71BDlAEhIEoAEXt/seaOLdGJTK0nXA4JBMEg0aNQ6ldnGm/ZEco3u4ltdM4tPX0gxJ0EDdtXl+AZ1/dtgWbviatAPp+D//59DcDw8nq5+6C+F2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITw1o+elx9uc3SVqjHnTn6Kf9wOv2HA4PUNsP4OlIQw=;
 b=Kl/ZrCI/h2kE1nKx8XZD3jdN+dTeC3OdLgbyId3GkQsqrSl0nlt4GLIlGHj/zSyftApQUbf04/Aw+6F6nY+5X/N7hZP8Mlccn+b0/aOcDW9QiEnu9Gs1YmShgaH3UL5qjAl9izXQ+aNDNxl7/bVzRHuHRjte/UMQKhIyuN9a8TvLv5qfqFzMYZFhOBxD3G5Pe7UlKWZ1FKiqYbCyuxxBHJ1wfgbuDubRY/vimvij+9zd4rqpnU74pK04QJqFKDTyAYhgJY9WrcmO/GVIV66i7b8ahuG9JTa9X0mKXazYW2mIy7zYKvTMEqpQ3iey/vQHXS1y8vQRTVZ4pqJS+XxE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITw1o+elx9uc3SVqjHnTn6Kf9wOv2HA4PUNsP4OlIQw=;
 b=Qf+WhVEr1wvGwtvdiidgFbYyYA+AU3TEujqMJXTf6tppnDrUyMec7rUMsXlWh86o5bm5o+Yx/b5V339OymWc/2zSrLzU7IeY2sdAUOIkMd6tKAY52yv3HLdm7hkYas7Ug68fwCRDBEjg4dUr7i6rTh3/YiVDHM7vel917jm7Ku8=
Received: from BY5PR17CA0065.namprd17.prod.outlook.com (2603:10b6:a03:167::42)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Thu, 8 Feb
 2024 16:55:16 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::69) by BY5PR17CA0065.outlook.office365.com
 (2603:10b6:a03:167::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36 via Frontend
 Transport; Thu, 8 Feb 2024 16:55:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 8 Feb 2024 16:55:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 8 Feb
 2024 10:55:14 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.8
Date: Thu, 8 Feb 2024 11:55:00 -0500
Message-ID: <20240208165500.4887-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a203a4-b7dd-489c-01b4-08dc28c6b973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5cKKPnOFhm0siIuUX2F0DAVdDE/YY6CKeMO07jzTw7Zz+wZLxzXRHA09BOy+wu56HXf1eQgupSC2yUN1uUdYfYICjpBpbZnrONR2gWLAc1yfpRsMQGeR3AeBWU/VXEFL3AT3dC+mf/jm/2fM6YQox20fAkZ4+k472lwlOE26OyaBgn+1cfZvi5OLQbnK0s02HgK0b/PauV8SV2koxDBUp7dfexJkO4wkpaHU8dxMLfWWlhkBrDcAGiCC90pNIAqQgEjo/SNhWpw1n5xtKclSaisve81g3rSwuoAzTHyTdc0+Gtk0PZu3AnmTaXiQztJrvpJ0XAEx5c+S5AemqowaRdXbtiqvone/y/vMAOSOEW66xG8nZ/PEoYOUzzttVn8AFN8qHns8D0R3FQuiXlaZdbepeeKGOa7b3gXxogx1tUllcrvZOLZIonygfyND23ApsBvl8VTY1DpnJPcAErU5poaGGOc2d8w+VaqgfpfLBaoxV+yiOjcVN00fxG6uyF1ugRRcuNHkFH2ojp1zeGLBad0WRYQv5a20bXeMnu2VJSKFuXueunmAEoeohRHv25hU9xm3bsSAiXls9CnvOA+X0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(4326008)(5660300002)(8676002)(8936002)(2906002)(70206006)(110136005)(316002)(70586007)(966005)(83380400001)(36756003)(7696005)(478600001)(6666004)(2616005)(1076003)(81166007)(356005)(82740400003)(336012)(426003)(41300700001)(16526019)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 16:55:15.8475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a203a4-b7dd-489c-01b4-08dc28c6b973
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049
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

Fixes for 6.8.

The following changes since commit d0399da9fb5f8e3d897b9776bffee2d3bfe20210:

  drm/sched: Re-queue run job worker when drm_sched_entity_pop_job() returns NULL (2024-02-06 12:47:43 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-02-08

for you to fetch changes up to 534c8a5b9d5d41d30cdcac93cfa1bca5e17be009:

  drm/amdgpu: Fix HDP flush for VFs on nbio v7.9 (2024-02-07 18:30:11 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-02-08:

amdgpu:
- Misc NULL/bounds check fixes
- ODM pipe policy fix
- Aborted suspend fixes
- JPEG 4.0.5 fix
- DCN 3.5 fixes
- PSP fix
- DP MST fix
- Phantom pipe fix
- VRAM vendor fix
- Clang fix
- SR-IOV fix

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Update phantom pipe enable / disable sequence

Fangzhi Zuo (1):
      drm/amd/display: Fix MST Null Ptr for RV

Li Ma (1):
      drm/amdgpu: remove asymmetrical irq disabling in jpeg 4.0.5 suspend

Lijo Lazar (2):
      drm/amdgpu: Avoid fetching VRAM vendor info
      drm/amdgpu: Fix HDP flush for VFs on nbio v7.9

Mario Limonciello (1):
      drm/amd/display: Clear phantom stream count and plane count

Nathan Chancellor (1):
      drm/amd/display: Increase frame-larger-than for all display_mode_vba files

Nicholas Kazlauskas (1):
      drm/amd/display: Increase eval/entry delay for DCN35

Prike Liang (2):
      drm/amdgpu: skip to program GFXDEC registers for suspend abort
      drm/amdgpu: reset gpu for s3 suspend abort case

Rodrigo Siqueira (1):
      drm/amd/display: Disable ODM by default for DCN35

Srinivasan Shanmugam (3):
      drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
      drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'
      drm/amd/display: Implement bounds check for stream encoder creation in DCN301

Stanley.Yang (1):
      drm/amdgpu: Fix shared buff copy to user

Wenjing Liu (1):
      drm/amd/display: set odm_combine_policy based on context in dcn32 resource

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  8 +++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  8 ---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |  9 ---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           | 10 ---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  6 ++
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 22 +++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  3 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  6 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 15 +++--
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  4 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |  4 ++
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |  4 ++
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    | 63 +++++++++---------
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 76 +++++++++++++++++++---
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |  2 +
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |  3 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |  1 +
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |  7 ++
 drivers/gpu/drm/amd/display/dc/inc/resource.h      | 20 +++---
 .../display/dc/resource/dcn301/dcn301_resource.c   |  2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c | 16 ++++-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  5 +-
 28 files changed, 220 insertions(+), 98 deletions(-)
