Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9106361F2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 15:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2206A10E562;
	Wed, 23 Nov 2022 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8380410E55F;
 Wed, 23 Nov 2022 14:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRXoLx5EtkGcD3DRlo7H65j69i87pNQK8glZDKlGMEDw80ITylzdbUuJPR2MBFy480xSwP8Z2CS6ZJKWS0TuewWUoJSBdERMZ5K6Awnzjgy2rXS/MKZJ0YrqxOTTKC3cLm42oA7Kf2Phtd6ZJCDtyFN4K4h3vbKiv7GpPX0YysEe+GiMjx7SoHhtV8U49tTRInwAQarKcS3CC18p3Yq14lLdMxblyBnMyxmkcXu+VnfdbfFIyOMNDHH8L+C8oesYwgYYLYRW0+l+LdZCG7iP88F67gV6YSeHeWNrNGlcyJcA9kBVCwKZAHOVK5Mm35/64xbZ4teEuVTKvDPK6nzEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2mfuzJ/1cwC+7wKcl/c9br0LUMsSRC96QxHb6ef+UQ=;
 b=lBka+ba6InbumxQ4RflYyY27isOUCKwR3NR0ZmTghp7lVFs4wm7uO50KgW/dTW68lwuM92MWd3HftP2dzd02GAvYjoDcIt5oyDToEUPmR7HsMirlbc1O+KEr3btQlEF47gqUN6jhVhLXM0wKRw8QvJgp8z8XM1OSACj0aTeFUZ99kQMuvil1PQ7Xvrf+EQ3GSMr6cP7SVgBeJbOjQd0gCNscjVGpXhMS5JjQkI7V5XaeCnCmSl/Qq3kKbK869uPduZjWfX5skZq8wZFiT8z6ti6noa1A8KfJop/GXcgjV9OnjAvFwGwdC0jKyrXBI1e+oMPs/e21QcTP4f9BZYJaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2mfuzJ/1cwC+7wKcl/c9br0LUMsSRC96QxHb6ef+UQ=;
 b=DqcMLFfuSUz3p+rMjwX4/13XvRl7ZGx0PmN3JNXXK+WBNdP5RpH8Mg5RNSi52VypIFPEMLaJ8g7u/NtYrUeoeOfu7bAyS5GEt5e1B6o8DJR5Bo9Y7uMK6BX4PmXTPXe9H6tx9s2ja+WHHg5P6KBtghFCBIq8ZL/OJuZnGUNijeU=
