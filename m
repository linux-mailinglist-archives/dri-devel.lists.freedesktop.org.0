Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025F0535463
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 22:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8308510E64B;
	Thu, 26 May 2022 20:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119C910E649;
 Thu, 26 May 2022 20:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6XojN3+DPp0vGxzO3qNlVKm8bV5QC+fUqlSZIx8Iv8i8qA3FZwy42VEhNjBj9pYqwe2tZ8FTegKwuZvHoAeLrE3iBfoPq8IxT7FnIa6jl6/TZVJLqfOhJ96llYtW7wqzowpwVFIQi4WfI1d4Pz7A2bwEnZHg7DXz6zd8NvxPVeZX+fwTnaXxoNehVYJjrBAIAWgnc3c0pgL24g/nUEGJ+nGIRokJmIhYXKIOJML7K/yugzOax3vo5FajSBbTqSPlIOdlIIYByFbuTed5f8Gz7yKRTpk8ThHzblTA8+m0blH7heR9qtT/gwHBrtvlQd4NQWYYZFid36tH2ALcuGlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFtJRY2Rxgizcs6Grkl7SLebVGrdLV3Vy8621wFahgE=;
 b=hnj3OX8X7e+nJG1CcEX9x9RBLXGQHPBSLn533iQ1+4pZzA0kFMHC/TJp40FemodfsTsQZB384mGqWjvVlB/uZOzXGF2SNk9QLUvFhpAok1TjSE/sCdJVO9X6+KVbG1KVjetNAd+0OSClThbfRds/l8ExILP1UVmn5PknPCugI1flCazjTPzGMnB54Hb98SKTIDhO3zWWTVDr9U1Ax3iZaVEee0hh3Q/I0S/Z02w29IVVQlhv25KwHgvE8SiOPKvU1XfAELOOzsDs0BXpIAErSbFspcP80YBwEt8ICvcTrbzW2VNSZUyr8g4HIdpY/PSmta2mCMp8GJ5Hdod2ZeLoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFtJRY2Rxgizcs6Grkl7SLebVGrdLV3Vy8621wFahgE=;
 b=bGHtCh7skDueDXi5EAkpxLsYHE+q3QgcC9GqxNiRZ72946e36XrTRZgphZPtyvAjXtH/wx55K+6pb/A4WSa2OtXK1iSqSp3E9QT+HS0ogdtMiWep0azVYOcgg/0BizFRpDnF6s5pbNdJoWf1ja9bmLPp6EbmRJ47/SvaMC4Cs9E=
Received: from BN9PR03CA0784.namprd03.prod.outlook.com (2603:10b6:408:13f::9)
 by CH2PR12MB3960.namprd12.prod.outlook.com (2603:10b6:610:24::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 20:26:03 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::7e) by BN9PR03CA0784.outlook.office365.com
 (2603:10b6:408:13f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 20:26:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 20:26:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 15:26:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-next-5.19 (bonus)
Date: Thu, 26 May 2022 16:25:46 -0400
Message-ID: <20220526202546.66860-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23861357-3dc5-4b87-757b-08da3f55f469
X-MS-TrafficTypeDiagnostic: CH2PR12MB3960:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3960122463727E6508D0C0C5F7D99@CH2PR12MB3960.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Smk+sTxxZg41FoDn9ffB0HyN38ewe8nwEe3CVnXzht33O3n+zTVoSBRr7OSGlLHxSBEolSi6ELVhGyQQ5TtnewZHeygNW2aDXG4XaJ5h1AoXjjLe7B01Bj2MCI43zSdR6ocHqV5ij//rxnUI42EJzdP2+dCkz49pD0MrKC0FdYC9b6atcRkHNyuUJRCaLp/cWe2oPmGAaWUd9Hejh2iOliqEKGzgSCpyhV9dTeLoAaGfVLwu9+k0Y4ptsdJnM0HOcBZYfUyKy4XZePpVQAXBwGXn0Zqpc1NO28lRzKAkaQTCkN/H2m+ZMwisUyEsMmIt62g/w33MOW5KtFkgSWVAZPV7Ame+XbpUv8bVYXldDq8aSNlCNo0+Gm6u/1sa5wy/JV9QzCPcWl0jLinMLLz9v+Fnez0hk32PB/i5jD/vYnJqAxJQDpq0NRLECA79TFNR8goZgr4OVsP7O8L0kPwE2TgqiGOgPU+q/H6e1TfUKTcZ4n+kYKQ2N3cRYOKdNbvYNs2fTImrL1EOBqSC/cCL+FDoQ5phQBE27/+BHVUtOfd58gAIYjCRldCWB40V5dqRWVe9a5kzpahzHfQHJxTI2kQhYItDQHqwuUx8Ati4qINhpLZI/Zz47bdLt+Ur8/C4KVP79UElheKhjmdpEsd5Vx4byCC2cPZhomR5IKxyUdPhhQ5699y+lOBhErxqF6ZG0tuhXbDT7Jt7T7L9sqesGQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(110136005)(336012)(2906002)(426003)(83380400001)(86362001)(36860700001)(7696005)(47076005)(66574015)(1076003)(5660300002)(186003)(16526019)(36756003)(82310400005)(8936002)(4326008)(70206006)(8676002)(316002)(356005)(966005)(26005)(70586007)(81166007)(6666004)(2616005)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 20:26:03.1043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23861357-3dc5-4b87-757b-08da3f55f469
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3960
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

This is an additional pull on top of the one I send a few minutes ago.
It adds a minor UAPI change and updates the fdinfo format to match
the generic drm fdinfo format.  They are pretty small, but if you'd prefer,
I can wait until next cycle.

The following changes since commit 62e9bd20035b53ff6c679499c08546d96c6c60a7:

  drm/amdgpu: add beige goby PCI ID (2022-05-26 14:56:33 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.19-2022-05-26-2

for you to fetch changes up to 9bdc1992c925a35c6f7200e8abe54e3f00ce7719:

  drm/amdgpu: add drm-client-id to fdinfo v2 (2022-05-26 14:56:34 -0400)

----------------------------------------------------------------
amd-drm-next-5.19-2022-05-26-2:

amdgpu:
- Update fdinfo to the common drm format

UAPI:
- Add VM_NOALLOC GPUVM attribute to prevent buffers for going into the MALL
  Add AMDGPU_GEM_CREATE_DISCARDABLE flag to create buffers that can be discarded on eviction
  Mesa code which uses these: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16466

----------------------------------------------------------------
Christian König (5):
      drm/amdgpu: add AMDGPU_GEM_CREATE_DISCARDABLE
      drm/amdgpu: add AMDGPU_VM_NOALLOC v2
      drm/amdgpu: bump minor version number
      drm/amdgpu: Convert to common fdinfo format v5
      drm/amdgpu: add drm-client-id to fdinfo v2

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c    | 177 +++++++++++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h    |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  68 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     |   3 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c     |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c       |   2 +-
 include/uapi/drm/amdgpu_drm.h              |   6 +
 12 files changed, 154 insertions(+), 135 deletions(-)
