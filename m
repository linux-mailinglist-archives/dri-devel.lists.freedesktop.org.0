Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C681E71916A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 05:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B791310E20E;
	Thu,  1 Jun 2023 03:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D146510E20D;
 Thu,  1 Jun 2023 03:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+Ari1q/iQIJVNmOFG7oFv1oOt3+DEh/W+3+CkYI5a+ikN8cOn+PNQeb3WEGkkihfy4+Ofy3YxMReTHD4r7T+zCnWbNLFcod3s1lx1POyFkWxciun+TANSPvi0iBAOn+mea9Ct92DICmvSZEmRiMM/gA9JG2Z+Y7afZtSBZzuhIPOvhxHpdBGUUgu1TtSt3kNLifofDqbKIv9PzB4szhVRC4gRS4rI2w8yh3kR7i9/rqGxrTSVQlwj4BPDqQEEki30OJ9UIiO8XuGmLm4+E9Ck6ITeJp6PoWoJ4h8X6avIrjDzQVGEQze1dsbJuf6siO454F08ss1qa/bLWYc8EYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mMzHr5hzAS3OU9lwYvsa+LNI7kMtcTre3uUaCzpnS4=;
 b=K0xxW5y/ioFdTd1qdJ1++45Gy24IrUu4nuDtRpcYWGopZg8jpUGn4t+dtBDWUd1ioI+B6S+NqR9N2NgLUKzDnfUyQH0QpebpTtutRoKs0Jgg/WuTQJb8ZIalTVufn0Hi7CNXXiW22mWVgI/LwiEoCCadQ20yaEBOmzk2RZ761P/qV7/jBVirw8YhcSpQSjP0NdU+L0NSd1IEPvatrHzIK53B+BvVoSNnInfM07j5QpcNh6dKUw8Qnu0rdupabVE7HDzXzRwD6eJBGY1jZSR6WMql6QS1d8oOHBoBESvGXVPTC7GCPnXToJ7UMbarTN0N2FXoaehfNl4nqOOsen9Xeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mMzHr5hzAS3OU9lwYvsa+LNI7kMtcTre3uUaCzpnS4=;
 b=VjYj4gEosM34FaAMXIP5HyXaXMGBcDx7FRaSQpMv6ZSG6QJBtKxdBT7esoMEkUzZ5jkgVNKkAuG0tap4gi0RmqdxCH2awe60ZzplyY9Mh1JWDyp1M4AeV2dyyUseI/yTQm0NM3jd6UEUs24iBE2KTtfRlYKV7acGeQgQfrZyJ9o=
Received: from MW4PR03CA0111.namprd03.prod.outlook.com (2603:10b6:303:b7::26)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 03:39:05 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::28) by MW4PR03CA0111.outlook.office365.com
 (2603:10b6:303:b7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Thu, 1 Jun 2023 03:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 03:39:04 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 22:39:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.4
Date: Wed, 31 May 2023 23:38:46 -0400
Message-ID: <20230601033846.7628-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: cc27f848-475b-457b-6b11-08db6251bf92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibIEZPcH6jmFFd248eLJLdQ802PxDyIu+KeDFRM5uj24XBUT+zuWBVvAI6M8OZ+4+6j34W13sqH9gb+VFf1tBy3OwY0szAHEEdz8X61kq9gQYJOTx4rvVm0X87hoj9u4NRbUrDBCtY2xTNhPeExqBJ7VmI0KkgkRy6sx7kgYqJZkkfuJp229ZreweOgXIIfSBif5cY0SzxBs17NeJppoVCk3CqwBHYXSeQYxIfHdjFK161kg4/cxxq8ymmlopbQf3wn2SqqtghxqRWJmsZUVVak4f9zwwHcr4iIbR7qr7UpL6ccPYP063bMIpxjL1OwhRa1ookID0KyzA+MGwsPybCAEdqdoPoXl5xH3//eM3u2hN/xVAdAU+56QjTkiMuZnScr1o2GqRhIlLb0bK/PCSn4ueueqLZaAZs+Ru48hXP0ziO4LzP9Lxx1Qr/5c7JsHRugucuBSdQJTFB5IXRKIsoaoQT2TiQXtQTkweffBmJNA3L0tVuZV0Es2wfdpB9a53OpAKRA2pO/JcfLHgpvNq0OKmSdZixpZMSUs1+e/baU+JEqcIBQeRvuobVDw7Y1uA+PIanXLMfQEX7EZ801HCG84c9QFP/zEI5haPtN2FVVt8A8kNS/ARZgl6m3xaM00cqk77XI4Rub87ga6KzwExHPWHI9BJHk5mdTj1cdagNTagylBNFLGZcC1lytaqy1XLeYBYmHyeNl7/AvYdru8AVxrHyix1O8gb7rzO8lxhk0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(26005)(1076003)(110136005)(478600001)(81166007)(356005)(8676002)(8936002)(82740400003)(70206006)(70586007)(4326008)(86362001)(2616005)(6666004)(40480700001)(316002)(36860700001)(5660300002)(82310400005)(186003)(66574015)(47076005)(7696005)(36756003)(41300700001)(16526019)(336012)(83380400001)(40460700003)(966005)(426003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 03:39:04.7568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc27f848-475b-457b-6b11-08db6251bf92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732
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

The following changes since commit 7877cb91f1081754a1487c144d85dc0d2e2e7fc4:

  Linux 6.4-rc4 (2023-05-28 07:49:00 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-05-31

for you to fetch changes up to 663b930e24842f3d3bb79418bb5cd8d01b40c559:

  drm/amdgpu: enable tmz by default for GC 11.0.1 (2023-05-31 22:28:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-05-31:

amdgpu:
- Fix mclk and fclk output ordering on some APUs
- Fix display regression with 5K VRR
- VCN, JPEG spurious interrupt warning fixes
- Fix SI DPM on some ARM64 platforms
- Fix missing TMZ enablement on GC 11.0.1

----------------------------------------------------------------
Guchun Chen (1):
      drm/amd/pm: resolve reboot exception for si oland

Horatio Zhang (6):
      drm/amdgpu: separate ras irq from vcn instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v4_0
      drm/amdgpu: separate ras irq from jpeg instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v4_0

Ikshwaku Chauhan (1):
      drm/amdgpu: enable tmz by default for GC 11.0.1

Michel Dänzer (2):
      Revert "drm/amd/display: Block optimize on consecutive FAMS enables"
      Revert "drm/amd/display: Do not set drr on pipe commit"

Tim Huang (5):
      drm/amd/pm: reverse mclk and fclk clocks levels for SMU v13.0.4
      drm/amd/pm: reverse mclk clocks levels for SMU v13.0.5
      drm/amd/pm: reverse mclk and fclk clocks levels for yellow carp
      drm/amd/pm: reverse mclk and fclk clocks levels for vangogh
      drm/amd/pm: reverse mclk and fclk clocks levels for renoir

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           | 27 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 27 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  3 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             | 28 +++++++++++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             | 28 ++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              | 25 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              | 36 ++++++++++++++++++----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  9 ------
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 25 +--------------
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         | 29 -----------------
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 10 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  5 +--
 17 files changed, 173 insertions(+), 100 deletions(-)
