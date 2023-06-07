Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454A727099
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862610E118;
	Wed,  7 Jun 2023 21:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A8910E066;
 Wed,  7 Jun 2023 21:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H++sREfz1KGs2hsW3pl7S69jNy1WpXBnUg+sNeSuhtM11Rxy+HVEtaWkBDmXeEd3blAAyk8LhUYd3s5lECDzbKl7cIYuYCk8LcZ/cIXOUnhyNmR1cW3ijnbd8mxOWARnXSX8Qw3t/94S6WoMSAd7emtvrnPa/kDGu3KKhQfqnHt0hTkidgL0luQ8rlh3iNf7ufPuSSkJprM6f/QL2wGovE8u3sVK+inE/XPWy8f+zmYQdZ8N8nJVprLayAFYBejPn2FEBy7M8TXfEXgIFcnT/ti39B3AcUXUOX9Lrk21m4WMl3hgwaayD/azBCswZ1s88xwIl4kGDOzL/18C240ZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s9ZiwO/y2C3Dz6+pUiO5DNsUpq+FhN1gnyBdbzHwiA=;
 b=YI7df57OLYYJimA3Ih2/PMMt70mP2IB4uI1sJH2F8p2KamuZRVnvtfQ2B0CbUHXlFw7F1+gC3dgJlHCYW0B0oNT2cACKjPKTuf8ru2GTbdBs+/QbTCXs5oCT5fpXynkMtdHMBGQ8UeNuYEHoIdwdi8oJ7Osz+F22NniwSFGcAF2k+LWPdWyD+t8Nk/0B/agUHcZuXsE3EuCJW+UiI/WMYO+0WQsvwBvjzVDQwWv3Hp1i0PDti7ZuePsSAVQDhoQtRBYgJPcK7gAo4SVCNJped2VPi2f+hKMpud7Xt9bGSmF6DR6HWygDUQHjHxv6RMxhO7yPrDZnh8FAT3WZRq/w7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s9ZiwO/y2C3Dz6+pUiO5DNsUpq+FhN1gnyBdbzHwiA=;
 b=l9HvVTcHFsaXbdEBZl7etkm7n79VUqvlaGJpKwd6bD2DTvkCs1S0gL/s3s0QZ5NO+b5cwD+0eraC7nJzL0PC8fgXRZSRLzirxqa0PcW0xkeT/C4zscbVlNdSDFFPH397y+Zx909pQ1gOC8XWMKqkX6oaq0Vn2M2nLJS2rZ7z22k=
Received: from MW4PR04CA0336.namprd04.prod.outlook.com (2603:10b6:303:8a::11)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 21:37:55 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8a:cafe::84) by MW4PR04CA0336.outlook.office365.com
 (2603:10b6:303:8a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 21:37:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 21:37:54 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 16:37:53 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, radeon drm-fixes-6.4
Date: Wed, 7 Jun 2023 17:37:40 -0400
Message-ID: <20230607213740.7723-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|BL0PR12MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c33886-b666-4de5-0a2a-08db679f73e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3pOQqh4vulyEkSwOde9GQ/om5Y8hTQbbOGeXRsxUiwQ/+F4F4qkXSU3NPlj/Cbp7abSMqe2jP4XChpfGkh8PGnCmOFyDJkt0XDW8fLimO0dZa0M6EbZXWV1RJYxD5+beaiTMvB5lIs1d/Wh4oXlcggZn2FidKbuLlp0eXAMY212jA6B3JpSpm5HLup44b2PaCaJSV+dCTKidVwWsCKZIK5x9Qv2Vq5G4xNyFUipAGhaGSONtmevqE98w6K4iKcgs7MZA0t335MHrEoRbRhIIlKPO5Ai/dU7N0ut12OceLi1+fR24u3Ua76cBl2M0dKUp1znBxUaJAHU4FTbb+dyjg6/VVWWtrw/6JCK8PRDkkLa2rToK8BvPNXj4+LbKch7HAfjQJ6qHOXly0aJQ3iRPirQUuYnHMm7lYQ7nTDDlbkQcRWUQw6JEnq9JmGChu+cSzgMHWINTWxHd7br+3eHxI/A2+u3vmGDiYA5+vw+NlE5+DbIPmIxaS8hoNeQdkcR+dtPvTeXy3LgAqLhOl7zt+OUdemEfHCpcdIRTh0kyYz34HARC4tuuVzqcZTTWTFsPof3YWpqTuDtSwPKWExueeeZSSzDYhuJDPcSf3lDwMoEyY2lJaqGJMHNFE1vZAYJQ6SuciJ3a78itrPuqoudvtWGyKiC17apIv7SUP/xCpmE6PWz6cc+SI7N3oSM83H98iPipo/YwaYDdTfjLSZT1S0g3Ns7CNieLIhDMehH38o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(47076005)(2616005)(26005)(1076003)(356005)(81166007)(316002)(40480700001)(83380400001)(4326008)(70206006)(70586007)(966005)(7696005)(6666004)(16526019)(186003)(36860700001)(426003)(336012)(478600001)(82310400005)(110136005)(36756003)(2906002)(40460700003)(5660300002)(8676002)(82740400003)(8936002)(86362001)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 21:37:54.3764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c33886-b666-4de5-0a2a-08db679f73e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
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

Fixes for 6.4.

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-06-07

for you to fetch changes up to e1a600208286c197c2696e51fc313e49889315bd:

  drm/amd/display: Reduce sdp bw after urgent to 90% (2023-06-07 17:02:25 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-06-07:

amdgpu:
- S0ix fixes
- GPU reset fixes
- SMU13 fixes
- SMU11 fixes
- Misc Display fixes
- Revert RV/RV2/PCO clock counter changes
- Fix Stoney xclk value
- Fix reserved vram debug info

radeon:
- Fix a potential use after free

----------------------------------------------------------------
Alex Deucher (3):
      Revert "drm/amdgpu: change the reference clock for raven/raven2"
      Revert "drm/amdgpu: Differentiate between Raven2 and Raven/Picasso according to revision id"
      Revert "drm/amdgpu: switch to golden tsc registers for raven/raven2"

Alvin Lee (1):
      drm/amd/display: Reduce sdp bw after urgent to 90%

Chia-I Wu (1):
      drm/amdgpu: fix xclk freq on CHIP_STONEY

Evan Quan (1):
      drm/amd/pm: conditionally disable pcie lane switching for some sienna_cichlid SKUs

Horatio Zhang (1):
      drm/amdgpu: fix Null pointer dereference error in amdgpu_device_recover_vram

Lijo Lazar (1):
      drm/amd/pm: Fix power context allocation in SMU13

Mario Limonciello (2):
      drm/amd: Disallow s0ix without BIOS support again
      drm/amd: Make lack of `ACPI_FADT_LOW_POWER_S0` or `CONFIG_AMD_PMC` louder during suspend path

Min Li (1):
      drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl

Samson Tam (1):
      drm/amd/display: add ODM case when looking for first split pipe

YiPeng Chai (1):
      drm/amdgpu: change reserved vram info print

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 35 --------
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  7 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    | 11 ++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 36 ++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 20 +++++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 92 +++++++++++++++++-----
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  4 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |  4 +-
 13 files changed, 162 insertions(+), 79 deletions(-)
