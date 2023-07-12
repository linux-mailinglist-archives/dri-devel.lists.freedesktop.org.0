Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5227510AB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 20:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A01710E5C8;
	Wed, 12 Jul 2023 18:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A972810E5C8;
 Wed, 12 Jul 2023 18:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7fRVZUjOy2qes8Rq2WICRfCkj6HLjP7rbKcouKN46BmkVScT+fZA2giUuUwJr48T8ttHNN5UoCqLr9pslkwNEKbaTSPSzPiqa8QFHxxRXux61jnWy/WjX6IyU7JSetoAJUqcS88/AGlu5OQWrMgOUMDiWstKXmz5LHv6Q6Vngp/gLJWcTAjdh/JirOKnitxwon6mnvx0kQzKqK3CTyrLw3+Qv4Uz/uYI/R5mshdZEUzkPAYMVc5Lehhc73Ux7EchVw+5WpAEUJe6XY7a2aa05bk36YLfP4o4d1gfYa/hQjD6MwanFVrr/M4VKCDEakdCp1uAQdHjM1UNsvfH5B5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99nQ4xZszaLbzvvZ9NxF6n43VdXLsp7Lu5Xduh8jhOw=;
 b=bcc3bzVymbOBCO+xmuiK1iMdeMijsXeb4Fh3XVuwLBj2wn/oS8GP7cbTUHckC3RsYEGV+AIIXwJbwVUnKXBqv3gFne2BA/jqT4AWaoC+nt60TpMSiNWeR3OlImSXblrAn9OGGkrFe71kLTrogEMRq5u6XdEJG5gtGkR6kO8Kye9JXv5z4ygnrDESjTVrsNlfl7jm35pTOKMsQvQT1ZYNY8HMusqlPW4oyr4rXOVX1iQaMPESgE6A6GWJbETZZtAGJcm5JZyIvH/RQGo4dXDRt2gc3RfMYYg8IO4iKuQ9WjXNBHHVIkpauz986hJ6ndel3PRzgZyEXYnTQQZFXLibyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99nQ4xZszaLbzvvZ9NxF6n43VdXLsp7Lu5Xduh8jhOw=;
 b=gW99uZKMem1tlxo9Buh3cavOgUQjqtEatgXo8moxlNTX/nCAIudymH/uu8KVq1HRVpgFUbbe3Cy5ge+ewb4g3s3EekvqMBsiHj4fSsuJK1xWklS9z/ffqnvSBVZiUC/+UaLbBifg5eQJ4vXV0KSfofM+GekUbbCFO1cKANsaNN8=
Received: from MW3PR05CA0002.namprd05.prod.outlook.com (2603:10b6:303:2b::7)
 by DM6PR12MB4877.namprd12.prod.outlook.com (2603:10b6:5:1bb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 18:40:24 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::d) by MW3PR05CA0002.outlook.office365.com
 (2603:10b6:303:2b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 18:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 18:40:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 13:40:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.5
Date: Wed, 12 Jul 2023 14:40:09 -0400
Message-ID: <20230712184009.7740-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT067:EE_|DM6PR12MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8f7b2d-1968-4cb1-e5a2-08db83077404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbQMhd99OTFwxv21344zPfKF/YTGg3NWt5GIsRMl9/NnYtbDegyZDLbIBcMAGYe3GS9cqA7rLqZslXiUd4BxuCndJhxAhAmL3Onvk4bQW/qh0MouFS6p9HUffsrZztKIC0GTa2wYpXXRnn9lMJ/+krqHnRVRys3FhVuRyMi/h4nyLfaOhnRetakrH/wetK/vOIXJBuge+UKuIZwAJ5SiL2DHjW45uFQtcT+U5AgpSFrBL5YHmPq1+tzdMWhQ48DHZe3Nxr/TgSX3BaPnTeUL46yqDjuRkKPTcIlI2lm7fFt7SRfD6uqcDZw6ggB/1TfZizygUULaG+Q2xHqXq/PJ44xbDB3Cw49l4ZFskTu4TkjbhWxsNsSpUOcNBEzmgw+FGQm4iPoo4/2f7rOaazhFdFE2xHkxYURvLH42tzO5VPUUvvVUYpz/loNgdfr60x9ZcioFXHgP8OhRKLAXdpLVlh4KmppQrrJRRK+CZUf+64PH5T8JP4hwcVEJUSpRKXI2VDL7TRvGuVVD4hQKrAmg4d8wijvxgXf5KDtosY91DJnmxFuS/j5EP4r42fARHMSrJmg0sn9nxLhz/AlVZ/y8cw0KGgIkCGU+IHkZ3VHR2sFmc2sFRjX2aN7Qju+i8PVjCfrl57+uiLypilfuABwl7lm/i22BXFIwzPcYHvnB5sAUti/lsyCvvs/KY3KXeejOiRrdT+VaWWnybMnO86vSBJ3PnC9085Y8KBoOj37ZGow+Vs0eFNkb3bZLsbdQH0t3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(41300700001)(82740400003)(316002)(40460700003)(966005)(5660300002)(26005)(36756003)(1076003)(8936002)(8676002)(83380400001)(82310400005)(426003)(47076005)(36860700001)(86362001)(81166007)(16526019)(2906002)(2616005)(186003)(336012)(356005)(40480700001)(110136005)(6666004)(478600001)(70586007)(70206006)(7696005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 18:40:23.6138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8f7b2d-1968-4cb1-e5a2-08db83077404
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4877
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

Fixes for 6.5.

The following changes since commit 6725f33228077902ddac2a05e0ab361dee36e4ba:

  Merge tag 'drm-misc-next-fixes-2023-07-06' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-07-07 11:05:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.5-2023-07-12

for you to fetch changes up to e701156ccc6c7a5f104a968dda74cd6434178712:

  drm/amd: Align SMU11 SMU_MSG_OverridePcieParameters implementation with SMU13 (2023-07-12 12:21:23 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.5-2023-07-12:

amdgpu:
- SMU i2c locking fix
- Fix a possible deadlock in process restoration for ROCm apps
- Disable PCIe lane/speed switching on Intel platforms (the platforms don't support it)

----------------------------------------------------------------
Evan Quan (1):
      drm/amd/pm: share the code around SMU13 pcie parameters update

Mario Limonciello (3):
      drm/amd/pm: conditionally disable pcie lane/speed switching for SMU13
      drm/amd: Move helper for dynamic speed switch check out of smu13
      drm/amd: Align SMU11 SMU_MSG_OverridePcieParameters implementation with SMU13

Yang Wang (1):
      drm/amd/pm: fix smu i2c data read risk

gaba (1):
      drm/amdgpu: avoid restore process run into dead loop.

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 19 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  4 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 91 +++++-----------------
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 48 ++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 35 +--------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 33 +-------
 12 files changed, 101 insertions(+), 141 deletions(-)
