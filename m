Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815F760503F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795A910E5E4;
	Wed, 19 Oct 2022 19:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E2310E0A1;
 Wed, 19 Oct 2022 19:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKBvKrFaEMaN5PBVJw05AZFEOb5Njb5G012tzOseqxRpsnA2jCYyag+LwGnmW8+b6bjOxNBHW9lRJs09Q0zHNbAN800Ul0byKlolM/5AF+FJXz1zMbRIyv0XXE20WP/fouH29GU2lUy9Xhrv+G5/HWkX08y7DNHBF0idHAIT3pu3+u1pj3ZvD+ZBHWshGvXmrwCPuPChh2tkU3mtd6yHSnHVzw265/UCIWgZjwruZQdRVFTcz5zDH3liQQBHrrhMwCdkoPQKnuL/T/OUIHtgA/SXkAjE+fvY0UjEEM/SQyqG7OTM9PPgkAt5yOPmAhm/WBPG+kD2wnO6qbM//ccOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5/u8PvBCka4eLqa9vEc0O2ks7BZlR8iCM7cYDzMpvA=;
 b=itBlFhr77ey1zbfEfSS7fjAL/mqF3xwaVfVssMlp/4PIOfHgenT16e+g0CQXtClb2veZd3iiyOceaoha7sRdEIbzPXSNRW7hgQggcMLQ2Pg5DZoNIX/3JaEUCsgvUbwVNpB0EYiY6wvOQ+aaUlhYYUmGZE88M9bFmFLbXTefmN5c/tQp05vecV5DqXHJtMhI2mdqfvu4xEqusT2cl5Y0rUf4LSflGQwEu81RUkX+9addib/zLxN6O3MF5ZOLnjsJFgMCrG8uez+T1BNxY269lAanm47Fhm+jUiu5jB678sNRwsL47BhrCVw3/WyOcl/R91FfodYdKVo4mU/dDqjByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5/u8PvBCka4eLqa9vEc0O2ks7BZlR8iCM7cYDzMpvA=;
 b=q5A4tiTHVMtAgTsm+iGKW48GgZFA3NZqCwOAQRvkWp3rIvKH/BC70a2ezm1L6Wy1KU+xNFo6tjfuFxszd0dytSeoGZ+rG+s/oxN5GUN3H/yLf4K/F7iIijtiW1z+VLKryh5QS6JnIuJJ1wK0Dg7GG6/JEszNCrjYSdFAMWlxU6s=
