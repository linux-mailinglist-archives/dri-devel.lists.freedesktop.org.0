Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8D67433C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F371210E9E6;
	Thu, 19 Jan 2023 19:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173BD10E9E0;
 Thu, 19 Jan 2023 19:59:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNd7xaEXVEKBI11gJd/IWB5DvtsHmAUG+625K5wjk0/XOiSuL9e4zEZoWEogYlEq3xF6Eh3BaYOE6qvuK4vlE9BmCoGrKbn4eQbZXtuaaAFOgBMR3i7iGn18pFQH43cVfEs06pAGuKjSto1p5oCkG/VPAGJD+tAvHEWECvx+3S75Kv7TS23meeeMbIeLF11drq2ejlS+2SDvebKokbPftD+P1Rqrj2iR04REaDm0N5kahKJjU8LPmzCeeJRdpDfXDbQu9QLywXk13UC0P+tEKGjxPjOnbB1hwRftFTbOQuK42v2ZgborsGWPOjINCtCvG+WOzOSx8Re7e2T2/lzrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muBOUG0/dYaMTyxCVRSPAPqo57PhTafMCZSy/RUFfcY=;
 b=KWIanlMPVhsl2Qun8SzseVpJGO/6Lgn5IDinHOl50o/PzQuwY4++lGsy7j1KfGZWkFutdJGs4e6zrjwZw1JHS4PV+tHs7UDKDTOyp5pJxensQgklvVMp0acZHJIvaa2rLFTM4Sy4NDDmqFlJF4TYi2auO3i5k2xPSh2NU7zUVvSoRfvXcon0jMXe5OACAkQTTX0hilLYzqAQXW+cOIhqDOsTlQJOEBMQyOMkzyyyJ7fGKA6PORo395dbb3vQH0ruCeFbCfeBWi3DNtONGnWS4am30sURoENS+kmFw2Cq2puiLmux3OqwcB7/DR/odieEeExYfGOI+aofmiJxAPWf4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muBOUG0/dYaMTyxCVRSPAPqo57PhTafMCZSy/RUFfcY=;
 b=DefQAzoa2N8OonmGZZWBT44GD+KX5wYYH/lGeoK/Xa9hBm7rfZh6c5eKqh+IlxKeGpxYeAKSqO/3dCFSSj6f1K/AdVqFOBugJziKDE4+xC2C2t0BDwDuhGrSGMGuapYlPD8/lXYyNB7e81wjZ+GaQ/Vz7sPFNNWC+MdUtOM96gM=
Received: from MW4PR04CA0035.namprd04.prod.outlook.com (2603:10b6:303:6a::10)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 19:59:27 +0000
Received: from CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::21) by MW4PR04CA0035.outlook.office365.com
 (2603:10b6:303:6a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Thu, 19 Jan 2023 19:59:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT072.mail.protection.outlook.com (10.13.174.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Thu, 19 Jan 2023 19:59:26 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 13:59:23 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.2
Date: Thu, 19 Jan 2023 14:59:08 -0500
Message-ID: <20230119195908.7670-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT072:EE_|IA1PR12MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 69da97d8-7a0e-47c9-c1e5-08dafa57ab30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArLGP/rKt/x157YfwnPE2TF/moIDnM1i8wJgOJe+JxSfxfkGkC0q2ROB7e4RmFNQyr3vQdJfHwbzEc83qS5/2GNO567vqbvxG9JNK7HiR77+50BTlbmSASk7g15yjZuCxbsTZM+VkVTbLgCgIgm4HWjrp9ukmUWQCOxEvxeoA7p/zUfwlBnA7i5MpRqFccumUMFp2vHuCtkOyQaweAxbn+huvGW+mx/Tfc2yDd9a7TFPuFpP9rKFqcW8iMx0/cAEILnppnCUvFKooPrWGGJk+GE5OQ6BqmSjOFFYx9b/7vEulLNcQzkSxtLvKn0oGiHZkTwvh29mU4PxzO/ES6Z/1Olo0O88UCvXZyKM/4Hj+Ulnk5xuzWPgkQv59vKR7tHWQN0VaYUyv+FGWeExF+4S6eQaVcI7xDfqbbxSg9rB6aTWpR2VH0Oe7s+bTENc4zfrzlWpb8FuzfUJ17wU2O3glTwamBv+nhE3o8pRKp67KaKn2vhzAzd+7o/Qxam55cfNhjG/0t4dsfvffmJOhXlIu0fCNt+OKQTOg0WRSqZxKo5rcs4MbSMg61Oku2l4cppjAi1Nfvjv5GX+jz93Eq0X50qsYaezAm4Emv+qSaF/2N0NSobyyS437Otzq3edQ6SNjEzy6eu51Q3AqILNfMEN7KFbieh7UZrakor+1bqmJBjxyOB38jKVhHueKSK+Qdh7HfxpNMIyDXBA6/rXqK5j2OKXtYNlUR7fMOZopdPJS9xsAUB/lsdaN/K6y1ngzAcG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(86362001)(81166007)(356005)(5660300002)(41300700001)(8936002)(36860700001)(82740400003)(36756003)(40460700003)(186003)(7696005)(110136005)(478600001)(966005)(83380400001)(26005)(16526019)(6666004)(316002)(8676002)(82310400005)(4326008)(70206006)(70586007)(66574015)(336012)(1076003)(426003)(2616005)(47076005)(40480700001)(2906002)(36900700001)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:59:26.5982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69da97d8-7a0e-47c9-c1e5-08dafa57ab30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
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

Fixes for 6.2.

The following changes since commit e695bc7e542358978434c8489a5a164d2bbefae8:

  Merge tag 'drm-msm-fixes-2023-01-12' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2023-01-13 13:01:22 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-01-19

for you to fetch changes up to a52287d66dfa1cca32e6273623b63ba39d87f126:

  drm/amd/display: disable S/G display on DCN 3.1.4 (2023-01-18 23:23:24 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-01-19:

amdgpu:
- Fix display scaling
- Fix RN/CZN power reporting on some firmware versions
- Colorspace fixes
- Fix resource freeing in error case in CS IOCTL
- Fix warning on driver unload
- GC11 fixes
- DCN 3.1.4/5 S/G display workarounds

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: disable S/G display on DCN 3.1.5
      drm/amd/display: disable S/G display on DCN 3.1.4

Christian König (2):
      drm/amdgpu: fix cleaning up reserved VMID on release
      drm/amdgpu: fix amdgpu_job_free_resources v2

Hamza Mahfooz (1):
      drm/amd/display: fix issues with driver unload

Joshua Ashton (2):
      drm/amd/display: Calculate output_color_space after pixel encoding adjustment
      drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix

Lang Yu (2):
      drm/amdgpu: correct MEC number for gfx11 APUs
      drm/amdgpu: allow multipipe policy on ASICs with one MEC

hongao (1):
      drm/amd/display: Fix set scaling doesn's work

jie1zhan (1):
      drm/amdgpu: Correct the power calcultion for Renior/Cezanne.

 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c                    |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c                    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c                    | 10 ++++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c                     | 11 +++++++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c          | 14 ++++----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  1 -
 drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c      |  4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c            |  7 ++++++-
 8 files changed, 33 insertions(+), 18 deletions(-)