Received: from DS7PR05CA0107.namprd05.prod.outlook.com (2603:10b6:8:56::25) by
 DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Wed, 23 Nov 2022 14:36:01 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::f5) by DS7PR05CA0107.outlook.office365.com
 (2603:10b6:8:56::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8 via Frontend
 Transport; Wed, 23 Nov 2022 14:36:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 14:36:01 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 08:36:00 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.1
Date: Wed, 23 Nov 2022 09:34:53 -0500
Message-ID: <20221123143453.8977-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT010:EE_|DM4PR12MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: fcab2172-8d24-4efc-de77-08dacd600b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TcePRDe3Jdt1ppwOxtUoJMORJhkFr8ql4OIMFqobg5R7C2GgRWzztSJp+CkMFQFdk96Bfww9gI/DByXJ5SQhnQX8lDtRGvSX4KCjKBd9hNr8gXAxj1YC10S9fv9gex5GN66qNOGg64I+/LKPM9ya0BkbdFK7o481Jv+x80VT1GvsxLQkwehexLXY0heI6G/U/vuuzGCCwmdpuKv6G2Con9dZIiiBbYcD6GZTNVsOg+LjGTCg0b4OMth07mBiF0ayheM3gF+FZpo0K/q9o4jRo3VNiuS6rrlA45fEl53lBOjv36efdm3hkan1y8iJmrlAOWRpOjAQICZcCj+G0z6Lx/w6rhDOyAxMbl+MncByDzii9L8KhD0k61Bh6UNRcxvt/LGd9RYiO3LaSY9/7D76dfoXi8lFYtZ1r8p1wEKnVEOzve7PM29DDE9FdpozNlM4RLPz9S3jljFW4a0Ci0xO2edAaC3UBwwyljSYYLLkCwSDna8uhdhjmQ42DW/nzWSxU7S+11+9sOs+1lqwm58tTxKWbv/5CxUN7914EOKkRmcgyxBN9gdWRJKL5DOkYgKvjPhjpy+QOVLdZAZilt2xhP3NcK78xCotxUasAS3gAZK8uCcND2U25NytlXUvubuyV2rg79PydF//vxgzaR4LDY8tHLo0LMBcVBF7uKx2fMg6h52LqlK0plMrExITcqVq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(26005)(356005)(82310400005)(82740400003)(36860700001)(81166007)(86362001)(6666004)(426003)(966005)(478600001)(70586007)(70206006)(4326008)(8676002)(41300700001)(316002)(110136005)(83380400001)(1076003)(336012)(2906002)(186003)(2616005)(66574015)(16526019)(8936002)(5660300002)(40480700001)(4001150100001)(40460700003)(47076005)(7696005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 14:36:01.6649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcab2172-8d24-4efc-de77-08dacd600b58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5133
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

Fixes for 6.1.  Fairly big, but most of these have been baking for a while;
just wrapping them up now so they should be pretty well tested.

The following changes since commit eb7081409f94a9a8608593d0fb63a1aa3d6f95d8:

  Linux 6.1-rc6 (2022-11-20 16:02:16 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-11-23

for you to fetch changes up to ecb41b71ef90cf4741bcc3286b769dda746b67e6:

  drm/amdgpu/vcn: re-use original vcn0 doorbell value (2022-11-23 09:01:54 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-11-23:

amdgpu:
- DCN 3.1.4 fixes
- DP MST DSC deadlock fixes
- HMM userptr fixes
- Fix Aldebaran CU occupancy reporting
- GFX11 fixes
- PSP suspend/resume fix
- DCE12 KASAN fix
- DCN 3.2.x fixes
- Rotated cursor fix
- SMU 13.x fix
- DELL platform suspend/resume fixes
- VCN4 SR-IOV fix
- Display regression fix for polled connectors

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/psp: don't free PSP buffers on suspend
      drm/amdgpu: Partially revert "drm/amdgpu: update drm_display_info correctly when the edid is read"

Christian König (2):
      drm/amdgpu: always register an MMU notifier for userptr
      drm/amdgpu: fix userptr HMM range handling v2

David Galiffi (1):
      drm/amd/display: Fix rotated cursor offset calculation

Dillon Varone (3):
      drm/amd/display: Update soc bounding box for dcn32/dcn321
      drm/amd/display: Use viewport height for subvp mall allocation size
      drm/amd/display: Use new num clk levels struct for max mclk index

Jack Xiao (1):
      drm/amd/amdgpu: reserve vm invalidation engine for firmware

Jane Jian (1):
      drm/amdgpu/vcn: re-use original vcn0 doorbell value

Lyude Paul (6):
      drm/amdgpu/mst: Stop ignoring error codes and deadlocking
      drm/display/dp_mst: Fix drm_dp_mst_add_affected_dsc_crtcs() return code
      drm/amdgpu/dm/mst: Use the correct topology mgr pointer in amdgpu_dm_connector
      drm/amdgpu/dm/dp_mst: Don't grab mst_mgr->lock when computing DSC state
      drm/amdgpu/dm/mst: Fix uninitialized var in pre_compute_mst_dsc_configs_for_state()
      drm/amd/dc/dce120: Fix audio register mapping, stop triggering KASAN

Ramesh Errabolu (1):
      drm/amdgpu: Enable Aldebaran devices to report CU Occupancy

Roman Li (1):
      drm/amd/display: Align dcn314_smu logging with other DCNs

Stanley.Yang (1):
      drm/amdgpu: fix use-after-free during gpu recovery

Taimur Hassan (1):
      drm/amd/display: Avoid setting pixel rate divider to N/A

Tsung-hua Lin (1):
      drm/amd/display: No display after resume from WB/CB

lyndonli (1):
      drm/amd/pm: update driver if header for smu_13_0_7

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  53 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  14 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  55 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 254 +++++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  12 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |  11 +-
 .../drm/amd/display/dc/dce120/dce120_resource.c    |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |  34 ++-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |  28 ++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  32 ++-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   7 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   4 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   8 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   8 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h | 117 +++++++---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   2 +-
 32 files changed, 440 insertions(+), 294 deletions(-)
