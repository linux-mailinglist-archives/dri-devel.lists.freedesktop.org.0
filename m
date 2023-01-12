Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0C6669A4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 04:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DC410E85A;
	Thu, 12 Jan 2023 03:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A121B10E17C;
 Thu, 12 Jan 2023 03:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csaObjqSJe2wVG2caVFlnK2Ib9fEGE1xumt04kYcoA0Nt8Eqjvw3+n8A68lk7h4r+9c2LUuCtyUiFXAJfyeM838/hioxjfBrUj+cH1aWmF6ghIHG4MJWHcuQScMWusuX/T1k8O9R9HqVltOfTAv3qS0Je6l+C3Lk5J6ut46E3uy7gKe5cB32/fdBiirQpEljj+nkavzyyUkBuwag4T1oAu01Hjty0LnNDjzOQVmlWHhJpIQ8NQ9J1DV/6pmQYObS2bIznyQPQUfETWMY+xe5vQizDOCw7+AQQKM5Tf4yOtz2ku0Jhgo/f08dJfMcTsgXXykOb3VfTBKLKFmJJ1mcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVk0haEZvg/nBRWSsixEp9w5fDpHZpHg/KZ+BCzp0vE=;
 b=LCbHjo4vtcq4VwpQPis+PlJIxYYKYL2ob549KCisfHYFKUewc+AjInAwXPdB/SRQ0dR+FOWnej01xF4QJUVmyCPY17I+kA1eh/TECopAYhZ07VODWNYEdHqtIdKxR2Ql7wcTnzWgOmvLDLrENj93PXWCheW461brGYigK3+lS9Bu+arduqyOVyOFfgJy6eLyrG7T62dZlf980qt22ldivhH4wcWS8osRll21T3eXMJhUgVycs9ndnHVDyIdH5LtoZCmqJ0fQXUwqEu69mSY6nEvjo6klI6BMufecHT3HfHFCoq/cPEpZNmJ1xNxaVxHrMCrna5qcrePkWD9AEudBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVk0haEZvg/nBRWSsixEp9w5fDpHZpHg/KZ+BCzp0vE=;
 b=xZlNZZyXHa2scT2uIqu90hWO5Bpw+gnaRZjJ7es7HRyXhdCSv0V6MFtCB0kzGKIVSs2gEhnGqc9SiDHyaXSg6oLAd831fs0sj+fv5M8RDhZG3WzOGCKwX98xQ2K2N92bFqY4Hz2C4OARo9AOqZ9n+vYoLpnMntfFf5h7NWl4moo=
Received: from BN9PR03CA0316.namprd03.prod.outlook.com (2603:10b6:408:112::21)
 by SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 03:30:26 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::6e) by BN9PR03CA0316.outlook.office365.com
 (2603:10b6:408:112::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 03:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 03:30:25 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 21:30:24 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.2
Date: Wed, 11 Jan 2023 22:30:04 -0500
Message-ID: <20230112033004.8184-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT050:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb29e4f-8194-4e5e-dec6-08daf44d5855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2BRF62ja7lE7EHwcpwXn8A3Y/SVkIeaM4YsmiK41KTTj0UW11cY8RPu64t/i6S0B04x1on5/De923bJ76ThTRxCLLWWxcD9subCOWsLkB0axoCjWMOPduX+CRtWwO5Jocxs0u5hY9CCsujGttNsFWvrm7kPW5YXWrmVbJJYv/aASO5Db+396MGXa+4zBERMFmJtVZAYAai4kuovebPdayH80a22eydDKcD2y7I3TT9V8rkC3QZzvr0hZFJHW40Gg+YCWLGdBZhW3rm1XXsWR715/kwbNOI+zxzmf7Gv5RPqWBvb3eHYx9YG/uhuYN+lM5QXw8AkFq6letRMYVNDPi1VDWs1UOoGa4JWG4H+315Wr1Jf8r/dDfPXj2RtqL+J8YJui01/DUCy/3L/Uq7lDQEY6GHT3j+0mbHUUlelMj4222VFXT5nbwnR5PkfNq2/LtjeKCqYVR2inB9S+4FFKzrS5F96irRdg2QY975nEZSHT4uve3EgBZgKSJxWg4OUglp89PGW32Su4ZlwG/6XTswQs0OO5PsVqXe1DMdF/3+4eer/Oj3dH2KKnQeSBh/p6vjQWB9VeMR37DMjjEwveGfAP5mY5/Zkj0VudUSW6S6CjFRpL/HBaZduTBMpcEI3PhqX3OZMwE5UQU7ErZPMbgvcaIdOXRsnTLO90dYeISQx6pBmlxH+degZVeXkm1ZD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(8676002)(82740400003)(81166007)(70586007)(70206006)(336012)(4326008)(186003)(86362001)(82310400005)(26005)(16526019)(1076003)(316002)(40460700003)(356005)(110136005)(966005)(2616005)(40480700001)(7696005)(478600001)(36756003)(5660300002)(2906002)(6666004)(41300700001)(47076005)(8936002)(426003)(83380400001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 03:30:25.7559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb29e4f-8194-4e5e-dec6-08daf44d5855
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219
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

The following changes since commit 93235bfd5a9c3329df31d1a4d7a93d138b3138c2:

  Merge tag 'amd-drm-fixes-6.2-2023-01-04' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-01-05 12:13:51 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-01-11

for you to fetch changes up to a6941f89d7c6a6ba49316bbd7da2fb2f719119a7:

  drm/amdkfd: Fix NULL pointer error for GC 11.0.1 on mGPU (2023-01-10 18:11:08 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-01-11:

amdgpu:
- SMU13 fan speed fix
- SMU13 fix power cap handling
- SMU13 BACO fix
- Fix a possible segfault in bo validation error case
- Delay removal of firmware framebuffer
- Fix error when unloading

amdkfd:
- SVM fix when clearing vram
- GC11 fix for multi-GPU

----------------------------------------------------------------
Eric Huang (2):
      drm/amdkfd: Add sync after creating vram bo
      drm/amdkfd: Fix NULL pointer error for GC 11.0.1 on mGPU

Evan Quan (2):
      drm/amd/pm: correct the reference clock for fan speed(rpm) calculation
      drm/amd/pm: add the missing mapping for PPT feature on SMU13.0.0 and 13.0.7

Guchun Chen (1):
      drm/amd/pm/smu13: BACO is supported when it's in BACO state

Luben Tuikov (1):
      drm/amdgpu: Fix potential NULL dereference

Mario Limonciello (1):
      drm/amd: Delay removal of the firmware framebuffer

YiPeng Chai (1):
      drm/amdgpu: Fixed bug on error when unloading amdgpu

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c            | 8 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c               | 6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c            | 5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c          | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                  | 9 +++++++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c        | 8 ++++++--
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 1 +
 10 files changed, 31 insertions(+), 13 deletions(-)