Received: from DM6PR03CA0003.namprd03.prod.outlook.com (2603:10b6:5:40::16) by
 IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 19 Oct
 2022 19:14:16 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::48) by DM6PR03CA0003.outlook.office365.com
 (2603:10b6:5:40::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 19:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 19:14:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 14:14:13 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.1
Date: Wed, 19 Oct 2022 15:13:57 -0400
Message-ID: <20221019191357.6208-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cf23a1-2513-4063-5258-08dab2061d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J7X6yrumt+gVOhRdb1kbTachQl5bHXIgUhpFjhhJdz9oeIqiKMTSW1fHe+y05GO8Lfa2TfDIwM8tgGf8vkyqWLmLZcZ0YXI7FAshPx9T5KEtlQCuOiJn4w4aaYdPFO+gAvIRkA60rlNTfrBPLaIr8wHbWseb5A2iGLhsg2wHD+CmJVD7gBmWh9Uxt48JNKr4bGUQIvAnHEb8l/uVtxEGQjIysJZHdCfJm5WN0JjGkjF8vWh3rtNiBSADGiah6jdJQdOYXVQBX9Enzhpo3nEmLpBFmOJyl+0zuqoi+tlMX3Ydmwu6EkJyv+qC1DaHTdqqkr4EshhBcoNLSgsJpcex4wQ6IQGF/rJk7pu8WXGxKFgE3SUNwSyx6MitkA3NJVseeBLiihaLn1aqZNiYLW44wlfAmyLj9c9CcsCA2uQ56HOGiNBizp/hJdBuW7emRWDhCqd1tVRKPggHinemGhxcfPUL433v610hB83PmnmeZg05STaDhv9BvVsh8Y0L0JNXaloJ83IYT/O88Vbgt3EBFqgaEqEqU1tJnyRN2bcQzWWcWuqHye0XfSW8H/h9HXbv6ZgBlf9FLUYqpEP4gebIM+XZMgz+mHKNN5xP42wgoaH371eNJb3QAER8n9DwtV9kS+QQXQonND9h/tINJr5IF34AeYFGyXozptStQMKzH7A8mgGZpCOS73/9FCHATi3iThUeHNaf1OW+cvWjCEXCzuGCsg9VbgF+xLyctiC9sQZ8RBS9khWRX2n0iPUmvi2D
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(110136005)(5660300002)(82310400005)(86362001)(36756003)(1076003)(36860700001)(81166007)(40460700003)(47076005)(356005)(186003)(316002)(70586007)(8676002)(4001150100001)(6666004)(336012)(4326008)(82740400003)(40480700001)(2616005)(8936002)(70206006)(478600001)(16526019)(7696005)(426003)(41300700001)(26005)(83380400001)(966005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 19:14:15.7793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cf23a1-2513-4063-5258-08dab2061d5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
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

Fixes for 6.1.  Mostly fixes for new IPs or features added in 6.1.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-10-19

for you to fetch changes up to 8273b4048664fff356fd10059033f0e2f5a422a1:

  drm/amdgpu: Fix for BO move issue (2022-10-18 22:14:07 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-10-19:

amdgpu:
- Mode2 reset fixes for Sienna Cichlid
- Revert broken fan speed sensor fix
- SMU 13.x fixes
- GC 11.x fixes
- RAS fixes
- SR-IOV fixes
- Fix BO move breakage on SI
- Misc compiler fixes

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix for BO move issue

Asher Song (1):
      drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly"

Danijel Slivka (1):
      drm/amdgpu: set vm_update_mode=0 as default for Sienna Cichlid in SRIOV case

Evan Quan (3):
      drm/amd/pm: fulfill SMU13.0.0 cstate control interface
      drm/amd/pm: fulfill SMU13.0.7 cstate control interface
      drm/amd/pm: disable cstate feature for gpu reset scenario

Guenter Roeck (1):
      drm/amd/display: Increase frame size limit for display_mode_vba_util_32.o

Kenneth Feng (5):
      drm/amd/pm: temporarily disable thermal alert on smu_v13_0_10
      drm/amd/pm: remove the pptable id override on smu_v13_0_10
      drm/amd/amdgpu: enable gfx clock gating features on smu_v13_0_10
      drm/amd/pm: skip loading pptable from driver on secure board for smu_v13_0_10
      drm/amd/pm: enable thermal alert on smu_v13_0_10

Likun Gao (1):
      drm/amdgpu: skip mes self test for gc 11.0.3

Nathan Chancellor (1):
      drm/amdkfd: Fix type of reset_type parameter in hqd_destroy() callback

Tim Huang (2):
      drm/amd/pm: update SMU IP v13.0.4 driver interface version
      drm/amd/pm: add SMU IP v13.0.4 IF version define to V7

Victor Zhao (3):
      Revert "drm/amdgpu: add debugfs amdgpu_reset_level"
      Revert "drm/amdgpu: let mode2 reset fallback to default when failure"
      drm/amdgpu: Refactor mode2 reset logic for v11.0.7

YiPeng Chai (3):
      drm/amdgpu: Enable gmc soft reset on gmc_v11_0_3
      drm/amdgpu: Enable ras support for mp0 v13_0_0 and v13_0_10
      drm/amdgpu: Add sriov vf ras support in amdgpu_ras_asic_supported

Yifan Zha (1):
      drm/amdgpu: Program GC registers through RLCG interface in gfx_v11/gmc_v11

YuBiao Wang (1):
      drm/amdgpu: dequeue mes scheduler during fini

ZhenGuo Yin (1):
      drm/amd/pm: Init pm_attr_list when dpm is disabled

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  4 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 15 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 25 +++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          | 14 -------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  3 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  6 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  6 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             | 18 +++++----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 45 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        | 25 ++++++++----
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  7 +++-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  2 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |  5 ++-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    | 25 ++++++------
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  4 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h | 17 +++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  8 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  9 +++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  6 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 11 ++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 12 ++++++
 34 files changed, 204 insertions(+), 91 deletions(-)
